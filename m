Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876D2F4AAA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 12:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66417.117937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzeff-0000Zc-5N; Wed, 13 Jan 2021 11:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66417.117937; Wed, 13 Jan 2021 11:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzeff-0000ZD-2H; Wed, 13 Jan 2021 11:50:39 +0000
Received: by outflank-mailman (input) for mailman id 66417;
 Wed, 13 Jan 2021 11:50:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWMo=GQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kzefd-0000Z8-MC
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 11:50:37 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e99d760-22d1-4026-b78f-2d3932aba96f;
 Wed, 13 Jan 2021 11:50:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AA26B68AFE; Wed, 13 Jan 2021 12:50:31 +0100 (CET)
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
X-Inumbo-ID: 8e99d760-22d1-4026-b78f-2d3932aba96f
Date: Wed, 13 Jan 2021 12:50:31 +0100
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
Subject: Re: [RFC PATCH v3 1/6] swiotlb: Add io_tlb_mem struct
Message-ID: <20210113115031.GA29376@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org> <20210106034124.30560-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-2-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 06, 2021 at 11:41:19AM +0800, Claire Chang wrote:
> Added a new struct, io_tlb_mem, as the IO TLB memory pool descriptor and
> moved relevant global variables into that struct.
> This will be useful later to allow for restricted DMA pool.

I like where this is going, but a few comments.

Mostly I'd love to be able to entirely hide io_tlb_default_mem
and struct io_tlb_mem inside of swiotlb.c.

> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -55,8 +55,8 @@ void __init svm_swiotlb_init(void)
>  	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
>  		return;
>  
> -	if (io_tlb_start)
> -		memblock_free_early(io_tlb_start,
> +	if (io_tlb_default_mem.start)
> +		memblock_free_early(io_tlb_default_mem.start,
>  				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));

I think this should switch to use the local vstart variable in
prep patch.

>  	panic("SVM: Cannot allocate SWIOTLB buffer");
>  }
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2b385c1b4a99..4d17dff7ffd2 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
>  	/*
>  	 * IO TLB memory already allocated. Just use it.
>  	 */
> -	if (io_tlb_start != 0) {
> -		xen_io_tlb_start = phys_to_virt(io_tlb_start);
> +	if (io_tlb_default_mem.start != 0) {
> +		xen_io_tlb_start = phys_to_virt(io_tlb_default_mem.start);
>  		goto end;

xen_io_tlb_start is interesting. It is used only in two functions:

 1) is_xen_swiotlb_buffer, where I think we should be able to just use
    is_swiotlb_buffer instead of open coding it with the extra
    phys_to_virt/virt_to_phys cycle.
 2) xen_swiotlb_init, where except for the assignment it only is used
    locally for the case not touched above and could this be replaced
    with a local variable.

Konrad, does this make sense to you?

>  static inline bool is_swiotlb_buffer(phys_addr_t paddr)
>  {
> -	return paddr >= io_tlb_start && paddr < io_tlb_end;
> +	struct io_tlb_mem *mem = &io_tlb_default_mem;
> +
> +	return paddr >= mem->start && paddr < mem->end;

We'd then have to move this out of line as well.

