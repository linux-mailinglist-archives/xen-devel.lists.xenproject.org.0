Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F3388B0B
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 11:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129974.243732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljIpf-0004wn-8k; Wed, 19 May 2021 09:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129974.243732; Wed, 19 May 2021 09:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljIpf-0004uw-5W; Wed, 19 May 2021 09:49:39 +0000
Received: by outflank-mailman (input) for mailman id 129974;
 Wed, 19 May 2021 09:49:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljIpd-0004uf-J2
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 09:49:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f0cb2e-dcec-4e9f-817b-4a7474c82bf9;
 Wed, 19 May 2021 09:49:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 633B8AEFF;
 Wed, 19 May 2021 09:49:35 +0000 (UTC)
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
X-Inumbo-ID: d7f0cb2e-dcec-4e9f-817b-4a7474c82bf9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621417775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4LUYUhWxvpW3Gf1BFqwEtTorA2UD3yBZdhvlhtZSnc=;
	b=W7SzwF/67jqePExDPBHCsjTFyL3VHO66PzLMijMpIQfTj5DHwhyNFTgC4RTigoXzlglP9J
	7s5jAbc57awYfC/8iczlByW8auNssjUztcdOILGAcvQg+jdpsj1c+sIRKndUTq+4Jhe66p
	oIr8ryzC8CkAlxI/k2jxAMyk+9/JzPU=
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>, Julien Grall <julien@xen.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e22e4de-0d09-5195-bd8f-2ca326264807@suse.com>
Date: Wed, 19 May 2021 11:49:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.05.2021 05:16, Penny Zheng wrote:
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, May 18, 2021 5:46 PM
>>
>> On 18/05/2021 06:21, Penny Zheng wrote:
>>> --- a/xen/include/asm-arm/mm.h
>>> +++ b/xen/include/asm-arm/mm.h
>>> @@ -88,7 +88,15 @@ struct page_info
>>>            */
>>>           u32 tlbflush_timestamp;
>>>       };
>>> -    u64 pad;
>>> +
>>> +    /* Page is reserved. */
>>> +    struct {
>>> +        /*
>>> +         * Reserved Owner of this page,
>>> +         * if this page is reserved to a specific domain.
>>> +         */
>>> +        struct domain *domain;
>>> +    } reserved;
>>
>> The space in page_info is quite tight, so I would like to avoid introducing new
>> fields unless we can't get away from it.
>>
>> In this case, it is not clear why we need to differentiate the "Owner"
>> vs the "Reserved Owner". It might be clearer if this change is folded in the
>> first user of the field.
>>
>> As an aside, for 32-bit Arm, you need to add a 4-byte padding.
>>
> 
> Yeah, I may delete this change. I imported this change as considering the functionality
> of rebooting domain on static allocation. 
> 
> A little more discussion on rebooting domain on static allocation. 
> Considering the major user cases for domain on static allocation
> are system has a total pre-defined, static behavior all the time. No domain allocation
> on runtime, while there still exists domain rebooting.
> 
> And when rebooting domain on static allocation, all these reserved pages could
> not go back to heap when freeing them.  So I am considering to use one global
> `struct page_info*[DOMID]` value to store.

Except such a separate array will consume quite a bit of space for
no real gain: v.free has 32 bits of padding space right now on
Arm64, so there's room for a domid_t there already. Even on Arm32
this could be arranged for, as I doubt "order" needs to be 32 bits
wide.

Jan

