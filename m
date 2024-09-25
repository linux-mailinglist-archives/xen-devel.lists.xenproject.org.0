Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B29868AC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 23:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804635.1215680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stZu2-0003mM-VN; Wed, 25 Sep 2024 21:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804635.1215680; Wed, 25 Sep 2024 21:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stZu2-0003jT-Rq; Wed, 25 Sep 2024 21:50:30 +0000
Received: by outflank-mailman (input) for mailman id 804635;
 Wed, 25 Sep 2024 21:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqd3=QX=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stZu1-0003jN-O9
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 21:50:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d3c6e83-7b88-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 23:50:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FA5E5C5DE6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA75C4CECF
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 21:50:26 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f753375394so2991191fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 14:50:26 -0700 (PDT)
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
X-Inumbo-ID: 2d3c6e83-7b88-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727301026;
	bh=1lEhoW6WR1MzdDMJddixyg5DPptKnPhIlRVYn7j8lQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ur/3nHyrhZZPu0Yh+dxx9IKm8wfPUcwkSUQRT5/24oDl5DsWgNcYT0e6Eea2tNJEj
	 e7kkusZnvqM4WaMdV8I/B88HrhGKrbpU1NmXjGCDHN50ORnxvzmOycJHLxIoyGwsDO
	 ExoHCIyOj9vlAWjwlo1VC3vyBOmMfPmkVdu53MKdw2rUvIg+EICDRFsYyGF/ME23Kr
	 OQb1mqpKJ2KcOIs7wkgcqQbNW9IxvVRHKG6I1vwEmJlaj0YC21mvFP8GdjxaBxyry9
	 jndDvY46F1MqAtmxQOq27Nb8WyvN+IBfi0EcE/uMfNIYvCFZoSopABS7dcRnOBsVSy
	 JHKCzVeyLclIw==
X-Forwarded-Encrypted: i=1; AJvYcCWgckbiueiloiImeHq83ryuhlRlE9FTOrnd+7Yai29SUl9R3eZJ7PQ3ivAnbvt4I+wALzHOERkwgtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzlRCpIsxfnAd4d5tBpGbq8IU71Ls+PfEiPWLm2JR5VlRvzHn3
	oZ4iiqMT+Rn+igKNotM/NkdYv5nf8Axe7gu+nNl+SL25oIk9T79EBp5T7DYOtxhSsOobDk9IAzQ
	1gjjj0iB4N9kTcfraOscXT9fcB3Q=
X-Google-Smtp-Source: AGHT+IFAZ+6hWU7rSBzvDQXewHWYdV56nlJpCG7le3cONkuZamphf5guvKvreSQ+Lzis3ZFjbCnAEt7u29iA4vUB0Ko=
X-Received: by 2002:a05:651c:1991:b0:2f6:5f7b:e5cf with SMTP id
 38308e7fff4ca-2f915fdfea6mr30629271fa.14.1727301024993; Wed, 25 Sep 2024
 14:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-41-ardb+git@google.com> <81fb3f6b-4ded-41d1-be66-d86af4f22171@amd.com>
In-Reply-To: <81fb3f6b-4ded-41d1-be66-d86af4f22171@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Sep 2024 23:50:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGj25bn2R9vWPqG5+SSSjJp6rzopssDbjk8uOvi=cAiUw@mail.gmail.com>
Message-ID: <CAMj1kXGj25bn2R9vWPqG5+SSSjJp6rzopssDbjk8uOvi=cAiUw@mail.gmail.com>
Subject: Re: [RFC PATCH 11/28] x86/pvh: Avoid absolute symbol references in .head.text
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
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
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 23:11, Jason Andryuk <jason.andryuk@amd.com> wrote:
>
> Hi Ard,
>
> On 2024-09-25 11:01, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The .head.text section contains code that may execute from a different
> > address than it was linked at. This is fragile, given that the x86 ABI
> > can refer to global symbols via absolute or relative references, and the
> > toolchain assumes that these are interchangeable, which they are not in
> > this particular case.
> >
> > In the case of the PVH code, there are some additional complications:
> > - the absolute references are in 32-bit code, which get emitted with
> >    R_X86_64_32 relocations, and these are not permitted in PIE code;
> > - the code in question is not actually relocatable: it can only run
> >    correctly from the physical load address specified in the ELF note.
> >
> > So rewrite the code to only rely on relative symbol references: these
> > are always 32-bits wide, even in 64-bit code, and are resolved by the
> > linker at build time.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Juergen queued up my patches to make the PVH entry point position
> independent (5 commits):
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=linux-next
>
> My commit that corresponds to this patch of yours is:
> https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/commit/?h=linux-next&id=1db29f99edb056d8445876292f53a63459142309
>
> (There are more changes to handle adjusting the page tables.)
>

Thanks for the head's up. Those changes look quite similar, so I guess
I should just rebase my stuff onto the xen tree.

The only thing that I would like to keep from my version is

+ lea (gdt - pvh_start_xen)(%ebp), %eax
+ add %eax, 2(%eax)
+ lgdt (%eax)

and

- .word gdt_end - gdt_start
- .long _pa(gdt_start)
+ .word gdt_end - gdt_start - 1
+ .long gdt_start - gdt

The first line is a bugfix, btw, so perhaps I should send that out
separately. But my series relies on all 32-bit absolute symbol
references being removed, since the linker rejects those when running
in PIE mode, and so the second line is needed to get rid of the _pa()
there.

