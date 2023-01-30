Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD0681CC8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 22:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487218.754770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbjI-0006Kc-1x; Mon, 30 Jan 2023 21:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487218.754770; Mon, 30 Jan 2023 21:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbjH-0006IY-Ua; Mon, 30 Jan 2023 21:30:19 +0000
Received: by outflank-mailman (input) for mailman id 487218;
 Mon, 30 Jan 2023 21:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYol=53=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pMbjG-0006IS-Cb
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 21:30:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48d5ef0d-a0e5-11ed-b63b-5f92e7d2e73a;
 Mon, 30 Jan 2023 22:30:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 759BF6127D;
 Mon, 30 Jan 2023 21:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5D6C433D2;
 Mon, 30 Jan 2023 21:30:12 +0000 (UTC)
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
X-Inumbo-ID: 48d5ef0d-a0e5-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675114213;
	bh=/4sIY4qlBNW9WG/JgZR8mA7eoWpFlZoOTC47lyDrwjo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hF/6tB3bF1q4s0xF/iM+o/TGQE5iSZ/ZbSsGNR3eL7CQsVB3FmM0xTVFvzk9tU1zP
	 qnxlHv4iYkYt8yVsIi1T+Vw4zD1wQ7ws8nQt/h3bMflXxjKYx3ITs6ZnURuWoQZmj3
	 8TGFKGA/ni7lJo3+jrX07c04FBck6lCr1ZYtOLOCjE980MkATyKizkksS9JKgtqm7E
	 EUr5KrnYFvCffulVidxsEspvAliP8juGtyNQEPOTyk4U1793D5KzGfUp1Mr1JGgRYt
	 QM4+NYRFWUsg4VSyqn3GuQNAf4n7u118TyX3CnUv5JUGDm0sB7zWJT8jw5K5uUwGdW
	 Uc1sWJuaZZQ3w==
Date: Mon, 30 Jan 2023 13:30:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Wei Chen <wei.chen@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <20230130040535.188236-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301301329550.132504@ubuntu-linux-20-04-desktop>
References: <20230130040535.188236-1-Henry.Wang@arm.com> <20230130040535.188236-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jan 2023, Henry Wang wrote:
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
> v2 -> v3:
> 1. Use "[start, end]" format in printk error message.
> 2. Change the return type of helper functions to bool.
> 3. Use 'start' and 'size' in helper functions to describe a region.
> v1 -> v2:
> 1. Split original `overlap_check()` to `meminfo_overlap_check()`.
> 2. Rework commit message.
> ---
>  xen/arch/arm/bootfdt.c           | 13 +++++-----
>  xen/arch/arm/include/asm/setup.h |  2 ++
>  xen/arch/arm/setup.c             | 41 ++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+), 7 deletions(-)
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
~  
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
> index a926f30a2b..f0592370ea 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
>  size_t boot_fdt_info(const void *fdt, paddr_t paddr);
>  const char *boot_fdt_cmdline(const void *fdt);
>  
> +bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
> +
>  struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                     paddr_t start, paddr_t size, bool domU);
>  struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..636604aafa 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -261,6 +261,32 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      cb(s, e);
>  }
>  
> +static bool __init meminfo_overlap_check(struct meminfo *meminfo,
> +                                         paddr_t region_start,
> +                                         paddr_t region_size)
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
> +            continue;
> +        else
> +        {
> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr"] overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr"]\n",
> +                   region_start, region_end, i, bank_start, bank_end);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                    void (*cb)(paddr_t, paddr_t),
>                                    unsigned int first)
> @@ -271,7 +297,22 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>          cb(s, e);
>  }
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
>  struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                            paddr_t start, paddr_t size,
> -- 
> 2.25.1
> 

