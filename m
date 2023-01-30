Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E9681D86
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 22:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487237.754809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMc7w-0002jl-T7; Mon, 30 Jan 2023 21:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487237.754809; Mon, 30 Jan 2023 21:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMc7w-0002i2-QE; Mon, 30 Jan 2023 21:55:48 +0000
Received: by outflank-mailman (input) for mailman id 487237;
 Mon, 30 Jan 2023 21:55:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMc7v-0002ht-AX
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 21:55:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMc7u-0005o9-Ub; Mon, 30 Jan 2023 21:55:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMc7u-0004xJ-PH; Mon, 30 Jan 2023 21:55:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=d2sUIbcctqT9JK2RiKQdZk0gPwMWfyGwnVHiKQaf/yg=; b=JKdOYZRdUc/fdYRRTUBgR4eqfu
	KhvDZzWB0htB6sEVLMxcUFupT6VWKPJ11QfJIqpBQsDUAiEsKEWQBN126/g3RToSck4APiZn5TBsp
	FbhgjlP4AyyBVRofaWG6gZCruAK+ZgmPLgTx+e23+m3EOd7A3OB3ELD79uBRM6pBK1Zo=;
Message-ID: <fca91d3c-5d8a-3f7e-419a-a4c5208273dc@xen.org>
Date: Mon, 30 Jan 2023 21:55:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
 <20230130040535.188236-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <20230130040535.188236-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 30/01/2023 04:05, Henry Wang wrote:
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index a926f30a2b..f0592370ea 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
>   size_t boot_fdt_info(const void *fdt, paddr_t paddr);
>   const char *boot_fdt_cmdline(const void *fdt);
>   
> +bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
> +
>   struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                      paddr_t start, paddr_t size, bool domU);
>   struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..636604aafa 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -261,6 +261,32 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>       cb(s, e);
>   }
>   
> +static bool __init meminfo_overlap_check(struct meminfo *meminfo,
> +                                         paddr_t region_start,
> +                                         paddr_t region_size)

So the interface looks nicer but now...

> +{
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, bank_num = meminfo->nr_banks;
> +
> +    for ( i = 0; i < bank_num; i++ )
> +    {
> +        bank_start = meminfo->bank[i].start;
> +        bank_end = bank_start + meminfo->bank[i].size;
> +
> +        if ( region_end <= bank_start || region_start >= bank_end )

... it clearly shows how this check would be wrong when either the bank 
or the region is at the end of the address space. You may say it doesn't 
overlap when it could (e.g. when region_end < region_start).

That said, unless we rework 'bank', we would not properly solve the 
problem. But that's likely a bigger piece of work and not something I 
would request.

So for now, I would suggest to add a comment. Stefano, what do you think?

> +            continue;
> +        else
> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr"] overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr"]\n",

']' usually mean inclusive. But here, 'end' is exclusive. So you want '['.

This could be fixed on commit.


BTW, the same comments applies for the second patch.

> +                   region_start, region_end, i, bank_start, bank_end);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>   void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                     void (*cb)(paddr_t, paddr_t),
>                                     unsigned int first)
> @@ -271,7 +297,22 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>           cb(s, e);
>   }
>   
> +/*
> + * Given an input physical address range, check if this range is overlapping
> + * with the existing reserved memory regions defined in bootinfo.
> + * Return true if the input physical address range is overlapping with any
> + * existing reserved memory regions, otherwise false.
> + */
> +bool __init check_reserved_regions_overlap(paddr_t region_start,
> +                                           paddr_t region_size)
> +{
> +    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
> +    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
> +                               region_start, region_size) )
> +        return true;
>   
> +    return false;
> +}
>   
>   struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                             paddr_t start, paddr_t size,

Cheers,

-- 
Julien Grall

