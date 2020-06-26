Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69B20B498
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:33:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqLX-0006V7-3p; Fri, 26 Jun 2020 15:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WZnf=AH=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1joqLV-0006V2-ET
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:32:53 +0000
X-Inumbo-ID: 4b95307e-b7c2-11ea-bb8b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4b95307e-b7c2-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593185570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTWe4soL1srkDL8PEEfq928W6GWa5t1pS8aCmfU8LHE=;
 b=NWi7+XgbhSCSK/wUfpqjFdV1YJFwxlJVxR/Myy/rufNo6jwZ5OZNxhsUv4yrvVQH8JtLx4
 alR3Jm0vQgOXdc98glkWdTOP6Kt0ma7joFXjZQcoH8SizrS481WnGA6huSziR/aGfNIxkN
 Y/z8ohnJKJXXSXjvxTOggDRu+gid3ng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-pC9Pyyy7MDugmDxvhj-VYw-1; Fri, 26 Jun 2020 11:32:48 -0400
X-MC-Unique: pC9Pyyy7MDugmDxvhj-VYw-1
Received: by mail-wm1-f71.google.com with SMTP id v24so11736402wmh.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 08:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RTWe4soL1srkDL8PEEfq928W6GWa5t1pS8aCmfU8LHE=;
 b=sp98Xf8wl89+oimxBAtLhZ/SASjSJZBg92IrtaiL74U+WqZ+3fZ4CzwZiCP8BTVvfm
 YEUsSKAMfXlyVDovOtKjitRQrfLNYnDCBjO2qSg3EKG+vKzzGH1YY5B3LHIuom7REC5+
 draqtlNTmbDXv4W61qyZTUggM8oDDXTPtETDS4YqvBERAVH3UgvG2FXsnkLSAKfihNt8
 PeCu+rLADJgDLDq9qhDcnBj5OElqesreElm98MbVSI0zlaDRzFY2OUOFKEA253lgCIvq
 Tc5+4ljSSV8RWpVAqZuqel2xzW9i6of3yN7+5hq+IL5pheuCYGnqtJEBHDt2ry2miNKw
 qXMQ==
X-Gm-Message-State: AOAM533w5xF6hQTBeXZBhsLTDVsJ60eigPUGzkCqsbAyoZZudi1Vhqyi
 EkjwOsdY3+UlxJrsoAVhxgLuU/yQxG8rCdF9cOKTUArXDAVzELG1j3jiTXDXc6Sstpo4aoAaKtC
 N2UHv42aOv/l/oNTeuJZN1fHbV1o=
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr4167955wrw.28.1593185566631; 
 Fri, 26 Jun 2020 08:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKcm6jtqvubhG72TQoDWqW1duiFh/JDhCCKL54qZ+AftyQ9QDCAEubqgx6Fkb+6w/6lcA4Aw==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr4167932wrw.28.1593185566346; 
 Fri, 26 Jun 2020 08:32:46 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 65sm18427582wma.48.2020.06.26.08.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:32:45 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:32:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200626110629-mutt-send-email-mst@kernel.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 25, 2020 at 10:31:27AM -0700, Stefano Stabellini wrote:
> On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > > > 
> > > > > > > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > > > > > > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > > > > > > disabled, it is not required.
> > > > > > > 
> > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > 
> > > > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > > > > > Xen was there first, but everyone else is using that now.
> > > > > 
> > > > > Unfortunately it is complicated and it is not related to
> > > > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > > > 
> > > > > 
> > > > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
> > > > > foreign mappings (memory coming from other VMs) to physical addresses.
> > > > > On x86, it also uses dma_ops to translate Linux's idea of a physical
> > > > > address into a real physical address (this is unneeded on ARM.)
> > > > > 
> > > > > 
> > > > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
> > > > > always and on Xen/ARM if Linux is Dom0 (because it has foreign
> > > > > mappings.) That is why we have the if (xen_domain) return true; in
> > > > > vring_use_dma_api.
> > > > 
> > > > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > > > 
> > > > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
> > > > forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> > > >
> > > > Unfortunately as a result Xen never got around to
> > > > properly setting VIRTIO_F_IOMMU_PLATFORM.
> > > 
> > > I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this because
> > > the usage of swiotlb_xen is not a property of virtio,
> > 
> > 
> > Basically any device without VIRTIO_F_ACCESS_PLATFORM
> > (that is it's name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is
> > what linux calls it) is declared as "special, don't follow normal rules
> > for access".
> > 
> > So yes swiotlb_xen is not a property of virtio, but what *is* a property
> > of virtio is that it's not special, just a regular device from DMA POV.
> 
> I am trying to understand what you meant but I think I am missing
> something.
> 
> Are you saying that modern virtio should always have
> VIRTIO_F_ACCESS_PLATFORM, hence use normal dma_ops as any other devices?

I am saying it's a safe default. Clear VIRTIO_F_ACCESS_PLATFORM if you
have some special needs e.g. you are very sure it's ok to bypass DMA
ops, or you need to support a legacy guest (produced in the window
between virtio 1 support in 2014 and support for
VIRTIO_F_ACCESS_PLATFORM in 2016).


> If that is the case, how is it possible that virtio breaks on ARM using
> the default dma_ops? The breakage is not Xen related (except that Xen
> turns dma_ops on). The original message from Peng was:
> 
>   vring_map_one_sg -> vring_use_dma_api
>                    -> dma_map_page
>   		       -> __swiotlb_map_page
>   		                ->swiotlb_map_page
>   				->__dma_map_area(phys_to_virt(dma_to_phys(dev, dev_addr)), size, dir);
>   However we are using per device dma area for rpmsg, phys_to_virt
>   could not return a correct virtual address for virtual address in
>   vmalloc area. Then kernel panic.
> 
> I must be missing something. Maybe it is because it has to do with RPMesg?

I think it's an RPMesg bug, yes.

> 
> > > > > You might have noticed that I missed one possible case above: Xen/ARM
> > > > > DomU :-)
> > > > > 
> > > > > Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
> > > > > (xen_domain) return true; would give the wrong answer in that case.
> > > > > Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
> > > > > the "normal" dma_ops fail.
> > > > > 
> > > > > 
> > > > > The solution I suggested was to make the check in vring_use_dma_api more
> > > > > flexible by returning true if the swiotlb_xen is supposed to be used,
> > > > > not in general for all Xen domains, because that is what the check was
> > > > > really meant to do.
> > > > 
> > > > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is wrong with that?
> > > 
> > > swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are the
> > > ones that are used. So you are saying, why don't we fix the default
> > > dma_ops to work with virtio?
> > > 
> > > It is bad that the default dma_ops crash with virtio, so yes I think it
> > > would be good to fix that. However, even if we fixed that, the if
> > > (xen_domain()) check in vring_use_dma_api is still a problem.
> > 
> > Why is it a problem? It just makes virtio use DMA API.
> > If that in turn works, problem solved.
> 
> You are correct in the sense that it would work. However I do think it
> is wrong for vring_use_dma_api to enable dma_ops/swiotlb-xen for Xen/ARM
> DomUs that don't need it. There are many different types of Xen guests,
> Xen x86 is drastically different from Xen ARM, it seems wrong to treat
> them the same way.

I could imagine some future Xen hosts setting a flag somewhere in the
platform capability saying "no xen specific flag, rely on
"VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
How about that?


> 
> 
> Anyway, re-reading the last messages of the original thread [1], it
> looks like Peng had a clear idea on how to fix the general issue. Peng,
> what happened with that?
> 
> 
> [1] https://lore.kernel.org/patchwork/patch/1033801/#1222404


