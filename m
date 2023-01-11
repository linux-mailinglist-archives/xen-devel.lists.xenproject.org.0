Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EEF666249
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475689.737472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfF9-0002GC-II; Wed, 11 Jan 2023 17:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475689.737472; Wed, 11 Jan 2023 17:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFfF9-0002Da-F9; Wed, 11 Jan 2023 17:50:31 +0000
Received: by outflank-mailman (input) for mailman id 475689;
 Wed, 11 Jan 2023 17:50:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFfF8-0002DU-LZ
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:50:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfF8-0006u0-2H; Wed, 11 Jan 2023 17:50:30 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFfF7-0000UZ-Sw; Wed, 11 Jan 2023 17:50:30 +0000
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
	bh=sAeILFWTwtmh4b34OUGqh46wnnEdsZZkpDl1zLNmOog=; b=ox4ZhNHBLi2qpcwF7osKlnq+Dd
	2NtMsnlmRtSlvJvkz13HKdXVEn6P4n9DsuY7kEHO9dAY8EhgAu6pzlxz7GLz3aLPVTuQhJsgeMs6Q
	0kEmYUU+g6ugqizjq7MWPNvBu2ZVWgO438p2XXt60ewxb+GTtJpyKREyhqT9HDXe0ug8=;
Message-ID: <79a999c7-af1f-1cf2-6d01-ac70bdd1972d@xen.org>
Date: Wed, 11 Jan 2023 17:50:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 15/19] tools/xenstore: switch hashtable to use the
 talloc framework
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-16-jgross@suse.com>
 <b7cfd35b-97ef-42eb-eceb-7f07cd72268c@xen.org>
 <00c146ee-b0d4-55bd-3276-4894b26cd83c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <00c146ee-b0d4-55bd-3276-4894b26cd83c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/01/2023 09:27, Juergen Gross wrote:
> On 20.12.22 22:50, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 13/12/2022 16:00, Juergen Gross wrote:
>>> @@ -115,47 +117,32 @@ hashtable_expand(struct hashtable *h)
>>>       if (h->primeindex == (prime_table_length - 1)) return 0;
>>>       newsize = primes[++(h->primeindex)];
>>> -    newtable = (struct entry **)calloc(newsize, sizeof(struct entry*));
>>> -    if (NULL != newtable)
>>> +    newtable = talloc_realloc(h, h->table, struct entry *, newsize);
>>> +    if (!newtable)
>>>       {
>>> -        /* This algorithm is not 'stable'. ie. it reverses the list
>>> -         * when it transfers entries between the tables */
>>> -        for (i = 0; i < h->tablelength; i++) {
>>> -            while (NULL != (e = h->table[i])) {
>>> -                h->table[i] = e->next;
>>> -                index = indexFor(newsize,e->h);
>>> +        h->primeindex--;
>>> +        return 0;
>>> +    }
>>> +
>>> +    h->table = newtable;
>>> +    memset(newtable + h->tablelength, 0,
>>> +           (newsize - h->tablelength) * sizeof(*newtable));
>>> +    for (i = 0; i < h->tablelength; i++) {
>>
>> I understand this code is taken from the realloc path. However, isn't 
>> this algorithm also not stable? If so, then I think we move the 
>> comment here.
> 
> I'm fine with that, even if I don't see how it would matter. There is no
> guarantee regarding the order of entries for a given index.

That's a fair point. Feel free to ignore my comment then :).

>>> +            if (index == i)
>>> +            {
>>> +                pE = &(e->next);
>>> +            }
>>> +            else
>>> +            {
>>> +                *pE = e->next;
>>>                   e->next = newtable[index];
>>>                   newtable[index] = e;
>>>               }
>>>           }
>>> -        free(h->table);
>>> -        h->table = newtable;
>>> -    }
>>> -    /* Plan B: realloc instead */
>>> -    else
>>> -    {
>>> -        newtable = (struct entry **)
>>> -                   realloc(h->table, newsize * sizeof(struct entry *));
>>> -        if (NULL == newtable) { (h->primeindex)--; return 0; }
>>> -        h->table = newtable;
>>> -        memset(newtable + h->tablelength, 0,
>>> -               (newsize - h->tablelength) * sizeof(*newtable));
>>> -        for (i = 0; i < h->tablelength; i++) {
>>> -            for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
>>> -                index = indexFor(newsize,e->h);
>>> -                if (index == i)
>>> -                {
>>> -                    pE = &(e->next);
>>> -                }
>>> -                else
>>> -                {
>>> -                    *pE = e->next;
>>> -                    e->next = newtable[index];
>>> -                    newtable[index] = e;
>>> -                }
>>> -            }
>>> -        }
>>>       }
>>> +
>>>       h->tablelength = newsize;
>>>       h->loadlimit   = (unsigned int)
>>>           (((uint64_t)newsize * max_load_factor) / 100);
>>> @@ -184,7 +171,7 @@ hashtable_insert(struct hashtable *h, void *k, 
>>> void *v)
>>>            * element may be ok. Next time we insert, we'll try 
>>> expanding again.*/
>>>           hashtable_expand(h);
>>>       }
>>> -    e = (struct entry *)calloc(1, sizeof(struct entry));
>>> +    e = talloc_zero(h, struct entry);
>>>       if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
>>>       e->h = hash(h,k);
>>>       index = indexFor(h->tablelength,e->h);
>>> @@ -238,8 +225,8 @@ hashtable_remove(struct hashtable *h, void *k)
>>>               h->entrycount--;
>>>               v = e->v;
>>>               if (h->flags & HASHTABLE_FREE_KEY)
>>> -                free(e->k);
>>> -            free(e);
>>> +                talloc_free(e->k);
>>> +            talloc_free(e);
>>>               return v;
>>>           }
>>>           pE = &(e->next);
>>> @@ -280,25 +267,20 @@ void
>>>   hashtable_destroy(struct hashtable *h)
>>>   {
>>>       unsigned int i;
>>> -    struct entry *e, *f;
>>> +    struct entry *e;
>>>       struct entry **table = h->table;
>>>       for (i = 0; i < h->tablelength; i++)
>>>       {
>>> -        e = table[i];
>>> -        while (NULL != e)
>>> +        for (e = table[i]; e; e = e->next)
>>>           {
>>> -            f = e;
>>> -            e = e->next;
>>>               if (h->flags & HASHTABLE_FREE_KEY)
>>> -                free(f->k);
>>> +                talloc_free(e->k);
>>>               if (h->flags & HASHTABLE_FREE_VALUE)
>>> -                free(f->v);
>>> -            free(f);
>>
>> AFAIU, the loop is reworked so you let talloc to free each element 
>> with the parent. Using a while loop is definitely cleaner, but now you 
>> will end up to have two separate loop for the elements.
>>
>> There is a risk that the overall performance of hashtable_destroy() 
>> will be worse as the data accessed in one loop may not fit in the 
>> cache. So you will have to reload it on the second loop.
>>
>> Therefore, I think it would be better to keep the loop as-is.
> 
> What about a completely different approach? I could make the key and value
> talloc children of e when _inserting_ the element and the related flag is
> set. This would reduce hashtable_destroy to a single talloc_free().

I am fine with that.

Cheers,

-- 
Julien Grall

