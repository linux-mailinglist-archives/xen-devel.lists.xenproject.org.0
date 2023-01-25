Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514B67B12D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484279.750830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdxr-0006hO-L7; Wed, 25 Jan 2023 11:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484279.750830; Wed, 25 Jan 2023 11:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdxr-0006fA-IA; Wed, 25 Jan 2023 11:29:15 +0000
Received: by outflank-mailman (input) for mailman id 484279;
 Wed, 25 Jan 2023 11:29:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKdxq-0006f4-PW
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:29:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKdxq-0008V2-FR; Wed, 25 Jan 2023 11:29:14 +0000
Received: from [54.239.6.189] (helo=[192.168.17.90])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKdxq-0001n5-9L; Wed, 25 Jan 2023 11:29:14 +0000
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
	bh=hq8x5tD4fkBQZXEJ8xUmBepk3LuRIsWea3CR7KV/5eM=; b=PafRPy/zfr31stlZ/PQEoS/0T1
	GwwsWPQslxu6D3ckhYE4VmsJBp6+eeTO8ciHVMNFG5nwCSDphb2DhYUBZoTUcx+Hutr2R0mk27+LY
	UR41C/d3CpeUb6AlKnLs0bxWYaKb6MtV6OcflIllP3RpzlLCVjwFQuslePYL2r7/THuk=;
Message-ID: <e86d2b48-2da7-f21c-d191-85615a934c81@xen.org>
Date: Wed, 25 Jan 2023 11:29:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221214031654.2815589-1-Henry.Wang@arm.com>
 <20221214031654.2815589-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221214031654.2815589-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/12/2022 03:16, Henry Wang wrote:
> As we are having more and more types of static region, and all of
> these static regions are defined in bootinfo.reserved_mem, it is
> necessary to add the overlap check of reserved memory regions in Xen,
> because such check will help user to identify the misconfiguration in
> the device tree at the early stage of boot time.
> 
> Currently we have 3 types of static region, namely
> (1) static memory
> (2) static heap
> (3) static shared memory
> 
> (1) and (2) are parsed by the function `device_tree_get_meminfo()` and
> (3) is parsed using its own logic. All of parsed information of these
> types will be stored in `struct meminfo`.
> 
> Therefore, to unify the overlap checking logic for all of these types,
> this commit firstly introduces a helper `meminfo_overlap_check()` and
> a function `check_reserved_regions_overlap()` to check if an input
> physical address range is overlapping with the existing memory regions
> defined in bootinfo. After that, use `check_reserved_regions_overlap()`
> in `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
> and replace the original overlap check of (3) with
> `check_reserved_regions_overlap()`.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v1 -> v2:
> 1. Split original `overlap_check()` to `meminfo_overlap_check()`.
> 2. Rework commit message.
> ---
>   xen/arch/arm/bootfdt.c           | 13 +++++-----
>   xen/arch/arm/include/asm/setup.h |  2 ++
>   xen/arch/arm/setup.c             | 42 ++++++++++++++++++++++++++++++++
>   3 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 0085c28d74..e2f6c7324b 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -88,6 +88,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>       for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
>       {
>           device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        if ( mem == &bootinfo.reserved_mem &&
> +             check_reserved_regions_overlap(start, size) )
> +            return -EINVAL;
>           /* Some DT may describe empty bank, ignore them */
>           if ( !size )
>               continue;
> @@ -482,7 +485,9 @@ static int __init process_shm_node(const void *fdt, int node,
>                   return -EINVAL;
>               }
>   
> -            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
> +            if ( check_reserved_regions_overlap(paddr, size) )
> +                return -EINVAL;
> +            else
>               {
>                   if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
>                       continue;
> @@ -493,12 +498,6 @@ static int __init process_shm_node(const void *fdt, int node,
>                       return -EINVAL;
>                   }
>               }
> -            else
> -            {
> -                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
> -                        mem->bank[i].start, bank_end);
> -                return -EINVAL;
> -            }
>           }
>       }
>   
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index fdbf68aadc..6a9f88ecbb 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
>   size_t boot_fdt_info(const void *fdt, paddr_t paddr);
>   const char *boot_fdt_cmdline(const void *fdt);
>   
> +int check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
> +
>   struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                      paddr_t start, paddr_t size, bool domU);
>   struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..e6eeb3a306 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -261,6 +261,31 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>       cb(s, e);
>   }
>   
> +static int __init meminfo_overlap_check(struct meminfo *meminfo,
> +                                        paddr_t region_start,
> +                                        paddr_t region_end)
> +{
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> +    unsigned int i, bank_num = meminfo->nr_banks;
> +
> +    for ( i = 0; i < bank_num; i++ )
> +    {
> +        bank_start = meminfo->bank[i].start;
> +        bank_end = bank_start + meminfo->bank[i].size;
> +
> +        if ( region_end <= bank_start || region_start >= bank_end )
> +            continue;
> +        else
> +        {
> +            printk("Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",

AFAICT, in messages, the end would be inclusive. But here...

> +                   region_start, region_end, i, bank_start, bank_end);

... it would be exclusive. I would suggest to print using the format 
[start, end[ or decrement the value by 1.

Cheers,

-- 
Julien Grall

