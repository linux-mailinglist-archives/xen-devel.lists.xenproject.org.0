Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B79824948
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 20:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661893.1031665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLTnB-00088S-1Q; Thu, 04 Jan 2024 19:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661893.1031665; Thu, 04 Jan 2024 19:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLTnA-00085n-UB; Thu, 04 Jan 2024 19:54:12 +0000
Received: by outflank-mailman (input) for mailman id 661893;
 Thu, 04 Jan 2024 19:54:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLTn9-00085h-8u
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 19:54:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLTn8-00021f-Gu; Thu, 04 Jan 2024 19:54:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLTn8-0001Ae-4s; Thu, 04 Jan 2024 19:54:10 +0000
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
	bh=C1dY1STPhmBddEIVw3ANp/fqH7PDSqde690anWikGZ8=; b=W1GgTGoc+mSt40qL4u6u+3+Zti
	cYnS9BbRN/dKBgFk6Nl0tKupeY3p8OotzVe1qegMDx/l55vwnwBKfisRBD/zY/7CGF0ldDAT8S5vt
	/jdU6mQg/Wog8VBqA3p3bu5HdGQuhRYokjTM61BKtJnzxL0lK/sFrGEZL1xnMsSL4y5M=;
Message-ID: <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
Date: Thu, 4 Jan 2024 19:54:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-4-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-4-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This commit allows the user to set the cache coloring configuration for
> Dom0 via a command line parameter.
> Since cache coloring and static memory are incompatible, direct mapping
> Dom0 isn't possible when coloring is enabled.
> 
> A common configuration syntax for cache colors is also introduced.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v5:
> - Carlo Nonato as the new author
> - moved dom0 colors parsing (parse_colors()) in this patch
> - added dom0_set_llc_colors() to set dom0 colors after creation
> - moved color allocation and checking in this patch
> - error handling when allocating color arrays
> - FIXME: copy pasted allocate_memory() cause it got moved
> v4:
> - dom0 colors are dynamically allocated as for any other domain
>    (colors are duplicated in dom0_colors and in the new array, but logic
>    is simpler)
> ---
>   docs/misc/arm/cache-coloring.rst        |  29 ++++++
>   docs/misc/xen-command-line.pandoc       |   9 ++
>   xen/arch/arm/domain_build.c             |  60 ++++++++++-
>   xen/arch/arm/include/asm/llc-coloring.h |   1 +
>   xen/arch/arm/llc-coloring.c             | 128 ++++++++++++++++++++++++
>   5 files changed, 224 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index eabf8f5d1b..acf82c3df8 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -84,6 +84,35 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
>   +----------------------+-------------------------------+
>   | ``llc-way-size``     | set the LLC way size          |
>   +----------------------+-------------------------------+
> +| ``dom0-llc-colors``  | Dom0 color configuration      |
> ++----------------------+-------------------------------+
> +
> +Colors selection format
> +***********************
> +
> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
> +the color selection can be expressed using the same syntax. In particular a
> +comma-separated list of colors or ranges of colors is used.
> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
> +sides.
> +
> +Note that:
> +
> +- no spaces are allowed between values.
> +- no overlapping ranges or duplicated colors are allowed.
> +- values must be written in ascending order.
> +
> +Examples:
> +
> ++-------------------+-----------------------------+
> +| **Configuration** | **Actual selection**        |
> ++-------------------+-----------------------------+
> +| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
> ++-------------------+-----------------------------+
> +| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
> ++-------------------+-----------------------------+
> +| 0                 | [0]                         |
> ++-------------------+-----------------------------+
>   
>   Known issues and limitations
>   ****************************
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 22d2d5b6cf..51f6adf035 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>   
>   Specify a list of IO ports to be excluded from dom0 access.
>   
> +### dom0-llc-colors (arm64)
> +> `= List of [ <integer> | <integer>-<integer> ]`

Someone reading only xen-command-line.pandoc would not know how each 
item of the list is separated. Can this be clarified?

> +
> +> Default: `All available LLC colors`
> +
> +Specify dom0 LLC color configuration. This options is available only when
> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
> +colors are chosen and the user is warned on Xen serial console.

I would drop anything starting from  "and the user ...". This is really 
implementation define and the reader of the doc should not need to know 
that.

> +
>   ### dom0_max_vcpus
>   
>   Either:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6945b9755d..482c059bfa 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2,6 +2,7 @@
>   #include <xen/init.h>
>   #include <xen/compile.h>
>   #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/mm.h>
>   #include <xen/param.h>
>   #include <xen/domain_page.h>
> @@ -414,7 +415,7 @@ static void __init allocate_memory_11(struct domain *d,
>       }
>   }
>   
> -#ifdef CONFIG_DOM0LESS_BOOT
> +#if defined(CONFIG_DOM0LESS_BOOT) || defined(CONFIG_LLC_COLORING)
>   bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
>                                    gfn_t sgfn, paddr_t tot_size)
>   {
> @@ -478,6 +479,49 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
>   }
>   #endif
>   
> +static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)

I saw the discussion on the cover letter. I agree that allocate_memory() 
should be moved back here (ideally in a separate patch) to avoid 
duplication.

> +{
> +    unsigned int i;
> +    paddr_t bank_size;
> +
> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
> +           /* Don't want format this as PRIpaddr (16 digit hex) */
> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> +
> +    kinfo->mem.nr_banks = 0;
> +    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> +    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
> +                               bank_size) )
> +        goto fail;
> +
> +    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> +    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> +                               bank_size) )
> +        goto fail;
> +
> +    if ( kinfo->unassigned_mem )
> +        goto fail;
> +
> +    for( i = 0; i < kinfo->mem.nr_banks; i++ )
> +    {
> +        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
> +               d,
> +               i,
> +               kinfo->mem.bank[i].start,
> +               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
> +               /* Don't want format this as PRIpaddr (16 digit hex) */
> +               (unsigned long)(kinfo->mem.bank[i].size >> 20));
> +    }
> +
> +    return;
> +
> +fail:
> +    panic("Failed to allocate requested domain memory."
> +          /* Don't want format this as PRIpaddr (16 digit hex) */
> +          " %ldKB unallocated. Fix the VMs configurations.\n",
> +          (unsigned long)kinfo->unassigned_mem >> 10);
> +}
> +
>   /*
>    * When PCI passthrough is available we want to keep the
>    * "linux,pci-domain" in sync for every host bridge.
> @@ -2072,7 +2116,10 @@ static int __init construct_dom0(struct domain *d)
>       /* type must be set before allocate_memory */
>       d->arch.type = kinfo.type;
>   #endif
> -    allocate_memory_11(d, &kinfo);
> +    if ( is_domain_llc_colored(d) )

To me the choice here is more related to whether the domain direct 
mapped rather than the color itself. So I would rather prefer if we use 
is_domain_direct_mapped() even if this means the compiler will not be 
able to drop optimize the if when cache coloring is disabled.

> +        allocate_memory(d, &kinfo);
> +    else
> +        allocate_memory_11(d, &kinfo);
>       find_gnttab_region(d, &kinfo);
>   
>       rc = process_shm_chosen(d, &kinfo);
> @@ -2116,6 +2163,7 @@ void __init create_dom0(void)
>           .max_maptrack_frames = -1,
>           .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>       };
> +    unsigned int flags = CDF_privileged;
>       int rc;
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2143,10 +2191,16 @@ void __init create_dom0(void)
>               panic("SVE vector length error\n");
>       }
>   
> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> +    if ( !llc_coloring_enabled )
> +        flags |= CDF_directmap;
> +
> +    dom0 = domain_create(0, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
>           panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>   
> +    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> +        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);
> +
>       if ( alloc_dom0_vcpu0(dom0) == NULL )
>           panic("Error creating domain 0 vcpu0\n");
>   
> diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/include/asm/llc-coloring.h
> index 7885e9e3f5..ee5551e3cc 100644
> --- a/xen/arch/arm/include/asm/llc-coloring.h
> +++ b/xen/arch/arm/include/asm/llc-coloring.h
> @@ -14,6 +14,7 @@
>   #include <xen/init.h>
>   
>   bool __init llc_coloring_init(void);
> +int dom0_set_llc_colors(struct domain *d);
>   
>   #endif /* __ASM_ARM_COLORING_H__ */
>   
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 37d647f038..5ce58aba70 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -26,6 +26,63 @@ size_param("llc-way-size", llc_way_size);
>   /* Number of colors available in the LLC */
>   static unsigned int __ro_after_init nr_colors = CONFIG_NR_LLC_COLORS;
>   
> +static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
> +static unsigned int __ro_after_init dom0_num_colors;

Any reason to keep dom0_colors/dom0_num_colors after init?

> +
> +/*
> + * Parse the coloring configuration given in the buf string, following the
> + * syntax below.
> + *
> + * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> + * RANGE               ::= COLOR-COLOR
> + *
> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
> + */
> +static int parse_color_config(const char *buf, unsigned int *colors,
> +                              unsigned int *num_colors)
> +{
> +    const char *s = buf;
> +
> +    if ( !colors || !num_colors )
> +        return -EINVAL;
> +
> +    *num_colors = 0;
> +
> +    while ( *s != '\0' )
> +    {
> +        if ( *s != ',' )
> +        {
> +            unsigned int color, start, end;
> +
> +            start = simple_strtoul(s, &s, 0);
> +
> +            if ( *s == '-' )    /* Range */
> +            {
> +                s++;
> +                end = simple_strtoul(s, &s, 0);
> +            }
> +            else                /* Single value */
> +                end = start;
> +
> +            if ( start > end || (end - start) > UINT_MAX - *num_colors ||

I am always confused with operatator predence and this is even more 
confusing because some similar operations have parentheses but not 
others. Can you ask you to use () around UINT_MAX - *num_colors.

> +                 *num_colors + (end - start) >= nr_colors )

Same here. This will make a lot more obvious what you intend to write.

> +                return -EINVAL;
> +            for ( color = start; color <= end; color++ )
> +                colors[(*num_colors)++] = color;
> +        }
> +        else
> +            s++;
> +    }
> +
> +    return *s ? -EINVAL : 0;
> +}
> +
> +static int __init parse_dom0_colors(const char *s)
> +{
> +    return parse_color_config(s, dom0_colors, &dom0_num_colors);
> +}
> +custom_param("dom0-llc-colors", parse_dom0_colors);
> +
>   /* Return the LLC way size by probing the hardware */
>   static unsigned int __init get_llc_way_size(void)
>   {
> @@ -102,6 +159,28 @@ static void dump_coloring_info(unsigned char key)
>       printk("Number of LLC colors supported: %u\n", nr_colors);
>   }
>   
> +static bool check_colors(unsigned int *colors, unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    if ( num_colors > nr_colors )
> +    {
> +        printk(XENLOG_ERR "Number of LLC colors requested > %u\n", nr_colors);
> +        return false;
> +    }
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        if ( colors[i] >= nr_colors )
> +        {
> +            printk(XENLOG_ERR "LLC color %u >= %u\n", colors[i], nr_colors);
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
>   bool __init llc_coloring_init(void)
>   {
>       if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
> @@ -150,6 +229,55 @@ void domain_dump_llc_colors(struct domain *d)
>       print_colors(d->llc_colors, d->num_llc_colors);
>   }
>   
> +static int domain_alloc_colors(struct domain *d, unsigned int num_colors)
> +{
> +    d->num_llc_colors = num_colors;

Shouldn't this be set *only* after the array was allocated?

> +
> +    if ( !num_colors )
> +        return 0;
> +
> +    d->llc_colors = xmalloc_array(unsigned int, num_colors);

Can I ask to introduce malloc and free within the same patch? I know 
this could introduce unused temporarily unused code. But at least it is 
easier to confirm that the two paths are correct.

> +    if ( !d->llc_colors )
> +    {
> +        printk("Can't allocate LLC colors for domain %pd\n", d);

NIT: Above you use XENLOG_ERR for printk. But not here. To me they have 
the same severity. So can you explain the difference?

> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int domain_check_colors(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    if ( !d->num_llc_colors )
> +    {
> +        printk(XENLOG_WARNING
> +               "LLC color config not found for %pd. Using default\n", d);
> +        if ( domain_alloc_colors(d, nr_colors) )
> +            return -ENOMEM;
> +        for ( i = 0; i < nr_colors; i++ )
> +            d->llc_colors[i] = i;
> +    }
> +    else if ( !check_colors(d->llc_colors, d->num_llc_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +int dom0_set_llc_colors(struct domain *d)
> +{
> +    if ( domain_alloc_colors(d, dom0_num_colors) )
> +        return -ENOMEM;
> +
> +    memcpy(d->llc_colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors);
> +
> +    return domain_check_colors(d);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C

Cheers,

-- 
Julien Grall

