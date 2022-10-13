Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2795FD7FF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 12:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421855.667526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oivur-0001kV-Ki; Thu, 13 Oct 2022 10:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421855.667526; Thu, 13 Oct 2022 10:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oivur-0001h2-Hj; Thu, 13 Oct 2022 10:58:17 +0000
Received: by outflank-mailman (input) for mailman id 421855;
 Thu, 13 Oct 2022 10:58:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oivuq-0001gw-8F
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 10:58:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oivuq-0005C7-1k; Thu, 13 Oct 2022 10:58:16 +0000
Received: from [15.248.2.148] (helo=[10.24.69.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oivup-00013E-T2; Thu, 13 Oct 2022 10:58:16 +0000
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
	bh=ORjXm5YgZsiXnELeGd3zbzrMFbFUuyptzntA04aNsWY=; b=OauYsndkktlt2sMnZjXx5lit4C
	cWxAjU7QuAUP6M73xczxOLVNxV5ME78Szs8+W2EfLl/BOzTirwPSNVTyRIgKGzTvxuoWqSzZtSmsg
	1gHV/rbfvxR8bqZNm5/dAd7Rg/ZeeAojMQCoX89/btSv8RCgNcADoUHCF7cDF13Y66dM=;
Message-ID: <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
Date: Thu, 13 Oct 2022 11:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/10/2022 10:21, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
>> arch_domain_create()
>>
>> Hi Henry,
>>
>> On 13/10/2022 09:38, Henry Wang wrote:
>>> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
>>> when the domain is created. Considering the worst case of page tables
>>
>> Can you describe in the commit message what is the worst case scenario?
> 
> The two pages will be consecutive but not necessarily in the same L3 page
> table so the worst case is 4 + 2, is that correct?

So I agree that the worse case is 6. But I don't understand what you 
mean by '4 + 2' here.

> 
>>
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
>>>    xen/arch/arm/domain.c | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 2c84e6dbbb..e40e2bcba1 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
>>>            BUG();
>>>        }
>>>
>>> +    spin_lock(&d->arch.paging.lock);
>>> +    /*
>>> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2
>> area
>>
>> The wording suggests that this is only necessary for GICv2. But below
>> this is done unconditionally. I am happy with this been done
>> unconditionally, but I think this should be clarified here.
> 
> Sure, I will add "For GICv3, the above-mentioned P2M mapping is not
> necessary, but since the allocated 16 pages here would not be lost, hence
> populate these pages unconditionally" if it is ok to you.

Sounds good to me.

> 
>>
>>> +     * when the domain is created. Considering the worst case for page
>>> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool
>> here.
>>> +     */
>>> +    if ( (rc = p2m_set_allocation(d, 16, NULL)) != 0 )
>>> +    {
>>> +        p2m_set_allocation(d, 0, NULL);
>>
>> Shouldn't this be done in p2m_fiinal_teardown() to cover so the pages
>> will be freed anything after this call will fail (include in the caller
>> domain_create())?
> 
> Hmm, yes, I will remove this p2m_set_allocation(d, 0, NULL); in v2.

Just to clarify, I meant that a call in p2m_final_teardown() *is* 
missing in p2m_final_teardown() (or wherever we decide to add).

This would make this one redundant.

Cheers,

-- 
Julien Grall

