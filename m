Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC0A6C277
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 19:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924375.1327604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvhAi-0000Oj-RX; Fri, 21 Mar 2025 18:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924375.1327604; Fri, 21 Mar 2025 18:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvhAi-0000Lf-Oh; Fri, 21 Mar 2025 18:32:44 +0000
Received: by outflank-mailman (input) for mailman id 924375;
 Fri, 21 Mar 2025 18:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CaU=WI=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tvhAh-0000Km-2k
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 18:32:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de3066b6-0682-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 19:32:40 +0100 (CET)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-oxMLxNEKOAOUat-bxS_r3Q-1; Fri, 21 Mar 2025 14:32:36 -0400
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2265a09dbfcso57935775ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 11:32:35 -0700 (PDT)
Received: from redhat.com ([195.133.138.172]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7390618e08esm2305706b3a.169.2025.03.21.11.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 11:32:33 -0700 (PDT)
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
X-Inumbo-ID: de3066b6-0682-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x6Pr4yNEy0Ee63hyTGb7eb9xdvxKn8eEKjzFLCkdY+o=;
	b=cqtKHcL0PW4P4bDHZj5OiSm7JNbeNB6MWAwmK6GpRxCkpIMrIBM3eJi7EMXcmlPzo/oAUK
	us372Kahttso9hSoZ7Tz7jLwrzANeoiBVgwQFhFkBQRTrKcbUyQE5uK4JIvz2b5f49WU2T
	eMciUF7mEi1w4jQg1bM19nFqRis7Stw=
X-MC-Unique: oxMLxNEKOAOUat-bxS_r3Q-1
X-Mimecast-MFC-AGG-ID: oxMLxNEKOAOUat-bxS_r3Q_1742581955
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581955; x=1743186755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Pr4yNEy0Ee63hyTGb7eb9xdvxKn8eEKjzFLCkdY+o=;
        b=vbJcE5/E+EPvoSnMW+6cgzjzjybKu1UJRHVV7pFgK9iWRNlcxIU+lGQ4Xjyy1iy5Cc
         bHyD46OWi/Q4fi+UZMmhyl4NK/8h/s+hjUmwKP90+qhxKBVM7fg3ikLvJ9TYFDdOSnp7
         Xd1dBNRqq1S/HqsxCm/r61TnZ2s/rnDCmCdcEHRJBZtznVpVUtE5of+W3KX6lRoqDzm8
         scdvgO0mTj/SkzioHMNIDhGadm4po2b9SvKYl4oddPEugD8y7Jlno0OKkvBXPSfp91yl
         cAgC6/KUYneBv7R85XMKz5Y1S2vtgnyOapg/VR88PibSkuWes/+Ay6amBDLcXFuZCQSw
         6lfg==
X-Forwarded-Encrypted: i=1; AJvYcCXwcbF8PA0H0167FW18wQCoYxhc6ij/w8BCt3WOzE4HvMyjzV9T8o91HrYk3IzahK2TXF1+ziDyCcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE9rMjLmzSBPbJG77XkVQ0WLWMVrzFmFZjxatvmX8UXdtOsOpB
	WcW5NgMN2fKcM8yH5BBpX7ZPPijiVV2pBahhwRsjuSs9gFkT/Tza2xytbHoLLKHJHEHPNW8xX/q
	VpocwOFd15k6bsUYIMqzFmhScAsvDdwscNpOFiCx5CE4vKHP/0s/kMpRkgESdX19P
X-Gm-Gg: ASbGncsFPG984D6tfRVUJw/3gPim7lo7IKorEmkEX+7dNVzSqCugwC/nBUYuOSTpWF2
	f0Iqrpq+mobTTJ/U6n5wSfOZULp2ToE4UJmfi9ZhrhHHuLrLKkHKKoxn/64UeL+dr9TkxVB/b4r
	OlLSf/b1B4mDIpoV93zPX2cDCmMYcK/MOisSZrhQSGVoPqdqdaFBV0U58/nwhL6vvHOcRx4i6cM
	7NaDRD4/xBYwWZmqVCt4EuOkPmoHBI9cU73wzCddCx1rrL0bZ3M+9l4/BHortBstrQ9CWa7sWv4
	+3CPmwjm
X-Received: by 2002:a05:6a00:3d49:b0:736:592e:795f with SMTP id d2e1a72fcca58-7390598e637mr6094586b3a.9.1742581954600;
        Fri, 21 Mar 2025 11:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgvI4Fq7PhyVG2/6UfPhY7tEePZCtkHS/CCaoQm+lEN40XhsJxvkXhRtIdT7ONaz8I8Nvvbw==
X-Received: by 2002:a05:6a00:3d49:b0:736:592e:795f with SMTP id d2e1a72fcca58-7390598e637mr6094532b3a.9.1742581953971;
        Fri, 21 Mar 2025 11:32:33 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:32:24 -0400
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
Message-ID: <20250321142947-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W85IP__Q0jVmKvZzH9c1MNE_TfJQQIOmxkIf1XbENZo_1742581955
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> 
> Replying to an ancient (2021) thread which has already been merged...
> 
> I'd like to be able to use this facility for virtio devices.
> 
> Virtio already has a complicated relationship with the DMA API, because
> there were a bunch of early VMM bugs where the virtio devices where
> magically exempted from IOMMU protection, but the VMM lied to the guest
> and claimed they weren't.
> 
> With the advent of confidential computing, and the VMM (or whatever's
> emulating the virtio device) not being *allowed* to arbitrarily access
> all of the guest's memory, the DMA API becomes necessary again.
> 
> Either a virtual IOMMU needs to determine which guest memory the VMM
> may access, or the DMA API is wrappers around operations which
> share/unshare (or unencrypt/encrypt) the memory in question.
> 
> All of which is complicated and slow, if we're looking at a minimal
> privileged hypervisor stub like pKVM which enforces the lack of guest
> memory access from VMM.
> 
> I'm thinking of defining a new type of virtio-pci device which cannot
> do DMA to arbitrary system memory. Instead it has an additional memory
> BAR which is used as a SWIOTLB for bounce buffering.
> 
> The driver for it would look much like the existing virtio-pci device
> except that it would register the restricted-dma region first (and thus
> the swiotlb dma_ops), and then just go through the rest of the setup
> like any other virtio device.
> 
> That seems like it ought to be fairly simple, and seems like a
> reasonable way to allow an untrusted VMM to provide virtio devices with
> restricted DMA access.
> 
> While I start actually doing the typing... does anyone want to start
> yelling at me now? Christoph? mst? :)


I don't mind as such (though I don't understand completely), but since
this is changing the device anyway, I am a bit confused why you can't
just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
which will DTRT for you, will it not?

-- 
MST


