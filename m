Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40395FD975
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421982.667742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixbm-0005b5-7H; Thu, 13 Oct 2022 12:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421982.667742; Thu, 13 Oct 2022 12:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixbm-0005ZP-2t; Thu, 13 Oct 2022 12:46:42 +0000
Received: by outflank-mailman (input) for mailman id 421982;
 Thu, 13 Oct 2022 12:46:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oixbk-0005Yr-M9
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:46:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oixbk-0007Eq-8P; Thu, 13 Oct 2022 12:46:40 +0000
Received: from [15.248.2.148] (helo=[10.24.69.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oixbk-0006YV-12; Thu, 13 Oct 2022 12:46:40 +0000
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
	bh=7nT95/3FaBYhao44EbQ42lgCinTiuLcbosgyDAzL7vM=; b=5VvJO/sseQzAKqkPtgbtLHhWUH
	xg6ug5ia6asBIkluG7bvqwcp+hUiS57kfj7nrY56E6+wJxwHVA04g7A/f3EY99tCJ0GGR8aLrdIkl
	j4xtEERQIKW28pVrWR8RkORebCsGc2r6ACI0LbxqK4sMqUBlCX7fIlImeR/IBTt/wm1Q=;
Message-ID: <63f5ab77-de4e-7a42-9942-832d8f891a53@xen.org>
Date: Thu, 13 Oct 2022 13:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <6cf1c4a9-f339-217c-4557-b0a9ff37938a@citrix.com>
 <AS8PR08MB7991FF3E7EEA46F11ED4376092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991FF3E7EEA46F11ED4376092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/10/2022 10:40, Henry Wang wrote:
> Hi Andrew,
> 
>> -----Original Message-----
>> From: Andrew Cooper <Andrew.Cooper3@citrix.com>
>> Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
>> arch_domain_create()
>>
>> On 13/10/2022 09:38, Henry Wang wrote:
>>> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
>>> when the domain is created. Considering the worst case of page tables
>>> and keep a buffer, populate 16 pages as the default value to the P2M
>>> pages pool in arch_domain_create() at the domain creation stage to
>>> satisfy the GICv2 requirement.
>>>
>>> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M
>> pool")
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>> This should also be backported to 4.13, 4.14, 4.15 and 4.16.
>>> ---
>>>   xen/arch/arm/domain.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 2c84e6dbbb..e40e2bcba1 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
>>>           BUG();
>>>       }
>>>
>>> +    spin_lock(&d->arch.paging.lock);
>>> +    /*
>>> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2
>> area
>>> +     * when the domain is created. Considering the worst case for page
>>> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool
>> here.
>>> +     */
>>> +    if ( (rc = p2m_set_allocation(d, 16, NULL)) != 0 )
>>> +    {
>>> +        p2m_set_allocation(d, 0, NULL);
>>> +        spin_unlock(&d->arch.paging.lock);
>>> +        goto fail;
>>> +    }
>>> +    spin_unlock(&d->arch.paging.lock);
>>
>> Generally, this would be better written as
>>
>> spin_lock();
>> if ( rc = p2m_set_allocation(16) )
>>      p2m_set_allocation(0)
>> spin_unlock();
>>
>> if ( rc )
>>      goto fail;
>>
>> to reduce the number of spin_unlock() calls and make the error paths
>> more clear.  However...
> 
> I think in Arm's arch_domain_create(), all the error handling are the
> same style using:
> 
> if ( (rc = <function>) !=0 )
>      goto fail;
> 
> and we need to keep them the same?

We don't have too. I agree with Andrew's point. How about the following:

spin_lock()
rc = ...
spin_unlock()

if ( rc )
   goto fail;

Cheers,

-- 
Julien Grall

