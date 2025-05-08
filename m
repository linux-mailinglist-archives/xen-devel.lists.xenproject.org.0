Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26571AAFF07
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 17:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979502.1366093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD34R-0000hN-Q0; Thu, 08 May 2025 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979502.1366093; Thu, 08 May 2025 15:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD34R-0000fu-NF; Thu, 08 May 2025 15:21:59 +0000
Received: by outflank-mailman (input) for mailman id 979502;
 Thu, 08 May 2025 15:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq4O=XY=kernel.org=cmarinas@srs-se1.protection.inumbo.net>)
 id 1uD34P-0000fY-NX
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 15:21:57 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7b7888-2c20-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 17:21:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 589CE60008;
 Thu,  8 May 2025 15:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F907C4CEE7;
 Thu,  8 May 2025 15:21:47 +0000 (UTC)
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
X-Inumbo-ID: 2a7b7888-2c20-11f0-9ffb-bf95429c2676
Date: Thu, 8 May 2025 16:21:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH 1/2] xen: swiotlb: Use swiotlb bouncing if kmalloc
 allocation demands it
Message-ID: <aBzMCWmTMzLNuvmJ@arm.com>
References: <20250502114043.1968976-1-john.ernberg@actia.se>
 <20250502114043.1968976-2-john.ernberg@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502114043.1968976-2-john.ernberg@actia.se>

On Fri, May 02, 2025 at 11:40:55AM +0000, John Ernberg wrote:
> Xen swiotlb support was missed when the patch set starting with
> 4ab5f8ec7d71 ("mm/slab: decouple ARCH_KMALLOC_MINALIGN from
> ARCH_DMA_MINALIGN") was merged.
> 
> When running Xen on iMX8QXP, a SoC without IOMMU, the effect was that USB
> transfers ended up corrupted when there was more than one URB inflight at
> the same time.
> 
> Add a call to dma_kmalloc_needs_bounce() to make sure that allocations too
> small for DMA get bounced via swiotlb.
> 
> Closes: https://lore.kernel.org/linux-usb/ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se/
> Fixes: 4ab5f8ec7d71 ("mm/slab: decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN")
> Cc: stable@kernel.org # v6.5+
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> It's impossible to pick an exact fixes tag since this driver was missed
> in the flagged patch set. I picked one I felt gave a decent enough picture
> for someone coming across this later.

All the above patches went in at the same time in 6.5, so it probably
doesn't matter. In theory, you could add:

Fixes: 370645f41e6e ("dma-mapping: force bouncing if the kmalloc() size is not cache-line-aligned")
Cc: <stable@vger.kernel.org> # 6.5.x

as that's when dma_kmalloc_needs_bounce() was added (a few commits after
the "decouple ARCH_KMALLOC_MINALIGN..." one). However, actual problems
started to appear with commit 9382bc44b5f5 ("arm64: allow kmalloc()
caches aligned to the smaller cache_line_size()") which makes
ARCH_KMALLOC_MINALIGN equal 8 on arm64.

> ---
>  drivers/xen/swiotlb-xen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 1f65795cf5d7..ef56a2500ed6 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -217,6 +217,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
>  	 * buffering it.
>  	 */
>  	if (dma_capable(dev, dev_addr, size, true) &&
> +	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
>  	    !range_straddles_page_boundary(phys, size) &&
>  		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
>  		!is_swiotlb_force_bounce(dev))

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

