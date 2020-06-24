Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA55207B20
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 20:00:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo9gd-0007Eb-Fw; Wed, 24 Jun 2020 17:59:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z21m=AF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jo9gc-0007EV-13
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 17:59:50 +0000
X-Inumbo-ID: 7eef0064-b644-11ea-8117-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eef0064-b644-11ea-8117-12813bfff9fa;
 Wed, 24 Jun 2020 17:59:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F00207DD;
 Wed, 24 Jun 2020 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593021588;
 bh=lqF4UvFTuSVPWPvYKcQ8+owOKSTEFacagpA6y42+2I4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2OyEwIQ2W+yC8MeIiJn+zg6EpblYaMgeW1W2KIyhIYSiWBv27LoWjQc7whL/xeVKv
 y88icKjpG7HCb5h5QohX0bjtTPKL9DqECdzfBD8KC9GTdN07U3EonUUVOnBxKcXHUo
 yqYasuZpBgXc5lZj44gwka4tdlhLxCPXuN8CH3H4=
Date: Wed, 24 Jun 2020 10:59:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20200624050355-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, sstabellini@kernel.org,
 konrad.wilk@oracle.com, jasowang@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, linux-imx@nxp.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > Export xen_swiotlb for all platforms using xen swiotlb
> > 
> > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > disabled, it is not required.
> > 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> Xen was there first, but everyone else is using that now.

Unfortunately it is complicated and it is not related to
VIRTIO_F_IOMMU_PLATFORM :-(


The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
foreign mappings (memory coming from other VMs) to physical addresses.
On x86, it also uses dma_ops to translate Linux's idea of a physical
address into a real physical address (this is unneeded on ARM.)


So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
always and on Xen/ARM if Linux is Dom0 (because it has foreign
mappings.) That is why we have the if (xen_domain) return true; in
vring_use_dma_api.

You might have noticed that I missed one possible case above: Xen/ARM
DomU :-)

Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
(xen_domain) return true; would give the wrong answer in that case.
Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
the "normal" dma_ops fail.


The solution I suggested was to make the check in vring_use_dma_api more
flexible by returning true if the swiotlb_xen is supposed to be used,
not in general for all Xen domains, because that is what the check was
really meant to do.


In this regards I have two more comments:

- the comment on top of the check in vring_use_dma_api is still valid
- the patch looks broken on x86: it should always return true, but it
  returns false instead

 
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index a2de775801af..768afd79f67a 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -252,7 +252,7 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
> >  	 * the DMA API if we're a Xen guest, which at least allows
> >  	 * all of the sensible Xen configurations to work correctly.
> >  	 */
> > -	if (xen_domain())
> > +	if (xen_vring_use_dma())
> >  		return true;
> >  
> >  	return false;
> 
> 
> The comment above this should probably be fixed.

> 

