Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B711AB7597
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 21:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984561.1370652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFHa6-0002Sp-VR; Wed, 14 May 2025 19:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984561.1370652; Wed, 14 May 2025 19:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFHa6-0002RD-SP; Wed, 14 May 2025 19:15:54 +0000
Received: by outflank-mailman (input) for mailman id 984561;
 Wed, 14 May 2025 19:15:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uFHa6-0002R7-9f
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 19:15:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uFHa5-008Uh6-2h;
 Wed, 14 May 2025 19:15:53 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uFHa4-00CGAg-3A;
 Wed, 14 May 2025 19:15:53 +0000
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
	bh=iTVHY09+GiI6Qw4uTxeuWjeKB5WTrGC3oQDchQZXTpQ=; b=QTyM8/3hnbNAvlEeXNh/qYEfpJ
	A+ALPt5pv3vOInOXZikGASD0RRMXBwucuVqCrzIgr5ISUZPdd3jBzWMOgG4O6YXBZdn0CXtOvH0cx
	jlHGr97h9GOKdcFYKQXrCpzKCbTxeQd3Cuzfh8xcaurrsKzkDkR6lbxm9j7gMwm7z/9s=;
Message-ID: <10e84bdc-9e6a-4512-8731-605e58d5b855@xen.org>
Date: Wed, 14 May 2025 20:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-4-luca.fancellu@arm.com>
 <1e56c7e8-5302-4280-a48d-d1e958eeadc9@xen.org>
 <112E7D85-7BDB-490D-98E9-75D03397567D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <112E7D85-7BDB-490D-98E9-75D03397567D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 14/05/2025 15:27, Luca Fancellu wrote:
>>
>>> +.endm
>>> +
>>> +.macro invalidate_dcache_one reg
>>> +    nop
>>
>> Same here.
>>
>>> +.endm
>>> +> +#endif
>>> +
>>>   /*
>>>    * Macro to prepare and set a EL2 MPU memory region.
>>>    * We will also create an according MPU memory region entry, which
>>> @@ -56,6 +84,27 @@
>>>       isb
>>>       WRITE_SYSREG_ASM(\prbar, PRBAR_EL2)
>>>       WRITE_SYSREG_ASM(\prlar, PRLAR_EL2)
>>> +
>>> +    /* Load pair into xen_mpumap and invalidate cache */
>>
>> To confirm my understanding, xen_mpumap is part of the loaded binary. So we expect the bootloader to have clean the cache for us. Therefore, we
>> only need to invalidate the entries afterwards. Is it correct?
> 
> yes xen_mpumap is part of the binary, are you suggesting we should use clean and invalidate here? So for example boot-wrapper-aarch64 is not
> cleaning the cache.

I am mainly asking clarification of the expected state of the cache 
before the write. From what you wrote, the cache line will be cleaned.
So we only need to invalidate it after the write and there is no cache 
maintenance necessary before writing.

> 
>>
>>> +    adr_l \base, xen_mpumap
>>> +    add   \base, \base, \sel, LSL #XEN_MPUMAP_ENTRY_SHIFT
>>> +    store_pair \prbar, \prlar, \base
>>
>> I think you want a comment on top of pr_t to mention the structure
>> will not changed and
> 
> can you explain better this part, what should I write on top of the typedef struct {...} pt_t?

Hmm, my previous sentence made no sense. Let me retry. Today, you are 
relying on the layout of pr_t to never change. But this is not obvious 
when someone is reading the structure pr_t. So it would be good to have 
a comment such as below on top of pr_t:

"
/!\ The assembly code (see ...) relies on the pr_t. If the structure is 
modified, then the assembly code mostly likely needs to be updated
"

> 
>>
>>> +    invalidate_dcache_one \base
>>
>> This will invalidate a single line in the data cache. The size depends on the HW, but typically it will be 64 - 128 bytes. Do we have any check
>> that will confirm the data will fit in an cache line?
> 
> You are right, so we are gonna write 16 bytes at most for Arm64 and (for now) 8 bytes for Arm32, so I think we will be way below 64 bytes,
> shall we have a BUILD_BUG_ON inside build_assertions() in arm/mpu/mm.c to check sizeof(pr_t) <= 64?

I wrote "typically" because there is no guarantee that the cache line 
will be equal or bigger than 64-byte. Looking at the Arm Arm 
(CTR_EL0.DminLine), if I am not mistaken, the minimum is 16-byte, so you 
could check that sizeof() is always smaller or equal to 16-byte (should 
be the case today).

Alternatively, you could implement another helper in cache.S that would 
invalidate the cache and then don't rely on the size or alignment of the 
structure.

> 
>>
>>> +
>>> +    /* Set/clear xen_mpumap_mask bitmap */
>>> +    tst   \prlar, #PRLAR_ELx_EN
>>> +    bne   2f
>>> +    /* Region is disabled, clear the bit in the bitmap */
>>> +    bitmap_clear_bit xen_mpumap_mask, \sel, \base, \limit, \prbar, \prlar
>>> +    b     3f
>>> +
>>> +2:
>>> +    /* Region is enabled, set the bit in the bitmap */
>>> +    bitmap_set_bit xen_mpumap_mask, \sel, \base, \limit, \prbar, \prlar
>>> +
>>> +3:
>>> +    invalidate_dcache_one \base
>>
>> You want to a comment to explain what this invalidate does. AFAICT, this is for the bitmap. But given the bitmap will be typically small, wouldn't it better to do it in one go at the end?
> 
> Yes this invalidate is a bit overkill because it will invalidate 64-128 bytes starting from the address of the last changed word where the bit was.
> 
> Should I invalidate everything outside this macro, inside enable_boot_cpu_mm in arm64/mpu/head.S instead?

Yes. I think it will be easier if we end up to use a function to clean 
the cache as I suggested above.

> 
>>
>> Same comment here.
>>
>>> +
>>>       dsb   sy
>>>       isb
>>>   diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>> index 07c8959f4ee9..ee035a54b942 100644
>>> --- a/xen/arch/arm/mpu/mm.c
>>> +++ b/xen/arch/arm/mpu/mm.c
>>> @@ -7,9 +7,25 @@
>>>   #include <xen/mm.h>
>>>   #include <xen/sizes.h>
>>>   #include <xen/types.h>
>>> +#include <asm/mpu.h>
>>>     struct page_info *frame_table;
>>>   +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
>>> +uint8_t __ro_after_init max_mpu_regions;
>>> +
>>> +/*
>>> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
>>> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
>>> + * region 1, ..., and so on.
>>> + * If a MPU memory region gets enabled, set the according bit to 1.
>>> + */
>>> +DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>>> +    __section(".data.page_aligned");
>>
>> Why does this need to be page_aligned?
> 
> I see from the linker file that this section is aligned to SMP_CACHE_BYTES

The start of the section is cache aligned. But that may not be the case 
for the content within the section itself.

Also, .data.page_aligned is used for data that are page size aligned 
(currently 4KB). So everything within that section needs to be declared 
with __aligned(PAGE_SIZE). But AFAIU, the bitmap is only going to be a 
few bytes, correct?. So  think it would be a bad idea for this variable 
to be page aligned because it would end up to be a massive waste of memory.

> , which is L1_CACHE_BYTES
> for Arm, because we are using the invalidate cache I was under the impression that it’s better to have it
> aligned on the cache line

To clarify, L1_CACHE_BYTES is fixed to 128-byte. If I got correctly, 
this is less than the maximum cache line that could exist (256-bytes).

L1_CACHE_BYTES is mainly used as a hint for Xen to try to allocate 
structure in separate cache line. But when cleaning/invalidating a cache 
line, the code can't rely on the data not crossing a cache line. So you 
need a loop to invalidate each line.

Anyway, I think it would make sense to use __cacheline_aligned for both 
as the two variables are going to be used often. We should also make 
force the section to be .data, otherwise the compiler will typically put 
the variable in .bss which cannot be used during early boot. This is 
because the BSS region is not loaded in memory by the bootloader and the 
Image protocol doesn't specify the state of the region, so for 
simplicity, it is zeroed after the MMU/MPU and cache is turned on.

> 
>>
>>> +
>>> +/* EL2 Xen MPU memory region mapping table. */
>>> +pr_t __section(".data.page_aligned") xen_mpumap[MAX_MPU_REGION_NR];
>>
>> I guess for this one this is mandated by the HW?
> 
> same reason above, no other reason (I’m aware of).

.data..page_aligned makes a bit more sense here (along with 
__aligned(PAGE_SIZE)). However, it seems a bit overkill when we only 
need the region to be cache aligned. So I would follow same approach as 
I suggested for the bitmap.

Cheers,

-- 
Julien Grall


