Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E720A416
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 19:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joVik-0000jW-I2; Thu, 25 Jun 2020 17:31:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QtZ7=AG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1joVij-0000jR-W3
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 17:31:30 +0000
X-Inumbo-ID: b3e3bd62-b709-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3e3bd62-b709-11ea-b7bb-bc764e2007e4;
 Thu, 25 Jun 2020 17:31:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FEDB20789;
 Thu, 25 Jun 2020 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593106288;
 bh=WhqBDPdOBNk4Nn0nlm/U/FBDprV3efhSWtdS+mTEZhI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KNaQ/3jj9TpuSnPt+fOmTGLlW7zN97Hc5nMeEhGWFn3RY4Vu5yOi/rL1784qarDyK
 p9hWwTE8sLerEFX9rM+jYpsgztP56cS6phku8LqLBrkd8JcN8KNPpoVQD+Ru6HllCU
 KTeOrcYXJqrOnQ00srcPg/hv/0Q/e8ghv8knwqvk=
Date: Thu, 25 Jun 2020 10:31:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20200624181026-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > > 
> > > > > > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > > > > > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > > > > > disabled, it is not required.
> > > > > > 
> > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > 
> > > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > > > > Xen was there first, but everyone else is using that now.
> > > > 
> > > > Unfortunately it is complicated and it is not related to
> > > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > > 
> > > > 
> > > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
> > > > foreign mappings (memory coming from other VMs) to physical addresses.
> > > > On x86, it also uses dma_ops to translate Linux's idea of a physical
> > > > address into a real physical address (this is unneeded on ARM.)
> > > > 
> > > > 
> > > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
> > > > always and on Xen/ARM if Linux is Dom0 (because it has foreign
> > > > mappings.) That is why we have the if (xen_domain) return true; in
> > > > vring_use_dma_api.
> > > 
> > > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > > 
> > > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
> > > forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> > >
> > > Unfortunately as a result Xen never got around to
> > > properly setting VIRTIO_F_IOMMU_PLATFORM.
> > 
> > I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this because
> > the usage of swiotlb_xen is not a property of virtio,
> 
> 
> Basically any device without VIRTIO_F_ACCESS_PLATFORM
> (that is it's name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is
> what linux calls it) is declared as "special, don't follow normal rules
> for access".
> 
> So yes swiotlb_xen is not a property of virtio, but what *is* a property
> of virtio is that it's not special, just a regular device from DMA POV.

I am trying to understand what you meant but I think I am missing
something.

Are you saying that modern virtio should always have
VIRTIO_F_ACCESS_PLATFORM, hence use normal dma_ops as any other devices?

If that is the case, how is it possible that virtio breaks on ARM using
the default dma_ops? The breakage is not Xen related (except that Xen
turns dma_ops on). The original message from Peng was:

  vring_map_one_sg -> vring_use_dma_api
                   -> dma_map_page
  		       -> __swiotlb_map_page
  		                ->swiotlb_map_page
  				->__dma_map_area(phys_to_virt(dma_to_phys(dev, dev_addr)), size, dir);
  However we are using per device dma area for rpmsg, phys_to_virt
  could not return a correct virtual address for virtual address in
  vmalloc area. Then kernel panic.

I must be missing something. Maybe it is because it has to do with RPMesg?
 

> > > > You might have noticed that I missed one possible case above: Xen/ARM
> > > > DomU :-)
> > > > 
> > > > Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
> > > > (xen_domain) return true; would give the wrong answer in that case.
> > > > Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
> > > > the "normal" dma_ops fail.
> > > > 
> > > > 
> > > > The solution I suggested was to make the check in vring_use_dma_api more
> > > > flexible by returning true if the swiotlb_xen is supposed to be used,
> > > > not in general for all Xen domains, because that is what the check was
> > > > really meant to do.
> > > 
> > > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is wrong with that?
> > 
> > swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are the
> > ones that are used. So you are saying, why don't we fix the default
> > dma_ops to work with virtio?
> > 
> > It is bad that the default dma_ops crash with virtio, so yes I think it
> > would be good to fix that. However, even if we fixed that, the if
> > (xen_domain()) check in vring_use_dma_api is still a problem.
> 
> Why is it a problem? It just makes virtio use DMA API.
> If that in turn works, problem solved.

You are correct in the sense that it would work. However I do think it
is wrong for vring_use_dma_api to enable dma_ops/swiotlb-xen for Xen/ARM
DomUs that don't need it. There are many different types of Xen guests,
Xen x86 is drastically different from Xen ARM, it seems wrong to treat
them the same way.



Anyway, re-reading the last messages of the original thread [1], it
looks like Peng had a clear idea on how to fix the general issue. Peng,
what happened with that?


[1] https://lore.kernel.org/patchwork/patch/1033801/#1222404

