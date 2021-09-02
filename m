Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3B33FEE0D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 14:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177291.322638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLmAV-0006A3-IU; Thu, 02 Sep 2021 12:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177291.322638; Thu, 02 Sep 2021 12:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLmAV-00068E-Dy; Thu, 02 Sep 2021 12:50:11 +0000
Received: by outflank-mailman (input) for mailman id 177291;
 Thu, 02 Sep 2021 12:50:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLmAU-000688-5z
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 12:50:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLmAR-0004ce-Iz; Thu, 02 Sep 2021 12:50:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLmAR-0008LL-CW; Thu, 02 Sep 2021 12:50:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Y/sEGRohL9Kj4xLlhQ4GFVhQuLZvKB8nlgyOX3/T2lc=; b=u7CkeW8IlR6UJuC+kaZwH+r2Co
	OXvkYJ0mzeo/66XfzGgSioiS6duz2zqntjjfXGAHoqukVrImoRyiV8v973rrVHbzUx8kr7hhjTKAH
	+DfQl0F7TRTTKHe8bKiNLMUBfdheo5KsCg8DKJC8VZrBGh82T7rq49qJcvPG2D4yGi/4=;
Subject: Re: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Ash Wilding <ash.j.wilding@gmail.com>, Ian Jackson <iwj@xenproject.org>
References: <20210729104258.6320-1-michal.orzel@arm.com>
 <4a5ac822-3078-de0e-8f84-6881d47ad3eb@xen.org>
 <dd9859ec-a3a9-6a74-bdae-fde092f26ac0@arm.com>
 <e8bdb065-9b46-e0d8-1fcf-7bba38e02f9e@xen.org>
 <8974fc82-94c1-ef85-153c-0923f5faf331@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f41e36bb-efb5-fc11-f87e-6906336bca45@xen.org>
Date: Thu, 2 Sep 2021 13:50:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8974fc82-94c1-ef85-153c-0923f5faf331@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 01/09/2021 10:38, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 06.08.2021 13:12, Julien Grall wrote:
>>
>>
>> On 29/07/2021 12:47, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>> On 29.07.2021 13:20, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 29/07/2021 11:42, Michal Orzel wrote:
>>>>> According to ARMv8A architecture, AArch64 registers
>>>>> are 64bit wide even though in many cases the upper
>>>>> 32bit is reserved. Therefore there is no need for
>>>>> function vreg_emulate_sysreg32 on arm64. This means
>>>>> that we can have just one function vreg_emulate_sysreg
>>>>> using new function pointer:
>>>>> typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>>>>>                                  register_t *r, bool read);
>>>>>
>>>>> Modify vreg_emulate_cp32 to use the new function pointer
>>>>> as well.
>>>>>
>>>>> This change allows to properly use 64bit registers in AArch64
>>>>> state and in case of AArch32 the upper 32 bits of AArch64
>>>>> registers are inaccessible and are ignored(D1.20.1 ARM DDI 0487A.j).
>>>>
>>>> What you wrote only says that the bits are ignored. It doesn't say whether the bits will be 0.
>>>>
>>>> They are probably, but as I wrote yesterday, I couldn't confirm it.
>>>>
>>> Should I then remove this part of the commit or write below?:
>>> "We can assume that those bits will be 0 but the architecture
>>> reference manual does not clarify this."
>>
>> There was some back and forth on security@xen.org about this. I will summarizing the discussion here as we considered this was a just a bug.
>>
>> I wasn't looking at the correct section in the Arm Arm. There is a paragraph clearly describing the expected behavior in a different section (thanks Ash for the pointer!). Per section D1.19.2 in DDI 0487F.c:
>>
>> "
>> If the general-purpose register was accessible from AArch32 state
>>
>> The upper 32 bits either become zero, or hold the value that the same architectural register held before any AArch32 execution. The choice between these two options is IMPLEMENTATION DEFINED, and might vary dynamically within an implementation. Correspondingly, software must
>> regard the value as being a CONSTRAINED UNPREDICTABLE choice between these two values.
>>
>> This behavior applies regardless of whether any execution occurred at the Exception level that was using AArch32. That is, this behavior applies even if AArch32 state was entered by an exception
>> return from AArch64 state, and another exception was immediately taken to AArch64 state without any instruction execution in AArch32 state.
>> "
>>
>> So we can't assume the top 32-bits are zeroed unless the hypervisor ensured they were. Today, we don't have that guarantee in Xen.
>>
>> This needs to be fixed. The two approachs we discussed are:
>>     1) Update set_user_reg() to zero the top 32-bit. We have a couple of places using directly the fields xN. So we would need to switch them to use set_user_reg()
>>     2) Only saving/restoring the bottom 32-bit when entering/leaving the hypervisor.
>>
>> At the moment, my preference goes towards the latter because we don't risk to introduce new place where set_user_reg() is not used.
>>
>> I have quickly hack the entry path. This would look like:
>>
>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>> index fc3811ad0ad5..65e24c88b059 100644
>> --- a/xen/arch/arm/arm64/entry.S
>> +++ b/xen/arch/arm/arm64/entry.S
>> @@ -111,6 +111,11 @@
>>    */
>>           .macro  entry, hyp, compat, save_x0_x1=1
>>           sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
>> +        .if \compat == 1 /* AArch32 mode */
>> +        /* Clobber the top 32-bit of the registers */
>> +        mov    w0, w0
>> +        mov    w1, w1
>> +        .endif
>>           push    x28, x29
>>           push    x26, x27
>>           push    x24, x25
>>
>> I haven't looked whether this can be optimized or the exit path would be easier to modify.
>>
>> Anyway, this is not a new bug so I would be fine to get this patch merged first. Although, I think this wants to be fixed for xen 4.16 (CCing Ian to track it).
>>
>> I will try to find sometimes in the next couple of weeks to fix it and have another review of this patch.
>>
> 
> As the 4.16 release is getting closer I wanted to ask whether you need help with creating a pre-work patch so that this patch can be merged.

Sorry I haven't looked at the bug yet. I don't think the bug I reported 
necessarily needs to go first. This is not a new bug and AFAICT your 
patch is not going to make it worse than the current state.

Your patch needs to have an updated commit message summarizing what we 
discussed and a second review. No need to resend a patch for the updated 
commit message, this can be discussed here and updated on commit (I 
assuming there is no other comments).

> I believe this patch wants to be merged for 4.16 as the other sysreg related patches are merged already, so I'm offering a help.

If you have spare time that would be great. There are a few bits I 
wanted to look other than the entry place:
   - The DOMCTL that update the context: I believe we may need to zero 
to top bits
   - hypercall continuation (see hypercall_create_continuation)
   - multicall

For 4.16, the entry (or exit) is probably going to be a good step. We 
can look at the rest for 4.17.

Cheers,

-- 
Julien Grall

