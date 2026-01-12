Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B9D11E75
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:33:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199972.1515994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFEl-0007tn-UM; Mon, 12 Jan 2026 10:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199972.1515994; Mon, 12 Jan 2026 10:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFEl-0007rr-QL; Mon, 12 Jan 2026 10:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1199972;
 Mon, 12 Jan 2026 10:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nXIy=7R=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vfFEk-0007rj-Mw
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:33:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1f590850-efa2-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 11:33:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EF30497;
 Mon, 12 Jan 2026 02:33:16 -0800 (PST)
Received: from [10.57.94.20] (unknown [10.57.94.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 791FB3F59E;
 Mon, 12 Jan 2026 02:33:22 -0800 (PST)
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
X-Inumbo-ID: 1f590850-efa2-11f0-9ccf-f158ae23cfc8
Message-ID: <c8cc26e1-248d-4d98-a7ce-d72f4ec4be5a@arm.com>
Date: Mon, 12 Jan 2026 10:33:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm/mpu: Implement vmap functions for MPU
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-3-harry.ramsey@arm.com>
 <40677f79-8e3a-4c0c-876d-d57e9b230eca@amd.com>
From: Harry Ramsey <harry.ramsey@arm.com>
In-Reply-To: <40677f79-8e3a-4c0c-876d-d57e9b230eca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2026 14:00, Orzel, Michal wrote:
>
> On 05/01/2026 12:34, Harry Ramsey wrote:
>> From: Luca Fancellu <luca.fancellu@arm.com>
>>
>> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
>> in places across common code. In order to keep the existing code and
>> maintain correct functionality, implement the `vmap_contig` and `vunmap`
>> functions for MPU systems.
>>
>> Introduce a helper function `destroy_xen_mapping_containing` to aid with
>> unmapping an entire region when only the start address is known.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
>> ---
>> v2:
>> - Rename `destroy_entire_xen_mapping` to `destroy_xen_mapping_containing`
>> - Improve code documentation.
>> - Refactor nested code.
>> - Fix ignored rc error code in `destroy_xen_mapping_containing`.
>> ---
>>   xen/arch/arm/include/asm/mpu/mm.h | 10 +++++
>>   xen/arch/arm/mpu/mm.c             | 74 ++++++++++++++++++++++++++-----
>>   xen/arch/arm/mpu/vmap.c           | 14 ++++--
>>   3 files changed, 83 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
>> index e1ded6521d..1b5ffa5b64 100644
>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>> @@ -111,6 +111,16 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
>>   int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>>                              paddr_t limit, uint8_t *index);
>>   
>> +
>> +/*
>> + * Destroys and frees (if reference count is 0) an entire xen mapping on MPU
>> + * systems where only the start address is known.
>> + *
>> + * @param s     Start address of memory region to be destroyed.
>> + * @return:     0 on success, negative on error.
>> + */
>> +int destroy_xen_mapping_containing(paddr_t s);
>> +
>>   #endif /* __ARM_MPU_MM_H__ */
>>   
>>   /*
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 687dec3bc6..207e8d2d91 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -290,6 +290,42 @@ static void disable_mpu_region_from_index(uint8_t index)
>>           write_protection_region(&xen_mpumap[index], index);
>>   }
>>   
>> +/*
>> + * Free a xen_mpumap entry given the index. A mpu region is actually disabled
>> + * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
>> + *
>> + * @param idx                   Index of the mpumap entry.
>> + * @param region_found_type     MPUMAP_REGION_* value.
>> + * @return                      0 on success, otherwise negative on error.
>> + */
>> +static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
>> +{
>> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
>> +    ASSERT(idx != INVALID_REGION_IDX);
>> +
>> +    if ( MPUMAP_REGION_OVERLAP == region_found_type )
>> +    {
>> +        printk(XENLOG_ERR "Cannot remove an overlapping region\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( xen_mpumap[idx].refcount )
>> +    {
>> +        xen_mpumap[idx].refcount -= 1;
>> +        return 0;
>> +    }
>> +
>> +    if ( MPUMAP_REGION_FOUND == region_found_type )
>> +        disable_mpu_region_from_index(idx);
>> +    else
>> +    {
>> +        printk(XENLOG_ERR "Cannot remove a partial region\n");
> Shouldn't this be moved above refcount checking? Do we expect this function to
> be called with region_found_type being MPUMAP_REGION_INCLUSIVE?

This function is expected to be given MPUMAP_REGION_INCLUSIVE and in 
doing so decrease refcount by 1. If however refcount is already 0, the 
region can only be freed by calling the entire region bounds. This 
message is moreso a debug error that our MPU API has been used in an 
incorrect way, it should not generally occur but I would prefer to keep 
it for sanity checking.


>
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>>    * given memory range and flags, creating one if none exists.
>> @@ -357,18 +393,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
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
>> @@ -418,6 +443,31 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>       return xen_mpumap_update(s, e, 0);
>>   }
>>   
>> +int destroy_xen_mapping_containing(paddr_t s)
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
>> +    if ( rc == MPUMAP_REGION_NOTFOUND )
>> +    {
>> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
> Why do we split sanity checking between this and xen_mpumap_free_entry?
> What are the possible region types that xen_mpumap_free_entry is expected to
> work with? I thought that it should only be MPUMAP_REGION_FOUND.

I will move the region checks to xen_mpumap_free_entry since we only 
want xen_mpumap_update_entry and xen_mpumap_free_entry to modify our 
refcount properties. These functions should then account for all 
potential values of MPUMAP_REGION_*.


>
> ~Michal
Thanks,
Harry Ramsey.

