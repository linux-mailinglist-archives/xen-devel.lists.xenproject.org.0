Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31321F21FD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 00:54:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiQeY-000211-7G; Mon, 08 Jun 2020 22:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jiQeW-00020t-R3
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 22:54:00 +0000
X-Inumbo-ID: f110ce00-a9da-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f110ce00-a9da-11ea-b7bb-bc764e2007e4;
 Mon, 08 Jun 2020 22:54:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A0DD2076A;
 Mon,  8 Jun 2020 22:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591656839;
 bh=aFtqwt+bYOZhJ7U9irm3TzEiOtvg48f3YiInMbcBYs0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sV9brVTS0fbsMYHJ/0OiYUYepwLpKHZZvVEPsCcTclhj201DpvYC6IxwM1XDwdEIe
 K1aFJ5vaHAov9BwrlY9IHX4mYNHZkTNxt1DgO7EyhoVEcdrayUCUJJ00a6kr5y+QET
 7Agxg++7d8MkC5wB88ZPCM3NNvh4ps0v1mIPE2Lo=
Date: Mon, 8 Jun 2020 15:53:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 01/11] swiotlb-xen: use vmalloc_to_page on vmalloc
 virt addresses
In-Reply-To: <20200608070411.GA15742@infradead.org>
Message-ID: <alpine.DEB.2.21.2006081539110.2815@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-1-sstabellini@kernel.org>
 <20200608070411.GA15742@infradead.org>
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

Hi Christoph,

Thanks you for the review.


On Mon, 8 Jun 2020, Christoph Hellwig wrote:
> Well, this isn't just RPi4, but basically any ARM or ARM64 system
> with non-coherent DMA (which is most of them).

Well... yes :-)


> > +	struct page *pg;
> 
> Please spell out page.

OK


> >  
> >  	if (hwdev && hwdev->coherent_dma_mask)
> >  		dma_mask = hwdev->coherent_dma_mask;
> > @@ -346,9 +347,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
> >  	/* Convert the size to actually allocated. */
> >  	size = 1UL << (order + XEN_PAGE_SHIFT);
> >  
> > +	pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
> > +				      virt_to_page(vaddr);
> 
> Please use plain old if/else to make this more readable.

Sure

