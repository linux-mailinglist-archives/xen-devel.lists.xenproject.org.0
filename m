Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95924986799
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 22:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804578.1215610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYWy-0002sf-4S; Wed, 25 Sep 2024 20:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804578.1215610; Wed, 25 Sep 2024 20:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYWx-0002qY-W4; Wed, 25 Sep 2024 20:22:35 +0000
Received: by outflank-mailman (input) for mailman id 804578;
 Wed, 25 Sep 2024 20:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m3xb=QX=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1stYWw-0002qQ-Gw
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 20:22:34 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4e82fb6-7b7b-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 22:22:32 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f75428b9f8so3128161fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 13:22:32 -0700 (PDT)
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
X-Inumbo-ID: e4e82fb6-7b7b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727295752; x=1727900552; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIIgXkMaMQVypTqr3Dlc/4cjp96pZ1OIgVbT5mp5nAM=;
        b=M0xyflY0sM/aix+SWz9068n9AMu+qadvk1Wnavi3DE9t0NZXAHhyAwqxQBQjOiDIhd
         uy92Ylh9XwVWMen/OLI1yt/VcOMgLrFA9G/oJM0+5X9CEZ/dLKV5mHJZLIbZADb8EdSo
         JJ20J0yFpssCZil6zWE0MLU1HNt5JTVGd/+NndzsR1TDBoFt0nFHgxjU6eAVwuKhr6jd
         2BGtzw7FlTFajmf9vASdWc/A1D6oMqggniCXqBwmVAFBb0C23HloAkQ466jJTmebNsdD
         +j3lsDoWpIGXJKDH4+goQcTOTbO0c8r58xydlUHbUqqlra034f2rU8eAFKGvricCXmwA
         BupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727295752; x=1727900552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIIgXkMaMQVypTqr3Dlc/4cjp96pZ1OIgVbT5mp5nAM=;
        b=fSZBByWw+47EoDM6LX0vo/DyVaofrdiZjy3OlaNzbQ3+CIcb1UloD0B/0H+sjl25oc
         AZVHwXoIkhlDvqXcdWh6qk7cIokKX9cs/2BEOpvenE90RGmHIlXHhSBv1WIzepx62QOC
         J+3Ozdn/x5EthucPeJsmpb9QTKEHE8wx2D4FQz0yn7JH4+epVfJaf+eunIyxiJvXdn23
         m2bwtFQ3tRzhuN0pnjBKzzq9P5HK4a0Y9yg3rfW77Sn9KSy255dG4UuntzKA9utl9a3J
         V7GflN5PKRbU0rHZQXOBDuJySBcfN3wtXM2NqyCp654jxd51Y7p0CFvTVkG8shvrqBa3
         tkyg==
X-Forwarded-Encrypted: i=1; AJvYcCX0SfeDw6kOSynGIWzVCJX6M8ies7gRk4wiJ5EA6YV9rm/4qvEszwWmaGnXu6MB4FSs8Xj3DOxfIGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEWqJs5nreFFqGNT0gbciiGUkG17HcoaHHZlNHcj/ypOt8xIhy
	SmV9h67Rkup1KBwUOPhsA2efBKDK6Sfs8pfaHol+CoaofHyujwOnf48Rzg7EK/nNbBnSY0JPapK
	/+RmMkObXZPQmb8jZoJarQoj4ZQ8=
X-Google-Smtp-Source: AGHT+IFvfamGkkaVTjihL57HO7Ma4jzbZpdj4uNVGUYPPPoT8ZkXDScK2UWxGNJ3KCLrPCqwFqRqAGWpvpi86QGVs6w=
X-Received: by 2002:a2e:be1c:0:b0:2f7:562d:cb5b with SMTP id
 38308e7fff4ca-2f915fc0ad0mr39215031fa.7.1727295751491; Wed, 25 Sep 2024
 13:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-57-ardb+git@google.com> <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
 <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
 <CAFULd4bLuHQvHNaoLJ4DoEQQZZF0yz=uD27m49M+AbYnh=+NzQ@mail.gmail.com> <CAMj1kXFJHGuxvEgZik_YnrUjoQZCDFaMsTd6BZU=dFe1UcUUNQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFJHGuxvEgZik_YnrUjoQZCDFaMsTd6BZU=dFe1UcUUNQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 25 Sep 2024 22:22:19 +0200
Message-ID: <CAFULd4a3RFZVRs12iX7+K=i1Xj0rZAyD6djrmUpmAuU4VULCrg@mail.gmail.com>
Subject: Re: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
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

On Wed, Sep 25, 2024 at 10:01=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Wed, 25 Sept 2024 at 21:39, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 9:14=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > > On Wed, 25 Sept 2024 at 20:54, Uros Bizjak <ubizjak@gmail.com> wrote:
> > > >
> > > > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@go=
ogle.com> wrote:
> > > > >
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > Build the kernel as a Position Independent Executable (PIE). This
> > > > > results in more efficient relocation processing for the virtual
> > > > > displacement of the kernel (for KASLR). More importantly, it inst=
ructs
> > > > > the linker to generate what is actually needed (a program that ca=
n be
> > > > > moved around in memory before execution), which is better than ha=
ving to
> > > > > rely on the linker to create a position dependent binary that hap=
pens to
> > > > > tolerate being moved around after poking it in exactly the right =
manner.
> > > > >
> > > > > Note that this means that all codegen should be compatible with P=
IE,
> > > > > including Rust objects, so this needs to switch to the small code=
 model
> > > > > with the PIE relocation model as well.
> > > >
> > > > I think that related to this work is the patch series [1] that
> > > > introduces the changes necessary to build the kernel as Position
> > > > Independent Executable (PIE) on x86_64 [1]. There are some more pla=
ces
> > > > that need to be adapted for PIE. The patch series also introduces
> > > > objtool functionality to add validation for x86 PIE.
> > > >
> > > > [1] "[PATCH RFC 00/43] x86/pie: Make kernel image's virtual address=
 flexible"
> > > > https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@an=
tgroup.com/
> > > >
> > >
> > > Hi Uros,
> > >
> > > I am aware of that discussion, as I took part in it as well.
> > >
> > > I don't think any of those changes are actually needed now - did you
> > > notice anything in particular that is missing?
> >
> > Some time ago I went through the kernel sources and proposed several
> > patches that changed all trivial occurrences of non-RIP addresses to
> > RIP ones. The work was partially based on the mentioned patch series,
> > and I remember, I left some of them out [e.g. 1], because they
> > required a temporary variable.
>
> I have a similar patch in my series, but the DEBUG_ENTRY code just uses
>
> pushf 1f@GOTPCREL(%rip)
>
> so no temporaries are needed.
>
> > Also, there was discussion about ftrace
> > [2], where no solution was found.
> >
>
> When linking with -z call-nop=3Dsuffix-nop, the __fentry__ call via the
> GOT will be relaxed by the linker into a 5 byte call followed by a 1
> byte NOP, so I don't think we need to do anything special here. It
> might mean we currently lose -mnop-mcount until we find a solution for
> that in the compiler. In case you remember, I contributed and you
> merged a GCC patch that makes the __fentry__ emission logic honour
> -fdirect-access-external-data which should help here. This landed in
> GCC 14.
>
> > Looking through your series, I didn't find some of the non-RIP -> RIP
> > changes proposed by the original series (especially the ftrace part),
> > and noticed that there is no objtool validator proposed to ensure that
> > all generated code is indeed PIE compatible.
> >
>
> What would be the point of that? The linker will complain and throw an
> error if the code cannot be converted into a PIE executable, so I
> don't think we need objtool's help for that.

Indeed.

> > Speaking of non-RIP -> RIP changes that require a temporary - would it
> > be beneficial to make a macro that would use the RIP form only when
> > #ifdef CONFIG_X86_PIE? That would avoid code size increase when PIE is
> > not needed.
> >
>
> This series does not make the PIE support configurable. Do you think
> the code size increase is a concern if all GOT based symbol references
> are elided, e.g, via -fdirect-access-external-data?

I was looking at the code size measurement of the original patch
series (perhaps these are not relevant with your series) and I think
2.2% - 2.4% code size increase can be problematic. Can you perhaps
provide new code size increase measurements with your patches applied?

Thanks and BR,
Uros.

