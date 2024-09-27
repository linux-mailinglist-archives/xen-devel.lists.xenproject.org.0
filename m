Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0C0987DF7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 07:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806000.1217287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su3rM-0005dZ-6T; Fri, 27 Sep 2024 05:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806000.1217287; Fri, 27 Sep 2024 05:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su3rM-0005bZ-1M; Fri, 27 Sep 2024 05:49:44 +0000
Received: by outflank-mailman (input) for mailman id 806000;
 Fri, 27 Sep 2024 05:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=soaG=QZ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1su3rK-0005ah-ON
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 05:49:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 491f99d2-7c94-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 07:49:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2A645C5C27
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 05:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B1BC4CED1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 05:49:38 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso15393981fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 22:49:37 -0700 (PDT)
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
X-Inumbo-ID: 491f99d2-7c94-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727416178;
	bh=OAV6m7+cwGU41PmGCEjKHSA3XIOTJGqWSgQFRzIKJsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y5Vrbm7qwie8s3GLveZ8q7/29ZOrSo+X6do00jjdj8SHerflNUn32ClZSU8P64JfV
	 IFZKV1pHF+1W8Xf68L8OJIZ+WKX7o1rF25yYNcwJRkKwoUFH9XUfPcgEAau594yAve
	 bFsLBp8897N3ZGONvmCL7S5Dkgt+3GYR2dgnDOK6e9CFKGIJS92reVAB/gtukrJigG
	 OO5ijqHU2NfUS70tgoWYfLUdf9Cer2Bd/kZlAWX76/r/vi0aY138M5D9FwIWycZaY4
	 985s9EFdQpnVNMkV8nKoc3dKJvtNcVOTa0RUK/rvlyue1kvZcVnObYlzElxX338MEy
	 W5+aDqUoolbTg==
X-Forwarded-Encrypted: i=1; AJvYcCXcp2p9XMrzcRV4rtZZ/5OuMzC7zw6OjKwMYV1BZyN7iUV8BU5w1RByypaOFsVOKaOes/S2ML1XONI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS+SQqajgNADUxLEiacLHgodAySo8Ys0slDxcwghQlQ7zqTV0f
	Y8a1V2bKTs+BNVVYdRw+YKWE1Sh0L7vO75iEArp2d2OSkSOLPa9EARLd1KExR+gdQuXqE24JpLV
	IWkZsPgZsLEsvQ3GXg8RSK6utsV4=
X-Google-Smtp-Source: AGHT+IEg3i4mtfqzM/7ZJ4W8rvOfwugjXU1DbntNVFkHJiVWnQTCrLCOhkbCLplK8jRwu/TlJiMLQw7YtshLS+1MGCg=
X-Received: by 2002:a2e:9916:0:b0:2f7:6aa4:2266 with SMTP id
 38308e7fff4ca-2f9c6ccb761mr14735341fa.12.1727416176356; Thu, 26 Sep 2024
 22:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com> <20240926104113.80146-11-ardb+git@google.com>
 <572b339b-7dab-4db0-8ee8-d805f8211aa3@amd.com>
In-Reply-To: <572b339b-7dab-4db0-8ee8-d805f8211aa3@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 27 Sep 2024 07:49:25 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGt76Z0VsWog5Y2srBp8MiYXqkkhOQvFiZ7ULhNB3p6KA@mail.gmail.com>
Message-ID: <CAMj1kXGt76Z0VsWog5Y2srBp8MiYXqkkhOQvFiZ7ULhNB3p6KA@mail.gmail.com>
Subject: Re: [PATCH 4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Sept 2024 at 03:47, Jason Andryuk <jason.andryuk@amd.com> wrote:
>
> On 2024-09-26 06:41, Ard Biesheuvel wrote:
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
> > While at it, switch to a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY,
> > which better matches the intent as well as the Xen documentation and
> > source code.
>
> QEMU parses this according to the ELF bitness.  It looks like this reads
> 8 bytes on 64bit, and 4 on 32.  So I think this change would break its
> parsing.
>

Indeed, well spotted.

> (I don't use QEMU PVH and I'm not that familiar with its implementation.)
>

This is what I used for testing, and it worked fine.

But looking at the code, it does dereference a size_t*, which seems
bizarre but will clearly produce garbage in the upper bits if the note
is 32-bits only and followed by unrelated non-zero data.

I'll just back out this part of the change - it isn't really necessary anyway.

