Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47975CE01DE
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 21:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193710.1512329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZaiY-0006Kn-CE; Sat, 27 Dec 2025 20:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193710.1512329; Sat, 27 Dec 2025 20:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZaiY-0006JV-8T; Sat, 27 Dec 2025 20:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1193710;
 Sat, 27 Dec 2025 20:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yTPZ=7B=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vZaiX-0006JP-NL
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 20:16:49 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8753a5b-e360-11f0-b15c-2bf370ae4941;
 Sat, 27 Dec 2025 21:16:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 882B460010;
 Sat, 27 Dec 2025 20:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEFAC4CEF1;
 Sat, 27 Dec 2025 20:16:45 +0000 (UTC)
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
X-Inumbo-ID: f8753a5b-e360-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866606;
	bh=YVbtQLZx9jfw9z6Q7qKoP3MRHyWD/+ZNiJGjIZfNTgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwKZl8KzwVtiip51+4heE0ashdbCeXp6U5OGLZVN5eA3XVOWJ7w0nu+JM1fdk1dvX
	 ZfbtAVStzxCNZU1JJKfXU2qcA4s2Zf/F+0PKbtzuf9B9+glwGNiVwxgC1bY3mVWDqt
	 x+OGDvSx4PZZI6McqMG+qakQtcWSE9+9tMu26q3QXTy1gMrTGcAo4CvA5PP9VpTn2Y
	 t+LQEj1YwktMsX15KqA9mAEHyv4WHQBDsuDqMqLw7BtRg6wMni6pYQYI3FZb8kWIWE
	 iFr0g/ZmzQ2XLCky+90/8NJrMcMB42KyHtG+QFBx2dI8aag00ktWTd4LyrTN8FnlYw
	 dWKdi+ikD9wGg==
Date: Sat, 27 Dec 2025 22:16:42 +0200
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
	Joerg Roedel <joro@8bytes.org>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for
 iommu_dma_sync_sg_for_{cpu, device}
Message-ID: <20251227201642.GQ11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-9-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-9-21cnbao@gmail.com>

On Sat, Dec 27, 2025 at 11:52:48AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
> iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
> a single flush operation is needed.
> 
> I do not have the hardware to test this, so the patch is marked as
> RFC. I would greatly appreciate any testing feedback.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index ffa940bdbbaf..b68dbfcb7846 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
>  			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
>  						      sg->length, dir);
>  	} else if (!dev_is_dma_coherent(dev)) {
> -		for_each_sg(sgl, sg, nelems, i) {
> +		for_each_sg(sgl, sg, nelems, i)
>  			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
> -			arch_sync_dma_flush();
> -		}
> +		arch_sync_dma_flush();

This and previous patches should be squashed into the one which
introduced arch_sync_dma_flush().

Thanks

