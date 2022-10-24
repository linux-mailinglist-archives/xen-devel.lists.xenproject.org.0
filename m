Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CC60AAD5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429155.680023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxi6-0003So-3L; Mon, 24 Oct 2022 13:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429155.680023; Mon, 24 Oct 2022 13:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxi6-0003R1-0b; Mon, 24 Oct 2022 13:41:46 +0000
Received: by outflank-mailman (input) for mailman id 429155;
 Mon, 24 Oct 2022 13:41:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omxi4-0003Qv-FB
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:41:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omxi3-0003rD-Vn; Mon, 24 Oct 2022 13:41:43 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omxi3-00042Y-Of; Mon, 24 Oct 2022 13:41:43 +0000
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
	bh=q1mebNq4mBwcBiH8MbFQbAb1pm3sXjsk1AW26I9mJwk=; b=g/cm0xC5f0SWrNOKyYqfFPp8qv
	AYjaMgaVpmOS8IFZEYMioGYqeVCiwoIH4NN4upzRDuHI7npzRJgJRtIPLsdqxaeFZs6S3gli2hGUB
	n0iOg4+CS7Fa8GBWYM22T4RxHNsIpvYWvrAlx5e/jEr/VwQxn4FUnYTnkVwoz+qP1vGg=;
Message-ID: <e083c3c3-3978-4339-ab5b-030d32d05325@xen.org>
Date: Mon, 24 Oct 2022 14:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 03/12] Arm: GICv3: Enable vreg_reg64_* macros for
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-4-ayankuma@amd.com>
 <19fc76cf-cdf2-0321-8336-7c5a7fb09406@xen.org>
 <e952fcd7-bab6-68ed-d884-6505e529a073@amd.com>
 <b0b4fc69-3da3-3229-77d9-9fe0f4bf1ec3@xen.org>
 <a27873a3-3697-9a67-16aa-f4340dc622aa@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a27873a3-3697-9a67-16aa-f4340dc622aa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/10/2022 13:49, Ayan Kumar Halder wrote:
> 
> On 24/10/2022 12:01, Julien Grall wrote:
>>
>>
>> On 24/10/2022 11:47, Ayan Kumar Halder wrote:
>>>
>>> On 22/10/2022 11:13, Julien Grall wrote:
>>>> Hi Ayan,
>>>
>>> Hi Julien,
>>>
>>> I need some clarification.
>>>
>>>>
>>>> Title: The code you are modifying below is not GICv3 specific. I 
>>>> would suggest the following title:
>>>>
>>>> xen/arm: vreg: Support vreg_reg64_* helpers on Aarch32
>>>>
>>>> On 21/10/2022 16:31, Ayan Kumar Halder wrote:
>>>>> In some situations (eg GICR_TYPER), the hypervior may need to emulate
>>>>> 64bit registers in aarch32 mode. In such situations, the hypervisor 
>>>>> may
>>>>> need to read/modify the lower or upper 32 bits of the 64 bit register.
>>>>>
>>>>> In aarch32, 64 bit is represented by unsigned long long. Thus, we need
>>>>> to change the prototype accordingly.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>>> ---
>>>>>   xen/arch/arm/include/asm/vreg.h | 23 ++++++++---------------
>>>>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/vreg.h 
>>>>> b/xen/arch/arm/include/asm/vreg.h
>>>>> index f26a70d024..ac6e702c5c 100644
>>>>> --- a/xen/arch/arm/include/asm/vreg.h
>>>>> +++ b/xen/arch/arm/include/asm/vreg.h
>>>>> @@ -95,7 +95,7 @@ static inline bool vreg_emulate_sysreg(struct 
>>>>> cpu_user_regs *regs, union hsr hsr
>>>>>    * Note that the alignment fault will always be taken in the guest
>>>>>    * (see B3.12.7 DDI0406.b).
>>>>>    */
>>>>> -static inline register_t vreg_reg_extract(unsigned long reg,
>>>>> +static inline register_t vreg_reg_extract(unsigned long long reg,
>>>>>                                             unsigned int offset,
>>>>>                                             enum dabt_size size)
>>>>>   {
>>>>> @@ -105,7 +105,7 @@ static inline register_t 
>>>>> vreg_reg_extract(unsigned long reg,
>>>>>       return reg;
>>>>>   }
>>>>>   -static inline void vreg_reg_update(unsigned long *reg, 
>>>>> register_t val,
>>>>> +static inline void vreg_reg_update(unsigned long long *reg, 
>>>>> register_t val,
>>>>>                                      unsigned int offset,
>>>>>                                      enum dabt_size size)
>>>>>   {
>>>>> @@ -116,7 +116,7 @@ static inline void vreg_reg_update(unsigned 
>>>>> long *reg, register_t val,
>>>>>       *reg |= ((unsigned long)val & mask) << shift;
>>>>>   }
>>>>>   -static inline void vreg_reg_setbits(unsigned long *reg, 
>>>>> register_t bits,
>>>>> +static inline void vreg_reg_setbits(unsigned long long *reg, 
>>>>> register_t bits,
>>>>>                                       unsigned int offset,
>>>>>                                       enum dabt_size size)
>>>>>   {
>>>>> @@ -126,7 +126,7 @@ static inline void vreg_reg_setbits(unsigned 
>>>>> long *reg, register_t bits,
>>>>>       *reg |= ((unsigned long)bits & mask) << shift;
>>>>>   }
>>>>>   -static inline void vreg_reg_clearbits(unsigned long *reg, 
>>>>> register_t bits,
>>>>> +static inline void vreg_reg_clearbits(unsigned long long *reg, 
>>>>> register_t bits,
>>>>>                                         unsigned int offset,
>>>>>                                         enum dabt_size size)
>>>>>   {
>>>>> @@ -149,7 +149,7 @@ static inline void 
>>>>> vreg_reg##sz##_update(uint##sz##_t *reg,             \
>>>>>                                            register_t 
>>>>> val,                \
>>>>>                                            const mmio_info_t 
>>>>> *info)       \
>>>>> { \
>>>>> -    unsigned long tmp = 
>>>>> *reg;                                           \
>>>>> +    unsigned long long tmp = 
>>>>> *reg;                                      \
>>>>> \
>>>>>       vreg_reg_update(&tmp, val, info->gpa & 
>>>>> (offmask),                   \
>>>>> info->dabt.size);                                   \
>>>>> @@ -161,7 +161,7 @@ static inline void 
>>>>> vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>>>>>                                             register_t 
>>>>> bits,              \
>>>>>                                             const mmio_info_t 
>>>>> *info)      \
>>>>> { \
>>>>> -    unsigned long tmp = 
>>>>> *reg;                                           \
>>>>> +    unsigned long long tmp = 
>>>>> *reg;                                      \
>>>>> \
>>>>>       vreg_reg_setbits(&tmp, bits, info->gpa & 
>>>>> (offmask),                 \
>>>>> info->dabt.size);                                  \
>>>>> @@ -173,7 +173,7 @@ static inline void 
>>>>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>>>>                                               register_t 
>>>>> bits,            \
>>>>>                                               const mmio_info_t 
>>>>> *info)    \
>>>>> { \
>>>>> -    unsigned long tmp = 
>>>>> *reg;                                           \
>>>>> +    unsigned long long tmp = 
>>>>> *reg;                                      \
>>>>> \
>>>>>       vreg_reg_clearbits(&tmp, bits, info->gpa & 
>>>>> (offmask),               \
>>>>> info->dabt.size);                                \
>>>>> @@ -181,15 +181,8 @@ static inline void 
>>>>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>>>>       *reg = tmp; \
>>>>>   }
>>>>>   -/*
>>>>> - * 64 bits registers are only supported on platform with 64-bit long.
>>>>> - * This is also allow us to optimize the 32 bit case by using
>>>>> - * unsigned long rather than uint64_t
>>>>> - */
>>>>
>>>> The comment above explain why we never use uint64_t in the helpers 
>>>> above. IIRC, the compiler would end up to use 2 registers on AArch32 
>>>> even for the vreg_reg32_* helpers. I wanted to avoid that and would 
>>>> like like to today. Can you check the code generated?
>>>
>>> I am not sure I understood the comment very well.
>>>
>>> With this patch, the disassembly is as follows :-
>>>
>>>          vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
>>>    28124c:   e597000c    ldr r0, [r7, #12]
>>> VREG_REG_HELPERS(32, 0x3);
>>>    281250:   e5d52002    ldrb    r2, [r5, #2]
>>>    281254:   e1a02322    lsr r2, r2, #6
>>>      unsigned long mask = VREG_REG_MASK(size);
>>
>> Hmmm... Shouldn't this be "unsigned long long"?
> 
> The function looks like

Right. My question was why is this still a "unsigned long" with your 
patch? If the caller wanted to access the top 32-bit of a 64-bit value...

> 
> static inline void vreg_reg_update(unsigned long long *reg, register_t val,
>                                     unsigned int offset,
>                                     enum dabt_size size)
> {
>      unsigned long mask = VREG_REG_MASK(size);
>      int shift = offset * 8;
> 
>      *reg &= ~(mask << shift);


... we would have 'mask << 32' which is AFAIU "undefined" because 'mask' 
is 'unsigned long'. Same...


>      *reg |= ((unsigned long)val & mask) << shift;

... here. The operation would need to be done on 64-bit rather than 32-bit.

>>>
>>>>
>>>> For other options, I would consider to either:
>>>>   1) Fold vreg_reg_* in the macros.
>>>
>>> Can you explain this option a bit ?
>>
>> At the moment, we have generic helpers for vreg_reg_*. They are only 
>> called within the helper generated by VREG_REG_HELPERS().
>>
>> If we make those helpers size specific, then the only the 64-bit 
>> helpers would use uint64_t local variables.
>>
>> As they are only called in one place, we could fold them in the 
>> existing helpers.
> 
> Just to make sure, I understand this. The code would look like below
> 
> #define VREG_REG_HELPERS(type, offmask)                         \
> 
> static inline void vreg_reg_##type##_update(type *reg, register_t val, 
>         \
> 
>      const mmio_info_t *info)        \
> 
> {                                                  \
> 
> unsigned long mask = VREG_REG_MASK(size);                     \
> 
> unsigned int offset = info->gpa & (offmask);       \
> 
> int shift = offset * 8;                                            \
> 
> *reg &= ~(mask << shift);                                            \
> *reg |= ((unsigned long)val & mask) << shift;           \
> 
> }

This implementation is not correct for 64-bit register. It would need to 
look like (untested):

static inline void vreg_reg##sz##_update(uint##sz##_t *reg,
                                          register_t val,
                                          const mmio_info_t *info)
{
     uint##sz##_t tmp = *reg;
     uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);
     unsigned int offset = info->gap & (offsetmask);

     *reg &= ~(mask << shift);
     *reg |= ((uint##sz##_t)val & mask) << shift;
}

> 
> 
> #define vreg_reg_update(reg, val, info)     \
> 
> do {                        \
> 
>      if (sizeof(reg) == 4)                 \
> 
>            vreg_reg_uint32_t_update(reg, val, info);                \
> 
>      else if (sizeof(reg) == 8)               \
> 
>          vreg_reg_uint64_t_update(reg, val, info);              \
> 
>      else                           \
> 
>          BUG();                        \
> 
> } while(0);                           \

After your change above, nobody will call vreg_reg_update(). So no need 
to re-implement the function. You can simply drop it.

> 
> 
> Similar implementation will be for vreg_reg_clearbits(), 
> vreg_reg_setbits() and vreg_reg_extract()
> 
> 
> VREG_REG_HELPERS(uint32_t, 0x3);
> 
> VREG_REG_HELPERS(uint64_t, 0x7);
> 
> 
> And the functions would be invoked as follows :-
> 
> vreg_update(&priority, r, info);

The code should use vreg_reg<sz>_update() rather than the generic one. 
At least it will be clear from the caller which size is expected.

Cheers,

-- 
Julien Grall

