Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F136E690756
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492366.761884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ556-0004Dx-1r; Thu, 09 Feb 2023 11:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492366.761884; Thu, 09 Feb 2023 11:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ555-0004B4-V0; Thu, 09 Feb 2023 11:27:11 +0000
Received: by outflank-mailman (input) for mailman id 492366;
 Thu, 09 Feb 2023 11:27:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ554-0004Aw-Mj
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:27:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ554-00025G-5m; Thu, 09 Feb 2023 11:27:10 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ553-000625-VR; Thu, 09 Feb 2023 11:27:10 +0000
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
	bh=l8xKBW3Ps51StnTZpqRDWsODFvx92XlF9VFH9umiv1M=; b=rzdiFBmXxnDQw/4rtlbAh0bcco
	qlF7a1G996ltGhiykGOzA9JTAF6zRj/CdZRcqUh0y9XSZtLXzciaCdIc7dROPKQODhe9KPIdxKvmS
	d8uiVZHZ3D5tcx7sKP7sdzV+0inD/6tjf5fZMAuCnF1+AYWC+vTxKYvTNQd5TJn0JnGY=;
Message-ID: <af8411ba-d22f-ba66-3f29-9abc09d1e500@xen.org>
Date: Thu, 9 Feb 2023 11:27:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 34/40] xen/mpu: free init memory in MPU system
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-35-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-35-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:29, Penny Zheng wrote:
> This commit implements free_init_memory in MPU system, trying to keep
> the same strategy with MMU system.
> 
> In order to inserting BRK instruction into init code section, which
> aims to provok a fault on purpose, we should change init code section
> permission to RW at first.
> Function modify_xen_mappings is introduced to modify permission of the
> existing valid MPU memory region.
> 
> Then we nuke the instruction cache to remove entries related to init
> text.
> At last, we destroy these two MPU memory regions referring init text and
> init data using destroy_xen_mappings.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/mm_mpu.c | 85 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 83 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index 0b720004ee..de0c7d919a 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -20,6 +20,7 @@
>    */
>   
>   #include <xen/init.h>
> +#include <xen/kernel.h>
>   #include <xen/libfdt/libfdt.h>
>   #include <xen/mm.h>
>   #include <xen/page-size.h>
> @@ -77,6 +78,8 @@ static const unsigned int mpu_section_mattr[MSINFO_MAX] = {
>       REGION_HYPERVISOR_BOOT,
>   };
>   
> +extern char __init_data_begin[], __init_end[];

Now we have two places define __init_end as extern. Can this instead be 
defined in setup.h?

> +
>   /* Write a MPU protection region */
>   #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
>       uint64_t _sel = sel;                                                \
> @@ -443,8 +446,41 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>       if ( rc == MPUMAP_REGION_OVERLAP )
>           return -EINVAL;
>   
> +    /* We are updating the permission. */
> +    if ( (flags & _REGION_PRESENT) && (rc == MPUMAP_REGION_FOUND ||
> +                                       rc == MPUMAP_REGION_INCLUSIVE) )
> +    {
> +
> +        /*
> +         * Currently, we only support modifying a *WHOLE* MPU memory region,
> +         * part-region modification is not supported, as in worst case, it will
> +         * lead to three fragments in result after modification.
> +         * part-region modification will be introduced only when actual usage
> +         * come
> +         */
> +        if ( rc == MPUMAP_REGION_INCLUSIVE )
> +        {
> +            region_printk("mpu: part-region modification is not supported\n");
> +            return -EINVAL;
> +        }
> +
> +        /* We don't allow changing memory attributes. */
> +        if (xen_mpumap[idx].prlar.reg.ai != REGION_AI_MASK(flags) )
> +        {
> +            region_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
> +                          xen_mpumap[idx].prlar.reg.ai, REGION_AI_MASK(flags));
> +            return -EINVAL;
> +        }
> +
> +        /* Set new permission */
> +        xen_mpumap[idx].prbar.reg.ap = REGION_AP_MASK(flags);
> +        xen_mpumap[idx].prbar.reg.xn = REGION_XN_MASK(flags);
> +
> +        access_protection_region(false, NULL, (const pr_t*)(&xen_mpumap[idx]),
> +                                 idx);
> +    }
>       /* We are inserting a mapping => Create new region. */
> -    if ( flags & _REGION_PRESENT )
> +    else if ( flags & _REGION_PRESENT )
>       {
>           if ( rc != MPUMAP_REGION_FAILED )
>               return -EINVAL;
> @@ -831,11 +867,56 @@ void mmu_init_secondary_cpu(void)
>   
>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
>   {
> -    return -ENOSYS;
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s <= e);
> +    return xen_mpumap_update(s, e, flags);
>   }
>   
>   void free_init_memory(void)
>   {
> +    /* Kernel init text section. */
> +    paddr_t init_text = virt_to_maddr(_sinittext);
> +    paddr_t init_text_end = round_pgup(virt_to_maddr(_einittext));
> +    /* Kernel init data. */
> +    paddr_t init_data = virt_to_maddr(__init_data_begin);
> +    paddr_t init_data_end = round_pgup(virt_to_maddr(__init_end));
> +    unsigned long init_section[4] = {(unsigned long)init_text,
> +                                     (unsigned long)init_text_end,
> +                                     (unsigned long)init_data,
> +                                     (unsigned long)init_data_end};
> +    unsigned int nr_init = 2;

At first, it wasn't  obvious what's the 2 meant here. It also seems you 
expect the number to be in-sync with the one above.

I don't think the genericity is necessary here. But if you want it, then 
it would be better to use an array of structure (begin/end) so you can 
use ARRAY_SIZE() afterwards and avoid magic like "i * 2".

> +    uint32_t insn = AARCH64_BREAK_FAULT;

AMD is also working on 32-bit ARMv8R support. When it is easy (like) 
here it would best to avoid making the assumption about 64-bit only.

That said, to me it feels like a big part of this code could be shared 
with the MMU version.

> +    unsigned int i = 0, j = 0;
> +
> +    /* Change kernel init text section to RW. */
> +    modify_xen_mappings((unsigned long)init_text,
> +                        (unsigned long)init_text_end, REGION_HYPERVISOR_RW);
> +
> +    /*
> +     * From now on, init will not be used for execution anymore,
> +     * so nuke the instruction cache to remove entries related to init.
> +     */
> +    invalidate_icache_local();
> +
> +    /* Destroy two MPU memory regions referring init text and init data. */
> +    for ( ; i < nr_init; i++ )
> +    {
> +        uint32_t *p;
> +        unsigned int nr;
> +        int rc;
> +
> +        i = 2 * i;

... avoid such magic.

> +        p = (uint32_t *)init_section[i];
> +        nr = (init_section[i + 1] - init_section[i]) / sizeof(uint32_t);
> +
> +        for ( ; j < nr ; j++ )
> +            *(p + j) = insn;
> +
> +        rc = destroy_xen_mappings(init_section[i], init_section[i + 1]);
> +        if ( rc < 0 )
> +            panic("Unable to remove the init section (rc = %d)\n", rc);
> +    }
>   }
>   
>   int xenmem_add_to_physmap_one(

Cheers,

-- 
Julien Grall

