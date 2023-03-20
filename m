Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178696C2154
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 20:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512099.791760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peL9H-0005ea-MT; Mon, 20 Mar 2023 19:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512099.791760; Mon, 20 Mar 2023 19:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peL9H-0005cH-Iz; Mon, 20 Mar 2023 19:26:27 +0000
Received: by outflank-mailman (input) for mailman id 512099;
 Mon, 20 Mar 2023 19:26:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peL9F-0005cB-GG
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 19:26:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peL9F-0004qg-2Q; Mon, 20 Mar 2023 19:26:25 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.17.111]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peL9E-0007DG-Sp; Mon, 20 Mar 2023 19:26:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=tpG0w0svoHQeZid+3mQ2b0MZYs4LSF0sjBdWJ/TRKh8=; b=QQmdaTn4dFrv/dj6/ohTJmCCQ8
	LJCThm8jVztJy5w2r7dBpIBeI35tggJxQ2TwU9GLspq72Ney9xvS9KTCLtusXzZbEY1K/dWeBSfzj
	peiTJ0zPOC82DEyPFlQcU0lXAX+wCSmQ8mwDBZ+aXjV5vtqMrPr5ZomuoJOAWB/XcZ4o=;
Message-ID: <e2421c2d-6ae1-bf70-530d-0683d943f519@xen.org>
Date: Mon, 20 Mar 2023 19:26:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230130040614.188296-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 30/01/2023 04:06, Henry Wang wrote:
> Currently, the mapping of the GICv2 CPU interface is created in
> arch_domain_create(). This causes some troubles in populating and
> freeing of the domain P2M pages pool. For example, a default 16
> P2M pages are required in p2m_init() to cope with the P2M mapping
> of 8KB GICv2 CPU interface area, and these 16 P2M pages would cause
> the complexity of P2M destroy in the failure path of
> arch_domain_create().
> 
> As per discussion in [1], similarly as the MMIO access for ACPI, this
> patch defers the GICv2 CPU interface mapping until the first MMIO
> access. This is achieved by moving the GICv2 CPU interface mapping
> code from vgic_v2_domain_init()/vgic_v2_map_resources() to the
> stage-2 data abort trap handling code. The original CPU interface
> size and virtual CPU interface base address is now saved in
> `struct vgic_dist` instead of the local variable of
> vgic_v2_domain_init()/vgic_v2_map_resources().
> 
> Take the opportunity to unify the way of data access using the
> existing pointer to struct vgic_dist in vgic_v2_map_resources() for
> new GICv2.
> 
> Since the hardware domain (Dom0) has an unlimited size P2M pool, the
> gicv2_map_hwdom_extra_mappings() is also not touched by this patch.

I didn't notice this in the previous version. The fact that dom0 has 
unlimited size P2M pool doesn't matter here (this could also change in 
the future). Even if the P2M pool was limited, then it would be fine 
because the extra mappings happen after domain_create(). So there is no 
need to map them on-demand as the code could be order the way we want.

So this paragraph needs to be reworded.

>   #ifdef CONFIG_GICV3
>       /* GIC V3 addressing */
>       /* List of contiguous occupied by the redistributors */
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 061c92acbd..9dd703f661 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1787,9 +1787,12 @@ static inline bool hpfar_is_valid(bool s1ptw, uint8_t fsc)
>   }
>   
>   /*
> - * When using ACPI, most of the MMIO regions will be mapped on-demand
> - * in stage-2 page tables for the hardware domain because Xen is not
> - * able to know from the EFI memory map the MMIO regions.
> + * Try to map the MMIO regions for some special cases:
> + * 1. When using ACPI, most of the MMIO regions will be mapped on-demand
> + *    in stage-2 page tables for the hardware domain because Xen is not
> + *    able to know from the EFI memory map the MMIO regions.
> + * 2. For guests using GICv2, the GICv2 CPU interface mapping is created
> + *    on the first access of the MMIO region.
>    */
>   static bool try_map_mmio(gfn_t gfn)
>   {
> @@ -1798,6 +1801,15 @@ static bool try_map_mmio(gfn_t gfn)
>       /* For the hardware domain, all MMIOs are mapped with GFN == MFN */
>       mfn_t mfn = _mfn(gfn_x(gfn));
>   
> +    /*
> +     * Map the GICv2 virtual CPU interface in the GIC CPU interface
> +     * region of the guest on the first access of the MMIO region.
> +     */
> +    if ( d->arch.vgic.version == GIC_V2 &&
> +         gfn_eq(gfn, gaddr_to_gfn(d->arch.vgic.cbase)) )

The CPU interface size is 8KB (bigger in some cases) but here you only 
check for the access to be in the first 4KB.

Cheers,

-- 
Julien Grall

