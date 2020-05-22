Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C061DF0C4
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 22:48:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcEa6-00076m-LK; Fri, 22 May 2020 20:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2Re=7E=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jcEa5-00076h-S3
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 20:47:49 +0000
X-Inumbo-ID: 7f43f146-9c6d-11ea-9887-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f43f146-9c6d-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 20:47:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44A1C20723;
 Fri, 22 May 2020 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590180468;
 bh=ABXEd3vc08BMg4ogCVIQEmBIL34CZ7hlNe8SZ9PbUAg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QBQVmp1VQZ2dAmCNmxEI92dXe8V0WuRDH3d/aYG8pRWxtwKEeupy1RLtLeK0fqVGJ
 yH0YKWXQ2E1JqwtNUKz1bfqrKnayppYXP5JBYeNJZVX+JM4GetGxI8H2+TPmrB1hHL
 Dext8r1i2WPfHkst+1gu6kSoUmo/96C3RHGFAxus=
Date: Fri, 22 May 2020 13:47:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 02/10] swiotlb-xen: remove start_dma_addr
In-Reply-To: <ab89bf08-a02f-85af-8f83-6a851d72ccf2@xen.org>
Message-ID: <alpine.DEB.2.21.2005221336530.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-2-sstabellini@kernel.org>
 <6241b8f6-5c51-0486-55ae-d571b117a184@xen.org>
 <alpine.DEB.2.21.2005211243060.27502@sstabellini-ThinkPad-T480s>
 <ab89bf08-a02f-85af-8f83-6a851d72ccf2@xen.org>
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

On Fri, 22 May 2020, Julien Grall wrote:
> On 22/05/2020 04:55, Stefano Stabellini wrote:
> > On Thu, 21 May 2020, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 21/05/2020 00:45, Stefano Stabellini wrote:
> > > > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > 
> > > > It is not strictly needed. Call virt_to_phys on xen_io_tlb_start
> > > > instead. It will be useful not to have a start_dma_addr around with the
> > > > next patches.
> > > > 
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > ---
> > > >    drivers/xen/swiotlb-xen.c | 5 +----
> > > >    1 file changed, 1 insertion(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > > > index a42129cba36e..b5e0492b07b9 100644
> > > > --- a/drivers/xen/swiotlb-xen.c
> > > > +++ b/drivers/xen/swiotlb-xen.c
> > > > @@ -52,8 +52,6 @@ static unsigned long xen_io_tlb_nslabs;
> > > >     * Quick lookup value of the bus address of the IOTLB.
> > > >     */
> > > >    -static u64 start_dma_addr;
> > > > -
> > > >    /*
> > > >     * Both of these functions should avoid XEN_PFN_PHYS because
> > > > phys_addr_t
> > > >     * can be 32bit when dma_addr_t is 64bit leading to a loss in
> > > > @@ -241,7 +239,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
> > > >    		m_ret = XEN_SWIOTLB_EFIXUP;
> > > >    		goto error;
> > > >    	}
> > > > -	start_dma_addr = xen_virt_to_bus(xen_io_tlb_start);
> > > >    	if (early) {
> > > >    		if (swiotlb_init_with_tbl(xen_io_tlb_start,
> > > > xen_io_tlb_nslabs,
> > > >    			 verbose))
> > > > @@ -389,7 +386,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device
> > > > *dev, struct page *page,
> > > >    	 */
> > > >    	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
> > > >    -	map = swiotlb_tbl_map_single(dev, start_dma_addr, phys,
> > > > +	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
> > > > phys,
> > > 
> > > xen_virt_to_bus() is implemented as xen_phys_to_bus(virt_to_phys()). Can
> > > you
> > > explain how the two are equivalent?
> > 
> > They are not equivalent. Looking at what swiotlb_tbl_map_single expects,
> > and also the implementation of swiotlb_init_with_tbl, I think
> > virt_to_phys is actually the one we want.
> > 
> > swiotlb_tbl_map_single compares the argument with __pa(tlb) which is
> > __pa(xen_io_tlb_start) which is virt_to_phys(xen_io_tlb_start).
> 
> I can't find such check in master. What is your baseline? Could you point to
> the exact line of code?

My base is b85051e755b0e9d6dd8f17ef1da083851b83287d, which is master
from a couple of days back.


xen_swiotlb_init calls swiotlb_init_with_tbl which takes a virt address
as a parameter (xen_io_tlb_start), it gets converted to phys and stored
in io_tlb_start as a physical address.

Later, xen_swiotlb_map_page calls swiotlb_tbl_map_single passing a
dma addr as parameter (tbl_dma_addr). tbl_dma_addr is used to calculate
the right slot in the swiotlb buffer to use. (Strangely tbl_dma_addr is
a dma_addr_t and it is not converted to phys_addr_t before doing
operations... I think tbl_dma_addr should be a phys addr.)

The comparison with io_tlb_start is done here:

	do {
		while (iommu_is_span_boundary(index, nslots, offset_slots,
					      max_slots)) {
			index += stride;
			if (index >= io_tlb_nslabs)
				index = 0;
			if (index == wrap)
				goto not_found;
		}

index is io_tlb_start and offset_slots is derived by tbl_dma_addr.

