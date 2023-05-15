Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DBE702866
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534681.831947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUSR-0000zz-CG; Mon, 15 May 2023 09:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534681.831947; Mon, 15 May 2023 09:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUSR-0000xm-9Y; Mon, 15 May 2023 09:25:31 +0000
Received: by outflank-mailman (input) for mailman id 534681;
 Mon, 15 May 2023 09:25:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyUSP-0000xg-HC
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:25:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyUSP-0002Q3-0d; Mon, 15 May 2023 09:25:29 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyUSO-0003ZJ-Py; Mon, 15 May 2023 09:25:28 +0000
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
	bh=eSDqX0ANqw1vckhCxB0kTPpcx8prpPMhBmDe2VqdsaE=; b=buaxHuhRSVepMjbziqJt51jqRu
	2JDoskX6dunxBZ5DSCBAHYYMROOtFCxOtW5RCDxZuJW+gkKWemYSyo5wxTOoYGzjmbp5Cfdr8RA/P
	QMVuPnXA2cxZKOJFL0NiRBXxM3uENNy3Iqa0r3ROiJnKcRZpRNBNp91zTGsppB62M13Y=;
Message-ID: <175d5e01-6258-edcc-bddd-05ff9e1eb547@xen.org>
Date: Mon, 15 May 2023 10:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
 <4681a4d4-68d3-01cd-912c-bca2cdc83266@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4681a4d4-68d3-01cd-912c-bca2cdc83266@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 11/05/2023 12:45, Ayan Kumar Halder wrote:
> 
> On 03/05/2023 13:20, Julien Grall wrote:
>> Hi,
> 
> Hi Julien,
> 
> I have some clarification.
> 
>>
>> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>>> Restructure the code so that one can use pa_range_info[] table for both
>>> ARM_32 as well as ARM_64.
>>>
>>> Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
>>> p2m_root_order can be obtained from the pa_range_info[].root_order and
>>> p2m_root_level can be obtained from pa_range_info[].sl0.
>>>
>>> Refer ARM DDI 0406C.d ID040418, B3-1345,
>>> "Use of concatenated first-level translation tables
>>>
>>> ...However, a 40-bit input address range with a translation 
>>> granularity of 4KB
>>> requires a total of 28 bits of address resolution. Therefore, a stage 2
>>> translation that supports a 40-bit input address range requires two 
>>> concatenated
>>> first-level translation tables,..."
>>>
>>> Thus, root-order is 1 for 40-bit IPA on ARM_32.
>>>
>>> Refer ARM DDI 0406C.d ID040418, B3-1348,
>>>
>>> "Determining the required first lookup level for stage 2 translations
>>>
>>> For a stage 2 translation, the output address range from the stage 1
>>> translations determines the required input address range for the stage 2
>>> translation. The permitted values of VTCR.SL0 are:
>>>
>>> 0b00 Stage 2 translation lookup must start at the second level.
>>> 0b01 Stage 2 translation lookup must start at the first level.
>>>
>>> VTCR.T0SZ must indicate the required input address range. The size of 
>>> the input
>>> address region is 2^(32-T0SZ) bytes."
>>>
>>> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of 
>>> input
>>> address region is 2^40 bytes.
>>>
>>> Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b 
>>> which is 24.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>
>>> v3 - 1. New patch introduced in v4.
>>> 2. Restructure the code such that pa_range_info[] is used both by 
>>> ARM_32 as
>>> well as ARM_64.
>>>
>>> v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and 
>>> P2M_ROOT_LEVEL.
>>> The reason being root_order will not be always 1 (See the next patch).
>>> 2. Updated the commit message to explain t0sz, sl0 and root_order 
>>> values for
>>> 32-bit IPA on Arm32.
>>> 3. Some sanity fixes.
>>>
>>> v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
>>> when PARange is 0, the PA size is 32, 1 -> 36 and so on. So 
>>> pa_range_info[] has
>>> been updated accordingly.
>>> For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not 
>>> support
>>> 32-bit, 36-bit physical address range yet.
>>>
>>>   xen/arch/arm/include/asm/p2m.h |  8 +-------
>>>   xen/arch/arm/p2m.c             | 32 ++++++++++++++++++--------------
>>>   2 files changed, 19 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>>> b/xen/arch/arm/include/asm/p2m.h
>>> index f67e9ddc72..4ddd4643d7 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -14,16 +14,10 @@
>>>   /* Holds the bit size of IPAs in p2m tables.  */
>>>   extern unsigned int p2m_ipa_bits;
>>>   -#ifdef CONFIG_ARM_64
>>>   extern unsigned int p2m_root_order;
>>>   extern unsigned int p2m_root_level;
>>> -#define P2M_ROOT_ORDER    p2m_root_order
>>> +#define P2M_ROOT_ORDER p2m_root_order
>>
>> This looks like a spurious change.
>>
>>>   #define P2M_ROOT_LEVEL p2m_root_level
>>> -#else
>>> -/* First level P2M is always 2 consecutive pages */
>>> -#define P2M_ROOT_ORDER    1
>>> -#define P2M_ROOT_LEVEL 1
>>> -#endif
>>>     struct domain;
>>>   diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 418997843d..1fe3cccf46 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -19,9 +19,9 @@
>>>     #define INVALID_VMID 0 /* VMID 0 is reserved */
>>>   -#ifdef CONFIG_ARM_64
>>>   unsigned int __read_mostly p2m_root_order;
>>>   unsigned int __read_mostly p2m_root_level;
>>> +#ifdef CONFIG_ARM_64
>>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>>   /* VMID is by default 8 bit width on AArch64 */
>>>   #define MAX_VMID       max_vmid
>>> @@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
>>>       /* Setup Stage 2 address translation */
>>>       register_t val = 
>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>   -#ifdef CONFIG_ARM_32
>>> -    if ( p2m_ipa_bits < 40 )
>>> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>> -              p2m_ipa_bits);
>>> -
>>> -    printk("P2M: 40-bit IPA\n");
>>> -    p2m_ipa_bits = 40;
>>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>>> -#else /* CONFIG_ARM_64 */
>>>       static const struct {
>>>           unsigned int pabits; /* Physical Address Size */
>>>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>>> @@ -2265,19 +2255,26 @@ void __init setup_virt_paging(void)
>>>       } pa_range_info[] __initconst = {
>>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table 
>>> D5-6 */
>>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>>> +        [2] = { 40,      24/*24*/,  1,          1 },
>>
>> I don't like the fact that the index are not ordered anymore and...
>>
>>> +#ifdef CONFIG_ARM_64
>>>           [0] = { 32,      32/*32*/,  0,          1 },
>>>           [1] = { 36,      28/*28*/,  0,          1 },
>>> -        [2] = { 40,      24/*24*/,  1,          1 },
>>>           [3] = { 42,      22/*22*/,  3,          1 },
>>>           [4] = { 44,      20/*20*/,  0,          2 },
>>>           [5] = { 48,      16/*16*/,  0,          2 },
>>>           [6] = { 52,      12/*12*/,  4,          2 },
>>>           [7] = { 0 }  /* Invalid */
>>> +#else
>>> +        [0] = { 0 },  /* Invalid */
>>> +        [1] = { 0 },  /* Invalid */
>>> +        [3] = { 0 }  /* Invalid */
>>> +#endif
>>
>> ... it is not clear to me why we are adding 3 extra entries. I think 
>> it would be better if we do:
>>
>> #ifdef CONFIG_ARM_64
>>    [0] ...
>>    [1] ...
>> #endif
>>    [2] ...
>> #ifdef CONFIG_ARM_64
>>    [3] ...
>>    [4] ...
>>    ...
>> #endif
>>
>>>       };
>>>         unsigned int i;
>>>       unsigned int pa_range = 0x10; /* Larger than any possible value */
>>>   +#ifdef CONFIG_ARM_64
>>>       /*
>>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
>>> configured
>>>        * with IPA bits == PA bits, compare against "pabits".
>>> @@ -2291,6 +2288,9 @@ void __init setup_virt_paging(void)
>>>        */
>>>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>>           max_vmid = MAX_VMID_16_BIT;
>>> +#else
>>> +    p2m_ipa_bits = PADDR_BITS;
>>> +#endif
>> Why do we need to reset p2m_ipa_bits for Arm?
> 
> Ah, this is a mistake. I will remove this.
> 
>>
>>>         /* Choose suitable "pa_range" according to the resulted 
>>> "p2m_ipa_bits". */
>>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>>> @@ -2306,24 +2306,28 @@ void __init setup_virt_paging(void)
>>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
>>> !pa_range_info[pa_range].pabits )
>>>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
>>> pa_range);
>>>   +#ifdef CONFIG_ARM_64
>>>       val |= VTCR_PS(pa_range);
>>>       val |= VTCR_TG0_4K;
>>>         /* Set the VS bit only if 16 bit VMID is supported. */
>>>       if ( MAX_VMID == MAX_VMID_16_BIT )
>>>           val |= VTCR_VS;
>>> +
>>> +    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>>> +#endif
>>> +
>>>       val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>>>       val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>>>         p2m_root_order = pa_range_info[pa_range].root_order;
>>>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;
>>> -    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>>
>> I think this line should stay for 32-bit as well because we 
>> p2m_ipa_bits should be based on the PA range we selected (see the loop 
>> 'Choose suitable "pa_range"...').
> 
> This isn't true for ARM_32.

You are correct that the line is not correct for Arm32. But my point was 
more for that fact you don't update p2m_ipa_bits based on the PA range 
selected.

> 
> ReferARM DDI 0406C.d ID040418, B3-1348, "Determining the required first 
> lookup level for stage 2 translations"
> 
> "...The size of this input address region is 2(32-TxSZ) bytes, ..."
> 
> So for
> 
> #ifdef CONFIG_ARM_32
> 
> p2m_ipa_bits = 32 - pa_range_info[pa_range].t0sz;
> 
> #endif
> 
> This will be a problem for 40-bit PA as T0SZ = 24.
> 
> So p2m_ipa_bits = 32 - 24 = 8 (which is incorrect).
> 
> 
> To get around this issue, there are two possible solutions :-
> 
> 1. For ARM_32,  do not modify p2m_ipa_bits. Thus p2m_ipa_bits will be 
> using its initialized value (ie PADDR_BITS).

AFAICT, this approach would be incorrect because we wouldn't take into 
account any restriction from the SMMU susbystem (it may support less 
than what the processor support).

> 
> 2. T0SZ should be signed int for ARM_32 (so that it can hold -8) and 
> unsigned int for ARM_64.
> 
> ie
> 
>      static const struct {
>          unsigned int pabits; /* Physical Address Size */
> #ifdef CONFIG_ARM_64
>          unsigned int t0sz:5;   /* Desired T0SZ, minimum in comment */
> #else
>          signed int t0sz:5;   /* Desired T0SZ, minimum in comment */
> #endif
>          unsigned int root_order; /* Page order of the root of the p2m */
>          unsigned int sl0;    /* Desired SL0, maximum in comment */
>      } pa_range_info[] __initconst = {
> ....
> 
> 
> I will prefer option 1 for the sake of less if..defs.
I don't think the two options are equivalent. So my first priority is 
correctness, then if we have still multiple possibility, we can discuss 
which one look the nicest to read.

To avoid the #ifdef in the struct, we could possibly use a series of 
cast. It might be slightly better because a reader will be less confused 
on the type change.

Cheers,

-- 
Julien Grall

