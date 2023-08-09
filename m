Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C0775EF1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581034.909541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiIj-0008SI-8I; Wed, 09 Aug 2023 12:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581034.909541; Wed, 09 Aug 2023 12:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiIj-0008Pz-5O; Wed, 09 Aug 2023 12:28:33 +0000
Received: by outflank-mailman (input) for mailman id 581034;
 Wed, 09 Aug 2023 12:28:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTiIi-0008Pt-4d
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:28:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTiIh-0007wa-HL; Wed, 09 Aug 2023 12:28:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTiIh-0006A2-Aa; Wed, 09 Aug 2023 12:28:31 +0000
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
	bh=RVSUjH3ciftGt3wM0Uv3ufgpFySL2jxRjB74OhNJa7Y=; b=tT4G2k4bUse8r8D/OJ+p68TVgX
	8AAZW5pUMJ2AcemG2LopJC+lZToa0W7mcXw/1Zh/RhDjg2xY5pFh+QYvYrlZ+WgvUXVXKmHOUK65U
	8tt3KaFqk7cDqn/pD2KOUoGHLuhuVkH/O1fjOmgoknec/vtlGfH+GyGQ2AmdAWKsDOkc=;
Message-ID: <1307da1d-5d56-4fe1-932a-c384323264ec@xen.org>
Date: Wed, 9 Aug 2023 13:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] xen/arm64: Move setup_fixmap() to
 create_page_tables()
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-7-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230801034419.2047541-7-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

Title: NIT: It is more a fold rather than move.

On 01/08/2023 04:44, Henry Wang wrote:
>  For the
> future MPU support work, the early UART mapping could then be moved
> in prepare_early_mappings().

I would drop this sentence as this is more related to the future 
implementation of MPU rather than this patch itself.

> 
> No functional change intended.
> 
> [1] https://lore.kernel.org/xen-devel/78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org/
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v4:
> - Rework "[v3,12/52] xen/mmu: extract early uart mapping from setup_fixmap"
> ---
>   xen/arch/arm/arm64/head.S     |  1 -
>   xen/arch/arm/arm64/mmu/head.S | 50 ++++++++++++-----------------------
>   2 files changed, 17 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index e4f579a48e..56f68a8e37 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -275,7 +275,6 @@ real_start_efi:
>           b     enable_boot_cpu_mm
>   
>   primary_switched:
> -        bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
>           ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index b7c3dd423a..6bd94c3a45 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S

The second paragraph in create_page_tables() now needs to be dropped.

> @@ -231,6 +231,23 @@ link_from_second_id:
>           create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
>   link_from_third_id:
>           create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +        /* Add UART to the fixmap table */
> +        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> +        /* x23: Early UART base physical address */
> +        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
> +#endif
> +        /* Map fixmap into boot_second */
> +        ldr   x0, =FIXMAP_ADDR(0)
> +        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
> +        /* Ensure any page table updates made above have occurred. */
> +        dsb   nshst
> +        /*
> +         * The fixmap area will be used soon after. So ensure no hardware
> +         * translation happens before the dsb completes.
> +         */
> +        isb

The DSB/ISB is not necessary anymore as you are not modifying live 
page-tables. So I would prefer if this is removed.

Cheers,

-- 
Julien Grall

