Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D701C2D745A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50403.89058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kng71-0002S3-LW; Fri, 11 Dec 2020 10:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50403.89058; Fri, 11 Dec 2020 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kng71-0002Re-ID; Fri, 11 Dec 2020 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 50403;
 Fri, 11 Dec 2020 10:57:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kng70-0002RZ-2T
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:57:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kng6z-00033w-98; Fri, 11 Dec 2020 10:57:21 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kng6y-0008Q5-UC; Fri, 11 Dec 2020 10:57:21 +0000
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
	bh=ikNlRQpmBNuZOebDCi85Oyf+XUjW1ufYuBgwijt74HE=; b=YOB+seYxdEv+7XuAuLaz8z0hO7
	E50OGv0RVIv6cFSz+W7ubLUlF4xEkLB7cOQMHQ+Hw57kbpY/QjEn228ux3jlR6O0gWd4rpfBH621y
	UscS/9qIIubXNgoKnJzbBArS5tYGovDV52v8WPet5DXYGBNzHjSRmsm+arpvz8wDncjo=;
Subject: Re: [PATCH v3 4/5] evtchn: convert domain event lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
 <074be931-54b0-1b0f-72d8-5bd577884814@xen.org>
 <6e34fd25-14a2-f655-b019-aca94ce086c8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <55dc24b4-88c6-1b22-411e-267231632377@xen.org>
Date: Fri, 11 Dec 2020 10:57:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6e34fd25-14a2-f655-b019-aca94ce086c8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/12/2020 10:32, Jan Beulich wrote:
> On 09.12.2020 12:54, Julien Grall wrote:
>> On 23/11/2020 13:29, Jan Beulich wrote:
>>> @@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
>>>        long           rc = 0;
>>>    
>>>     again:
>>> -    spin_lock(&d1->event_lock);
>>> +    write_lock(&d1->event_lock);
>>>    
>>>        if ( !port_is_valid(d1, port1) )
>>>        {
>>> @@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
>>>                    BUG();
>>>    
>>>                if ( d1 < d2 )
>>> -            {
>>> -                spin_lock(&d2->event_lock);
>>> -            }
>>> +                read_lock(&d2->event_lock);
>>
>> This change made me realized that I don't quite understand how the
>> rwlock is meant to work for event_lock. I was actually expecting this to
>> be a write_lock() given there are state changed in the d2 events.
> 
> Well, the protection needs to be against racing changes, i.e.
> parallel invocations of this same function, or evtchn_close().
> It is debatable whether evtchn_status() and
> domain_dump_evtchn_info() would better also be locked out
> (other read_lock() uses aren't applicable to interdomain
> channels).
> 
>> Could you outline how a developper can find out whether he/she should
>> use read_lock or write_lock?
> 
> I could try to, but it would again be a port type dependent
> model, just like for the per-channel locks.

It is quite important to have clear locking strategy (in particular 
rwlock) so we can make correct decision when to use read_lock or write_lock.

> So I'd like it to
> be clarified first whether you aren't instead indirectly
> asking for these to become write_lock()

Well, I don't understand why this is a read_lock() (even with your 
previous explanation). I am not suggesting to switch to a write_lock(), 
but instead asking for the reasoning behind the decision.

>>> --- a/xen/common/rwlock.c
>>> +++ b/xen/common/rwlock.c
>>> @@ -102,6 +102,14 @@ void queue_write_lock_slowpath(rwlock_t
>>>        spin_unlock(&lock->lock);
>>>    }
>>>    
>>> +void _rw_barrier(rwlock_t *lock)
>>> +{
>>> +    check_barrier(&lock->lock.debug);
>>> +    smp_mb();
>>> +    while ( _rw_is_locked(lock) )
>>> +        arch_lock_relax();
>>> +    smp_mb();
>>> +}
>>
>> As I pointed out when this implementation was first proposed (see [1]),
>> there is a risk that the loop will never exit.
> 
> The [1] reference was missing, but I recall you saying so.
> 
>> I think the following implementation would be better (although it is ugly):
>>
>> write_lock();
>> /* do nothing */
>> write_unlock();
>>
>> This will act as a barrier between lock held before and after the call.
> 
> Right, and back then I indicated agreement. When getting to
> actually carry out the change, I realized though that then the less
> restrictive check_barrier() can't be used anymore (or to be precise,
> it could be used, but the stronger check_lock() would subsequently
> still come into play). This isn't a problem here, but would be for
> any IRQ-safe r/w lock that the barrier may want to be used on down
> the road.
> 
> Thinking about it, a read_lock() / read_unlock() pair would suffice
> though. But this would then still have check_lock() involved.
> 
> Given all of this, maybe it's better not to introduce the function
> at all and instead open-code the read_lock() / read_unlock() pair at
> the use site.

IIUC, the read_lock() would be sufficient because we only care about 
"write" side and not read. Is that correct?

> 
>> As an aside, I think the introduction of rw_barrier() deserve to be a in
>> separate patch to help the review.
> 
> I'm aware there are differing views on this - to me, putting this in
> a separate patch would be introduction of dead code. 

This is only dead code if we decide to not use rw_barrier() :).

The idea behind introducing rw_barrier() in its own patch is so you can 
explanation why it was implemented like that. Arguably, this explanation 
can be added in the same patch...

There are other added benefits such as making a hint to the reviewer 
that this part will require more careful review. I am sure one will say 
that reviewer should always be careful...

But, personally, my level of carefulness will depend on the author and 
the type of the patch.

Anyway, I am happy with the open-coded version with an explanation in 
the code/commit message.

Cheers,

-- 
Julien Grall

