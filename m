Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466B1DEE5B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 19:35:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcBYm-0005Tx-SS; Fri, 22 May 2020 17:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2Re=7E=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jcBYl-0005Ts-2W
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 17:34:15 +0000
X-Inumbo-ID: 7478d9cc-9c52-11ea-9887-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7478d9cc-9c52-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 17:34:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC899206C3;
 Fri, 22 May 2020 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590168854;
 bh=bkgshU6AbS0fJo/CTj2DzVqhKPnZ0Xphtqqjh9kikv0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eSi4IF3LWHeaVP4rszG5wzmIBjjqjNqDcvCQBTU8KUyFwkM0Oh+Ow6iUg1jw3OAk0
 0w/3No0va/aFOz3I71+LNi36xW+LCxxNTBq257tnueccNsalMDzxVLsdBZpkO0j5lq
 5Iu6CCt39GlOmDVt5KSccs6JAEBpwqcDoIzXEL/4=
Date: Fri, 22 May 2020 10:34:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 08/10] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
In-Reply-To: <7aab1c00-c115-b989-61e5-fd7d28fa0d07@oracle.com>
Message-ID: <alpine.DEB.2.21.2005221033180.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-8-sstabellini@kernel.org>
 <7aab1c00-c115-b989-61e5-fd7d28fa0d07@oracle.com>
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
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 21 May 2020, Boris Ostrovsky wrote:
> On 5/20/20 7:45 PM, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >
> > Call dma_to_phys in is_xen_swiotlb_buffer.
> > Call phys_to_dma in xen_phys_to_bus.
> > Call dma_to_phys in xen_bus_to_phys.
> >
> > Everything is taken care of by these changes except for
> > xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent, which need a
> > few explicit phys_to_dma/dma_to_phys calls.
> >
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >  drivers/xen/swiotlb-xen.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > index c50448fd9b75..d011c4c7aa72 100644
> > --- a/drivers/xen/swiotlb-xen.c
> > +++ b/drivers/xen/swiotlb-xen.c
> > @@ -64,14 +64,16 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
> >  
> >  	dma |= paddr & ~XEN_PAGE_MASK;
> >  
> > -	return dma;
> > +	return phys_to_dma(dev, dma);
> >  }
> >  
> > -static inline phys_addr_t xen_bus_to_phys(struct device *dev, dma_addr_t baddr)
> > +static inline phys_addr_t xen_bus_to_phys(struct device *dev,
> > +					  dma_addr_t dma_addr)
> 
> 
> Since now dma address != bus address this is no longer
> xen_bus_to_phys(). (And I guess the same is rue for xen_phys_to_bus()).

Should I rename them to xen_dma_to_phys and xen_phys_to_dma?

 
> >  {
> > +	phys_addr_t baddr = dma_to_phys(dev, dma_addr);
> >  	unsigned long xen_pfn = bfn_to_pfn(XEN_PFN_DOWN(baddr));
> > -	dma_addr_t dma = (dma_addr_t)xen_pfn << XEN_PAGE_SHIFT;
> > -	phys_addr_t paddr = dma;
> > +	phys_addr_t paddr = (xen_pfn << XEN_PAGE_SHIFT) |
> > +			    (baddr & ~XEN_PAGE_MASK);
> >  
> >  	paddr |= baddr & ~XEN_PAGE_MASK;
> 
> 
> This line needs to go, no?

Yes, good point

