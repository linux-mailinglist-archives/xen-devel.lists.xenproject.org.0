Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973771F2E0A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 02:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiSHg-0002ue-Dm; Tue, 09 Jun 2020 00:38:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aF9f=7W=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jiSHe-0002uZ-Tl
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 00:38:30 +0000
X-Inumbo-ID: 8a42888a-a9e9-11ea-b2ce-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a42888a-a9e9-11ea-b2ce-12813bfff9fa;
 Tue, 09 Jun 2020 00:38:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DF5F207ED;
 Tue,  9 Jun 2020 00:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591663109;
 bh=dZEsuHc63lSqJBCxvHs+BfEmnrOBWd5r93zBgTcjIfE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zmKl2ZEkH3EPkdd/jdWO6poHzl1BGkaJeJqk7D8IWfcwf0Oy+viDzCfDk0hL7we2P
 ZJgWIIVk9+QTjD+rtMZELhnH2B5Qf0fORt1zwpbXbC6xxcsEeq1IDhEyN/iT784RaK
 kOjRS48WEd1Wq7jjCOild9hhx4Jod2X0IvbE8uII=
Date: Mon, 8 Jun 2020 17:38:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 10/11] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
In-Reply-To: <20200608071221.GF15742@infradead.org>
Message-ID: <alpine.DEB.2.21.2006081614530.2815@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-10-sstabellini@kernel.org>
 <20200608071221.GF15742@infradead.org>
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 konrad.wilk@oracle.com, roman@zededa.com, linux-kernel@vger.kernel.org,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 8 Jun 2020, Christoph Hellwig wrote:
> On Wed, Jun 03, 2020 at 03:22:46PM -0700, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > xen_dma_sync_for_cpu, xen_dma_sync_for_device, xen_arch_need_swiotlb are
> > getting called passing dma addresses. On some platforms dma addresses
> > could be different from physical addresses. Before doing any operations
> > on these addresses we need to convert them back to physical addresses
> > using dma_to_phys.
> > 
> > Add dma_to_phys calls to xen_dma_sync_for_cpu, xen_dma_sync_for_device,
> > and xen_arch_need_swiotlb.
> > 
> > dma_cache_maint is fixed by the next patch.
> 
> The calling conventions because really weird now because
> xen_dma_sync_for_{device,cpu} already get both a phys_addr_t and
> a dma_addr_t.  
> 
> > 
> > -	if (pfn_valid(PFN_DOWN(handle)))
> > +	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
> 
> But here we translate the dma address to a phys addr
> 
> >  		arch_sync_dma_for_cpu(paddr, size, dir);
> 
> While this still uses the passed in paddr.  I think the uses of
> addresses in this code really needs a major rethink.


Yeah, the pfn_valid check is a bit weird by definition because we are
using it to understand whether the address belong to us or to another
VM. To do the pfn_valid check we need to translate the dma address into
something the CPU understands, hence, the dma_to_phys call.

Why can't we use the already-provided paddr? Because paddr has been
translated twice:
1) from dma to maybe-foreign phys address (could be ours, or another VM)
2) from maybe-foreign address to local (using our local mapping of the foreign page)

In fact, it would be clearer if we had all three addresses as parameters
of xen_dma_sync_for_cpu: the dma address, the maybe-foreign physical
address (we tend to call it xenbus address, baddr), the local physical
address. Something like:


void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
			  phys_addr_t baddr, phys_addr_t paddr, size_t size,
			  enum dma_data_direction dir)
{
	if (pfn_valid(baddr))
		arch_sync_dma_for_cpu(paddr, size, dir);
	else if (dir != DMA_TO_DEVICE)
		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
}

