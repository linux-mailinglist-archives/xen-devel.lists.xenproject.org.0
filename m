Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52250C317D0
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 15:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155764.1485182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGHvN-0003iq-8u; Tue, 04 Nov 2025 14:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155764.1485182; Tue, 04 Nov 2025 14:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGHvN-0003gA-5b; Tue, 04 Nov 2025 14:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1155764;
 Tue, 04 Nov 2025 14:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCGS=5M=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vGHvL-0003g4-PV
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 14:22:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a56bc9c1-b989-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 15:22:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54FA51CE0;
 Tue,  4 Nov 2025 06:22:00 -0800 (PST)
Received: from [10.1.31.151] (unknown [10.1.31.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BBDF3F694;
 Tue,  4 Nov 2025 06:22:06 -0800 (PST)
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
X-Inumbo-ID: a56bc9c1-b989-11f0-9d16-b5c5bf9af7f9
Message-ID: <db8fa60a-4951-4965-a5cc-ff2d0a091af7@arm.com>
Date: Tue, 4 Nov 2025 14:22:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Harry Ramsey <harry.ramsey@arm.com>
Subject: Re: [PATCH 2/3] arm: Implement reference counting for overlapping
 regions
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251024153719.408806-1-harry.ramsey@arm.com>
 <20251024153719.408806-3-harry.ramsey@arm.com>
 <0e681f9f-a563-4ace-8f58-e80a050608ba@amd.com>
Content-Language: en-GB
In-Reply-To: <0e681f9f-a563-4ace-8f58-e80a050608ba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 04/11/2025 10:21, Orzel, Michal wrote:
> On 24/10/2025 17:37, Harry Ramsey wrote:
>> Implement reference counting to enable overlapping MPU regions.
>> References are incremented and decremented in xen_mpumap_update_entry.
> AFAICT, looking at the code, you would return -EINVAL early on overlap (i.e.
> mpumap_contains_region() returning MPUMAP_REGION_OVERLAP). If so, can you
> clearly explain what this change intend to do and why we need refcounting?
Perhaps overlap is a bit misleading/confusing in this context and 
instead I should have said inclusive regions. Reference counting is used 
in this context to prevent us from attempting to remove a portion of the 
region whilst it is still in use by other regions.
>> A region will be destoryed if the reference count is 0 upon calling
> s/destoryed/destroyed/
>
>> destroy_xen_mappings and if the full region range is specified.
>>
>> Additionally XEN_MPUMAP_ENTRY_SHIFT and XEN_MPUMAP_ENTRY_SHIFT_ZERO are
>> no longer hardcoded and defined inside asm-offsets.c.
>>
>> Signed-off-by: Harry Ramsey<harry.ramsey@arm.com>
>> ---
>>   xen/arch/arm/arm32/asm-offsets.c         |  2 +
>>   xen/arch/arm/arm64/asm-offsets.c         |  2 +
>>   xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>>   xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>>   xen/arch/arm/include/asm/mpu/regions.inc | 11 +++-
>>   xen/arch/arm/mpu/mm.c                    | 73 +++++++++++++++++++-----
>>   6 files changed, 77 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
>> index c203ce269d..951f8d03f3 100644
>> --- a/xen/arch/arm/arm32/asm-offsets.c
>> +++ b/xen/arch/arm/arm32/asm-offsets.c
>> @@ -79,6 +79,8 @@ void __dummy__(void)
>>   #ifdef CONFIG_MPU
>>      DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>>      DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
>> +   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
>> +   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
>>      BLANK();
>>   #endif
>>   }
>> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
>> index 320289b281..38a3894a3b 100644
>> --- a/xen/arch/arm/arm64/asm-offsets.c
>> +++ b/xen/arch/arm/arm64/asm-offsets.c
>> @@ -73,6 +73,8 @@ void __dummy__(void)
>>   #ifdef CONFIG_MPU
>>      DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>>      DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
>> +   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
>> +   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
>>      BLANK();
>>   #endif
>>   }
>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
>> index 0a6930b3a0..137022d922 100644
>> --- a/xen/arch/arm/include/asm/arm32/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>> @@ -39,6 +39,8 @@ typedef union {
>>   typedef struct {
>>       prbar_t prbar;
>>       prlar_t prlar;
>> +    uint8_t refcount;
>> +    uint8_t pad[7];     /* Pad structure to 16 Bytes */
>>   } pr_t;
>>   
>>   #endif /* __ASSEMBLY__ */
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
>> index f0ce344e78..17f62ccaf6 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -38,6 +38,8 @@ typedef union {
>>   typedef struct {
>>       prbar_t prbar;
>>       prlar_t prlar;
>> +    uint8_t refcount;
>> +    uint8_t pad[15];    /* Pad structure to 32 Bytes */
>>   } pr_t;
>>   
>>   #endif /* __ASSEMBLY__ */
>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
>> index 23fead3b21..0cdbb17bc3 100644
>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>> @@ -14,14 +14,12 @@
>>   #define PRLAR_ELx_EN            0x1
>>   
>>   #ifdef CONFIG_ARM_64
>> -#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
>>   
>>   .macro store_pair reg1, reg2, dst
>>       stp \reg1, \reg2, [\dst]
>>   .endm
>>   
>>   #else
>> -#define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>   
>>   .macro store_pair reg1, reg2, dst
>>       strd  \reg1, \reg2, [\dst]
>> @@ -97,6 +95,15 @@
>>   
>>   3:
>>   
>> +    /* Clear the rest of the xen_mpumap entry. */
>> +#ifdef CONFIG_ARM_64
>> +    stp xzr, xzr, [\base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET]
>> +#else
>> +    mov \prbar, #0
>> +    mov \prlar, #0
>> +    strd \prbar, \prlar, [\base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET]
>> +#endif
>> +
>>       add   \sel, \sel, #1
>>   
>>   1:
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index a058db19ef..c5128244b7 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -106,6 +106,7 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>>       region = (pr_t) {
>>           .prbar = prbar,
>>           .prlar = prlar,
>> +        .refcount = 0,
>>       };
>>   
>>       /* Set base address and limit address. */
>> @@ -170,6 +171,37 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>>       return MPUMAP_REGION_NOTFOUND;
>>   }
>>   
>> +static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
>> +{
>> +    bool ret = true;
>> +
>> +    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "Mismatched Access Permission attributes (%#x0 instead of %#x0)\n",
> Why %#x0 and not %#x?
I will remove this as I do not think it is necessary to understand the 
permission attributes.
>> +               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
>> +        ret = false;
>> +    }
>> +
>> +    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
>> +               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
>> +        ret = false;
>> +    }
>> +
>> +    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
>> +               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
>> +        ret = false;
>> +    }
> What about shareability?
Unless I am mistaken, inside `page.h` we define 8 unique regions which 
have their own sharability/permissions, so if `prlar.reg.ai` does not 
match, the sharability/permissions are incorrect. Thus we should not 
require a seperate check.
>> +
>> +    return ret;
>> +}
>> +
>>   /* Map a frame table to cover physical addresses ps through pe */
>>   void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>   {
>> @@ -287,19 +319,19 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>>       /* Currently we don't support modifying an existing entry. */
>>       if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
>>       {
>> -        printk("Modifying an existing entry is not supported\n");
>> -        return -EINVAL;
>> -    }
>> +        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
> Do I understand correctly that this change (not mentioned in commit msg) is here
> so that when we call xen_mpumap_update_entry() with existing matching or
> inclusive region we will increment refcount only if the attributes match?
That would be correct, I will update the commit message to provide 
additional context especially with regards to what we mean by allocating 
inclusive regions.
>> +        {
>> +            printk("Modifying an existing entry is not supported\n");
>> +            return -EINVAL;
>> +        }
>>   
>> -    /*
>> -     * Currently, we only support removing/modifying a *WHOLE* MPU memory
>> -     * region. Part-region removal/modification is not supported as in the worst
>> -     * case it will leave two/three fragments behind.
>> -     */
> Hmm, I think that we still don't support removing/modifying regions partially.
> Why is this comment removed?
Sorry, this is a mistake and I will update the comment to reflect to 
better reflect our implementation with reference counting.
>> -    if ( rc == MPUMAP_REGION_INCLUSIVE )
>> -    {
>> -        printk("Part-region removal/modification is not supported\n");
>> -        return -EINVAL;
>> +        /* Check for overflow of refcount before incrementing.  */
>> +        if ( xen_mpumap[idx].refcount == 0xFF )
>> +        {
>> +            printk("Cannot allocate region as it would cause reference overflow\n");
>> +            return -ENOENT;
>> +        }
>> +        xen_mpumap[idx].refcount += 1;
>>       }
>>   
>>       /* We are inserting a mapping => Create new region. */
>> @@ -323,7 +355,22 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>>               return -EINVAL;
>>           }
>>   
>> -        disable_mpu_region_from_index(idx);
>> +        if ( xen_mpumap[idx].refcount == 0 )
>> +        {
>> +            if (MPUMAP_REGION_FOUND == rc)
> Missing spaces around ().
>
>> +            {
> No need for brackets for single instruction
>
>> +                disable_mpu_region_from_index(idx);
>> +            }
>> +            else
>> +            {
>> +                printk("Cannot remove a partial region\n");
>> +                return -EINVAL;
>> +            }
>> +        }
>> +        else
>> +        {
> Same here.
>
> ~Michal
Thanks for the feedback, I will address the rest of these changes in v2.

Thanks,
Harry Ramsey.

