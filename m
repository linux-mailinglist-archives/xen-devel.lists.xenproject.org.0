Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521EA861F0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 17:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947588.1345182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3GMh-0004qI-7m; Fri, 11 Apr 2025 15:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947588.1345182; Fri, 11 Apr 2025 15:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3GMh-0004nL-4p; Fri, 11 Apr 2025 15:32:23 +0000
Received: by outflank-mailman (input) for mailman id 947588;
 Fri, 11 Apr 2025 15:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r/J2=W5=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1u3GMf-0004nF-N6
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 15:32:21 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26582db5-16ea-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 17:32:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C3544A50D
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 15:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB22C4CEE2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 15:32:15 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54954fa61c9so2712200e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 08:32:15 -0700 (PDT)
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
X-Inumbo-ID: 26582db5-16ea-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744385536;
	bh=qecDzYE+xh/y37TaBMAK4HUM7O6HCzXfS50lOtKKy20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FPAH74J/y8zwAFWZKQQfqbeLsiq4qPpjrxrk4F5FSlyTp11m3AZa3QGQGm2lXrtjn
	 TuESbiH1QdckFzDP82bHkrrDyOdKvWh/JSbQ9LTvtSoO6U6Sez4RzhqkAiBuNG7W/u
	 bO8pHf+EObcKIPgOL1fQa6P6Nj52RmvcJ20YPrR3QM5TfvmrAkjYFmmoEHdvUpU/y4
	 1baVUrCx3AdKgIdfu6Dpbf9uKDGZINFm20LT6qaJ1CX5f0BS//LQbfgERG5Ojc9IZF
	 K8/8wXi3M5i1zayri5eIDMac33QbQMIIYSMExp68fu44u3GNYmWHeKHebSTXNGJIGn
	 QICWuk9K1WZsA==
X-Forwarded-Encrypted: i=1; AJvYcCWrKFr96wDatnnInkkWtB1zphZra9gSbxkqA9RJKF4Maz1SF8wMvRK0FEfSVVyxH/XmQiRfyJ4Bdl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzSauRd/aMvrPpNJZpyNZz4Jupanrx479eTMpfYxM/Q8UHpR/d
	OjcealVorPDDU3TiP6WJT38cT523X/WDz9MbyGYtvD26eF6j3AlNRNzoU4pXl4ORU/1aqH8W4m0
	4VU8+L/2dUXeP9yUe+PgutpnwVlc=
X-Google-Smtp-Source: AGHT+IHcffy9EjRZN6cWiTG4eam2IzF6P4Zw/emfa+loK4jdqfntj3DmrBwnZHyx45V0Av1WtulyaUY4bIz89dZiIcM=
X-Received: by 2002:a05:6512:31c5:b0:545:743:cf44 with SMTP id
 2adb3069b0e04-54d4528be9bmr1203789e87.12.1744385534307; Fri, 11 Apr 2025
 08:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com> <20250410195012.363658-1-jason.andryuk@amd.com>
 <84c03f50-638b-4df4-af52-8f79bf00dc20@citrix.com> <CAMj1kXGCSSHvokAB5bq4vJv-xPPQf1P468dvoBmpJ-0kNsm6Dg@mail.gmail.com>
 <8d2bfccc-37e9-4f36-8909-58c398938ea4@amd.com>
In-Reply-To: <8d2bfccc-37e9-4f36-8909-58c398938ea4@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 11 Apr 2025 17:32:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGQeUsWEPQjP4RMTf6y8Ua23fOsyVfm6gHEkKOKMJGPRQ@mail.gmail.com>
X-Gm-Features: ATxdqUF3SKqlDgQSzwbhzi2zfunOX3JsmGKzwfq8ojR4jx2GN1WLYoHtpwolgxc
Message-ID: <CAMj1kXGQeUsWEPQjP4RMTf6y8Ua23fOsyVfm6gHEkKOKMJGPRQ@mail.gmail.com>
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, agarciav@amd.com, jgross@suse.com, 
	anthony.perard@vates.tech, marmarek@invisiblethingslab.com, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Apr 2025 at 16:28, Jason Andryuk <jason.andryuk@amd.com> wrote:
>
>
>
> On 2025-04-11 07:35, Ard Biesheuvel wrote:
> > On Thu, 10 Apr 2025 at 23:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>
> >> On 10/04/2025 8:50 pm, Jason Andryuk wrote:
> >>> A Xen PVH dom0 on an AMD processor triple faults early in boot on
> >>> 6.6.86.  CPU detection appears to fail, as the faulting instruction is
> >>> vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
> >>>
> >>> Detection fails because __xen_hypercall_setfunc() returns the full
> >>> kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
> >>> e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
> >>> xen_hypercall_amd(%rip), which when running from identity mapping, is
> >>> only 0x015b93f0.
> >>>
> >>> Replace the rip-relative address with just loading the actual address to
> >>> restore the proper comparision.
> >>>
> >>> This only seems to affect PVH dom0 boot.  This is probably because the
> >>> XENMEM_memory_map hypercall is issued early on from the identity
> >>> mappings.  With a domU, the memory map is provided via hvm_start_info
> >>> and the hypercall is skipped.  The domU is probably running from the
> >>> kernel high mapping when it issues hypercalls.
> >>>
> >>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> >>> ---
> >>> I think this sort of address mismatch would be addresed by
> >>> e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
> >>>
> >>> That could be backported instead, but it depends on a fair number of
> >>> patches.
> >>
> >> I've just spoken to Ard, and he thinks that it's standalone.  Should be
> >> ok to backport as a fix.
> >>
> >
> > I've tried building and booting 6.6.y with the patch applied - GS will
> > still be set to the 1:1 mapped address but that shouldn't matter,
> > given that it is only used for the stack canary, and we don't do
> > address comparisons on that afaik.
>
> Yes, it seems to work - I tested with dom0 and it booted.  I removed the
> use of phys_base - the diff is included below.  Does that match what you
> did?
>

The stable tree maintainers generally prefer the backports to be as
close to the originals as possible, and given that phys_base is
guaranteed to be 0x0, you might as well keep the subtraction.

> >>> Not sure on how getting a patch just into 6.6 would work.  This patch
> >>> could go into upstream Linux though it's not strictly necessary when the
> >>> rip-relative address is a high address.
> >>
> >> Do we know which other trees are broken?  I only found 6.6 because I was
> >> messing around with other bits of CI that happen to use 6.6.
> >>
> >
> > I'd assume all trees that had the hypercall page removal patch
> > backported to them will be broken in the same way.
>
> Yes, I think so.  Looks like it went back to 5.10 but not to 5.4.
>
> Ard, I can submit the stable request unless you want to.
>

Please go ahead.

