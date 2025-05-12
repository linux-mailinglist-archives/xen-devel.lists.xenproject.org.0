Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D51AB3119
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980940.1367329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOCt-00067b-RG; Mon, 12 May 2025 08:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980940.1367329; Mon, 12 May 2025 08:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOCt-00065c-OZ; Mon, 12 May 2025 08:08:15 +0000
Received: by outflank-mailman (input) for mailman id 980940;
 Mon, 12 May 2025 08:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEOCs-00065W-4n
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:08:14 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f49e62e-2f08-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 10:08:11 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a0ac853894so3567929f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 01:08:11 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f5a4cc39sm11447688f8f.100.2025.05.12.01.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 01:08:10 -0700 (PDT)
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
X-Inumbo-ID: 3f49e62e-2f08-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747037291; x=1747642091; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PlmK4WNStIboXdhqJDf/RX8TH0la3/vvkcIZZ91ZyUM=;
        b=MF28zU7RXpKbhuQi6xFgzskBCytvDWvZcYaJAaaVil2a+NrcTWmu4p6SAOi3Uu7z0N
         BafnpH//0aEPCfp2qoLInPdOGV+gkF33nxNO+DJTr7pw5wiS5njrjvEIWPfLy/4rfk+V
         LoiDLUGlT5ZHNCgxYlxFWT+OYw5AEX6Dg/w8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037291; x=1747642091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlmK4WNStIboXdhqJDf/RX8TH0la3/vvkcIZZ91ZyUM=;
        b=luzNqjL2rAsv8huP/R8up1DALyrLBCI8XStPfXB2drbWtFPsmMeUh5kFYShpQstgix
         gZM/ur9qFPNcvdyY7DCRnXeXAZKA6/OQVd4AyBrf+Ofp+7lhry30blxKhYHLXYfzFclQ
         Gegn7A8sNjyVVMLFqNQr6cFWKrrQQMPljxJZ9WoZKxN+LV6fKnzB86o21wyfI331Bwxq
         nnmYbyvLWlYAM+Ewsq1rR13V+R6vicrV7mHcwP3IumH9jOcG5L9rOhF5qDEsK6yMQ9Tw
         ILgAIfXKn8K8bhaYBW926mUDhsJPafwesspn3VROfFiAyEySfltbSTTjQHd08+wFtSZW
         BJUg==
X-Forwarded-Encrypted: i=1; AJvYcCXHZkFoZUq2BypNfO3kmXzA27EfwIUinGIg2unnLjKp8ydRI8NBg4ujCY05mouKnu7gDb7u2yMq3qQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf0g2NdWnEXCaPm+Po2GF7x0xtps164wbohvi/7KvMIeKD4NYU
	E3HI9Yx18ftYEq/P1WQ7EBGNi/Op0gstAnpAjwLxHT19a21lM/18TSljDc8FiIk=
X-Gm-Gg: ASbGncvdorACfyHgzye77wSTXF8Fv9L0/8ztCCcaqUskfAKqU0s3NcbyV6rPvAeWnPB
	SmUd7MzpZXxocRCf7vfHm/rA4lfYqlbYOmsMFpE+tH2vz8B9fsPgzsz35mqWjwJhkOiPHHSWcqq
	fBSNFBdZdPy2r8WTJssHCiFrDx3WeHsSBmp+bBuic522ZsydtoRKzxJZf+ymvxNR3Q4QKRYYEDw
	3stStYx2S/P+6iUkwdHH4YYc020078ZcCbIuL2WtffCoSRdrZ7Z643dlBWynTHARhXevzr/p+hE
	tk9ryMvlljqbJsEfzg01onvgFCmBieJ6esClFuWBJBUlWxL+oLMwtDvGqA5643wkdqg=
X-Google-Smtp-Source: AGHT+IGzCyMkiwj/YP3LbD00WNG2RXenmrMQDoFsmqIS/jo8Fv0b7RVc57IknBJA0AH3gkC7/cdyfg==
X-Received: by 2002:a05:6000:2289:b0:391:3406:b4e2 with SMTP id ffacd0b85a97d-3a1f64ab40emr8303236f8f.49.1747037291070;
        Mon, 12 May 2025 01:08:11 -0700 (PDT)
Date: Mon, 12 May 2025 10:08:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
Message-ID: <aCGsaaoowoKvWEmb@macbook.lan>
References: <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
 <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
 <D9RJ9PK28QNQ.EKGYRHXWTYZ1@amd.com>
 <aB3d2FxH8JOxM5q9@macbook.lan>
 <cfec871c-4785-4c36-80fb-b1ddb461c5bb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfec871c-4785-4c36-80fb-b1ddb461c5bb@gmail.com>

On Fri, May 09, 2025 at 02:21:57PM -0400, Demi Marie Obenour wrote:
> On 5/9/25 6:50 AM, Roger Pau Monné wrote:
> > On Fri, May 09, 2025 at 11:47:36AM +0200, Alejandro Vallejo wrote:
> >>>>>>> A Linux driver that needs access to userspace memory
> >>>>>>> pages can get it in two different ways:
> >>>>>>>
> >>>>>>> 1. It can pin the pages using the pin_user_pages family of APIs.
> >>>>>>>    If these functions succeed, the driver is guaranteed to be able
> >>>>>>>    to access the pages until it unpins them.  However, this also
> >>>>>>>    means that the pages cannot be paged out or migrated.  Furthermore,
> >>>>>>>    file-backed pages cannot be safely pinned, and pinning GPU memory
> >>>>>>>    isn’t supported.  (At a minimum, it would prevent the pages from
> >>>>>>>    migrating from system RAM to VRAM, so all access by a dGPU would
> >>>>>>>    cross the PCIe bus, which would be very slow.)
> >>>>>>
> >>>>>> From a Xen p2m this is all fine - Xen will never remove pages from the
> >>>>>> p2m unless it's requested to.  So the pining, while needed on the Linux
> >>>>>> side, doesn't need to be propagated to Xen I would think.
> >>
> >> It might still be helpful to have the concept of pinning to avoid them
> >> being evicted for other reasons (ballooning?). I don't think it'd be
> >> sane to allow returning to Xen a page that a domain ever shared with a
> >> device.
> > 
> > If mapped using the p2m_mmio_direct type in the p2m a domain won't be
> > able to balloon them out.  It would also be misguided for a guest
> > kernel to attempt to balloon out memory that I presume will be inside
> > of a PCI device BAR from the guest point of view.
> 
> Indeed it will be inside a BAR.
> 
> >> re: being requested. Are there real promises from Xen to that effect? I
> >> could make a hypervisor oversubscribing on memory that swaps non-IOVA
> >> mem in and out to disk, moving it around all the time and it would be
> >> compliant with the current behaviour AIUI, but it wouldn't work with
> >> this scheme, because the mfn's would be off more often than not.
> > 
> > Even if Xen supported domain memory swapping, that could never be used
> > with domains that have devices attached, as it's not possible to fixup
> > the p2m on IOMMU fault and retry the access.
> > 
> > Not sure you could even move mfns around, as you would need an atomic
> > way to copy the previous page contents and set the PTE to point to the
> > new page.
> > 
> > Unless you want to get into a (IMO) complicated scheme where the
> > domain notifies the hypervisor which ranges are being used for device
> > DMA accesses (and thus requires guest kernel changes), I think
> > swapping of guest memory when there are assigned devices is a no-go.
> > 
> > Xen has (or had? as I never actually seen it being used) a mechanism
> > to swap domain memory to a dom0 file (see tools/xenpaging.c).  However
> > more than one provider had mentioned to me that one feature they
> > particularly preferred of Xen over KVM is that it would never swap
> > guest memory.  Not sure if that's still the case, but some struggled
> > to prevent KVM from swapping guest memory, and got complains of
> > slowness from their tenants.
> > 
> > For the purposes of getting a prototype I would suggest that you
> > assume p2m memory cannot be randomly swapped out, unless requested by
> > either the guest or the control domain.
> 
> The API being discussed here needs to support frontends that have
> assigned PCI devices, but the pages should never be mapped into
> the frontend domain’s IOMMU context.  If the frontend tries to
> DMA into one of these pages it’s a frontend bug.

That's a detail I didn't get from your previous description.  If
memory is not to be added to the IOMMU page-tables you will need an
extra flag or similar to signal this, as by default all memory added
to a guest p2m is also added to the IOMMU page-tables.  And when using
shared page-tables between the IOMMU and the CPU there's no way to add
mappings to the CPU only.

Do you really need such mappings to be added only to the p2m, and not
the IOMMU page-tables?  I don't think the pages "should never be
mapped", but rather "don't need to be mapped" as the implementation
won't support DMA accesses (iow: "never" is too strong in this
context).  IMO it is fine if for an initial prototype the pages are
also added to the IOMMU page-tables, and later you can add a flag (or
a new hypercall) that strictly only adds pages to the p2m and not the
IOMMU page-tables, it's likely to also be a good performance
improvement.

> >>>>> If pinning were enough things would be simple, but sadly it’s not.
> >>>>>
> >>>>>>> 2. It can grab the *current* location of the pages and register an
> >>>>>>>    MMU notifier.  This works for GPU memory and file-backed memory.
> >>>>>>>    However, when the invalidate_range function of this callback, the
> >>>>>>>    driver *must* stop all further accesses to the pages.
> >>>>>>>
> >>>>>>>    The invalidate_range callback is not allowed to block for a long
> >>>>>>>    period of time.  My understanding is that things like dirty page
> >>>>>>>    writeback are blocked while the callback is in progress.  My
> >>>>>>>    understanding is also that the callback is not allowed to fail.
> >>>>>>>    I believe it can return a retryable error but I don’t think that
> >>>>>>>    it is allowed to keep failing forever.
> >>>>>>>
> >>>>>>>    Linux’s grant table driver actually had a bug in this area, which
> >>>>>>>    led to deadlocks.  I fixed that a while back.
> >>>>>>>
> >>>>>>> KVM implements the second option: it maps pages into the stage-2
> >>>>>>> page tables (or shadow page tables, if that is chosen) and unmaps
> >>>>>>> them when the invalidate_range callback is called.
> >>
> >> I'm still lost as to what is where, who initiates what and what the end
> >> goal is. Is this about using userspace memory in dom0, and THEN sharing
> >> that with guests for as long as its live? And make enough magic so the
> >> guests don't notice the transitionary period in which there may not be
> >> any memory?
> >>
> >> Or is this about using domU memory for the driver living in dom0?
> >>
> >> Or is this about something else entirely?
> >>
> >> For my own education. Is the following sequence diagram remotely accurate?
> >>
> >> dom0                              domU
> >>  |                                  |
> >>  |---+                              |
> >>  |   | use gfn3 in the driver       |
> >>  |   | (mapped on user thread)      |
> >>  |<--+                              |
> >>  |                                  |
> >>  |  map mfn(gfn3) in domU BAR       |
> >>  |--------------------------------->|
> >>  |                              +---|
> >>  |              happily use BAR |   |
> >>  |                              +-->|
> >>  |---+                              |
> >>  |   | mmu notifier for gfn3        |
> >>  |   | (invalidate_range)           |
> >>  |<--+                              |
> >>  |                                  |
> >>  |  unmap mfn(gfn3)                 |
> >>  |--------------------------------->| <--- Plus some means to making guest 
> >>  |---+                          +---|      vCPUs pause on access.
> >>  |   | reclaim gfn3    block on |   |
> >>  |<--+                 access   |   |
> >>  |                              |   |
> >>  |---+                          |   |
> >>  |   | use gfn7 in the driver   |   |
> >>  |   | (mapped on user thread)  |   |
> >>  |<--+                          |   |
> >>  |                              |   |
> >>  |  map mfn(gfn7) in domU BAR   |   |
> >>  |------------------------------+-->| <--- Unpause blocked domU vCPUs
> > 
> > The guest vCPU will already pause on access if there's a p2m
> > violation, until the ioreq has completed and the vCPU execution can
> > resume.  That's in control of the ioreq server that handles the
> > request.
> > 
> > I don't know about the dom0 user-space part, but that's possibly of no
> > concern for the implementation side in Xen?
> 
> I believe so, yes.
> 
> > My understanding of the actions needed from the Xen side is:
> > 
> >  1. Map either RAM owned by the hardware domain or an MMIO page into
> >     a domain p2m.
> >  2. Remove entries from a domain p2m.
> >  3. Handle p2m violations resulting from guest accesses, using 1. and
> >     force a guest access retry (or emulate the access).
> > 
> > 1. Can possibly be done with XEN_DOMCTL_memory_mapping and
> > XENMEM_add_to_physmap_batch, but as I understood it it's not ideal.
> > Demi would like a way to use the same hypercall to map either RAM or
> > IOMEM into a domain p2m.
> 
> Indeed so, and also the backend domain might be a driver domain instead
> of the hardware domain.  It needs to have privilege over the frontend,
> but it should not need privilege over the whole system.

This can all be arranged for, I wouldn't get bugged down on this
details initially.

> > 2. What hypercall to use depends on how the memory is mapped.
> > 
> > 3. ioreq servers will already get requests for accesses to unmapped
> > regions they have registered for.  If the access is to be retried we
> > need to expand ioreq interface a bit to handle this case.  Adding a
> > new ioreq state like STATE_IORESP_RETRY might be enough?  Maybe I'm
> > being naive though.
> 
> This is where an implementation in a real userspace emulator would
> be very useful, to ensure that the API being implemented is actually
> usable in practice.

My suggestion for adding a "retry" response type to the ioreq
interface was so that your ioreq model implementation would be
simpler.  However if that's more hassle for you, I would initially map
and emulate the access, as that would also be correct and shouldn't
require any changes to the ioreq interface.  It can always be expanded
later to support a map and retry model.

AFAICT, from the ongoing discussion above, the only uncertainty is
which hypercall(s) to use to map either MMIO or RAM into a guest p2m.
I wouldn't invest a huge amount of time into prototyping something
very complex, and rather get a very simple hypercall implemented that
fits your needs.  You could likely make a frankenhypercall based on the
implementations of XEN_DOMCTL_memory_mapping and
XENMEM_add_to_physmap, so that you can get a prototype working.

I think at this point it's important to get a functional prototype, so
that we know exactly the requirements of the interfaces that you need.
I wouldn't bother to design a detailed interface until we know exactly
that such interface is suitable for your goals, and to that end we
need a prototype with whatever you can glue together.

Regards, Roger.

