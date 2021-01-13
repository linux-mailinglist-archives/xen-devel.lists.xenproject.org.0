Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC982F4AA9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 12:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66421.117950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzegZ-0000fA-Gv; Wed, 13 Jan 2021 11:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66421.117950; Wed, 13 Jan 2021 11:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzegZ-0000el-Cp; Wed, 13 Jan 2021 11:51:35 +0000
Received: by outflank-mailman (input) for mailman id 66421;
 Wed, 13 Jan 2021 11:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWMo=GQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kzegY-0000ef-EW
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 11:51:34 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 364de275-2775-46a2-b3df-7d9a18e5d446;
 Wed, 13 Jan 2021 11:51:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EFCD968AFE; Wed, 13 Jan 2021 12:51:26 +0100 (CET)
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
X-Inumbo-ID: 364de275-2775-46a2-b3df-7d9a18e5d446
Date: Wed, 13 Jan 2021 12:51:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Claire Chang <tientzu@chromium.org>, robh+dt@kernel.org,
	mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
	joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, grant.likely@arm.com, xypron.glpk@gmx.de,
	treding@nvidia.com, mingo@kernel.org, bauerman@linux.ibm.com,
	peterz@infradead.org, saravanak@google.com,
	rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com, rdunlap@infradead.org,
	dan.j.williams@intel.com, bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, tfiga@chromium.org,
	drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210113115126.GB29376@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-3-tientzu@chromium.org> <X/VrqxcaAMi65CF0@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/VrqxcaAMi65CF0@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 06, 2021 at 08:50:03AM +0100, Greg KH wrote:
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -413,6 +413,7 @@ struct dev_links_info {
> >   * @dma_pools:	Dma pools (if dma'ble device).
> >   * @dma_mem:	Internal for coherent mem override.
> >   * @cma_area:	Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> 
> Why does this have to be added here?  Shouldn't the platform-specific
> code handle it instead?

The whole code added here is pretty generic.  What we need to eventually
do, though is to add a separate dma_device instead of adding more and more
bloat to struct device.

