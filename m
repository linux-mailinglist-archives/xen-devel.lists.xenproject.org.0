Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F538E3FE
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 12:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131731.246058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll7lN-0006b2-Nc; Mon, 24 May 2021 10:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131731.246058; Mon, 24 May 2021 10:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll7lN-0006Yb-K0; Mon, 24 May 2021 10:24:45 +0000
Received: by outflank-mailman (input) for mailman id 131731;
 Mon, 24 May 2021 10:24:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ll7lM-0006YV-J6
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 10:24:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ll7lM-0000KD-E9; Mon, 24 May 2021 10:24:44 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ll7lM-0004TV-8X; Mon, 24 May 2021 10:24:44 +0000
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
	bh=rtuo2DCxsEZ49xpvK8D1WtcGheLua/e2XjF0pAI3r24=; b=pLofRS/t6yxMGRIn3LL1tynjHO
	zTuhKGXTli/GNBXwV8njhUImBHcwqFIIJkGALR7Vdo/9HS6xHUDirAxn/mlUBHWAK71pCWkE7fuwg
	aDSqWvW7HZJnyFTcQ7oz6qkk9popAdqsLycnu3ttO6fJBBxYN4gXp6I1vzsjOFeTCrQs=;
Subject: Re: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
 <e8e4148e-017b-955b-dd18-4576ce7c94ec@xen.org>
 <VE1PR08MB52156570D7795C3595674BE5F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <VE1PR08MB521532DDD1CC4C8872AE08CFF7269@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d5da5783-be83-6162-e4ab-79326aac8edd@xen.org>
Date: Mon, 24 May 2021 11:24:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB521532DDD1CC4C8872AE08CFF7269@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 24/05/2021 11:10, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>>>> +    if ( !pg )
>>>> +        return NULL;
>>>> +
>>>> +    for ( i = 0; i < nr_pfns; i++)
>>>> +    {
>>>> +        /*
>>>> +         * Reference count must continuously be zero for free pages
>>>> +         * of static memory(PGC_reserved).
>>>> +         */
>>>> +        ASSERT(pg[i].count_info & PGC_reserved);
>>>> +        if ( (pg[i].count_info & ~PGC_reserved) != PGC_state_free )
>>>> +        {
>>>> +            printk(XENLOG_ERR
>>>> +                    "Reference count must continuously be zero for free pages"
>>>> +                    "pg[%u] MFN %"PRI_mfn" c=%#lx t=%#x\n",
>>>> +                    i, mfn_x(page_to_mfn(pg + i)),
>>>> +                    pg[i].count_info, pg[i].tlbflush_timestamp);
>>>> +            BUG();
>>>
>>> So we would crash Xen if the caller pass a wrong range. Is it what we want?
>>>
>>> Also, who is going to prevent concurrent access?
>>>
>>
>> Sure, to fix concurrency issue, I may need to add one spinlock like `static
>> DEFINE_SPINLOCK(staticmem_lock);`
>>
>> In current alloc_heap_pages, it will do similar check, that pages in free state
>> MUST have zero reference count. I guess, if condition not met, there is no need
>> to proceed.
>>
> 
> Another thought on concurrency problem, when constructing patch v2, do we need to
> consider concurrency here?
> heap_lock is to take care concurrent allocation on the one heap, but static memory is
> always reserved for only one specific domain.
In theory yes, but you are relying on the admin to correctly write the 
device-tree nodes.

You are probably not going to hit the problem today because the domains 
are created one by one. But, as you may want to allocate memory at 
runtime, this is quite important to get the code protected from 
concurrent access.

Here, you will likely want to use the heaplock rather than a new lock. 
So you are also protect against concurrent access to count_info from 
other part of Xen.


Cheers,

-- 
Julien Grall

