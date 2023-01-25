Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C7067B126
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484264.750810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdvc-0005WK-3H; Wed, 25 Jan 2023 11:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484264.750810; Wed, 25 Jan 2023 11:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdvb-0005Tp-Ve; Wed, 25 Jan 2023 11:26:55 +0000
Received: by outflank-mailman (input) for mailman id 484264;
 Wed, 25 Jan 2023 11:26:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKdva-0005TV-4a
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:26:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKdvZ-0008Ry-SE; Wed, 25 Jan 2023 11:26:53 +0000
Received: from [54.239.6.189] (helo=[192.168.17.90])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKdvZ-0001jT-MB; Wed, 25 Jan 2023 11:26:53 +0000
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
	bh=oHnuqwdp7arSV56KzoSCjHLJqp8kA7vAlZet81OOiJg=; b=v356EbYOMQTGfZspJGBS6CoO3E
	YxAe+9HSsgYoT6CnKq5s/yfQaomZ2DV3jMZOAyyMjWHPR1xZ0b5rdtwljebajwJhTK70U/Dao6Z+r
	fLr3sNFpyT5SRALNYoexYuRmFcMajsjM2UMotKOIopn7IREk0qBjgMiRNyPcpP9lsKjQ=;
Message-ID: <bb52731d-94b3-694b-8038-8c87dd986654@xen.org>
Date: Wed, 25 Jan 2023 11:26:51 +0000
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

Hi Henry,

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

I am starting to dislike the use of 'end' for a couple of reasons:
   1) It never clear whether this is inclusive or exclusive
   2) When it is exclusive, this doesn't properly work if the region 
finish at (2^64 - 1) as 'end' would be 0

I have started to clean-up the Arm code to avoid all those issues. So 
for new code, I would rather prefer if we use 'start' and 'size' to 
describe a region.

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
> +                   region_start, region_end, i, bank_start, bank_end);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                     void (*cb)(paddr_t, paddr_t),
>                                     unsigned int first)
> @@ -271,7 +296,24 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>           cb(s, e);
>   }
>   
> +/*
> + * Given an input physical address range, check if this range is overlapping
> + * with the existing reserved memory regions defined in bootinfo.
> + * Return 0 if the input physical address range is not overlapping with any
> + * existing reserved memory regions, otherwise -EINVAL.
> + */
> +int __init check_reserved_regions_overlap(paddr_t region_start,
> +                                          paddr_t region_size)

None of the caller seems to care about the return (other than it is 
failing or not). So I would prefer if this returns a boolean to indicate 
whether the check pass or not.

> +{
> +    paddr_t region_end = region_start + region_size; > +
> +    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
> +    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
> +                               region_start, region_end) )
> +        return -EINVAL;
>   
> +    return 0;
> +}
>   
>   struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                             paddr_t start, paddr_t size,

Cheers,

-- 
Julien Grall

