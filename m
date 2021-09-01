Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830133FD6FB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 11:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176234.320696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMhe-0002KH-2w; Wed, 01 Sep 2021 09:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176234.320696; Wed, 01 Sep 2021 09:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMhd-0002IU-WB; Wed, 01 Sep 2021 09:38:41 +0000
Received: by outflank-mailman (input) for mailman id 176234;
 Wed, 01 Sep 2021 09:38:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/yp=NX=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mLMhc-0002IO-OD
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 09:38:40 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 62c9ef60-0b08-11ec-adbf-12813bfff9fa;
 Wed, 01 Sep 2021 09:38:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A07B1FB;
 Wed,  1 Sep 2021 02:38:38 -0700 (PDT)
Received: from [10.57.13.24] (unknown [10.57.13.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E67D3F766;
 Wed,  1 Sep 2021 02:38:36 -0700 (PDT)
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
X-Inumbo-ID: 62c9ef60-0b08-11ec-adbf-12813bfff9fa
Subject: Re: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Ash Wilding <ash.j.wilding@gmail.com>, Ian Jackson <iwj@xenproject.org>
References: <20210729104258.6320-1-michal.orzel@arm.com>
 <4a5ac822-3078-de0e-8f84-6881d47ad3eb@xen.org>
 <dd9859ec-a3a9-6a74-bdae-fde092f26ac0@arm.com>
 <e8bdb065-9b46-e0d8-1fcf-7bba38e02f9e@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <8974fc82-94c1-ef85-153c-0923f5faf331@arm.com>
Date: Wed, 1 Sep 2021 11:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8bdb065-9b46-e0d8-1fcf-7bba38e02f9e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 06.08.2021 13:12, Julien Grall wrote:
> 
> 
> On 29/07/2021 12:47, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 29.07.2021 13:20, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 29/07/2021 11:42, Michal Orzel wrote:
>>>> According to ARMv8A architecture, AArch64 registers
>>>> are 64bit wide even though in many cases the upper
>>>> 32bit is reserved. Therefore there is no need for
>>>> function vreg_emulate_sysreg32 on arm64. This means
>>>> that we can have just one function vreg_emulate_sysreg
>>>> using new function pointer:
>>>> typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>>>>                                 register_t *r, bool read);
>>>>
>>>> Modify vreg_emulate_cp32 to use the new function pointer
>>>> as well.
>>>>
>>>> This change allows to properly use 64bit registers in AArch64
>>>> state and in case of AArch32 the upper 32 bits of AArch64
>>>> registers are inaccessible and are ignored(D1.20.1 ARM DDI 0487A.j).
>>>
>>> What you wrote only says that the bits are ignored. It doesn't say whether the bits will be 0.
>>>
>>> They are probably, but as I wrote yesterday, I couldn't confirm it.
>>>
>> Should I then remove this part of the commit or write below?:
>> "We can assume that those bits will be 0 but the architecture
>> reference manual does not clarify this."
> 
> There was some back and forth on security@xen.org about this. I will summarizing the discussion here as we considered this was a just a bug.
> 
> I wasn't looking at the correct section in the Arm Arm. There is a paragraph clearly describing the expected behavior in a different section (thanks Ash for the pointer!). Per section D1.19.2 in DDI 0487F.c:
> 
> "
> If the general-purpose register was accessible from AArch32 state
> 
> The upper 32 bits either become zero, or hold the value that the same architectural register held before any AArch32 execution. The choice between these two options is IMPLEMENTATION DEFINED, and might vary dynamically within an implementation. Correspondingly, software must
> regard the value as being a CONSTRAINED UNPREDICTABLE choice between these two values.
> 
> This behavior applies regardless of whether any execution occurred at the Exception level that was using AArch32. That is, this behavior applies even if AArch32 state was entered by an exception
> return from AArch64 state, and another exception was immediately taken to AArch64 state without any instruction execution in AArch32 state.
> "
> 
> So we can't assume the top 32-bits are zeroed unless the hypervisor ensured they were. Today, we don't have that guarantee in Xen.
> 
> This needs to be fixed. The two approachs we discussed are:
>    1) Update set_user_reg() to zero the top 32-bit. We have a couple of places using directly the fields xN. So we would need to switch them to use set_user_reg()
>    2) Only saving/restoring the bottom 32-bit when entering/leaving the hypervisor.
> 
> At the moment, my preference goes towards the latter because we don't risk to introduce new place where set_user_reg() is not used.
> 
> I have quickly hack the entry path. This would look like:
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index fc3811ad0ad5..65e24c88b059 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -111,6 +111,11 @@
>   */
>          .macro  entry, hyp, compat, save_x0_x1=1
>          sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
> +        .if \compat == 1 /* AArch32 mode */
> +        /* Clobber the top 32-bit of the registers */
> +        mov    w0, w0
> +        mov    w1, w1
> +        .endif
>          push    x28, x29
>          push    x26, x27
>          push    x24, x25
> 
> I haven't looked whether this can be optimized or the exit path would be easier to modify.
> 
> Anyway, this is not a new bug so I would be fine to get this patch merged first. Although, I think this wants to be fixed for xen 4.16 (CCing Ian to track it).
> 
> I will try to find sometimes in the next couple of weeks to fix it and have another review of this patch.
> 

As the 4.16 release is getting closer I wanted to ask whether you need help with creating a pre-work patch so that this patch can be merged.
I believe this patch wants to be merged for 4.16 as the other sysreg related patches are merged already, so I'm offering a help.

> Cheers,
> 

Cheers,
Michal

