Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694A9AE028
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 11:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825042.1239239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3trL-00048f-BT; Thu, 24 Oct 2024 09:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825042.1239239; Thu, 24 Oct 2024 09:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3trL-00046P-8s; Thu, 24 Oct 2024 09:10:23 +0000
Received: by outflank-mailman (input) for mailman id 825042;
 Thu, 24 Oct 2024 09:10:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t3trJ-00046J-Jg
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 09:10:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t3trJ-001hAR-1D;
 Thu, 24 Oct 2024 09:10:21 +0000
Received: from [15.248.2.239] (helo=[10.24.67.19])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t3trJ-0001Ao-2n; Thu, 24 Oct 2024 09:10:21 +0000
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
	bh=PaUXcKI62J1/qUAooyCOnoJyMbWTPZj8jOHGWBTJAVo=; b=PzcmMBGL3b4lJz0fml3tBLtsIW
	/FcipPPAZu+U/+zL9Z55eyLe+pfJtqCNoEqhWbxu+wxsIDVXXP8CJRaHCfQ8VnaFcrrq8qB6/Oq6d
	tOxjBmH/CywWc8nFLUMgCBq9mJnGfKTad6DOqz0QQn56HvK9PhmlAY4MoQJGLSj6hwhU=;
Message-ID: <1e7fd245-2e67-4ff8-b75a-bb3845213101@xen.org>
Date: Thu, 24 Oct 2024 10:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
 <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
 <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
 <8991e9da-5abd-4fd7-919b-fbe87d747838@amd.com>
 <251fb5a2-a8d7-451b-9714-5cc984645354@xen.org>
 <acd45c52-7675-4dee-b8f8-46429cadf9ac@xen.org>
 <d70dae8e-5197-48db-859b-a3cae67e4ca7@xen.org>
 <6dad812c-b1dc-49e4-aa08-aac5647ca37d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6dad812c-b1dc-49e4-aa08-aac5647ca37d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/10/2024 09:02, Ayan Kumar Halder wrote:
> On 23/10/2024 17:30, Julien Grall wrote:
>>
>>
>> On 23/10/2024 17:18, Julien Grall wrote:
>>>
>>>
>>> On 23/10/2024 17:13, Julien Grall wrote:
>>>>
>>>>
>>>> On 23/10/2024 17:06, Ayan Kumar Halder wrote:
>>>>> Hi Luca/Julien,
>>>>>
>>>>> On 22/10/2024 17:31, Luca Fancellu wrote:
>>>>>> Hi Julien,
>>>>>>
>>>>>>> On 22 Oct 2024, at 14:13, Julien Grall <julien@xen.org> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 22/10/2024 10:56, Luca Fancellu wrote:
>>>>>>>>> On 22 Oct 2024, at 10:47, Julien Grall <julien@xen.org> wrote:
>>>>>>>>>
>>>>>>>>> Hi Luca,
>>>>>>>>>
>>>>>>>>> On 22/10/2024 10:41, Luca Fancellu wrote:
>>>>>>>>>>> On 21 Oct 2024, at 17:27, Julien Grall <julien@xen.org> wrote:
>>>>>>>>>> 2) dsb+isb barrier after enabling the MPU, since we are 
>>>>>>>>>> enabling the MPU but also because we are disabling the 
>>>>>>>>>> background region
>>>>>>>>> TBH, I don't understand this one. Why would disabling the 
>>>>>>>>> background region requires a dsb + isb? Do you have any pointer 
>>>>>>>>> in the Armv8-R specification?
>>>>>>>> I’m afraid this is only my deduction, Section C1.4 of the Arm® 
>>>>>>>> Architecture Reference Manual Supplement Armv8, for R-profile 
>>>>>>>> AArch64 architecture,
>>>>>>>> (DDI 0600B.a) explains what is the background region, it says it 
>>>>>>>> implements physical address range(s), so when we disable it, we 
>>>>>>>> would like any data
>>>>>>>> access to complete before changing this implementation defined 
>>>>>>>> range with the ranges defined by us tweaking PRBAR/PRLAR, am I 
>>>>>>>> right?
>>>>>>> My mental model for the ordering is similar to a TLB flush which is:
>>>>>>>    1/ dsb nsh
>>>>>>>    2/ tlbi
>>>>>>>    3/ dsb nsh
>>>>>>>    4/ isb
>>>>>>>
>>>>>>> Enabling the MPU is effectively 2. AFAIK, 1 is only necessary to 
>>>>>>> ensure the update to the page-tables. But it is not a requirement 
>>>>>>> to ensure any data access are completed (otherwise, we would have 
>>>>>>> needed a dsb sy because we don't know how far the access are 
>>>>>>> going...).
>>>>>> Uhm… I’m not sure we are on the same page, probably I explained 
>>>>>> that wrongly, so my point is that:
>>>>>>
>>>>>> FUNC_LOCAL(enable_mpu)
>>>>>>      mrs   x0, SCTLR_EL2
>>>>>>      bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background 
>>>>>> region */
>>>>>>      orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>>>>>      orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>>>>>      orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>>>>>      dsb   sy
>>>>>>      ^— This data barrier is needed in order to complete any data 
>>>>>> access, which guarantees that all explicit memory accesses before
>>>>>>             this instruction complete, so we can safely turn ON 
>>>>>> the MPU and disable the background region.
>>>>
>>>> I think
>>>
>>> Sorry I fat fingered and pressed send too early. I think this is the 
>>> part I disagree with. All explicit accesses don't need to be complete 
>>> (in the sense observed by everyone in the system). They only need to 
>>> have gone through the permissions check.
>>
>> I think I managed to find again the wording that would justify why a 
>> "dsb" is not necessary for the permission checks. From ARM DDI 0487K.a 
>> D23-7349:
>>
>> ```
>> Direct writes using the instructions in Table D22-2 require 
>> synchronization before software can rely on the effects
>> of changes to the System registers to affect instructions appearing in 
>> program order after the direct write to the
>> System register. Direct writes to these registers are not allowed to 
>> affect any instructions appearing in program order
>> before the direct write.
>> ```
>>
>> I understand the paragraph as enabling the MPU via SCTLR_EL2 will not 
>> affect any instruction before hand.
> 
> Yes, I agree.
> 
> However, as the line states
> 
> "Direct writes using the instructions in Table D22-2 require 
> synchronization before software can rely on the effects"
> 
> This means synchronization is required after the write to SCTLR_EL2.
> 
> However, this synchronization seems to imply dsb sy + isb.
> 
> FromARM DDI 0487K.a ID032224 B2-274
> 
> "A DSB instruction ordered after a direct write to a System PMU register 
> does not complete until all observers observe the direct write"
> 
> So, a write to SCTLR_EL2 needs to be followed by a dsb to ensure the 
> write is observed on all the processors (as SCTLR_EL2 and PMU registers 
> belong to Table D22-2, so the behavior should be same).

Aside what Luca already said, I don't understand why the write to 
SCTLR_EL2 needs to be seen by all the processors (which BTW would imply 
"ish" rather than "sy"). The MPU and SCTLR are per-processor.

> 
> And then it needs to be followed by an ISB to ensure any instruction 
> fetch observes that MPU is enabled.
> 
> So the code needs to be
> 
> FUNC_LOCAL(enable_mpu)
>      mrs   x0, SCTLR_EL2
>      bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>      orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>      orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>      orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>      msr   SCTLR_EL2, x0
>      dsb   sy                  /* ensure the writes to SCTLR_EL2 are 
> observed on all the processors */
>      isb                               /* any instruction fetch observes 
> that MPU is enabled. So force flush the pre-existing instruction 
> pipeline */
> 
>      ret
> END(enable_mpu)
> 
> This will be similar to what Zephyr  does https://github.com/ 
> zephyrproject-rtos/zephyr/blob/a30270668d4b90bac932794ef75df12a2b6f6f78/ 
> arch/arm/core/mpu/arm_mpu.c#L258 .

I guess you mean 
https://github.com/zephyrproject-rtos/zephyr/blob/a30270668d4b90bac932794ef75df12a2b6f6f78/arch/arm/core/mpu/arm_mpu.c#L223? 
But the reasoning there is seem quite different. AFAIU The "dsb" is to 
ensure that the changes to the MPU registers are visible. That said, I 
am not convinced that the "dsb" belongs after. Even if "SCTLR_EL2" may 
not be fully synchronized until the next "isb", it may happen before and 
therefore you want the MPU registers to be visible before SCTLR_EL2 is 
visible.

> Let me know if you are ok with the rationale.

See above.

 > > Also, I would prefer to have 3 orr instructions instead of one for the
> sake of readability. However, this is not a strong preference so if you 
> feel otherwise, I can change to have a single orr instruction.

I am ok with that.

Cheers,

-- 
Julien Grall


