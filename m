Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED59389E9D
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 09:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130655.244612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljckM-0008Fx-H3; Thu, 20 May 2021 07:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130655.244612; Thu, 20 May 2021 07:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljckM-0008DA-CF; Thu, 20 May 2021 07:05:30 +0000
Received: by outflank-mailman (input) for mailman id 130655;
 Thu, 20 May 2021 07:05:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljckK-0008D4-Ol
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 07:05:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1c71415-5393-4c84-ac77-657a06c0accd;
 Thu, 20 May 2021 07:05:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A393FB008;
 Thu, 20 May 2021 07:05:26 +0000 (UTC)
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
X-Inumbo-ID: e1c71415-5393-4c84-ac77-657a06c0accd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621494326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UN8EQdqlO1ZovXZd8DiiRg4AjMAaYh4SSksCxnz7QS4=;
	b=gtS2naKPs6s7aJQuHlG8F9jJ07JNHj2K1JbyhuJ9JyosuC3jJagSSY85M/lG6KYRVi+MmL
	mJbMbxpbMFpIaDDeSi7yKq8t7+I522uvJzen9M8T5wXTtD+BY87kVEPjcYohMMie37YktN
	pPk6147s81fK2pSGgvAHyL7GDAcWbkc=
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <9e22e4de-0d09-5195-bd8f-2ca326264807@suse.com>
 <765312c9-3b71-eb3a-5c8d-2ba0aa019595@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <624d99d3-6299-f712-e667-5330ab4b1492@suse.com>
Date: Thu, 20 May 2021 09:05:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <765312c9-3b71-eb3a-5c8d-2ba0aa019595@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.05.2021 21:49, Julien Grall wrote:
> On 19/05/2021 10:49, Jan Beulich wrote:
>> On 19.05.2021 05:16, Penny Zheng wrote:
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: Tuesday, May 18, 2021 5:46 PM
>>>>
>>>> On 18/05/2021 06:21, Penny Zheng wrote:
>>>>> --- a/xen/include/asm-arm/mm.h
>>>>> +++ b/xen/include/asm-arm/mm.h
>>>>> @@ -88,7 +88,15 @@ struct page_info
>>>>>             */
>>>>>            u32 tlbflush_timestamp;
>>>>>        };
>>>>> -    u64 pad;
>>>>> +
>>>>> +    /* Page is reserved. */
>>>>> +    struct {
>>>>> +        /*
>>>>> +         * Reserved Owner of this page,
>>>>> +         * if this page is reserved to a specific domain.
>>>>> +         */
>>>>> +        struct domain *domain;
>>>>> +    } reserved;
>>>>
>>>> The space in page_info is quite tight, so I would like to avoid introducing new
>>>> fields unless we can't get away from it.
>>>>
>>>> In this case, it is not clear why we need to differentiate the "Owner"
>>>> vs the "Reserved Owner". It might be clearer if this change is folded in the
>>>> first user of the field.
>>>>
>>>> As an aside, for 32-bit Arm, you need to add a 4-byte padding.
>>>>
>>>
>>> Yeah, I may delete this change. I imported this change as considering the functionality
>>> of rebooting domain on static allocation.
>>>
>>> A little more discussion on rebooting domain on static allocation.
>>> Considering the major user cases for domain on static allocation
>>> are system has a total pre-defined, static behavior all the time. No domain allocation
>>> on runtime, while there still exists domain rebooting.
>>>
>>> And when rebooting domain on static allocation, all these reserved pages could
>>> not go back to heap when freeing them.  So I am considering to use one global
>>> `struct page_info*[DOMID]` value to store.
>>
>> Except such a separate array will consume quite a bit of space for
>> no real gain: v.free has 32 bits of padding space right now on
>> Arm64, so there's room for a domid_t there already. Even on Arm32
>> this could be arranged for, as I doubt "order" needs to be 32 bits
>> wide.
> 
> I agree we shouldn't need 32-bit to cover the "order". Although, I would 
> like to see any user reading the field before introducing it.

Of course, but I thought the plan was to mark static pages with their
designated domid, which would happen prior to domain creation. The
reader of the field would then naturally appear during domain creation.

Jan

