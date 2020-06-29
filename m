Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB0B20E993
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 01:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jq3Tf-00089t-Ax; Mon, 29 Jun 2020 23:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jq3Td-00089n-5z
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 23:46:17 +0000
X-Inumbo-ID: b5e71332-ba62-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5e71332-ba62-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 23:46:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 295E220780;
 Mon, 29 Jun 2020 23:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593474370;
 bh=WDGpgzzhrbi6jQoYwzCQkNgOhgPsy28c3rLvtZR7RUk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Pf5MDB7DOBdEr6c0RglkzzT1r3dTYzbt2u/c7A3AdRs/o8UoRl6QypV4aghq8AZ4i
 IJAPil2gChGThnm9ZkxQxnhckYBUxA9BiGW12zOqqiKnj7oshyDxTRcpd1NDKRLeO1
 Tc1pH31YrW/NkNz+YyAWrTi3TIP+BTENO+WdOpEk=
Date: Mon, 29 Jun 2020 16:46:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <20200626110629-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
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

On Fri, 26 Jun 2020, Michael S. Tsirkin wrote:
> On Thu, Jun 25, 2020 at 10:31:27AM -0700, Stefano Stabellini wrote:
> > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > On Wed, Jun 24, 2020 at 02:53:54PM -0700, Stefano Stabellini wrote:
> > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > On Wed, Jun 24, 2020 at 10:59:47AM -0700, Stefano Stabellini wrote:
> > > > > > On Wed, 24 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > > On Wed, Jun 24, 2020 at 05:17:32PM +0800, Peng Fan wrote:
> > > > > > > > Export xen_swiotlb for all platforms using xen swiotlb
> > > > > > > > 
> > > > > > > > Use xen_swiotlb to determine when vring should use dma APIs to map the
> > > > > > > > ring: when xen_swiotlb is enabled the dma API is required. When it is
> > > > > > > > disabled, it is not required.
> > > > > > > > 
> > > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > 
> > > > > > > Isn't there some way to use VIRTIO_F_IOMMU_PLATFORM for this?
> > > > > > > Xen was there first, but everyone else is using that now.
> > > > > > 
> > > > > > Unfortunately it is complicated and it is not related to
> > > > > > VIRTIO_F_IOMMU_PLATFORM :-(
> > > > > > 
> > > > > > 
> > > > > > The Xen subsystem in Linux uses dma_ops via swiotlb_xen to translate
> > > > > > foreign mappings (memory coming from other VMs) to physical addresses.
> > > > > > On x86, it also uses dma_ops to translate Linux's idea of a physical
> > > > > > address into a real physical address (this is unneeded on ARM.)
> > > > > > 
> > > > > > 
> > > > > > So regardless of VIRTIO_F_IOMMU_PLATFORM, dma_ops should be used on Xen/x86
> > > > > > always and on Xen/ARM if Linux is Dom0 (because it has foreign
> > > > > > mappings.) That is why we have the if (xen_domain) return true; in
> > > > > > vring_use_dma_api.
> > > > > 
> > > > > VIRTIO_F_IOMMU_PLATFORM makes guest always use DMA ops.
> > > > > 
> > > > > Xen hack predates VIRTIO_F_IOMMU_PLATFORM so it *also*
> > > > > forces DMA ops even if VIRTIO_F_IOMMU_PLATFORM is clear.
> > > > >
> > > > > Unfortunately as a result Xen never got around to
> > > > > properly setting VIRTIO_F_IOMMU_PLATFORM.
> > > > 
> > > > I don't think VIRTIO_F_IOMMU_PLATFORM would be correct for this because
> > > > the usage of swiotlb_xen is not a property of virtio,
> > > 
> > > 
> > > Basically any device without VIRTIO_F_ACCESS_PLATFORM
> > > (that is it's name in latest virtio spec, VIRTIO_F_IOMMU_PLATFORM is
> > > what linux calls it) is declared as "special, don't follow normal rules
> > > for access".
> > > 
> > > So yes swiotlb_xen is not a property of virtio, but what *is* a property
> > > of virtio is that it's not special, just a regular device from DMA POV.
> > 
> > I am trying to understand what you meant but I think I am missing
> > something.
> > 
> > Are you saying that modern virtio should always have
> > VIRTIO_F_ACCESS_PLATFORM, hence use normal dma_ops as any other devices?
> 
> I am saying it's a safe default. Clear VIRTIO_F_ACCESS_PLATFORM if you
> have some special needs e.g. you are very sure it's ok to bypass DMA
> ops, or you need to support a legacy guest (produced in the window
> between virtio 1 support in 2014 and support for
> VIRTIO_F_ACCESS_PLATFORM in 2016).

Ok thanks. I understand and it makes sense to me.

 
> > > > > > You might have noticed that I missed one possible case above: Xen/ARM
> > > > > > DomU :-)
> > > > > > 
> > > > > > Xen/ARM domUs don't need swiotlb_xen, it is not even initialized. So if
> > > > > > (xen_domain) return true; would give the wrong answer in that case.
> > > > > > Linux would end up calling the "normal" dma_ops, not swiotlb-xen, and
> > > > > > the "normal" dma_ops fail.
> > > > > > 
> > > > > > 
> > > > > > The solution I suggested was to make the check in vring_use_dma_api more
> > > > > > flexible by returning true if the swiotlb_xen is supposed to be used,
> > > > > > not in general for all Xen domains, because that is what the check was
> > > > > > really meant to do.
> > > > > 
> > > > > Why not fix DMA ops so they DTRT (nop) on Xen/ARM DomU? What is wrong with that?
> > > > 
> > > > swiotlb-xen is not used on Xen/ARM DomU, the default dma_ops are the
> > > > ones that are used. So you are saying, why don't we fix the default
> > > > dma_ops to work with virtio?
> > > > 
> > > > It is bad that the default dma_ops crash with virtio, so yes I think it
> > > > would be good to fix that. However, even if we fixed that, the if
> > > > (xen_domain()) check in vring_use_dma_api is still a problem.
> > > 
> > > Why is it a problem? It just makes virtio use DMA API.
> > > If that in turn works, problem solved.
> > 
> > You are correct in the sense that it would work. However I do think it
> > is wrong for vring_use_dma_api to enable dma_ops/swiotlb-xen for Xen/ARM
> > DomUs that don't need it. There are many different types of Xen guests,
> > Xen x86 is drastically different from Xen ARM, it seems wrong to treat
> > them the same way.
> 
> I could imagine some future Xen hosts setting a flag somewhere in the
> platform capability saying "no xen specific flag, rely on
> "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> How about that?

Yes, that would be fine and there is no problem implementing something
like that when we get virtio support in Xen. Today there are still no
virtio interfaces provided by Xen to ARM guests (no virtio-block/net,
etc.)

In fact, in both cases we are discussing virtio is *not* provided by
Xen; it is a firmware interface to something entirely different:

1) virtio is used to talk to a remote AMP processor (RPMesg)
2) virtio is used to talk to a secure-world firmware/OS (Trusty)


VIRTIO_F_ACCESS_PLATFORM is not set by Xen in these cases but by RPMesg
and by Trusty respectively. I don't know if Trusty should or should not
set VIRTIO_F_ACCESS_PLATFORM, but I think Linux should still work
without issues.

The xen_domain() check in Linux makes it so that vring_use_dma_api
returns the opposite value on native Linux compared to Linux as Xen/ARM
DomU by "accident". By "accident" because there is no architectural
reason why Linux Xen/ARM DomU should behave differently compared to
native Linux in this regard.

I hope that now it is clearer why I think the if (xen_domain()) check
needs to be improved anyway, even if we fix generic dma_ops with virtio
interfaces missing VIRTIO_F_ACCESS_PLATFORM.

