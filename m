Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41256609FA3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428874.679461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvD6-0000AI-Gx; Mon, 24 Oct 2022 11:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428874.679461; Mon, 24 Oct 2022 11:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvD6-00007P-E3; Mon, 24 Oct 2022 11:01:36 +0000
Received: by outflank-mailman (input) for mailman id 428874;
 Mon, 24 Oct 2022 11:01:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omvD5-00007B-7R
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:01:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omvD4-0000zo-Sm; Mon, 24 Oct 2022 11:01:34 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omvD4-0004pu-J4; Mon, 24 Oct 2022 11:01:34 +0000
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
	bh=jxL8AFKp1d+GfBCRPkhTF7jPFaeitZf7g4NkuDQovuI=; b=dCO1sQVl8YAig9UPrb2TSamy9y
	NpVbDuQNd7M3r70XOejNrjnEk5axEkD/+T6fod8OsjD6xclTXc9r9e/kZZrNppjQlhme3hrivwtiy
	Gzl7RDwFb1hG8EChYrLv20ZzWl3ZANd+iIIVSBBD4hGreI9qVYLecmqiIzArmz7ixook=;
Message-ID: <b0b4fc69-3da3-3229-77d9-9fe0f4bf1ec3@xen.org>
Date: Mon, 24 Oct 2022 12:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <e952fcd7-bab6-68ed-d884-6505e529a073@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/10/2022 11:47, Ayan Kumar Halder wrote:
> 
> On 22/10/2022 11:13, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,
> 
> I need some clarification.
> 
>>
>> Title: The code you are modifying below is not GICv3 specific. I would 
>> suggest the following title:
>>
>> xen/arm: vreg: Support vreg_reg64_* helpers on Aarch32
>>
>> On 21/10/2022 16:31, Ayan Kumar Halder wrote:
>>> In some situations (eg GICR_TYPER), the hypervior may need to emulate
>>> 64bit registers in aarch32 mode. In such situations, the hypervisor may
>>> need to read/modify the lower or upper 32 bits of the 64 bit register.
>>>
>>> In aarch32, 64 bit is represented by unsigned long long. Thus, we need
>>> to change the prototype accordingly.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>   xen/arch/arm/include/asm/vreg.h | 23 ++++++++---------------
>>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/vreg.h 
>>> b/xen/arch/arm/include/asm/vreg.h
>>> index f26a70d024..ac6e702c5c 100644
>>> --- a/xen/arch/arm/include/asm/vreg.h
>>> +++ b/xen/arch/arm/include/asm/vreg.h
>>> @@ -95,7 +95,7 @@ static inline bool vreg_emulate_sysreg(struct 
>>> cpu_user_regs *regs, union hsr hsr
>>>    * Note that the alignment fault will always be taken in the guest
>>>    * (see B3.12.7 DDI0406.b).
>>>    */
>>> -static inline register_t vreg_reg_extract(unsigned long reg,
>>> +static inline register_t vreg_reg_extract(unsigned long long reg,
>>>                                             unsigned int offset,
>>>                                             enum dabt_size size)
>>>   {
>>> @@ -105,7 +105,7 @@ static inline register_t 
>>> vreg_reg_extract(unsigned long reg,
>>>       return reg;
>>>   }
>>>   -static inline void vreg_reg_update(unsigned long *reg, register_t 
>>> val,
>>> +static inline void vreg_reg_update(unsigned long long *reg, 
>>> register_t val,
>>>                                      unsigned int offset,
>>>                                      enum dabt_size size)
>>>   {
>>> @@ -116,7 +116,7 @@ static inline void vreg_reg_update(unsigned long 
>>> *reg, register_t val,
>>>       *reg |= ((unsigned long)val & mask) << shift;
>>>   }
>>>   -static inline void vreg_reg_setbits(unsigned long *reg, register_t 
>>> bits,
>>> +static inline void vreg_reg_setbits(unsigned long long *reg, 
>>> register_t bits,
>>>                                       unsigned int offset,
>>>                                       enum dabt_size size)
>>>   {
>>> @@ -126,7 +126,7 @@ static inline void vreg_reg_setbits(unsigned long 
>>> *reg, register_t bits,
>>>       *reg |= ((unsigned long)bits & mask) << shift;
>>>   }
>>>   -static inline void vreg_reg_clearbits(unsigned long *reg, 
>>> register_t bits,
>>> +static inline void vreg_reg_clearbits(unsigned long long *reg, 
>>> register_t bits,
>>>                                         unsigned int offset,
>>>                                         enum dabt_size size)
>>>   {
>>> @@ -149,7 +149,7 @@ static inline void 
>>> vreg_reg##sz##_update(uint##sz##_t *reg,             \
>>>                                            register_t 
>>> val,                \
>>>                                            const mmio_info_t 
>>> *info)       \
>>> { \
>>> -    unsigned long tmp = 
>>> *reg;                                           \
>>> +    unsigned long long tmp = 
>>> *reg;                                      \
>>> \
>>>       vreg_reg_update(&tmp, val, info->gpa & 
>>> (offmask),                   \
>>> info->dabt.size);                                   \
>>> @@ -161,7 +161,7 @@ static inline void 
>>> vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>>>                                             register_t 
>>> bits,              \
>>>                                             const mmio_info_t 
>>> *info)      \
>>> { \
>>> -    unsigned long tmp = 
>>> *reg;                                           \
>>> +    unsigned long long tmp = 
>>> *reg;                                      \
>>> \
>>>       vreg_reg_setbits(&tmp, bits, info->gpa & 
>>> (offmask),                 \
>>> info->dabt.size);                                  \
>>> @@ -173,7 +173,7 @@ static inline void 
>>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>>                                               register_t 
>>> bits,            \
>>>                                               const mmio_info_t 
>>> *info)    \
>>> { \
>>> -    unsigned long tmp = 
>>> *reg;                                           \
>>> +    unsigned long long tmp = 
>>> *reg;                                      \
>>> \
>>>       vreg_reg_clearbits(&tmp, bits, info->gpa & 
>>> (offmask),               \
>>> info->dabt.size);                                \
>>> @@ -181,15 +181,8 @@ static inline void 
>>> vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>>>       *reg = 
>>> tmp;                                                         \
>>>   }
>>>   -/*
>>> - * 64 bits registers are only supported on platform with 64-bit long.
>>> - * This is also allow us to optimize the 32 bit case by using
>>> - * unsigned long rather than uint64_t
>>> - */
>>
>> The comment above explain why we never use uint64_t in the helpers 
>> above. IIRC, the compiler would end up to use 2 registers on AArch32 
>> even for the vreg_reg32_* helpers. I wanted to avoid that and would 
>> like like to today. Can you check the code generated?
> 
> I am not sure I understood the comment very well.
> 
> With this patch, the disassembly is as follows :-
> 
>          vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
>    28124c:   e597000c    ldr r0, [r7, #12]
> VREG_REG_HELPERS(32, 0x3);
>    281250:   e5d52002    ldrb    r2, [r5, #2]
>    281254:   e1a02322    lsr r2, r2, #6
>      unsigned long mask = VREG_REG_MASK(size);

Hmmm... Shouldn't this be "unsigned long long"?

>    281258:   e3a03008    mov r3, #8
>    28125c:   e1a03213    lsl r3, r3, r2
>    281260:   e2633020    rsb r3, r3, #32
>    281264:   e3e02000    mvn r2, #0
>    281268:   e1a02332    lsr r2, r2, r3
> VREG_REG_HELPERS(32, 0x3);
>    28126c:   e5953010    ldr r3, [r5, #16]
>    281270:   e2033003    and r3, r3, #3
>      int shift = offset * 8;
>    281274:   e1a03183    lsl r3, r3, #3
> VREG_REG_HELPERS(32, 0x3);
>    281278:   e59013f0    ldr r1, [r0, #1008] ; 0x3f0
>    28127c:   e1c11312    bic r1, r1, r2, lsl r3
>      *reg |= ((unsigned long)val & mask) << shift;
>    281280:   e0022009    and r2, r2, r9
> VREG_REG_HELPERS(32, 0x3);
>    281284:   e1813312    orr r3, r1, r2, lsl r3
>    281288:   e58033f0    str r3, [r0, #1008] ; 0x3f0
>          v->domain->arch.vgic.ctlr &= GICD_CTL_ENABLE;
>    28128c:   e597200c    ldr r2, [r7, #12]
>    281290:   e59233f0    ldr r3, [r2, #1008] ; 0x3f0
>    281294:   e2033001    and r3, r3, #1
>    281298:   e58233f0    str r3, [r2, #1008] ; 0x3f0
> 
> Without the patch (ie original code) , the disassembly is :-
> 
>          vreg_reg32_update(&v->domain->arch.vgic.ctlr, r, info);
>    27f8f4:   e597000c    ldr r0, [r7, #12]
> VREG_REG_HELPERS(32, 0x3);
>    27f8f8:   e5d52002    ldrb    r2, [r5, #2]
>    27f8fc:   e1a02322    lsr r2, r2, #6
>      unsigned long mask = VREG_REG_MASK(size);
>    27f900:   e3a03008    mov r3, #8
>    27f904:   e1a03213    lsl r3, r3, r2
>    27f908:   e2633020    rsb r3, r3, #32
>    27f90c:   e3e02000    mvn r2, #0
>    27f910:   e1a02332    lsr r2, r2, r3
> VREG_REG_HELPERS(32, 0x3);
>    27f914:   e5953010    ldr r3, [r5, #16]
>    27f918:   e2033003    and r3, r3, #3
>      int shift = offset * 8;
>    27f91c:   e1a03183    lsl r3, r3, #3
>      *reg &= ~(mask << shift);
>    27f920:   e5901400    ldr r1, [r0, #1024] ; 0x400
>    27f924:   e1c11312    bic r1, r1, r2, lsl r3
>      *reg |= ((unsigned long)val & mask) << shift;
>    27f928:   e0022009    and r2, r2, r9
>    27f92c:   e1813312    orr r3, r1, r2, lsl r3
> VREG_REG_HELPERS(32, 0x3);
>    27f930:   e5803400    str r3, [r0, #1024] ; 0x400
>          v->domain->arch.vgic.ctlr &= GICD_CTL_ENABLE;
>    27f934:   e597200c    ldr r2, [r7, #12]
>    27f938:   e5923400    ldr r3, [r2, #1024] ; 0x400
>    27f93c:   e2033001    and r3, r3, #1
>    27f940:   e5823400    str r3, [r2, #1024] ; 0x400
> 
> Sorry, I can't spot the difference. :(

If there is no difference, then it is a good sign. I was worried that 
the compiler would end up to use "strd/ldrd" which would result to more 
register allocations and therefore inefficient code.

But see above.

> 
> I had a look at commit 423e9ecdc26c4b40c8db1fcc63b3655463c29976 which 
> introduced this. But I could not make out the reason from the commit 
> message.

The reasoning would be to show that the assembly is either the same or 
no worse that then existing one with a few compilers.

> 
>>
>> For other options, I would consider to either:
>>   1) Fold vreg_reg_* in the macros.
> 
> Can you explain this option a bit ?

At the moment, we have generic helpers for vreg_reg_*. They are only 
called within the helper generated by VREG_REG_HELPERS().

If we make those helpers size specific, then the only the 64-bit helpers 
would use uint64_t local variables.

As they are only called in one place, we could fold them in the existing 
helpers.

Cheers,

-- 
Julien Grall

