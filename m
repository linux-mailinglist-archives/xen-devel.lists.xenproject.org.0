Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CED2F4B74
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 13:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66465.118049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfTb-00069p-T6; Wed, 13 Jan 2021 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66465.118049; Wed, 13 Jan 2021 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfTb-00069Q-Po; Wed, 13 Jan 2021 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 66465;
 Wed, 13 Jan 2021 12:42:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWMo=GQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kzfTa-00069L-Ba
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:42:14 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48db8163-7f3d-4006-aa35-d9ec9c4ede7c;
 Wed, 13 Jan 2021 12:42:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3EA2768B02; Wed, 13 Jan 2021 13:42:09 +0100 (CET)
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
X-Inumbo-ID: 48db8163-7f3d-4006-aa35-d9ec9c4ede7c
Date: Wed, 13 Jan 2021 13:42:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, joro@8bytes.org, will@kernel.org,
	frowand.list@gmail.com, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	grant.likely@arm.com, xypron.glpk@gmx.de, treding@nvidia.com,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
	gregkh@linuxfoundation.org, saravanak@google.com,
	rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com, rdunlap@infradead.org,
	dan.j.williams@intel.com, bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, tfiga@chromium.org,
	drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210113124209.GA1383@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-3-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-3-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> +#ifdef CONFIG_SWIOTLB
> +	struct io_tlb_mem	*dma_io_tlb_mem;
>  #endif

Please add a new config option for this code instead of always building
it when swiotlb is enabled.

> +static int swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> +				   size_t size)

Can you split the refactoring in swiotlb.c into one or more prep
patches?

> +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> +				    struct device *dev)
> +{
> +	struct io_tlb_mem *mem = rmem->priv;
> +	int ret;
> +
> +	if (dev->dma_io_tlb_mem)
> +		return -EBUSY;
> +
> +	if (!mem) {
> +		mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> +		if (!mem)
> +			return -ENOMEM;

What is the calling convention here that allows for a NULL and non-NULL
private data?

