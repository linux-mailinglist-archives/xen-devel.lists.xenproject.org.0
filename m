Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68299A4AD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817064.1231167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFW2-0003g5-57; Fri, 11 Oct 2024 13:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817064.1231167; Fri, 11 Oct 2024 13:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFW2-0003dX-11; Fri, 11 Oct 2024 13:17:10 +0000
Received: by outflank-mailman (input) for mailman id 817064;
 Fri, 11 Oct 2024 13:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SPWD=RH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1szFVz-0003dR-W8
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:17:08 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c46617c-87d3-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 15:17:05 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a9952ea05c5so317028666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 06:17:05 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80c003esm211073566b.100.2024.10.11.06.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 06:17:04 -0700 (PDT)
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
X-Inumbo-ID: 1c46617c-87d3-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728652625; x=1729257425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0lJrh7aS83syXbKr+LOO4V7JvNGIedJ4lakYA5b0Wzo=;
        b=rOB2M2+icFrlTQ+DqWEIgGDv5rLCkkK+7OJRR6hvxjcSm3EBkFapixHPRzw/pxKUvf
         TpGGh7vq0vXnn6nzJbJiiFsAe/B/hxfYjZ8o11xnUmrxLaVxoPAvdQ478iuoGGWA7IYq
         73ba37RBRcrLq6KetTjEkLP8+L0fcVB8oPca8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652625; x=1729257425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lJrh7aS83syXbKr+LOO4V7JvNGIedJ4lakYA5b0Wzo=;
        b=Z7d4QuyoiKFXSCI4w1dN+VFKN5oW7hF9FfRJQqYZllSsPQpI+j6m5arpSQREw1e8Kk
         AHHsnxO2qaOJDPJBt/FsEAKF6HB1ABcHlMczvidL9nSl5fakjlz8VIiMYPFsobXRnkrN
         G9GiqwbdkPPP6UwZNghfka/oVXivw5Yn2i1uw5ovOx0b+BWhX+DYljKtfIKGK474sUvy
         Mf0RLqI9dbwREPRuShDNVBUa8d+fmgMPv0mITYq0gOx8Mtrjp2wskg6paxwOe/f69w3G
         tstxl0hQWX6ly6Ez+03Q0bSAhu/W4u8Td+1CYKWgLOVfwrTBpV2DcsLLveyi2nzC8zcI
         MQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JFfbodd/saetUzY4F+XPDSsBEO7Ctym2YDOWnTFu6d4ECsBleoQOCLgoIzkNlwGVIhrTnVWBb8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzkn2Dp1iFPgewlRMD2IHUE2mFCR0j1OcS9danF2aKjv2IvPD21
	EQ8Mv8/S6ybLIHxoCwhyYTGqh7yw1xD6Up5dy5ZYV7MkGfxoumtrbKLBUvHHiOk=
X-Google-Smtp-Source: AGHT+IHiIgzc1/UudwEnwN6AEy3+B4y2LyXe/PxX/xOK6Hrgg4RG7jV8NxKHbWK5Tx419EOLdgugQA==
X-Received: by 2002:a17:907:d59e:b0:a99:4987:8878 with SMTP id a640c23a62f3a-a99b9455488mr226453066b.15.1728652624779;
        Fri, 11 Oct 2024 06:17:04 -0700 (PDT)
Message-ID: <47b117b4-4bee-4289-9dbf-98c89d64e7f6@citrix.com>
Date: Fri, 11 Oct 2024 14:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [python] [PATCH v3 1/5] x86/boot: create a C bundle for 32 bit
 boot code and use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241011085244.432368-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2024 9:52 am, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index ff0f965876..4cf0d7e140 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> ...
> +$(obj)/built_in_32.o: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin
> +	$(PYTHON) $(srctree)/tools/combine_two_binaries \
> +		--script $(obj)/build32.final.lds \
> +		--bin1 $(obj)/built_in_32.other.bin --bin2 $(obj)/built_in_32.final.bin \
> +		--map $(obj)/built_in_32.final.map \
> +		--exports cmdline_parse_early,reloc \
> +		--section-header '.section .init.text, "ax", @progbits' \
> +		--output $(obj)/built_in_32.s

I can't see a case where we'd want this anywhere other than .init.text,
so I'd drop the --section-header and just write it out unconditionally. 
However, looking at the output:

xen$ head arch/x86/boot/built_in_32.S
    .section .init.text, "ax", @progbits
    .byte 137,194,128,56,0,116,6,64,128,56,0,117,250,41,208,195
    .byte 133,201,116,42,86,83,141,52,8,64,15,182,72,255,66,15
    .byte 182,90,255,56,217,117,15,132,201,116,25,57,198,117,234,184

This wants to start with a comment saying that it was automatically
generated by combine_two_binaries.

Next, we need some kind of symbol at the start.  Right now, the
disassembly reads:

    arch/x86/boot/built_in_32.o:     file format elf64-x86-64
    Disassembly of section .init.text:
    0000000000000000 <cmdline_parse_early-0x391>:
       0:   89 c2                   mov    %eax,%edx
       2:   80 38 00                cmpb   $0x0,(%eax)


because most metadata is lost by this transformation, and it doesn't
know that this is in fact strlen().  I'd suggest suggest obj32_start: or
equivalent.

> diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
> similarity index 63%
> rename from xen/arch/x86/boot/build32.lds
> rename to xen/arch/x86/boot/build32.lds.S
> index 56edaa727b..72a4c5c614 100644
> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -15,22 +15,52 @@
>   * with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -ENTRY(_start)
> +#ifdef FINAL
> +# define GAP 0
> +# define MULT 0
> +# define TEXT_START
> +#else
> +# define GAP 0x010200
> +# define MULT 1
> +# define TEXT_START 0x408020
> +#endif
> +# define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
> +
> +ENTRY(dummy_start)
>  
>  SECTIONS
>  {
> -  /* Merge code and data into one section. */
> -  .text : {
> +  /* Merge code and read-only data into one section. */
> +  .text TEXT_START : {
> +        /* Silence linker warning, we are not going to use it */
> +        dummy_start = .;
> +
> +        /* Declare below any symbol name needed.
> +         * Each symbol should be on its own line.
> +         * It looks like a tedious work but we make sure the things we use.
> +         * Potentially they should be all variables. */
> +        DECLARE_IMPORT(__base_relocs_start);
> +        DECLARE_IMPORT(__base_relocs_end);
> +        . = . + GAP;
>          *(.text)
>          *(.text.*)
> -        *(.data)
> -        *(.data.*)
>          *(.rodata)
>          *(.rodata.*)
> +  }
> +
> +  /* Writeable data sections. Check empty.
> +   * We collapse all into code section and we don't want it to be writeable. */
> +  .data : {
> +        *(.data)
> +        *(.data.*)
>          *(.bss)
>          *(.bss.*)
>    }
> -
> +  /DISCARD/ : {
> +       *(.comment)
> +       *(.comment.*)
> +       *(.note.*)
> +  }
>    /* Dynamic linkage sections.  Collected simply so we can check they're empty. */
>    .got : {
>          *(.got)
> @@ -64,3 +94,4 @@ ASSERT(SIZEOF(.igot.plt) == 0,    ".igot.plt non-empty")
>  ASSERT(SIZEOF(.iplt) == 0,        ".iplt non-empty")
>  ASSERT(SIZEOF(.plt) == 0,         ".plt non-empty")
>  ASSERT(SIZEOF(.rel) == 0,         "leftover relocations")
> +ASSERT(SIZEOF(.data) == 0,        "we don't want data")

3mdeb are getting around to rebasing/resubmitting the Trenchboot work
(Intel TXT and AMD SKINIT) backing QubeOS Anti-Evil-Maid.

While most of the cleanup is proving very helpful (i.e. reducing their
work), the lack of .data was seen as likely to be a blocker.  Thinking
about this more, I'm now fairly certain we do not need to exclude data.

This object executes during boot in 32bit flat unpaged mode (i.e. there
are no actual restrictions during execution), and because it's all
wrapped in .init.text, its "just code" to the outside world.  This means
it does not impact R^X that we're trying to arrange for the EFI section
headers.

Therefore the data arrangements should stay as they were before, and I
think the result will be fine.  We obviously don't want gratuitous use
of .data, but we don't need to prohibit it either.

I've got various other suggestions for improvements of the result, but
they can all be deferred until later.  This is complicated enough.

> diff --git a/xen/tools/combine_two_binaries b/xen/tools/combine_two_binaries
> new file mode 100755
> index 0000000000..ea2d6ddc4e
> --- /dev/null
> +++ b/xen/tools/combine_two_binaries
> @@ -0,0 +1,198 @@
> +#!/usr/bin/env python3
> +
> +from __future__ import print_function
> +import argparse
> +import re
> +import struct
> +import sys
> +
> +parser = argparse.ArgumentParser(description='Generate assembly file to merge into other code.')
> +parser.add_argument('--script', dest='script',
> +                    required=True,
> +                    help='Linker script for extracting symbols')
> +parser.add_argument('--bin1', dest='bin1',
> +                    required=True,
> +                    help='First binary')
> +parser.add_argument('--bin2', dest='bin2',
> +                    required=True,
> +                    help='Second binary')
> +parser.add_argument('--output', dest='output',
> +                    help='Output file')
> +parser.add_argument('--map', dest='mapfile',
> +                    help='Map file to read for symbols to export')
> +parser.add_argument('--exports', dest='exports',
> +                    help='Symbols to export')
> +parser.add_argument('--section-header', dest='section_header',
> +                    default='.text',
> +                    help='Section header declaration')
> +parser.add_argument('-v', '--verbose',
> +                    action='store_true')
> +args = parser.parse_args()
> +
> +gap = 0x010200
> +text_diff = 0x408020
> +
> +# Parse linker script for external symbols to use.
> +symbol_re = re.compile(r'\s+(\S+)\s*=\s*\.\s*\+\s*\((\d+)\s*\*\s*0\s*\)\s*;')

What is this looking for?  I'd expect the DECLARE_IMPORT() lines, but
this is as clear as regexes...

> +symbols = {}
> +lines = {}
> +for line in open(args.script):
> +    m = symbol_re.match(line)
> +    if not m:
> +        continue
> +    (name, line_num) = (m.group(1), int(m.group(2)))
> +    if line_num == 0:
> +        raise Exception("Invalid line number found:\n\t" + line)
> +    if line_num in symbols:
> +        raise Exception("Symbol with this line already present:\n\t" + line)
> +    if name in lines:
> +        raise Exception("Symbol with this name already present:\n\t" + name)
> +    symbols[line_num] = name
> +    lines[name] = line_num
> +
> +exports = []
> +if args.exports is not None:
> +    exports = dict([(name, None) for name in args.exports.split(',')])
> +
> +# Parse mapfile, look for ther symbols we want to export.
> +if args.mapfile is not None:
> +    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> +    for line in open(args.mapfile):
> +        m = symbol_re.match(line)
> +        if not m or m.group(2) not in exports:
> +            continue
> +        addr = int(m.group(1), 16)
> +        exports[m.group(2)] = addr
> +for (name, addr) in exports.items():
> +    if addr is None:
> +        raise Exception("Required export symbols %s not found" % name)
> +
> +file1 = open(args.bin1, 'rb')
> +file2 = open(args.bin2, 'rb')
> +file1.seek(0, 2)
> +size1 = file1.tell()
> +file2.seek(0, 2)
> +size2 = file2.tell()
> +if size1 > size2:
> +    file1, file2 = file2, file1
> +    size1, size2 = size2, size1
> +if size2 != size1 + gap:
> +    raise Exception('File sizes do not match')
> +
> +file1.seek(0, 0)
> +data1 = file1.read(size1)
> +file2.seek(gap, 0)
> +data2 = file2.read(size1)
> +
> +max_line = max(symbols.keys())
> +
> +def to_int32(n):
> +    '''Convert a number to signed 32 bit integer truncating if needed'''
> +    mask = (1 << 32) - 1
> +    h = 1 << 31
> +    return (n & mask) ^ h - h
> +
> +i = 0
> +references = {}
> +internals = 0
> +while i <= size1 - 4:
> +    n1 = struct.unpack('<I', data1[i:i+4])[0]
> +    n2 = struct.unpack('<I', data2[i:i+4])[0]
> +    i += 1
> +    # The two numbers are the same, no problems
> +    if n1 == n2:
> +        continue
> +    # Try to understand why they are different
> +    diff = to_int32(n1 - n2)
> +    if diff == -gap: # this is an internal relocation
> +        pos = i - 1
> +        print(("Internal relocation found at position %#x "
> +               "n1=%#x n2=%#x diff=%#x") % (pos, n1, n2, diff),

Here and elsewhere, you don't need brackets around around the string
itself.  Python strings are like C strings and will auto-concatenate.

> +              file=sys.stderr)
> +        i += 3
> +        internals += 1
> +        if internals >= 10:
> +            break
> +        continue
> +    # This is a relative relocation to a symbol, accepted, code/data is
> +    # relocatable.
> +    if diff < gap and diff >= gap - max_line:
> +        n = gap - diff
> +        symbol = symbols.get(n)
> +        # check we have a symbol
> +        if symbol is None:
> +            raise Exception("Cannot find symbol for line %d" % n)
> +        pos = i - 1
> +        if args.verbose:
> +            print('Position %#x %d %s' % (pos, n, symbol), file=sys.stderr)
> +        i += 3
> +        references[pos] = symbol
> +        continue
> +    # First byte is the same, move to next byte
> +    if diff & 0xff == 0 and i <= size1 - 4:
> +       continue
> +    # Probably a type of relocation we don't want or support
> +    pos = i - 1
> +    suggestion = ''
> +    symbol = symbols.get(-diff - text_diff)
> +    if symbol is not None:
> +        suggestion = " Maybe %s is not defined as hidden?" % symbol
> +    raise Exception(("Unexpected difference found at %#x "
> +                     "n1=%#x n2=%#x diff=%#x gap=%#x.%s") % \
> +                     (pos, n1, n2, diff, gap, suggestion))
> +if internals != 0:
> +    raise Exception("Previous relocations found")
> +
> +def line_bytes(buf, out):
> +    '''Output an assembly line with all bytes in "buf"'''
> +    if type(buf) == str:
> +        print("\t.byte " + ','.join([str(ord(c)) for c in buf]), file=out)
> +    else:
> +        print("\t.byte " + ','.join([str(n) for n in buf]), file=out)

I'm guessing this is Py2/3 compatibility?

> +
> +def part(start, end, out):
> +    '''Output bytes of "data" from "start" to "end"'''
> +    while start < end:
> +        e = min(start + 16, end)
> +        line_bytes(data1[start:e], out)
> +        start = e
> +
> +def reference(pos, out):
> +    name = references[pos]
> +    n = struct.unpack('<I', data1[pos:pos+4])[0]
> +    sign = '+'
> +    if n >= (1 << 31):
> +        n -= (1 << 32)
> +    n += pos
> +    if n < 0:
> +        n = -n
> +        sign = '-'
> +    print("\t.hidden %s\n\t.long %s %s %#x - ." % (name, name, sign, n),

Personally, I think this is easier to read as:

    print("\t.hidden %s\n"
          "\t.long %s %s %#x - ." % (name, name, sign, n),
          file=out)

so it visually matches the output too.  Same for .globl/hidden lower.

~Andrew

