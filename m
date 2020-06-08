Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD1C1F2247
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 01:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiQr6-00034T-KL; Mon, 08 Jun 2020 23:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jiQr6-00034O-1L
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 23:07:00 +0000
X-Inumbo-ID: c16e39e2-a9dc-11ea-b2c4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c16e39e2-a9dc-11ea-b2c4-12813bfff9fa;
 Mon, 08 Jun 2020 23:06:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C48520820;
 Mon,  8 Jun 2020 23:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657618;
 bh=9kgiWfc80bQ1pFTP10CoDvlD9i3E2sMoZB2p3Vvgd/g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IAKP9+uyhx+Mw+/ttmtWvmUV5DWr7Hx4rynsr/VlhWY7naVEcoN2oD/N3/5SjrSVB
 EmHPS5CiBaqDmNLIqVqDyRmUgYL0/hy7nAFMhxlSh1iB+5l18sVCmDe/ECVJA17l06
 HJUi2skFlwTFsob6tOCCspquwIIueUlnqfhHl8Bo=
Date: Mon, 8 Jun 2020 16:06:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 08/11] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
In-Reply-To: <20200608070850.GD15742@infradead.org>
Message-ID: <alpine.DEB.2.21.2006081558400.2815@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-8-sstabellini@kernel.org>
 <20200608070850.GD15742@infradead.org>
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
> On Wed, Jun 03, 2020 at 03:22:44PM -0700, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > With some devices physical addresses are different than dma addresses.
> > To be able to deal with these cases, we need to call phys_to_dma on
> > physical addresses (including machine addresses in Xen terminology)
> > before returning them from xen_swiotlb_alloc_coherent and
> > xen_swiotlb_map_page.
> > 
> > We also need to convert dma addresses back to physical addresses using
> > dma_to_phys in xen_swiotlb_free_coherent and xen_swiotlb_unmap_page if
> > we want to do any operations on them.
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
> > Tested-by: Corey Minyard <cminyard@mvista.com>
> > Tested-by: Roman Shaposhnik <roman@zededa.com>
> > ---
> > Changes in v2:
> > - improve commit message
> > ---
> >  drivers/xen/swiotlb-xen.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > index 0a6cb67f0fc4..60ef07440905 100644
> > --- a/drivers/xen/swiotlb-xen.c
> > +++ b/drivers/xen/swiotlb-xen.c
> > @@ -64,16 +64,16 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
> >  
> >  	dma |= paddr & ~XEN_PAGE_MASK;
> >  
> > -	return dma;
> > +	return phys_to_dma(dev, dma);
> 
> So looking at this function:
> 
> The dma name for something passed to phys_to_dma is really
> weird.

Yeah, that is true, I am not sure why I chose that confusing name. I'll
rename it.


> The fact that the comments says don't use XEN_PFN_PHYS
> beause of the type mismatch while nothing but swiotlb-xen is the only
> user of XEN_PFN_PHYS is also weird.  I think XEN_PFN_PHYS needs to move
> to swiotlb-xen first, then use a hardcoded u64 for the size, and the
> split the function into a phys_to_xen_phys (or so) function where
> the result gets passed to phys_to_dma.

I understand what you are suggesting about having something like:

    xen_phys_to_dma(...)
    {
        phys_addr_t phys = xen_phys_to_bus(dev, paddr)
        return phys_to_dma(phys);
    }

I thought about it myself. I'll do it.

But I don't think I understood the comment about XEN_PFN_PHYS.


> Similar for the reverse direction.

OK

