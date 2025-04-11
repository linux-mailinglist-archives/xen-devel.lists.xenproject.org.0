Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73CA85BDA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947243.1344911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CgE-00060y-OE; Fri, 11 Apr 2025 11:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947243.1344911; Fri, 11 Apr 2025 11:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CgE-0005zd-La; Fri, 11 Apr 2025 11:36:18 +0000
Received: by outflank-mailman (input) for mailman id 947243;
 Fri, 11 Apr 2025 11:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r/J2=W5=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1u3CgE-0005zX-7Y
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:36:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad710b6-16c9-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:36:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D97F4A4E9
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 11:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B03C4AF09
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 11:36:10 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30c0517142bso14807421fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 04:36:10 -0700 (PDT)
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
X-Inumbo-ID: 2ad710b6-16c9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371370;
	bh=NdAnPqs6PuTQigzagubEFM0UzQcF+urkBBiiYAlXWgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O8U0O3YQ2VhPF/Ne+9YUSnHZr+yts96G4zfY8CFlSx/w9hl6cj+TC9zOvmBUnMAFL
	 dBJyyFjq2Yah1TPOTyDuK9kHCobmcYJ9PuAFXkTDrry42Sv5B72U2D5SyYlRgg9TpZ
	 aoB+drX/U0MqtVcQIc258xL4AlAU6DiO5X02lA8nfoM56AD4RkSWAftrjr82fHdfCT
	 6V8lStZ4QdHIvjfSnKeoHBUhPCYGsTWt4R+caveFHZ7ywiIJ6gu5Ri8px+Ax2Wx9tI
	 vaslVhoY/SCbzXr1/i5aURIfHhoQbZ4nj7yfE1f+ObKeUKExG/M2BAkfrlVg0nj60I
	 OjJSr0D85qfQg==
X-Forwarded-Encrypted: i=1; AJvYcCWA7r5ZD579j7ZDGZFDVQ73GwVJBLz0c/R1JLPEkvYZ2eoro684xnwhNnv3nsOZF6RCAhPV3QOC2FY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzH2+Fmdr+Cre9swo4qaDJIB07W7xByjadHpjanE0EArb1NCeUZ
	i2BI/v2gBrM1LexrzFuZuK+8kf/Gfjya9UbZ1itt9c8lI27YTeZ8YHT2ltU0aiOn+f/0xXGGe+y
	bXKe9WwFHlb5LX8wnNrHmg5yvupo=
X-Google-Smtp-Source: AGHT+IGZdi6ATDzL9ptAqZyQs8oOCHpEKm0d8jQHsICa2IrWOLJG0DyhKNfLe2oP++GofUDWlZqJS14I07//h0GmwNA=
X-Received: by 2002:a2e:b8c4:0:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-31049a1b000mr6316791fa.18.1744371368538; Fri, 11 Apr 2025
 04:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com> <20250410195012.363658-1-jason.andryuk@amd.com>
 <84c03f50-638b-4df4-af52-8f79bf00dc20@citrix.com>
In-Reply-To: <84c03f50-638b-4df4-af52-8f79bf00dc20@citrix.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 11 Apr 2025 13:35:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGCSSHvokAB5bq4vJv-xPPQf1P468dvoBmpJ-0kNsm6Dg@mail.gmail.com>
X-Gm-Features: ATxdqUF8-K8XKZLthrjIgh8B13YloA0kg4FZ_oVKADTqPbyxfCJt1ClJo68_sf4
Message-ID: <CAMj1kXGCSSHvokAB5bq4vJv-xPPQf1P468dvoBmpJ-0kNsm6Dg@mail.gmail.com>
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, agarciav@amd.com, jgross@suse.com, 
	anthony.perard@vates.tech, marmarek@invisiblethingslab.com, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 23:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 10/04/2025 8:50 pm, Jason Andryuk wrote:
> > A Xen PVH dom0 on an AMD processor triple faults early in boot on
> > 6.6.86.  CPU detection appears to fail, as the faulting instruction is
> > vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
> >
> > Detection fails because __xen_hypercall_setfunc() returns the full
> > kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
> > e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
> > xen_hypercall_amd(%rip), which when running from identity mapping, is
> > only 0x015b93f0.
> >
> > Replace the rip-relative address with just loading the actual address to
> > restore the proper comparision.
> >
> > This only seems to affect PVH dom0 boot.  This is probably because the
> > XENMEM_memory_map hypercall is issued early on from the identity
> > mappings.  With a domU, the memory map is provided via hvm_start_info
> > and the hypercall is skipped.  The domU is probably running from the
> > kernel high mapping when it issues hypercalls.
> >
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > ---
> > I think this sort of address mismatch would be addresed by
> > e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
> >
> > That could be backported instead, but it depends on a fair number of
> > patches.
>
> I've just spoken to Ard, and he thinks that it's standalone.  Should be
> ok to backport as a fix.
>

I've tried building and booting 6.6.y with the patch applied - GS will
still be set to the 1:1 mapped address but that shouldn't matter,
given that it is only used for the stack canary, and we don't do
address comparisons on that afaik.

> > Not sure on how getting a patch just into 6.6 would work.  This patch
> > could go into upstream Linux though it's not strictly necessary when the
> > rip-relative address is a high address.
>
> Do we know which other trees are broken?  I only found 6.6 because I was
> messing around with other bits of CI that happen to use 6.6.
>

I'd assume all trees that had the hypercall page removal patch
backported to them will be broken in the same way.

