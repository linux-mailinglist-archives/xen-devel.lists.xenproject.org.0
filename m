Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BF9A75CC6
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931810.1333997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0WY-00085c-Rd; Sun, 30 Mar 2025 21:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931810.1333997; Sun, 30 Mar 2025 21:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0WY-00083O-Oj; Sun, 30 Mar 2025 21:48:58 +0000
Received: by outflank-mailman (input) for mailman id 931810;
 Sun, 30 Mar 2025 21:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l0Nf=WR=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tz0WW-00083H-Uc
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:48:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c59619f9-0db0-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 23:48:54 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-H2BTUS6kOn-mesMisDLXzw-1; Sun, 30 Mar 2025 17:48:51 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so19826245e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 14:48:51 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83477sm147882045e9.16.2025.03.30.14.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 14:48:48 -0700 (PDT)
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
X-Inumbo-ID: c59619f9-0db0-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743371332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRkqFL3NXkPCwg+oa2kxw02pthB6mXCTdemECWhwX84=;
	b=hNpU6pONKodQd8M3EaFiv2hkW8z9T57xb8mKe/6fwQP4r2uOXMyqo/dfIt+nlnwHmtXVbq
	wQ1vehs87NGYy8Q7MT4LQCIlSRbjYF5CCA/r/K1EJJlhdTm8m3Hk+CthvJvXu8MncyODep
	UN7+vTARjHsksykNsg+mytaw1YWHr/o=
X-MC-Unique: H2BTUS6kOn-mesMisDLXzw-1
X-Mimecast-MFC-AGG-ID: H2BTUS6kOn-mesMisDLXzw_1743371330
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743371330; x=1743976130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRkqFL3NXkPCwg+oa2kxw02pthB6mXCTdemECWhwX84=;
        b=FLcVMYxtKR9IGArFfLkoxU7mrZtfW/LNkFamsSTbZGVDJxH454Nvu/DttDBn9SGr/C
         SY/ohQKVeAW4bq7YorXoaguxLUUIDozsZivGRh1zvGWhW0Ixp+jfrbDrsRe7laJuUqqs
         fsI6Zx251S0Guhd/RyWG4fCMkVrqnmcyOr3lFQJMpGY86fQMtpytPn64avqHg6uGTDlj
         fh4xurpFeiGUbFZdCeytkNyQfs+emCp2xaBvzcthHePeZes0vqG476u4e6pPqWC1v3mb
         DdduugULRtN2U2R6cjYZ18MDQnM8tUV7Zl5s9lEnC+hbAgOr+ccdQH/b/8UvHgKC979m
         LnrA==
X-Forwarded-Encrypted: i=1; AJvYcCUvs4py+BDx2xggiY7ydTuQXPAesiVNnhTC0mkeljKjlWO+CDER5Tky0pXoi8wR3DPrAo2FztMcIj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPhCbGhmMGMKvUaVpvmBfiWiMdxO2EqYPcJQkWqS6Xholz0kB8
	eTAMnyZuSdG/3sLHNbM5pQdYIhhGAEnTm80LJ4xENE7iMVip8IrnHyh03d9YO455vRE+H2Y2bTM
	HO+aNRhMSh9H4X6QAc/uefdNOY6rPiGzmiZsEVQrXcOkbpVdesizw9QvXPYJAp9b7
X-Gm-Gg: ASbGnctRNHqIpQHXopotzqZav+VAkjU8MSImfK53XzIIPMMlXMKEsGycn4xpNPn7B5X
	2GBHfCnGwA89FVXMlo+Ukv5ctx3D7XolGhwYENQ8V9ChSqao7s6mZ2JZ2NxWkmiTsIKXVLnivwU
	COUKb1thTnHtD/SfMtvHUyo8mcG6AvTz/CHcdADMOWAkE9El3NNfzEOKEL5q8K2StPWOtJxKeS9
	9QWOa9S1VMEzd5dAqEMFMd6ngjKEHvsPg1TJGDYD0wB1kfX+J5lKCyOWKx5khDBV3OBBC31gbdr
	hhjwioBUWg==
X-Received: by 2002:a05:600c:1d8c:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43db628992cmr52509345e9.20.1743371329774;
        Sun, 30 Mar 2025 14:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1kdHHR/M4aOUOFDnZpG/iLLAoqQlqVBS2836/4CKe19RX2SyJrF+xilFjC/1QxsrymXzr6Q==
X-Received: by 2002:a05:600c:1d8c:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43db628992cmr52509055e9.20.1743371329422;
        Sun, 30 Mar 2025 14:48:49 -0700 (PDT)
Date: Sun, 30 Mar 2025 17:48:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org, Claire Chang <tientzu@chromium.org>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <20250330173951-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
 <20250330125929-mutt-send-email-mst@kernel.org>
 <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
MIME-Version: 1.0
In-Reply-To: <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MrkAnU6tI2ARhHnQ6F8QvtoNufxFrx7_caHWlPnGv6Q_1743371330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 30, 2025 at 10:27:58PM +0100, David Woodhouse wrote:
> On 30 March 2025 18:06:47 BST, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> It's basically just allowing us to expose through PCI, what I believe
> >> we can already do for virtio in DT.
> >
> >I am not saying I am against this extension.
> >The idea to restrict DMA has a lot of merit outside pkvm.
> >For example, with a physical devices, limiting its DMA
> >to a fixed range can be good for security at a cost of
> >an extra data copy.
> >
> >So I am not saying we have to block this specific hack.
> >
> >what worries me fundamentally is I am not sure it works well
> >e.g. for physical virtio cards.
> 
> Not sure why it doesn't work for physical cards. They don't need to be bus-mastering; they just take data from a buffer in their own RAM.

I mean, it kind of does, it is just that CPU pulling data over the PCI bus
stalls it so is very expensive. It is not by chance people switched to
DMA almost exclusively.


> >Attempts to pass data between devices will now also require
> >extra data copies.
> 
> Yes. I think that's acceptable, but if we really cared we could perhaps extend the capability to refer to a range inside a given BAR on a specific *device*? Or maybe just *function*, and allow sharing of SWIOTLB buffer within a multi-function device?

Fundamentally, this is what dmabuf does.

> I think it's overkill though.
> 
> >Did you think about adding an swiotlb mode to virtio-iommu at all?
> >Much easier than parsing page tables.
> 
> Often the guests which need this will have a real IOMMU for the true
> pass-through devices.

Not sure I understand. You mean with things like stage 2 passthrough?

> Adding a virtio-iommu into the mix (or any other
> system-wide way of doing something different for certain devices) is
> problematic.

OK... but the issue isn't specific to no DMA devices, is it?


> The on-device buffer keeps it nice and simple,

I am not saying it is not.
It's just a little boutique.

> and even allows us to
> do device support for operating systems like Windows where it's a lot
> harder to do anything generic in the core OS.

Well we do need virtio iommu windows support sooner or later, anyway.

-- 
MST


