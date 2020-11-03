Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62722A3FE0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 10:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18059.42822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsWD-0002H8-3n; Tue, 03 Nov 2020 09:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18059.42822; Tue, 03 Nov 2020 09:22:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsWD-0002Gi-0O; Tue, 03 Nov 2020 09:22:21 +0000
Received: by outflank-mailman (input) for mailman id 18059;
 Tue, 03 Nov 2020 09:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E907=EJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kZsWB-0002Gb-R0
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:22:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9478bd21-64a1-4952-a7b0-0e2999bb0843;
 Tue, 03 Nov 2020 09:22:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BA9EB135;
 Tue,  3 Nov 2020 09:22:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=E907=EJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kZsWB-0002Gb-R0
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:22:19 +0000
X-Inumbo-ID: 9478bd21-64a1-4952-a7b0-0e2999bb0843
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 9478bd21-64a1-4952-a7b0-0e2999bb0843;
	Tue, 03 Nov 2020 09:22:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604395338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IiJdOQPz7XfvvSH6xuVZ0PEx+N5yh7XsTyq1HCQWm4=;
	b=JTaZU3a1rHV2JXgPspchjpKviKdR5cU7Sm6LxMIKqzyBtfJzpvAD33MdY1r/8Ewxehwspp
	BxNSejHYU4Ek05VP1psNPXybEdB6HDqgco+Us1nKpGH6boUgU7vMskBD9MMupFgbMnkkn6
	XT4GPUgLysH63tg3QeWHVukWWcX1tL8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4BA9EB135;
	Tue,  3 Nov 2020 09:22:18 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201102131239.14134-1-jgross@suse.com>
 <20201102131239.14134-3-jgross@suse.com>
 <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <890b6547-ca4f-b195-6b9d-9078ba35c357@suse.com>
Date: Tue, 3 Nov 2020 10:22:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.20 10:02, Jan Beulich wrote:
> On 02.11.2020 14:12, Juergen Gross wrote:
>> --- a/xen/include/xen/rwlock.h
>> +++ b/xen/include/xen/rwlock.h
>> @@ -56,6 +56,7 @@ static inline int _read_trylock(rwlock_t *lock)
>>       u32 cnts;
>>   
>>       preempt_disable();
>> +    check_lock(&lock->lock.debug, true);
>>       cnts = atomic_read(&lock->cnts);
>>       if ( likely(_can_read_lock(cnts)) )
>>       {
> 
> I'm sorry for being picky, but this still isn't matching
> _spin_trylock(). Perhaps the difference is really benign, but
> there the check sits ahead of preempt_disable(). (It has a
> clear reason to be this way there, but without a clear reason
> for things to be differently here, I think matching ordering
> may help, at least to avoid questions.)

I think this is more an optimization opportunity: I'd rather move the
preempt_disable() into the first if clause, as there is no need to
disable preemption in case the first read of the lock already leads
to failure acquiring the lock.

If you want I can prepend a patch doing that optimization.

> 
>> @@ -66,6 +67,7 @@ static inline int _read_trylock(rwlock_t *lock)
>>            */
>>           if ( likely(_can_read_lock(cnts)) )
>>               return 1;
>> +
>>           atomic_sub(_QR_BIAS, &lock->cnts);
>>       }
>>       preempt_enable();
> 
> Stray change?

Oh yes, a leftover from the old positioning of check_lock().

> 
>> @@ -87,7 +89,10 @@ static inline void _read_lock(rwlock_t *lock)
>>        * arch_lock_acquire_barrier().
>>        */
>>       if ( likely(_can_read_lock(cnts)) )
>> +    {
>> +        check_lock(&lock->lock.debug, false);
>>           return;
>> +    }
>>   
>>       /* The slowpath will decrement the reader count, if necessary. */
>>       queue_read_lock_slowpath(lock);
>> @@ -162,7 +167,10 @@ static inline void _write_lock(rwlock_t *lock)
>>        * arch_lock_acquire_barrier().
>>        */
>>       if ( atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) == 0 )
>> +    {
>> +        check_lock(&lock->lock.debug, false);
>>           return;
>> +    }
>>   
>>       queue_write_lock_slowpath(lock);
>>       /*
> 
> Maybe also for these two, but likely more importantly for ...
> 
>> @@ -328,6 +337,8 @@ static inline void _percpu_read_lock(percpu_rwlock_t **per_cpudata,
>>           /* Drop the read lock because we don't need it anymore. */
>>           read_unlock(&percpu_rwlock->rwlock);
>>       }
>> +    else
>> +        check_lock(&percpu_rwlock->rwlock.lock.debug, false);
>>   }
> 
> ... this one a brief comment may be warranted to clarify why
> the call sits here rather than at the top?

Okay.


Juergen

