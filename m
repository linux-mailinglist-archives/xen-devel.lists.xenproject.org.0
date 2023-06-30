Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B4E743AB8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 13:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557429.870770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCD8-0006w7-Po; Fri, 30 Jun 2023 11:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557429.870770; Fri, 30 Jun 2023 11:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCD8-0006sm-Lu; Fri, 30 Jun 2023 11:22:46 +0000
Received: by outflank-mailman (input) for mailman id 557429;
 Fri, 30 Jun 2023 11:22:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qFCD6-0006sQ-VT
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 11:22:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFCD6-0004BE-Gy; Fri, 30 Jun 2023 11:22:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFCD6-0006at-C8; Fri, 30 Jun 2023 11:22:44 +0000
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
	bh=i5+siVdUMaMN3uC7wzYRy1VJomOUA3yLJi4QLGgee6k=; b=NpOWn3U/I/Q1nQuxsAvusKHkNC
	/Cmt4yr9scciQJlDA/Hd1GgFIh1gmrm29ug8cHBLkFKzJawXwHsG4sOiAIs1ERYnN2P8PpCjws0F7
	d4G/7p0WMJLUvTwmGSJXG0702JETqXvIK+UbFPNyXDOQnGCP5iTI14yzunxsRwKwqzJ8=;
Message-ID: <baed1eac-0f9a-a85a-d4cc-feef772870db@xen.org>
Date: Fri, 30 Jun 2023 12:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <penny.zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
 <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
 <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/06/2023 11:49, Ayan Kumar Halder wrote:
> 
> On 30/06/2023 05:07, Penny Zheng wrote:
>> Hi,
> Hi Penny,
>>
>>
>> On 2023/6/30 01:22, Ayan Kumar Halder wrote:
>>>
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> In MPU system, MPU memory region is always mapped PAGE_ALIGN, so in 
>>>> order to
>>>> not access unexpected memory area, dtb section in xen.lds.S should 
>>>> be made
>>>> page-aligned too.
>>>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it 
>>>> happen.
>>>>
>>>> In this commit, we map early FDT with a transient MPU memory region, as
>>>> it will be relocated into heap and unmapped at the end of boot.
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - map the first 2MB. Check the size and then re-map with an extra 
>>>> 2MB if needed
>>>> ---
>>>>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>>>>   xen/arch/arm/include/asm/page.h      |  5 +++++
>>>>   xen/arch/arm/mm.c                    | 26 ++++++++++++++++++++------
>>>>   xen/arch/arm/mpu/mm.c                |  1 +
>>>>   xen/arch/arm/xen.lds.S               |  5 ++++-
>>>>   5 files changed, 32 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>>> index a6b07bab02..715ea69884 100644
>>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>>> @@ -72,7 +72,8 @@ typedef union {
>>>>           unsigned long ns:1;     /* Not-Secure */
>>>>           unsigned long res:1;    /* Reserved 0 by hardware */
>>>>           unsigned long limit:42; /* Limit Address */
>>>> -        unsigned long pad:16;
>>>> +        unsigned long pad:15;
>>>> +        unsigned long tran:1;   /* Transient region */
>>>>       } reg;
>>>>       uint64_t bits;
>>>>   } prlar_t;
>>>> diff --git a/xen/arch/arm/include/asm/page.h 
>>>> b/xen/arch/arm/include/asm/page.h
>>>> index 85ecd5e4de..a434e2205a 100644
>>>> --- a/xen/arch/arm/include/asm/page.h
>>>> +++ b/xen/arch/arm/include/asm/page.h
>>>> @@ -97,19 +97,24 @@
>>>>    * [3:4] Execute Never
>>>>    * [5:6] Access Permission
>>>>    * [7]   Region Present
>>>> + * [8]   Transient Region, e.g. MPU memory region is temproraily
>>>> + *                              mapped for a short time
>>>>    */
>>>>   #define _PAGE_AI_BIT            0
>>>>   #define _PAGE_XN_BIT            3
>>>>   #define _PAGE_AP_BIT            5
>>>>   #define _PAGE_PRESENT_BIT       7
>>>> +#define _PAGE_TRANSIENT_BIT     8
>>> I don't think this is related to MPU. At least when I look at the bit 
>>> representation of PRBAR_EL1/2,
>>
>> This set of _PAGE_xxx flags aren't compliant with PRBAR_EL1/2 register 
>> map.
>> It is a flag passed to function map_pages_to_xen() to indicate memory
>> attributes and permission.
> 
> But aren't you writing these flags to PRBAR_EL1/EL2 when you call 
> xen_mpumap_update_entry().
> 
> In the below snippet of xen_mpumap_update_entry(), IIUC, you are writing 
> these flags.
> 
>          xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>          xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
> 
>          write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
> 
> Please clarify here.
> 
> In this case, I don't prefer mixing hardware specific bits with software 
> only representation for these reasons :-
> 
> 1. It makes it confusing and hard to differentiate the hardware specific 
> attrbutes from software only.

Penny's approach matches what we are doing in the MMU code. We want to 
have a way for the caller to pass just set of flags and let the callee 
to decide what to do with them.

This may be flags converted for HW fields or just used by the logic.

If you disagree with this approach, then can you propose a different way 
that we can discuss?

> 
> 2.  Also, refer xen/arch/arm/include/asm/arm64/mpu.h, typedef union 
> prbar_t {} :-
> 
> typedef union {
>      struct __packed {
>          unsigned long xn:2;       /* Execute-Never */
>          unsigned long ap:2;       /* Acess Permission */
>          unsigned long sh:2;       /* Sharebility */
>          unsigned long base:42;    /* Base Address */
>          unsigned long pad:12;
>          unsigned long p2m_type:4; /* Ignore by hardware. Used to store 
> p2m types.*/
You are right, the top bits are RES0 (not ignored like on ARMv8-A). So 
we can't use to store the p2m_type.

Cheers,

-- 
Julien Grall

