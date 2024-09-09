Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA18971310
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794057.1202732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaTh-0002Hu-VP; Mon, 09 Sep 2024 09:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794057.1202732; Mon, 09 Sep 2024 09:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaTh-0002Fv-SS; Mon, 09 Sep 2024 09:14:33 +0000
Received: by outflank-mailman (input) for mailman id 794057;
 Mon, 09 Sep 2024 09:14:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snaTg-0002Fp-VP
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:14:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snaTg-0001tN-Fz; Mon, 09 Sep 2024 09:14:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snaTg-0007Ek-B6; Mon, 09 Sep 2024 09:14:32 +0000
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
	bh=GGqRYUAI1SVV3Pt0r0jTRz7ZkhCKoZbjrX2hXQBsTp4=; b=EgQssj7F6o21SDxbjNnok7qyJw
	qqmZ+7jpObhWnsgKTlFwB3KMQbif869yWlse8n3BoSHI/+6wVC82nIk899n/JVmV0DlY6xgMs65rG
	7/rSAIFBCkZ4y7ws1BFgvLW5DlaIhjUqTShz/XSTytP6+UkScqU7BEHMNDIY8grSp1Eo=;
Message-ID: <7bbf2899-4c80-42c6-867c-2867ff89bfbe@xen.org>
Date: Mon, 9 Sep 2024 10:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
 <e1d1ed69-94e9-4625-ba49-9ebdb2b9581c@xen.org>
 <B9014D46-43F4-4928-96B6-CA6167964578@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B9014D46-43F4-4928-96B6-CA6167964578@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/09/2024 09:48, Luca Fancellu wrote:
> Hi Julien, Ayan,
> 
>>>>
>>>>> +    msr   PRBAR_EL2, \prbar
>>>>> +    msr   PRLAR_EL2, \prlar
>>>>> +    dsb   sy
>>> This should be visible to outer shareable domain atleast. The reason being one can use the SH[1:0] bits in PRBAR_EL2 to set the region to outer shareable.
>>> Thus, the writes to these registers should be visible to outer shareable domain as well.
>>
>> I am a bit confused. SH[1:0] is about how the region will be accessed not up to where should registers are visible. I was expecting that the MPU registers only need to be visible to the MPU itself.
>>
>> For instance, when using the MMU, the translation unit is in the non-shareable domain. So a 'nsh' is sufficient regardless of the shareability of the page/block.
>>
>> This is explicitely written in the Arm Arm (see D5-4929 in ARM DDI 0487H.a) but I can't find a similar section for the MPU yet. Although, I would be a bit surprised if the MPU is not in the non-shareable domain... Maybe this could be clarified with Arm?
> 
> I got the feedback that DSB SY is ok here

Thanks for asking. Does this mean that a "dsb nsh" would not be sufficient?

> 
>>
>> Anyway, for now, I am open to use 'dsb sy' with a TODO to revisit it.
>>
>>>>> +    isb
>>
>> Re-quoting the spec from you previous answer:
>>
>> ```
>> Writes to MPU registers are only guaranteed to be visible
>> following a Context synchronization event and DSB operation.
>> ```
>>
>> So this suggests that it should be first an 'isb' and then a 'dsb'. Any reason you wrote it the other way around?
> 
> I chased this internally and it was suggested the current order, dsb followed by the isb: DSB ensures the completion of prior
> instructions before the next executes, and then ISB ensures subsequent instruction fetch observes the updated MPU state.

I am confused. "DSB" doesn't ensure any completion of instructions. It 
just ensures memory access completion. Can you clarify?

> 
> Probably I will raise something to make awareness around the misleading order of that phrase.
> 
> Cheers,
> Luca

-- 
Julien Grall


