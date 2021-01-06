Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA42EBAAD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 08:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62370.110423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx3a7-00067B-OC; Wed, 06 Jan 2021 07:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62370.110423; Wed, 06 Jan 2021 07:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx3a7-00066m-Km; Wed, 06 Jan 2021 07:50:11 +0000
Received: by outflank-mailman (input) for mailman id 62370;
 Wed, 06 Jan 2021 07:50:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn7Y=GJ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kx3a5-00066h-RY
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 07:50:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7edbc865-83e3-4966-a2b3-c046875af222;
 Wed, 06 Jan 2021 07:50:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7129D2070C;
 Wed,  6 Jan 2021 07:50:06 +0000 (UTC)
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
X-Inumbo-ID: 7edbc865-83e3-4966-a2b3-c046875af222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1609919407;
	bh=Piu5gusr/UGLicaCqANy6GNdwM1M9LXLgq30KLvh2D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STtQBirTvMJHJfy3BDpBJr1nF4y3j9P09tA52QukFa2+zVDJOvZxlpH0YuQb1dKaI
	 tkZ/1YHajtxpOZBb2tYYK9x5sW39V1FMN5v9MY2fd4frFWPosjKHysaj5P3pqOj5H4
	 cLt1ndn2T4gOT+l7NViKlEBYi94u2sh/OTHke2vk=
Date: Wed, 6 Jan 2021 08:50:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Claire Chang <tientzu@chromium.org>
Cc: robh+dt@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, joro@8bytes.org, will@kernel.org,
	frowand.list@gmail.com, konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	grant.likely@arm.com, xypron.glpk@gmx.de, treding@nvidia.com,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
	saravanak@google.com, rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org, dan.j.williams@intel.com,
	bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	tfiga@chromium.org, drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <X/VrqxcaAMi65CF0@kroah.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-3-tientzu@chromium.org>

On Wed, Jan 06, 2021 at 11:41:20AM +0800, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes in the device tree.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  include/linux/device.h  |   4 ++
>  include/linux/swiotlb.h |   7 +-
>  kernel/dma/Kconfig      |   1 +
>  kernel/dma/swiotlb.c    | 144 ++++++++++++++++++++++++++++++++++------
>  4 files changed, 131 insertions(+), 25 deletions(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 89bb8b84173e..ca6f71ec8871 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -413,6 +413,7 @@ struct dev_links_info {
>   * @dma_pools:	Dma pools (if dma'ble device).
>   * @dma_mem:	Internal for coherent mem override.
>   * @cma_area:	Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.

Why does this have to be added here?  Shouldn't the platform-specific
code handle it instead?

thanks,

greg k-h

