Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54E2ED5EC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 18:46:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63013.111838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZMh-0001D1-K7; Thu, 07 Jan 2021 17:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63013.111838; Thu, 07 Jan 2021 17:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZMh-0001Cc-Ge; Thu, 07 Jan 2021 17:46:27 +0000
Received: by outflank-mailman (input) for mailman id 63013;
 Thu, 07 Jan 2021 17:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGT/=GK=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kxZMf-0001CX-NN
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 17:46:25 +0000
Received: from mail-pg1-x52a.google.com (unknown [2607:f8b0:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df71e66d-ec2c-4437-a71d-c437a7119845;
 Thu, 07 Jan 2021 17:46:24 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n7so5458387pgg.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 09:46:24 -0800 (PST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178])
 by smtp.gmail.com with ESMTPSA id a2sm6991834pgi.8.2021.01.07.09.46.23
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:46:23 -0800 (PST)
Received: by mail-pf1-f178.google.com with SMTP id m6so4308635pfm.6
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 09:46:23 -0800 (PST)
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
X-Inumbo-ID: df71e66d-ec2c-4437-a71d-c437a7119845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0HS3c+10kITlDelN9sS9O+z0w2Ups5kLpisbgPnIuQ=;
        b=TmrbFqeMmnksB1vaMhBMwmgHvojsvOdZ6TLQjSgGvlt9aJwr9bFzrlNmZkoEKaXZrA
         BzhRl+J0o1KlSCMk8lZODbp2N6pkKBO2ZLOdx2Na4jfQSKA1o8yFNpUtcIwDAMJ6DBdH
         07WtF3X92be4zrXT7ssItC8OK2EEQXGttgp4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0HS3c+10kITlDelN9sS9O+z0w2Ups5kLpisbgPnIuQ=;
        b=PVYi0uXEmNBxJ3/8K1oy81nGZ1q+I4i2uIRJDippfogyY5kPc780KuNdQWN0nWVrkE
         YDtRB7ladIzJ0WWNBas8WPdOr6pXS090BrRqwlOgI7dvM32D2NMQArMsTRjFoGIpx2ii
         qWjCidoQ0AB9/4eN8p3tTc5YhhDar4F+RRBSip1M+KYM+vTuLeWrhDPXBFxTNbB1JsMu
         zxvJjBRqSIJ9wLElt7+eC9FDHNpfbUuzV8RcOijlDbEUBdWUrVwL94Vv9MljgbkTQZ8c
         Wl9X8b3iSVm9XBPKF75vXwSKtuAEQoeKyINcfOBqup2VALvj2NxlUjimPnszk1LHA08P
         62xw==
X-Gm-Message-State: AOAM530sqnhoNIFE7+NUYOCUg4pRwqFQClfTBdABXve2JSsHGiU1uiLO
	nIIOjZ56qiVqUGg9SacePk+3Tru6gwo1CVEE
X-Google-Smtp-Source: ABdhPJwo5cSkxI2D1C8ZkSc2qZ7mTVNz2aK/UBr8KsEFrnwGIuu5s002HyTuxh1GsIRPcu0rExtpUw==
X-Received: by 2002:a62:fc4f:0:b029:19d:d060:27ca with SMTP id e76-20020a62fc4f0000b029019dd06027camr9474692pfh.66.1610041583702;
        Thu, 07 Jan 2021 09:46:23 -0800 (PST)
X-Received: by 2002:a92:9ada:: with SMTP id c87mr10270546ill.5.1610041194703;
 Thu, 07 Jan 2021 09:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-6-tientzu@chromium.org>
 <20210106185757.GB109735@localhost.localdomain>
In-Reply-To: <20210106185757.GB109735@localhost.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 8 Jan 2021 01:39:43 +0800
X-Gmail-Original-Message-ID: <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
Message-ID: <CALiNf2_dV13jbHqLt-r1eK+dtOcAKBGcWQCVMQn+eL6MuOrETQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, benh@kernel.crashing.org, 
	paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>," <joro@8bytes.org>, will@kernel.org, Frank Rowand <frowand.list@gmail.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
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

On Thu, Jan 7, 2021 at 2:58 AM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> > Introduce the new compatible string, restricted-dma-pool, for restricted
> > DMA. One can specify the address and length of the restricted DMA memory
> > region by restricted-dma-pool in the device tree.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > index e8d3096d922c..44975e2a1fd2 100644
> > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > @@ -51,6 +51,20 @@ compatible (optional) - standard definition
> >            used as a shared pool of DMA buffers for a set of devices. It can
> >            be used by an operating system to instantiate the necessary pool
> >            management subsystem if necessary.
> > +        - restricted-dma-pool: This indicates a region of memory meant to be
> > +          used as a pool of restricted DMA buffers for a set of devices. The
> > +          memory region would be the only region accessible to those devices.
> > +          When using this, the no-map and reusable properties must not be set,
> > +          so the operating system can create a virtual mapping that will be used
> > +          for synchronization. The main purpose for restricted DMA is to
> > +          mitigate the lack of DMA access control on systems without an IOMMU,
> > +          which could result in the DMA accessing the system memory at
> > +          unexpected times and/or unexpected addresses, possibly leading to data
> > +          leakage or corruption. The feature on its own provides a basic level
> > +          of protection against the DMA overwriting buffer contents at
> > +          unexpected times. However, to protect against general data leakage and
> > +          system memory corruption, the system needs to provide way to restrict
> > +          the DMA to a predefined memory region.
>
> Heya!
>
> I think I am missing something obvious here so please bear with my
> questions:
>
>  - This code adds the means of having the SWIOTLB pool tied to a specific
>    memory correct?

It doesn't affect the existing SWIOTLB. It just utilizes the existing SWIOTLB
code to create another DMA pool tied to a specific memory region for a given set
of devices. It bounces the streaming DMA (map/unmap) in and out of that region
and does the memory allocation (dma_direct_alloc) from the same region.

>
>
>  - Nothing stops the physical device from bypassing the SWIOTLB buffer.
>    That is if an errant device screwed up the length or DMA address, the
>    SWIOTLB would gladly do what the device told it do?

So the system needs to provide a way to lock down the memory access, e.g. MPU.

>
>  - This has to be combined with SWIOTLB-force-ish to always use the
>    bounce buffer, otherwise you could still do DMA without using
>    SWIOTLB (by not hitting the criteria for needing to use SWIOTLB)?

Since restricted DMA is for the devices that are not behind an IOMMU, I change
the criteria
`if (unlikely(swiotlb_force == SWIOTLB_FORCE))`
to
`if (unlikely(swiotlb_force == SWIOTLB_FORCE) || dev->dma_io_tlb_mem)`
in dma_direct_map_page().

Also, even if SWIOTLB=force, the restricted DMA pool is preferred if available
(get_io_tlb_mem in https://lore.kernel.org/patchwork/patch/1360995/).

Thanks!

