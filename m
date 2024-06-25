Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F789916CC7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 17:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747908.1155435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7zQ-00084F-U3; Tue, 25 Jun 2024 15:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747908.1155435; Tue, 25 Jun 2024 15:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7zQ-00081l-Qi; Tue, 25 Jun 2024 15:21:48 +0000
Received: by outflank-mailman (input) for mailman id 747908;
 Tue, 25 Jun 2024 15:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM7zP-00080n-1D
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 15:21:47 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f910c34-3306-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 17:21:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 171932889757350.34669583752259;
 Tue, 25 Jun 2024 08:21:37 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e02c4983f3bso5730598276.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 08:21:37 -0700 (PDT)
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
X-Inumbo-ID: 9f910c34-3306-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1719328899; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E9ZznQtQ8sMvbPQ4mBsdkDcfQMRZURukXWvvYVxF6MZQSMajoDutjLKGXOfn1xTFiEMpem43S7+dlSzampvkyXMzoT7Qd8sR7nGdU0HrIhi/ZIZaJYiHvGe3L/V2xjgpDYQFJvkY94PMHAKzCu+c982GGnMjf+XHp72B029f9Yk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719328899; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rOO9Vy49/Zqy206+4uypFYbo55wn+kwzAS1UCif3ofs=; 
	b=VW2Jd1cQiojy5YttjIcS9JmJWAjSDKmFCY7z8kATEz11K6zFkzO+S5YAb1u8akZckCk3Sx770wq4OMJfZu1d5mjSBJUzrrXm7bpUVePMxmRvu06N7Rys0bZJcr6KWa9VJH13FpzQJYOtbpesO1z8SIXhjh1sInXHMMdmCKAKiSE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719328899;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rOO9Vy49/Zqy206+4uypFYbo55wn+kwzAS1UCif3ofs=;
	b=go7AXYsl2hX7dI6GvJ2MV8uY9WtQNkBf7NcO/rTow1vWP6qJ6aq4d41QnYBxnFbv
	mmWjJCMBvMmWVz4FxreIHX7GMSyvz4z7ZozbKB7GySPqpz3yIBxBUlvtH9m0DW0zvoY
	cCup6yIgZtedfTfHCSMB5fC9766dj/aoGdaTqG+k=
X-Forwarded-Encrypted: i=1; AJvYcCUSNkjst3m9jMKJZ0WkgkFpO5bJuJmfLSbOZfokeE1Bnl8kpfN0TNRs7+rYuyM6YsFXxxIOSAH4TCrlgnQbUQVGZIcgf3cYW4E+AuqpnO4=
X-Gm-Message-State: AOJu0YxeWXmLbxkrzx1wkquijRxW+9/cE0GFW5gjxFOCPeyY3coaxhsF
	SGZQUAFd66mwE/TzYwYi93sH7ki3KggTBMqiHkhU+WoRGRjyCxKxMH/q9EvA7NVMinDE9JduchP
	hL5cNwB9TGLqhbAAQ+HmMPHFfa5c=
X-Google-Smtp-Source: AGHT+IHICN/lhATWZQX6cvYnkdlCk8Q47Bocceax1daMX/RhFzZjHqonSrCkICfkWaNW6rkxbIA/MRNe7bg95zTjuvE=
X-Received: by 2002:a25:6b0d:0:b0:e02:662d:e04a with SMTP id
 3f1490d57ef6-e0304014665mr8322839276.45.1719328896541; Tue, 25 Jun 2024
 08:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
 <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
 <80d0578d-26c0-4650-9edf-6926c055d415@suse.com> <CABfawhk3RyR-ACq-mBk=F1-SCKJPiiS_yhU1=A_jR8Js3=fQyA@mail.gmail.com>
 <8d32db90-8bd0-4a8f-82d9-938e36d3f181@suse.com> <CABfawhnYFS97U1F4CuacbNWzLVoKXFxTSpG-Ddb-VL7di=7XDw@mail.gmail.com>
 <243e34fc-57a2-464c-8a11-2cfee7e9cda3@suse.com> <CABfawh=6d+F1tYLmfC-NyMn80NROFf_0HL-WkKzu-r5vjfScaw@mail.gmail.com>
 <4bab3cff-93c0-497c-b0ad-8d2df26124d2@suse.com>
In-Reply-To: <4bab3cff-93c0-497c-b0ad-8d2df26124d2@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 11:20:59 -0400
X-Gmail-Original-Message-ID: <CABfawhkHNb1X5tAET+yyZJsBE_jvHwn1afyGvBVXeQ_fw4vqgg@mail.gmail.com>
Message-ID: <CABfawhkHNb1X5tAET+yyZJsBE_jvHwn1afyGvBVXeQ_fw4vqgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:56=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 25.06.2024 15:40, Tamas K Lengyel wrote:
> > On Tue, Jun 25, 2024 at 9:15=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 25.06.2024 14:40, Tamas K Lengyel wrote:
> >>> On Tue, Jun 25, 2024 at 7:52=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>>
> >>>> On 25.06.2024 13:12, Tamas K Lengyel wrote:
> >>>>> On Tue, Jun 25, 2024 at 2:00=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> >>>>>>
> >>>>>> On 24.06.2024 23:23, Tamas K Lengyel wrote:
> >>>>>>> On Mon, Jun 24, 2024 at 11:55=E2=80=AFAM Jan Beulich <jbeulich@su=
se.com> wrote:
> >>>>>>>>
> >>>>>>>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> >>>>>>>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wr=
appers.o
> >>>>>>>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OB=
JS)) cpuid.o wrappers.o
> >>>>>>>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wr=
ap=3D,$(WRAPPED)) $^ -o $@
> >>>>>>>>>
> >>>>>>>>> +libfuzzer-harness: $(OBJS) cpuid.o
> >>>>>>>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer=
 $^ -o $@
> >>>>>>>>
> >>>>>>>> What is LIB_FUZZING_ENGINE? I don't think we have any use of tha=
t in the
> >>>>>>>> tree anywhere.
> >>>>>>>
> >>>>>>> It's used by oss-fuzz, otherwise it's not doing anything.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> I'm further surprised you get away here without wrappers.o.
> >>>>>>>
> >>>>>>> Wrappers.o was actually breaking the build for oss-fuzz at the li=
nking
> >>>>>>> stage. It works just fine without it.
> >>>>>>
> >>>>>> I'm worried here, to be honest. The wrappers serve a pretty import=
ant
> >>>>>> role, and I'm having a hard time seeing why they shouldn't be need=
ed
> >>>>>> here when they're needed both for the test and afl harnesses. Coul=
d
> >>>>>> you add some more detail on the build issues you encountered?
> >>>>>
> >>>>> With wrappers.o included doing the build in the oss-fuzz docker
> >>>>> (ubuntu 20.04 base) fails with:
> >>>>>
> >>>>> ...
> >>>>> clang -O1 -fno-omit-frame-pointer -gline-tables-only
> >>>>> -Wno-error=3Denum-constexpr-conversion
> >>>>> -Wno-error=3Dincompatible-function-pointer-types
> >>>>> -Wno-error=3Dint-conversion -Wno-error=3Ddeprecated-declarations
> >>>>> -Wno-error=3Dimplicit-function-declaration -Wno-error=3Dimplicit-in=
t
> >>>>> -DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION -fsanitize=3Daddress
> >>>>> -fsanitize-address-use-after-scope -fsanitize=3Dfuzzer-no-link -m64
> >>>>> -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototy=
pes
> >>>>> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -g3 -Werr=
or
> >>>>> -Og -fno-omit-frame-pointer
> >>>>> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD=
 -MP
> >>>>> -MF .libfuzzer-harness.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> >>>>> -I/src/xen/tools/fuzz/x86_instruction_emulator/../../../tools/inclu=
de
> >>>>> -D__XEN_TOOLS__ -iquote . -fsanitize=3Dfuzzer -fsanitize=3Dfuzzer
> >>>>> -Wl,--wrap=3Dfwrite -Wl,--wrap=3Dmemcmp -Wl,--wrap=3Dmemcpy
> >>>>> -Wl,--wrap=3Dmemset -Wl,--wrap=3Dprintf -Wl,--wrap=3Dputchar -Wl,--=
wrap=3Dputs
> >>>>> -Wl,--wrap=3Dsnprintf -Wl,--wrap=3Dstrstr -Wl,--wrap=3Dvprintf
> >>>>> -Wl,--wrap=3Dvsnprintf fuzz-emul.o x86-emulate.o x86_emulate/0f01.o
> >>>>> x86_emulate/0fae.o x86_emulate/0fc7.o x86_emulate/decode.o
> >>>>> x86_emulate/fpu.o cpuid.o wrappers.o -o libfuzzer-harness
> >>>>> /usr/bin/ld: /usr/bin/ld: DWARF error: invalid or unhandled FORM va=
lue: 0x25
> >>>>> /usr/local/lib/clang/18/lib/x86_64-unknown-linux-gnu/libclang_rt.fu=
zzer.a(fuzzer.o):
> >>>>> in function `std::__Fuzzer::__libcpp_snprintf_l(char*, unsigned lon=
g,
> >>>>> __locale_struct*, char const*, ...)':
> >>>>> cxa_noexception.cpp:(.text._ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP=
15__locale_structPKcz[_ZNSt8__Fuzzer19__libcpp_snprintf_lEPcmP15__locale_st=
ructPKcz]+0x9a):
> >>>>> undefined reference to `__wrap_vsnprintf'
> >>>>> clang: error: linker command failed with exit code 1 (use -v to see=
 invocation)
> >>>>> make: *** [Makefile:62: libfuzzer-harness] Error 1
> >>>>> rm x86-emulate.c wrappers.c cpuid.c
> >>>>> make: Leaving directory '/src/xen/tools/fuzz/x86_instruction_emulat=
or'
> >>>>> ERROR:__main__:Building fuzzers failed.
> >>>>
> >>>> Hmm, yes, means we'll need an actual vsnprintf() wrapper, not just a
> >>>> declaration thereof.
> >>>
> >>> I don't really get what this wrapper accomplishes
> >>
> >> They guard against clobbering of in-register state (SIMD registers in
> >> particular, but going forward maybe also eGRP-s as introduced by APX)
> >> by library functions called between emulation of individual insns (or,
> >> especially possible for fuzzing instrumented code, I think) even from
> >> in the middle of emulating an insn. (Something as simple as the
> >> compiler inserting a call to memcpy() or memset() somewhere in the
> >> translation of the emulator source code could also clobber state.)
> >>
> >>> and as I said, fuzzing works with oss-fuzz just fine without it.
> >>
> >> I'm inclined to take this as "it appears to work just fine". Fuzzed
> >> input register state may be lost by doing a library call somewhere,
> >> rendering the fuzzing results less useful. This would pretty
> >> certainly stop being tolerable the moment you compared results of
> >> native execution of a sequence of instructions with the emulated
> >> counterpart.
> >
> > Yea, that may be. Any suggested way to fix the linking issue though?
>
> As said before, we need to gain a real wrapper for vsnprintf(). Right
> now we only have a declaration thereof, for use by the wrapper for
> snprintf().

Where is this wrapper for snprintf? I can't find anything in
fuzz/x86_instruction_emulator. If I can see an example for one that's
implemented already I may be able to decipher what's needed here. At
the moment I don't really know what "a real wrapper" would look like.

Tamas

