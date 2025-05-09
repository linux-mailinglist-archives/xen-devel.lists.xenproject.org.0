Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDEAB1120
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 12:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980055.1366535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDLIu-0002tk-L2; Fri, 09 May 2025 10:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980055.1366535; Fri, 09 May 2025 10:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDLIu-0002qy-IR; Fri, 09 May 2025 10:50:08 +0000
Received: by outflank-mailman (input) for mailman id 980055;
 Fri, 09 May 2025 10:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMqf=XZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uDLIt-0002qs-1P
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 10:50:07 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e01014d-2cc3-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 12:50:05 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso12967255e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 03:50:05 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f58f2961sm2855610f8f.45.2025.05.09.03.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 03:50:04 -0700 (PDT)
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
X-Inumbo-ID: 5e01014d-2cc3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746787805; x=1747392605; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FjIqqJel1+4NNYYXuRdtjsXhMEIDc9qYF/U8D65cpog=;
        b=ONlCtr8y2tC8EhzJrzrVl4nlo6KjEFC0cKp8joPDodYNkwmT7S9b941mcjw4C1ukWK
         iHC5c0cVw3ZRbJiO+4lQNVZhhJmXrThMrjhp95VVn8Oh3+0gZr31mQSwiQOJ/FD6eYP3
         x7LYa8aE0TSoNzXM4h5Nwwa/y0hVDhvUPFric=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787805; x=1747392605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjIqqJel1+4NNYYXuRdtjsXhMEIDc9qYF/U8D65cpog=;
        b=B4keBgBJJPVcv7H7bikJ4/Wc4vQYtV+GsLmka7kNKRa920K+Z5/8PdZOqvD6vgdf+E
         3AxeUx4CFunJTo0rUkZvTXMYhlp7XLN+fOhvGPfZJeRvIB+UjSIvbRzdB6ScylVlVivu
         9Xterj6haoUToDBjCDT2hKfOE5oyfe2MwcWLXoCxbD+P8oIboPF9m80j26qtMckOCdRr
         guyhNC3+I5fWKTV+CXcKmDxwaMIQpmU258+SWOuff+wswmuSVHN+0tro501a6ICaPJ3l
         RPDptNLtMaYpYDMSZxpL+KVbJByrqT184pSW2kRlgApo5hXp8v9mmNmvA92K4dktK/wx
         litw==
X-Forwarded-Encrypted: i=1; AJvYcCXtxvSKNdLykFnhR7ZMRRtcyUvx7yvfKXlzgRj2aaJBZDXp0fy32RHzvUVIO7Mb4Xp7CbserQlQKJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbV4gFeEd8Yaotlw9oNVMhNlXbxj/22/ZYTU4W9tRsf5Qy6GWV
	hV5ItIQsterdvBEW1uvRqGLqleHptf0fp5u+MHgkFBquuDH0dv00hTleid4BiS8=
X-Gm-Gg: ASbGncuLwd042uxhiIuCPkL2G9addrIF+BrIVUCaVTtUF7Tr5760F+bLRthYvCk8W1m
	d2cu2YtDTVO3NqzwMZlB26jiw+WQotA295M448oycX5rNDPSGpqdFT1bdbp5fw7M1RfADI3ea0l
	4BkJAWPRHJHidA/SNjVOjzWCxhxVQ35Wr2E4hquELMaw0viVN2z3u5fQpfLA2jc+y1hBbmmLbOB
	JRBZzibyN23nRG4Tz+dP4sA5TN22R8NuEekRy9ObcZivdv8F7JVQLhFPAoHp5Z3TKhqBtlBFz+b
	uX2MfV8iTW9d0ppBztsoBxQQ5+LwXuyco9nE1E/AoM88wA==
X-Google-Smtp-Source: AGHT+IGyHMp5LBetRR3pOIoQzV/u48nYBSP967mk/UeC22N94UEMO60s/S34SR3X9zqHAen9HNO+mQ==
X-Received: by 2002:a05:6000:200d:b0:3a0:be75:1bb1 with SMTP id ffacd0b85a97d-3a1f647ffe8mr2023809f8f.42.1746787805007;
        Fri, 09 May 2025 03:50:05 -0700 (PDT)
Date: Fri, 9 May 2025 12:50:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
Message-ID: <aB3d2FxH8JOxM5q9@macbook.lan>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
 <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
 <D9RJ9PK28QNQ.EKGYRHXWTYZ1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9RJ9PK28QNQ.EKGYRHXWTYZ1@amd.com>

On Fri, May 09, 2025 at 11:47:36AM +0200, Alejandro Vallejo wrote:
> >>>>> A Linux driver that needs access to userspace memory
> >>>>> pages can get it in two different ways:
> >>>>>
> >>>>> 1. It can pin the pages using the pin_user_pages family of APIs.
> >>>>>    If these functions succeed, the driver is guaranteed to be able
> >>>>>    to access the pages until it unpins them.  However, this also
> >>>>>    means that the pages cannot be paged out or migrated.  Furthermore,
> >>>>>    file-backed pages cannot be safely pinned, and pinning GPU memory
> >>>>>    isn’t supported.  (At a minimum, it would prevent the pages from
> >>>>>    migrating from system RAM to VRAM, so all access by a dGPU would
> >>>>>    cross the PCIe bus, which would be very slow.)
> >>>>
> >>>> From a Xen p2m this is all fine - Xen will never remove pages from the
> >>>> p2m unless it's requested to.  So the pining, while needed on the Linux
> >>>> side, doesn't need to be propagated to Xen I would think.
> 
> It might still be helpful to have the concept of pinning to avoid them
> being evicted for other reasons (ballooning?). I don't think it'd be
> sane to allow returning to Xen a page that a domain ever shared with a
> device.

If mapped using the p2m_mmio_direct type in the p2m a domain won't be
able to balloon them out.  It would also be misguided for a guest
kernel to attempt to balloon out memory that I presume will be inside
of a PCI device BAR from the guest point of view.

> re: being requested. Are there real promises from Xen to that effect? I
> could make a hypervisor oversubscribing on memory that swaps non-IOVA
> mem in and out to disk, moving it around all the time and it would be
> compliant with the current behaviour AIUI, but it wouldn't work with
> this scheme, because the mfn's would be off more often than not.

Even if Xen supported domain memory swapping, that could never be used
with domains that have devices attached, as it's not possible to fixup
the p2m on IOMMU fault and retry the access.

Not sure you could even move mfns around, as you would need an atomic
way to copy the previous page contents and set the PTE to point to the
new page.

Unless you want to get into a (IMO) complicated scheme where the
domain notifies the hypervisor which ranges are being used for device
DMA accesses (and thus requires guest kernel changes), I think
swapping of guest memory when there are assigned devices is a no-go.

Xen has (or had? as I never actually seen it being used) a mechanism
to swap domain memory to a dom0 file (see tools/xenpaging.c).  However
more than one provider had mentioned to me that one feature they
particularly preferred of Xen over KVM is that it would never swap
guest memory.  Not sure if that's still the case, but some struggled
to prevent KVM from swapping guest memory, and got complains of
slowness from their tenants.

For the purposes of getting a prototype I would suggest that you
assume p2m memory cannot be randomly swapped out, unless requested by
either the guest or the control domain.

> >>>
> >>> If pinning were enough things would be simple, but sadly it’s not.
> >>>
> >>>>> 2. It can grab the *current* location of the pages and register an
> >>>>>    MMU notifier.  This works for GPU memory and file-backed memory.
> >>>>>    However, when the invalidate_range function of this callback, the
> >>>>>    driver *must* stop all further accesses to the pages.
> >>>>>
> >>>>>    The invalidate_range callback is not allowed to block for a long
> >>>>>    period of time.  My understanding is that things like dirty page
> >>>>>    writeback are blocked while the callback is in progress.  My
> >>>>>    understanding is also that the callback is not allowed to fail.
> >>>>>    I believe it can return a retryable error but I don’t think that
> >>>>>    it is allowed to keep failing forever.
> >>>>>
> >>>>>    Linux’s grant table driver actually had a bug in this area, which
> >>>>>    led to deadlocks.  I fixed that a while back.
> >>>>>
> >>>>> KVM implements the second option: it maps pages into the stage-2
> >>>>> page tables (or shadow page tables, if that is chosen) and unmaps
> >>>>> them when the invalidate_range callback is called.
> 
> I'm still lost as to what is where, who initiates what and what the end
> goal is. Is this about using userspace memory in dom0, and THEN sharing
> that with guests for as long as its live? And make enough magic so the
> guests don't notice the transitionary period in which there may not be
> any memory?
> 
> Or is this about using domU memory for the driver living in dom0?
> 
> Or is this about something else entirely?
> 
> For my own education. Is the following sequence diagram remotely accurate?
> 
> dom0                              domU
>  |                                  |
>  |---+                              |
>  |   | use gfn3 in the driver       |
>  |   | (mapped on user thread)      |
>  |<--+                              |
>  |                                  |
>  |  map mfn(gfn3) in domU BAR       |
>  |--------------------------------->|
>  |                              +---|
>  |              happily use BAR |   |
>  |                              +-->|
>  |---+                              |
>  |   | mmu notifier for gfn3        |
>  |   | (invalidate_range)           |
>  |<--+                              |
>  |                                  |
>  |  unmap mfn(gfn3)                 |
>  |--------------------------------->| <--- Plus some means to making guest 
>  |---+                          +---|      vCPUs pause on access.
>  |   | reclaim gfn3    block on |   |
>  |<--+                 access   |   |
>  |                              |   |
>  |---+                          |   |
>  |   | use gfn7 in the driver   |   |
>  |   | (mapped on user thread)  |   |
>  |<--+                          |   |
>  |                              |   |
>  |  map mfn(gfn7) in domU BAR   |   |
>  |------------------------------+-->| <--- Unpause blocked domU vCPUs

The guest vCPU will already pause on access if there's a p2m
violation, until the ioreq has completed and the vCPU execution can
resume.  That's in control of the ioreq server that handles the
request.

I don't know about the dom0 user-space part, but that's possibly of no
concern for the implementation side in Xen?

My understanding of the actions needed from the Xen side is:

 1. Map either RAM owned by the hardware domain or an MMIO page into
    a domain p2m.
 2. Remove entries from a domain p2m.
 3. Handle p2m violations resulting from guest accesses, using 1. and
    force a guest access retry (or emulate the access).

1. Can possibly be done with XEN_DOMCTL_memory_mapping and
XENMEM_add_to_physmap_batch, but as I understood it it's not ideal.
Demi would like a way to use the same hypercall to map either RAM or
IOMEM into a domain p2m.

2. What hypercall to use depends on how the memory is mapped.

3. ioreq servers will already get requests for accesses to unmapped
regions they have registered for.  If the access is to be retried we
need to expand ioreq interface a bit to handle this case.  Adding a
new ioreq state like STATE_IORESP_RETRY might be enough?  Maybe I'm
being naive though.

>  |                                  |
> 
> >>> - The switch from “emulated MMIO” to “MMIO or real RAM” needs to
> >>>   be atomic from the guest’s perspective.
> >> 
> >> Updates of p2m PTEs are always atomic.
> > That’s good.
> 
> Updates to a single PTE are atomic, sure. But mapping/unmapping sizes
> not congruent with a whole superpage size (i.e: 256 KiB, more than a
> page, less than a superpage) wouldn't be, as far as the guest is
> concerned.

I've assumed the question was towards PTE updates, as to whether
PTE entries where always consistent.

> But if my understanding above is correct maybe it doesn't matter? It
> only needs to be atomic wrt the hypercall that requests it, so that the
> gfn is never reused while the guest p2m still holds that mfn.

I think it only matters that the PTE is always consistent, either
mapped or unmapped (and thus generate an ioreq request on access when
unmapped).

Regards, Roger.

