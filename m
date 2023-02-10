Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADBF6924F0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 18:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493498.763425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQXfP-0002yV-GU; Fri, 10 Feb 2023 17:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493498.763425; Fri, 10 Feb 2023 17:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQXfP-0002vU-DU; Fri, 10 Feb 2023 17:58:35 +0000
Received: by outflank-mailman (input) for mailman id 493498;
 Fri, 10 Feb 2023 17:58:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQXfN-0002vK-Ps
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 17:58:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQXfN-0005TP-AS; Fri, 10 Feb 2023 17:58:33 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQXfN-00069h-42; Fri, 10 Feb 2023 17:58:33 +0000
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
	bh=1Vy12ZjwbXyB0msoMPe47eFj66Jb1B1r+RbbesZQwc4=; b=B1yq6XnshVZLV9cDY2ouL8Jq9b
	E6bHzU1xtzttf01MEbIBfrMm7YnweFCowTjrJ8SsJf9949CPu37dIaoI6+Yr5ucXP146X/iSrvDXS
	TdThX+T05TeSvgBxo9lxtIhjxzu10hRQ3YCEbCrTGCnOkogJn05wK3FD1HhCnxbiH2rk=;
Message-ID: <6f6f30e1-d1a0-97f8-d230-dbbd18373e2c@xen.org>
Date: Fri, 10 Feb 2023 17:58:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-12-ayan.kumar.halder@amd.com>
 <ae501ac3-af2d-c4cb-3ea9-04dd946cdc51@xen.org>
 <eb4d4da7-0251-6efc-1311-6b236fdca6c4@amd.com>
 <3655dce9-f795-3d37-3236-d95d74c865ff@xen.org>
 <1e5d905c-0511-ed80-c899-e679d955775d@amd.com>
 <5eb92203-2d99-7dfc-4f01-d92b7a23c3e5@xen.org>
 <3b3c3846-5464-4914-3b28-f451f7e70c9a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b3c3846-5464-4914-3b28-f451f7e70c9a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/02/2023 17:51, Ayan Kumar Halder wrote:
> 
> On 10/02/2023 16:19, Julien Grall wrote:
>> Hi,
>> On 10/02/2023 15:39, Ayan Kumar Halder wrote:
>>>
>>> On 09/02/2023 11:45, Julien Grall wrote:
>>>> Hi,
>>> Hi Julien,
>>>>
>>>> On 07/02/2023 15:34, Ayan Kumar Halder wrote:
>>>>>
>>>>> On 20/01/2023 11:06, Julien Grall wrote:
>>>>>> Hi Ayan,
>>>>> Hi Julien,
>>>>>>
>>>>>> On 17/01/2023 17:43, Ayan Kumar Halder wrote:
>>>>>>> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
>>>>>>> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
>>>>>>> "Virtualization Translation Control Register" for the bit 
>>>>>>> descriptions.
>>>>>>>
>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>> ---
>>>>>>> Changes from -
>>>>>>>
>>>>>>> v1 - New patch.
>>>>>>>
>>>>>>>   xen/arch/arm/p2m.c | 10 +++++++---
>>>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>>>>> index 948f199d84..cfdea55e71 100644
>>>>>>> --- a/xen/arch/arm/p2m.c
>>>>>>> +++ b/xen/arch/arm/p2m.c
>>>>>>> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>>>>>>>       register_t val = 
>>>>>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>>>>>     #ifdef CONFIG_ARM_32
>>>>>>> -    if ( p2m_ipa_bits < 40 )
>>>>>>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>>>>>>           panic("P2M: Not able to support %u-bit IPA at the 
>>>>>>> moment\n",
>>>>>>>                 p2m_ipa_bits);
>>>>>>>   -    printk("P2M: 40-bit IPA\n");
>>>>>>> -    p2m_ipa_bits = 40;
>>>>>>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>>>>>>> +    p2m_ipa_bits = PADDR_BITS;
>>>>>>> +#ifdef CONFIG_ARM_PA_32
>>>>>>> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
>>>>>>> +#else
>>>>>>>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>>>>>> +#endif
>>>>>>
>>>>>> I am wondering whether this is right time to switch to an array 
>>>>>> like the arm64 code? This would allow to use 32-bit IPA also when 
>>>>>> Xen support 64-bit physical address.
>>>>>
>>>>> In AArch64, we use ID_AA64MMFR0_EL1.PARange to determine the 
>>>>> physical address range supported at runtime. This is then used as 
>>>>> an index into pa_range_info[] to determine t0sz, root_order, etc.
>>>>
>>>> It is using both the ID_AA64MMFR0_EL1 but also p2m_ipa_bits to 
>>>> decide the size.
>>> Ack.
>>>>
>>>>>
>>>>> However, for AArch32 I do not see an equivalent register (similar 
>>>>> to ID_AA64MMFR0_EL1) or any register to determine the physical 
>>>>> address range. Thus, I will prefer to keep the code as it is unless 
>>>>> you suggest any alternative.
>>>>
>>>> I looked at the Arm Arm and indeed it doesn't look like there are 
>>>> equivalent for ID_AA64MMFR0_EL1.PARange.
>>>>
>>>> However, my point was less about reading the system register but 
>>>> more about the fact we could have the code a bit more generic and 
>>>> avoid the assumption that PADDR_BITS is only modified when 
>>>> CONFIG_ARM_PA_32 is set.
>>>
>>> I had a rework at the patch. Please let me know if the following 
>>> looks better.
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 948f199d84..bc3bdf5f3e 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -2266,14 +2266,35 @@ void __init setup_virt_paging(void)
>>>       register_t val = 
>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>
>>>   #ifdef CONFIG_ARM_32
>>> -    if ( p2m_ipa_bits < 40 )
>>> +    static const struct {
>>> +        unsigned int pabits; /* Physical Address Size */
>>> +        unsigned int t0sz;   /* Desired T0SZ */
>>> +        unsigned int sl0;    /* Desired SL0 */
>>
>> Hmmm... Why don't you include the root order? In fact...
>>
>>> +    } pa_range_info[] __initconst = {
>>> +        [0] = { 32,     32,     1 },
>>> +        [1] = { 40,     24,     1 },
>>
>> ... looking at the ARMv7 specification (see B3-1345 in ARM DDI 
>> 0406C.d), the root page-table is only concatenated for 40-bits.
> Sorry, I could not follow how you inferred this. Can you paste the 
> relevant snippet ?

Use of concatenated second-level translation tables
A stage 2 translation with an input address range of 31-34 bits can 
start the translation either:
• With a first-level lookup, accessing a first-level translation table 
with 2-16 entries.
• With a second-level lookup, accessing a set of concatenated 
second-level translation tables.

>>
>>> +    };
>>> +    int i = 0;
>>> +
>>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>> +        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>> +              p2m_ipa_bits);
>>
>> This check seems unnecessary now.
> 
> We still need this check as arm_smmu_device_cfg_probe() invokes 
> p2m_restrict_ipa_bits(size).
> 
> And referARM IHI 0062D.cID070116 (SMMU arch version 2.0 Specification), 
> the IPA address size can be
> 
> 0.
> 
>     0b0000 32-bit.
> 
> 1.
> 
>     0b0001 36-bit.
> 
> 10.
> 
>     0b0010 40-bit.
> 
> 11.
> 
>     0b0011 42-bit.
> 
> 100.
> 
>     0b0100 44-bit.
> 
> 101.
> 
>     0b0101 48-bit.
> 
> So if p2m_ipa_bits = 36 bits and PADDR_BITS = 40, then we want to panic.

We can have the same situation on Arm64 (PADDR_BITS = 48), yet we don't 
panic(). So I don't quite understand why we would need to differ...

Or are you saying that for 64-bit we also need such check? If so, then I 
am still not sure why because p2m_ipa_bits represent the guest physical 
address space and PADDR_BITS the Xen physical address space. It is valid 
to have both of them differing.

Cheers,

-- 
Julien Grall

