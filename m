Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A59CACF09
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 12:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180375.1503564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSYzb-0005nU-JK; Mon, 08 Dec 2025 11:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180375.1503564; Mon, 08 Dec 2025 11:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSYzb-0005lX-Gf; Mon, 08 Dec 2025 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1180375;
 Mon, 08 Dec 2025 11:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtdp=6O=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vSYza-0005lL-Gu
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 11:01:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3564c82a-d425-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 12:01:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A23CE1691;
 Mon,  8 Dec 2025 03:01:04 -0800 (PST)
Received: from [10.57.8.179] (unknown [10.57.8.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D66BC3F762;
 Mon,  8 Dec 2025 03:01:10 -0800 (PST)
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
X-Inumbo-ID: 3564c82a-d425-11f0-980a-7dc792cee155
Message-ID: <9cdaa019-f21a-41e3-bf25-0a0e36c499f2@arm.com>
Date: Mon, 8 Dec 2025 11:01:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm/mpu: Implement vmap functions for MPU
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-3-harry.ramsey@arm.com>
 <3c0a4987-81ef-4cf1-a1ad-bd8872a0dd67@amd.com>
From: Harry Ramsey <harry.ramsey@arm.com>
In-Reply-To: <3c0a4987-81ef-4cf1-a1ad-bd8872a0dd67@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08/12/2025 09:53, Orzel, Michal wrote:
>
> On 28/11/2025 10:58, Harry Ramsey wrote:
>> From: Luca Fancellu <luca.fancellu@arm.com>
>>
>> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
> Just as a reminder, we don't intend to support VMAP on MPU? Asking because it
> would otherwise be a duplicate effort to implement only these two helpers.
>
>> in places across common code. In order to keep the existing code and
>> maintain correct functionality, implement the `vmap_contig` and `vunmap`
>> functions for MPU systems.
>>
>> Introduce a helper function `destroy_entire_xen_mapping` to aid with
>> unmapping an entire region when only the start address is known.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
>> ---
>>   xen/arch/arm/include/asm/mpu/mm.h | 11 +++++
>>   xen/arch/arm/mpu/mm.c             | 67 +++++++++++++++++++++++++------
>>   xen/arch/arm/mpu/vmap.c           | 14 +++++--
>>   3 files changed, 77 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
>> index e1ded6521d..83ee0e59ca 100644
>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>> @@ -111,6 +111,17 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>>   int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>>                              paddr_t limit, uint8_t *index);
>>   
>> +
>> +/*
>> + * Destroys and frees (if reference count is 0) an entire xen mapping on MPU
>> + * systems where only the start address is known.
>> + *
>> + * @param s     Start address of memory region to be destroyed.
>> + *
>> + * @return:     0 on success, negative on error.
>> + */
>> +int destroy_entire_xen_mapping(paddr_t s);
> NIT: I read it as all the mappings which is a bit misleading :)
> Maybe something like: destroy_mapping_containing or alike?
>
>> +
>>   #endif /* __ARM_MPU_MM_H__ */
>>   
>>   /*
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 687dec3bc6..29d8e7ff11 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -290,6 +290,35 @@ static void disable_mpu_region_from_index(uint8_t index)
>>           write_protection_region(&xen_mpumap[index], index);
>>   }
>>   
>> +/*
>> + * Free a xen_mpumap entry given the index. A mpu region is actually disabled
>> + * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
>> + *
>> + * @param idx                   Index of the mpumap entry.
>> + * @param region_found_type     Either MPUMAP_REGION_FOUND or MPUMAP_REGION_INCLUSIVE.
> Both of these are unsigned, so why the parameter is int?
>
>> + * @return                      0 on success, otherwise negative on error.
>> + */
>> +static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
>> +{
>> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
>> +    ASSERT(idx != INVALID_REGION_IDX);
>> +
>> +    if ( xen_mpumap[idx].refcount == 0 )
>> +    {
>> +        if ( MPUMAP_REGION_FOUND == region_found_type )
>> +            disable_mpu_region_from_index(idx);
>> +        else
>> +        {
>> +            printk(XENLOG_ERR "Cannot remove a partial region\n");
>> +            return -EINVAL;
>> +        }
>> +    }
>> +    else
>> +        xen_mpumap[idx].refcount -= 1;
> You could avoid nesting if/else by doing:
>      if ( xen_mpumap[idx].refcount )
>      {
>          xen_mpumap[idx].refcount -= 1;
>          return 0;
>      }
>
>      if ( MPUMAP_REGION_FOUND == region_found_type )
>          disable_mpu_region_from_index(idx);
>      else
>      {
>          printk(XENLOG_ERR "Cannot remove a partial region\n");
>          return -EINVAL;
>      }
>
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>>    * given memory range and flags, creating one if none exists.
>> @@ -357,18 +386,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>>               return -EINVAL;
>>           }
>>   
>> -        if ( xen_mpumap[idx].refcount == 0 )
>> -        {
>> -            if ( MPUMAP_REGION_FOUND == rc )
>> -                disable_mpu_region_from_index(idx);
>> -            else
>> -            {
>> -                printk("Cannot remove a partial region\n");
>> -                return -EINVAL;
>> -            }
>> -        }
>> -        else
>> -            xen_mpumap[idx].refcount -= 1;
>> +        return xen_mpumap_free_entry(idx, rc);
>>       }
>>   
>>       return 0;
>> @@ -418,6 +436,31 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>       return xen_mpumap_update(s, e, 0);
>>   }
>>   
>> +int destroy_entire_xen_mapping(paddr_t s)
>> +{
>> +    int rc;
>> +    uint8_t idx;
>> +
>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>> +
>> +    spin_lock(&xen_mpumap_lock);
>> +
>> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, s, s + PAGE_SIZE,
>> +                                &idx);
> So here you are searching for a region that includes at least s + PAGE_SIZE.
>
>> +    if ( rc == MPUMAP_REGION_NOTFOUND )
>> +    {
>> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
>> +        rc = -EINVAL;
> Here you assing rc but ...
>
>> +    }
>> +
>> +    /* As we are unmapping entire region use MPUMAP_REGION_FOUND instead */
>> +    rc = xen_mpumap_free_entry(idx, MPUMAP_REGION_FOUND);
> here you would redefine it.


Sorry, this is a mistake and we should just return early as the mapping 
doesn't exist and therefore will have no references to be decremented.

>> +
>> +    spin_unlock(&xen_mpumap_lock);
>> +
>> +    return rc;
>> +}
>> +
>>   int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>>                        unsigned int flags)
>>   {
>> diff --git a/xen/arch/arm/mpu/vmap.c b/xen/arch/arm/mpu/vmap.c
>> index f977b79cd4..d3037ae98a 100644
>> --- a/xen/arch/arm/mpu/vmap.c
>> +++ b/xen/arch/arm/mpu/vmap.c
>> @@ -1,19 +1,27 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>>   #include <xen/bug.h>
>> +#include <xen/mm.h>
>>   #include <xen/mm-frame.h>
>>   #include <xen/types.h>
>>   #include <xen/vmap.h>
>>   
>>   void *vmap_contig(mfn_t mfn, unsigned int nr)
>>   {
>> -    BUG_ON("unimplemented");
>> -    return NULL;
>> +    paddr_t base = mfn_to_maddr(mfn);
>> +
>> +    if ( map_pages_to_xen(base, mfn, nr, PAGE_HYPERVISOR ) )
>> +        return NULL;
>> +
>> +    return maddr_to_virt(base);
>>   }
>>   
>>   void vunmap(const void *va)
>>   {
>> -    BUG_ON("unimplemented");
>> +    paddr_t base = virt_to_maddr(va);
>> +
>> +    if ( destroy_entire_xen_mapping(base) )
>> +        panic("Failed to vunmap region\n");
> Looking at common vunmap() we ignore the return code from
> destroy_xen_mappings(). Is it ok to diverge?
>
> ~Michal
>
>>   }
>>   
>>   /*


I will address the code style comments in the next version of these patches.

Thanks,

Harry Ramsey


