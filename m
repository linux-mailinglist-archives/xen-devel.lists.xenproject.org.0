Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F079987F50
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 09:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806076.1217389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5Im-0004Gs-F4; Fri, 27 Sep 2024 07:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806076.1217389; Fri, 27 Sep 2024 07:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5Im-0004FI-CK; Fri, 27 Sep 2024 07:22:08 +0000
Received: by outflank-mailman (input) for mailman id 806076;
 Fri, 27 Sep 2024 07:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=soaG=QZ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1su5Il-0004F9-Rc
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 07:22:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327bd16c-7ca1-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 09:22:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5525C5C56F2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 07:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025DEC4CED1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 07:22:03 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f75b13c2a8so19942041fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 00:22:03 -0700 (PDT)
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
X-Inumbo-ID: 327bd16c-7ca1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727421724;
	bh=XXyorE3NYuaIDyKhE8tOm3HgUiabzoTflJQVXTwEZ5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jXzY+jXb8Dv8w6jzWwjSyIsOThAJIUQrgM3HbBpuauw9kIRF6mQc3AoQonlaGfFTu
	 6EYEFlnXbMEaj7BGEkzKnpAulGc46TCpO+/81JXHY6Rrwhk2uPJ9L7rO3zv7U0cMvH
	 smgsOKwJvCkG6KwN3xO+kvplq13fhPraadiAGXQd8+roeB6AX1qAGCJ6294Ax4neb9
	 LL5VP5G0Ximam4INJiXJ0AiLn9YhojrfnGTj5Ue7XVTgCfaAdhNulZ36tEUSo3qyKs
	 qUadbCC0CxTE2h4SRRj42tVzfwAcwMIluHzDJ0vci7/2VWpT33sNemUIlB6obhhPNx
	 E028f5lW4Fopw==
X-Forwarded-Encrypted: i=1; AJvYcCX52R6PxjM8KruTUNFEPe3qSovnPGRpobHTIDykwTDiWpJi57rXkCa/RljtejEsvX93pF0h1LQBkzw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKFj0NBLI/dEbLzSZdyGMCl8gdV1ZNRnT9hg7F5P5O/kmh6Pkf
	LRsq1ecI7bcVBQVMaUAk46AOjeU4MkMQhWJgoGhA/Vway12LyfmGc8BHOEoiCcLblAMNO3SeDFV
	n3XRHK5/9toS3LAh5If9kVVGFk0g=
X-Google-Smtp-Source: AGHT+IHge0Y7vPBswWpBlfdMpGay8Cj7KoMmh1SqNdtIRPMbR5P+1BFic2AQtpeOfD0rJjofWLR8ftJJRjSH+e4kQmY=
X-Received: by 2002:a2e:9401:0:b0:2f6:5f0a:9cfe with SMTP id
 38308e7fff4ca-2f9d417b457mr10213891fa.30.1727421722306; Fri, 27 Sep 2024
 00:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com> <20240926104113.80146-11-ardb+git@google.com>
 <572b339b-7dab-4db0-8ee8-d805f8211aa3@amd.com> <CAMj1kXGt76Z0VsWog5Y2srBp8MiYXqkkhOQvFiZ7ULhNB3p6KA@mail.gmail.com>
In-Reply-To: <CAMj1kXGt76Z0VsWog5Y2srBp8MiYXqkkhOQvFiZ7ULhNB3p6KA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 27 Sep 2024 09:21:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFL_a1DTzzXBaNZyU=4ho_NPYG7tceo-wNu9ehQ-72+gA@mail.gmail.com>
Message-ID: <CAMj1kXFL_a1DTzzXBaNZyU=4ho_NPYG7tceo-wNu9ehQ-72+gA@mail.gmail.com>
Subject: Re: [PATCH 4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Sept 2024 at 07:49, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 27 Sept 2024 at 03:47, Jason Andryuk <jason.andryuk@amd.com> wrote:
> >
> > On 2024-09-26 06:41, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Xen puts virtual and physical addresses into ELF notes that are treated
> > > by the linker as relocatable by default. Doing so is not only pointless,
> > > given that the ELF notes are only intended for consumption by Xen before
> > > the kernel boots. It is also a KASLR leak, given that the kernel's ELF
> > > notes are exposed via the world readable /sys/kernel/notes.
> > >
> > > So emit these constants in a way that prevents the linker from marking
> > > them as relocatable. This involves place-relative relocations (which
> > > subtract their own virtual address from the symbol value) and linker
> > > provided absolute symbols that add the address of the place to the
> > > desired value.
> > >
> > > While at it, switch to a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY,
> > > which better matches the intent as well as the Xen documentation and
> > > source code.
> >
> > QEMU parses this according to the ELF bitness.  It looks like this reads
> > 8 bytes on 64bit, and 4 on 32.  So I think this change would break its
> > parsing.
> >
>
> Indeed, well spotted.
>
> > (I don't use QEMU PVH and I'm not that familiar with its implementation.)
> >
>
> This is what I used for testing, and it worked fine.
>
> But looking at the code, it does dereference a size_t*, which seems
> bizarre but will clearly produce garbage in the upper bits if the note
> is 32-bits only and followed by unrelated non-zero data.
>
> I'll just back out this part of the change - it isn't really necessary anyway.

... and fix QEMU as well:

https://lore.kernel.org/qemu-devel/20240927071950.1458596-1-ardb+git@google.com/T/#u

