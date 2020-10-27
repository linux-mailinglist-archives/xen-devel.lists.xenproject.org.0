Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30F29C30E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 18:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13003.33508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXT05-0007uO-Fa; Tue, 27 Oct 2020 17:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13003.33508; Tue, 27 Oct 2020 17:43:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXT05-0007ty-CE; Tue, 27 Oct 2020 17:43:13 +0000
Received: by outflank-mailman (input) for mailman id 13003;
 Tue, 27 Oct 2020 17:43:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXT03-0007tt-Vv
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:43:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5fbf3f4-e7cb-4bd6-b796-07ce57863753;
 Tue, 27 Oct 2020 17:43:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2B912054F;
 Tue, 27 Oct 2020 17:43:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXT03-0007tt-Vv
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:43:12 +0000
X-Inumbo-ID: a5fbf3f4-e7cb-4bd6-b796-07ce57863753
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a5fbf3f4-e7cb-4bd6-b796-07ce57863753;
	Tue, 27 Oct 2020 17:43:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E2B912054F;
	Tue, 27 Oct 2020 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603820590;
	bh=7PAIrARo+U5BjdgOi0yQlsQrBkmZ+IVZWY4TopAO5S0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MMM+0N60ODKjqcP7/UwhGGndw5EYDfe/PwXyJI+6tNbzrhUuGH+SoWyHcSgzjOqNz
	 fovF3qvrYsGblmTK/PtbuY+/wlQATssJpiclYPtzUGafdoOhjwqfgsoQBeFL/zjs2R
	 wQhW8o38W5vMUl+wL+KE9PxS4CW7FEyLrSSwW2SI=
Date: Tue, 27 Oct 2020 10:43:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
    xen-devel@lists.xenproject.org, hch@lst.de
Subject: Re: [PATCH] fix swiotlb panic on Xen
In-Reply-To: <20201027133701.GB6077@char.us.oracle.com>
Message-ID: <alpine.DEB.2.21.2010271041490.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s> <20201027133701.GB6077@char.us.oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Oct 2020, Konrad Rzeszutek Wilk wrote:
> On Mon, Oct 26, 2020 at 05:02:14PM -0700, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > kernel/dma/swiotlb.c:swiotlb_init gets called first and tries to
> > allocate a buffer for the swiotlb. It does so by calling
> > 
> >   memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> > 
> > If the allocation must fail, no_iotlb_memory is set.
> > 
> > 
> > Later during initialization swiotlb-xen comes in
> > (drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
> > is != 0, it thinks the memory is ready to use when actually it is not.
> > 
> > When the swiotlb is actually needed, swiotlb_tbl_map_single gets called
> > and since no_iotlb_memory is set the kernel panics.
> > 
> > Instead, if swiotlb-xen.c:xen_swiotlb_init knew the swiotlb hadn't been
> > initialized, it would do the initialization itself, which might still
> > succeed.
> > 
> > 
> > Fix the panic by setting io_tlb_start to 0 on swiotlb initialization
> > failure, and also by setting no_iotlb_memory to false on swiotlb
> > initialization success.
> 
> Should this have a Fixes: flag?

That would be

Fixes: ac2cbab21f31 ("x86: Don't panic if can not alloc buffer for swiotlb")



> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > 
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index c19379fabd20..9924214df60a 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -231,6 +231,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> >  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
> >  	}
> >  	io_tlb_index = 0;
> > +	no_iotlb_memory = false;
> >  
> >  	if (verbose)
> >  		swiotlb_print_info();
> > @@ -262,9 +263,11 @@ swiotlb_init(int verbose)
> >  	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
> >  		return;
> >  
> > -	if (io_tlb_start)
> > +	if (io_tlb_start) {
> >  		memblock_free_early(io_tlb_start,
> >  				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
> > +		io_tlb_start = 0;
> > +	}
> >  	pr_warn("Cannot allocate buffer");
> >  	no_iotlb_memory = true;
> >  }
> > @@ -362,6 +365,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
> >  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
> >  	}
> >  	io_tlb_index = 0;
> > +	no_iotlb_memory = false;
> >  
> >  	swiotlb_print_info();
> >  
> 

