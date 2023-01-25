Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB167A819
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 01:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483820.750202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKU6U-0006DZ-4B; Wed, 25 Jan 2023 00:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483820.750202; Wed, 25 Jan 2023 00:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKU6U-0006BN-0U; Wed, 25 Jan 2023 00:57:30 +0000
Received: by outflank-mailman (input) for mailman id 483820;
 Wed, 25 Jan 2023 00:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKU6S-0006BH-GN
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 00:57:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39daefba-9c4b-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 01:57:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E0596137F;
 Wed, 25 Jan 2023 00:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96415C433EF;
 Wed, 25 Jan 2023 00:57:20 +0000 (UTC)
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
X-Inumbo-ID: 39daefba-9c4b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674608241;
	bh=x0yXbfLgcj/oiBFB9ck8jxO/ZesjK0dK4t36vQV1vjI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tZETO2QrIpw5shZW4ymnVM6V8OIYXijYmCk/FUJaFkM4r/uAPeG25poAplAqcJTif
	 /Kr+cHKQkshkWzMapYjaSkixMUp/JfdPVTU6A6m12+fz287gyeVgjxCZAz4yTqU1bv
	 8nVJEvXO+X1NPDgDc/FkfC3OEZ1OcAL3y4o3vO6eawXlwVE72Nwx3y+f7baeej9y1Y
	 dKFTRhoi6NAEhdO3Fwcl4loWU48/iIH2T4qoW/9h2bqWeCkAm5X2xyqUBwId/dwjr6
	 qRpcruXlqG1bTVgbJCZtv55TTnVRtXRvXqfjcl0zDChINwgWvIHxZEqKFCouxXQ1P/
	 X3/CaWJ7BeiNA==
Date: Tue, 24 Jan 2023 16:57:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <20221214031654.2815589-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301241657120.1978264@ubuntu-linux-20-04-desktop>
References: <20221214031654.2815589-1-Henry.Wang@arm.com> <20221214031654.2815589-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Dec 2022, Henry Wang wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> 1. Split original `overlap_check()` to `meminfo_overlap_check()`.
> 2. Rework commit message.
> ---
>  xen/arch/arm/bootfdt.c           | 13 +++++-----
>  xen/arch/arm/include/asm/setup.h |  2 ++
>  xen/arch/arm/setup.c             | 42 ++++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 0085c28d74..e2f6c7324b 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -88,6 +88,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>      for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
>      {
>          device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        if ( mem == &bootinfo.reserved_mem &&
> +             check_reserved_regions_overlap(start, size) )
> +            return -EINVAL;
>          /* Some DT may describe empty bank, ignore them */
>          if ( !size )
>              continue;
> @@ -482,7 +485,9 @@ static int __init process_shm_node(const void *fdt, int node,
>                  return -EINVAL;
>              }
>  
> -            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
> +            if ( check_reserved_regions_overlap(paddr, size) )
> +                return -EINVAL;
> +            else
>              {
>                  if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
>                      continue;
> @@ -493,12 +498,6 @@ static int __init process_shm_node(const void *fdt, int node,
>                      return -EINVAL;
>                  }
>              }
> -            else
> -            {
> -                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
> -                        mem->bank[i].start, bank_end);
> -                return -EINVAL;
> -            }
>          }
>      }
>  
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index fdbf68aadc..6a9f88ecbb 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
>  size_t boot_fdt_info(const void *fdt, paddr_t paddr);
>  const char *boot_fdt_cmdline(const void *fdt);
>  
> +int check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
> +
>  struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                     paddr_t start, paddr_t size, bool domU);
>  struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..e6eeb3a306 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -261,6 +261,31 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      cb(s, e);
>  }
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
> +                   region_start, region_end, i, bank_start, bank_end);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                    void (*cb)(paddr_t, paddr_t),
>                                    unsigned int first)
> @@ -271,7 +296,24 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>          cb(s, e);
>  }
>  
> +/*
> + * Given an input physical address range, check if this range is overlapping
> + * with the existing reserved memory regions defined in bootinfo.
> + * Return 0 if the input physical address range is not overlapping with any
> + * existing reserved memory regions, otherwise -EINVAL.
> + */
> +int __init check_reserved_regions_overlap(paddr_t region_start,
> +                                          paddr_t region_size)
> +{
> +    paddr_t region_end = region_start + region_size;
> +
> +    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
> +    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
> +                               region_start, region_end) )
> +        return -EINVAL;
>  
> +    return 0;
> +}
>  
>  struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                            paddr_t start, paddr_t size,
> -- 
> 2.25.1
> 

