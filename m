Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279311DDE74
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 05:56:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbymI-0007nG-BV; Fri, 22 May 2020 03:55:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2Re=7E=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbymG-0007mG-FF
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 03:55:20 +0000
X-Inumbo-ID: 0ddb59d3-9be0-11ea-ab92-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ddb59d3-9be0-11ea-ab92-12813bfff9fa;
 Fri, 22 May 2020 03:55:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F8B620759;
 Fri, 22 May 2020 03:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590119719;
 bh=X9liTyH3K6qtc7i+pOoBtNjTMSeIvTNSkx5f9x/WbU8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xg72ogsw7M4B8R9hfY5qynnL5VL4GU1PiWUwtI59DbCpIADLESAPLlV2eTHnsymLA
 sI5fe9xs5/3QQuJ4+IL97JYVroylQwE6gUKikmi03+bTwUuB3BuQ2Q/HUw8mkdD8UH
 5vvjEMO2HqFyTflVHshis/W14h45AxXdtBMq+M58=
Date: Thu, 21 May 2020 20:55:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 02/10] swiotlb-xen: remove start_dma_addr
In-Reply-To: <6241b8f6-5c51-0486-55ae-d571b117a184@xen.org>
Message-ID: <alpine.DEB.2.21.2005211243060.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-2-sstabellini@kernel.org>
 <6241b8f6-5c51-0486-55ae-d571b117a184@xen.org>
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
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 21 May 2020, Julien Grall wrote:
> Hi,
> 
> On 21/05/2020 00:45, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > It is not strictly needed. Call virt_to_phys on xen_io_tlb_start
> > instead. It will be useful not to have a start_dma_addr around with the
> > next patches.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >   drivers/xen/swiotlb-xen.c | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > index a42129cba36e..b5e0492b07b9 100644
> > --- a/drivers/xen/swiotlb-xen.c
> > +++ b/drivers/xen/swiotlb-xen.c
> > @@ -52,8 +52,6 @@ static unsigned long xen_io_tlb_nslabs;
> >    * Quick lookup value of the bus address of the IOTLB.
> >    */
> >   -static u64 start_dma_addr;
> > -
> >   /*
> >    * Both of these functions should avoid XEN_PFN_PHYS because phys_addr_t
> >    * can be 32bit when dma_addr_t is 64bit leading to a loss in
> > @@ -241,7 +239,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
> >   		m_ret = XEN_SWIOTLB_EFIXUP;
> >   		goto error;
> >   	}
> > -	start_dma_addr = xen_virt_to_bus(xen_io_tlb_start);
> >   	if (early) {
> >   		if (swiotlb_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs,
> >   			 verbose))
> > @@ -389,7 +386,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device
> > *dev, struct page *page,
> >   	 */
> >   	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
> >   -	map = swiotlb_tbl_map_single(dev, start_dma_addr, phys,
> > +	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
> > phys,
> 
> xen_virt_to_bus() is implemented as xen_phys_to_bus(virt_to_phys()). Can you
> explain how the two are equivalent?

They are not equivalent. Looking at what swiotlb_tbl_map_single expects,
and also the implementation of swiotlb_init_with_tbl, I think
virt_to_phys is actually the one we want.

swiotlb_tbl_map_single compares the argument with __pa(tlb) which is
__pa(xen_io_tlb_start) which is virt_to_phys(xen_io_tlb_start).

