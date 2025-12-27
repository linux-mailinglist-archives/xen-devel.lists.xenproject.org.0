Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A3DCE01C9
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 21:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193690.1512309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZabf-0004DL-Fp; Sat, 27 Dec 2025 20:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193690.1512309; Sat, 27 Dec 2025 20:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZabf-0004Ar-D7; Sat, 27 Dec 2025 20:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1193690;
 Sat, 27 Dec 2025 20:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yTPZ=7B=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vZabd-0004Ag-Pt
 for xen-devel@lists.xenproject.org; Sat, 27 Dec 2025 20:09:41 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f89ea0e0-e35f-11f0-9ccf-f158ae23cfc8;
 Sat, 27 Dec 2025 21:09:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B71D743AB9;
 Sat, 27 Dec 2025 20:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A38C4CEF1;
 Sat, 27 Dec 2025 20:09:36 +0000 (UTC)
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
X-Inumbo-ID: f89ea0e0-e35f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866177;
	bh=y+u6yKllr0W68e3y8Qfj41GWvPDO6M/CKO30+K0JRSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkotPNQvY3OS7Z6GK5eJREW5U1iKBosJXAf3OKZhq4w1e63KJ/6n6aLGdvhL0t9RI
	 qsawET5wu8X69005mh6s57Pu51m8COX9B90PGXro409saWdjcvqp/bYQzEVY5S5NG2
	 YIts3LU54RlZXyyGEde8YS5GTaAYv9wggXZREwV5m3akH9NKC8/HO8gZWCEiKuWSvd
	 vxDKsTSMCxwmQr8YlKHrU+GoWa5OP8vubgWVXShl/Qvt0n+FJVsO8VUBJuNf8n4FxZ
	 6khccCuOWwhueLLZ7+uDADNwuxl58ICHfO+AW4UZkA+oc+CY31hC1XeOqeTi+XkKA2
	 5iOODsc1HE7rQ==
Date: Sat, 27 Dec 2025 22:09:33 +0200
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
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
Message-ID: <20251227200933.GO11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-6-21cnbao@gmail.com>

On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Instead of performing a flush per SG entry, issue all cache
> operations first and then flush once. This ultimately benefits
> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
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
>  kernel/dma/direct.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

<...>

> -		if (!dev_is_dma_coherent(dev)) {
> +		if (!dev_is_dma_coherent(dev))
>  			arch_sync_dma_for_device(paddr, sg->length,
>  					dir);
> -			arch_sync_dma_flush();
> -		}
>  	}
> +	if (!dev_is_dma_coherent(dev))
> +		arch_sync_dma_flush();

This patch should be squashed into the previous one. You introduced
arch_sync_dma_flush() there, and now you are placing it elsewhere.

Thanks

