Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08B5FECD4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422772.669035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIRF-0006MG-Oi; Fri, 14 Oct 2022 11:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422772.669035; Fri, 14 Oct 2022 11:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIRF-0006K3-M4; Fri, 14 Oct 2022 11:01:13 +0000
Received: by outflank-mailman (input) for mailman id 422772;
 Fri, 14 Oct 2022 11:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux67=2P=citrix.com=prvs=2791c07bb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ojIRE-0006Jx-45
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:01:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817a7295-4baf-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 13:01:09 +0200 (CEST)
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
X-Inumbo-ID: 817a7295-4baf-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665745269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IGFSSV1d7Ae6FTnu5GW6JuROhwpvMg8zftHSuhF01vQ=;
  b=O13lJvuygk0au1gqK5apveOCOAaXssMiWiLogff+wO7HOZ0tVBNPu+Gu
   P4AM6K6UPeHr8uA03jXmuks/pmjP7Dnu1uMuT8sigMG3nMkjxOMJW8Aie
   uXnDiRNrMRtXDOme7gRjGRqPHcvJ5Zh0NVBI0oG6XxI72KXpGLPXlolKh
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83155405
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0A7vs604Ry8WL9h69vbD5dRxkn2cJEfYwER7XKvMYLTBsI5bpzUEm
 DccWGCEPfqMNjP2KYpzPIyw/UwFv5+HmIBrHABvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GpE5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUX2sR4H2htx
 cc4DzwTdyzfrMC/h5GCH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqOI4HXGZ0I9qqej
 ljI/GXdWxQfCIOC+2eM0y6uu8iTgTyuDer+E5Xnr6U30TV/3Fc7KBAQT0r9nvC/hWa3QdcZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTNPkrKLQFGtzZezoS2rBXQ+D2ZFRhZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pnzup5p0xWG2zaD+qXNEBz0ohaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZp3k/i+SY2+C62MBjarXnSWXFbdlByCmGbKhzy9+KTSuftX1
 WinnTaEUi9BVPUPIMueTOYBy747rh0DKZfobcmjlXyPiOPGDFbMEOdtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGNrdJLcA5SfSlnbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:jlJziaolOvUrly9uL0QVVKwaV5oteYIsimQD101hICG8cqSj+f
 xGuM5rsSMc7wxhP03I+OrwXZVoLkmwyXcY2+Us1PKZLW/bUQiTXeNfBOnZowEIcheWnoU26U
 4jSdkcNDSZNykCsS+Q2miF+rgbr+W6zA==
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="83155405"
Date: Fri, 14 Oct 2022 12:01:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [4.17 nice-to-have] Remaining Xen build output
Message-ID: <Y0lBbJB5XbfeusEA@perard.uk.xensource.com>
References: <c4b91289-82ea-dd97-a1f5-b168252eb826@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4b91289-82ea-dd97-a1f5-b168252eb826@citrix.com>

On Thu, Oct 13, 2022 at 02:58:18PM +0000, Andrew Cooper wrote:
> Hi,
> 
> Having got Kbuild almost integrated, there are a few artefacts remaining
> which it would be nice to address seeing as out-of-tree builds is a big

Those would be nice to address indeed, but can those wait for the next
release? Out-of-tree still works fine without fixing those. The down
size is some output that doesn't seems to belong, and those command
aren't actually check for changes in the command line.

> feature for 4.17.  Picking at parts of a build, we've got:
> 
>   CHK     include/headers++.chk
> /usr/bin/make -C include/xen/lib/x86 -f
> /builddir/build/BUILD/xen-4.17.0/xen/include/xen/lib/x86/Makefile all

I guess we could just hide this line with $(Q)

> /usr/bin/python /builddir/build/BUILD/xen-4.17.0/xen/../xen/tools/gen-cpuid.py -i /builddir/build/BUILD/xen-4.17.0/xen/../xen/include/public/arch-x86/cpufeatureset.h -o cpuid-autogen.h.new

> if ! cmp -s cpuid-autogen.h.new cpuid-autogen.h; then mv -f cpuid-autogen.h.new cpuid-autogen.h; else rm -f cpuid-autogen.h.new; fi

Those two cpuid related commands can't really use Kbuild infrastructure,
because the ./xen/include/xen/lib/x86/Makefile is also used by the
toolstack.

>   CPP     include/compat/physdev.i
>   CPP     arch/x86/asm-macros.i
>   CC      arch/x86/boot/cmdline.o
>   BINFILE common/config_data.S
> gzip -n -c .config >common/config.gz
>   CC      common/core_parking.o
>   UPD     arch/x86/include/asm/asm-macros.h
> gcc -MMD -MP -MF ./.asm-offsets.s.d -m64 -DBUILD_ID -fno-strict-aliasing
> -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement
> -Wno-unused-but-set-variable -Wno-unused-local-typedefs -O1
> -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror
> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
> ../include/xen/config.h -g -mindirect-branch=thunk-extern
> -mindirect-branch-register -fno-jump-tables -I./include
> -I./arch/x86/include -I../include -I../arch/x86/include
> -I../arch/x86/include/asm/mach-generic
> -I../arch/x86/include/asm/mach-default -DXEN_IMG_OFFSET=0x200000
> -msoft-float -fno-pie -fno-stack-protector -fno-exceptions
> -fno-asynchronous-unwind-tables -Wnested-externs -DHAVE_AS_VMX
> -DHAVE_AS_SSE4_2 -DHAVE_AS_EPT -DHAVE_AS_RDRAND -DHAVE_AS_FSGSBASE
> -DHAVE_AS_XSAVEOPT -DHAVE_AS_RDSEED -DHAVE_AS_CLAC_STAC -DHAVE_AS_CLWB
> -DHAVE_AS_QUOTED_SYM -DHAVE_AS_INVPCID -DHAVE_AS_MOVDIR -DHAVE_AS_ENQCMD
> -DHAVE_AS_NEGATIVE_TRUE -DHAVE_AS_NOPS_DIRECTIVE -mno-red-zone -fpic
> -mno-mmx -mno-sse -mskip-rax-setup -fcf-protection=none
> '-D__OBJECT_LABEL__=asm-offsets.s' -mpreferred-stack-boundary=3 -S -g0
> -o asm-offsets.s.new -MQ asm-offsets.s ../arch/x86/x86_64/asm-offsets.c
> if ! cmp -s asm-offsets.s.new asm-offsets.s; then mv -f
> asm-offsets.s.new asm-offsets.s; else rm -f asm-offsets.s.new; fi
>   CC      common/symbols-dummy.o
>   CC      lib/x86/cpuid.o
> ld -melf_i386  -N -T ../arch/x86/boot/build32.lds -o
> arch/x86/boot/cmdline.lnk arch/x86/boot/cmdline.o
> ld -melf_i386  -N -T ../arch/x86/boot/build32.lds -o
> arch/x86/boot/reloc.lnk arch/x86/boot/reloc.o
> objcopy -j .text -O binary arch/x86/boot/cmdline.lnk
> arch/x86/boot/cmdline.bin
> objcopy -j .text -O binary arch/x86/boot/reloc.lnk arch/x86/boot/reloc.bin
>   CC      arch/x86/boot/head.o
>   CC      drivers/acpi/tables/tbfadt.o
> rm arch/x86/boot/cmdline.lnk arch/x86/boot/reloc.lnk
>   CC      common/memory.o
>   LD      prelink.o
> ld    -melf_x86_64  -T arch/x86/xen.lds -N prelink.o --build-id=sha1 \
>     ./common/symbols-dummy.o -o ./.xen-syms.0
>   HOSTCC  arch/x86/boot/mkelf32
> nm -pa --format=sysv ./.xen-syms.0 \
>     | ./tools/symbols  --sysv --sort \
>     >./.xen-syms.0.S
> /usr/bin/make -f ../Rules.mk obj=. ./.xen-syms.0.o
>   CC      .xen-syms.0.o
> ld    -melf_x86_64  -T arch/x86/xen.lds -N prelink.o --build-id=sha1 \
>     ./.xen-syms.0.o -o ./.xen-syms.1
> nm -pa --format=sysv ./.xen-syms.1 \
>     | ./tools/symbols  --sysv --sort --warn-dup \
>     >./.xen-syms.1.S
> /usr/bin/make -f ../Rules.mk obj=. ./.xen-syms.1.o
>   CC      .xen-syms.1.o
> ld    -melf_x86_64  -T arch/x86/xen.lds -N prelink.o --build-id=sha1 \
>     --orphan-handling=warn ./.xen-syms.1.o -o xen-syms
> nm -pa --format=sysv ./xen-syms \
>     | ./tools/symbols --all-symbols --xensyms --sysv --sort \
>     >./xen-syms.map
> rm -f ./.xen-syms.[0-9]* ./..xen-syms.[0-9]*
> arch/x86/boot/mkelf32 --notes xen-syms ./.xen.elf32 0x200000 \
>                `nm xen-syms | sed -ne 's/^\([^ ]*\) .
> __2M_rwdata_end$/0x\1/p'`
> od -t x4 -N 8192 ./.xen.elf32  | grep 1badb002 > /dev/null || \
>     { echo "No Multiboot1 header found" >&2; false; }
> od -t x4 -N 32768 ./.xen.elf32 | grep e85250d6 > /dev/null || \
>     { echo "No Multiboot2 header found" >&2; false; }
> mv ./.xen.elf32 xen
> gzip -n -f -9 < xen > xen.gz.new
> { nm -n xen-syms | grep -v '\(compiled\)\|\(\.o$\)\|\( [aUw]
> \)\|\(\.\.ng$\)\|\(LASH[RL]DI\)'; \
> awk < arch/x86/include/asm/asm-offsets.h \
> '/^#define __ASM_OFFSETS_H__/ { next } ; /^#define / { printf "%016x -
> +%s\n", $3, $2 }'; } > System.map
> mv xen.gz.new xen.gz
> 
> 
> Presumably all of these examples want switching from their current
> ad-hoc logic to a cmd_* based version?  Are there some simple
> instructions for how to convert?

There is "Custom commands" in "./docs/misc/xen-makefiles/makefiles.rst".
But sometime one wants to use "filechk" instead, which is documented in
"./xen/scripts/Kbuild.include", not sure it applies here.
As for the last part of linking xen all together from prelink.o to xen,
Linux have a separate script for that and don't really use the Makefile,
so maybe it's something we could look into but Arm and x86 have
different way to build the binary which make writing a script annoying.

Cheers,

-- 
Anthony PERARD

