Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57546AAE807
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 19:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978762.1365646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCijb-0004IB-S7; Wed, 07 May 2025 17:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978762.1365646; Wed, 07 May 2025 17:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCijb-0004Fd-Od; Wed, 07 May 2025 17:39:07 +0000
Received: by outflank-mailman (input) for mailman id 978762;
 Wed, 07 May 2025 17:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCija-0004FX-OW
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 17:39:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b5e20e8-2b6a-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 19:39:04 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso900605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 10:39:04 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd34bbf6sm8028495e9.17.2025.05.07.10.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 10:39:03 -0700 (PDT)
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
X-Inumbo-ID: 2b5e20e8-2b6a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746639544; x=1747244344; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/tgRvNnN4dj5OAA3PiLmvZIo6ZwEQWR1JUck2gajrc=;
        b=UFj7TIrlkFRZJpSwFTwkV3tqTrG2MWWxgtAh2idkuYV4MGyqrjdnt2pUIQQpv+lfni
         r4CnD2hOAnkz434U/ffdEPP/Eb7Oiz08Bz1C69xiE1IQ4IEUVeUkn/3UBJ4Ff/cxH6A7
         qdg8CcPFghFYnCmmquqmyVSAkJZOAW1Celcsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639544; x=1747244344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/tgRvNnN4dj5OAA3PiLmvZIo6ZwEQWR1JUck2gajrc=;
        b=o/zEYp5slchb/ZM/UqjMsxa59m2Xx6rFWyHYMo7ReENY84qhBInsqsFUCdiC7lHNmJ
         E2wjJ/YF/hsvId+dT7ztIkP+eHA9yAGve9o4a0CKb0/CajT0P4dmAfKVWnGexIHGWmvR
         59rxorgrVoCLHUJ3N8WCAUuVr9WcgRtiePbf0JFwLlfLz2BjMH56BZKUwnBr3c/Aec7f
         SSKyqRmYW/PQLFxHXuqVwBJl74Y4T5mAyL0J8ChyJuTfrBTy+MWi1kGvv1KIcJq9HDaf
         2G12TifeTxFSc6wq13JMEFT74TrP/UYasknFr+7oVtPZq+YrmYjJp+h1SKvsHijBQcbp
         IiKg==
X-Forwarded-Encrypted: i=1; AJvYcCWG4eROLRLt0qBVBNFwxUamzXY70k+/clrhFZCPMOVDCJ5v84J4XtPI0mkeATf/wvCAU9h4T5C2QoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3D+g2YkxO/ycI56TlFaKNTZ4/SrNAZ3JPayeBJp+SYgmhhf/b
	xcW328GC8vp8Bhgc2PNgGlIaYCzbvvC73CxD3NUTJq6DUv3meqQ0Uk4H6nCiZXE=
X-Gm-Gg: ASbGncufLppjNFMUFwoahRTW5u/aiBRoq5nV9DQdlNt4S1FiNPPFFAo1LT0KNrabtx+
	zx0sIVZ3+tji3pzB0RXqzaj44/PkxUAaaUTsw/5VFxk26p9fISlP+ryrVtbbIU+09rxzayxggUR
	G8jGfAGfazyxveGHhlMO7dg90AqJY/USLgslzNFxyg59PWzegjStx9JozZW3+V0dJ6S5e44olyd
	6t3+aifjTu/ZLFvr/2lJzH2K9gV7EStM0UCRP/yz0HgrdU6CwiNvYJ4aDO+HctGEoQK+8QFwrwK
	kJiwH5GxzBV36TeawbdhzGJ5YHbeyv4wHk+NwaUp4F08vQ==
X-Google-Smtp-Source: AGHT+IEgJDEOC/u6Db9S8vBGlIrtrweq2z3IngpE+bOG6o1P2S+EHdM9J3kXDIpjhVqdugpgYX213w==
X-Received: by 2002:a05:600c:8216:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-441d44c8c30mr43306465e9.15.1746639543632;
        Wed, 07 May 2025 10:39:03 -0700 (PDT)
Date: Wed, 7 May 2025 19:39:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
Message-ID: <aBuatoL1dm0tjZ9P@macbook.lan>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>

On Tue, May 06, 2025 at 04:56:12PM -0400, Demi Marie Obenour wrote:
> On 5/6/25 9:06 AM, Alejandro Vallejo wrote:
> > On Tue May 6, 2025 at 3:02 AM CEST, Demi Marie Obenour wrote:
> >> On 5/5/25 7:32 AM, Alejandro Vallejo wrote:
> >>> I suppose this is still about multiplexing the GPU driver the way we
> >>> last discussed at Xen Summit?
> >>>
> >>> On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
> >>>> What are the appropriate Xen internal functions for:
> >>>>
> >>>> 1. Turning a PFN into an MFN?
> >>>> 2. Mapping an MFN into a guest?
> >>>> 3. Unmapping that MFN from a guest?
> >>>
> >>> The p2m is the single source of truth about such mappings.
> >>>
> >>> This is all racy business. You want to keep the p2m lock for the full
> >>> duration of whatever operation you wish do, or you risk another CPU
> >>> taking it and pulling the rug under your feet at the most inconvenient
> >>> time.
> >>>
> >>> In general all this faff is hidden under way too many layers beneath
> >>> copy_{to,from}_guest(). Other p2m manipulation high-level constructs
> >>> that might do interesting things worth looking at may be {map,unmap}_mmio_region()
> >>>
> >>> Note that not every pfn has an associated mfn. Not even every valid pfn
> >>> has necessarily an associated mfn (there's pod). And all of this is
> >>> volatile business in the presence of a baloon driver or vPCI placing
> >>> mmio windows over guest memory.
> >>
> >> Can I check that POD is not in use?  
> > 
> > Maybe, but now you're reaching exponential complexity considering each
> > individual knob of the p2m into account.
> > 
> >>
> >>> In general anything up this alley would need a cohesive pair for
> >>> map/unmap and a credible plan for concurrency and how it's all handled
> >>> in conjunction with other bits that touch the p2m.
> >>
> >> Is taking the p2m lock for the entire operation a reasonable approach
> >> for concurrency?  Will this cause too much lock contention?
> > 
> > Maybe. It'd be fine for a page. Likely not so for several GiB if they
> > aren't already superpages.
> > 
> >>
> >>>> The first patch I am going to send with this information is a documentation
> >>>> patch so that others do not need to figure this out for themselves.
> >>>> I remember being unsure even after looking through the source code, which
> >>>> is why I am asking here.
> >>>
> >>> That's not surprising. There's per-arch stuff, per-p2mtype stuff,
> >>> per-guesttype stuff. Plus madness like on-demand memory. It's no wonder
> >>> such helpers don't exist and the general manipulations are hard to
> >>> explain.
> >>
> >> Is this a task that is only suitable for someone who has several years
> >> experience working on Xen, or is it something that would make sense for
> >> someone who is less experienced?
> > 
> > The p2m is a very complex beast that integrates more features than I
> > care to count. It requires a lot of prior knowledge. Whoever does it
> > must know Xen fairly well in many configurations.
> > 
> > The real problem is finding the right primitives that do what you want
> > without overcomplicating everything else, preserving system security
> > invariants and have benign (and ideally clear) edge cases.
> > 
> > This was the last email you sent (I think?). Has any of the requirements
> > changed in any direction?
> > 
> >   https://lore.kernel.org/xen-devel/Z5794ysNE4KDkFuT@itl-email/
> 
> Map and Revoke are still needed, with the same requirements as described
> in this email.  Steal and Return were needed for GPU shared virtual memory,
> but it has been decided to not support this with virtio-GPU, so these
> primitives are no longer needed.
> 
> > Something I'm missing there is how everything works without Xen. That
> > might help (me, at least) guage what could prove enough to support the
> > usecase. Are there sequence diagrams anywhere about how this whole thing
> > works without Xen? I vaguely remember you showing something last year in
> > Xen Summit in the design session, but my memory isn't that good :)

Hello,

Sorry, possibly replying a bit out of context here.

Since I will mention this in several places: p2m is the second stage
page-tables used by Xen for PVH and HVM guests.  A p2m violation is
the equivalent of a page-fault for guest p2m accesses.

> A Linux driver that needs access to userspace memory
> pages can get it in two different ways:
> 
> 1. It can pin the pages using the pin_user_pages family of APIs.
>    If these functions succeed, the driver is guaranteed to be able
>    to access the pages until it unpins them.  However, this also
>    means that the pages cannot be paged out or migrated.  Furthermore,
>    file-backed pages cannot be safely pinned, and pinning GPU memory
>    isn’t supported.  (At a minimum, it would prevent the pages from
>    migrating from system RAM to VRAM, so all access by a dGPU would
>    cross the PCIe bus, which would be very slow.)

From a Xen p2m this is all fine - Xen will never remove pages from the
p2m unless it's requested to.  So the pining, while needed on the Linux
side, doesn't need to be propagated to Xen I would think.

> 
> 2. It can grab the *current* location of the pages and register an
>    MMU notifier.  This works for GPU memory and file-backed memory.
>    However, when the invalidate_range function of this callback, the
>    driver *must* stop all further accesses to the pages.
> 
>    The invalidate_range callback is not allowed to block for a long
>    period of time.  My understanding is that things like dirty page
>    writeback are blocked while the callback is in progress.  My
>    understanding is also that the callback is not allowed to fail.
>    I believe it can return a retryable error but I don’t think that
>    it is allowed to keep failing forever.
> 
>    Linux’s grant table driver actually had a bug in this area, which
>    led to deadlocks.  I fixed that a while back.
> 
> KVM implements the second option: it maps pages into the stage-2
> page tables (or shadow page tables, if that is chosen) and unmaps
> them when the invalidate_range callback is called.

I assume this map and unmap is done by the host as a result of some
guest action?

> Furthermore,
> if a page fault happens while the page is unmapped, KVM will try
> to bring the pages back into memory so the guest can access it.

You could likely handle this in Xen in the following way:

 - A device model will get p2m violations forwarded, as it's the same
   model that's used to handle emulation of device MMIO.  You will
   need to register an ioreq server to request those faults to be
   forwarded, I think the hardware domain kernel will handle those?

 - Allow ioreqs to signal to Xen that a guest operation must be
   retried.  IOW: resume guest execution without advancing the IP.

I think this last bit is the one that will require changes to Xen, so
that you can add a type of ioreq reply that implies a retry from the
guest context.

> For GPU acceleration via virtio-GPU native contexts to work,
> the Xen interface driver needs to do the same thing with GPU
> buffers that KVM does: it needs to fault the pages into guest
> memory on-demand and revoke access to the pages when the host
> kernel demands them back.  There really is no alternative that
> I am aware of.  The need to handle guest page faults doesn’t
> come from the host kernel, but rather from guest userspace.

I'm a bit confused with this last sentence, the "page faults"
mentioned here are p2m violations I think?

Hope this makes some sense.

Regards, Roger.

