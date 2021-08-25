Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B93F734D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 12:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171883.313632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIqAP-0004OU-8L; Wed, 25 Aug 2021 10:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171883.313632; Wed, 25 Aug 2021 10:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIqAP-0004Lt-5E; Wed, 25 Aug 2021 10:29:57 +0000
Received: by outflank-mailman (input) for mailman id 171883;
 Wed, 25 Aug 2021 10:29:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDYB=NQ=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mIqAO-0004Ln-H3
 for xen-devel@lists.xen.org; Wed, 25 Aug 2021 10:29:56 +0000
Received: from mail-pl1-x636.google.com (unknown [2607:f8b0:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10172b4d-ace6-4203-be92-0184875e9904;
 Wed, 25 Aug 2021 10:29:55 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id b9so9682529plx.2
 for <xen-devel@lists.xen.org>; Wed, 25 Aug 2021 03:29:54 -0700 (PDT)
Received: from laputa (pdb6272e8.tkyea130.ap.so-net.ne.jp. [219.98.114.232])
 by smtp.gmail.com with ESMTPSA id b12sm22659666pff.63.2021.08.25.03.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:29:53 -0700 (PDT)
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
X-Inumbo-ID: 10172b4d-ace6-4203-be92-0184875e9904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5iLgH/sMm6qzN7CswTbIky/YZr+sketasl4IwIH6gKg=;
        b=m1JaR8FxWl6k2Bxu/mdH7FyKXYaQGrShjqbMU+nzV0Qh2lIe6iuKqPFnGvqSnF2qH/
         fLQ7DKHMXfhOcSIXfkutBOss9zCSgVz9QFCroOEIWEVlU7cm+z1YzvYqH857QJY2+t+j
         KhxG+RS8KJPMsgrI4dYpo+S2isf10fUObE/K4tRs+y1eCEmgnG0bQxuLLPRYBuDeiiGy
         3/OZTaBsvlHnL2SI9B9vEv/6h7zUzUYJXjPcLdKAXfdgMBZSMm7WHFQl7tDpm/gQdlzj
         s++CRxQN3pbxEDIU8MDsIwz+irUiPGGP8EEr3Lr2iAlD1y3k5Kaslq0kzHUyVT5/Dg2s
         LBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5iLgH/sMm6qzN7CswTbIky/YZr+sketasl4IwIH6gKg=;
        b=r5XoalMbS0LcT76ej/JvRnKliFhTkIQyJwpyqd5MQekQr6WWgUdSnycWISNxnC4/3m
         /pY0M3NTlc3Jm6Em8SYFWK3IQe+/RXK+Mpbgg9CxnZGV9NB+pQ2u9ULtqzzjHYDQCWxs
         9Y4Ee/LTjZcOM+xZ0HwiY/k0YRPp4mUeNRzIoG035vuf83uaerBNUQ35/KirBh1pYyji
         83EBsPnxwRAHj0Utw4YXQQNcfsQKr6QVHhjxGL42fgTn1oKayYcbYC7N6t5qBQTgq6LI
         DcxyJls7Lg2P/KOVpDTE0t0COJWvPYA6bl6nnulxXiXpZlY3B4XWmClPfFSibj0MjLx2
         u9gA==
X-Gm-Message-State: AOAM532wNVr3o28WALSpaDMPIg34n3SCSrSXb5a2SJcqKlKKi1Vhy2Wq
	FxXrApJXEGnNt2p4MtMfYRYPNg==
X-Google-Smtp-Source: ABdhPJyWd32JT2SWqsOKhrXC/UBL1Y/Ywrds1qpVZl5ketKIigBPjiV3Q+PmUaTvYauDxOptvtzk2w==
X-Received: by 2002:a17:90a:5411:: with SMTP id z17mr9801944pjh.67.1629887393749;
        Wed, 25 Aug 2021 03:29:53 -0700 (PDT)
Date: Wed, 25 Aug 2021 19:29:45 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Alex Benn??e <alex.bennee@linaro.org>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com,
	Srivatsa Vaddagiri <vatsa@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>, Wei.Chen@arm.com,
	olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com,
	Bertrand.Marquis@arm.com, Artem_Mygaiev@epam.com, julien@xen.org,
	jgross@suse.com, paul@xen.org, xen-devel@lists.xen.org
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210825102945.GA89209@laputa>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
 <20210823062500.GC40863@laputa>
 <YSNxVjlpCsc+chEC@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSNxVjlpCsc+chEC@stefanha-x1.localdomain>

Hi Stefan,

On Mon, Aug 23, 2021 at 10:58:46AM +0100, Stefan Hajnoczi wrote:
> On Mon, Aug 23, 2021 at 03:25:00PM +0900, AKASHI Takahiro wrote:
> > Hi Stefan,
> > 
> > On Tue, Aug 17, 2021 at 11:41:01AM +0100, Stefan Hajnoczi wrote:
> > > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > > > > Could we consider the kernel internally converting IOREQ messages from
> > > > > the Xen hypervisor to eventfd events? Would this scale with other kernel
> > > > > hypercall interfaces?
> > > > > 
> > > > > So any thoughts on what directions are worth experimenting with?
> > > >  
> > > > One option we should consider is for each backend to connect to Xen via
> > > > the IOREQ interface. We could generalize the IOREQ interface and make it
> > > > hypervisor agnostic. The interface is really trivial and easy to add.
> > > > The only Xen-specific part is the notification mechanism, which is an
> > > > event channel. If we replaced the event channel with something else the
> > > > interface would be generic. See:
> > > > https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> > > 
> > > There have been experiments with something kind of similar in KVM
> > > recently (see struct ioregionfd_cmd):
> > > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/
> > 
> > Do you know the current status of Elena's work?
> > It was last February that she posted her latest patch
> > and it has not been merged upstream yet.
> 
> Elena worked on this during her Outreachy internship. At the moment no
> one is actively working on the patches.

Does RedHat plan to take over or follow up her work hereafter?
# I'm simply asking from my curiosity.

> > > > There is also another problem. IOREQ is probably not be the only
> > > > interface needed. Have a look at
> > > > https://marc.info/?l=xen-devel&m=162373754705233&w=2. Don't we also need
> > > > an interface for the backend to inject interrupts into the frontend? And
> > > > if the backend requires dynamic memory mappings of frontend pages, then
> > > > we would also need an interface to map/unmap domU pages.
> > > > 
> > > > These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> > > > and self-contained. It is easy to add anywhere. A new interface to
> > > > inject interrupts or map pages is more difficult to manage because it
> > > > would require changes scattered across the various emulators.
> > > 
> > > Something like ioreq is indeed necessary to implement arbitrary devices,
> > > but if you are willing to restrict yourself to VIRTIO then other
> > > interfaces are possible too because the VIRTIO device model is different
> > > from the general purpose x86 PIO/MMIO that Xen's ioreq seems to support.
> > 
> > Can you please elaborate your thoughts a bit more here?
> > 
> > It seems to me that trapping MMIOs to configuration space and
> > forwarding those events to BE (or device emulation) is a quite
> > straight-forward way to emulate device MMIOs.
> > Or do you think of something of protocols used in vhost-user?
> > 
> > # On the contrary, virtio-ivshmem only requires a driver to explicitly
> > # forward a "write" request of MMIO accesses to BE. But I don't think
> > # it's your point. 
> 
> See my first reply to this email thread about alternative interfaces for
> VIRTIO device emulation. The main thing to note was that although the
> shared memory vring is used by VIRTIO transports today, the device model
> actually allows transports to implement virtqueues differently (e.g.
> making it possible to create a VIRTIO over TCP transport without shared
> memory in the future).

Do you have any example of such use cases or systems?

> It's possible to define a hypercall interface as a new VIRTIO transport
> that provides higher-level virtqueue operations. Doing this is more work
> than using vrings though since existing guest driver and device
> emulation code already supports vrings.

Personally, I'm open to discuss about your point, but

> I don't know the requirements of Stratos so I can't say if creating a
> new hypervisor-independent interface (VIRTIO transport) that doesn't
> rely on shared memory vrings makes sense. I just wanted to raise the
> idea in case you find that VIRTIO's vrings don't meet your requirements.

While I cannot represent the project's view, what the JIRA task
that is assigned to me describes:
  Deliverables
    * Low level library allowing:
    * management of virtio rings and buffers
  [and so on]
So supporting the shared memory-based vring is one of our assumptions.

In my understanding, the goal of Stratos project is that we would
have several VMs congregated into a SoC, yet sharing most of
physical IPs, where the shared memory should be, I assume, the most
efficient transport for virtio.
One of target applications would be automotive, I guess.

Alex and Mike should have more to say here.

-Takahiro Akashi

> Stefan



