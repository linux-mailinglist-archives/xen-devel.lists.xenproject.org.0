Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F896A8907A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 02:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951637.1347485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4U89-0003xr-P2; Tue, 15 Apr 2025 00:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951637.1347485; Tue, 15 Apr 2025 00:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4U89-0003v7-LL; Tue, 15 Apr 2025 00:26:25 +0000
Received: by outflank-mailman (input) for mailman id 951637;
 Tue, 15 Apr 2025 00:26:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4U87-0003v1-Tv
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 00:26:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4U87-00FAYN-1O;
 Tue, 15 Apr 2025 00:26:23 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4U86-007Ruy-2z;
 Tue, 15 Apr 2025 00:26:23 +0000
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
	bh=2r8v3fmarfxRA8wCDhjSWp6jRVrj22y6cAOlTHJRqa8=; b=oq/NfzN2lF8Wzuv5SWJOPj2Cv1
	g/Iu1fEYBwjsBv1nzFzvKI6ltqjPrI6aJBuJyuRH1hi3ZCxuxgzyzAYLGgmTrB9doO6zAxhHDHa+6
	KXLY+yW53YvNQHAvCpndF8kYD8v/3nCjAgdqpOJWW6w/J78afVp7fT1V2M/yWAUIlHxs=;
Message-ID: <6a681c92-8c61-43f5-b266-b0306bc0b1ce@xen.org>
Date: Tue, 15 Apr 2025 09:26:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-3-luca.fancellu@arm.com>
 <d58be435-fd83-42bc-9fd0-a8884f358704@xen.org>
 <1A24757A-ECCB-4080-B370-DA44D469CC7D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1A24757A-ECCB-4080-B370-DA44D469CC7D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 15/04/2025 00:07, Luca Fancellu wrote:
> HI Julien,
> 
>> On 14 Apr 2025, at 12:41, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 11/04/2025 23:56, Luca Fancellu wrote:
>>> Implement some utility function in order to access the MPU regions
>>> from the C world.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v3 changes:
>>>   - Moved PRBAR0_EL2/PRLAR0_EL2 to arm64 specific
>>>   - Modified prepare_selector() to be easily made a NOP
>>>     for Arm32, which can address up to 32 region without
>>>     changing selector and it is also its maximum amount
>>>     of MPU regions.
>>> ---
>>> ---
>>>   xen/arch/arm/include/asm/arm64/mpu.h |   7 ++
>>>   xen/arch/arm/include/asm/mpu.h       |   1 +
>>>   xen/arch/arm/include/asm/mpu/mm.h    |  24 +++++
>>>   xen/arch/arm/mpu/mm.c                | 125 +++++++++++++++++++++++++++
>>>   4 files changed, 157 insertions(+)
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
>>> index 4d2bd7d7877f..b4e1ecdf741d 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -8,6 +8,13 @@
>>>     #ifndef __ASSEMBLY__
>>>   +/*
>>> + * The following are needed for the case generators GENERATE_WRITE_PR_REG_CASE
>>> + * and GENERATE_READ_PR_REG_CASE with num==0
>>> + */
>>> +#define PRBAR0_EL2 PRBAR_EL2
>>> +#define PRLAR0_EL2 PRLAR_EL2
>>
>> Rather than aliasing, shouldn't we just rename PR{B,L}AR_EL2 to PR{B,L}AR0_EL2? This would the code mixing between the two.
> 
> PR{B,L}AR0_ELx does not exists really, the PR{B,L}AR<n>_ELx exists for n=1..15, here I’m only using this “alias” for the generator,
> but PR{B,L}AR_EL2 are the real register.

In this case, can PR{B,L}AR0_EL2 defined in mm.c so they are not used 
anywhere else?

> 
>>
>>> +
>>>   /* Protection Region Base Address Register */
>>>   typedef union {
>>>       struct __packed {
>>> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>> index e148c705b82c..59ff22c804c1 100644
>>> --- a/xen/arch/arm/include/asm/mpu.h
>>> +++ b/xen/arch/arm/include/asm/mpu.h
>>> @@ -13,6 +13,7 @@
>>>   #define MPU_REGION_SHIFT  6
>>>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>>>   #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>>> +#define MPU_REGION_RES0   (0xFFFULL << 52)
>>>     #define NUM_MPU_REGIONS_SHIFT   8
>>>   #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
>>> index 86f33d9836b7..5cabe9d111ce 100644
>>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>>> @@ -8,6 +8,7 @@
>>>   #include <xen/page-size.h>
>>>   #include <xen/types.h>
>>>   #include <asm/mm.h>
>>> +#include <asm/mpu.h>
>>>     extern struct page_info *frame_table;
>>>   @@ -29,6 +30,29 @@ static inline struct page_info *virt_to_page(const void *v)
>>>       return mfn_to_page(mfn);
>>>   }
>>>   +/* Utility function to be used whenever MPU regions are modified */
>>> +static inline void context_sync_mpu(void)
>>> +{
>>> +    /*
>>> +     * ARM DDI 0600B.a, C1.7.1
>>> +     * Writes to MPU registers are only guaranteed to be visible following a
>>> +     * Context synchronization event and DSB operation.
>>
>> I know we discussed about this before. I find odd that the specification says "context synchronization event and DSB operation". At least to me, it implies "isb + dsb" not the other way around. Has this been clarified in newer version of the specification?
> 
> unfortunately no, I’m looking into the latest one (Arm® Architecture Reference Manual Supplement Armv8, for R-profile AArch64 architecture 0600B.a) but it has the same wording, however
> I spoke internally with Cortex-R architects and they told me to use DSB+ISB

So you didn't speak with the ArmV8-R architects? Asking because we are 
writing code for ArmV8-R (so not only Cortex-R).

In any case, I still think this is something that needs to be clarified
in the specification. So people that don't have access to the Arm 
internal architects know the correct sequence. Is this something you can 
follow-up on?

Cheers,

-- 
Julien Grall


