Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA4986718
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 21:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804547.1215570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stXra-0002xZ-Cz; Wed, 25 Sep 2024 19:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804547.1215570; Wed, 25 Sep 2024 19:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stXra-0002ux-8q; Wed, 25 Sep 2024 19:39:50 +0000
Received: by outflank-mailman (input) for mailman id 804547;
 Wed, 25 Sep 2024 19:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m3xb=QX=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1stXrY-0002ur-8o
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 19:39:48 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb6d4a9e-7b75-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 21:39:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso2467851fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 12:39:46 -0700 (PDT)
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
X-Inumbo-ID: eb6d4a9e-7b75-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727293186; x=1727897986; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp4KiWnI55kflWfEV5sb0zGnBH7ciSvhguN8q9bReGk=;
        b=aH6ZCnHyZYls40N/EheEPeU5JZZb1TSmhwQKVLPvxXcz599NVgTxw6szFkgZhYJENl
         i4RarqRQRjpJAyT2SeI2uQUlop0uKvsWf9sFFCdpuz3ZtCiFN3DZ6JwfUiL2QcI4PI9E
         6PgcyKvU/ZasgWuXCB5ZfYsuJ6EqU0dEudXyswshgpXF8J8CQf6jbaA5zsgISZtWZ/8s
         n1OAorEcqXcEwu3bTv/Hxt1GPgNg6QjeVCrqwepNfxP0ER18WJaCVyRKMm7UD5mj15Sl
         b9teo7Orej0SNc8/WaDOwx+fMcusaKGa9Z5KWUd2WSIG8+76oRbD9vJLc4ZQmAtFIY8c
         CFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727293186; x=1727897986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp4KiWnI55kflWfEV5sb0zGnBH7ciSvhguN8q9bReGk=;
        b=mTj7fgv/KduJCDn4NkLHxXOKpCJ8zuXpB81YC8hiNj3Nr8IGOVEiW5U/UdESOANfpW
         NYc7gGOUph4WeRF0bMtRuf/XSN/ceGFNcQeySwlRM0Rxlpqaev0SgET2CUGRn1zfZKvH
         MxZzO+QBlaw4EGkxJ6y8Sn1taiz6oEGyrq9rrwk3UvLDrrOwRu4s+qJbWiIkxmsiATYg
         sGAHFFP1y54IbfQmysIH2uxXBIz0CUZB73OO6hLalZ8mnYOmahm+Dt9JhC+WQJaT84Xt
         QDc4G5G9O1wANR1DVzWgu/VsZQx6e9p0J39lkYpbhEQOqvNISwqQXpRXM/jIZOyOr85B
         XFlA==
X-Forwarded-Encrypted: i=1; AJvYcCV37P/goG+tVClxE1spHqIVpRxpJonGqyYxHnxHYqfpj0jhFLRsCuw/g0+Dv8vQVSVap0FavF6aIbQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOtsTRqFpmGKFYU9XudWWEW+Nx4UBasscf0G4dArtAgWe83Eaw
	p/z8HfveyzOlHJQxXamvZ+wENFlAIL0U4yhPWKL0ilcwGpTblPK5v+CCzXG0Mp+s3S8sdaolW8W
	uWcuPcjWXacg06633/6bFrLS4/BM=
X-Google-Smtp-Source: AGHT+IGDMO+ONSKS8XitoA0ITEi5U77wfWogthP7KZ5PTbGU9A+6a8gl715c2Sg7nQwKl7GBJXFXdPzETY/KKnoKxqg=
X-Received: by 2002:a2e:a553:0:b0:2ef:2e8f:f3b3 with SMTP id
 38308e7fff4ca-2f915ff665cmr27096641fa.21.1727293185428; Wed, 25 Sep 2024
 12:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-57-ardb+git@google.com> <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
 <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
In-Reply-To: <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 25 Sep 2024 21:39:33 +0200
Message-ID: <CAFULd4bLuHQvHNaoLJ4DoEQQZZF0yz=uD27m49M+AbYnh=+NzQ@mail.gmail.com>
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

On Wed, Sep 25, 2024 at 9:14=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Wed, 25 Sept 2024 at 20:54, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Build the kernel as a Position Independent Executable (PIE). This
> > > results in more efficient relocation processing for the virtual
> > > displacement of the kernel (for KASLR). More importantly, it instruct=
s
> > > the linker to generate what is actually needed (a program that can be
> > > moved around in memory before execution), which is better than having=
 to
> > > rely on the linker to create a position dependent binary that happens=
 to
> > > tolerate being moved around after poking it in exactly the right mann=
er.
> > >
> > > Note that this means that all codegen should be compatible with PIE,
> > > including Rust objects, so this needs to switch to the small code mod=
el
> > > with the PIE relocation model as well.
> >
> > I think that related to this work is the patch series [1] that
> > introduces the changes necessary to build the kernel as Position
> > Independent Executable (PIE) on x86_64 [1]. There are some more places
> > that need to be adapted for PIE. The patch series also introduces
> > objtool functionality to add validation for x86 PIE.
> >
> > [1] "[PATCH RFC 00/43] x86/pie: Make kernel image's virtual address fle=
xible"
> > https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgro=
up.com/
> >
>
> Hi Uros,
>
> I am aware of that discussion, as I took part in it as well.
>
> I don't think any of those changes are actually needed now - did you
> notice anything in particular that is missing?

Some time ago I went through the kernel sources and proposed several
patches that changed all trivial occurrences of non-RIP addresses to
RIP ones. The work was partially based on the mentioned patch series,
and I remember, I left some of them out [e.g. 1], because they
required a temporary variable. Also, there was discussion about ftrace
[2], where no solution was found.

Looking through your series, I didn't find some of the non-RIP -> RIP
changes proposed by the original series (especially the ftrace part),
and noticed that there is no objtool validator proposed to ensure that
all generated code is indeed PIE compatible.

Speaking of non-RIP -> RIP changes that require a temporary - would it
be beneficial to make a macro that would use the RIP form only when
#ifdef CONFIG_X86_PIE? That would avoid code size increase when PIE is
not needed.

[1] https://lore.kernel.org/lkml/a0b69f3fac1834c05f960b916cc6eb0004cdffbf.1=
682673543.git.houwenlong.hwl@antgroup.com/
[2] https://lore.kernel.org/lkml/20230428094454.0f2f5049@gandalf.local.home=
/
[3] https://lore.kernel.org/lkml/226af8c63c5bfa361763dd041a997ee84fe926cf.1=
682673543.git.houwenlong.hwl@antgroup.com/

Thanks and best regards,
Uros.

