Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67674762F93
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 10:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570184.891742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZlE-0006At-5i; Wed, 26 Jul 2023 08:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570184.891742; Wed, 26 Jul 2023 08:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZlE-00068P-2Y; Wed, 26 Jul 2023 08:20:44 +0000
Received: by outflank-mailman (input) for mailman id 570184;
 Wed, 26 Jul 2023 08:20:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOZlC-00068J-B4
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 08:20:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOZlB-0004HR-D6; Wed, 26 Jul 2023 08:20:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOZlB-0007uY-70; Wed, 26 Jul 2023 08:20:41 +0000
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
	bh=W0DJyua12lvqbd3sCYRyDdR+9JCOG3MY4JRuZHDUj+I=; b=G8bM+Oz0XYsxiDpdt13Lux0jMN
	IdA9w8thgki/4/7YkSX6/CELt6ggqbgDGsBIYx1/htU4CpQchrl1CmKtuEDYhJ55q9tkHWo1YkMH0
	aC3NTcsv0lCq7cetIhQ+4G2po7RfWIsmJYq3wS2SKIDyy6VG0ZJpihtzHDDhjo2COr5k=;
Message-ID: <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
Date: Wed, 26 Jul 2023 09:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
 <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 26/07/2023 07:19, Juergen Gross wrote:
> On 25.07.23 18:08, Julien Grall wrote:
>> Hi,
>>
>> On 24/07/2023 12:02, Juergen Gross wrote:
>>> The key and value are never modified by hashtable code, so they should
>>> be marked as const.
>>
>> You wrote this but...
>>
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V3:
>>> - make value const, too.
>>> ---
>>>   tools/xenstore/hashtable.c | 7 ++++---
>>>   tools/xenstore/hashtable.h | 4 ++--
>>>   2 files changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
>>> index 11f6bf8f15..670dc01003 100644
>>> --- a/tools/xenstore/hashtable.c
>>> +++ b/tools/xenstore/hashtable.c
>>> @@ -11,7 +11,8 @@
>>>   struct entry
>>>   {
>>> -    void *k, *v;
>>> +    const void *k;
>>> +    void *v;
>>
>>
>> ... this is not const and ...
>>
>>>       unsigned int h;
>>>       struct entry *next;
>>>   };
>>> @@ -140,7 +141,7 @@ static int hashtable_expand(struct hashtable *h)
>>>       return 0;
>>>   }
>>> -int hashtable_add(struct hashtable *h, void *k, void *v)
>>> +int hashtable_add(struct hashtable *h, const void *k, const void *v)
>>>   {
>>>       /* This method allows duplicate keys - but they shouldn't be 
>>> used */
>>>       unsigned int index;
>>> @@ -164,7 +165,7 @@ int hashtable_add(struct hashtable *h, void *k, 
>>> void *v)
>>>       e->k = k;
>>>       if (h->flags & HASHTABLE_FREE_KEY)
>>>           talloc_steal(e, k);
>>> -    e->v = v;
>>> +    e->v = (void *)v;
>>
>> ... you cast-away the const here. I think this is a pretty bad idea.
>>
>> Can you clarify why you are doing like that?
> 
> The value is never changed by the hashtable code, but it might be 
> changed by
> e.g. a caller of hashtable_search() (see e.g. callers of 
> find_domain_struct()).
> 
> Somewhere I need to cast the const away. I could do so in 
> hashtable_search()
> in case you prefer me to do so.

My problem is not with the placement of the const but the fact you are 
removing the const.

I agree that the hashtable code is not meant to modify the content. 
However, as you wrote, the caller of hashtable_search() could modify the 
content. So, for me, the value should not be const in the hashtable code.

To give a concrete example, with the current interface we are telling 
the user that what they store in the hashtable can be modified at some 
point. By adding 'const' for the value in hashtable_add(), we can 
mislead a user to think it is fine to store static string, yet this is 
not enforced all the way through. So one could mistakenly think that 
values returned hashtable_search() can be modified. And the compiler 
will not be here to help enforcing it because you cast-away the const.

Do you have any code in this series that requires the 'const' in 
hashtable_add()? If so, can you point me to the patch and I will have a 
look?

If not, then I will strongly argue that this should be dropped because 
dropping a const is always a recipe for disaster.

Cheers,

-- 
Julien Grall

