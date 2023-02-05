Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690968B200
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 22:46:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489938.758513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmpU-0001MF-2W; Sun, 05 Feb 2023 21:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489938.758513; Sun, 05 Feb 2023 21:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmpT-0001KX-VH; Sun, 05 Feb 2023 21:45:43 +0000
Received: by outflank-mailman (input) for mailman id 489938;
 Sun, 05 Feb 2023 21:45:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOmpS-0001KR-Tu
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 21:45:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmpS-00023N-Jm; Sun, 05 Feb 2023 21:45:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmpS-0000QK-BX; Sun, 05 Feb 2023 21:45:42 +0000
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
	bh=stmcVTX7D38ez8lDEdWS3566SIyC+saTOBhoUPWmnM8=; b=DuzOwG9xYfASXm6i5RRVgKP/ye
	3TlbaGaUj1Cp1R8aj4SvE3yAtbL1WGvJN63tprA6DOtNmF0c57mrcCuZC6T2jLnnWLVM30zd7hWFX
	KhstFz+3I9ybtDpqoeZ9TpmwPrUgw6H1Op19ancObl4STMp1BQkCPzSZAtMLm8JCISLE=;
Message-ID: <a8c4577f-9eb2-cee2-5f6d-acba41f9c274@xen.org>
Date: Sun, 5 Feb 2023 21:45:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-20-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 19/40] xen/mpu: populate a new region in Xen MPU
 mapping table
In-Reply-To: <20230113052914.3845596-20-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> The new helper xen_mpumap_update() is responsible for updating an entry
> in Xen MPU memory mapping table, including creating a new entry, updating
> or destroying an existing one.
> 
> This commit only talks about populating a new entry in Xen MPU mapping table(
> xen_mpumap). Others will be introduced in the following commits.
> 
> In xen_mpumap_update_entry(), firstly, we shall check if requested address
> range [base, limit) is not mapped. Then we use pr_of_xenaddr() to build up the
> structure of MPU memory region(pr_t).
> In the last, we set memory attribute and permission based on variable @flags.
> 
> To summarize all region attributes in one variable @flags, layout of the
> flags is elaborated as follows:
> [0:2] Memory attribute Index
> [3:4] Execute Never
> [5:6] Access Permission
> [7]   Region Present
> Also, we provide a set of definitions(REGION_HYPERVISOR_RW, etc) that combine
> the memory attribute and permission for common combinations.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |  72 +++++++
>   xen/arch/arm/mm_mpu.c                | 276 ++++++++++++++++++++++++++-
>   2 files changed, 340 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index c945dd53db..fcde6ad0db 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -16,6 +16,61 @@
>    */
>   #define ARM_MAX_MPU_MEMORY_REGIONS 255
>   
> +/* Access permission attributes. */
> +/* Read/Write at EL2, No Access at EL1/EL0. */
> +#define AP_RW_EL2 0x0
> +/* Read/Write at EL2/EL1/EL0 all levels. */
> +#define AP_RW_ALL 0x1
> +/* Read-only at EL2, No Access at EL1/EL0. */
> +#define AP_RO_EL2 0x2
> +/* Read-only at EL2/EL1/EL0 all levels. */
> +#define AP_RO_ALL 0x3
> +
> +/*
> + * Excute never.
> + * Stage 1 EL2 translation regime.
> + * XN[1] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + * Stage 2 EL1/EL0 translation regime.
> + * XN[0] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + */
> +#define XN_DISABLED    0x0
> +#define XN_P2M_ENABLED 0x1
> +#define XN_ENABLED     0x2
> +
> +/*
> + * Layout of the flags used for updating Xen MPU region attributes
> + * [0:2] Memory attribute Index
> + * [3:4] Execute Never
> + * [5:6] Access Permission
> + * [7]   Region Present
> + */
> +#define _REGION_AI_BIT            0
> +#define _REGION_XN_BIT            3
> +#define _REGION_AP_BIT            5
> +#define _REGION_PRESENT_BIT       7
> +#define _REGION_XN                (2U << _REGION_XN_BIT)
> +#define _REGION_RO                (2U << _REGION_AP_BIT)
> +#define _REGION_PRESENT           (1U << _REGION_PRESENT_BIT)
> +#define REGION_AI_MASK(x)         (((x) >> _REGION_AI_BIT) & 0x7U)
> +#define REGION_XN_MASK(x)         (((x) >> _REGION_XN_BIT) & 0x3U)
> +#define REGION_AP_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x3U)
> +#define REGION_RO_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x2U)
> +
> +/*
> + * _REGION_NORMAL is convenience define. It is not meant to be used
> + * outside of this header.
> + */
> +#define _REGION_NORMAL            (MT_NORMAL|_REGION_PRESENT)
> +
> +#define REGION_HYPERVISOR_RW      (_REGION_NORMAL|_REGION_XN)
> +#define REGION_HYPERVISOR_RO      (_REGION_NORMAL|_REGION_XN|_REGION_RO)
> +
> +#define REGION_HYPERVISOR         REGION_HYPERVISOR_RW
> +
> +#define INVALID_REGION            (~0UL)
> +
>   #ifndef __ASSEMBLY__
>   
>   /* Protection Region Base Address Register */
> @@ -49,6 +104,23 @@ typedef struct {
>       prlar_t prlar;
>   } pr_t;
>   
> +/* Access to set base address of MPU protection region(pr_t). */
> +#define pr_set_base(pr, paddr) ({                           \
> +    pr_t *_pr = pr;                                         \
> +    _pr->prbar.reg.base = (paddr >> MPU_REGION_SHIFT);      \
> +})
> +
> +/* Access to set limit address of MPU protection region(pr_t). */
> +#define pr_set_limit(pr, paddr) ({                          \
> +    pr_t *_pr = pr;                                         \
> +    _pr->prlar.reg.limit = (paddr >> MPU_REGION_SHIFT);     \
> +})
> +
> +#define region_is_valid(pr) ({                              \
> +    pr_t *_pr = pr;                                         \
> +    _pr->prlar.reg.en;                                      \
> +})

Can they all be implemented using static inline?

> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ARM64_MPU_H__ */
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index f2b494449c..08720a7c19 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -22,9 +22,23 @@
>   #include <xen/init.h>
>   #include <xen/mm.h>
>   #include <xen/page-size.h>
> +#include <xen/spinlock.h>
>   #include <asm/arm64/mpu.h>
>   #include <asm/page.h>
>   
> +#ifdef NDEBUG
> +static inline void
> +__attribute__ ((__format__ (__printf__, 1, 2)))
> +region_printk(const char *fmt, ...) {}
> +#else
> +#define region_printk(fmt, args...)         \
> +    do                                      \
> +    {                                       \
> +        dprintk(XENLOG_ERR, fmt, ## args);  \
> +        WARN();                             \
> +    } while (0)
> +#endif
> +
>   /* Xen MPU memory region mapping table. */
>   pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>        xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
> @@ -46,6 +60,8 @@ uint64_t __ro_after_init next_transient_region_idx;
>   /* Maximum number of supported MPU memory regions by the EL2 MPU. */
>   uint64_t __ro_after_init max_xen_mpumap;
>   
> +static DEFINE_SPINLOCK(xen_mpumap_lock);
> +
>   /* Write a MPU protection region */
>   #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
>       uint64_t _sel = sel;                                                \
> @@ -73,6 +89,28 @@ uint64_t __ro_after_init max_xen_mpumap;
>       _pr;                                                                \
>   })
>   
> +/*
> + * In boot-time, fixed MPU regions(e.g. Xen text section) are added
> + * at the front, indexed by next_fixed_region_idx, the others like
> + * boot-only regions(e.g. early FDT) should be added at the rear,
> + * indexed by next_transient_region_idx.
> + * With more and more MPU regions added-in, when the two indexes
> + * meet and pass with each other, we would run out of the whole
> + * EL2 MPU memory regions.
> + */
> +static bool __init xen_boot_mpu_regions_is_full(void)
> +{
> +    return next_transient_region_idx < next_fixed_region_idx;
> +}
> +
> +static void __init update_boot_xen_mpumap_idx(uint64_t idx)
> +{
> +    if ( idx == next_transient_region_idx )
> +        next_transient_region_idx--;
> +    else
> +        next_fixed_region_idx++;
> +}
> +
>   /*
>    * Access MPU protection region, including both read/write operations.
>    * Armv8-R AArch64 at most supports 255 MPU protection regions.
> @@ -197,6 +235,236 @@ static void access_protection_region(bool read, pr_t *pr_read,
>       }
>   }
>   
> +/*
> + * Standard entry for building up the structure of MPU memory region(pr_t).
> + * It is equivalent to mfn_to_xen_entry in MMU system.
> + * base and limit both refer to inclusive address.
> + */
> +static inline pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
> +{
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    pr_t region;
> +
> +    /* Build up value for PRBAR_EL2. */
> +    prbar = (prbar_t) {
> +        .reg = {
> +            .ap = AP_RW_EL2,  /* Read/Write at EL2, no access at EL1/EL0. */
> +            .xn = XN_ENABLED, /* No need to execute outside .text */
> +        }};
> +
> +    switch ( attr )
> +    {
> +    case MT_NORMAL_NC:
> +        /*
> +         * ARM ARM: Overlaying the shareability attribute (DDI
> +         * 0406C.b B3-1376 to 1377)
> +         *
> +         * A memory region with a resultant memory type attribute of normal,
> +         * and a resultant cacheability attribute of Inner non-cacheable,
> +         * outer non-cacheable, must have a resultant shareability attribute
> +         * of outer shareable, otherwise shareability is UNPREDICTABLE.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for normal inner non-cacheable, outer non-cacheable.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    case MT_DEVICE_nGnRnE:
> +    case MT_DEVICE_nGnRE:
> +        /*
> +         * Shareability is ignored for non-normal memory, Outer is as
> +         * good as anything.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for any device memory type.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    default:
> +        /* Xen mappings are SMP coherent */
> +        prbar.reg.sh = LPAE_SH_INNER;
> +        break;
> +    }
> +
> +    /* Build up value for PRLAR_EL2. */
> +    prlar = (prlar_t) {
> +        .reg = {
> +            .ns = 0,        /* Hyp mode is in secure world */
> +            .ai = attr,
> +            .en = 1,        /* Region enabled */
> +        }};
> +
> +    /* Build up MPU memory region. */
> +    region = (pr_t) {
> +        .prbar = prbar,
> +        .prlar = prlar,
> +    };
> +
> +    /* Set base address and limit address. */
> +    pr_set_base(&region, base);
> +    pr_set_limit(&region, limit);
> +
> +    return region;
> +}
> +
> +#define MPUMAP_REGION_FAILED    0
> +#define MPUMAP_REGION_FOUND     1
> +#define MPUMAP_REGION_INCLUSIVE 2
> +#define MPUMAP_REGION_OVERLAP   3
> +
> +/*
> + * Check whether memory range [base, limit] is mapped in MPU memory
> + * region table \mpu. Only address range is considered, memory attributes
> + * and permission are not considered here.
> + * If we find the match, the associated index will be filled up.
> + * If the entry is not present, INVALID_REGION will be set in \index
> + *
> + * Make sure that parameter \base and \limit are both referring
> + * inclusive addresss
> + *
> + * Return values:
> + *  MPUMAP_REGION_FAILED: no mapping and no overmapping
> + *  MPUMAP_REGION_FOUND: find an exact match in address
> + *  MPUMAP_REGION_INCLUSIVE: find an inclusive match in address
> + *  MPUMAP_REGION_OVERLAP: overlap with the existing mapping
> + */
> +static int mpumap_contain_region(pr_t *mpu, uint64_t nr_regions,
> +                                 paddr_t base, paddr_t limit, uint64_t *index)

Is it really possible to support 2^64 - 1 region? If so, is that the 
case on arm32 as well?

> +{
> +    uint64_t i = 0;
> +    uint64_t _index = INVALID_REGION;
> +
> +    /* Allow index to be NULL */
> +    index = index ?: &_index;
> +
> +    for ( ; i < nr_regions; i++ )
> +    {
> +        paddr_t iter_base = pr_get_base(&mpu[i]);
> +        paddr_t iter_limit = pr_get_limit(&mpu[i]);
> +
> +        /* Found an exact valid match */
> +        if ( (iter_base == base) && (iter_limit == limit) &&
> +             region_is_valid(&mpu[i]) )
> +        {
> +            *index = i;
> +            return MPUMAP_REGION_FOUND;
> +        }
> +
> +        /* No overlapping */
> +        if ( (iter_limit < base) || (iter_base > limit) )
> +            continue;
> +        /* Inclusive and valid */
> +        else if ( (base >= iter_base) && (limit <= iter_limit) &&
> +                  region_is_valid(&mpu[i]) )
> +        {
> +            *index = i;
> +            return MPUMAP_REGION_INCLUSIVE;
> +        }
> +        else
> +        {
> +            region_printk("Range 0x%"PRIpaddr" - 0x%"PRIpaddr" overlaps with the existing region 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
> +                          base, limit, iter_base, iter_limit);
> +            return MPUMAP_REGION_OVERLAP;
> +        }
> +    }
> +
> +    return MPUMAP_REGION_FAILED;
> +}
> +
> +/*
> + * Update an entry at the index @idx.
> + * @base:  base address
> + * @limit: limit address(exclusive)
> + * @flags: region attributes, should be the combination of REGION_HYPERVISOR_xx
> + */
> +static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
> +                                   unsigned int flags)
> +{
> +    uint64_t idx;
> +    int rc;
> +
> +    rc = mpumap_contain_region(xen_mpumap, max_xen_mpumap, base, limit - 1,
> +                               &idx);
> +    if ( rc == MPUMAP_REGION_OVERLAP )
> +        return -EINVAL;
> +
> +    /* We are inserting a mapping => Create new region. */
> +    if ( flags & _REGION_PRESENT )
> +    {
> +        if ( rc != MPUMAP_REGION_FAILED )
> +            return -EINVAL;
> +
> +        if ( xen_boot_mpu_regions_is_full() )
> +        {
> +            region_printk("There is no room left in EL2 MPU memory region mapping\n");
> +            return -ENOMEM;
> +        }
> +
> +        /* During boot time, the default index is next_fixed_region_idx. */
> +        if ( system_state <= SYS_STATE_active )
> +            idx = next_fixed_region_idx;
> +
> +        xen_mpumap[idx] = pr_of_xenaddr(base, limit - 1, REGION_AI_MASK(flags));
> +        /* Set permission */
> +        xen_mpumap[idx].prbar.reg.ap = REGION_AP_MASK(flags);
> +        xen_mpumap[idx].prbar.reg.xn = REGION_XN_MASK(flags);
> +
> +        /* Update and enable the region */
> +        access_protection_region(false, NULL, (const pr_t*)(&xen_mpumap[idx]),
> +                                 idx);
> +
> +        if ( system_state <= SYS_STATE_active )
> +            update_boot_xen_mpumap_idx(idx);
> +    }
> +
> +    return 0;
> +}
> +
> +static int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
> +{
> +    int rc;
> +
> +    /*
> +     * The hardware was configured to forbid mapping both writeable and
> +     * executable.
> +     * When modifying/creating mapping (i.e _REGION_PRESENT is set),
> +     * prevent any update if this happen.
> +     */
> +    if ( (flags & _REGION_PRESENT) && !REGION_RO_MASK(flags) &&
> +         !REGION_XN_MASK(flags) )
> +    {
> +        region_printk("Mappings should not be both Writeable and Executable.\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
> +    {
> +        region_printk("base address 0x%"PRIpaddr", or limit address 0x%"PRIpaddr" is not page aligned.\n",
> +                      base, limit);
> +        return -EINVAL;
> +    }
> +
> +    spin_lock(&xen_mpumap_lock);
> +
> +    rc = xen_mpumap_update_entry(base, limit, flags);
> +
> +    spin_unlock(&xen_mpumap_lock);
> +
> +    return rc;
> +}
> +
> +int map_pages_to_xen(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    ASSERT(virt == mfn_to_maddr(mfn));
> +
> +    return xen_mpumap_update(mfn_to_maddr(mfn),
> +                             mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
> +}
> +
>   /* TODO: Implementation on the first usage */
>   void dump_hyp_walk(vaddr_t addr)
>   {
> @@ -230,14 +498,6 @@ void *ioremap(paddr_t pa, size_t len)
>       return NULL;
>   }
>   
> -int map_pages_to_xen(unsigned long virt,
> -                     mfn_t mfn,
> -                     unsigned long nr_mfns,
> -                     unsigned int flags)
> -{
> -    return -ENOSYS;
> -}
> -

Why do you implement map_pages_to_xen() at a different place?


>   int destroy_xen_mappings(unsigned long s, unsigned long e)
>   {
>       return -ENOSYS;

Cheers,

-- 
Julien Grall

