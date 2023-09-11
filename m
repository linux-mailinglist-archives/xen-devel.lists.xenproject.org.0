Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCF79A90A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599529.934987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiFp-000727-3Q; Mon, 11 Sep 2023 14:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599529.934987; Mon, 11 Sep 2023 14:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfiFp-0006zp-0h; Mon, 11 Sep 2023 14:51:09 +0000
Received: by outflank-mailman (input) for mailman id 599529;
 Mon, 11 Sep 2023 14:51:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qfiFn-0006zh-NF
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:51:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfiFn-0001Eh-96; Mon, 11 Sep 2023 14:51:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qfiFn-0001FK-3f; Mon, 11 Sep 2023 14:51:07 +0000
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
	bh=E/vGDCnyziZ9DN2/60mAFB/TvQ7v5NzwLeCXU/vy/c8=; b=m4LOUmIjw6jT0qHTGWNkIAu12v
	SF8LD/FRw52JU+gXARUuEjE4UzeZhMEETsZynxfZh7B7Yim5CciPAcDt8FiQ20J+UoriTBMhfjO5C
	MI3SxdR8kqmKNQH/AmoR/xVWTRsKL+GrK7LwHf1Id5eXXiDmd1dEQqaeu78W1WU2Nmv4=;
Message-ID: <ec41bd05-4a25-438b-84cb-ca86d7bf34d8@xen.org>
Date: Mon, 11 Sep 2023 15:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
 <19a8b434-3b2d-9e3d-fc05-fc2828d1abbd@amd.com>
 <CE8AF1AE-8F01-4DD8-86EE-12C4AD18E4A0@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CE8AF1AE-8F01-4DD8-86EE-12C4AD18E4A0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/08/2023 10:16, Henry Wang wrote:
>> On Aug 31, 2023, at 17:12, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi Henry,
>>
>> On 28/08/2023 02:32, Henry Wang wrote:
>>>
>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>> index 33b038e7e0..39218cf15f 100644
>>> --- a/xen/arch/arm/arm32/head.S
>>> +++ b/xen/arch/arm/arm32/head.S
>>> @@ -83,6 +83,25 @@
>>>           isb
>>>   .endm
>>>
>>> +/*
>>> + * Enforce Xen page-tables do not contain mapping that are both
>>> + * Writable and eXecutables.
>>> + *
>>> + * This should be called on each secondary CPU.
>>> + */
>>> +.macro pt_enforce_wxn tmp
>>> +        mrc   CP32(\tmp, HSCTLR)
>>> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
>>> +        dsb
>>> +        mcr   CP32(\tmp, HSCTLR)
>>> +        /*
>>> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
>>> +         * before flushing the TLBs.
>>> +         */
>>> +        isb
>>> +        flush_xen_tlb_local \tmp
>>> +.endm
>>> +
>>>   /*
>>>    * Common register usage in this file:
>>>    *   r0  -
>>> @@ -254,6 +273,7 @@ secondary_switched:
>>>           /* Use a virtual address to access the UART. */
>>>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>>>   #endif
>>> +        pt_enforce_wxn
>>>   
>>
>> Can you move ^^^ to before "#ifdef CONFIG_EARLY_PRINTK" so that the MMU related functionality are bundled together?
>>
>> Also AFAIU, mov_w has not effect on pt_enforce_wxn().
>>
>> So that I can create a function "enable_secondary_cpu_mm()" - similar to one you introduced for arm64
> 
> Sure, I am good with this if other maintainers do not have any objections.

I am objecting. It would be quite handy to print a message on the 
console to indicate that we are enforce WXN. So we want to update UART 
address (stored in r11) before hand.

Cheers,

-- 
Julien Grall

