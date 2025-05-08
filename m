Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45987AAF504
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 09:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979034.1365766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCw3n-00071k-0f; Thu, 08 May 2025 07:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979034.1365766; Thu, 08 May 2025 07:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCw3m-0006zj-T2; Thu, 08 May 2025 07:52:50 +0000
Received: by outflank-mailman (input) for mailman id 979034;
 Thu, 08 May 2025 07:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCw3l-0006zc-N7
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 07:52:49 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f75b134-2be1-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 09:52:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so6093335e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 00:52:48 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd38179csm27202985e9.39.2025.05.08.00.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 00:52:47 -0700 (PDT)
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
X-Inumbo-ID: 6f75b134-2be1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746690768; x=1747295568; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f3PrLJDUYUU3YfJ9W2ToLgnF6ou64u7VpIA85WA5OSo=;
        b=LkW3dooyNNxkd4T7bopthrKm7f2IaQRFg4FxnZEr1aB+Rz8ga2VfP7ysaf8b+5yfr1
         0L9LkL/uaFy+/4CSbn58nB3q7AfoBpghp7Vr3zOP2n/zW0Z8dN+gjS7OHKwEE5rmDnqK
         eeHqF9kWjuOzPw7JNnLFxjTHJqFJZLYBBLtuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690768; x=1747295568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3PrLJDUYUU3YfJ9W2ToLgnF6ou64u7VpIA85WA5OSo=;
        b=b/rckqBy95/mfhOMjeTF3PGNbfngd+7xAModPAhUwu6ig7hvq8yUhuktAR3aaJ/Yum
         b1krpxXlfoiB9D9j/d94AYHzN+8oeM8EMJ8XEh9Xxw3AsIDkbtxCE57KtE8Rn90hsQXd
         cSwI9P4Yp34ck8Qi839ktWZf1FU7qcAJQaj6dcWhSzq0OgNySMgyEDzu2jTPOn6qBBm8
         lX+eol777Km2EkE0YQkFx9gnfuYN4dHHVQoQHLvn2p9sJtX2A9N4btF5w4FM7CCUZcub
         Xg8iGdpO3PfvxTEdGNS46DU/+vb02WekxCmtpb9y7utVnfYX9D58xNdSMkhcqnb5j/5w
         Gjig==
X-Forwarded-Encrypted: i=1; AJvYcCWrIHWY1As+J+jeObT1NVLzaYRzOHdB4gf2573jrfSdJW3l1XRe9VLQunwl+DYpkJncYRWBLa1HGdM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3lzu9oQqrora6IVk/t1nDzXPq/HVNsv8j1Sp8u5YiLqsD37Qz
	a2IyxZ8fTwYasUIIJrsGSZ+ZeJUEalURuM9FwAs/fWf4XNH9ChEtT2dzfzyL6jA=
X-Gm-Gg: ASbGncu8i/jttQ7yaIkSgPYk2QRrnxT/Xvz9Sm9I0oRgesNtsaf2qmb1nr/Kga6wl4s
	++qgPKK49eZFHM4voKXphJS5Q7wgqXNvQaYfFbRvR8yCJb2GtMQPZdkRAFr/ZoWczsDdLkd+ubs
	7Br/0PEr7pzThllWOut4UmMZfhnc0paxBEANcdCfzDYwN1o7+RB4RINMqdaZpxt9SD49H8UBOfQ
	ZfikVGnmNZ/UIB8qquM+vrXc/ZjpmDuy79/KWMMr8VyGlHGrx9yV5FNOGhmUX6XgwQiojkyfxdC
	BMfraP5JFbX6axwyfozNKG95XSR9JvJo4CiQvMOkVHThCA==
X-Google-Smtp-Source: AGHT+IFC1DyF4d+X5J3BxbLb2CnYYX+Er6gtoQAzdbxu7TwNyk7ObTMx4o7w8u4j2nPP9eRdM+vWUQ==
X-Received: by 2002:a05:600c:83c4:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-442d033f8cemr19606855e9.24.1746690767933;
        Thu, 08 May 2025 00:52:47 -0700 (PDT)
Date: Thu, 8 May 2025 09:52:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
Message-ID: <aBxizlMj3D94M3WS@macbook.lan>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>

On Wed, May 07, 2025 at 08:36:07PM -0400, Demi Marie Obenour wrote:
> On 5/7/25 1:39 PM, Roger Pau Monné wrote:
> > On Tue, May 06, 2025 at 04:56:12PM -0400, Demi Marie Obenour wrote:
> >> On 5/6/25 9:06 AM, Alejandro Vallejo wrote:
> >>> On Tue May 6, 2025 at 3:02 AM CEST, Demi Marie Obenour wrote:
> >>>> On 5/5/25 7:32 AM, Alejandro Vallejo wrote:
> >>>>> I suppose this is still about multiplexing the GPU driver the way we
> >>>>> last discussed at Xen Summit?
> >>>>>
> >>>>> On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
> >>>>>> What are the appropriate Xen internal functions for:
> >>>>>>
> >>>>>> 1. Turning a PFN into an MFN?
> >>>>>> 2. Mapping an MFN into a guest?
> >>>>>> 3. Unmapping that MFN from a guest?
> >>>>>
> >>>>> The p2m is the single source of truth about such mappings.
> >>>>>
> >>>>> This is all racy business. You want to keep the p2m lock for the full
> >>>>> duration of whatever operation you wish do, or you risk another CPU
> >>>>> taking it and pulling the rug under your feet at the most inconvenient
> >>>>> time.
> >>>>>
> >>>>> In general all this faff is hidden under way too many layers beneath
> >>>>> copy_{to,from}_guest(). Other p2m manipulation high-level constructs
> >>>>> that might do interesting things worth looking at may be {map,unmap}_mmio_region()
> >>>>>
> >>>>> Note that not every pfn has an associated mfn. Not even every valid pfn
> >>>>> has necessarily an associated mfn (there's pod). And all of this is
> >>>>> volatile business in the presence of a baloon driver or vPCI placing
> >>>>> mmio windows over guest memory.
> >>>>
> >>>> Can I check that POD is not in use?  
> >>>
> >>> Maybe, but now you're reaching exponential complexity considering each
> >>> individual knob of the p2m into account.
> >>>
> >>>>
> >>>>> In general anything up this alley would need a cohesive pair for
> >>>>> map/unmap and a credible plan for concurrency and how it's all handled
> >>>>> in conjunction with other bits that touch the p2m.
> >>>>
> >>>> Is taking the p2m lock for the entire operation a reasonable approach
> >>>> for concurrency?  Will this cause too much lock contention?
> >>>
> >>> Maybe. It'd be fine for a page. Likely not so for several GiB if they
> >>> aren't already superpages.
> >>>
> >>>>
> >>>>>> The first patch I am going to send with this information is a documentation
> >>>>>> patch so that others do not need to figure this out for themselves.
> >>>>>> I remember being unsure even after looking through the source code, which
> >>>>>> is why I am asking here.
> >>>>>
> >>>>> That's not surprising. There's per-arch stuff, per-p2mtype stuff,
> >>>>> per-guesttype stuff. Plus madness like on-demand memory. It's no wonder
> >>>>> such helpers don't exist and the general manipulations are hard to
> >>>>> explain.
> >>>>
> >>>> Is this a task that is only suitable for someone who has several years
> >>>> experience working on Xen, or is it something that would make sense for
> >>>> someone who is less experienced?
> >>>
> >>> The p2m is a very complex beast that integrates more features than I
> >>> care to count. It requires a lot of prior knowledge. Whoever does it
> >>> must know Xen fairly well in many configurations.
> >>>
> >>> The real problem is finding the right primitives that do what you want
> >>> without overcomplicating everything else, preserving system security
> >>> invariants and have benign (and ideally clear) edge cases.
> >>>
> >>> This was the last email you sent (I think?). Has any of the requirements
> >>> changed in any direction?
> >>>
> >>>   https://lore.kernel.org/xen-devel/Z5794ysNE4KDkFuT@itl-email/
> >>
> >> Map and Revoke are still needed, with the same requirements as described
> >> in this email.  Steal and Return were needed for GPU shared virtual memory,
> >> but it has been decided to not support this with virtio-GPU, so these
> >> primitives are no longer needed.
> >>
> >>> Something I'm missing there is how everything works without Xen. That
> >>> might help (me, at least) guage what could prove enough to support the
> >>> usecase. Are there sequence diagrams anywhere about how this whole thing
> >>> works without Xen? I vaguely remember you showing something last year in
> >>> Xen Summit in the design session, but my memory isn't that good :)
> > 
> > Hello,
> > 
> > Sorry, possibly replying a bit out of context here.
> > 
> > Since I will mention this in several places: p2m is the second stage
> > page-tables used by Xen for PVH and HVM guests.  A p2m violation is
> > the equivalent of a page-fault for guest p2m accesses.
> > 
> >> A Linux driver that needs access to userspace memory
> >> pages can get it in two different ways:
> >>
> >> 1. It can pin the pages using the pin_user_pages family of APIs.
> >>    If these functions succeed, the driver is guaranteed to be able
> >>    to access the pages until it unpins them.  However, this also
> >>    means that the pages cannot be paged out or migrated.  Furthermore,
> >>    file-backed pages cannot be safely pinned, and pinning GPU memory
> >>    isn’t supported.  (At a minimum, it would prevent the pages from
> >>    migrating from system RAM to VRAM, so all access by a dGPU would
> >>    cross the PCIe bus, which would be very slow.)
> > 
> > From a Xen p2m this is all fine - Xen will never remove pages from the
> > p2m unless it's requested to.  So the pining, while needed on the Linux
> > side, doesn't need to be propagated to Xen I would think.
> 
> If pinning were enough things would be simple, but sadly it’s not.
> 
> >> 2. It can grab the *current* location of the pages and register an
> >>    MMU notifier.  This works for GPU memory and file-backed memory.
> >>    However, when the invalidate_range function of this callback, the
> >>    driver *must* stop all further accesses to the pages.
> >>
> >>    The invalidate_range callback is not allowed to block for a long
> >>    period of time.  My understanding is that things like dirty page
> >>    writeback are blocked while the callback is in progress.  My
> >>    understanding is also that the callback is not allowed to fail.
> >>    I believe it can return a retryable error but I don’t think that
> >>    it is allowed to keep failing forever.
> >>
> >>    Linux’s grant table driver actually had a bug in this area, which
> >>    led to deadlocks.  I fixed that a while back.
> >>
> >> KVM implements the second option: it maps pages into the stage-2
> >> page tables (or shadow page tables, if that is chosen) and unmaps
> >> them when the invalidate_range callback is called.
> > 
> > I assume this map and unmap is done by the host as a result of some
> > guest action?
> 
> Unmapping can happen at any time for any or no reason.  Semantically,
> it would be correct to only map the pages in response to a p2m violation,
> but for performance it might be better to map the pages eagerly instead.

That's an implementation detail, you can certainly map the pages
eagerly, or even map multiple contiguous pages as a result of a single
p2m violation.

I would focus on making a functioning prototype first, performance
comes afterwards.

> >> Furthermore,
> >> if a page fault happens while the page is unmapped, KVM will try
> >> to bring the pages back into memory so the guest can access it.
> > 
> > You could likely handle this in Xen in the following way:
> > 
> >  - A device model will get p2m violations forwarded, as it's the same
> >    model that's used to handle emulation of device MMIO.  You will
> >    need to register an ioreq server to request those faults to be
> >    forwarded, I think the hardware domain kernel will handle those?
> > 
> >  - Allow ioreqs to signal to Xen that a guest operation must be
> >    retried.  IOW: resume guest execution without advancing the IP.
> > 
> > I think this last bit is the one that will require changes to Xen, so
> > that you can add a type of ioreq reply that implies a retry from the
> > guest context.
> I’m not actually sure if this is needed, though it would be nice.  It
> might be possible for Xen to instead emulate the current instruction and
> continue, with the ioreq server just returning the current value of the
> pages.

You can, indeed, but it's cumbersome?  You might have to map the page
in the context of the entity that implements the ioreq server to
access the data.  Allowing retries would be more generic, and reduce
the code in the ioreq server handler, that would only map the page
to the guest p2m and request a retry.

> What I’m more concerned about is being able to provide a page
> into the p2m so that the *next* access doesn’t fault, and being able
> to remove that page from the p2m so that the next access *does* fault.

Maybe I'm not getting the question right, all Xen modifications to the
p2m take immediate effect.  By the time a XEN_DOMCTL_memory_mapping
hypercall returns the operation would have taken effect.

> Are there any hypercalls that can be used for these operations right
> now?

With some trickery you could likely use XEN_DOMCTL_memory_mapping to
add and remove those pages.  You will need calls to
XEN_DOMCTL_iomem_permission beforehand so that you grant the receiving
domain permissions to access those (and of course the granting domain
needs to have full access to them).

This is no ideal if mapping RAM pages, AFAICT there are no strict
checks that the added page is not RAM, but still you will need to
handle RAM pages as IOMEM so and grant them using
XEN_DOMCTL_iomem_permission which is not great.  Also note that this
is a domctl, so not stable.  It might however be enough for a
prototype.

Long term I think we want to expand XENMEM_add_to_physmap{,_batch} to
handle this use-case.

> If not, which Xen functions would one use to implement them?
> Some notes:
> 
> - The p2m might need to be made to point to a PCI BAR or system RAM.
>   The guest kernel and host userspace don’t know which, and in any
>   case don’t need to care.  The host kernel knows, but I don’t know
>   if the information is exposed to the Xen driver.

Hm, as said above, while you could possible handle RAM as IOMEM, it
has the slight inconvenience of having to add such RAM pages to the
d->iomem_caps rangeset for XEN_DOMCTL_memory_mapping to succeed.

From a guest PoV, it doesn't matter if the underlying page is RAM or
MMIO, as long as it's mapped in the p2m.

> 
> - If the p2m needs to point to system RAM, the RAM will be memory
>   that belongs to the backend.
> 
> - If the p2m needs to point to a PCI BAR, it will initially need
>   to point to a real PCI device that is owned by the backend.

As long as you give the destination domain access to the page using
XEN_DOMCTL_iomem_permission prior to the XEN_DOMCTL_memory_mapping
call it should work.

How does this work for device DMA accesses?  If the device is assigned
to the backend domain (and thus using the backend domain IOMMU context
entry and page-tables) DMA accesses cannot be done against guest
provided addresses, there needs to be some kind of translation layer
that filters commands?

My initial recommendation would be to look into what you can do with
the existing XEN_DOMCTL_iomem_permission and XEN_DOMCTL_memory_mapping
hypercalls.

> - The switch from “emulated MMIO” to “MMIO or real RAM” needs to
>   be atomic from the guest’s perspective.

Updates of p2m PTEs are always atomic.

Regards, Roger.

