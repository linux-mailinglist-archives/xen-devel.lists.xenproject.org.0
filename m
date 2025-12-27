Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D684CE01D2
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 21:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193701.1512318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZag3-0005lv-W4; Sat, 27 Dec 2025 20:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193701.1512318; Sat, 27 Dec 2025 20:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZag3-0005kC-TQ; Sat, 27 Dec 2025 20:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1193701;
 Sat, 27 Dec 2025 20:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yTPZ=7B=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vZag1-0005k6-PL
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 20:14:13 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b09d0e1-e360-11f0-9ccf-f158ae23cfc8;
 Sat, 27 Dec 2025 21:14:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E7B164082A;
 Sat, 27 Dec 2025 20:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32314C4CEF1;
 Sat, 27 Dec 2025 20:14:08 +0000 (UTC)
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
X-Inumbo-ID: 9b09d0e1-e360-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866449;
	bh=5BvZzNPtiik1Rf2hGQJZuruUvtsWoa36oLJFsqbPeIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8mX/F/qNxveAViAw3M67+ZlSkxoNkRKoE+i7UiDr/K8/lElkqvuc9vkn65DJgg01
	 pF5Pb5lIKx8k8SBZHzueiJEkrfAz9wVBYC3qQhGt74fNQZUGCOWAUc01JwaEYXMdpM
	 FJit8Tv20CSZzdYdRg0UZB+Yo9Gdf3qhLW7C+ke6SKiJj1zsi7T5LNOYlCoMCpxGoE
	 n5D4Asm3R6CzLphE/Xh5kr1cHps3f5Rhemo2HeOJTBRXD1DzwfYcZIWAAXNYWEBlih
	 bSMq1kRI2kpZ5c18WLkXj+BEo8HgxpRnn/JvRkD8SEbP8nnzGwzQaYj+Higdc0Svrv
	 VyCS4ZKkgq3bA==
Date: Sat, 27 Dec 2025 22:14:06 +0200
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
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2 6/8] dma-mapping: Support batch mode for
 dma_direct_{map,unmap}_sg
Message-ID: <20251227201406.GP11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-7-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-7-21cnbao@gmail.com>

On Sat, Dec 27, 2025 at 11:52:46AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Leon suggested extending a flush argument to

Let's move this sentence out of the commit message and place it in the
changelog instead.

> dma_direct_unmap_phys(), dma_direct_map_phys(), and
> dma_direct_sync_single_for_cpu(). For single-buffer cases, this
> would use flush=true, while for SG cases flush=false would be
> used, followed by a single flush after all cache operations are
> issued in dma_direct_{map,unmap}_sg().
> 
> This ultimately benefits dma_map_sg() and dma_unmap_sg().
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
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  kernel/dma/direct.c  | 17 +++++++++++++----
>  kernel/dma/direct.h  | 16 ++++++++++------
>  kernel/dma/mapping.c |  6 +++---
>  3 files changed, 26 insertions(+), 13 deletions(-)

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>

