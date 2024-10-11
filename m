Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D699A583
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817113.1231227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szG5t-0006Wc-2O; Fri, 11 Oct 2024 13:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817113.1231227; Fri, 11 Oct 2024 13:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szG5s-0006U8-VP; Fri, 11 Oct 2024 13:54:12 +0000
Received: by outflank-mailman (input) for mailman id 817113;
 Fri, 11 Oct 2024 13:54:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkux=RH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1szG5r-0006Ty-AN
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:54:11 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 498b4e0d-87d8-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 15:54:10 +0200 (CEST)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2877d7ae3e5so893255fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 06:54:09 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 498b4e0d-87d8-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728654848; x=1729259648; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LL82iFWCT1exrhi4Th/nMnYOuRqIUzzlFX0DgcZpNVg=;
        b=Yh9KOFKNWlElyvezi17JxvS7shP0Ep24gk7aSRciTvZrcZdTh2pI/0VLeMLEW2Up9G
         9gtHHvMAXnVUKNnZ9BcRh3N6tz19u4y+RoXKu9xa5Owy3FOZZIhGewhP9luGVxAmkm5r
         CEjkS2OtjGR9PYTGGLskNrTeAxOveN/bKXJaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728654848; x=1729259648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LL82iFWCT1exrhi4Th/nMnYOuRqIUzzlFX0DgcZpNVg=;
        b=E2iqZRqM1a3mK6OY3N1JUKvD/OIr7g8yF8WBEIIxaLe2wm0XE/f6hjfytiQNMlw7NZ
         avxYjGzgfpuq8STn0cLd3JKSxrqRDEmGsP1o733oJYWREOSbgybUdt953r06DAFuHQSS
         WsUA4LE3hXhe3hSlSc39DvKePK29LfKxaNaIol8026rghRI9FanlLE3avkdTqiFBqPPx
         E2KPNevUduJOwzJCHsi7B/SL6aGF32OB4owA/5h4OE0L8vjc3yypJl3qmWykhCs4fbB6
         qew+h7M57xc4u6yDcmFwweFJ0lDsuoRkmAkMXoM+gXgNSNha5bkwG4umBMRu25/f+j1u
         1KbA==
X-Gm-Message-State: AOJu0YwTW5DCgVWlJA2kOKUL9yofBBaPej4/ptM/Qr4gzibEldbeYFyj
	C3qpTlJYUEe/7GS+eWu3NSi7riu5RN5jIvEB8ZKJg8OFBrfO2Jw1Dh+o0JGOeQTJpqHg3Qazmmh
	Y0X5IjoJjUveyWBpwN2f41zhMsgCJqOEAbCNPXg==
X-Google-Smtp-Source: AGHT+IGl8FhcALIjQ57XQBYjAbvvf5ZzOiKmpeU5+hCYrxYLgz46C2bwIG024Vf0Xg/FG1bRepH8d7gIly09EMRP/Do=
X-Received: by 2002:a05:6870:7d1a:b0:288:62c8:fd4b with SMTP id
 586e51a60fabf-2886de24cd6mr1646571fac.28.1728654848120; Fri, 11 Oct 2024
 06:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-2-frediano.ziglio@cloud.com> <47b117b4-4bee-4289-9dbf-98c89d64e7f6@citrix.com>
In-Reply-To: <47b117b4-4bee-4289-9dbf-98c89d64e7f6@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 11 Oct 2024 14:53:57 +0100
Message-ID: <CACHz=Zgh-OmHF79rPez+usfszo=oW-P5kJzy-Q9GBDcM7gfHiA@mail.gmail.com>
Subject: Re: [python] [PATCH v3 1/5] x86/boot: create a C bundle for 32 bit
 boot code and use it
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:17=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 11/10/2024 9:52 am, Frediano Ziglio wrote:
> > diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> > index ff0f965876..4cf0d7e140 100644
> > --- a/xen/arch/x86/boot/Makefile
> > +++ b/xen/arch/x86/boot/Makefile
> > ...
> > +$(obj)/built_in_32.o: $(obj)/built_in_32.other.bin $(obj)/built_in_32.=
final.bin
> > +     $(PYTHON) $(srctree)/tools/combine_two_binaries \
> > +             --script $(obj)/build32.final.lds \
> > +             --bin1 $(obj)/built_in_32.other.bin --bin2 $(obj)/built_i=
n_32.final.bin \
> > +             --map $(obj)/built_in_32.final.map \
> > +             --exports cmdline_parse_early,reloc \
> > +             --section-header '.section .init.text, "ax", @progbits' \
> > +             --output $(obj)/built_in_32.s
>
> I can't see a case where we'd want this anywhere other than .init.text,
> so I'd drop the --section-header and just write it out unconditionally.

Could we just change the default in Python code and remove the option
calling the script?

> However, looking at the output:
>
> xen$ head arch/x86/boot/built_in_32.S
>     .section .init.text, "ax", @progbits
>     .byte 137,194,128,56,0,116,6,64,128,56,0,117,250,41,208,195
>     .byte 133,201,116,42,86,83,141,52,8,64,15,182,72,255,66,15
>     .byte 182,90,255,56,217,117,15,132,201,116,25,57,198,117,234,184
>
> This wants to start with a comment saying that it was automatically
> generated by combine_two_binaries.
>

Added a

print('''/*
 * File autogenerated by combine_two_binaries.py DO NOT EDIT
 */''', file=3Dout)

statement

And renamed the script file adding the ".py".

> Next, we need some kind of symbol at the start.  Right now, the
> disassembly reads:
>
>     arch/x86/boot/built_in_32.o:     file format elf64-x86-64
>     Disassembly of section .init.text:
>     0000000000000000 <cmdline_parse_early-0x391>:
>        0:   89 c2                   mov    %eax,%edx
>        2:   80 38 00                cmpb   $0x0,(%eax)
>
>
> because most metadata is lost by this transformation, and it doesn't
> know that this is in fact strlen().  I'd suggest suggest obj32_start: or
> equivalent.
>

Would "obj_start" fine too? Maybe in the future it could be used for
64 bit too (to avoid mistakes like the relocation of error strings we
had).

> > diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.=
lds.S
> > similarity index 63%
> > rename from xen/arch/x86/boot/build32.lds
> > rename to xen/arch/x86/boot/build32.lds.S
> > index 56edaa727b..72a4c5c614 100644
> > --- a/xen/arch/x86/boot/build32.lds
> > +++ b/xen/arch/x86/boot/build32.lds.S
> > @@ -15,22 +15,52 @@
> >   * with this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> >
> > -ENTRY(_start)
> > +#ifdef FINAL
> > +# define GAP 0
> > +# define MULT 0
> > +# define TEXT_START
> > +#else
> > +# define GAP 0x010200
> > +# define MULT 1
> > +# define TEXT_START 0x408020
> > +#endif
> > +# define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
> > +
> > +ENTRY(dummy_start)
> >
> >  SECTIONS
> >  {
> > -  /* Merge code and data into one section. */
> > -  .text : {
> > +  /* Merge code and read-only data into one section. */
> > +  .text TEXT_START : {
> > +        /* Silence linker warning, we are not going to use it */
> > +        dummy_start =3D .;
> > +
> > +        /* Declare below any symbol name needed.
> > +         * Each symbol should be on its own line.
> > +         * It looks like a tedious work but we make sure the things we=
 use.
> > +         * Potentially they should be all variables. */
> > +        DECLARE_IMPORT(__base_relocs_start);
> > +        DECLARE_IMPORT(__base_relocs_end);
> > +        . =3D . + GAP;
> >          *(.text)
> >          *(.text.*)
> > -        *(.data)
> > -        *(.data.*)
> >          *(.rodata)
> >          *(.rodata.*)
> > +  }
> > +
> > +  /* Writeable data sections. Check empty.
> > +   * We collapse all into code section and we don't want it to be writ=
eable. */
> > +  .data : {
> > +        *(.data)
> > +        *(.data.*)
> >          *(.bss)
> >          *(.bss.*)
> >    }
> > -
> > +  /DISCARD/ : {
> > +       *(.comment)
> > +       *(.comment.*)
> > +       *(.note.*)
> > +  }
> >    /* Dynamic linkage sections.  Collected simply so we can check they'=
re empty. */
> >    .got : {
> >          *(.got)
> > @@ -64,3 +94,4 @@ ASSERT(SIZEOF(.igot.plt) =3D=3D 0,    ".igot.plt non-=
empty")
> >  ASSERT(SIZEOF(.iplt) =3D=3D 0,        ".iplt non-empty")
> >  ASSERT(SIZEOF(.plt) =3D=3D 0,         ".plt non-empty")
> >  ASSERT(SIZEOF(.rel) =3D=3D 0,         "leftover relocations")
> > +ASSERT(SIZEOF(.data) =3D=3D 0,        "we don't want data")
>
> 3mdeb are getting around to rebasing/resubmitting the Trenchboot work
> (Intel TXT and AMD SKINIT) backing QubeOS Anti-Evil-Maid.
>
> While most of the cleanup is proving very helpful (i.e. reducing their
> work), the lack of .data was seen as likely to be a blocker.  Thinking
> about this more, I'm now fairly certain we do not need to exclude data.
>

We could change if needed in the future.
Can I order:
- .text
- .rodata
- .data
- .bss

instead of old

- .text
- .data
- .rodata
- .bss

So all readonly code/data are more close?

> This object executes during boot in 32bit flat unpaged mode (i.e. there
> are no actual restrictions during execution), and because it's all
> wrapped in .init.text, its "just code" to the outside world.  This means
> it does not impact R^X that we're trying to arrange for the EFI section
> headers.
>
> Therefore the data arrangements should stay as they were before, and I
> think the result will be fine.  We obviously don't want gratuitous use
> of .data, but we don't need to prohibit it either.
>
> I've got various other suggestions for improvements of the result, but
> they can all be deferred until later.  This is complicated enough.
>
> > diff --git a/xen/tools/combine_two_binaries b/xen/tools/combine_two_bin=
aries
> > new file mode 100755
> > index 0000000000..ea2d6ddc4e
> > --- /dev/null
> > +++ b/xen/tools/combine_two_binaries
> > @@ -0,0 +1,198 @@
> > +#!/usr/bin/env python3
> > +
> > +from __future__ import print_function
> > +import argparse
> > +import re
> > +import struct
> > +import sys
> > +
> > +parser =3D argparse.ArgumentParser(description=3D'Generate assembly fi=
le to merge into other code.')
> > +parser.add_argument('--script', dest=3D'script',
> > +                    required=3DTrue,
> > +                    help=3D'Linker script for extracting symbols')
> > +parser.add_argument('--bin1', dest=3D'bin1',
> > +                    required=3DTrue,
> > +                    help=3D'First binary')
> > +parser.add_argument('--bin2', dest=3D'bin2',
> > +                    required=3DTrue,
> > +                    help=3D'Second binary')
> > +parser.add_argument('--output', dest=3D'output',
> > +                    help=3D'Output file')
> > +parser.add_argument('--map', dest=3D'mapfile',
> > +                    help=3D'Map file to read for symbols to export')
> > +parser.add_argument('--exports', dest=3D'exports',
> > +                    help=3D'Symbols to export')
> > +parser.add_argument('--section-header', dest=3D'section_header',
> > +                    default=3D'.text',
> > +                    help=3D'Section header declaration')
> > +parser.add_argument('-v', '--verbose',
> > +                    action=3D'store_true')
> > +args =3D parser.parse_args()
> > +
> > +gap =3D 0x010200
> > +text_diff =3D 0x408020
> > +
> > +# Parse linker script for external symbols to use.
> > +symbol_re =3D re.compile(r'\s+(\S+)\s*=3D\s*\.\s*\+\s*\((\d+)\s*\*\s*0=
\s*\)\s*;')
>
> What is this looking for?  I'd expect the DECLARE_IMPORT() lines, but
> this is as clear as regexes...
>

Added a

# Next regex matches expanded DECLARE_IMPORT lines in linker script.

comment

> > +symbols =3D {}
> > +lines =3D {}
> > +for line in open(args.script):
> > +    m =3D symbol_re.match(line)
> > +    if not m:
> > +        continue
> > +    (name, line_num) =3D (m.group(1), int(m.group(2)))
> > +    if line_num =3D=3D 0:
> > +        raise Exception("Invalid line number found:\n\t" + line)
> > +    if line_num in symbols:
> > +        raise Exception("Symbol with this line already present:\n\t" +=
 line)
> > +    if name in lines:
> > +        raise Exception("Symbol with this name already present:\n\t" +=
 name)
> > +    symbols[line_num] =3D name
> > +    lines[name] =3D line_num
> > +
> > +exports =3D []
> > +if args.exports is not None:
> > +    exports =3D dict([(name, None) for name in args.exports.split(',')=
])
> > +
> > +# Parse mapfile, look for ther symbols we want to export.
> > +if args.mapfile is not None:
> > +    symbol_re =3D re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> > +    for line in open(args.mapfile):
> > +        m =3D symbol_re.match(line)
> > +        if not m or m.group(2) not in exports:
> > +            continue
> > +        addr =3D int(m.group(1), 16)
> > +        exports[m.group(2)] =3D addr
> > +for (name, addr) in exports.items():
> > +    if addr is None:
> > +        raise Exception("Required export symbols %s not found" % name)
> > +
> > +file1 =3D open(args.bin1, 'rb')
> > +file2 =3D open(args.bin2, 'rb')
> > +file1.seek(0, 2)
> > +size1 =3D file1.tell()
> > +file2.seek(0, 2)
> > +size2 =3D file2.tell()
> > +if size1 > size2:
> > +    file1, file2 =3D file2, file1
> > +    size1, size2 =3D size2, size1
> > +if size2 !=3D size1 + gap:
> > +    raise Exception('File sizes do not match')
> > +
> > +file1.seek(0, 0)
> > +data1 =3D file1.read(size1)
> > +file2.seek(gap, 0)
> > +data2 =3D file2.read(size1)
> > +
> > +max_line =3D max(symbols.keys())
> > +
> > +def to_int32(n):
> > +    '''Convert a number to signed 32 bit integer truncating if needed'=
''
> > +    mask =3D (1 << 32) - 1
> > +    h =3D 1 << 31
> > +    return (n & mask) ^ h - h
> > +
> > +i =3D 0
> > +references =3D {}
> > +internals =3D 0
> > +while i <=3D size1 - 4:
> > +    n1 =3D struct.unpack('<I', data1[i:i+4])[0]
> > +    n2 =3D struct.unpack('<I', data2[i:i+4])[0]
> > +    i +=3D 1
> > +    # The two numbers are the same, no problems
> > +    if n1 =3D=3D n2:
> > +        continue
> > +    # Try to understand why they are different
> > +    diff =3D to_int32(n1 - n2)
> > +    if diff =3D=3D -gap: # this is an internal relocation
> > +        pos =3D i - 1
> > +        print(("Internal relocation found at position %#x "
> > +               "n1=3D%#x n2=3D%#x diff=3D%#x") % (pos, n1, n2, diff),
>
> Here and elsewhere, you don't need brackets around around the string
> itself.  Python strings are like C strings and will auto-concatenate.
>

Done (also another similar occurency below).

> > +              file=3Dsys.stderr)
> > +        i +=3D 3
> > +        internals +=3D 1
> > +        if internals >=3D 10:
> > +            break
> > +        continue
> > +    # This is a relative relocation to a symbol, accepted, code/data i=
s
> > +    # relocatable.
> > +    if diff < gap and diff >=3D gap - max_line:
> > +        n =3D gap - diff
> > +        symbol =3D symbols.get(n)
> > +        # check we have a symbol
> > +        if symbol is None:
> > +            raise Exception("Cannot find symbol for line %d" % n)
> > +        pos =3D i - 1
> > +        if args.verbose:
> > +            print('Position %#x %d %s' % (pos, n, symbol), file=3Dsys.=
stderr)
> > +        i +=3D 3
> > +        references[pos] =3D symbol
> > +        continue
> > +    # First byte is the same, move to next byte
> > +    if diff & 0xff =3D=3D 0 and i <=3D size1 - 4:
> > +       continue
> > +    # Probably a type of relocation we don't want or support
> > +    pos =3D i - 1
> > +    suggestion =3D ''
> > +    symbol =3D symbols.get(-diff - text_diff)
> > +    if symbol is not None:
> > +        suggestion =3D " Maybe %s is not defined as hidden?" % symbol
> > +    raise Exception(("Unexpected difference found at %#x "
> > +                     "n1=3D%#x n2=3D%#x diff=3D%#x gap=3D%#x.%s") % \
> > +                     (pos, n1, n2, diff, gap, suggestion))

Here removed other parenthesis

> > +if internals !=3D 0:
> > +    raise Exception("Previous relocations found")
> > +
> > +def line_bytes(buf, out):
> > +    '''Output an assembly line with all bytes in "buf"'''
> > +    if type(buf) =3D=3D str:
> > +        print("\t.byte " + ','.join([str(ord(c)) for c in buf]), file=
=3Dout)
> > +    else:
> > +        print("\t.byte " + ','.join([str(n) for n in buf]), file=3Dout=
)
>
> I'm guessing this is Py2/3 compatibility?
>

Yes, as added

# Python 2 compatibility

will state

> > +
> > +def part(start, end, out):
> > +    '''Output bytes of "data" from "start" to "end"'''
> > +    while start < end:
> > +        e =3D min(start + 16, end)
> > +        line_bytes(data1[start:e], out)
> > +        start =3D e
> > +
> > +def reference(pos, out):
> > +    name =3D references[pos]
> > +    n =3D struct.unpack('<I', data1[pos:pos+4])[0]
> > +    sign =3D '+'
> > +    if n >=3D (1 << 31):
> > +        n -=3D (1 << 32)
> > +    n +=3D pos
> > +    if n < 0:
> > +        n =3D -n
> > +        sign =3D '-'
> > +    print("\t.hidden %s\n\t.long %s %s %#x - ." % (name, name, sign, n=
),
>
> Personally, I think this is easier to read as:
>
>     print("\t.hidden %s\n"
>           "\t.long %s %s %#x - ." % (name, name, sign, n),
>           file=3Dout)
>
> so it visually matches the output too.  Same for .globl/hidden lower.
>

Done

> ~Andrew

Frediano

