Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC4B2F5CDE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 10:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66880.118990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyaF-000228-Mw; Thu, 14 Jan 2021 09:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66880.118990; Thu, 14 Jan 2021 09:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyaF-00021j-Iu; Thu, 14 Jan 2021 09:06:23 +0000
Received: by outflank-mailman (input) for mailman id 66880;
 Thu, 14 Jan 2021 09:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoDU=GR=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kzyaE-00021V-JQ
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 09:06:22 +0000
Received: from mail-io1-xd35.google.com (unknown [2607:f8b0:4864:20::d35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e02010e2-ca11-482a-aa41-e1cf77c34e6e;
 Thu, 14 Jan 2021 09:06:21 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id w18so9815646iot.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 01:06:21 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id t14sm2407656iof.23.2021.01.14.01.06.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 01:06:20 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id d9so9751775iob.6
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 01:06:19 -0800 (PST)
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
X-Inumbo-ID: e02010e2-ca11-482a-aa41-e1cf77c34e6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r2clGFKfMvWdEL24a/hrPW/SoKgcT/5YZOK8G2tupLA=;
        b=X7SGbsqsGRlUtP0PJCg54RJ4TAlmaAHUG3xPdqjVb0oScLVfStGatbndpS03GsNgnP
         Ay7KF7sGV28MuK8UBUQD50tmV7MICCg9iHgn3dDmdiN2V0+w2jb02zv0Fvhtiq/Aou7X
         FWO4E0ky5/69bheieFiKWNwRnHzuorBEbyewE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r2clGFKfMvWdEL24a/hrPW/SoKgcT/5YZOK8G2tupLA=;
        b=r5sKfP5wPsKDnHdFW09TCL8buib4Sg86gt1kb0HgrKtHdGIj1H6dtlgL42E//mMbA2
         5HUrpU8ayd8KzyphcdAo5TGoMBNGAajzaOxFHKLs0IZ1CRhTbm6Zud3KpFxj1/E5YjC/
         zFp4mQerw5dX3eHtA6DVxtZxSnNzl1SP2CdRRf58ok7sd0qRu78S6rcVeRl0kDRhXWA/
         TEUIwZpnRewAqoEiRxde22Q8tKGM1bprjq4dTDLcQOEpowlZ4vX8QTro3e8Br2mu/UMy
         fCkWLoqp+wTBEpdU00+0T4c7IOLaAE37e0zV9haKeT3LDiGML3wILRJuXV13q8a06b13
         e+YQ==
X-Gm-Message-State: AOAM530YdnzGLxC8/+ZiNMoiCWqYttIdzKJT32MpVUZS9F1SZC4P33Wa
	wF1aCDpfYYLx7lWcX6aS7ozHXyDAfimrng==
X-Google-Smtp-Source: ABdhPJz1IWEEbBU268z+aOIEGuw8Mlc1OOquqM/liSC0OC/TN5x6DFymqLwbs02X/gr2HD31cS3IqA==
X-Received: by 2002:a5e:8202:: with SMTP id l2mr4636430iom.106.1610615181248;
        Thu, 14 Jan 2021 01:06:21 -0800 (PST)
X-Received: by 2002:a92:ce8f:: with SMTP id r15mr4926327ilo.303.1610615178346;
 Thu, 14 Jan 2021 01:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-3-tientzu@chromium.org>
 <20210113124209.GA1383@lst.de>
In-Reply-To: <20210113124209.GA1383@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 14 Jan 2021 17:06:07 +0800
X-Gmail-Original-Message-ID: <CALiNf2-a6JpbeyfCoGdjFAbguxwW5kn1r_Oq6yr+k1rGum7O8Q@mail.gmail.com>
Message-ID: <CALiNf2-a6JpbeyfCoGdjFAbguxwW5kn1r_Oq6yr+k1rGum7O8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
To: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <joro@8bytes.org>, will@kernel.org, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	sstabellini@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, rafael.j.wysocki@intel.com, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rdunlap@infradead.org, 
	dan.j.williams@intel.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>, xen-devel@lists.xenproject.org, 
	Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 13, 2021 at 8:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifdef CONFIG_SWIOTLB
> > +     struct io_tlb_mem       *dma_io_tlb_mem;
> >  #endif
>
> Please add a new config option for this code instead of always building
> it when swiotlb is enabled.
>
> > +static int swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> > +                                size_t size)
>
> Can you split the refactoring in swiotlb.c into one or more prep
> patches?
>
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +                                 struct device *dev)
> > +{
> > +     struct io_tlb_mem *mem = rmem->priv;
> > +     int ret;
> > +
> > +     if (dev->dma_io_tlb_mem)
> > +             return -EBUSY;
> > +
> > +     if (!mem) {
> > +             mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> > +             if (!mem)
> > +                     return -ENOMEM;
>
> What is the calling convention here that allows for a NULL and non-NULL
> private data?

Since multiple devices can share the same pool, the private data,
io_tlb_mem struct, will be initialized by the first device attached to
it.
This is similar to rmem_dma_device_init() in kernel/dma/coherent.c.
I'll add a comment for it in next version.

