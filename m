Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827E6905DD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492324.761818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4cG-00060b-B7; Thu, 09 Feb 2023 10:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492324.761818; Thu, 09 Feb 2023 10:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4cG-0005xV-8Y; Thu, 09 Feb 2023 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 492324;
 Thu, 09 Feb 2023 10:57:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ4cE-0005xP-LC
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:57:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ4cE-0001Hu-Bp; Thu, 09 Feb 2023 10:57:22 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ4cE-0004iR-52; Thu, 09 Feb 2023 10:57:22 +0000
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
	bh=j0FaGNS3xdMcRAsMtJE5NepljQ1PXXzMJg/bIWAoLww=; b=j0Y6yimnFW1ekkk0QHGxBRH8No
	zoj/ZLA1iXehmqa0w5zTkDZ1CglbMt6nd03cQGF9ykv49XY/k3bys5+G9kqZ03uLhpNwLhVMFf+qx
	XKWsskfbuHSyldy8/RxKHOOwWT8oCCd9lUhppNJF+YQO+WQaS1e9VABkswyN9J30TWB8=;
Message-ID: <7ac6e234-0b1f-fdb0-bc21-90776b6a9d2f@xen.org>
Date: Thu, 9 Feb 2023 10:57:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 26/40] xen/mpu: destroy an existing entry in Xen MPU
 memory mapping table
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-27-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-27-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
> destroying an existing entry.
> 
> We define a new helper "control_xen_mpumap_region_from_index" to enable/disable
> the MPU region based on index. If region is within [0, 31], we could quickly
> disable the MPU region through PRENR_EL2 which provides direct access to the
> PRLAR_EL2.EN bits of EL2 MPU regions.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h     | 20 ++++++
>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +
>   xen/arch/arm/mm_mpu.c                    | 77 ++++++++++++++++++++++--
>   3 files changed, 95 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 0044bbf05d..c1dea1c8e9 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -16,6 +16,8 @@
>    */
>   #define ARM_MAX_MPU_MEMORY_REGIONS 255
>   
> +#define MPU_PRENR_BITS    32
> +
>   /* Access permission attributes. */
>   /* Read/Write at EL2, No Access at EL1/EL0. */
>   #define AP_RW_EL2 0x0
> @@ -132,6 +134,24 @@ typedef struct {
>       _pr->prlar.reg.en;                                      \
>   })
>   
> +/*
> + * Access to get base address of MPU protection region(pr_t).
> + * The base address shall be zero extended.
> + */
> +#define pr_get_base(pr) ({                                  \
> +    pr_t *_pr = pr;                                         \
> +    (uint64_t)_pr->prbar.reg.base << MPU_REGION_SHIFT;      \
> +})

Can this be a static inline?

> +
> +/*
> + * Access to get limit address of MPU protection region(pr_t).
> + * The limit address shall be concatenated with 0x3f.
> + */
> +#define pr_get_limit(pr) ({                                        \
> +    pr_t *_pr = pr;                                                \
> +    (uint64_t)((_pr->prlar.reg.limit << MPU_REGION_SHIFT) | 0x3f); \
> +})

Same.

> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __ARM64_MPU_H__ */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index aca9bca5b1..c46daf6f69 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -505,6 +505,9 @@
>   /* MPU Type registers encode */
>   #define MPUIR_EL2 S3_4_C0_C0_4
>   
> +/* MPU Protection Region Enable Register encode */
> +#define PRENR_EL2 S3_4_C6_C1_1
> +
>   #endif
>   
>   /* Access to system registers */
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index d2e19e836c..3a0d110b13 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -385,6 +385,45 @@ static int mpumap_contain_region(pr_t *mpu, uint64_t nr_regions,
>       return MPUMAP_REGION_FAILED;
>   }
>   
> +/* Disable or enable EL2 MPU memory region at index #index */
> +static void control_mpu_region_from_index(uint64_t index, bool enable)
> +{
> +    pr_t region;
> +
> +    access_protection_region(true, &region, NULL, index);
> +    if ( (region_is_valid(&region) && enable) ||
> +         (!region_is_valid(&region) && !enable) )

You could write:

!(region_is_valid(&region) ^ enable)

> +    {
> +        printk(XENLOG_WARNING
> +               "mpu: MPU memory region[%lu] is already %s\n", index,
> +               enable ? "enabled" : "disabled");
> +        return;
> +    }
> +
> +    /*
> +     * ARM64v8R provides PRENR_EL2 to have direct access to the
> +     * PRLAR_EL2.EN bits of EL2 MPU regions from 0 to 31.
> +     */
> +    if ( index < MPU_PRENR_BITS )
> +    {
> +        uint64_t orig, after;
> +
> +        orig = READ_SYSREG(PRENR_EL2);
> +        if ( enable )
> +            /* Set respective bit */
> +            after = orig | (1UL << index);
> +        else
> +            /* Clear respective bit */
> +            after = orig & (~(1UL << index));
> +        WRITE_SYSREG(after, PRENR_EL2);

Don't you need an isb (or similar) to ensure this is visible before...

> +    }
> +    else
> +    {
> +        region.prlar.reg.en = enable ? 1 : 0;
> +        access_protection_region(false, NULL, (const pr_t*)&region, index);
> +    }
> +}
> +
>   /*
>    * Update an entry at the index @idx.
>    * @base:  base address
> @@ -449,6 +488,30 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>           if ( system_state <= SYS_STATE_active )
>               update_boot_xen_mpumap_idx(idx);
>       }
> +    else
> +    {
> +        /*
> +         * Currently, we only support destroying a *WHOLE* MPU memory region,
> +         * part-region removing is not supported, as in worst case, it will
> +         * lead to two fragments in result after destroying.
> +         * part-region removing will be introduced only when actual usage
> +         * comes.
> +         */
> +        if ( rc == MPUMAP_REGION_INCLUSIVE )
> +        {
> +            region_printk("mpu: part-region removing is not supported\n");
> +            return -EINVAL;
> +        }
> +
> +        /* We are removing the region */
> +        if ( rc != MPUMAP_REGION_FOUND )
> +            return -EINVAL;
> +
> +        control_mpu_region_from_index(idx, false);
> +
> +        /* Clear the according MPU memory region entry.*/
> +        memset(&xen_mpumap[idx], 0, sizeof(pr_t));

... zeroing the entry? Also, you could use memzero() here.

> +    }
>   
>       return 0;
>   }
> @@ -589,6 +652,15 @@ static void __init map_mpu_memory_section_on_boot(enum mpu_section_info type,
>       }
>   }
>   
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s <= e);
> +
> +    return xen_mpumap_update(s, e, 0);
> +}
> +
>   /*
>    * System RAM is statically partitioned into different functionality
>    * section in Device Tree, including static xenheap, guest memory
> @@ -656,11 +728,6 @@ void *ioremap(paddr_t pa, size_t len)
>       return NULL;
>   }
>   
> -int destroy_xen_mappings(unsigned long s, unsigned long e)
> -{
> -    return -ENOSYS;
> -}
> -
>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
>   {
>       return -ENOSYS;

Cheers,

-- 
Julien Grall

