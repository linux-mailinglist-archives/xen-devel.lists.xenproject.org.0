Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E459710A08
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 12:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539521.840482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q289d-00086x-6c; Thu, 25 May 2023 10:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539521.840482; Thu, 25 May 2023 10:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q289d-00084L-2i; Thu, 25 May 2023 10:25:09 +0000
Received: by outflank-mailman (input) for mailman id 539521;
 Thu, 25 May 2023 10:25:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q289b-00084F-QV
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 10:25:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q289a-0002ZP-Vy; Thu, 25 May 2023 10:25:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q289a-0001Su-OT; Thu, 25 May 2023 10:25:06 +0000
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
	bh=rOKTM3PhuAeFMtJp9urA7WOmRhwGY1mGPdZZzOFtHR4=; b=aPEb/NczIkzi2P7r7zLYVNu96W
	5sQli5nmir1G7lEvCO/s7l4S8HufAi5UQTzXAj904BmR1BtX6xCTQ/NmxYvGQQKi5HXGFtesvmVTq
	nV1Z3qH/KtZ5V0CmKvEoA8czApsCwMwlrn+qTYsu3h9XdfE7bg7+Y3OUQsQWlfnAjuKA=;
Message-ID: <72b9c858-e414-d0f4-ed9a-b51712e4c310@xen.org>
Date: Thu, 25 May 2023 11:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN v7 07/11] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
 <20230518143920.43186-8-ayan.kumar.halder@amd.com>
 <66f04988-9a4b-39c0-fb17-c508b98e3bdf@amd.com>
 <06e08bf5-ac14-b0ae-743e-60da5e2396e4@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <06e08bf5-ac14-b0ae-743e-60da5e2396e4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/05/2023 15:21, Ayan Kumar Halder wrote:
> 
> On 19/05/2023 09:54, Michal Orzel wrote:
>> Hi Ayan,
> Hi Michal,
>>
>> On 18/05/2023 16:39, Ayan Kumar Halder wrote:
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
>>> VTCR.T0SZ, is bits [5:0] for ARM_64.
>>> VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.
>>>
>>> Thus, VTCR.T0SZ bits are interpreted accordingly for different 
>>> architecture.
>>> For this, we have used union.
>>>
>>> pa_range_info[] is indexed by ID_AA64MMFR0_EL1.PARange which is 
>>> present in Arm64
>>> only. This is the reason we do not specify the indices for ARM_32. 
>>> Also, we
>>> duplicated the entry "{ 40,      24/*24*/,  1,          1 }" between 
>>> ARM_64 and
>>> ARM_32. This is done to avoid introducing extra #if-defs.
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
>>> v6 - 1. Added pa_range_info[] entries for ARM_32 without indices. 
>>> Some entry
>>> may be duplicated between ARM_64 and ARM_32.
>>> 2. Recalculate p2m_ipa_bits for ARM_32 from T0SZ (similar to ARM_64).
>>> 3. Introduced an union to reinterpret T0SZ bits between ARM_32 and 
>>> ARM_64.
>>>
>>>   xen/arch/arm/include/asm/p2m.h |  6 ------
>>>   xen/arch/arm/p2m.c             | 37 +++++++++++++++++++++++-----------
>>>   2 files changed, 25 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>>> b/xen/arch/arm/include/asm/p2m.h
>>> index f67e9ddc72..940495d42b 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -14,16 +14,10 @@
>>>   /* Holds the bit size of IPAs in p2m tables.  */
>>>   extern unsigned int p2m_ipa_bits;
>>> -#ifdef CONFIG_ARM_64
>>>   extern unsigned int p2m_root_order;
>>>   extern unsigned int p2m_root_level;
>>>   #define P2M_ROOT_ORDER    p2m_root_order
>>>   #define P2M_ROOT_LEVEL p2m_root_level
>>> -#else
>>> -/* First level P2M is always 2 consecutive pages */
>>> -#define P2M_ROOT_ORDER    1
>>> -#define P2M_ROOT_LEVEL 1
>>> -#endif
>>>   struct domain;
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 418997843d..755cb86c5b 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -19,9 +19,9 @@
>>>   #define INVALID_VMID 0 /* VMID 0 is reserved */
>>> -#ifdef CONFIG_ARM_64
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
>>> -#ifdef CONFIG_ARM_32
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
>>> @@ -2265,6 +2255,7 @@ void __init setup_virt_paging(void)
>>>       } pa_range_info[] __initconst = {
>>>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table 
>>> D5-6 */
>>>           /*      PA size, t0sz(min), root-order, sl0(max) */
>>> +#ifdef CONFIG_ARM_64
>>>           [0] = { 32,      32/*32*/,  0,          1 },
>>>           [1] = { 36,      28/*28*/,  0,          1 },
>>>           [2] = { 40,      24/*24*/,  1,          1 },
>>> @@ -2273,11 +2264,22 @@ void __init setup_virt_paging(void)
>>>           [5] = { 48,      16/*16*/,  0,          2 },
>>>           [6] = { 52,      12/*12*/,  4,          2 },
>>>           [7] = { 0 }  /* Invalid */
>>> +#else
>>> +        { 40,      24/*24*/,  1,          1 },
>>> +        { 0 },  /* Invalid */
>> Do we really need this invalid entry?
> 
> Actually I preserved it to be consistent with ARM_64, but we can drop it 
> for ARM_32.
> 
> The only benefit of keeping this entry is that if p2m_ipa_bits is set to 
> 0 in p2m_restrict_ipa_bits(), then ...
> 
> panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
> 
> This will print pa_range as an index pointing to invalid entry.
> 
> 
> Also, this reminds me that I should change the message as 
> ID_AA64MMFR0_EL1 does not exist on ARM_32.
> 
> So this may look better for both ARM_64 and ARM_32 :-
> 
> panic("Unsupported value for p2m_ipa_bits = 0x%x\n", p2m_ipa_bits);
> 
>>
>>> +#endif
>>>       };
>>>       unsigned int i;
>>>       unsigned int pa_range = 0x10; /* Larger than any possible value */
>>> +    /* Typecast pa_range_info[].t0sz into ARM_32 and ARM_64 bit 
>>> variants. */
>> This would want some explanation in the code.
> 
> /*
> 
> VTCR.T0SZ, is bits [5:0] for ARM_64.
> 
> VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.
> 
> Thus, VTCR.T0SZ bits are interpreted accordingly for different 
> architecture.
> 
> */
> 
>>
>>> +    union {
>>> +        signed int t0sz_32:5;
>>> +        unsigned int t0sz_64:6;
>>> +    } t0sz;
>>> +
>>> +#ifdef CONFIG_ARM_64
>>>       /*
>>>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
>>> configured
>>>        * with IPA bits == PA bits, compare against "pabits".
>>> @@ -2291,6 +2293,7 @@ void __init setup_virt_paging(void)
>>>        */
>>>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>>           max_vmid = MAX_VMID_16_BIT;
>>> +#endif
>>>       /* Choose suitable "pa_range" according to the resulted 
>>> "p2m_ipa_bits". */
>>>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>>> @@ -2306,24 +2309,34 @@ void __init setup_virt_paging(void)
>>>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
>>> !pa_range_info[pa_range].pabits )
>>>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
>>> pa_range);
>>> +#ifdef CONFIG_ARM_64
>>>       val |= VTCR_PS(pa_range);
>>>       val |= VTCR_TG0_4K;
>>>       /* Set the VS bit only if 16 bit VMID is supported. */
>>>       if ( MAX_VMID == MAX_VMID_16_BIT )
>>>           val |= VTCR_VS;
>>> +#endif
>>> +
>>>       val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>>>       val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>>>       p2m_root_order = pa_range_info[pa_range].root_order;
>>>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;
>>> +
>>> +#ifdef CONFIG_ARM_64
>>> +    t0sz.t0sz_64 = pa_range_info[pa_range].t0sz;
>>>       p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>> This should be:
>> p2m_ipa_bits = 64 - t0sz.t0sz_64;
> Agreed. I should fix this.
>>
>> Another alternative would be to use anonymous unions+struct/union 
>> inside pa_range_info, e.g:
>>          union {
>>              unsigned int t0sz;
>>              struct {
>>                  signed int t0sz_32:5;
>>              };
>>          };
>> so, if t0sz stores 24, t0sz_32 would automatically store -8.
>> This could simplify the code later on, as you could just do:
>>
>> #ifdef CONFIG_ARM_64
>>      p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
>> #else
>>      p2m_ipa_bits = 32 - pa_range_info[pa_range].t0sz_32;
>> #endif
>>
>> However, I think it would require placing extra braces around 
>> initializers, i.e:
>> [0] = { 32,      {32/*32*/},  0,          1 },
> 
> I am not very sure of this alternative approach because of the extra 
> braces.
> 
> However, if you think it is better this way, then I can change this.
> 
> May be Julien/Stefano should also comment on this alternative approach.

I find the solution suggested by Michal not straightforward. One would 
need to remember to add {} in order to get the proper value.

Furthermore, the value would be written with t0sz_32 but read with t0sz 
in one case. The latter is much bigger and it is not clear what would be 
the values of the other (padding) bits.

Regarding Ayan's solution, it is pretty unclear why you need an union as 
the values arereading/writing from/to the same fields. I also don't we 
should modify 64-bit code (at least the reasoning is not clear). So I 
would consider to write:

{
    struct
    {
        signed int val: 5;
    } t0sz_32 = { pa_range ... };

    p2m_ipa_bits = 32 - t0sz32.val;
}

-- 
Julien Grall

