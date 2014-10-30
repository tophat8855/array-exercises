require 'spec_helper'

describe "Tic Tac Toe, in arrays" do
  let(:___) { nil }

  let(:data) {
    [
      ['X', 'O', 'O'],
      ['X', 'X', 'O'],
      ['O', 'X', 'O']
    ]
  }

  def getPos data, char
    array = []
    data.each_with_index do |row, i|
      row.each_with_index do |place, j|
        if place == char
          array.push([i, j])
        end
      end
    end
    array
  end

  def winning? data, player
    posarray = getPos data, player
    counterx = [0,0,0]
    countery = [0,0,0]

    posarray.each do |pos|
      counterx[pos[0]] += 1 #checks for column wins
      countery[pos[1]] += 1 #checks for row wins
    end

    (counterx + countery).include?(3)

  end


  def win data
    if winning?(data, "O")
      "O"
    elsif winning?(data, "X")
      "X"
    end
  end


  describe "counting usage per row" do
    it "returns how many times X was played in each row" do
      xs_per_row = data.map.each{|row| row.count('X')}
      expect(xs_per_row).to be == [1, 2, 1]
    end

    it "returns how many times O was played in each row" do
      os_per_row = data.map.each{|row| row.count('O')}
      expect(os_per_row).to be == [2, 1, 2]
    end
  end

  describe "getting coordinates of usage" do
    it "returns an array of [row, column] array coordinates for each usage of X" do
      x_coordinates = getPos(data, 'X')
      expect(x_coordinates).to be == [[0, 0], [1, 0], [1, 1], [2, 1]]
    end

    it "returns an array of [row, column] array coordinates for each usage of O" do

      o_coordinates = getPos(data, 'O')
      expect(o_coordinates).to be == [[0, 1], [0, 2], [1, 2], [2, 0], [2, 2]]
    end
  end

  describe "testing who won" do
    it "determines whether X or O won" do
      winner = win(data)
      expect(winner).to be == 'O'
    end
  end
end
