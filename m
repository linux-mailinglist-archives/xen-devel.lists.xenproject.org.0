Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED4AAEF07
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 01:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978896.1365715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCntF-0006Io-7E; Wed, 07 May 2025 23:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978896.1365715; Wed, 07 May 2025 23:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCntF-0006HM-4M; Wed, 07 May 2025 23:09:25 +0000
Received: by outflank-mailman (input) for mailman id 978896;
 Wed, 07 May 2025 23:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rmgq=XX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uCntD-0006HG-5b
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 23:09:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e700266-2b98-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 01:09:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4B245C47D8;
 Wed,  7 May 2025 23:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4150CC4CEE2;
 Wed,  7 May 2025 23:09:17 +0000 (UTC)
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
X-Inumbo-ID: 4e700266-2b98-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659358;
	bh=if38SdnC0AJjNobF5sj+Z+diQFRQsDZaQWTmcM3J0z0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bVUT35wFQvPLtu0LytwChJj8OCMGL50uKSUkAw/N299dum2gMqiUCpyl5S06wAMwP
	 LCEdm1qGVJNMvc0xia9kjE1XilBbXfDOpHCsU+MT0fvQXnKV30xtuGljLYyec6KmdU
	 oULJXb2Q7uBOQcET4vHAELvnYz0czULBYVtQ6q33A3B4HtESvwX2yIvtSGq/aN99sv
	 nupLajSjMLfm3Xb5VyTkcRwbKAkT+w97QNGWS/Nsk9lDPzNTbaXKMCQbpExRU3KOvb
	 aFIvTIa68tC4XysVp57S5ddzdoZm1eOBI+/yvxN/Snhy0o+j9u8OrcZTJ8DARIVDKk
	 8PdOrgh3+9ShA==
Date: Wed, 7 May 2025 16:09:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: John Ernberg <john.ernberg@actia.se>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "imx@lists.linux.dev" <imx@lists.linux.dev>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
In-Reply-To: <75266eb7-66a4-4477-ae8a-cbd1ebbee8db@actia.se>
Message-ID: <alpine.DEB.2.22.394.2505071602570.3879245@ubuntu-linux-20-04-desktop>
References: <20250502114043.1968976-1-john.ernberg@actia.se> <20250502114043.1968976-3-john.ernberg@actia.se> <alpine.DEB.2.22.394.2505021007460.3879245@ubuntu-linux-20-04-desktop> <75266eb7-66a4-4477-ae8a-cbd1ebbee8db@actia.se>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, John Ernberg wrote:
> Hi Stefano,
> 
> On 5/2/25 7:20 PM, Stefano Stabellini wrote:
> > +Christoph
> > 
> > On Fri, 2 May 2025, John Ernberg wrote:
> >> Needed by the eDMA v3 DMA engine found in iommu-less SoCs such as iMX8QXP
> >> to be able to perform DMA operations as a Xen Hardware Domain, which needs
> >> to be able to do DMA in MMIO space.
> 
> Self-note: The above part of the commit message is a disaster and should 
> read something like.
> 
> Needed by SoCs without an iommu (such as the iMX8QXP and it's eDMA v3 
> engine) that need to be able to perform DMA operations in MMIO space.
> 
> >>
> >> The callback implementation is basically the same as the one for direct
> >> mapping of resources, except this also takes into account Xen page
> >> mappings.
> >>
> >> There is nothing to do for unmap, just like with direct, so the unmap
> >> callback is not needed.
> >>
> >> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> >>
> >> ---
> >>
> >> I originally exported dma_direct_map_resource() and used that which
> >> appeared to work, but it felt like not checking Xen page mappings wasn't
> >> fully correct and I went with this. But if dma_direct_map_resource() is
> >> the correct approach here then I can submit that isntead.
> >> ---
> >>   drivers/xen/swiotlb-xen.c | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> >> index ef56a2500ed6..0f02fdd9128d 100644
> >> --- a/drivers/xen/swiotlb-xen.c
> >> +++ b/drivers/xen/swiotlb-xen.c
> >> @@ -285,6 +285,20 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
> >>                                           attrs, pool);
> >>   }
> >>
> >> +static dma_addr_t xen_swiotlb_map_resource(struct device *dev, phys_addr_t phys,
> >> +                                        size_t size, enum dma_data_direction dir,
> >> +                                        unsigned long attrs)
> >> +{
> >> +     dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
> > 
> > Yes, we need the xen_phys_to_dma call here. This is one of the reasons I
> > don't think we can use dma_direct_map_resource() to implement
> > map_resource
> > 
> > 
> >> +     BUG_ON(dir == DMA_NONE);
> >> +
> >> +     if (!dma_capable(dev, dev_addr, size, false))
> >> +             return DMA_MAPPING_ERROR;
> > 
> > But here you also need to check that phys+size doesn't cross a page
> > boundary. You need to call range_straddles_page_boundary, like we do at
> > the beginning of xen_swiotlb_map_page.
> > 
> > If it is possible to cross a page boundary, then we need to basically to
> > do the same thing here as we do in xen_swiotlb_map_page where we check
> > for:
> > 
> >          if (dma_capable(dev, dev_addr, size, true) &&
> >              !range_straddles_page_boundary(phys, size) &&
> >                  !xen_arch_need_swiotlb(dev, phys, dev_addr) &&
> >                  !is_swiotlb_force_bounce(dev))
> >                  goto done;
> > 
> > if all is well, we go with the native path, otherwise we bounce on
> > swiotlb-xen.
> > 
> 
> I'll preface this with that it's my first deep dive in DMA, so the 
> following may entirely be me being stupid:
> 
> I'm not sure a straddles page boundary path makes sense.
> 
> This mapping is not for a RAM backed address. In the eDMA case for the 
> iMX8QXP the `phys` coming in here is the address of a register.

Ok, this information is important :-)

I am not certain whether the map_resource interface can only be called
for MMIO addresses or if it can also be called for RAM-backed addresses
with a size > PAGE_SIZE. In the latter case, we could run into the issue
I was describing.


> I cannot see how a swiotlb bounce would fix anything if you end up
> straddling a page boundary. At most I can see a WARN_ON with a
> DMA_MAPPING_ERROR return if such a check would yield true.
> 
> Let's say you want to do a DEV_TO_MEM and a check decides you need to 
> bounce it you'd bounce an RX register address. I cannot see how that DMA 
> would ever end up doing the expected thing.
> 
> The eDMA engine will manage the RX/TX registers for an IP block and move 
> the data between them and RAM, where the RAM memory is mapped separately 
> by dma_map_page (and family). And these can be swiotlb bounced via the 
> map page callback with no problem.

OK thanks for the explanation. Like I wrote above, if we are guaranteed
that map_resource cannot be called for RAM-backed addresses or size is
less than PAGE_SIZE, then your patch is good as-is. If there are no such
guarantees, then we'll have to think a bit more about it.

