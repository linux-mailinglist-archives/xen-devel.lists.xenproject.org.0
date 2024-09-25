Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2C98675D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 22:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804559.1215580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYCP-0003Vn-1Q; Wed, 25 Sep 2024 20:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804559.1215580; Wed, 25 Sep 2024 20:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYCO-0003T7-UT; Wed, 25 Sep 2024 20:01:20 +0000
Received: by outflank-mailman (input) for mailman id 804559;
 Wed, 25 Sep 2024 20:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqd3=QX=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stYCM-0003T1-PI
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 20:01:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebb02cfa-7b78-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 22:01:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A51385C5D40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 20:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F3FC4AF0B
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 20:01:13 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f761cfa5e6so2789891fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 13:01:13 -0700 (PDT)
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
X-Inumbo-ID: ebb02cfa-7b78-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727294473;
	bh=hhUZIlacRl/vnMEKcyfWg9tD49NT/MnhWz9itBFRH/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KTR+c/jJpox6lNTwZnur9ylGmJ8SNnMLBqE2bVDeKktdg6DiGi1EfTbK4p/QLfrsg
	 62cQ8Xp4g29Hc7A3FUqmxI+kwfZ2doQI9xGt7TSqSAX7TIfCIOG+mYse38LPl3BQWZ
	 l2iF8SThxm63ZjDF5HLI5C21pBaJ962vsnPsoOdMvYtcSZtRE66YpjivKriiies7Co
	 LaxrXpNgSSEEqxTDyY1RyJvKdmUcWWka/8YN0bSo2GO5HoqpEe+qDcQXm8LBLK0D94
	 8ydW6VYJrwsZMAlDTHl93avEh1VQTy7peDTyg6QRgD3UXHuTo3whNIgc1mG6jaSwpr
	 A7tc3n4LvYVlA==
X-Forwarded-Encrypted: i=1; AJvYcCXsB7gGqKCIGIrQeky/YfSmY0dlV43s6KmRCu91DOzQNDeMeEASLizHPrj4Arjd5ijbhDsHMVnKrgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk+c0InQeFfbNPSIa3LN1oVms0DzjZR+dtv/nuKbXZb4OL65BN
	sBZM07hFIEbCnHZO2x6gIBEhyMdiB5GZo+TyVi1FfB44RiRxlZvQpQXqx4jyiceRe1WZfVXK3xA
	fN442yT5vSiVZXmxsIos0cF/pKYg=
X-Google-Smtp-Source: AGHT+IEY1YYkhERqv1Guf/9KJxOHKzNT9jpbgg+x9EdmvWSPTNvmnHPEwdJSiqJFazSq6NN7k+EJ+tpT15NwNECytIk=
X-Received: by 2002:a2e:be24:0:b0:2f7:baac:fad7 with SMTP id
 38308e7fff4ca-2f91ca5b318mr26781181fa.39.1727294471846; Wed, 25 Sep 2024
 13:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-57-ardb+git@google.com> <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
 <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com> <CAFULd4bLuHQvHNaoLJ4DoEQQZZF0yz=uD27m49M+AbYnh=+NzQ@mail.gmail.com>
In-Reply-To: <CAFULd4bLuHQvHNaoLJ4DoEQQZZF0yz=uD27m49M+AbYnh=+NzQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Sep 2024 22:01:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFJHGuxvEgZik_YnrUjoQZCDFaMsTd6BZU=dFe1UcUUNQ@mail.gmail.com>
Message-ID: <CAMj1kXFJHGuxvEgZik_YnrUjoQZCDFaMsTd6BZU=dFe1UcUUNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Sept 2024 at 21:39, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> On Wed, Sep 25, 2024 at 9:14=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > On Wed, 25 Sept 2024 at 20:54, Uros Bizjak <ubizjak@gmail.com> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@goog=
le.com> wrote:
> > > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Build the kernel as a Position Independent Executable (PIE). This
> > > > results in more efficient relocation processing for the virtual
> > > > displacement of the kernel (for KASLR). More importantly, it instru=
cts
> > > > the linker to generate what is actually needed (a program that can =
be
> > > > moved around in memory before execution), which is better than havi=
ng to
> > > > rely on the linker to create a position dependent binary that happe=
ns to
> > > > tolerate being moved around after poking it in exactly the right ma=
nner.
> > > >
> > > > Note that this means that all codegen should be compatible with PIE=
,
> > > > including Rust objects, so this needs to switch to the small code m=
odel
> > > > with the PIE relocation model as well.
> > >
> > > I think that related to this work is the patch series [1] that
> > > introduces the changes necessary to build the kernel as Position
> > > Independent Executable (PIE) on x86_64 [1]. There are some more place=
s
> > > that need to be adapted for PIE. The patch series also introduces
> > > objtool functionality to add validation for x86 PIE.
> > >
> > > [1] "[PATCH RFC 00/43] x86/pie: Make kernel image's virtual address f=
lexible"
> > > https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antg=
roup.com/
> > >
> >
> > Hi Uros,
> >
> > I am aware of that discussion, as I took part in it as well.
> >
> > I don't think any of those changes are actually needed now - did you
> > notice anything in particular that is missing?
>
> Some time ago I went through the kernel sources and proposed several
> patches that changed all trivial occurrences of non-RIP addresses to
> RIP ones. The work was partially based on the mentioned patch series,
> and I remember, I left some of them out [e.g. 1], because they
> required a temporary variable.

I have a similar patch in my series, but the DEBUG_ENTRY code just uses

pushf 1f@GOTPCREL(%rip)

so no temporaries are needed.

> Also, there was discussion about ftrace
> [2], where no solution was found.
>

When linking with -z call-nop=3Dsuffix-nop, the __fentry__ call via the
GOT will be relaxed by the linker into a 5 byte call followed by a 1
byte NOP, so I don't think we need to do anything special here. It
might mean we currently lose -mnop-mcount until we find a solution for
that in the compiler. In case you remember, I contributed and you
merged a GCC patch that makes the __fentry__ emission logic honour
-fdirect-access-external-data which should help here. This landed in
GCC 14.

> Looking through your series, I didn't find some of the non-RIP -> RIP
> changes proposed by the original series (especially the ftrace part),
> and noticed that there is no objtool validator proposed to ensure that
> all generated code is indeed PIE compatible.
>

What would be the point of that? The linker will complain and throw an
error if the code cannot be converted into a PIE executable, so I
don't think we need objtool's help for that.

> Speaking of non-RIP -> RIP changes that require a temporary - would it
> be beneficial to make a macro that would use the RIP form only when
> #ifdef CONFIG_X86_PIE? That would avoid code size increase when PIE is
> not needed.
>

This series does not make the PIE support configurable. Do you think
the code size increase is a concern if all GOT based symbol references
are elided, e.g, via -fdirect-access-external-data?

