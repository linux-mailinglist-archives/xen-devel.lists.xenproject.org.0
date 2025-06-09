Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348F9AD1C63
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 13:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010247.1388421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOaed-0002tB-8k; Mon, 09 Jun 2025 11:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010247.1388421; Mon, 09 Jun 2025 11:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOaed-0002r5-5k; Mon, 09 Jun 2025 11:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1010247;
 Mon, 09 Jun 2025 11:27:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uOaea-0002qz-U5
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 11:27:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uOaea-00AEQV-0e;
 Mon, 09 Jun 2025 11:27:00 +0000
Received: from [2a02:8012:3a1:0:943c:2fd5:7003:a460]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uOaea-005xls-1K;
 Mon, 09 Jun 2025 11:27:00 +0000
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
	bh=O2liooQ06yWBmc9LWnWW0tojfD8Jo9oAzMjEmwbtEM4=; b=w3YeZ0DPg+TG3CFkutgUHwyyeP
	vsfDsdYLEXDmLPjzC67K6whiLvTF0As9MlySk+hclvhpJLh/PzDYU6ogeZHOZuSy4wCmrzUcf2974
	y+viA2eFkjl/SA+s+DqFNjbP3YcNqXIqR3O/WQbOle0gDWhXDK3q//bUs2Hp9yYYFUqg=;
Message-ID: <36471193-6b9f-4658-91c4-ec25dd784436@xen.org>
Date: Mon, 9 Jun 2025 12:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>, "Orzel, Michal"
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
 <ee8df4dd-1256-49e0-827e-c4dfe9543fc7@amd.com>
 <a1b87894-9c9f-4ed7-ab81-63cc27440ad4@amd.com>
 <b066c5fd-76e3-45c3-be1c-f8260d283cc3@xen.org>
 <f19d8968-7a2f-4f62-830a-4a7c578a1d72@amd.com>
 <55f6d0ca-e622-48b9-8e08-4cc7b7951bd8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <55f6d0ca-e622-48b9-8e08-4cc7b7951bd8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 09/06/2025 11:43, Ayan Kumar Halder wrote:
> Hi,
> 
> On 09/06/2025 10:16, Ayan Kumar Halder wrote:
>>
>> On 09/06/2025 09:42, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 09/06/2025 09:27, Ayan Kumar Halder wrote:
>>>> On 09/06/2025 08:41, Orzel, Michal wrote:
>>>>>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/ 
>>>>>> arm/ include/asm/mpu/regions.inc
>>>>>> index 6b8c233e6c..631b0b2b86 100644
>>>>>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>>>>>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>>>>>> @@ -24,7 +24,7 @@
>>>>>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>>>>>   .macro store_pair reg1, reg2, dst
>>>>>> -    .word 0xe7f000f0                    /* unimplemented */
>>>>>> +    stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register 
>>>>>> than reg1 */
>>>>> Didn't we agree not to use STM (I suggested it but then Julien 
>>>>> pointed out that
>>>>> it's use in macro might not be the best)?
>>>>
>>>> Ah my last response was not sent.
>>>>
>>>> I realized that I cannot use strd due to the following error
>>>>
>>>> Error: first transfer register must be even -- `strd r3,r4,[r1]'
>>>
>>> Ah I missed the "even" part when reading the specification. However, 
>>> we control the set of registers, so we can't we follow the 
>>> restriction? This would be better...
>>
>> I am ok to follow this. I just want to make sure that this looks ok to 
>> you
>>
>> prepare_xen_region() invokes store_pair(). They are in common header.
>>
>> So we need to make the change wherever prepare_xen_region() is invoked 
>> from arm32/mpu/head.S. This would look like
>>
>> --- a/xen/arch/arm/arm32/mpu/head.S
>> +++ b/xen/arch/arm/arm32/mpu/head.S
>> @@ -58,33 +58,33 @@ FUNC(enable_boot_cpu_mm)
>>      /* Xen text section. */
>>      mov_w   r1, _stext
>>      mov_w   r2, _etext
>> -    prepare_xen_region r0, r1, r2, r3, r4, r5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +    prepare_xen_region r0, r1, r2, r4, r3, r5, 
>> attr_prbar=REGION_TEXT_PRBAR
> 
> My mistake, It should be
> 
> prepare_xen_region r0, r1, r2, r4, r5, r6, attr_prbar=REGION_TEXT_PRBAR
> 
> We will be clobbering an extra register.

Why can't we use r3 instead of r6?

 > So this would look a different different from its arm64 counterpart.

I don't see the problem with that. The code is not common. And TBH 
prepare_xen_region should never have been common ... but I will not 
re-open this discussion :).

Cheers,

-- 
Julien Grall


