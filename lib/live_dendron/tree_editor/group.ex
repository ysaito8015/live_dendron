defmodule LiveDendron.TreeEditor.Group do
  alias LiveDendron.Tree
  alias LiveDendron.TreeEditor

  defstruct name: "", subgroups: [], members: [], expanded: false, changeset: nil, uuid: nil

  def equip(%Tree.Group{} = group) do
    %__MODULE__{
      name: group.name,
      subgroups: Enum.map(group.subgroups, fn g -> equip(g) end),
      members: Enum.map(group.members, fn m -> TreeEditor.Member.equip(m) end),
      uuid: Ecto.UUID.generate()
    }
  end

  def unequip(%__MODULE__{} = group) do
    %Tree.Group{
      name: group.name,
      subgroups: Enum.map(group.subgroups, fn g -> unequip(g) end),
      members: Enum.map(group.members, fn m -> TreeEditor.Member.unequip(m) end)
    }
  end
end
