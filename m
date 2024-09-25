Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617E9866B4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 21:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804537.1215550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stXTN-0007mr-84; Wed, 25 Sep 2024 19:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804537.1215550; Wed, 25 Sep 2024 19:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stXTN-0007ji-53; Wed, 25 Sep 2024 19:14:49 +0000
Received: by outflank-mailman (input) for mailman id 804537;
 Wed, 25 Sep 2024 19:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqd3=QX=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stXTM-0007jc-1W
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 19:14:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b35b8a1-7b72-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 21:14:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 164A25C504C
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 19:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99889C4CECE
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 19:14:41 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso2028431fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 12:14:41 -0700 (PDT)
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
X-Inumbo-ID: 6b35b8a1-7b72-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727291681;
	bh=v6vimdadH9tmhJ3NLSECJJW2W8zTrYSh4bxODwkPlVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YGBPGmYgAPdAFKNTwwajPecfktex9cSL6WggNqGsmkyZ+kpGzsxngdf8S8+81jNKy
	 eRHOxSC4Er/nJLoAMfLrBkTHIcD1IdZYm1TNFrPbeS5EE4HG+uTT9AVyVqhIl/8HJL
	 psBuU8DB8inowiaBUE9F9LJuDlTjOY0eHfoSjx7oH91PPbsHYt2Ihsnvpoy1LM1AK1
	 tYHEHOvaPLcu5CS66hGTlA73hlGTptk2NtlRfVRmbHTdaNwk1haPSHF9lDYgrCR7dL
	 s9OTTLilWDbSivuiX3XMZtzsg/Rv746l/RHhNETo2Bt5HCeuV+cwNeebX7eUhXXI68
	 feesglxmQ0ChQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxgK5aWCt3agioIBLg/jSjJqDp8Hk/vOCDCNIYeu3ftgCp5xFqvPI119Oml+Bouw8jhSDyhdmAVTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSHqRDD0cJYtWYqc3WYAV1YrmoWmceWF1M7y57DQEdkC9pnE95
	YzL3EO6ZaY8OBFT+sPsOpWopRGxYsA5WloOnDxJYkiM12kUhv5NC0AGwA7hfNU6LVutpuZQ1ml0
	eQn0fO0ItN8vsL23y939N5C0nSwc=
X-Google-Smtp-Source: AGHT+IHhx37wVyIVLg+xrue+pSSLZp5Q9LgYurWqXbgYba/vJ5Rw09i+I8llv3k1oq/x6sYNFgZcR26HfbSEX6O6VBA=
X-Received: by 2002:a05:651c:2126:b0:2f7:631a:6df8 with SMTP id
 38308e7fff4ca-2f9c6cecd0fmr2173111fa.23.1727291679841; Wed, 25 Sep 2024
 12:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-57-ardb+git@google.com> <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
In-Reply-To: <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Sep 2024 21:14:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
Message-ID: <CAMj1kXEL+BBTpaYzw_vkPdo18gF0-gjxBMbZyuaNhmWZC8=6tw@mail.gmail.com>
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

On Wed, 25 Sept 2024 at 20:54, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Build the kernel as a Position Independent Executable (PIE). This
> > results in more efficient relocation processing for the virtual
> > displacement of the kernel (for KASLR). More importantly, it instructs
> > the linker to generate what is actually needed (a program that can be
> > moved around in memory before execution), which is better than having t=
o
> > rely on the linker to create a position dependent binary that happens t=
o
> > tolerate being moved around after poking it in exactly the right manner=
.
> >
> > Note that this means that all codegen should be compatible with PIE,
> > including Rust objects, so this needs to switch to the small code model
> > with the PIE relocation model as well.
>
> I think that related to this work is the patch series [1] that
> introduces the changes necessary to build the kernel as Position
> Independent Executable (PIE) on x86_64 [1]. There are some more places
> that need to be adapted for PIE. The patch series also introduces
> objtool functionality to add validation for x86 PIE.
>
> [1] "[PATCH RFC 00/43] x86/pie: Make kernel image's virtual address flexi=
ble"
> https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup=
.com/
>

Hi Uros,

I am aware of that discussion, as I took part in it as well.

I don't think any of those changes are actually needed now - did you
notice anything in particular that is missing?

