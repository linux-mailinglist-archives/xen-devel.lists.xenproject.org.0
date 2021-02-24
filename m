Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D546E323472
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 01:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89136.167669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEhuf-0005Io-VP; Wed, 24 Feb 2021 00:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89136.167669; Wed, 24 Feb 2021 00:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEhuf-0005IQ-RP; Wed, 24 Feb 2021 00:20:21 +0000
Received: by outflank-mailman (input) for mailman id 89136;
 Wed, 24 Feb 2021 00:20:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEhue-0005IG-OF
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 00:20:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70a8238c-a04a-4ffa-8619-79a4178e0301;
 Wed, 24 Feb 2021 00:20:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5E8464E89;
 Wed, 24 Feb 2021 00:20:18 +0000 (UTC)
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
X-Inumbo-ID: 70a8238c-a04a-4ffa-8619-79a4178e0301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614126018;
	bh=Z+5yeHvLg7b690ETZIHtVhwsU2cPjYuOULSm4Lixplw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AQKCf+sqhZJgio3h1+YwN+m3Z9fweF/VBYpbBDw/VpeSiXyMgepxF1ANJWH6z3a4b
	 RjCD00wPd8dKRH7sWkc9bRiVioxQzvmXduSpRpU6cjT7PW96pplm3a0oyxxWh7dtsC
	 O5NJG4eaTlecXavNRHgvJYVVkdnERUpFusm1p/Hmdd+m6Qqb+rVZYj9izs/YqEU9Te
	 yF/Ewc91PtLXBIWjCAOnr0dR6QsgKu+LRXVNKpssh5UKxds9mU8MDTZLC7Nh7sxkGn
	 aOyeYbxtOIbjDlVtuRK2GG62ng973hzFdvSCQvge+HANDW5CUPyYSqLXyELaJFEOSD
	 1N5FLDYKz8P0A==
Date: Tue, 23 Feb 2021 16:20:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
In-Reply-To: <98a15b6d-7460-31a0-0b4a-acf035571a17@xen.org>
Message-ID: <alpine.DEB.2.21.2102231520510.3234@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s> <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org> <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s> <0be0196f-5b3f-73f9-5ab7-7a54faabec5c@xen.org>
 <alpine.DEB.2.21.2102180920570.3234@sstabellini-ThinkPad-T480s> <98a15b6d-7460-31a0-0b4a-acf035571a17@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Feb 2021, Julien Grall wrote:
> On 19/02/2021 01:42, Stefano Stabellini wrote:
> > On Thu, 18 Feb 2021, Julien Grall wrote:
> > > On 17/02/2021 23:54, Stefano Stabellini wrote:
> > > > On Wed, 17 Feb 2021, Julien Grall wrote:
> > > > > On 17/02/2021 02:00, Stefano Stabellini wrote:
> > > > But actually it was always wrong for Linux to enable swiotlb-xen without
> > > > checking whether it is 1:1 mapped or not. Today we enable swiotlb-xen in
> > > > dom0 and disable it in domU, while we should have enabled swiotlb-xen if
> > > > 1:1 mapped no matter dom0/domU. (swiotlb-xen could be useful in a 1:1
> > > > mapped domU driver domain.)
> > > > 
> > > > 
> > > > There is an argument (Andy was making on IRC) that being 1:1 mapped or
> > > > not is an important information that Xen should provide to the domain
> > > > regardless of anything else.
> > > > 
> > > > So maybe we should add two flags:
> > > > 
> > > > - XENFEAT_direct_mapped
> > > > - XENFEAT_not_direct_mapped
> > > 
> > > I am guessing the two flags is to allow Linux to fallback to the default
> > > behavior (depending on dom0 vs domU) on older hypervisor On newer
> > > hypervisors,
> > > one of this flag would always be set. Is that correct?
> > 
> > Yes. On a newer hypervisor one of the two would be present and Linux can
> > make an informed decision. On an older hypervisor, neither flag would be
> > present, so Linux will have to keep doing what is currently doing.
> > 
> >   
> > > > To all domains. This is not even ARM specific. Today dom0 would get
> > > > XENFEAT_direct_mapped and domUs XENFEAT_not_direct_mapped. With cache
> > > > coloring all domains will get XENFEAT_not_direct_mapped. With Bertrand's
> > > > team work on 1:1 mapping domUs, some domUs might start to get
> > > > XENFEAT_direct_mapped also one day soon.
> > > > 
> > > > Now I think this is the best option because it is descriptive, doesn't
> > > > imply anything about what Linux should or should not do, and doesn't
> > > > depend on unreliable IOMMU information.
> > > 
> > > That's a good first step but this still doesn't solve the problem on
> > > whether
> > > the swiotlb can be disabled per-device or even disabling the expensive 1:1
> > > mapping in the IOMMU page-tables.
> > > 
> > > It feels to me we need to have a more complete solution (not necessary
> > > implemented) so we don't put ourself in the corner again.
> > 
> > Yeah, XENFEAT_{not,}_direct_mapped help cleaning things up, but don't
> > solve the issues you described. Those are difficult to solve, it would
> > be nice to have some idea.
> > 
> > One issue is that we only have limited information passed via device
> > tree, limited to the "iommus" property. If that's all we have, there
> > isn't much we can do.
> 
> We can actually do a lot with that :). See more below.
> 
> > The device tree list is maybe the only option,
> > although it feels a bit complex intuitively. We could maybe replace the
> > real iommu node with a fake iommu node only to use it to "tag" devices
> > protected by the real iommu.
> > 
> > I like the idea of rewarding well-designed boards; boards that have an
> > IOMMU and works for all DMA-mastering devices. It would be great to be
> > able to optimize those in a simple way, without breaking the others. But
> > unfortunately due to the limited info on device tree, I cannot think of
> > a way to do it automatically. And it is not great to rely on platform
> > files.
> 
> We would not be able to automate in Xen alone, however we can ask the help of
> Linux.
> 
> Xen is able to tell whether it has protected the device with an IOMMU or not.
> When creating the domain device-tree, it could replace the IOMMU node with a
> Xen specific one.
> 
> With the Xen IOMMU nodes, Linux could find out whether the device needs to use
> the swiotlb ops or not.

That might work.

Another similar idea is to use "dma-ranges" in device tree.  dma-ranges
can only be used for a bus and allow us to specify special DMA address
mappings between the nodes under the bus the parent address space.

If we created a new bus node called "amba-nodma" with a "dma-ranges"
that basically traslates child addresses into an invalid address or size
zero, and moved devices without "iommus" under it, the consequence is
that all those devices will be accessible and usable by Linux but there
would be no DMA transactions originating from them. Or the transactions
would fail explicitely.

Thus, IOMMU-protected devices would continue to work as normal.
Non-dma-mastering non-IOMMU-protected devices would also continue to
work as normal.
Dma-mastering non-IOMMU-protected devices would not work, but the
failure would be controlled and explicit.

At that point, swiotlb-xen could be enabled only for devices that have
this special dma-ranges address translation.

On one hand, this technique would require fewer changes in Linux -- it
might even work with almost no changes on the Linux side thanks to the
automatic fallback to the swiotlb when dma_mask checks fail.

On the other hand, I really dislike the magic invalid address
translation. If it is invalid, the device DMA should not work at all; it
should not trigger the swiotlb-xen. I can't think of a way to make this
clean from a device tree spec perspective. I thought I would mention it
in case it gives you any good ideas.


> Skipping extra mapping in the IOMMU is a bit trickier. I can see two
> solutions:
>   - A per-domain toggle to skip the IOMMU mapping. This is assuming that Linux
> is able to know that all DMA capable devices are protected. The problem is a
> driver may be loaded later. Such drivers are unlikely to use existing grant,
> so the toggle could be used to say "all the grant after this point will
> require a mapping (or not)"

I cannot think of a way for Linux to figure out that all DMA capable
devices are protected. Is the idea that Linux would base the decision on
the Linux drivers, not the capability of the hardware? Even using the
drivers, I don't know if it would be possible to implement.


>   - A per-grant flag to indicate whether an IOMMU mapping is necessary. This
> is assuming we are able to know whether a grant will be used for DMA.

That might be easier because the caller of gnttab_map_refs in Linux
should be able to make a decent guess.

