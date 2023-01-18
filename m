Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B36717A4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480264.744560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4is-0003DU-6C; Wed, 18 Jan 2023 09:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480264.744560; Wed, 18 Jan 2023 09:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4is-0003Ag-3V; Wed, 18 Jan 2023 09:27:10 +0000
Received: by outflank-mailman (input) for mailman id 480264;
 Wed, 18 Jan 2023 09:27:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI4iq-0003AZ-Os
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:27:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4ip-00043T-J7; Wed, 18 Jan 2023 09:27:07 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4ip-0004DA-CL; Wed, 18 Jan 2023 09:27:07 +0000
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
	bh=ysZ+6AbGTIF80D+AAL/x+UMQurAtnggkUPKFAaJXd1U=; b=mWLuhS93HyHivuMyDvZRj02a9W
	Ru75Rpa+1Z+bIUXGyjWnkMMajYoHAXEbQ7AVTtNuiBB1/EdT57beSTzs0Zs0o5xfkPd5eYSy0zaPp
	WLk8rmv5hLlt7D+na/RPlMHCRMXN7PPUSdxUO/FnosYU9tpWFrMKRxuBAslnoIG8XLP8=;
Message-ID: <ba1812f1-0def-fdc5-d3d9-3b9ec0d1a805@xen.org>
Date: Wed, 18 Jan 2023 09:27:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 12/17] tools/xenstore: don't let hashtable_remove()
 return the removed value
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-13-jgross@suse.com>
 <19a0c39c-31b3-ce9c-6f03-466b6109b88f@xen.org>
 <fb160e56-8a6a-85fd-0140-ae25322479c7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fb160e56-8a6a-85fd-0140-ae25322479c7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/01/2023 06:17, Juergen Gross wrote:
> On 17.01.23 23:03, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 17/01/2023 09:11, Juergen Gross wrote:
>>> Letting hashtable_remove() return the value of the removed element is
>>> not used anywhere in Xenstore, and it conflicts with a hashtable
>>> created specifying the HASHTABLE_FREE_VALUE flag.
>>>
>>> So just drop returning the value.
>>
>> Any reason this can't be void? If there are, then I would consider to 
>> return a bool as the return can only be 2 values.
> 
> I think you are right. Switching to void should be fine.
> 
>>
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V3:
>>> - new patch
>>> ---
>>>   tools/xenstore/hashtable.c | 10 +++++-----
>>>   tools/xenstore/hashtable.h |  4 ++--
>>>   2 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
>>> index 299549c51e..6738719e47 100644
>>> --- a/tools/xenstore/hashtable.c
>>> +++ b/tools/xenstore/hashtable.c
>>> @@ -214,7 +214,7 @@ hashtable_search(struct hashtable *h, void *k)
>>>   }
>>>   
>>> /*****************************************************************************/
>>> -void * /* returns value associated with key */
>>> +int
>>>   hashtable_remove(struct hashtable *h, void *k)
>>>   {
>>>       /* TODO: consider compacting the table when the load factor 
>>> drops enough,
>>> @@ -222,7 +222,6 @@ hashtable_remove(struct hashtable *h, void *k)
>>>       struct entry *e;
>>>       struct entry **pE;
>>> -    void *v;
>>>       unsigned int hashvalue, index;
>>>       hashvalue = hash(h,k);
>>> @@ -236,16 +235,17 @@ hashtable_remove(struct hashtable *h, void *k)
>>>           {
>>>               *pE = e->next;
>>>               h->entrycount--;
>>> -            v = e->v;
>>>               if (h->flags & HASHTABLE_FREE_KEY)
>>>                   free(e->k);
>>> +            if (h->flags & HASHTABLE_FREE_VALUE)
>>> +                free(e->v);
>>
>> I don't quite understand how this change is related to this patch.
> 
> With not returning the value pointer any longer there would be no way
> for the caller to free it, so it must be freed by hashtable_remove()
> if the related flag was set.

That makes sense now. Thanks for the explanation.

> 
> I can add a sentence to the commit message.

Yes please.

The rest of this patch looks good to me.

Cheers,

-- 
Julien Grall

