Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2D813486
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654626.1021764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnVY-0003Ih-HX; Thu, 14 Dec 2023 15:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654626.1021764; Thu, 14 Dec 2023 15:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnVY-0003FQ-E2; Thu, 14 Dec 2023 15:20:16 +0000
Received: by outflank-mailman (input) for mailman id 654626;
 Thu, 14 Dec 2023 15:20:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDnVX-0003FK-89
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:20:15 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ab7fbb-9a94-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 16:20:12 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3333131e08dso8661991f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:20:12 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 m1-20020adfa3c1000000b003364ad1c20esm1177910wrb.0.2023.12.14.07.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 07:20:11 -0800 (PST)
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
X-Inumbo-ID: 46ab7fbb-9a94-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702567212; x=1703172012; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=roCafFA+jPed1pvjVzQKTqhbqlSXUdcTavu4yEdr3J4=;
        b=pWvmXfIY4Lf+zrSIfnQNiS8PlejH7WuRa5s8jI8KbBe86joIajWjpfeNChEnwwg4C4
         yx8SKs4ZG0h+o5FUdQqiHxLLURfo86rb0rUKFoZtPlLsT3JHeyM9AOEE4Bh/CGc5JtVQ
         wZUhUhCXIgotoQ/peht7v7P55ScxqUPAqEr9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567212; x=1703172012;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roCafFA+jPed1pvjVzQKTqhbqlSXUdcTavu4yEdr3J4=;
        b=XWK5W7AQsqsh5+/P41eytVkrMAwRiQPGqZwE/XZmiBVXnJZoI/5wldmNNmgHmRHsjo
         DWvVgkWv1QMuAQsePMQCxmjLcFf9j/2k4vBG7jDs5AuqBnpKBHB/V5GgKmEs4SXWCWNc
         tmBlxsoMdQllKNNZ54qeFSn/h+Dy/dV8W7qoq/M/brvm3YthnnYwKOd/K0zywkQgkC0C
         0kIMi1T6jq8vyRVP6TWsxgTUfZm9J4HLXJFWIgjHDbyDWuJqpygUITCqXkiOqPBAKX5L
         /keeWKMi3xU7ofay0kug444gFaRayVCQwMK1QLurqI8IAayyzlf8XidL8poMRE77KpdN
         ZyGg==
X-Gm-Message-State: AOJu0YxobNj+FuPYje7KYDyfCXqGagdcm04L5PeSQ2jRRBGqbAhohR3r
	xxz0fJzuZekaELHqOli8EDJ2ig==
X-Google-Smtp-Source: AGHT+IFMxqvHbCt9784IWB82gtUSgAfDtmiB88AeLt4ji3pQOXTwUGbpOuaJILJcUS6CLjV7y1iITQ==
X-Received: by 2002:a05:600c:1503:b0:409:79cb:1df6 with SMTP id b3-20020a05600c150300b0040979cb1df6mr5095755wmg.14.1702567212152;
        Thu, 14 Dec 2023 07:20:12 -0800 (PST)
Date: Thu, 14 Dec 2023 16:20:10 +0100
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
Message-ID: <ZXsdKsQS20IAyAny@macbook>
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-2-roger.pau@citrix.com>
 <4f6c3481-a44c-4176-a414-b32639556bb0@suse.com>
 <ZXsFCSd1xpngciP3@macbook>
 <89c741b3-9388-412e-87bf-4253e28c7808@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <89c741b3-9388-412e-87bf-4253e28c7808@suse.com>

On Thu, Dec 14, 2023 at 02:53:13PM +0100, Jan Beulich wrote:
> On 14.12.2023 14:37, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Dec 14, 2023 at 12:18:13PM +0100, Jan Beulich wrote:
> >> On 14.12.2023 11:17, Roger Pau Monne wrote:
> >>> The minimal function size requirements for livepatch are either 5 byt=
es (for
> >>> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm. =
 Ensure
> >>> that distance between functions entry points is always at least of th=
e minimal
> >>> required size for livepatch instruction replacement to be successful.
> >>>
> >>> Add an additional align directive to the linker script, in order to e=
nsure that
> >>> the next section placed after the .text.* (per-function sections) is =
also
> >>> aligned to the required boundary, so that the distance of the last fu=
nction
> >>> entry point with the next symbol is also of minimal size.
> >>>
> >>> Note that it's possible for the compiler to end up using a higher fun=
ction
> >>> alignment regardless of the passed value, so this change just make su=
re that
> >>> the minimum required for livepatch to work is present.
> >>
> >> That's a possibility which we don't need to be concerned about. Yet is=
n't it
> >> also possible that we override a larger, deemed better (e.g. performan=
ce-wise)
> >> value?
> >=20
> > I'm kind of confused, the compiler will always choose the higher
> > alignment.
>=20
> Will it? Before writing the reply I went through gcc's respective doc
> section, without finding such a guarantee.

Hm, yes, checked with godbolt now and GCC behaves the opposite of
clang, and will always attempt to honor the alignment passed in
falign-functions.

Maybe for release builds we should select a 16b alignment on x86?

Arm seems to use 4 byte alignment by default when using -O2.

> >  For example non-debug builds on my box end up with
> > function sections aligned to 16 instead of the 8 passed in the
> > -falign-functions=3D parameter:
> >=20
> > $ clang -MMD -MP -MF arch/x86/.traps.o.d -m64 -DBUILD_ID -fno-strict-al=
iasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable =
-Wno-unused-local-typedefs   -Werror=3Dunknown-warning-option -O2 -fomit-fr=
ame-pointer -falign-functions=3D8 -nostdinc -fno-builtin -fno-common -Werro=
r -Wredundant-decls -Wwrite-strings -Wno-pointer-arith -Wdeclaration-after-=
statement -Wvla -pipe -D__XEN__ -include ./include/xen/config.h -ffunction-=
sections -fdata-sections -mretpoline-external-thunk  -I./include -I./arch/x=
86/include -I./arch/x86/include/generated -I./arch/x86/include/asm/mach-gen=
eric -I./arch/x86/include/asm/mach-default -DXEN_IMG_OFFSET=3D0x200000 -mso=
ft-float -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-un=
wind-tables -Wnested-externs -DHAVE_AS_VMX -DHAVE_AS_SSE4_2 -DHAVE_AS_EPT -=
DHAVE_AS_RDRAND -DHAVE_AS_FSGSBASE -DHAVE_AS_XSAVEOPT -DHAVE_AS_RDSEED -DHA=
VE_AS_CLAC_STAC -DHAVE_AS_CLWB -DHAVE_AS_QUOTED_SYM -DHAVE_AS_INVPCID -DHAV=
E_AS_MOVDIR -DHAVE_AS_ENQCMD -mno-red-zone -fpic -mno-mmx -mno-sse -mskip-r=
ax-setup -fcf-protection=3Dnone -Wa,-I./include -Wa,-I./include '-D__OBJECT=
_LABEL__=3Darch/x86/traps.o'   -DXEN_BUILD_EFI -DBUILD_ID_EFI -c arch/x86/t=
raps.c -o arch/x86/.traps.o.tmp -MQ arch/x86/traps.o
> >=20
> > $ readelf -WS xen/arch/x86/traps.o
> >=20
> > There are 107 section headers, starting at offset 0xe2e0:
> >=20
> > Section Headers:
> >   [Nr] Name              Type            Addr             Off    Size  =
 ES Flg Lk Inf Al
> >   [ 0]                   NULL            0000000000000000 000000 000000=
 00      0   0  0
> >   [ 1] .text             PROGBITS        0000000000000000 000040 000000=
 00  AX  0   0  4
> >   [ 2] .text.show_code   PROGBITS        0000000000000000 000040 000287=
 00  AX  0   0 16
> >   [ 3] .rela.text.show_code RELA            0000000000000000 008520 000=
450 18   I 104   2  8
> >   [ 4] .altinstructions  PROGBITS        0000000000000000 0002c7 00024c=
 00   A  0   0  1
> >   [ 5] .rela.altinstructions RELA            0000000000000000 008970 00=
07e0 18   I 104   4  8
> >   [ 6] .discard          PROGBITS        0000000000000000 000513 000054=
 00   A  0   0  1
> >   [ 7] .altinstr_replacement PROGBITS        0000000000000000 000567 00=
0018 00  AX  0   0  1
> >   [ 8] .ex_table         PROGBITS        0000000000000000 000580 000028=
 00   A  0   0  4
> >   [ 9] .rela.ex_table    RELA            0000000000000000 009150 0000f0=
 18   I 104   8  8
> >   [10] .text.get_stack_trace_bottom PROGBITS        0000000000000000 00=
05b0 000046 00  AX  0   0 16
> >   [11] .text.get_stack_dump_bottom PROGBITS        0000000000000000 000=
600 00003d 00  AX  0   0 16
> >   [12] .text.show_stack_overflow PROGBITS        0000000000000000 00064=
0 000158 00  AX  0   0 16
> > [...]
> >=20
> >> I'm somewhat concerned of that case. IOW is -falign-functions=3D really
> >> the right option to use here? (There may not be one which we would act=
ually
> >> prefer to use.) Specifically -falign-functions (without a value, i.e. =
using a
> >> machine dependent default) is implied by -O2 and -O3, as per 13.2 gcc =
doc.
> >=20
> > Right, and that still works fine AFAICT, see how in the example above
> > functions ended up aligned to 16 even when -falign-functions=3D8 was
> > provided on the command line.
> >=20
> >>> --- a/xen/Kconfig
> >>> +++ b/xen/Kconfig
> >>> @@ -37,6 +37,24 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
> >>>  config CC_SPLIT_SECTIONS
> >>>  	bool
> >>> =20
> >>> +# Set function alignment.
> >>> +#
> >>> +# Allow setting on a boolean basis, and then convert such selection =
to an
> >>> +# integer for the build system and code to consume more easily.
> >>> +config CC_HAS_FUNCTION_ALIGNMENT
> >>> +	def_bool $(cc-option,-falign-functions=3D8)
> >>
> >> How does this check make sure 4- or 16-byte alignment are also accepte=
d as
> >> valid? (Requesting 8-byte alignment would be at least bogus on e.g. IA=
-64.)
> >=20
> > I was confused and expected the compiler to round up to the next
> > supported value by the arch, but that doesn't seem to be written down
> > in the GCC manual at least.
> >=20
> > One option would be to simply test for -falign-functions with no
> > specific alignment, and leave Kconfig code to set a suitable value on
> > a per-arch basis.
>=20
> Perhaps; this ...
>=20
> >>> +config FUNCTION_ALIGNMENT_4B
> >>> +	bool
> >>> +config FUNCTION_ALIGNMENT_8B
> >>> +	bool
> >>> +config FUNCTION_ALIGNMENT_16B
> >>> +	bool
> >>> +config FUNCTION_ALIGNMENT
> >>> +	int
> >>> +	default 16 if FUNCTION_ALIGNMENT_16B
> >>> +	default  8 if  FUNCTION_ALIGNMENT_8B
> >>> +	default  4 if  FUNCTION_ALIGNMENT_4B
>=20
> ... makes sure the highest alignment ever selected from anywhere will be
> used (should an arch need to select any of these).

That's the intention, that the highest selected FUNCTION_ALIGNMENT_X
ends up defining the value of FUNCTION_ALIGNMENT.

> >>> --- a/xen/arch/arm/xen.lds.S
> >>> +++ b/xen/arch/arm/xen.lds.S
> >>> @@ -44,6 +44,10 @@ SECTIONS
> >>>  #ifdef CONFIG_CC_SPLIT_SECTIONS
> >>>         *(.text.*)
> >>>  #endif
> >>> +#ifdef CONFIG_FUNCTION_ALIGNMENT
> >>> +       /* Ensure enough distance with the next placed section. */
> >>> +       . =3D ALIGN(CONFIG_FUNCTION_ALIGNMENT);
> >>> +#endif
> >>> =20
> >>>         *(.fixup)
> >>
> >> Seeing .fixup nicely in context - can't that (and other specialized
> >> sections containing code) also be patched?
> >=20
> > The current livepatch-build-tools logic doesn't seem to detect changes
> > to .fixup, so I've added this to my list of stuff to fix for
> > livepatch.  I do see the livepatch code in the hypervisor has support
> > for loading extra .ex_table sections, so I assume at some point it was
> > considered to add support for .fixup.  My current thinking is that
> > .fixup itself won't be changed, and that instead a new .fixup will be
> > loaded, and the newly loaded .ex_table will reference such section.
>=20
> Hmm, yes, that's a fair explanation for .fixup not needing special
> handling. Yet then I would still be worried of other snippets, e.g.
> stuff ending up in e.g. .text.cold or .text.unlikely. Would they all
> also be dealt with in similar ways?

Yes, livepatch-build-tools requires functions to be in separate
sections in order to be able to patch them.  Contents of .text.cold or
=2Etext.unlikely won't be detected by the patch generation scripts as
far as I'm aware (like it doesn't detect changes to .fixup currently).

There might be ways to create patches for those manually by building a
custom livepatch payload, but in that case the function size is left
to the user to calculate.

Thanks, Roger.

