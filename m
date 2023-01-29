Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0267FD66
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jan 2023 08:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486264.753692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM2Fn-0007Wm-Mk; Sun, 29 Jan 2023 07:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486264.753692; Sun, 29 Jan 2023 07:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM2Fn-0007UX-Jz; Sun, 29 Jan 2023 07:37:31 +0000
Received: by outflank-mailman (input) for mailman id 486264;
 Sun, 29 Jan 2023 07:37:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pM2Fm-0007UR-A7
 for xen-devel@lists.xenproject.org; Sun, 29 Jan 2023 07:37:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pM2Fl-0000Iu-T5; Sun, 29 Jan 2023 07:37:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pM2Fl-000197-NG; Sun, 29 Jan 2023 07:37:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=ZUahC7aqKP2EFGYOlFbHDxPU3jHbiQr55anPEZpzm/4=; b=U55fp/yCUyJyDx53S0HUWaA4jo
	v5uC04boZCO9jan/OHJgUTzw1qbPOXMZBxU0dzmdfl5d3rARpYORllNy7yIToYdvspwD9KYqCENpC
	6LyVdLPpEn8gW6S3cVLk6mUE9EsM+yGipU1tDHD4WyJdW29C9rwhHu8K+jCt3/P0Ps0E=;
Message-ID: <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
Date: Sun, 29 Jan 2023 07:37:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
In-Reply-To: <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 29/01/2023 05:39, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, January 19, 2023 11:04 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU
>> memory region map
>>
>> Hi Penny,
>>
> 
> Hi Julien
> 
> Sorry for the late response, just come back from Chinese Spring Festival Holiday~
>   
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> The start-of-day Xen MPU memory region layout shall be like as follows:
>>>
>>> xen_mpumap[0] : Xen text
>>> xen_mpumap[1] : Xen read-only data
>>> xen_mpumap[2] : Xen read-only after init data xen_mpumap[3] : Xen
>>> read-write data xen_mpumap[4] : Xen BSS ......
>>> xen_mpumap[max_xen_mpumap - 2]: Xen init data
>>> xen_mpumap[max_xen_mpumap - 1]: Xen init text
>>
>> Can you explain why the init region should be at the end of the MPU?
>>
> 
> As discussed in the v1 Serie, I'd like to put all transient MPU regions, like boot-only region,
> at the end of the MPU.

I vaguely recall the discussion but can't seem to find the thread. Do 
you have a link? (A summary in the patch would have been nice)

> Since they will get removed at the end of the boot, I am trying not to leave holes in the MPU
> map by putting all transient MPU regions at rear.

I understand the principle, but I am not convinced this is worth it 
because of the increase complexity in the assembly code.

What would be the problem with reshuffling partially the MPU once we booted?

> 
>>>
>>> max_xen_mpumap refers to the number of regions supported by the EL2
>> MPU.
>>> The layout shall be compliant with what we describe in xen.lds.S, or
>>> the codes need adjustment.
>>>
>>> As MMU system and MPU system have different functions to create the
>>> boot MMU/MPU memory management data, instead of introducing extra
>>> #ifdef in main code flow, we introduce a neutral name
>>> prepare_early_mappings for both, and also to replace create_page_tables
>> for MMU.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/arm64/Makefile              |   2 +
>>>    xen/arch/arm/arm64/head.S                |  17 +-
>>>    xen/arch/arm/arm64/head_mmu.S            |   4 +-
>>>    xen/arch/arm/arm64/head_mpu.S            | 323
>> +++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/arm64/mpu.h     |  63 +++++
>>>    xen/arch/arm/include/asm/arm64/sysregs.h |  49 ++++
>>>    xen/arch/arm/mm_mpu.c                    |  48 ++++
>>>    xen/arch/arm/xen.lds.S                   |   4 +
>>>    8 files changed, 502 insertions(+), 8 deletions(-)
>>>    create mode 100644 xen/arch/arm/arm64/head_mpu.S
>>>    create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>>>    create mode 100644 xen/arch/arm/mm_mpu.c
>>>
>>> +/*
>>> + * Macro to create a new MPU memory region entry, which is a
>>> +structure
>>> + * of pr_t,  in \prmap.
>>> + *
>>> + * Inputs:
>>> + * prmap:   mpu memory region map table symbol
>>> + * sel:     region selector
>>> + * prbar:   preserve value for PRBAR_EL2
>>> + * prlar    preserve value for PRLAR_EL2
>>> + *
>>> + * Clobbers \tmp1, \tmp2
>>> + *
>>> + */
>>> +.macro create_mpu_entry prmap, sel, prbar, prlar, tmp1, tmp2
>>> +    mov   \tmp2, \sel
>>> +    lsl   \tmp2, \tmp2, #MPU_ENTRY_SHIFT
>>> +    adr_l \tmp1, \prmap
>>> +    /* Write the first 8 bytes(prbar_t) of pr_t */
>>> +    str   \prbar, [\tmp1, \tmp2]
>>> +
>>> +    add   \tmp2, \tmp2, #8
>>> +    /* Write the last 8 bytes(prlar_t) of pr_t */
>>> +    str   \prlar, [\tmp1, \tmp2]
>>
>> Any particular reason to not use 'stp'?
>>
>> Also, AFAICT, with data cache disabled. But at least on ARMv8-A, the cache is
>> never really off. So don't need some cache maintainance?
>>
>> FAOD, I know the existing MMU code has the same issue. But I would rather
>> prefer if the new code introduced is compliant to the Arm Arm.
>>
> 
> True, `stp` is better and I will clean data cache to be compliant to the Arm Arm.
> I write the following example to see if I catch what you suggested:
> ```
> add \tmp1, \tmp1, \tmp2
> stp \prbar, \prlar, [\tmp1]
> dc cvau, \tmp1

I think this wants to be invalidate rather than clean because the cache 
is off.

> isb
> dsb sy
> ```
> 
>>> +.endm
>>> +
>>> +/*
>>> + * Macro to store the maximum number of regions supported by the EL2
>>> +MPU
>>> + * in max_xen_mpumap, which is identified by MPUIR_EL2.
>>> + *
>>> + * Outputs:
>>> + * nr_regions: preserve the maximum number of regions supported by
>>> +the EL2 MPU
>>> + *
>>> + * Clobbers \tmp1
>>> + * > + */
>>
>> Are you going to have multiple users? If not, then I would prefer if this is
>> folded in the only caller.
>>
> 
> Ok. I will fold since I think it is one-time reading thingy.
> 
>>> +.macro read_max_el2_regions, nr_regions, tmp1
>>> +    load_paddr \tmp1, max_xen_mpumap
>>
>> I would rather prefer if we restrict the use of global while the MMU if off (see
>> why above).
>>
> 
> If we don't use global here, then after MPU enabled, we need to re-read MPUIR_EL2
> to get the number of maximum EL2 regions.

Which, IMHO, is better than having to think about cache.

> 
> Or I put data cache clean after accessing global, is it better?
> ```
> str   \nr_regions, [\tmp1]
> dc cvau, \tmp1
> isb
> dsb sy
> ```
> 
>>> +    mrs   \nr_regions, MPUIR_EL2
>>> +    isb
>>
>> What's that isb for?
>>
>>> +    str   \nr_regions, [\tmp1]
>>> +.endm
>>> +
>>> +/*
>>> + * ENTRY to configure a EL2 MPU memory region
>>> + * ARMv8-R AArch64 at most supports 255 MPU protection regions.
>>> + * See section G1.3.18 of the reference manual for ARMv8-R AArch64,
>>> + * PRBAR<n>_EL2 and PRLAR<n>_EL2 provides access to the EL2 MPU
>>> +region
>>> + * determined by the value of 'n' and PRSELR_EL2.REGION as
>>> + * PRSELR_EL2.REGION<7:4>:n.(n = 0, 1, 2, ... , 15)
>>> + * For example to access regions from 16 to 31 (0b10000 to 0b11111):
>>> + * - Set PRSELR_EL2 to 0b1xxxx
>>> + * - Region 16 configuration is accessible through PRBAR0_EL2 and
>>> +PRLAR0_EL2
>>> + * - Region 17 configuration is accessible through PRBAR1_EL2 and
>>> +PRLAR1_EL2
>>> + * - Region 18 configuration is accessible through PRBAR2_EL2 and
>>> +PRLAR2_EL2
>>> + * - ...
>>> + * - Region 31 configuration is accessible through PRBAR15_EL2 and
>>> +PRLAR15_EL2
>>> + *
>>> + * Inputs:
>>> + * x27: region selector
>>> + * x28: preserve value for PRBAR_EL2
>>> + * x29: preserve value for PRLAR_EL2
>>> + *
>>> + */
>>> +ENTRY(write_pr)
>>
>> AFAICT, this function would not be necessary if the index for the init sections
>> were hardcoded.
>>
>> So I would like to understand why the index cannot be hardcoded.
>>
> 
> The reason is that we are putting init sections at the *end* of the MPU map, and
> the length of the whole MPU map is platform-specific. We read it from MPUIR_EL2.

Right, I got that bit from the code. What I would like to understand is 
why all the initial address cannot be hardocoded?

 From a brief look, this would simplify a lot the assembly code.

>   
>>> +    msr   PRSELR_EL2, x27
>>> +    dsb   sy
>>
>> [...]
>>
>>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S index
>>> bc45ea2c65..79965a3c17 100644
>>> --- a/xen/arch/arm/xen.lds.S
>>> +++ b/xen/arch/arm/xen.lds.S
>>> @@ -91,6 +91,8 @@ SECTIONS
>>>          __ro_after_init_end = .;
>>>      } : text
>>>
>>> +  . = ALIGN(PAGE_SIZE);
>>
>> Why do you need this ALIGN?
>>
> 
> I need a symbol as the start of the data section, so I introduce
> "__data_begin = .;".
> If I use "__ro_after_init_end = .;" instead, I'm afraid in the future,
> if someone introduces a new section after ro-after-init section, this part
> also needs modification too.

I haven't suggested there is a problem to define a new symbol. I am 
merely asking about the align.

> 
> When we define MPU regions for each section in xen.lds.S, we always treat these sections
> page-aligned.
> I checked each section in xen.lds.S, and ". = ALIGN(PAGE_SIZE);" is either added
> at section head, or at the tail of the previous section, to make sure starting address symbol
> page-aligned.
> 
> And if we don't put this ALIGN, if "__ro_after_init_end " symbol itself is not page-aligned,
> the two adjacent sections will overlap in MPU.

__ro_after_init_end *has* to be page aligned because the permissions are 
different than for __data_begin.

If we were going to add a new section, then either it has the same 
permission as .data.read.mostly and we will bundle them or it doesn't 
and we would need a .align.

But today, the extra .ALIGN seems unnecessary (at least in the context 
of this patch).

Cheers,

-- 
Julien Grall

