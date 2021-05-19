Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9F389704
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 21:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130392.244301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSCV-0002LW-El; Wed, 19 May 2021 19:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130392.244301; Wed, 19 May 2021 19:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljSCV-0002Is-Bm; Wed, 19 May 2021 19:49:51 +0000
Received: by outflank-mailman (input) for mailman id 130392;
 Wed, 19 May 2021 19:49:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljSCU-0002Im-9l
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:49:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSCU-00010Y-4Q; Wed, 19 May 2021 19:49:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljSCT-00028C-UW; Wed, 19 May 2021 19:49:50 +0000
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
	bh=GHeoP0Y3rWLOwI+tggXR5A1dWN2Rrxh0BUjn04x36zc=; b=k+xVproAt6YE0+UsRGvdJ+NB12
	5FzIAVhqzY6OcMhN3hQlr1rI7h9HZRwPIrauV4nQwV60U2F8f7fJBT92vV1nEprSSd+EgK86jOa7U
	Hx4InE75E1AkIV3e+6ZpGhyy0WhUTo9Pr0y/fJoulVmgYChB5x9zyQ1mRsOkRXWY70rU=;
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <9e22e4de-0d09-5195-bd8f-2ca326264807@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <765312c9-3b71-eb3a-5c8d-2ba0aa019595@xen.org>
Date: Wed, 19 May 2021 20:49:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <9e22e4de-0d09-5195-bd8f-2ca326264807@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/05/2021 10:49, Jan Beulich wrote:
> On 19.05.2021 05:16, Penny Zheng wrote:
>>> From: Julien Grall <julien@xen.org>
>>> Sent: Tuesday, May 18, 2021 5:46 PM
>>>
>>> On 18/05/2021 06:21, Penny Zheng wrote:
>>>> --- a/xen/include/asm-arm/mm.h
>>>> +++ b/xen/include/asm-arm/mm.h
>>>> @@ -88,7 +88,15 @@ struct page_info
>>>>             */
>>>>            u32 tlbflush_timestamp;
>>>>        };
>>>> -    u64 pad;
>>>> +
>>>> +    /* Page is reserved. */
>>>> +    struct {
>>>> +        /*
>>>> +         * Reserved Owner of this page,
>>>> +         * if this page is reserved to a specific domain.
>>>> +         */
>>>> +        struct domain *domain;
>>>> +    } reserved;
>>>
>>> The space in page_info is quite tight, so I would like to avoid introducing new
>>> fields unless we can't get away from it.
>>>
>>> In this case, it is not clear why we need to differentiate the "Owner"
>>> vs the "Reserved Owner". It might be clearer if this change is folded in the
>>> first user of the field.
>>>
>>> As an aside, for 32-bit Arm, you need to add a 4-byte padding.
>>>
>>
>> Yeah, I may delete this change. I imported this change as considering the functionality
>> of rebooting domain on static allocation.
>>
>> A little more discussion on rebooting domain on static allocation.
>> Considering the major user cases for domain on static allocation
>> are system has a total pre-defined, static behavior all the time. No domain allocation
>> on runtime, while there still exists domain rebooting.
>>
>> And when rebooting domain on static allocation, all these reserved pages could
>> not go back to heap when freeing them.  So I am considering to use one global
>> `struct page_info*[DOMID]` value to store.
> 
> Except such a separate array will consume quite a bit of space for
> no real gain: v.free has 32 bits of padding space right now on
> Arm64, so there's room for a domid_t there already. Even on Arm32
> this could be arranged for, as I doubt "order" needs to be 32 bits
> wide.

I agree we shouldn't need 32-bit to cover the "order". Although, I would 
like to see any user reading the field before introducing it.

Cheers,

-- 
Julien Grall

