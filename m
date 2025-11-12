Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE27C532FC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160182.1488392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD8f-0006u7-P8; Wed, 12 Nov 2025 15:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160182.1488392; Wed, 12 Nov 2025 15:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD8f-0006sT-MV; Wed, 12 Nov 2025 15:52:05 +0000
Received: by outflank-mailman (input) for mailman id 1160182;
 Wed, 12 Nov 2025 15:52:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31i5=5U=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vJD8e-0006dK-5b
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:52:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 87d22629-bfdf-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:52:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FE902B;
 Wed, 12 Nov 2025 07:51:54 -0800 (PST)
Received: from [10.57.40.63] (unknown [10.57.40.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACC473F5A1;
 Wed, 12 Nov 2025 07:52:00 -0800 (PST)
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
X-Inumbo-ID: 87d22629-bfdf-11f0-9d18-b5c5bf9af7f9
Message-ID: <fe082ad9-ee55-46bd-8b93-5320649e6aca@arm.com>
Date: Wed, 12 Nov 2025 15:51:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-2-harry.ramsey@arm.com>
 <80c02055-2687-4e24-8de0-8fb4dfe2af02@amd.com>
From: Harry Ramsey <harry.ramsey@arm.com>
In-Reply-To: <80c02055-2687-4e24-8de0-8fb4dfe2af02@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/11/2025 12:40, Orzel, Michal wrote:
>
> On 11/11/2025 11:15, Harry Ramsey wrote:
>> Implement `setup_mm` for MPU systems. This variant does not require
>> setting up a direct map.
>>
>> To reduce code duplication the common initalisation code for both MPU
>> and MMU Arm64 configurations is refactored into `setup_mm`. Platform-specific
>> setup steps are now handled by a new helper function `setup_mm_helper`.
>>
>> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
>> ---
>> Changes in v2:
>> - Improve clarity with regards to MPU setup in setup_mm
>> ---
>>   xen/arch/arm/arm64/mmu/mm.c   | 26 +------------------
>>   xen/arch/arm/include/asm/mm.h |  2 ++
>>   xen/arch/arm/mm.c             | 48 +++++++++++++++++++++++++++++++++++
>>   xen/arch/arm/mpu/mm.c         | 30 ++++++++++++++++++++--
>>   4 files changed, 79 insertions(+), 27 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>> index 3e64be6ae6..70b53be032 100644
>> --- a/xen/arch/arm/arm64/mmu/mm.c
>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>> @@ -4,8 +4,6 @@
>>   #include <xen/llc-coloring.h>
>>   #include <xen/mm.h>
>>   #include <xen/pfn.h>
>> -#include <xen/static-memory.h>
>> -#include <xen/static-shmem.h>
>>
>>   #include <asm/setup.h>
>>
>> @@ -240,33 +238,18 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
>>           panic("Unable to setup the directmap mappings.\n");
>>   }
>>
>> -void __init setup_mm(void)
>> +void __init setup_mm_helper(void)
>>   {
>>       const struct membanks *banks = bootinfo_get_mem();
>>       paddr_t ram_start = INVALID_PADDR;
>>       paddr_t ram_end = 0;
>> -    paddr_t ram_size = 0;
>>       unsigned int i;
>>
>> -    init_pdx();
>> -
>> -    /*
>> -     * We need some memory to allocate the page-tables used for the directmap
>> -     * mappings. But some regions may contain memory already allocated
>> -     * for other uses (e.g. modules, reserved-memory...).
>> -     *
>> -     * For simplicity, add all the free regions in the boot allocator.
>> -     */
>> -    populate_boot_allocator();
>> -
>> -    total_pages = 0;
>> -
>>       for ( i = 0; i < banks->nr_banks; i++ )
>>       {
>>           const struct membank *bank = &banks->bank[i];
>>           paddr_t bank_end = bank->start + bank->size;
>>
>> -        ram_size = ram_size + bank->size;
>>           ram_start = min(ram_start, bank->start);
>>           ram_end = max(ram_end, bank_end);
>>
>> @@ -274,16 +257,9 @@ void __init setup_mm(void)
>>                                    PFN_DOWN(bank->size));
>>       }
>>
>> -    total_pages += ram_size >> PAGE_SHIFT;
>> -
>>       directmap_virt_end = XENHEAP_VIRT_START + ram_end - ram_start;
>>       directmap_mfn_start = maddr_to_mfn(ram_start);
>>       directmap_mfn_end = maddr_to_mfn(ram_end);
>> -
>> -    setup_frametable_mappings(ram_start, ram_end);
>> -
>> -    init_staticmem_pages();
>> -    init_sharedmem_pages();
>>   }
>>
>>   /*
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index 7a93dad2ed..f702f4a0d6 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -202,6 +202,8 @@ extern void remove_early_mappings(void);
>>   extern int prepare_secondary_mm(int cpu);
>>   /* Map a frame table to cover physical addresses ps through pe */
>>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>> +/* Helper function to setup memory management */
>> +void setup_mm_helper(void);
>>   /* map a physical range in virtual memory */
>>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 3b05b46ee0..c1208de26c 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -12,8 +12,12 @@
>>   #include <xen/grant_table.h>
>>   #include <xen/guest_access.h>
>>   #include <xen/mm.h>
>> +#include <xen/static-memory.h>
>> +#include <xen/static-shmem.h>
>>   #include <xen/vmap.h>
>>
>> +#include <asm/setup.h>
>> +
>>   #include <xsm/xsm.h>
>>
>>   #include <public/memory.h>
>> @@ -24,6 +28,50 @@
>>
>>   unsigned long frametable_base_pdx __read_mostly;
>>
>> +#if defined(CONFIG_ARM_64) || defined(CONFIG_MPU)
>> +void __init setup_mm(void)
>> +{
>> +    const struct membanks *banks = bootinfo_get_mem();
>> +    paddr_t ram_start = INVALID_PADDR;
>> +    paddr_t ram_end = 0;
>> +    paddr_t ram_size = 0;
>> +    unsigned int i;
>> +
>> +    init_pdx();
>> +
>> +    for ( i = 0; i < banks->nr_banks; i++ )
>> +    {
>> +        const struct membank *bank = &banks->bank[i];
>> +        paddr_t bank_end = bank->start + bank->size;
>> +
>> +        ram_size = ram_size + bank->size;
>> +        ram_start = min(ram_start, bank->start);
>> +        ram_end = max(ram_end, bank_end);
>> +    }
>> +
>> +    total_pages = ram_size >> PAGE_SHIFT;
>> +
>> +    /*
>> +     * On MMU systems we need some memory to allocate the page-tables used for
>> +     * the directmap mappings.  But some regions may contain memory already
>> +     * allocated for other uses (e.g. modules, reserved-memory...).
>> +     *
>> +     * On MPU systems we need to pre-reserve regions that were allocated for
>> +     * other uses (e.g. modules, reserved-memory...).
> I'm not sure I understand this part of the comment with regards to
> populate_boot_allocator(). Could you please explain?
I think I should remove the MPU section and move this comment into patch 
3 as it is confusing without the additional context of reference counting.

During Xen initialization, the MPU assigns a refcount of 1 to 
pre-allocated regions in head.S prepare_xen_region. Unlike an MMU, an 
MPU has no virtual memory, so we must prevent these regions from being 
freed or remapped to non-preallocated areas.

>
> ~Michal
>
~Harry

