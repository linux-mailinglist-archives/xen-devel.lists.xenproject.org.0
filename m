Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99D9AB0DDC
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 10:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979864.1366363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJU8-0002yb-UM; Fri, 09 May 2025 08:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979864.1366363; Fri, 09 May 2025 08:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJU8-0002vT-RB; Fri, 09 May 2025 08:53:36 +0000
Received: by outflank-mailman (input) for mailman id 979864;
 Fri, 09 May 2025 08:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMqf=XZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uDJU7-0002vN-Mf
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 08:53:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167f31fd-2cb3-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 10:53:33 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso12135475e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 01:53:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f5a4cc2esm2608437f8f.90.2025.05.09.01.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:53:32 -0700 (PDT)
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
X-Inumbo-ID: 167f31fd-2cb3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746780813; x=1747385613; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FeHJ+5duaoOXuLNSG7JYnGnc3BvwUMlD8pqjJhdAsmI=;
        b=GLnVjiL6F3Pg2mm127awdcDTHBvYFIpo7YSVzHCZpSb6XP5qKABFeyOa1GaI7CfMzu
         UOrnbCi5+cAeLhcktuwMEGKlsTq5h0EvRZ7ET8KIVQxgy2kumwJ/TMSzZP5EDFIWdvKt
         4WFgq8FNxn1e5rx9bkQM2pZvG63phX6XRm3yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780813; x=1747385613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeHJ+5duaoOXuLNSG7JYnGnc3BvwUMlD8pqjJhdAsmI=;
        b=MpTpTA29nEkr3iYfU3nExazu95RnuU3xCL2CSt8NqxICihpQwq/6A1cIDjOIBk+YDl
         vlMKi83/twyiUJEIBfr388/DBJ8MO3Al9Uti6BNd+jew/Dp02dtZyeqjVziyXMUV8xh6
         +TLKUKlFMeID5kA+rcJVKK9a9g2BvVfhmKZTAubBYsMd8GxYNL2/IN0nN/44vX3rC6xS
         /IJ1GSYgSeFeq/JZspRH62pK95+N4vlcsPZ6Klow3q06RU+3S0hzr6dbTkNrscdgulFG
         HSBDdmzZPMMlJOQbnwi2k5cCpqC12nx1Ss7qa+Wnx85e6rhBcVzC7jCCspvBv0JUfiZz
         sPVw==
X-Forwarded-Encrypted: i=1; AJvYcCVIe00vElLBUfRr7/NayttBpn/xnstMACKgESeiN+gDmoU9xeTRPpoEe31gy2ahNXkQSh3fwVbSvzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1A+eO8aTWYWIp7rpW2xe//0jIm/SuW3AxbeDs+mBY/YLVpM66
	Kqwkh0z0M1TmlytoQ2QoC2a5hO9g5KdB2SL4TGTYsLSXIAKuPtisiegs8LWdz2g=
X-Gm-Gg: ASbGncvQ5KVdHajqOOuMV6VLJoIXlFQAGtJO2LCUh9YOa0Szf64zg6Rt3pCO5Cui4UH
	NgLudN4y1KwJmmVFgek3Y1By0vW9rQK98KFO3XuMa4JmbI8/Us4k4bYY+PmQdbzVNeltJONw+Ti
	E8rZ7981k6K1Y+Ne8KGB0SRwqgHroHU336li36Ki4/GNZKzmk4gPpA6gNVS+ZvxRVWkZS11+1tT
	HjkD4lx5kr26HvlG7HiLYUGqLwC/o8uLiga2Oos72YMHJ13pTub5452RXTTNkZ1LZ+8KjPGPn5A
	8Cqa+XDPhG8TxB+vKDac0ri8GK9Adav3XEbztKKyIXJrmVjDvZswGztY
X-Google-Smtp-Source: AGHT+IEfBkk8+Thr9UsmUcJiEGjSJh3YIPTjfONmG7mUHZ4NeTKVvva3PIgVOVDHe9F777Jrc5y/Ow==
X-Received: by 2002:a05:600c:3587:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-442d6dd2378mr15367705e9.23.1746780812972;
        Fri, 09 May 2025 01:53:32 -0700 (PDT)
Date: Fri, 9 May 2025 10:53:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
Message-ID: <aB3CixUoTN0dBODM@macbook.lan>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
 <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>

On Fri, May 09, 2025 at 12:52:28AM -0400, Demi Marie Obenour wrote:
> On 5/8/25 3:52 AM, Roger Pau Monné wrote:
> > On Wed, May 07, 2025 at 08:36:07PM -0400, Demi Marie Obenour wrote:
> >> On 5/7/25 1:39 PM, Roger Pau Monné wrote:
> >>> On Tue, May 06, 2025 at 04:56:12PM -0400, Demi Marie Obenour wrote:
> >>>> On 5/6/25 9:06 AM, Alejandro Vallejo wrote:
> >>>>> On Tue May 6, 2025 at 3:02 AM CEST, Demi Marie Obenour wrote:
> >>>>>> On 5/5/25 7:32 AM, Alejandro Vallejo wrote:
> >>>>>>> I suppose this is still about multiplexing the GPU driver the way we
> >>>>>>> last discussed at Xen Summit?
> >>>>>>>
> >>>>>>> On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
> >>>>>>>> What are the appropriate Xen internal functions for:
> >>>>>>>>
> >>>>>>>> 1. Turning a PFN into an MFN?
> >>>>>>>> 2. Mapping an MFN into a guest?
> >>>>>>>> 3. Unmapping that MFN from a guest?
> >>>>>>>
> >>>>>>> The p2m is the single source of truth about such mappings.
> >>>>>>>
> >>>>>>> This is all racy business. You want to keep the p2m lock for the full
> >>>>>>> duration of whatever operation you wish do, or you risk another CPU
> >>>>>>> taking it and pulling the rug under your feet at the most inconvenient
> >>>>>>> time.
> >>>>>>>
> >>>>>>> In general all this faff is hidden under way too many layers beneath
> >>>>>>> copy_{to,from}_guest(). Other p2m manipulation high-level constructs
> >>>>>>> that might do interesting things worth looking at may be {map,unmap}_mmio_region()
> >>>>>>>
> >>>>>>> Note that not every pfn has an associated mfn. Not even every valid pfn
> >>>>>>> has necessarily an associated mfn (there's pod). And all of this is
> >>>>>>> volatile business in the presence of a baloon driver or vPCI placing
> >>>>>>> mmio windows over guest memory.
> >>>>>>
> >>>>>> Can I check that POD is not in use?  
> >>>>>
> >>>>> Maybe, but now you're reaching exponential complexity considering each
> >>>>> individual knob of the p2m into account.
> >>>>>
> >>>>>>
> >>>>>>> In general anything up this alley would need a cohesive pair for
> >>>>>>> map/unmap and a credible plan for concurrency and how it's all handled
> >>>>>>> in conjunction with other bits that touch the p2m.
> >>>>>>
> >>>>>> Is taking the p2m lock for the entire operation a reasonable approach
> >>>>>> for concurrency?  Will this cause too much lock contention?
> >>>>>
> >>>>> Maybe. It'd be fine for a page. Likely not so for several GiB if they
> >>>>> aren't already superpages.
> >>>>>
> >>>>>>
> >>>>>>>> The first patch I am going to send with this information is a documentation
> >>>>>>>> patch so that others do not need to figure this out for themselves.
> >>>>>>>> I remember being unsure even after looking through the source code, which
> >>>>>>>> is why I am asking here.
> >>>>>>>
> >>>>>>> That's not surprising. There's per-arch stuff, per-p2mtype stuff,
> >>>>>>> per-guesttype stuff. Plus madness like on-demand memory. It's no wonder
> >>>>>>> such helpers don't exist and the general manipulations are hard to
> >>>>>>> explain.
> >>>>>>
> >>>>>> Is this a task that is only suitable for someone who has several years
> >>>>>> experience working on Xen, or is it something that would make sense for
> >>>>>> someone who is less experienced?
> >>>>>
> >>>>> The p2m is a very complex beast that integrates more features than I
> >>>>> care to count. It requires a lot of prior knowledge. Whoever does it
> >>>>> must know Xen fairly well in many configurations.
> >>>>>
> >>>>> The real problem is finding the right primitives that do what you want
> >>>>> without overcomplicating everything else, preserving system security
> >>>>> invariants and have benign (and ideally clear) edge cases.
> >>>>>
> >>>>> This was the last email you sent (I think?). Has any of the requirements
> >>>>> changed in any direction?
> >>>>>
> >>>>>   https://lore.kernel.org/xen-devel/Z5794ysNE4KDkFuT@itl-email/
> >>>>
> >>>> Map and Revoke are still needed, with the same requirements as described
> >>>> in this email.  Steal and Return were needed for GPU shared virtual memory,
> >>>> but it has been decided to not support this with virtio-GPU, so these
> >>>> primitives are no longer needed.
> >>>>
> >>>>> Something I'm missing there is how everything works without Xen. That
> >>>>> might help (me, at least) guage what could prove enough to support the
> >>>>> usecase. Are there sequence diagrams anywhere about how this whole thing
> >>>>> works without Xen? I vaguely remember you showing something last year in
> >>>>> Xen Summit in the design session, but my memory isn't that good :)
> >>>
> >>> Hello,
> >>>
> >>> Sorry, possibly replying a bit out of context here.
> >>>
> >>> Since I will mention this in several places: p2m is the second stage
> >>> page-tables used by Xen for PVH and HVM guests.  A p2m violation is
> >>> the equivalent of a page-fault for guest p2m accesses.
> >>>
> >>>> A Linux driver that needs access to userspace memory
> >>>> pages can get it in two different ways:
> >>>>
> >>>> 1. It can pin the pages using the pin_user_pages family of APIs.
> >>>>    If these functions succeed, the driver is guaranteed to be able
> >>>>    to access the pages until it unpins them.  However, this also
> >>>>    means that the pages cannot be paged out or migrated.  Furthermore,
> >>>>    file-backed pages cannot be safely pinned, and pinning GPU memory
> >>>>    isn’t supported.  (At a minimum, it would prevent the pages from
> >>>>    migrating from system RAM to VRAM, so all access by a dGPU would
> >>>>    cross the PCIe bus, which would be very slow.)
> >>>
> >>> From a Xen p2m this is all fine - Xen will never remove pages from the
> >>> p2m unless it's requested to.  So the pining, while needed on the Linux
> >>> side, doesn't need to be propagated to Xen I would think.
> >>
> >> If pinning were enough things would be simple, but sadly it’s not.
> >>
> >>>> 2. It can grab the *current* location of the pages and register an
> >>>>    MMU notifier.  This works for GPU memory and file-backed memory.
> >>>>    However, when the invalidate_range function of this callback, the
> >>>>    driver *must* stop all further accesses to the pages.
> >>>>
> >>>>    The invalidate_range callback is not allowed to block for a long
> >>>>    period of time.  My understanding is that things like dirty page
> >>>>    writeback are blocked while the callback is in progress.  My
> >>>>    understanding is also that the callback is not allowed to fail.
> >>>>    I believe it can return a retryable error but I don’t think that
> >>>>    it is allowed to keep failing forever.
> >>>>
> >>>>    Linux’s grant table driver actually had a bug in this area, which
> >>>>    led to deadlocks.  I fixed that a while back.
> >>>>
> >>>> KVM implements the second option: it maps pages into the stage-2
> >>>> page tables (or shadow page tables, if that is chosen) and unmaps
> >>>> them when the invalidate_range callback is called.
> >>>
> >>> I assume this map and unmap is done by the host as a result of some
> >>> guest action?
> >>
> >> Unmapping can happen at any time for any or no reason.  Semantically,
> >> it would be correct to only map the pages in response to a p2m violation,
> >> but for performance it might be better to map the pages eagerly instead.
> > 
> > That's an implementation detail, you can certainly map the pages
> > eagerly, or even map multiple contiguous pages as a result of a single
> > p2m violation.
> > 
> > I would focus on making a functioning prototype first, performance
> > comes afterwards.
> 
> Makes sense.
> 
> >>>> Furthermore,
> >>>> if a page fault happens while the page is unmapped, KVM will try
> >>>> to bring the pages back into memory so the guest can access it.
> >>>
> >>> You could likely handle this in Xen in the following way:
> >>>
> >>>  - A device model will get p2m violations forwarded, as it's the same
> >>>    model that's used to handle emulation of device MMIO.  You will
> >>>    need to register an ioreq server to request those faults to be
> >>>    forwarded, I think the hardware domain kernel will handle those?
> >>>
> >>>  - Allow ioreqs to signal to Xen that a guest operation must be
> >>>    retried.  IOW: resume guest execution without advancing the IP.
> >>>
> >>> I think this last bit is the one that will require changes to Xen, so
> >>> that you can add a type of ioreq reply that implies a retry from the
> >>> guest context.
> >> I’m not actually sure if this is needed, though it would be nice.  It
> >> might be possible for Xen to instead emulate the current instruction and
> >> continue, with the ioreq server just returning the current value of the
> >> pages.
> > 
> > You can, indeed, but it's cumbersome?  You might have to map the page
> > in the context of the entity that implements the ioreq server to
> > access the data.  Allowing retries would be more generic, and reduce
> > the code in the ioreq server handler, that would only map the page
> > to the guest p2m and request a retry.
> 
> Yeah, it is cumbersome indeed.
> 
> >> What I’m more concerned about is being able to provide a page
> >> into the p2m so that the *next* access doesn’t fault, and being able
> >> to remove that page from the p2m so that the next access *does* fault.
> > 
> > Maybe I'm not getting the question right, all Xen modifications to the
> > p2m take immediate effect.  By the time a XEN_DOMCTL_memory_mapping
> > hypercall returns the operation would have taken effect.
> 
> Ah, that makes sense.  When revoking access, can XEN_DOMCTL_iomem_permission
> and XEN_DOMCTL_memory_mapping fail even if the parameters are correct and
> the caller has enough permissions, or will they always succeed?

They can fail, but not for a guest induced reason.

For example XEN_DOMCTL_iomem_permission manipulates a rangeset and
revoking access might require a range to be split, and hence memory
allocated.  That allocation of memory can fail, but that's not under
guest control.

> >> Are there any hypercalls that can be used for these operations right
> >> now?
> > 
> > With some trickery you could likely use XEN_DOMCTL_memory_mapping to
> > add and remove those pages.  You will need calls to
> > XEN_DOMCTL_iomem_permission beforehand so that you grant the receiving
> > domain permissions to access those (and of course the granting domain
> > needs to have full access to them).
> > 
> > This is no ideal if mapping RAM pages, AFAICT there are no strict
> > checks that the added page is not RAM, but still you will need to
> > handle RAM pages as IOMEM so and grant them using
> > XEN_DOMCTL_iomem_permission which is not great.  Also note that this
> > is a domctl, so not stable.  It might however be enough for a
> > prototype.
> 
> Unfortunately this won’t work if the backend is a PVH domain, as a PVH
> domain doesn’t know its own MFNs.  It also won’t work for deprivileged
> backends because XEN_DOMCTL_iomem_permission is subject to XSA-77.

Hm, I think solving this will be complicated using a single hypercall,
because you have to deal with both MMIO and RAM, which are
traditionally handled differently in Xen, also when mapped in the
p2m.

You could possibly use XENMEM_add_to_physmap_batch to create a foreign
mapping in a remote guest p2m when mapping RAM, and
XEN_DOMCTL_memory_mapping when mapping IOMEM.  But that requires the
emulator/mediator to know when it's attempting to map RAM or IOMEM
(which I think you wanted to avoid?)

Otherwise a new XENMEM_add_to_physmap{,_batch} `phys_map_space` option
needs to be added to cater for your requirements.

> > Long term I think we want to expand XENMEM_add_to_physmap{,_batch} to
> > handle this use-case.
> 
> That would indeed be better.
> 
> >> If not, which Xen functions would one use to implement them?
> >> Some notes:
> >>
> >> - The p2m might need to be made to point to a PCI BAR or system RAM.
> >>   The guest kernel and host userspace don’t know which, and in any
> >>   case don’t need to care.  The host kernel knows, but I don’t know
> >>   if the information is exposed to the Xen driver.
> > 
> > Hm, as said above, while you could possible handle RAM as IOMEM, it
> > has the slight inconvenience of having to add such RAM pages to the
> > d->iomem_caps rangeset for XEN_DOMCTL_memory_mapping to succeed.
> > 
> > From a guest PoV, it doesn't matter if the underlying page is RAM or
> > MMIO, as long as it's mapped in the p2m.
> 
> Understood, thanks!
> 
> >> - If the p2m needs to point to system RAM, the RAM will be memory
> >>   that belongs to the backend.
> >>
> >> - If the p2m needs to point to a PCI BAR, it will initially need
> >>   to point to a real PCI device that is owned by the backend.
> > 
> > As long as you give the destination domain access to the page using
> > XEN_DOMCTL_iomem_permission prior to the XEN_DOMCTL_memory_mapping
> > call it should work.
> > 
> > How does this work for device DMA accesses?  If the device is assigned
> > to the backend domain (and thus using the backend domain IOMMU context
> > entry and page-tables) DMA accesses cannot be done against guest
> > provided addresses, there needs to be some kind of translation layer
> > that filters commands?
> 
> Thankfully, this is handled by the backend.

Oh, I see.  So the device IOMMU context is always set to the hardware
domain one, and the emulator handles all the translation required?

Thanks, Roger.

