Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9F916832
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 14:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747669.1155133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM5Ty-0000op-KF; Tue, 25 Jun 2024 12:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747669.1155133; Tue, 25 Jun 2024 12:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM5Ty-0000lv-Gw; Tue, 25 Jun 2024 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 747669;
 Tue, 25 Jun 2024 12:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM5Tx-0000lm-Hr
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 12:41:09 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3069942e-32f0-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 14:41:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719319263050855.3783825064857;
 Tue, 25 Jun 2024 05:41:03 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dff02b8a956so4864598276.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 05:41:02 -0700 (PDT)
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
X-Inumbo-ID: 3069942e-32f0-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719319264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X30u7fWEcZ59H6yjcE8ITmoKpSAc1tM5xPvJkWjxdTRkWQlnlvuZZecHNoLuX0Jq6Usu0zwkPED7qj82SbqR8azU4OHyJWgRsUArZiBsRpODZlkrT9LsnQvS7bcWh1+9jcvKk6A1l7SZYkNBEVUTn7hVtifRKl2IQg5QxYjC9EM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719319264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MREDzWph2h7r+wcFTkEyKLvCgSc2jrZ7cPUdF19aduU=; 
	b=eeJTpRvfe+MwsvqozTHW+309mqM3qAc1M2fg7mIq+1YZ36Ow5qnloYYp1pYOrJI8sTb/TwGJm5RyVWkoFFy1m/YlXhQpCxV7JR/Ir9M04hY+F4E7QCqaEsAeBKtwK3hmxYboANb1viNC2+EAL9xn+9no5i+tPAMIf5ohiGlTvww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719319264;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MREDzWph2h7r+wcFTkEyKLvCgSc2jrZ7cPUdF19aduU=;
	b=VwixQ1UgA3E5l3NeBfSjBEhvVF/vTSPlAxUGcfN63ur1GdtZPAQ5oSkxFfALmi6B
	h9gDnOcZVrc420ubZWBGoJEROe+eQrjXt5PPNFEteNGUrMljq/fzyZyzEQZR9k8A4XO
	Eo9H4fhD+e679sYyCeP9vbKw3U153siSvIxtCK/Q=
X-Forwarded-Encrypted: i=1; AJvYcCUynJMdd5DFP7upbUvMFu+SxcGQX5+5PyjTzvrovfwg0CXKEn8vfFVebTNzGhlb0ErCCKDHHzWquuuISeZ6S0QsSqN7LPJGiAfY046bS6c=
X-Gm-Message-State: AOJu0YzZauRKq4tncwVDz8g5VJ67MYzVRvMEY8ojeNFnsCgkNP57lSdc
	F0/hTdyrIslRfevza77Pzf7S6ffAbVNNRXb2+3+O6VpVO6a/WgltLp6OQmiIhffXYuxQtuabnQU
	Mkk7pu1S1fShsc6vBCOWx/f+T+Qs=
X-Google-Smtp-Source: AGHT+IGRgUPPyoKO61IxV3jQKp52JU57x63HtnQLTcLxBLLg61JmN6ewphFjsQcPDo+/03FL0bdWW6doIuVjt3rsE1Y=
X-Received: by 2002:a25:86c8:0:b0:e02:e518:c05a with SMTP id
 3f1490d57ef6-e0300f98461mr6993208276.35.1719319262161; Tue, 25 Jun 2024
 05:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
 <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
 <80d0578d-26c0-4650-9edf-6926c055d415@suse.com> <CABfawhk3RyR-ACq-mBk=F1-SCKJPiiS_yhU1=A_jR8Js3=fQyA@mail.gmail.com>
 <8d32db90-8bd0-4a8f-82d9-938e36d3f181@suse.com>
In-Reply-To: <8d32db90-8bd0-4a8f-82d9-938e36d3f181@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 08:40:25 -0400
X-Gmail-Original-Message-ID: <CABfawhnYFS97U1F4CuacbNWzLVoKXFxTSpG-Ddb-VL7di=7XDw@mail.gmail.com>
Message-ID: <CABfawhnYFS97U1F4CuacbNWzLVoKXFxTSpG-Ddb-VL7di=7XDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 7:52=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.06.2024 13:12, Tamas K Lengyel wrote:
> > On Tue, Jun 25, 2024 at 2:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 24.06.2024 23:23, Tamas K Lengyel wrote:
> >>> On Mon, Jun 24, 2024 at 11:55=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>
> >>>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> >>>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappe=
rs.o
> >>>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS))=
 cpuid.o wrappers.o
> >>>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=
=3D,$(WRAPPED)) $^ -o $@
> >>>>>
> >>>>> +libfuzzer-harness: $(OBJS) cpuid.o
> >>>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer $^ =
-o $@
> >>>>
> >>>> What is LIB_FUZZING_ENGINE? I don't think we have any use of that in=
 the
> >>>> tree anywhere.
> >>>
> >>> It's used by oss-fuzz, otherwise it's not doing anything.
> >>>
> >>>>
> >>>> I'm further surprised you get away here without wrappers.o.
> >>>
> >>> Wrappers.o was actually breaking the build for oss-fuzz at the linkin=
g
> >>> stage. It works just fine without it.
> >>
> >> I'm worried here, to be honest. The wrappers serve a pretty important
> >> role, and I'm having a hard time seeing why they shouldn't be needed
> >> here when they're needed both for the test and afl harnesses. Could
> >> you add some more detail on the build issues you encountered?
> >
> > With wrappers.o included doing the build in the oss-fuzz docker
> > (ubuntu 20.04 base) fails with:
> >
> > ...
> > clang -O1 -fno-omit-frame-pointer -gline-tables-only
> > -Wno-error=3Denum-constexpr-conversion
> > -Wno-error=3Dincompatible-function-pointer-types
> > -Wno-error=3Dint-conversion -Wno-error=3Ddeprecated-declarations
> > -Wno-error=3Dimplicit-function-declaration -Wno-error=3Dimplicit-int
> > -DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION -fsanitize=3Daddress
> > -fsanitize-address-use-after-scope -fsanitize=3Dfuzzer-no-link -m64
> > -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes
> > -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Werror
> > -Og -fno-omit-frame-pointer
> > -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP
> > -MF .libfuzzer-harness.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -I/src/xen/tools/fuzz/x86_instruction_emulator/../../../tools/include
> > -D__XEN_TOOLS__ -iquote . -fsanitize=3Dfuzzer -fsanitize=3Dfuzzer
> > -Wl,--wrap=3Dfwrite -Wl,--wrap=3Dmemcmp -Wl,--wrap=3Dmemcpy
> > -Wl,--wrap=3Dmemset -Wl,--wrap=3Dprintf -Wl,--wrap=3Dputchar -Wl,--wrap=
=3Dputs
> > -Wl,--wrap=3Dsnprintf -Wl,--wrap=3Dstrstr -Wl,--wrap=3Dvprintf
> > -Wl,--wrap=3Dvsnprintf fuzz-emul.o x86-emulate.o x86_emulate/0f01.o
> > x86_emulate/0fae.o x86_emulate/0fc7.o x86_emulate/decode.o
> > x86_emulate/fpu.o cpuid.o wrappers.o -o libfuzzer-harness
> > /usr/bin/ld: /usr/bin/ld: DWARF error: invalid or unhandled FORM value:=
 0x25
> > /usr/local/lib/clang/18/lib/x86_64-unknown-linux-gnu/libclang_rt.fuzzer=
.a(fuzzer.o):
> > in function `std::__Fuzzer::__libcpp_snprintf_l(char*, unsigned long,
> > __locale_struct*, char const*, ...)':
> > cxa_noexception.cpp:(.text._ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__=
locale_structPKcz[_ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__locale_struct=
PKcz]+0x9a):
> > undefined reference to `__wrap_vsnprintf'
> > clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
> > make: *** [Makefile:62: libfuzzer-harness] Error 1
> > rm x86-emulate.c wrappers.c cpuid.c
> > make: Leaving directory '/src/xen/tools/fuzz/x86_instruction_emulator'
> > ERROR:__main__:Building fuzzers failed.
>
> Hmm, yes, means we'll need an actual vsnprintf() wrapper, not just a
> declaration thereof.

I don't really get what this wrapper accomplishes and as I said,
fuzzing works with oss-fuzz just fine without it.

Tamas

