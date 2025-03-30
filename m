Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44BA75B48
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 19:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931659.1333858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyw7n-0008C1-OB; Sun, 30 Mar 2025 17:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931659.1333858; Sun, 30 Mar 2025 17:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyw7n-00088s-LC; Sun, 30 Mar 2025 17:07:07 +0000
Received: by outflank-mailman (input) for mailman id 931659;
 Sun, 30 Mar 2025 17:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l0Nf=WR=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tyw7l-00088j-O1
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 17:07:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63fa7527-0d89-11f0-9ffb-bf95429c2676;
 Sun, 30 Mar 2025 19:06:59 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-x9xe7PCoMoWaRzYG02L1PQ-1; Sun, 30 Mar 2025 13:06:55 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ab5baf62cso25742165e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 10:06:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff02e75sm96683605e9.30.2025.03.30.10.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:06:52 -0700 (PDT)
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
X-Inumbo-ID: 63fa7527-0d89-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743354418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
	b=ijb3u10Agbzvy0CirGZWjHQwKtVheSLvZsgcJKc8R5vyWJ9i0DVcqB/WbcC81auDzwOLax
	SrKu/0gLZwHxHttWX6vgBiZqboNNcNCBAKvAR3VDwHeTamuE1gqPU3bxqg9q8WRbaxYALo
	zvPB6J9B0sHtHKYz6KbK7J6+Z3u57WE=
X-MC-Unique: x9xe7PCoMoWaRzYG02L1PQ-1
X-Mimecast-MFC-AGG-ID: x9xe7PCoMoWaRzYG02L1PQ_1743354414
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354414; x=1743959214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
        b=Hw08vu0wY7f4n7mtP9LFsdJlBe8HFFvZbgBTjR95V1K1QMT/bljQls4VTpUsiGHs42
         tgokWqKktUDD8/EU4LBbE+hTQ/dgCMt9Ir8j/Nwxn3tG+8LhzK3aShoQbBxitabFqxwy
         3WKyKg2nniYUo9j6AP7H4qCJJ+BpKViPgzAFyu4rdOMczyBY+CfS5NZdNR/NMr/EXG0w
         PNCC9B3qOdTYxrvcVKDT+HapKXJtg7sQbBgZAhr57k2QaondYf/kOoG22du4RYf9Axhc
         MLVRjK/1vfrwnjKVKh46lHhIy9jd7Dx4zjWsF3ou4Bqrn7XRaxJu8Ii5CyhY44z/09zz
         59CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJRFIioEsfEGez1unJnMUHBRUcV0WaI5QIMm0a6WguEjLf5ImWdbDWvuT75wSVZs1GgNa+52B/1Xs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmBb7CJXe96vXgNvz3bBTGaXR91XPAuKfFMOStYgM6dG3auvVA
	4cIx2lM/7ZtxJ+LWnNvARYUFu3ahv+19C7sLXr7D1nzPMmyCdL27JINWzX69XmDImHbGZzDwUt4
	8LjrZfZ2kCyeXg5AigHxsbRyj/7XBXhVrBO8FTXUqqtX9VLnOHKWCCw2zGuO6ZTf2
X-Gm-Gg: ASbGncv4MCsoWcTHpXi+qefVLYU8x4DvPUbyWiOoLc5MqpMEJbuRlRXuxjd8gcAgrJm
	UkxCFtEraQHaBWFRwNIwQRwjYZ0yl8xFe4nePUV443cQgW4oMn4b7D5ven6JMllom0tZLo+oPQk
	vKEp2Qy7O04/LKK9XSGTNzx0pZOMFQBjbmp1yG5Wh5IvYQR8sxYOfWwr275SDakzC2TMp+4dKJ3
	wFhBITFCPkD9/fmh9jBUNr+Exeddzz+fDPmH1kPIZ7K7za27sRkYVaE93a9SMj+fhsLF6Kw54qb
	JbgIGfwebA==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr6045353f8f.22.1743354413861;
        Sun, 30 Mar 2025 10:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHnojfMbGERAUL3k9pGdjXNeKSJM3z6oVNts7beynMJRyZ4qGr50Up8p35T+/D9THLJjAJmw==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr6045310f8f.22.1743354413473;
        Sun, 30 Mar 2025 10:06:53 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:06:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	heikki.krogerus@linux.intel.com, peterz@infradead.org,
	benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
	mingo@kernel.org, sstabellini@kernel.org,
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Robin Murphy <robin.murphy@arm.com>, hch@infradead.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, graf@amazon.de
Subject: Re: Using Restricted DMA for virtio-pci
Message-ID: <20250330125929-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N3Pxwn-WuURBmKGKSdBofM0RguzHIjTi_-ufk8p1ABQ_1743354414
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 21, 2025 at 06:42:20PM +0000, David Woodhouse wrote:
> On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > > This series implements mitigations for lack of DMA access control on
> > > > systems without an IOMMU, which could result in the DMA accessing the
> > > > system memory at unexpected times and/or unexpected addresses, possibly
> > > > leading to data leakage or corruption.
> > > 
> > > Replying to an ancient (2021) thread which has already been merged...
> > > 
> > > I'd like to be able to use this facility for virtio devices.
> > > 
> > > Virtio already has a complicated relationship with the DMA API, because
> > > there were a bunch of early VMM bugs where the virtio devices where
> > > magically exempted from IOMMU protection, but the VMM lied to the guest
> > > and claimed they weren't.
> > > 
> > > With the advent of confidential computing, and the VMM (or whatever's
> > > emulating the virtio device) not being *allowed* to arbitrarily access
> > > all of the guest's memory, the DMA API becomes necessary again.
> > > 
> > > Either a virtual IOMMU needs to determine which guest memory the VMM
> > > may access, or the DMA API is wrappers around operations which
> > > share/unshare (or unencrypt/encrypt) the memory in question.
> > > 
> > > All of which is complicated and slow, if we're looking at a minimal
> > > privileged hypervisor stub like pKVM which enforces the lack of guest
> > > memory access from VMM.
> > > 
> > > I'm thinking of defining a new type of virtio-pci device which cannot
> > > do DMA to arbitrary system memory. Instead it has an additional memory
> > > BAR which is used as a SWIOTLB for bounce buffering.
> > > 
> > > The driver for it would look much like the existing virtio-pci device
> > > except that it would register the restricted-dma region first (and thus
> > > the swiotlb dma_ops), and then just go through the rest of the setup
> > > like any other virtio device.
> > > 
> > > That seems like it ought to be fairly simple, and seems like a
> > > reasonable way to allow an untrusted VMM to provide virtio devices with
> > > restricted DMA access.
> > > 
> > > While I start actually doing the typing... does anyone want to start
> > > yelling at me now? Christoph? mst? :)
> > 
> > 
> > I don't mind as such (though I don't understand completely), but since
> > this is changing the device anyway, I am a bit confused why you can't
> > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > which will DTRT for you, will it not?
> 
> That would be necessary but not sufficient. The question is *what* does
> the DMA API do?
> 
> For a real passthrough PCI device, perhaps we'd have a vIOMMU exposed
> to the guest so that it can do real protection with two-stage page
> tables (IOVA→GPA under control of the guest, GPA→HPA under control of
> the hypervisor). For that to work in the pKVM model though, you'd need
> pKVM to be talking the guest's stage1 I/O page tables to see if a given
> access from the VMM ought to be permitted?
> 
> Or for confidential guests there could be DMA ops which are an
> 'enlightenment'; a hypercall into pKVM to share/unshare pages so that
> the VMM can actually access them, or SEV-SNP guests might mark pages
> unencrypted to have the same effect with hardware protection.
> 
> Doing any of those dynamically to allow the VMM to access buffers in
> arbitrary guest memory (when it wouldn't normally have access to
> arbitrary guest memory) is complex and doesn't perform very well. And
> exposes a full 4KiB page for any byte that needs to be made available.
> 
> Thus the idea of having a fixed range of memory to use for a SWIOTLB,
> which is fairly much what the restricted DMA setup is all about.
> 
> We're just proposing that we build it in to a virtio-pci device model,
> which automatically uses the extra memory BAR instead of the
> restricted-dma-pool DT node.
> 
> It's basically just allowing us to expose through PCI, what I believe
> we can already do for virtio in DT.

I am not saying I am against this extension.
The idea to restrict DMA has a lot of merit outside pkvm.
For example, with a physical devices, limiting its DMA
to a fixed range can be good for security at a cost of
an extra data copy.

So I am not saying we have to block this specific hack.

what worries me fundamentally is I am not sure it works well
e.g. for physical virtio cards.
Attempts to pass data between devices will now also require
extra data copies.


Did you think about adding an swiotlb mode to virtio-iommu at all?
Much easier than parsing page tables.



-- 
MST


