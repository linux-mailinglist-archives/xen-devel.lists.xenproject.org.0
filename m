Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A62CE01C3
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 21:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193680.1512298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZaZL-0003hH-64; Sat, 27 Dec 2025 20:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193680.1512298; Sat, 27 Dec 2025 20:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZaZL-0003eg-2u; Sat, 27 Dec 2025 20:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1193680;
 Sat, 27 Dec 2025 20:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yTPZ=7B=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vZaZJ-0003eH-HT
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 20:07:17 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f29dbe-e35f-11f0-9ccf-f158ae23cfc8;
 Sat, 27 Dec 2025 21:07:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D93F243922;
 Sat, 27 Dec 2025 20:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DB3C4CEF1;
 Sat, 27 Dec 2025 20:07:10 +0000 (UTC)
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
X-Inumbo-ID: a1f29dbe-e35f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866031;
	bh=lH6Wqea3wfifSQZGhdMqsJ7bOl+AJwlkVM2iS90xz1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S07xCoEAxobIYaBiV02L02bERdk0nmuGN+hFMXu5vrWuTP0EPXqj8aOiLirY/XSdI
	 hUxIfJKJxQwjEDf0cGJIE06esOvlyDzQZ6VVCU/XpJsQ+cPWzdco1dnfE+T0l6+FTy
	 Z2/1CSf3BiRqj8dt9aICAM5XJ05mm2CcfJWEP0XBNvwwasMfQqxa7wnz+aNmb4d5in
	 BrpW1mFFc8LnJZ2BxbHSkZt6MmcWRZfo9YGSkyb+kpl/KFt04NW0Tpiwp6VdFNnp6U
	 FdejPb3ayq/IL4kPtLQVDuEHA5EEs/rnzDON++8ec2joqb9vADZmaIG04lvTKhRmDr
	 059bfB7LX6s1A==
Date: Sat, 27 Dec 2025 22:07:06 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
	will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, Barry Song <baohua@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
Message-ID: <20251227200706.GN11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-5-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-5-21cnbao@gmail.com>

On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> always wait for the completion of each DMA buffer. That is,
> issuing the DMA sync and waiting for completion is done in a
> single API call.
> 
> For scatter-gather lists with multiple entries, this means
> issuing and waiting is repeated for each entry, which can hurt
> performance. Architectures like ARM64 may be able to issue all
> DMA sync operations for all entries first and then wait for
> completion together.
> 
> To address this, arch_sync_dma_for_* now issues DMA operations in
> batch, followed by a flush. On ARM64, the flush is implemented
> using a dsb instruction within arch_sync_dma_flush().
> 
> For now, add arch_sync_dma_flush() after each
> arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> no-op on all architectures except arm64, so this patch does not
> change existing behavior. Subsequent patches will introduce true
> batching for SG DMA buffers.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/cache.h |  6 ++++++
>  arch/arm64/mm/dma-mapping.c    |  4 ++--
>  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
>  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
>  include/linux/dma-map-ops.h    |  6 ++++++
>  kernel/dma/direct.c            |  8 ++++++--
>  kernel/dma/direct.h            |  9 +++++++--
>  kernel/dma/swiotlb.c           |  4 +++-
>  8 files changed, 73 insertions(+), 25 deletions(-)

<...>

> +#ifndef arch_sync_dma_flush
> +static inline void arch_sync_dma_flush(void)
> +{
> +}
> +#endif

Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
options: they make it straightforward to inspect the entire DMA path simply
by looking at the .config.

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

