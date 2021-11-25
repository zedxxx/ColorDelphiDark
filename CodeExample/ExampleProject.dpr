program ExampleProject;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TExampleCalss = class
  private
    Caption: string;
  public
    procedure Test(Sender: TObject);
  end;

{ TExampleCalss }

{$R-}
procedure TExampleCalss.Test(Sender: TObject);
var // Delphi comment
  Number, I, X: Integer;
begin
  Number := 123 + $FF + Trunc(12.3); // << Matching Brackets ;
  Caption := 'The naumber is: ' + IntToStr(Number);
  X := 10;
  {Search Match, Text Block}
  Inc(X); {$R+}

  { Invalid breakpoint }

  for I := 0 to Number do {$R-} { execution point }
  begin
    Inc(X, 2); { Enabled breakpoint }
    Dec(X, 2); { Disabled breakpoint }
    X := X + 1.0; { Error line }
  end;

  asm
    MOV EAX, 1234h
    MOV Number, EAX
  end;

  {$WARNINGS OFF} { Compiler Directive }

  {$REGION 'Region Test'}
  // region
  {$ENDREGION}

  {$IFDEF DEBUG}
  X := X + 42;
  {$ELSE}
  X := X + 24;
  {$ENDIF}
end;

var
  VClass: TExampleCalss;
begin
  VClass := TExampleCalss.Create;
  try
    VClass.Test(nil);
  finally
    VClass.Free;
  end;
end.
