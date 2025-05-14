Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EBAB69A6
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 13:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984203.1370382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFA7k-00067H-0H; Wed, 14 May 2025 11:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984203.1370382; Wed, 14 May 2025 11:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFA7j-00064m-Td; Wed, 14 May 2025 11:18:07 +0000
Received: by outflank-mailman (input) for mailman id 984203;
 Wed, 14 May 2025 11:18:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uFA7i-00064g-5r
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 11:18:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uFA7g-008L8m-23;
 Wed, 14 May 2025 11:18:04 +0000
Received: from [15.248.2.24] (helo=[10.24.67.208])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uFA7f-009Hqb-2S;
 Wed, 14 May 2025 11:18:03 +0000
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
	bh=lp0M8qg0MRgs4b0+XgfVnH84uKA4AYIc1AZIJ+Tqas0=; b=FOLjVg0bJiHYg+cfytXPtm/ZT4
	4uV5hVV1V+S25Oqq/4O8XLKBUF/MlauR8p3ChJqQvQXtQvFAjlvfs32vfPoUEvL2O7VspeTHH328r
	MhkxcnGNPXNnQ4wM7m4BpsmIwJIotgx4DNxvokM4qIn8N1885s3Lcys01s+74phLc5qU=;
Message-ID: <aa6a1f7c-8abf-4af0-97a0-e0e265839bd2@xen.org>
Date: Wed, 14 May 2025 12:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
 <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
 <44143db1-1766-4851-9a0c-7428dce9087d@xen.org>
 <c8e9469f-2ee3-4b60-a580-9705f4831053@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c8e9469f-2ee3-4b60-a580-9705f4831053@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/05/2025 11:51, Orzel, Michal wrote:
> 
> 
> On 14/05/2025 12:06, Julien Grall wrote:
>> Hi,
>>
>> On 14/05/2025 10:57, Oleksii Kurochko wrote:
>>>
>>> On 5/14/25 9:25 AM, Julien Grall wrote:
>>>> Hi Oleksii,
>>>>
>>>> On 13/05/2025 15:29, Oleksii Kurochko wrote:
>>>>> Refactor construct_domU() to improve architecture separation and reduce
>>>>> reliance on ARM-specific logic in common code:
>>>>> - Drop set_domain_type() from generic code. This function is specific
>>>>>     to ARM and serves no purpose on other architectures like RISC-V,
>>>>>     which lack the arch.type field in kernel_info.
>>>>
>>>> So you will only ever boot one type of domain on RISC-V? IOW, no 32-bit
>>>> or else?
>>>
>>> The bitness of the guest and host should match. So, an RV32 host should run
>>> RV32 guests, and an RV64 host should run RV64 guests and so on.
>>> (I'm not really sure that on RISC-V it is possible to run with RV64 host
>>> an RV32 guest, but need to double-check)
>>>
>>> Therefore, my plan for RISC-V is to have the following:
>>>     #ifdef CONFIG_RISCV_64
>>>     #define is_32bit_domain(d) (0)
>>>     #define is_64bit_domain(d) (1)
>>>     #else
>>>     #define is_32bit_domain(d) (1)
>>>     #define is_64bit_domain(d) (0)
>>>     #endif
>>>
>>> With this definition, there's no need to use|(d)->arch.type| for RISC-V.
>>>
>>>>
>>>>> - Introduce arch_construct_domU() to encapsulate architecture-specific
>>>>>     DomU construction steps.
>>>>> - Implement arch_construct_domU() for ARM. This includes:
>>>>>     - Setting the domain type for CONFIG_ARM64.
>>>>>     - Handling static memory allocation if xen,static-mem is present in
>>>>>       the device tree.
>>>>>     - Processing static shared memory.
>>>>> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>>>>>     this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>>>>>     at least, now.
>>>>
>>>> This looks shortsighted. If there is a plan to use CONFIG_STATIC_SHM
>>>> on RISC-V (I don't see why not today), then
>>>> I think the code should stick in common/ even if it is not fully usable
>>>> yet (that's the whole point of have CONFIG_* options).
>>>
>>> We don't use this feature in the downstream repo, but I can imagine some
>>> cases where it could be useful. So, for now, its
>>> use is purely theoretical and it is a reason why I agreed with Michal
>>> and returned back these changes to Arm.
>>
>> I strongly disagree with this statement. If a feature is not
>> architecture specific (like static shared memory), then the code ought
>> to be in common code so it can be re-used by others.
> But the code is not common. There are still 900 lines in arch spec dir.

Sure. But my point is rather more that static memory is not a feature 
described by the Arm Arm. Instead, it is a feature of Xen that is ti to 
device-tree. So inherently there is no reason to be implemented in arch/arm.

>>
>> Also, AFAIK, the bulk of the static shared memory code is in common. So
>> it would be rather easy to add support for RISC-V if we wanted to.
>>
>> Given the code is already in common, it is rather silly to move the code
> IMO it should not be made common in the first place. I don't like exposing
> callers with the big chunk of code sitting in the arch specific directory.

So the concern is we didn't go far enough rather than the feature should 
not be implemented in common for other archs, correct?

> 
>> back to Arm for then moving back to common potentially in a few weeks time.
> What about static memory code? With the recent Oleksii code movement, the inline
> helpers like allocate_static_memory() became unreachable when the feature is
> disabled and the main purpose for helpers was to avoid ifdefery.

Sorry I am not sure which part you are referring to.

Cheers,

-- 
Julien Grall


