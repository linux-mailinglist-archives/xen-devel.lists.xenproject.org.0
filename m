Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E832D73F0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50343.88960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfjI-0007vi-Od; Fri, 11 Dec 2020 10:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50343.88960; Fri, 11 Dec 2020 10:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfjI-0007vM-La; Fri, 11 Dec 2020 10:32:52 +0000
Received: by outflank-mailman (input) for mailman id 50343;
 Fri, 11 Dec 2020 10:32:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9HZb=FP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1knfjH-0007vG-8I
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:32:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00046348-9ca6-4994-bafd-9171c6227e53;
 Fri, 11 Dec 2020 10:32:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3397AE30;
 Fri, 11 Dec 2020 10:32:47 +0000 (UTC)
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
X-Inumbo-ID: 00046348-9ca6-4994-bafd-9171c6227e53
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607682767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0V2lVIbqbq9QYvDmJ9XN2D3RTwxAY+d7SpZ+n/u/Xkw=;
	b=kZfVF57fwQJPdXwoJ/AqRG9lDWpctHgu2OfC5PXnNFefgjwqlFd3Nc7jZwsCLVONf391DW
	pTDjNRDp6UmJs4oAti7D2YbQV723YOaHevNO5fG0Go9b/JwHDy5+OHzjrf535QK1NxGeUz
	gRPa7TW+UDVZ5HSb0E73gQQ/FD5/Jxg=
Subject: Re: [PATCH v3 4/5] evtchn: convert domain event lock to an r/w one
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
 <074be931-54b0-1b0f-72d8-5bd577884814@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e34fd25-14a2-f655-b019-aca94ce086c8@suse.com>
Date: Fri, 11 Dec 2020 11:32:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <074be931-54b0-1b0f-72d8-5bd577884814@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 12:54, Julien Grall wrote:
> On 23/11/2020 13:29, Jan Beulich wrote:
>> @@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
>>       long           rc = 0;
>>   
>>    again:
>> -    spin_lock(&d1->event_lock);
>> +    write_lock(&d1->event_lock);
>>   
>>       if ( !port_is_valid(d1, port1) )
>>       {
>> @@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
>>                   BUG();
>>   
>>               if ( d1 < d2 )
>> -            {
>> -                spin_lock(&d2->event_lock);
>> -            }
>> +                read_lock(&d2->event_lock);
> 
> This change made me realized that I don't quite understand how the 
> rwlock is meant to work for event_lock. I was actually expecting this to 
> be a write_lock() given there are state changed in the d2 events.

Well, the protection needs to be against racing changes, i.e.
parallel invocations of this same function, or evtchn_close().
It is debatable whether evtchn_status() and
domain_dump_evtchn_info() would better also be locked out
(other read_lock() uses aren't applicable to interdomain
channels).

> Could you outline how a developper can find out whether he/she should 
> use read_lock or write_lock?

I could try to, but it would again be a port type dependent
model, just like for the per-channel locks. So I'd like it to
be clarified first whether you aren't instead indirectly
asking for these to become write_lock().

>> --- a/xen/common/rwlock.c
>> +++ b/xen/common/rwlock.c
>> @@ -102,6 +102,14 @@ void queue_write_lock_slowpath(rwlock_t
>>       spin_unlock(&lock->lock);
>>   }
>>   
>> +void _rw_barrier(rwlock_t *lock)
>> +{
>> +    check_barrier(&lock->lock.debug);
>> +    smp_mb();
>> +    while ( _rw_is_locked(lock) )
>> +        arch_lock_relax();
>> +    smp_mb();
>> +}
> 
> As I pointed out when this implementation was first proposed (see [1]), 
> there is a risk that the loop will never exit.

The [1] reference was missing, but I recall you saying so.

> I think the following implementation would be better (although it is ugly):
> 
> write_lock();
> /* do nothing */
> write_unlock();
> 
> This will act as a barrier between lock held before and after the call.

Right, and back then I indicated agreement. When getting to
actually carry out the change, I realized though that then the less
restrictive check_barrier() can't be used anymore (or to be precise,
it could be used, but the stronger check_lock() would subsequently
still come into play). This isn't a problem here, but would be for
any IRQ-safe r/w lock that the barrier may want to be used on down
the road.

Thinking about it, a read_lock() / read_unlock() pair would suffice
though. But this would then still have check_lock() involved.

Given all of this, maybe it's better not to introduce the function
at all and instead open-code the read_lock() / read_unlock() pair at
the use site.

> As an aside, I think the introduction of rw_barrier() deserve to be a in 
> separate patch to help the review.

I'm aware there are differing views on this - to me, putting this in
a separate patch would be introduction of dead code. But as per
above maybe the function now won't get introduced anymore anyway.

Jan

