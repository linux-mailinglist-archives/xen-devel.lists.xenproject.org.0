Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0727412C7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 15:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556483.869060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVRj-0003K7-Vw; Wed, 28 Jun 2023 13:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556483.869060; Wed, 28 Jun 2023 13:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVRj-0003I4-Sj; Wed, 28 Jun 2023 13:42:59 +0000
Received: by outflank-mailman (input) for mailman id 556483;
 Wed, 28 Jun 2023 13:42:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEVRh-0003Hy-NA
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 13:42:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEVRg-0003sT-WB; Wed, 28 Jun 2023 13:42:57 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.5.86])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEVRg-0001v3-Pu; Wed, 28 Jun 2023 13:42:56 +0000
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
	bh=67KCTjUDq+i8BNGLlG0CY6xCuFnPSN1ERt3b4aSYd0A=; b=x5rWrOrkOfjjQ9OnhKyggO9gNT
	6PpVVZsgDFwViTxkP7OBARYJevvlzqInssg8/IjhqwNJ3NO9jZTI1Dv4gJhmrcGpBp28PpIeQzxaH
	8nS22pVli2Xkgtujrw+5mELctPnioXamzAThz2Tf18ySrOApiu3oxNVOI5zWPwXDt4hk=;
Message-ID: <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
Date: Wed, 28 Jun 2023 14:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
 <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 28/06/2023 14:22, Ayan Kumar Halder wrote:
> 
> On 28/06/2023 12:17, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 28/06/2023 11:55, Ayan Kumar Halder wrote:
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> The start-of-day Xen MPU memory region layout shall be like
>>>> as follows:
>>>>
>>>> xen_mpumap[0] : Xen text
>>>> xen_mpumap[1] : Xen read-only data
>>>> xen_mpumap[2] : Xen read-only after init data
>>>> xen_mpumap[3] : Xen read-write data
>>>> xen_mpumap[4] : Xen BSS
>>>> xen_mpumap[5] : Xen init text
>>>> xen_mpumap[6] : Xen init data
>>>>
>>>> The layout shall be compliant with what we describe in xen.lds.S,
>>>> or the codes need adjustment.
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - cache maintanence for safety when modifying MPU memory mapping table
>>>> - Hardcode index for all data/text sections
>>>> - To make sure that alternative instructions are included, use 
>>>> "_einitext"
>>>> as the start of the "Init data" section.
>>>> ---
>>> < snip>
>>>> +/*
>>>> + * Static start-of-day Xen EL2 MPU memory region layout:
>>>> + *
>>>> + *     xen_mpumap[0] : Xen text
>>>> + *     xen_mpumap[1] : Xen read-only data
>>>> + *     xen_mpumap[2] : Xen read-only after init data
>>>> + *     xen_mpumap[3] : Xen read-write data
>>>> + *     xen_mpumap[4] : Xen BSS
>>>> + *     xen_mpumap[5] : Xen init text
>>>> + *     xen_mpumap[6] : Xen init data
>>>> + *
>>>> + * Clobbers x0 - x6
>>>> + *
>>>> + * It shall be compliant with what describes in xen.lds.S, or the 
>>>> below
>>>> + * codes need adjustment.
>>>> + */
>>>> +ENTRY(prepare_early_mappings)
>>>> +    /* x0: region sel */
>>>> +    mov   x0, xzr
>>>> +    /* Xen text section. */
>>>> +    load_paddr x1, _stext
>>>> +    load_paddr x2, _etext
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>> attr_prbar=REGION_TEXT_PRBAR
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen read-only data section. */
>>>> +    load_paddr x1, _srodata
>>>> +    load_paddr x2, _erodata
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>> attr_prbar=REGION_RO_PRBAR
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen read-only after init data section. */
>>>> +    load_paddr x1, __ro_after_init_start
>>>> +    load_paddr x2, __ro_after_init_end
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen read-write data section. */
>>>> +    load_paddr x1, __ro_after_init_end
>>>> +    load_paddr x2, __init_begin
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen BSS section. */
>>>> +    load_paddr x1, __bss_start
>>>> +    load_paddr x2, __bss_end
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen init text section. */
>>>> +    load_paddr x1, _sinittext
>>>> +    load_paddr x2, _einittext
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>> attr_prbar=REGION_TEXT_PRBAR
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen init data section. */
>>>> +    /*
>>>> +     * Even though we are not using alternative instructions in MPU 
>>>> yet,
>>>> +     * we want to use "_einitext" for the start of the "Init data" 
>>>> section
>>>> +     * to make sure they are included.
>>>> +     */
>>>> +    load_paddr x1, _einittext
>>>> +    roundup_section x1
>>>> +    load_paddr x2, __init_end
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>> +
>>>> +    /* Ensure any MPU memory mapping table updates made above have 
>>>> occurred. */
>>>> +    dsb   nshst
>>>> +    ret
>>>> +ENDPROC(prepare_early_mappings)
>>>
>>> Any reason why this is in assembly ?
>>
>> I am not Penny. But from my understanding, in your approach, you will 
>> require to disable to switch the disable the MPU for using the new 
>> sections. While I agree...
>>
>>>
>>> We have implemented it in C 
>>> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/mm_mpu.c#L941 , so that it can be common between R82 and R52.
>>
>> ... this means you can share the code. It also means:
>>   * You can't protect Xen properly from the start
> 
> Yes, I see what you mean. Refer 
> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/arm32/mpu_v8r.S#L82C7-L82C15 ,
> 
> I am mapping CONFIG_XEN_START_ADDRESS + 2 MB. But, probably you mean 
> individual sections should be properly mapped from the beginning.
> 
>>   * You need to flush the cache (not great for performance)
>>   * You need to be more cautious as the MPU will be disabled for a 
>> short period of time.
> 
> Yes, MPU is disabled when set_boot_mpumap() is invoked. But is this 
> really a security issue ?

My second point is not about security, it is about been compliant with 
the Arm Arm. To quote what you wrote:

" To avoid unexpected unaligment access fault during MPU disabled, 
set_boot_mpumap shall be written in assembly code."

What's the guarantee that the compiler will not generate any 
instructions that could generate an alignment fault?

Furthermore, from my understanding, at least on Armv8-A, there are 
caching problem because you will need to save some registers (for the 
call to set_boot_mpumap()) on the stack with cache disabled. This means 
the cache will be bypassed. But you may then restore the registers with 
the cache enabled (the compiler could decide that it is not necessary to 
read the stack before hand). So you could read the wrong data if there 
is a stale cacheline.

So overall, I think you want to tightly control the section where the 
MPU is off. This means writing the logic in assembly rather than C.

> 
> I mean only a single core is running and it is executing Xen. The MPU is 
> turned off for few cycles.
> 
>>
>> In fact looking at your switch code in setup_protection_regions(), I 
>> am not convinced you can disable the MPU in C and then call 
>> set_boot_mpumap(). I think the enable/disable would need to be moved 
>> in the assembly function. There are potentially more issues.
> 
> disable_mpu(), enable_mpu() are written in assembly. See 
> https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/arm32/mpu_v8r.S#L128

Right, but then you return to C world to then call set_boot_mpumap(). So 
you have still some part in C even if it is small.

Cheers,

-- 
Julien Grall

