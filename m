Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792059A6E26
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823685.1237721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uMT-0005mV-4K; Mon, 21 Oct 2024 15:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823685.1237721; Mon, 21 Oct 2024 15:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uMT-0005k6-1e; Mon, 21 Oct 2024 15:30:25 +0000
Received: by outflank-mailman (input) for mailman id 823685;
 Mon, 21 Oct 2024 15:30:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2uMR-0005k0-Aj
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:30:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uMQ-00036d-WA; Mon, 21 Oct 2024 15:30:22 +0000
Received: from [2a02:8012:3a1:0:827:16ef:abff:1cc1]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uMQ-0001ok-P3; Mon, 21 Oct 2024 15:30:22 +0000
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
	bh=ydsDvZXSr607MylDcGfzwfPfmlY+lHjaN570Eg9c2OQ=; b=1cWt0mYwMTUkCldZcWDt1RMyxK
	CJrWuwoUah9gwMtC3VZ9b7G+O+Ldsq3g5elGvrxEo3gcV72AOya0gqJfZNvzOGCbnwUWR4fHddGVl
	h6FZyVDstqT83VAk6mpVUH91wak+3RSqgxtY4+NVOOqwFSGLA/rEOcP9xCu2/1R6xGRo=;
Message-ID: <12d61ae8-b89d-4bc8-824c-65a97e4ba988@xen.org>
Date: Mon, 21 Oct 2024 16:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-4-ayan.kumar.halder@amd.com>
 <5740cd89-1064-4ad1-a0a6-90c03ab99768@xen.org>
 <a92993c9-8af9-4d53-a934-79e7f5a5f92a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a92993c9-8af9-4d53-a934-79e7f5a5f92a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/10/2024 13:40, Ayan Kumar Halder wrote:
> 
> On 18/10/2024 22:59, Julien Grall wrote:
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 71ebaa77ca..0203771164 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -295,6 +295,14 @@ void asmlinkage __init start_xen(unsigned long 
>>> fdt_paddr)
>>>       struct domain *d;
>>>       int rc, i;
>>>   +#ifdef CONFIG_MPU
>>> +    /*
>>> +     * Unlike MMU, MPU does not use pages for translation. However, 
>>> we continue
>>> +     * to use PAGE_SIZE to denote 4KB. This is so that the existing 
>>> memory
>>> +     * management based on pages, continue to work for now.
>>> +     */
>>> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>>> +#endif
>>
>> I think it would be better suited in mm.c or mpu/*.c.
> 
> We do not have mpu/*.c at the moment.

But we are going to get some and most likely a mpu/mm.c, right? If so, I 
don't see why we can't create one right now. Anyway...

 > Also, I am not sure within which > function in mm.c, should this 
change be incorporated.

in arm/mm.c, I could create a new function:

static void __init __maybe_unused build_assertions(void)

> 
> Can we take out this change from the current patch and put it in a later 
> series when we support the lateboot of Xen (ie start_xen() onwards) for 
> MPU ?

I would say no. The BUILD_BUG_ON() is suited here.

> 
>>
>>>       dcache_line_bytes = read_dcache_line_bytes();
>>>         percpu_init_areas();
>>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>>> index bd884664ad..fe4b468cca 100644
>>> --- a/xen/arch/arm/xen.lds.S
>>> +++ b/xen/arch/arm/xen.lds.S
>>> @@ -231,6 +231,12 @@ SECTIONS
>>>    */
>>>   ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
>>>   +/*
>>> + * On MPU based platforms, the starting address is to be provided by 
>>> user.
>>> + * One need to check that it is 4KB aligned.
>>> + */
>>> +ASSERT(IS_ALIGNED(_start,       4096), "starting address is 
>>> misaligned")
>>> +
>>
>> Shouldn't this be protected with #ifdef CONFIG_MPU? 
> yes
>> Also, it would probably be useful to start the exact size in the error 
>> message.
> 
> Do you mean ?
> 
> ASSERT(IS_ALIGNED(_start,       4096), "starting address should be 
> aligned to 4KB")

Yes.

Cheers,

-- 
Julien Grall


