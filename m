Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50489389750
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 22:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130400.244316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSOG-0004ab-Kx; Wed, 19 May 2021 20:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130400.244316; Wed, 19 May 2021 20:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSOG-0004YO-H2; Wed, 19 May 2021 20:02:00 +0000
Received: by outflank-mailman (input) for mailman id 130400;
 Wed, 19 May 2021 20:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljSOE-0004YI-Tm
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 20:01:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSOD-0001Kk-Ra; Wed, 19 May 2021 20:01:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSOD-00035k-LQ; Wed, 19 May 2021 20:01:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Y3j6reANSiIScwr3eRjvR6Yhf3VR7aqJqtMfKYZyhKQ=; b=DFTngzctTIdvSuJvPCPRoBMMsn
	KSZztBhRaNZD/mJV9ocSLIUMKXT7cijxNYf1Re1UIl7p4PbyjBZa/ZhY03T0tIMYpdZL+7G21eINO
	y15c/GbE5nLmQ4i+kYCH3+TL2fPZY09dOfYrBJz7L2rFJwVy+PMC5ITF1WkAbt+1+dYA=;
Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
To: Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <75275b2f-9de3-944a-d55c-a62bbbf1bb8c@xen.org>
 <VE1PR08MB5215CB5102529F32DC695CFDF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <953418db-5484-bb1e-e0dc-96798a284479@xen.org>
Date: Wed, 19 May 2021 21:01:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215CB5102529F32DC695CFDF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/05/2021 08:52, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, May 18, 2021 8:13 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; Jan Beulich <jbeulich@suse.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
>>
>> Hi Penny,
>>
>> On 18/05/2021 09:57, Penny Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, May 18, 2021 3:35 PM
>>>> To: Penny Zheng <Penny.Zheng@arm.com>
>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>>>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-
>> devel@lists.xenproject.org;
>>>> sstabellini@kernel.org; julien@xen.org
>>>> Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
>>>>
>>>> On 18.05.2021 07:21, Penny Zheng wrote:
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -2447,6 +2447,9 @@ int assign_pages(
>>>>>        {
>>>>>            ASSERT(page_get_owner(&pg[i]) == NULL);
>>>>>            page_set_owner(&pg[i], d);
>>>>> +        /* use page_set_reserved_owner to set its reserved domain owner.
>>>> */
>>>>> +        if ( (pg[i].count_info & PGC_reserved) )
>>>>> +            page_set_reserved_owner(&pg[i], d);
>>>>
>>>> Now this is puzzling: What's the point of setting two owner fields to
>>>> the same value? I also don't recall you having introduced
>>>> page_set_reserved_owner() for x86, so how is this going to build there?
>>>>
>>>
>>> Thanks for pointing out that it will fail on x86.
>>> As for the same value, sure, I shall change it to domid_t domid to record its
>> reserved owner.
>>> Only domid is enough for differentiate.
>>> And even when domain get rebooted, struct domain may be destroyed, but
>>> domid will stays The same.
>>> Major user cases for domain on static allocation are referring to the
>>> whole system are static, No runtime creation.
>>
>> One may want to have static memory yet doesn't care about the domid. So I
>> am not in favor to restrict about the domid unless there is no other way.
>>
> 
> The user case you bring up here is that static memory pool?

No. The use case I am talking about is an user who wants to give a 
specific memory region to the guest but doesn't care about which domid 
was allocated to the guest.

> 
> Right now, the user cases are mostly restricted to static system.
> If we bring runtime allocation, `xl` here, it will add a lot more complexity.
> But if the system has static behavior, the domid is also static.
I read this as the admin would have to specify the domain ID in the 
Device-Tree. Is that what you meant?

If so, then I don't see why we should mandate that. I would mind less if 
by static you mean the domid will be allocated by Xen and then not 
changed accross reboot.

> 
> On rebooting domain from static memory pool, it brings up more discussion, like
> do we intend to give the memory back to static memory pool when rebooting,
> if so, ram could be allocated from different place compared with the previous one.

You should have all the information in the Device-Tree to re-assign the 
correct regions. So why would it be allocated from a different place?

Cheers,

-- 
Julien Grall

