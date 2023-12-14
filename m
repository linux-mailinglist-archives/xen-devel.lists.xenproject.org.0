Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE58131C2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 14:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654580.1021634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDltu-0008Ua-52; Thu, 14 Dec 2023 13:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654580.1021634; Thu, 14 Dec 2023 13:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDltu-0008Rz-1L; Thu, 14 Dec 2023 13:37:18 +0000
Received: by outflank-mailman (input) for mailman id 654580;
 Thu, 14 Dec 2023 13:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDlts-0008Rn-DT
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 13:37:16 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e47cbda7-9a85-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 14:37:15 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336445a2749so849328f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 05:37:15 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 v16-20020adfa1d0000000b003362e9b75c3sm6688908wrv.88.2023.12.14.05.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 05:37:14 -0800 (PST)
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
X-Inumbo-ID: e47cbda7-9a85-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702561034; x=1703165834; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPZRLKtzmCkjomHNkLIabNem0o9UPKydqQh6vIquRcM=;
        b=ESmNA2q0xWPtan4+bEV6SoXNveCiLaI6eIEcZ2qqW5KCYnCwT6tKDH1USSTwA8bB9b
         zeG3/zk0PDVcIypcgEzTTcGzmDvGivxZJrQnrJzbyQ/JBKtH/1OjEztGig4YoXzVPRzo
         ndQjAgCt0pWF/7ZyTvl2GeYanutaalV2Olc0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561034; x=1703165834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPZRLKtzmCkjomHNkLIabNem0o9UPKydqQh6vIquRcM=;
        b=qqHMlLSscHq1Z+IL/cfjDNPqczhRECazTaHH83OeRm+LvasjDuIrmE0pRUZbezY5c5
         3A2+wBbA+/zfrT+8g1+1ymI7T1s27e7XH6m76/cnjOHci2h6cQCvbjYLtmkLS6L1ukJt
         biADb0GalYBgPvBmmfh7cE7KoIBPVptPBDqqthOFys1r7zR5Ihb6KESw7NZlC2Z6X06C
         WGAr9a1nrWylIIiak97VyrgFFYMLOoojb2/EgNv02x2Y5GhoSIQQYsj7HyAZUX2hoZeO
         yYl+q4XCdbPqn6XObJKJXZJum+vbxg67nvj78AXoprtVBcTbh9PAPLJeeRcCJMH0gzL0
         TN8w==
X-Gm-Message-State: AOJu0Yxj+YxflxZhC0o8F+a0WhV+NfIqMXkwIT+bb2SKyh9IXLjeYuuq
	NVjnQW7J1LjruI4lumKhWu1Ejg==
X-Google-Smtp-Source: AGHT+IFi2tSesHRWb0MLrzkRu9zmC3x5MBu/poA5aGvzbRdbLslgPgqPRuWFPmwhANzqDGHlUSUCIw==
X-Received: by 2002:adf:cf0e:0:b0:336:445a:ec51 with SMTP id o14-20020adfcf0e000000b00336445aec51mr703630wrj.143.1702561034560;
        Thu, 14 Dec 2023 05:37:14 -0800 (PST)
Date: Thu, 14 Dec 2023 14:37:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Message-ID: <ZXsFCSd1xpngciP3@macbook>
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-2-roger.pau@citrix.com>
 <4f6c3481-a44c-4176-a414-b32639556bb0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4f6c3481-a44c-4176-a414-b32639556bb0@suse.com>

On Thu, Dec 14, 2023 at 12:18:13PM +0100, Jan Beulich wrote:
> On 14.12.2023 11:17, Roger Pau Monne wrote:
> > The minimal function size requirements for livepatch are either 5 bytes=
 (for
> > jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  E=
nsure
> > that distance between functions entry points is always at least of the =
minimal
> > required size for livepatch instruction replacement to be successful.
> >=20
> > Add an additional align directive to the linker script, in order to ens=
ure that
> > the next section placed after the .text.* (per-function sections) is al=
so
> > aligned to the required boundary, so that the distance of the last func=
tion
> > entry point with the next symbol is also of minimal size.
> >=20
> > Note that it's possible for the compiler to end up using a higher funct=
ion
> > alignment regardless of the passed value, so this change just make sure=
 that
> > the minimum required for livepatch to work is present.
>=20
> That's a possibility which we don't need to be concerned about. Yet isn't=
 it
> also possible that we override a larger, deemed better (e.g. performance-=
wise)
> value?

I'm kind of confused, the compiler will always choose the higher
alignment.  For example non-debug builds on my box end up with
function sections aligned to 16 instead of the 8 passed in the
-falign-functions=3D parameter:

$ clang -MMD -MP -MF arch/x86/.traps.o.d -m64 -DBUILD_ID -fno-strict-aliasi=
ng -std=3Dgnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno=
-unused-local-typedefs   -Werror=3Dunknown-warning-option -O2 -fomit-frame-=
pointer -falign-functions=3D8 -nostdinc -fno-builtin -fno-common -Werror -W=
redundant-decls -Wwrite-strings -Wno-pointer-arith -Wdeclaration-after-stat=
ement -Wvla -pipe -D__XEN__ -include ./include/xen/config.h -ffunction-sect=
ions -fdata-sections -mretpoline-external-thunk  -I./include -I./arch/x86/i=
nclude -I./arch/x86/include/generated -I./arch/x86/include/asm/mach-generic=
 -I./arch/x86/include/asm/mach-default -DXEN_IMG_OFFSET=3D0x200000 -msoft-f=
loat -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind=
-tables -Wnested-externs -DHAVE_AS_VMX -DHAVE_AS_SSE4_2 -DHAVE_AS_EPT -DHAV=
E_AS_RDRAND -DHAVE_AS_FSGSBASE -DHAVE_AS_XSAVEOPT -DHAVE_AS_RDSEED -DHAVE_A=
S_CLAC_STAC -DHAVE_AS_CLWB -DHAVE_AS_QUOTED_SYM -DHAVE_AS_INVPCID -DHAVE_AS=
_MOVDIR -DHAVE_AS_ENQCMD -mno-red-zone -fpic -mno-mmx -mno-sse -mskip-rax-s=
etup -fcf-protection=3Dnone -Wa,-I./include -Wa,-I./include '-D__OBJECT_LAB=
EL__=3Darch/x86/traps.o'   -DXEN_BUILD_EFI -DBUILD_ID_EFI -c arch/x86/traps=
=2Ec -o arch/x86/.traps.o.tmp -MQ arch/x86/traps.o

$ readelf -WS xen/arch/x86/traps.o

There are 107 section headers, starting at offset 0xe2e0:

Section Headers:
  [Nr] Name              Type            Addr             Off    Size   ES =
Flg Lk Inf Al
  [ 0]                   NULL            0000000000000000 000000 000000 00 =
     0   0  0
  [ 1] .text             PROGBITS        0000000000000000 000040 000000 00 =
 AX  0   0  4
  [ 2] .text.show_code   PROGBITS        0000000000000000 000040 000287 00 =
 AX  0   0 16
  [ 3] .rela.text.show_code RELA            0000000000000000 008520 000450 =
18   I 104   2  8
  [ 4] .altinstructions  PROGBITS        0000000000000000 0002c7 00024c 00 =
  A  0   0  1
  [ 5] .rela.altinstructions RELA            0000000000000000 008970 0007e0=
 18   I 104   4  8
  [ 6] .discard          PROGBITS        0000000000000000 000513 000054 00 =
  A  0   0  1
  [ 7] .altinstr_replacement PROGBITS        0000000000000000 000567 000018=
 00  AX  0   0  1
  [ 8] .ex_table         PROGBITS        0000000000000000 000580 000028 00 =
  A  0   0  4
  [ 9] .rela.ex_table    RELA            0000000000000000 009150 0000f0 18 =
  I 104   8  8
  [10] .text.get_stack_trace_bottom PROGBITS        0000000000000000 0005b0=
 000046 00  AX  0   0 16
  [11] .text.get_stack_dump_bottom PROGBITS        0000000000000000 000600 =
00003d 00  AX  0   0 16
  [12] .text.show_stack_overflow PROGBITS        0000000000000000 000640 00=
0158 00  AX  0   0 16
[...]

> I'm somewhat concerned of that case. IOW is -falign-functions=3D really
> the right option to use here? (There may not be one which we would actual=
ly
> prefer to use.) Specifically -falign-functions (without a value, i.e. usi=
ng a
> machine dependent default) is implied by -O2 and -O3, as per 13.2 gcc doc.

Right, and that still works fine AFAICT, see how in the example above
functions ended up aligned to 16 even when -falign-functions=3D8 was
provided on the command line.

> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -37,6 +37,24 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
> >  config CC_SPLIT_SECTIONS
> >  	bool
> > =20
> > +# Set function alignment.
> > +#
> > +# Allow setting on a boolean basis, and then convert such selection to=
 an
> > +# integer for the build system and code to consume more easily.
> > +config CC_HAS_FUNCTION_ALIGNMENT
> > +	def_bool $(cc-option,-falign-functions=3D8)
>=20
> How does this check make sure 4- or 16-byte alignment are also accepted as
> valid? (Requesting 8-byte alignment would be at least bogus on e.g. IA-64=
=2E)

I was confused and expected the compiler to round up to the next
supported value by the arch, but that doesn't seem to be written down
in the GCC manual at least.

One option would be to simply test for -falign-functions with no
specific alignment, and leave Kconfig code to set a suitable value on
a per-arch basis.

> > +config FUNCTION_ALIGNMENT_4B
> > +	bool
> > +config FUNCTION_ALIGNMENT_8B
> > +	bool
> > +config FUNCTION_ALIGNMENT_16B
> > +	bool
> > +config FUNCTION_ALIGNMENT
> > +	int
> > +	default 16 if FUNCTION_ALIGNMENT_16B
> > +	default  8 if  FUNCTION_ALIGNMENT_8B
> > +	default  4 if  FUNCTION_ALIGNMENT_4B
>=20
> While for the immediate purpose here no "depends on CC_HAS_FUNCTION_ALIGN=
MENT"
> is okay, I still wonder if it wouldn't better be added in case further
> "select"s appear.

Will adjust in next version.

> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -390,6 +390,9 @@ CFLAGS +=3D -fomit-frame-pointer
> >  endif
> > =20
> >  CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) +=3D -ffunction-sections -fdata-sec=
tions
> > +ifdef CONFIG_FUNCTION_ALIGNMENT
>=20
> ... e.g. this meaningless? Or is the lack of a default value leading to
> the option remaining undefined (rather than assigning some "default"
> default, e.g. 0)?

If no default value the option remain undefined, and -falign-functions
is not passed on the compiler command line.  This is required in case
the compiler doesn't support -falign-functions.

> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -44,6 +44,10 @@ SECTIONS
> >  #ifdef CONFIG_CC_SPLIT_SECTIONS
> >         *(.text.*)
> >  #endif
> > +#ifdef CONFIG_FUNCTION_ALIGNMENT
> > +       /* Ensure enough distance with the next placed section. */
> > +       . =3D ALIGN(CONFIG_FUNCTION_ALIGNMENT);
> > +#endif
> > =20
> >         *(.fixup)
>=20
> Seeing .fixup nicely in context - can't that (and other specialized
> sections containing code) also be patched?

The current livepatch-build-tools logic doesn't seem to detect changes
to .fixup, so I've added this to my list of stuff to fix for
livepatch.  I do see the livepatch code in the hypervisor has support
for loading extra .ex_table sections, so I assume at some point it was
considered to add support for .fixup.  My current thinking is that
=2Efixup itself won't be changed, and that instead a new .fixup will be
loaded, and the newly loaded .ex_table will reference such section.

Thanks, Roger.

