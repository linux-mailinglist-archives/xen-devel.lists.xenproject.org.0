Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571F92B6F2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756190.1164725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8rU-0001GV-O1; Tue, 09 Jul 2024 11:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756190.1164725; Tue, 09 Jul 2024 11:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR8rU-0001Dz-Kw; Tue, 09 Jul 2024 11:18:20 +0000
Received: by outflank-mailman (input) for mailman id 756190;
 Tue, 09 Jul 2024 11:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5/C9=OJ=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sR8rT-0001Dt-Md
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:18:19 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1620afd-3de4-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 13:18:18 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B800C68D13; Tue,  9 Jul 2024 13:18:13 +0200 (CEST)
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
X-Inumbo-ID: f1620afd-3de4-11ef-bbfb-fd08da9f4363
Date: Tue, 9 Jul 2024 13:18:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: mhkelley58@gmail.com, mhklinux@outlook.com, robin.murphy@arm.com,
	joro@8bytes.org, will@kernel.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, hch@lst.de,
	m.szyprowski@samsung.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240709111812.GB4421@lst.de>
References: <20240708194100.1531-1-mhklinux@outlook.com> <20240709111013.6103d3f0@mordecai.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709111013.6103d3f0@mordecai.tesarici.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 09, 2024 at 11:10:13AM +0200, Petr Tesařík wrote:
> Reviewed-by: Petr Tesarik <petr@tesarici.cz>

Thanks.

> 
> OK, so __swiotlb_find_pool() is now always declared (so the code
> compiles), but if CONFIG_SWIOTLB_DYNAMIC=n, it is never defined. The
> result still links, because the compiler optimizes away the whole
> if-clause, so there are no references to an undefined symbol in the
> object file.
> 
> I think I've already seen similar constructs elsewhere in the kernel,
> so relying on the optimization seems to be common practice.

Yes, it's a pretty common patter.  It's gone here now, though to not
add the struct device field unconditionally.

> > +{
> > +	struct io_tlb_pool *pool = swiotlb_find_pool(dev, addr);
> > +
> > +	if (unlikely(pool))
> > +		__swiotlb_tbl_unmap_single(dev, addr, size, dir, attrs, pool);
> > +}
> > +
> > +static inline void swiotlb_sync_single_for_device(struct device *dev,
> > +		phys_addr_t addr, size_t size, enum dma_data_direction dir)
> > +{
> > +	struct io_tlb_pool *pool = swiotlb_find_pool(dev, addr);
> > +
> > +	if (unlikely(pool))
> > +		__swiotlb_sync_single_for_device(dev, addr, size, dir, pool);
> 
> We're adding an unlikely() here, which wasn't originally present in
> iommu_dma_sync_single_for_device(). OTOH it should do no harm, and it
> was most likely an omission. 

I'm honestly not a big fan of the unlikely annotations unlike they
are proven to make a difference.  Normally the runtime branch predictor
should do a really good job here, and for some uses this will not
just be likely but the only case.

