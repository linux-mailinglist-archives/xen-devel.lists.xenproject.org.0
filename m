Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0BAA7813
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 19:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974933.1362664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtrU-0001C4-UN; Fri, 02 May 2025 17:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974933.1362664; Fri, 02 May 2025 17:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtrU-000196-RZ; Fri, 02 May 2025 17:07:44 +0000
Received: by outflank-mailman (input) for mailman id 974933;
 Fri, 02 May 2025 17:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfxJ=XS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAtrT-000190-ET
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 17:07:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4ab17da-2777-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 19:07:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7797C5C5C61;
 Fri,  2 May 2025 17:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCFCC4CEF1;
 Fri,  2 May 2025 17:07:37 +0000 (UTC)
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
X-Inumbo-ID: f4ab17da-2777-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746205659;
	bh=MXrACGyqOXVDhEpixyz+BKgn/54QO0zKMHCOhJK/g/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J253chSfz1Zth/9KTy40/Pi1vYhW0Rzzbthbcj+GVZ18ko3rOCUZLGTyhhxwFgx0r
	 W2Ho1najoPyOqqBHByYN1KulAmWUNVyKHoQJtusev5e9I3XUKS4eHmSfJY2U7zM+it
	 4jaVUpVQ1hkUGs3e5Og32KvWDsKFyOC8EQTJkDGzlwc4eaM9PfMnxie1wr6MvSqI4H
	 yCwpAD1kTF65nqbFtIFxxqmN9L5M1KeNBG3fDW3fnoDEU6F3kbh2lvMHWYv9oyyK2m
	 AhBD0dLSaOPzHXCf7qmm7SStTCcGe9xMIKrAm+pWoKqGTq9qQAbbEXsojEqabNRHut
	 z32AYz4whVdzA==
Date: Fri, 2 May 2025 10:07:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: John Ernberg <john.ernberg@actia.se>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "imx@lists.linux.dev" <imx@lists.linux.dev>, 
    "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH 1/2] xen: swiotlb: Use swiotlb bouncing if kmalloc
 allocation demands it
In-Reply-To: <20250502114043.1968976-2-john.ernberg@actia.se>
Message-ID: <alpine.DEB.2.22.394.2505020955140.3879245@ubuntu-linux-20-04-desktop>
References: <20250502114043.1968976-1-john.ernberg@actia.se> <20250502114043.1968976-2-john.ernberg@actia.se>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, John Ernberg wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> It's impossible to pick an exact fixes tag since this driver was missed
> in the flagged patch set. I picked one I felt gave a decent enough picture
> for someone coming across this later.
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
> -- 
> 2.49.0
> 

