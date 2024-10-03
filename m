Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0D098EAC4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 09:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809192.1221405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swGam-0001JH-Iz; Thu, 03 Oct 2024 07:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809192.1221405; Thu, 03 Oct 2024 07:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swGam-0001Gi-Eq; Thu, 03 Oct 2024 07:49:44 +0000
Received: by outflank-mailman (input) for mailman id 809192;
 Thu, 03 Oct 2024 07:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FP3=Q7=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1swGal-0001Fd-D9
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 07:49:43 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c32675b-815c-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 09:49:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D6A2A4339F
 for <xen-devel@lists.xenproject.org>; Thu,  3 Oct 2024 07:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CBCC4CECC
 for <xen-devel@lists.xenproject.org>; Thu,  3 Oct 2024 07:49:40 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539983beb19so781843e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 00:49:40 -0700 (PDT)
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
X-Inumbo-ID: 0c32675b-815c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727941780;
	bh=yu4joNxxij+x73k0WwKAxvDISM4T5p850fyYwpav++4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fjYs0AXRSvWlXr2IjUqQ/1UEpgpem8B9QrJ55pn14FdJ56ZLB3rLwdpOJNQbGF3NM
	 +FCkiVm4KP/Y66Tfv9t7CKOxUYzUf0i100UCLluVlhxMGdyKbGuv2UvQwIKeVQ4zeT
	 LvzYzmHtkogxStHuj7HeKkNTimpZriH2b91nZdjLdun35S9zAMA0QFEA648Y42w5XI
	 Gi8fFi6HfsEbe3UyJcXp5VW+dBNgdleEVfjAjZ0vcGxg1fbHhnkeItuovQEEE5NhIJ
	 A9BDYlI+5LYP473dOyX515wOmtdCYf6hJM7s3mvWs1p0CCdviiBNSrSimfFj+AiKqm
	 f4k30a3YftZkw==
X-Forwarded-Encrypted: i=1; AJvYcCXUF6OGsqAZs9Gl4DagVukDW4J9jBzAbKTLxPKPWgG1uN4JxFJ4sM6zoO1s5VdSiz7kAp+zfEhT314=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY7W98/UPJoe9lPYDe++264ofGFY2sdtslhOIo7YU4krZGjJps
	AkPM6nfI/HuniVVfdwXL6u5G3rFzbwPDomgW0/cBsm7L1lsaOob+TkK5aq/UY1nbyfAUsytOj2h
	HCSTbBixru6bEH48HVsKzl9i8dNA=
X-Google-Smtp-Source: AGHT+IEw8Jb3DYde7tTTH0EDL2FHH23Q+KikOyGqs+EeivRg1nzyPqHOZjkWB2etxXHjfVdM727/d04HH16W7zzq0K4=
X-Received: by 2002:a05:6512:10cd:b0:536:568f:c5ed with SMTP id
 2adb3069b0e04-539a06586f7mr3268615e87.1.1727941778877; Thu, 03 Oct 2024
 00:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240930071513.909462-7-ardb+git@google.com> <20240930071513.909462-11-ardb+git@google.com>
 <b2b23136-fd57-4bc8-bb80-604cc4da0920@amd.com>
In-Reply-To: <b2b23136-fd57-4bc8-bb80-604cc4da0920@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Oct 2024 09:49:27 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF_61S92_tUYbn-RMm4xOUe0MUUp3+Mxzc7=9Y9VKxr1w@mail.gmail.com>
Message-ID: <CAMj1kXF_61S92_tUYbn-RMm4xOUe0MUUp3+Mxzc7=9Y9VKxr1w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2024 at 23:25, Jason Andryuk <jason.andryuk@amd.com> wrote:
>
> On 2024-09-30 03:15, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Xen puts virtual and physical addresses into ELF notes that are treated
> > by the linker as relocatable by default. Doing so is not only pointless,
> > given that the ELF notes are only intended for consumption by Xen before
> > the kernel boots. It is also a KASLR leak, given that the kernel's ELF
> > notes are exposed via the world readable /sys/kernel/notes.
> >
> > So emit these constants in a way that prevents the linker from marking
> > them as relocatable. This involves place-relative relocations (which
> > subtract their own virtual address from the symbol value) and linker
> > provided absolute symbols that add the address of the place to the
> > desired value.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Tested-by: Jason Andryuk <jason.andryuk@amd.com>
>
> The generated values look ok.
>
> > ---
> >   arch/x86/kernel/vmlinux.lds.S | 13 +++++++++++++
> >   arch/x86/platform/pvh/head.S  |  6 +++---
> >   arch/x86/tools/relocs.c       |  1 +
> >   arch/x86/xen/xen-head.S       |  6 ++++--
> >   4 files changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> > index 6726be89b7a6..2b7c8c14c6fd 100644
> > --- a/arch/x86/kernel/vmlinux.lds.S
> > +++ b/arch/x86/kernel/vmlinux.lds.S
> > @@ -527,3 +527,16 @@ INIT_PER_CPU(irq_stack_backing_store);
> >   #endif
> >
> >   #endif /* CONFIG_X86_64 */
> > +
> > +#ifdef CONFIG_XEN
> > +#ifdef CONFIG_XEN_PV
> > +xen_elfnote_entry_offset =
> > +     ABSOLUTE(xen_elfnote_entry) + ABSOLUTE(startup_xen);
> > +#endif
> > +xen_elfnote_hypercall_page_offset =
> > +     ABSOLUTE(xen_elfnote_hypercall_page) + ABSOLUTE(hypercall_page);
> > +#endif
> > +#ifdef CONFIG_PVH
> > +xen_elfnote_phys32_entry_offset =
> > +     ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
> > +#endif
>
> It seems to me, these aren't really offsets, but instead an address + value.
>

Indeed. So xen_elfnote_phys32_entry_value would probably be a better name.

> > diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> > index 7ca51a4da217..2b0d887e0872 100644
> > --- a/arch/x86/platform/pvh/head.S
> > +++ b/arch/x86/platform/pvh/head.S
>
> > @@ -300,5 +300,5 @@ SYM_DATA_END(pvh_level2_kernel_pgt)
> >                    .long KERNEL_IMAGE_SIZE - 1)
> >   #endif
> >
> > -     ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
> > -                  _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
> > +     ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .global xen_elfnote_phys32_entry;
> > +             xen_elfnote_phys32_entry: _ASM_PTR xen_elfnote_phys32_entry_offset - .)
>
> So here you have `address + value - address` to put the desired value in
> the elf note?
>

Exactly. The assembler emits a relative relocation, and the linker
resolves it at build time.

