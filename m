Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459EE64514A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 02:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455748.713318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2jN6-0006Df-M4; Wed, 07 Dec 2022 01:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455748.713318; Wed, 07 Dec 2022 01:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2jN6-0006AT-IW; Wed, 07 Dec 2022 01:37:16 +0000
Received: by outflank-mailman (input) for mailman id 455748;
 Wed, 07 Dec 2022 01:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKq1=4F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p2jN5-000639-23
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 01:37:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb28fe3-75cf-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 02:37:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88EC2B81BE5;
 Wed,  7 Dec 2022 01:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C22DC433C1;
 Wed,  7 Dec 2022 01:37:10 +0000 (UTC)
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
X-Inumbo-ID: acb28fe3-75cf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670377031;
	bh=YmzgsYSRm8amxnF1lYrxWSDz1sx9jD4opvG+UwgVJ/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i0zstzILqlWokIIb9wMt2s8jwE+Ga2PLzA+3KqkQua6pQ5U39qRVdaakhLQsVbcsL
	 mgwK5skwmQYnMqbwSEwRtZoTnu3DRXoQuu/AdZR2Ukd4iN9Z6CtJ+S1t2m6jSpiFOD
	 9C+cFYs+gz1S2g1OyjkSFs7ImlUR5qDIkNh6GseEr75Ci9er7Z2LpyZo8vxrVK/keV
	 /bao4PBjJw+2a9+VkwWlX9NIkOH0M0e+YmBHwHaDlTpi03vQWGB+qVc6UoIs64s9BL
	 ZX8Hn3g6A/YZBJcAamKLSzoUjFyiQ2A3RnkYvytGkxRQkwE08buhZtdzd8Fx6vj4hB
	 Y9oh8nHwMGQUw==
Date: Tue, 6 Dec 2022 17:37:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
In-Reply-To: <20221205025753.2178965-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop>
References: <20221205025753.2178965-1-Henry.Wang@arm.com> <20221205025753.2178965-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Dec 2022, Henry Wang wrote:
> As we are having more and more types of static region, and all of
> these static regions are defined in bootinfo.reserved_mem, it is
> necessary to add the overlap check of reserved memory regions in Xen,
> because such check will help user to identify the misconfiguration in
> the device tree at the early stage of boot time.
> 
> Currently we have 3 types of static region, namely (1) static memory,
> (2) static heap, (3) static shared memory. (1) and (2) are parsed by
> the function `device_tree_get_meminfo()` and (3) is parsed using its
> own logic. Therefore, to unify the checking logic for all of these
> types of static region, this commit firstly introduces a helper
> `check_reserved_regions_overlap()` to check if an input physical
> address range is overlapping with the existing reserved memory regions
> defined in bootinfo. After that, use this helper in
> `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
> and replace the original overlap check of (3) with this new helper.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

I wonder if the check should only be done #ifdef DEBUG. The idea would
be that a given static configuration should be validated and corrected
before going into production. By the time you go in production, it is
too late to do checks anyway. Especially the panic below.

Julien, Bertrand, what do you think about this?


> ---
>  xen/arch/arm/bootfdt.c           | 13 ++++----
>  xen/arch/arm/include/asm/setup.h |  2 ++
>  xen/arch/arm/setup.c             | 52 ++++++++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 6014c0f852..b31379b9ac 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -91,6 +91,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>      for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
>      {
>          device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        if ( mem == &bootinfo.reserved_mem &&
> +             check_reserved_regions_overlap(start, size) )
> +            return -EINVAL;
>          /* Some DT may describe empty bank, ignore them */
>          if ( !size )
>              continue;
> @@ -485,7 +488,9 @@ static int __init process_shm_node(const void *fdt, int node,
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
> @@ -496,12 +501,6 @@ static int __init process_shm_node(const void *fdt, int node,
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
> index 4395640019..94d232605e 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -270,6 +270,42 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      cb(s, e);
>  }
>  
> +static int __init overlap_check(void *bootinfo_type,
> +                                paddr_t region_start, paddr_t region_end)
> +{
> +    unsigned int i, num = 0;
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> +    char *type_str = "NONAME";
> +
> +    if ( bootinfo_type == &bootinfo.reserved_mem )
> +    {
> +        num = bootinfo.reserved_mem.nr_banks;
> +        type_str = "reserved_mem";
> +    }
> +    else
> +        panic("Invalid bootinfo type passed to overlap check\n");
> +
> +    for ( i = 0; i < num; i++ )
> +    {
> +        if ( bootinfo_type == &bootinfo.reserved_mem )
> +        {
> +            bank_start = bootinfo.reserved_mem.bank[i].start;
> +            bank_end = bank_start + bootinfo.reserved_mem.bank[i].size;
> +        }
> +
> +        if ( region_end <= bank_start || region_start >= bank_end )
> +            continue;
> +        else
> +        {
> +            printk("%s: Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
> +                   type_str, region_start, region_end, i, bank_start, bank_end);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}

As much as I dislike MACROs in general I think this function should be
written as a MACRO so that we can write it once for all use cases. The
below in not compiled and not tested, just for explanation purposes.
Look how much simpler the code becomes.

#define overlap_check(bootinfo,     \
                      num,          \
                      region_start, \
                      region_end)   \
({  \
    unsigned int i, ret; \
    paddr_t bank_start = INVALID_PADDR, bank_end = 0; \
    \
    for ( i = 0; i < num; i++ ) \
    { \
        bank_start = bootinfo->start; \
        bank_end = bank_start + bootinfo->size; \
    \
        if ( region_end <= bank_start || region_start >= bank_end ) \
            continue; \
        else \
        { \
            printk("Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n", \
                   region_start, region_end, i, bank_start, bank_end); \
            ret = -EINVAL; \
            break; \
        } \
    } \
    \
    retval = 0; \
    retval;\
})


And the caller:

check_reserved_regions_overlap(&bootinfo.reserved_mem,
                               bootinfo.reserved_mem.nr_banks,
                               start, size);

