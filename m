Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985ED9165ED
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 13:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747611.1155059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM46g-0001hy-5i; Tue, 25 Jun 2024 11:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747611.1155059; Tue, 25 Jun 2024 11:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM46g-0001fl-0k; Tue, 25 Jun 2024 11:13:02 +0000
Received: by outflank-mailman (input) for mailman id 747611;
 Tue, 25 Jun 2024 11:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM46d-0001fW-Rx
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 11:12:59 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df686d0a-32e3-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 13:12:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719313972306788.7746408859621;
 Tue, 25 Jun 2024 04:12:52 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dfdb6122992so4838978276.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 04:12:52 -0700 (PDT)
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
X-Inumbo-ID: df686d0a-32e3-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1719313974; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hjiGu60/HIbx+SfyZ71bLyRpJwHVZwN5D9vxRDbf7AYcOdSqXd0uwKsGTgcw8ytkE3cATPNzjIZrCInhBaHsmTGAHGaR7hz9wpSLgHAFlc1syog+J9HOW8R13xq1MbBS86hjWgWBdT/sQKod1OlEhcVkNXaahDT5x9SCnUQ4Kos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719313974; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NuuKHvEK9cAFBd4G7+gVCQRO4FneDp+4BrLv0+8nQNw=; 
	b=eG8jL6CBmzI7x5/qTgvr+vWkwJRJe4TS0MsvBqf6sJr4nOoPUS4pO7kaoZvd8JjnX9tXv/Si9WP/r7LKzbrR3+8+xkbb1Ny6sVxoGy9ypwE3uu4Nofd1KoVI8UU7kpnpYf2+XEiYU8bhc+MiHcW/kWhXPhu32z4A3g6hUCzgxa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719313974;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NuuKHvEK9cAFBd4G7+gVCQRO4FneDp+4BrLv0+8nQNw=;
	b=N+XvH+pV5m78pJKTYsgtfz2DSLbcbKrEe5GPOWPM9eQCVGjdQBFRR/Hluuh3ssM4
	+SmpaFBJt48iZdnh6+rpcV+R+tB3foRiARk/GCQAXPI/D6EgXHyZPLfq+CCwdG3PXi5
	yXt8BnLfsVox2DhgVr0Aow8o9V0uKtxdXs3JqzRY=
X-Forwarded-Encrypted: i=1; AJvYcCUaBr36KTKDBgWDbkxK538SltZkDMd8eGsGMVL+qe/1NOJog2nU7flyJgpSnNvdFFtyPmpMIkVOvun7di+coKrmE4uzWajuUXo6Q/oKWx0=
X-Gm-Message-State: AOJu0YxR2PopMtPU5TDEgna9UPGWBTzxfIhCbNzOSDGYTmAGMsnR2Oni
	xwrU5Y1RohMXvpTR2YHA9U3p6MvlY5/N8QjwAlv/ywdHm7E+5KctrnnbBPKb/Nu8yD8w4+6lQtZ
	02sF5RnSb8r9J5ZCXntqYx/m579Y=
X-Google-Smtp-Source: AGHT+IEXfwEFzFYYVcCWdrsau4jbEVqc65Z0/2G8SpDqGaIvZcN3msA+wJTEqf24MDOHUC7k5ZIJY58hHQrifVFLWVM=
X-Received: by 2002:a05:6902:243:b0:de4:828:b73c with SMTP id
 3f1490d57ef6-e03010eea58mr6704346276.54.1719313971445; Tue, 25 Jun 2024
 04:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
 <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com> <80d0578d-26c0-4650-9edf-6926c055d415@suse.com>
In-Reply-To: <80d0578d-26c0-4650-9edf-6926c055d415@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 07:12:15 -0400
X-Gmail-Original-Message-ID: <CABfawhk3RyR-ACq-mBk=F1-SCKJPiiS_yhU1=A_jR8Js3=fQyA@mail.gmail.com>
Message-ID: <CABfawhk3RyR-ACq-mBk=F1-SCKJPiiS_yhU1=A_jR8Js3=fQyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 2:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.06.2024 23:23, Tamas K Lengyel wrote:
> > On Mon, Jun 24, 2024 at 11:55=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>
> >> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> >>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers=
.o
> >>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) c=
puid.o wrappers.o
> >>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=3D,=
$(WRAPPED)) $^ -o $@
> >>>
> >>> +libfuzzer-harness: $(OBJS) cpuid.o
> >>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer $^ -o=
 $@
> >>
> >> What is LIB_FUZZING_ENGINE? I don't think we have any use of that in t=
he
> >> tree anywhere.
> >
> > It's used by oss-fuzz, otherwise it's not doing anything.
> >
> >>
> >> I'm further surprised you get away here without wrappers.o.
> >
> > Wrappers.o was actually breaking the build for oss-fuzz at the linking
> > stage. It works just fine without it.
>
> I'm worried here, to be honest. The wrappers serve a pretty important
> role, and I'm having a hard time seeing why they shouldn't be needed
> here when they're needed both for the test and afl harnesses. Could
> you add some more detail on the build issues you encountered?

With wrappers.o included doing the build in the oss-fuzz docker
(ubuntu 20.04 base) fails with:

...
clang -O1 -fno-omit-frame-pointer -gline-tables-only
-Wno-error=3Denum-constexpr-conversion
-Wno-error=3Dincompatible-function-pointer-types
-Wno-error=3Dint-conversion -Wno-error=3Ddeprecated-declarations
-Wno-error=3Dimplicit-function-declaration -Wno-error=3Dimplicit-int
-DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION -fsanitize=3Daddress
-fsanitize-address-use-after-scope -fsanitize=3Dfuzzer-no-link -m64
-DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Werror
-Og -fno-omit-frame-pointer
-D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP
-MF .libfuzzer-harness.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-I/src/xen/tools/fuzz/x86_instruction_emulator/../../../tools/include
-D__XEN_TOOLS__ -iquote . -fsanitize=3Dfuzzer -fsanitize=3Dfuzzer
-Wl,--wrap=3Dfwrite -Wl,--wrap=3Dmemcmp -Wl,--wrap=3Dmemcpy
-Wl,--wrap=3Dmemset -Wl,--wrap=3Dprintf -Wl,--wrap=3Dputchar -Wl,--wrap=3Dp=
uts
-Wl,--wrap=3Dsnprintf -Wl,--wrap=3Dstrstr -Wl,--wrap=3Dvprintf
-Wl,--wrap=3Dvsnprintf fuzz-emul.o x86-emulate.o x86_emulate/0f01.o
x86_emulate/0fae.o x86_emulate/0fc7.o x86_emulate/decode.o
x86_emulate/fpu.o cpuid.o wrappers.o -o libfuzzer-harness
/usr/bin/ld: /usr/bin/ld: DWARF error: invalid or unhandled FORM value: 0x2=
5
/usr/local/lib/clang/18/lib/x86_64-unknown-linux-gnu/libclang_rt.fuzzer.a(f=
uzzer.o):
in function `std::__Fuzzer::__libcpp_snprintf_l(char*, unsigned long,
__locale_struct*, char const*, ...)':
cxa_noexception.cpp:(.text._ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__loca=
le_structPKcz[_ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__locale_structPKcz=
]+0x9a):
undefined reference to `__wrap_vsnprintf'
clang: error: linker command failed with exit code 1 (use -v to see invocat=
ion)
make: *** [Makefile:62: libfuzzer-harness] Error 1
rm x86-emulate.c wrappers.c cpuid.c
make: Leaving directory '/src/xen/tools/fuzz/x86_instruction_emulator'
ERROR:__main__:Building fuzzers failed.

