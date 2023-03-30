Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A396D1089
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516885.801727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzXp-0000sY-9h; Thu, 30 Mar 2023 21:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516885.801727; Thu, 30 Mar 2023 21:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzXp-0000qQ-6R; Thu, 30 Mar 2023 21:10:53 +0000
Received: by outflank-mailman (input) for mailman id 516885;
 Thu, 30 Mar 2023 21:10:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phzXn-0000qK-Pg
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:10:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzXn-0002lt-2R; Thu, 30 Mar 2023 21:10:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzXm-0003AX-LY; Thu, 30 Mar 2023 21:10:50 +0000
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
	bh=jnw/04vf1w4KZ/tUsayPAf6i7C5UalNBdM7jrGCOxgk=; b=cjLCdzc9OrVmvd0rkxFnQce8Jr
	SeC2Ls2bXhz7ck0WMTlOeXtlG3f2ovLw52MRXrDYqq0XPkfvzClkDBjimkkf7CU2fdNH7aCNgbW+m
	7jT8DnUjzP7fW13ifatCCNBgKZBj+bBOVsMnA9yvdu3cupEWHRcGTAy8klTeqZJMFz8I=;
Message-ID: <e6289fe9-df58-07d0-77f6-ccc6edf7d3b2@xen.org>
Date: Thu, 30 Mar 2023 22:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 03/11] xen/arm: Typecast the DT values into paddr_t
In-Reply-To: <20230321140357.24094-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> In future, we wish to support 32 bit physical address.
> However, the current dt and fdt functions can only read u64 values.

Reading this again this is a bit misleading. At least the DT functions 
are able to deal read 32-bit or 64-bit values (this is based on the 
number of cells). The difference is that the functions are expecting 
64-bit variable and this will be incompatible with paddr_t (which after 
your patch may be 32-bit).

> We wish to make the DT functions read 32bit as well 64bit values
> (depending on the width of physical address). Also, we wish to detect
> if any truncation has occurred (ie while reading 32bit physical
> addresses from 64bit values read from DT).
> 
> device_tree_get_reg() should now be able to return paddr_t. This is
> invoked by various callers to get DT address and size.
> 
> For fdt_get_mem_rsv(), we have introduced wrapper ie
> fdt_get_mem_rsv_paddr() while will invoke fdt_get_mem_rsv() and
> translate uint64_t to paddr_t. The reason being we cannot modify
> fdt_get_mem_rsv() as it has been imported from external source.
> 
> For dt_read_number(), we have also introduced a wrapper ie

NIT: 'ie' seems to be out of place. I would drop it.

> dt_read_paddr() to read physical addresses. We chose not to modify the
> original function as it been used in places where it needs to

"it been used" -> "it is used" ?

> specifically 64bit values from dt (For eg dt_property_read_u64()).

I can't parse the sencen after "where it needs to...".
> 
> Xen prints an error when it detects a truncation (during typecast
> between uint64_t and paddr_t). It is not possible to return an error in
> all scenarios. So, it is user's responsibility to check the error logs.

The last sentence is a bit odd to say. Quite likely a user will not be 
aware of this requirements. And a single line in the log is likely going 
to be difficult to spot (see more below).

> 
> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
> by the code changes.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from
> 
> v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
> "[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
> this approach achieves the same purpose.
> 
> 2. No need to check for truncation while converting values from u64 to paddr_t.
> 
> v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
> 2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
> 3. Logged error messages in case truncation is detected.
> 
> v3 - 1. Renamed libfdt_xen.h to libfdt-xen.h.
> 2. Replaced u32/u64 with uint32_t/uint64_t
> 3. Use "(paddr_t)val != val" to check for truncation.
> 4. Removed the alias "#define PADDR_SHIFT PADDR_BITS".
> 
>   xen/arch/arm/bootfdt.c              | 41 ++++++++++++++++++-----
>   xen/arch/arm/domain_build.c         |  2 +-
>   xen/arch/arm/include/asm/setup.h    |  4 +--
>   xen/arch/arm/setup.c                | 14 ++++----
>   xen/arch/arm/smpboot.c              |  2 +-
>   xen/include/xen/device_tree.h       | 21 ++++++++++++
>   xen/include/xen/libfdt/libfdt-xen.h | 52 +++++++++++++++++++++++++++++
>   7 files changed, 116 insertions(+), 20 deletions(-)
>   create mode 100644 xen/include/xen/libfdt/libfdt-xen.h
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 0085c28d74..33bef1c15e 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -11,7 +11,7 @@
>   #include <xen/efi.h>
>   #include <xen/device_tree.h>
>   #include <xen/lib.h>
> -#include <xen/libfdt/libfdt.h>
> +#include <xen/libfdt/libfdt-xen.h>
>   #include <xen/sort.h>
>   #include <xsm/xsm.h>
>   #include <asm/setup.h>
> @@ -52,11 +52,32 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>       return false;
>   }
>   
> -void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                                u32 size_cells, u64 *start, u64 *size)
> +void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                                uint32_t size_cells, paddr_t *start,
> +                                paddr_t *size)
>   {
> -    *start = dt_next_cell(address_cells, cell);
> -    *size = dt_next_cell(size_cells, cell);
> +    uint64_t dt_start, dt_size;
> +
> +    /*
> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus,

s/u64/uint64_t/ I would also say "whereas paddr_t may not be 64-bit" 
just to shorten the sentence.

> +     * there is an implicit cast from u64 to paddr_t.

s/u64/uint64_t/

> +     */
> +    dt_start = dt_next_cell(address_cells, cell);
> +    dt_size = dt_next_cell(size_cells, cell);
> +
> +    if ( dt_start != (paddr_t)dt_start  )
> +        printk("Error: Physical address greater than max width supported\n");

I would add a WARN(). Same...

> +
> +    if ( dt_size != (paddr_t)dt_size )
> +        printk("Error: Physical size greater than max width supported\n");

... here as this is easier to spot in the logs.

> +
> +    /*
> +     * Note: It is user's responsibility to check for the error messages.

See my remark above about this.

> +     * Xen will sliently truncate in case if the address/size is greater than
> +     * the max supported width.
> +     */
> +    *start = dt_start;
> +    *size = dt_size;
>   }
>   
>   static int __init device_tree_get_meminfo(const void *fdt, int node,
> @@ -326,7 +347,7 @@ static int __init process_chosen_node(const void *fdt, int node,
>           printk("linux,initrd-start property has invalid length %d\n", len);
>           return -EINVAL;
>       }
> -    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> +    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
>   
>       prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
>       if ( !prop )
> @@ -339,7 +360,7 @@ static int __init process_chosen_node(const void *fdt, int node,
>           printk("linux,initrd-end property has invalid length %d\n", len);
>           return -EINVAL;
>       }
> -    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> +    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
>   
>       if ( start >= end )
>       {
> @@ -594,9 +615,11 @@ static void __init early_print_info(void)
>       for ( i = 0; i < nr_rsvd; i++ )
>       {
>           paddr_t s, e;
> -        if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
> +
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
>               continue;
> -        /* fdt_get_mem_rsv returns length */
> +
> +        /* fdt_get_mem_rsv_paddr returns length */
>           e += s;
>           printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
>       }
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 24b12b7512..6573d15302 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -949,7 +949,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           BUG_ON(!prop);
>           cells = (const __be32 *)prop->value;
>           device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
> -        psize = dt_read_number(cells, size_cells);
> +        psize = dt_read_paddr(cells, size_cells);
>           if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
>           {
>               printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index a926f30a2b..7b697d879e 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -157,8 +157,8 @@ const char *boot_module_kind_as_string(bootmodule_kind kind);
>   extern uint32_t hyp_traps_vector[];
>   void init_traps(void);
>   
> -void device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                         u32 size_cells, u64 *start, u64 *size);
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
>   
>   u32 device_tree_get_u32(const void *fdt, int node,
>                           const char *prop_name, u32 dflt);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..755173e5a3 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -29,7 +29,7 @@
>   #include <xen/virtual_region.h>
>   #include <xen/vmap.h>
>   #include <xen/trace.h>
> -#include <xen/libfdt/libfdt.h>
> +#include <xen/libfdt/libfdt-xen.h>
>   #include <xen/acpi.h>
>   #include <xen/warning.h>
>   #include <asm/alternative.h>
> @@ -222,11 +222,11 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>       {
>           paddr_t r_s, r_e;
>   
> -        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
>               /* If we can't read it, pretend it doesn't exist... */
>               continue;
>   
> -        r_e += r_s; /* fdt_get_mem_rsv returns length */
> +        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
>   
>           if ( s < r_e && r_s < e )
>           {
> @@ -502,13 +502,13 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
>       {
>           paddr_t mod_s, mod_e;
>   
> -        if ( fdt_get_mem_rsv(device_tree_flattened,
> -                             i - mi->nr_mods,
> -                             &mod_s, &mod_e ) < 0 )
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
> +                                   i - mi->nr_mods,
> +                                   &mod_s, &mod_e ) < 0 )
>               /* If we can't read it, pretend it doesn't exist... */
>               continue;
>   
> -        /* fdt_get_mem_rsv returns length */
> +        /* fdt_get_mem_rsv_paddr returns length */
>           mod_e += mod_s;
>   
>           if ( s < mod_e && mod_s < e )
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 412ae22869..c15c177487 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -159,7 +159,7 @@ static void __init dt_smp_init_cpus(void)
>               continue;
>           }
>   
> -        addr = dt_read_number(prop, dt_n_addr_cells(cpu));
> +        addr = dt_read_paddr(prop, dt_n_addr_cells(cpu));
>   
>           hwid = addr;
>           if ( hwid != addr )
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 19a74909ce..bbc7d7377a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -241,6 +241,27 @@ static inline u64 dt_read_number(const __be32 *cell, int size)
>       return r;
>   }
>   
> +/* Wrapper for dt_read_number() to return paddr_t (instead of u64) */
> +static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
> +{
> +    uint64_t dt_r = 0;
> +    paddr_t r;
> +
> +    dt_r = dt_read_number(cell, size);
> +
> +    if ( dt_r != (paddr_t)dt_r )
> +        printk("Error: Physical address greater than max width supported\n");

Same remark as abovo here and ...

> +
> +    /*
> +     * Note: It is user's responsibility to check for the error messages.

... here. I also find interesting, you explain the check in 
device_tree_get_reg() but not in dt_read_paddr().

> +     * Xen will sliently truncate in case if the address/size is greater than
> +     * the max supported width.
> +     */
> +    r = dt_r;
> +
> +    return r;
> +}
> +
>   /* Helper to convert a number of cells to bytes */
>   static inline int dt_cells_to_size(int size)
>   {
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
> new file mode 100644
> index 0000000000..648bf41be6
> --- /dev/null
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0

This should be /* ... */ rather than //. Also please use GPL-2.0-only.

> +/*
> + * xen/include/xen/libfdt/libfdt-xen.h
> + *
> + * Wrapper functions for device tree. This helps to convert dt values
> + * between u64 and paddr_t.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + */
> +
> +#ifndef LIBFDT_XEN_H
> +#define LIBFDT_XEN_H
> +
> +#include <xen/libfdt/libfdt.h>
> +
> +inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,

This should be static inline to avoid any issue if the header is 
included in multiple units and not inlined (a compiler is free to ignore 
the inline request).

> +                                 paddr_t *address,
> +                                 paddr_t *size)
> +{
> +    uint64_t dt_addr;
> +    uint64_t dt_size;
> +    int ret = 0;
> +
> +    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);

dt_addr and dt_size will not be set if fdt_get_mem_rsv() return an 
error. So the checks below will happen on unknown value (dt_addr/dt_size 
are not initialized) and the checks will be unpredicatable.

So you want to check the return value first and then the truncation.

> +    if ( dt_addr != (paddr_t)dt_addr ) > +    {
> +        printk("Error: Physical address greater than max width supported\n");
> +        return -1;

-1 already means something in the libfdt case (it is defined as 
-FDT_ERR_NOTFOUND). So you want to use a different error value. I would 
use -FDT_ERR_MAX in this case.

BTW, I am not suggesting to use WARN() here because the error is 
properly propagated.

> +    }
> +
> +    if ( dt_size != (paddr_t)dt_size )
> +    {
> +        printk("Error: Physical size greater than max width supported\n");
> +        return -1;

Same here.

> +    }
> +
> +    *address = dt_addr;
> +    *size = dt_size;
> +
> +    return ret;
> +}
> +
> +#endif /* LIBFDT_XEN_H */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall

