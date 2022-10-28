Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB256114C6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 16:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432119.684859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQW9-0006BD-7n; Fri, 28 Oct 2022 14:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432119.684859; Fri, 28 Oct 2022 14:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQW9-00068N-4A; Fri, 28 Oct 2022 14:39:29 +0000
Received: by outflank-mailman (input) for mailman id 432119;
 Fri, 28 Oct 2022 14:39:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooQW7-00068H-VC
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 14:39:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooQW4-0004qz-QN; Fri, 28 Oct 2022 14:39:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooQW4-000258-KE; Fri, 28 Oct 2022 14:39:24 +0000
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
	bh=Hdg5PraNstj6e9uRbatxRM3GxleF6RF6zlyTJAgec0M=; b=mMFq3B0U2WTCrNU9CpA9Vjawe7
	8FOhNhI6w4zUfxptPxFg/aYd0EqyhOwTtX7ilLeNYLxAspuLtWkj9wOX7mYzi2MobUKdnjJhT5Z3N
	M5uXtCSlexyystB84GalCOVG6ky+BvFF4/bjm1HGB1NgjjckXdAqH7sxK8JYdX76Np/M=;
Message-ID: <da8190ba-74b2-8eb2-b859-6b3b845896f0@xen.org>
Date: Fri, 28 Oct 2022 15:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
 <20221025145506.5708839c@donnerap.cambridge.arm.com>
 <7f1bdc88-da6b-9a0c-03d4-319e9d8966d4@amd.com>
 <20221027153632.0cf7d004@donnerap.cambridge.arm.com>
 <5afda99e-dd57-5820-7075-6b60e7a794f7@amd.com>
 <20221028134947.6cc0b985@donnerap.cambridge.arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221028134947.6cc0b985@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/10/2022 13:49, Andre Przywara wrote:
> On Fri, 28 Oct 2022 12:44:08 +0100
> Ayan Kumar Halder <ayankuma@amd.com> wrote:
> 
>> On 27/10/2022 15:36, Andre Przywara wrote:
>>> On Thu, 27 Oct 2022 14:38:52 +0100
>>> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>
>>> Hi Ayan,
>> Hi Andre / Julien,
>>>   
>>>> On 25/10/2022 14:55, Andre Przywara wrote:
>>>>> On Tue, 25 Oct 2022 13:25:52 +0100
>>>>> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>>>
>>>>> Hi,
>>>> Hi Andre,
>>>>
>>>> Many thanks for the explanation.
>>>>
>>>> I need a clarification on the issue of atomic access to 64bit normal
>>>> memory on R52.
>>>>   
>>>>>      
>>>>>> Hi Andre/All,
>>>>>>
>>>>>> This came up while porting Xen on R52.
>>>>>>
>>>>>> Refer "ARM DDI 0568A.cID110520", B1.3.1
>>>>>>
>>>>>> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE
>>>>>> must not implement LPI support. "
>>>>>>
>>>>>> Does this mean ITS is not supported on R52 ? I am assuming yes, please
>>>>>> correct me if mistaken.
>>>>> An ITS relies on LPIs, so yes: no ITS on a v8-R32 system. I cannot find
>>>>> this restriction anymore in the v8-R64 supplement, so it would only apply
>>>>> to the R52/AArch32.
>>>>>      
>>>>>> If the answer is no, then my next query is follows :-
>>>>> Answering to that anyway ...
>>>>>      
>>>>>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>>>>>> index 9ca74bc321..dea60aac0d 100644
>>>>>> --- a/xen/arch/arm/gic-v3-lpi.c
>>>>>> +++ b/xen/arch/arm/gic-v3-lpi.c
>>>>>> @@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>>>>>>          int rc;
>>>>>>
>>>>>>          /* We rely on the data structure being atomically accessible. */
>>>>>> -    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>>>>>> +    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uint64_t));
>>>>>>
>>>>>> "unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.
>>>>>>
>>>>>> Is it fine to change it as above ?
>>>>>>
>>>>>> Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-copy
>>>>>> atomicity".
>>>>>>
>>>>>> "LDRD and STRD accesses to 64-bit aligned locations are 64-bit
>>>>>> single-copy atomic as seen by translation table walks and accesses to
>>>>>> translation tables"
>>>>> This (and the explaining paragraph) indeed suggests that this should
>>>>> work architecturally, if you use normal system memory (where you would
>>>>> hold page tables). It would be confined to ARMv8 AArch32 and ARMv7 w/
>>>>> LPAE, which matches Xen's requirements.
>>>> Does it mean that ldrd/strd will not work atomically on AArch32-v8R as
>>>> it uses MPU (not MMU, so no page tables) ?
>>> No, this mentioning of page tables is more an example or a rationale, than
>>> a requirement.
>>> What this means (in the ARMv7-A/ARMv8-A AArch32 context) it:
>>> Because on v7A-LPAE and v8-AArch32 PTEs are 64 bits wide, it's too painful
>>> to use explicit locking to make sure just writing one PTE is atomic. So
>>> the architecture demands that 64-bit aligned accesses using ldrd/strd
>>> are single-copy atomic, so software can update just one PTE easily. But
>>> this is only required for locations where page tables typically reside, so
>>> system memory. This avoids this 64-bit atomicity requirement for *every*
>>> part of the system, for instance separate buses, SRAM or flash on smaller
>>> buses, or MMIO in general.
>>>
>>> I don't find anything in the v8-R32 supplement that would step back from
>>> this requirement, although indeed the original reason (atomic PTE writes)
>>> would not apply to v8-R32. Both the LDRD/STRD description and the section
>>> listing differences in the system memory architecture do not mention
>>> anything, so I'd say that the ldrd atomicity requirement still holds.
>>>
>>> Please note that this only applies to ARMv7 *LPAE* systems, but Xen
>>> requires LPAE, and R52 is v8, so we are good, and the Xen code can rely on
>>> this.
>>>
>>> So for Xen on ARMv8-R32:
>>> *LDRD/STRD* accesses to *64-bit aligned* addresses in *RAM* would be
>>> atomic. You need to satisfy all three requirements:
>>> - You must use ldrd/strd. Just dereferencing a uint64_t pointer in C does
>>> not guarantee that, but read_atomic()/write_atomic() does.
>>> - It must be 64-bit aligned. Shouldn't be a problem if the data type is
>>> 64 bits wide. Please note the slight nastiness that ldrd would silently
>>> work on non-aligned addresses, but would lose the atomicity guarantee.
>>> ldrexd would always fault if the address is not aligned.
>>> We might want to check the alignment of data we access (assert?), if not
>>> done already.

For Arm32, we have configured the processor to enforce the alignment for 
all store/load. So I believe, it means a ldrd/strd on an unaligned 
address would crash at least on arm32.

We should ensure this will also be the case for R52 (assuming that 
strd/ldrd are considered atomic).

>>> - It must be in system RAM, so not MMIO. Also I think TCM might be a
>>> different story, but I would hope Xen would not use that directly.
>>>   
>> Many thanks for the nice explanation.
>>
>> I am trying to compare this with the atomicity requirement for AArch64
>> (ARM DDI 0487G.b ID072021, B2.2.1 Requirements for single-copy atomicit )
>>
>> I seethat the alignment requirement is the same as for ARMv8-R32.
>>
>> "-A read that is generated by a load instruction that loads a single
>> general-purpose register and is aligned to the size of the read in the
>> instruction is single-copy atomic.
>>
>> -A write that is generated by a store instruction that stores a single
>> general-purpose register and is aligned to the size of the write in the
>> instruction is single-copy atomic"
>>
>> I think the following code change should help us to confirm the correct
>> behavior of atomic read/write on both AArch64 and AArch32 (including R52).
>>
>> diff --git a/xen/arch/arm/include/asm/atomic.h
>> b/xen/arch/arm/include/asm/atomic.h
>> index ac2798d095..f22c65a853 100644
>> --- a/xen/arch/arm/include/asm/atomic.h
>> +++ b/xen/arch/arm/include/asm/atomic.h
>> @@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const
>> volatile void *p,
>>                                               void *res,
>>                                               unsigned int size)
>>    {
>> +    ASSERT(IS_ALIGNED((unsigned long)p, size));

Please use vaddr_t instead of "unsigned long".

>>        switch ( size )
>>        {
>>        case 1:
>> @@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile
>> void *p,
>>                                                void *val,
>>                                                unsigned int size)
>>    {
>> +    ASSERT(IS_ALIGNED((unsigned long)p, size));
>>        switch ( size )
>>        {
>>        case 1:
>>
>> Please let me know if I misunderstand something.
> 
> Yes, that looks correct. Even the more "simple" atomic accesses always
> require alignment, so if you do an unaligned 32-bit read in AArch64, it
> wouldn't be single-copy atomic either.

This patch looks fine as a way to enforce the address is always aligned. 
And that would be a nice improvement for arm64. On arm32 it should not 
matter (see above why).

Cheers,

-- 
Julien Grall

