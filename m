Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE239F190
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 11:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138358.256150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXbk-0008B8-Uq; Tue, 08 Jun 2021 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138358.256150; Tue, 08 Jun 2021 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXbk-00088p-Qx; Tue, 08 Jun 2021 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 138358;
 Tue, 08 Jun 2021 09:01:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lqXbj-00088j-Pp
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 09:01:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqXbi-0003wo-N8; Tue, 08 Jun 2021 09:01:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqXbi-0006AQ-Gt; Tue, 08 Jun 2021 09:01:10 +0000
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
	bh=sYNKKRsF4QwM92yymEjl+Sx1Oz7F5yt3QzPcopckvPM=; b=lG6XAHhXaJFZ5hqppLRdVQsT4Y
	nYqoW7ikTcLvwt07Aw2uCmcO/kEaj2tXgkQS0Lxh4/GogH4/mmS/yuaJHQ+LTZK8l/qTJ3m0W0DFT
	8ZxcBY4LrJAnBUutcxB4I3OAgu/vp3h+3AInsPQBWs3llp1QLYFzpg0In9+GYv9zD9v0=;
Subject: Re: [PATCH] xen/grant-table: Simplify the update to the per-vCPU
 maptrack freelist
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210526152152.26251-1-julien@xen.org>
 <6748164b-ad38-d7d0-6abe-b5e393f7b9f3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e1acf0a1-81d1-5ed3-edb4-cf920cfbbc77@xen.org>
Date: Tue, 8 Jun 2021 10:01:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <6748164b-ad38-d7d0-6abe-b5e393f7b9f3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/05/2021 14:29, Jan Beulich wrote:
> On 26.05.2021 17:21, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since XSA-288 (commit 02cbeeb62075 "gnttab: split maptrack lock to make
> 
> XSA-228 I suppose?

Yes, I will update in the next version.

>> it fulfill its purpose again"), v->maptrack_head and v->maptrack_tail
>> are with the lock v->maptrack_freelist_lock held.
> 
> Nit: missing "accessed" or alike?
I have added "accessed".

> 
>> Therefore it is not necessary to update the fields using cmpxchg()
>> and also read them atomically.
> 
> Ah yes, very good observation. Should have noticed this back at the
> time, for an immediate follow-up change.
> 
>> Note that there are two cases where v->maptrack_tail is accessed without
>> the lock. They both happen _get_maptrack_handle() when the current vCPU
>> list is empty. Therefore there is no possible race.
> 
> I think you mean the other function here, without a leading underscore
> in its name. 

Hmmm... Yes. I will update it.

> And if you want to explain the absence of a race, wouldn't
> you then better also mention that the list can get initially filled
> only on the local vCPU?

Sure. I will reword it.

> 
>> I am not sure whether we should try to protect the remaining unprotected
>> access with the lock or maybe add a comment?
> 
> As per above I don't view adding locking as sensible. If you feel like
> adding a helpful comment, perhaps. I will admit that it took me more
> than just a moment to recall that "local vCPU only" argument.

I will try to come up with an helpful comment.

>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -543,34 +543,26 @@ double_gt_unlock(struct grant_table *lgt, struct grant_table *rgt)
>>   static inline grant_handle_t
>>   _get_maptrack_handle(struct grant_table *t, struct vcpu *v)
>>   {
>> -    unsigned int head, next, prev_head;
>> +    unsigned int head, next;
>>   
>>       spin_lock(&v->maptrack_freelist_lock);
>>   
>> -    do {
>> -        /* No maptrack pages allocated for this VCPU yet? */
>> -        head = read_atomic(&v->maptrack_head);
>> -        if ( unlikely(head == MAPTRACK_TAIL) )
>> -        {
>> -            spin_unlock(&v->maptrack_freelist_lock);
>> -            return INVALID_MAPTRACK_HANDLE;
> 
> Where did this and ...
> 
>> -        }
>> -
>> -        /*
>> -         * Always keep one entry in the free list to make it easier to
>> -         * add free entries to the tail.
>> -         */
>> -        next = read_atomic(&maptrack_entry(t, head).ref);
>> -        if ( unlikely(next == MAPTRACK_TAIL) )
>> -        {
>> -            spin_unlock(&v->maptrack_freelist_lock);
>> -            return INVALID_MAPTRACK_HANDLE;
> 
> ... this use of INVALID_MAPTRACK_HANDLE go? It is at present merely
> coincidence that INVALID_MAPTRACK_HANDLE == MAPTRACK_TAIL. If you
> want to fold them, you will need to do so properly (by eliminating
> one of the two constants). But I think they're separate on purpose.

Hmmm... Somehow I thought one was an alias to the other. But they are 
clearly not. I will update it on the next version.


> 
>> -        }
>> +    /* No maptrack pages allocated for this VCPU yet? */
>> +    head = v->maptrack_head;
>> +    if ( unlikely(head == MAPTRACK_TAIL) )
>> +        goto out;
>>   
>> -        prev_head = head;
>> -        head = cmpxchg(&v->maptrack_head, prev_head, next);
>> -    } while ( head != prev_head );
>> +    /*
>> +     * Always keep one entry in the free list to make it easier to
>> +     * add free entries to the tail.
>> +     */
>> +    next = read_atomic(&maptrack_entry(t, head).ref);
> 
> Since the lock protects the entire free list, why do you need to
> keep read_atomic() here?

Because I wasn't sure whether dropping {write, read}_atomic() when 
accessing the freelist would be fine.

Anyway, I can drop it in the next version.

> 
>> +    if ( unlikely(next == MAPTRACK_TAIL) )
>> +        head = MAPTRACK_TAIL;
>> +    else
>> +        v->maptrack_head = next;
>>   
>> +out:
> 
> Please indent labels by at least one blank, to avoid issues with
> diff's -p option. In fact if you didn't introduce a goto here in
> the first place, there'd be less code churn overall, as you'd
> need to alter the indentation of fewer lines.

I will have a look.

> 
>> @@ -623,7 +615,7 @@ put_maptrack_handle(
>>   {
>>       struct domain *currd = current->domain;
>>       struct vcpu *v;
>> -    unsigned int prev_tail, cur_tail;
>> +    unsigned int prev_tail;
>>   
>>       /* 1. Set entry to be a tail. */
>>       maptrack_entry(t, handle).ref = MAPTRACK_TAIL;
>> @@ -633,11 +625,8 @@ put_maptrack_handle(
>>   
>>       spin_lock(&v->maptrack_freelist_lock);
>>   
>> -    cur_tail = read_atomic(&v->maptrack_tail);
>> -    do {
>> -        prev_tail = cur_tail;
>> -        cur_tail = cmpxchg(&v->maptrack_tail, prev_tail, handle);
>> -    } while ( cur_tail != prev_tail );
>> +    prev_tail = v->maptrack_tail;
>> +    v->maptrack_tail = handle;
>>   
>>       /* 3. Update the old tail entry to point to the new entry. */
>>       write_atomic(&maptrack_entry(t, prev_tail).ref, handle);
> 
> Since the write_atomic() here can then also be converted, may I
> ask that you then rename the local variable to just "tail" as
> well?

Sure.

> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -255,7 +255,10 @@ struct vcpu
>>       /* VCPU paused by system controller. */
>>       int              controller_pause_count;
>>   
>> -    /* Grant table map tracking. */
>> +    /*
>> +     * Grant table map tracking. The lock maptrack_freelist_lock protect
> 
> Nit: protects

I will fix it.

> 
>> +     * the access to maptrack_head and maptrack_tail.
>> +     */
> 
> I'm inclined to suggest this doesn't need spelling out, considering ...
> 
>>       spinlock_t       maptrack_freelist_lock;
>>       unsigned int     maptrack_head;
>>       unsigned int     maptrack_tail;
> 
> ... both the name of the lock and its placement next to the two
> fields it protects. Also as per the docs change of the XSA-228 change,
> the lock protects more than just these two fields, so the comment may
> be misleading the way you have it now.

So I think it would be good to document above the lock what it actually 
protects. I agree this is fairly clear that it protect maptrack_{head, 
tail} but this wasn't very clear to me that it would also protect the 
content of the freelist (so read_atomic()/write_atomic() could be dropped).

I will try to come up with a better comment.

Cheers,

-- 
Julien Grall

