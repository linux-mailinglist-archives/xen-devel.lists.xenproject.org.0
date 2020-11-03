Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63262A417B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18183.43066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtN9-0000bf-PD; Tue, 03 Nov 2020 10:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18183.43066; Tue, 03 Nov 2020 10:17:03 +0000
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
	id 1kZtN9-0000bG-LW; Tue, 03 Nov 2020 10:17:03 +0000
Received: by outflank-mailman (input) for mailman id 18183;
 Tue, 03 Nov 2020 10:17:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E907=EJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kZtN8-0000bB-W2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:17:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 336011dc-13d0-411d-bacc-db1ba8ef08e8;
 Tue, 03 Nov 2020 10:17:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 407E3B1BC;
 Tue,  3 Nov 2020 10:17:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=E907=EJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kZtN8-0000bB-W2
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:17:03 +0000
X-Inumbo-ID: 336011dc-13d0-411d-bacc-db1ba8ef08e8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 336011dc-13d0-411d-bacc-db1ba8ef08e8;
	Tue, 03 Nov 2020 10:17:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604398621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ync/xtTvyKL1xtcqWVxnTWrnpg8DkQp4LxfeelTDEb8=;
	b=ZIHJU0TfGGH/yQtgQ187tflRUfypkYWsTJjhzzqiJa81rarQx3I2O21bnYlHw7XQnsPyXT
	CAe3j1geaNtiiXffrRTNPfrFZS6TaRTWaK39YXgdPikpgewQlF5+f4AbdRkbnOLbjNxTQl
	Lg+DMQwfuR6UjoQeNXCtydvGVA1Ioqk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 407E3B1BC;
	Tue,  3 Nov 2020 10:17:01 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201102131239.14134-1-jgross@suse.com>
 <20201102131239.14134-3-jgross@suse.com>
 <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
 <890b6547-ca4f-b195-6b9d-9078ba35c357@suse.com>
 <fe41300c-3013-73ae-7ffa-7cd36705d0c2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4e0d3709-1a0a-4dbd-436d-b22a4736ac0d@suse.com>
Date: Tue, 3 Nov 2020 11:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fe41300c-3013-73ae-7ffa-7cd36705d0c2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.11.20 11:04, Jan Beulich wrote:
> On 03.11.2020 10:22, Jürgen Groß wrote:
>> On 03.11.20 10:02, Jan Beulich wrote:
>>> On 02.11.2020 14:12, Juergen Gross wrote:
>>>> --- a/xen/include/xen/rwlock.h
>>>> +++ b/xen/include/xen/rwlock.h
>>>> @@ -56,6 +56,7 @@ static inline int _read_trylock(rwlock_t *lock)
>>>>        u32 cnts;
>>>>    
>>>>        preempt_disable();
>>>> +    check_lock(&lock->lock.debug, true);
>>>>        cnts = atomic_read(&lock->cnts);
>>>>        if ( likely(_can_read_lock(cnts)) )
>>>>        {
>>>
>>> I'm sorry for being picky, but this still isn't matching
>>> _spin_trylock(). Perhaps the difference is really benign, but
>>> there the check sits ahead of preempt_disable(). (It has a
>>> clear reason to be this way there, but without a clear reason
>>> for things to be differently here, I think matching ordering
>>> may help, at least to avoid questions.)
>>
>> I think this is more an optimization opportunity: I'd rather move the
>> preempt_disable() into the first if clause, as there is no need to
>> disable preemption in case the first read of the lock already leads
>> to failure acquiring the lock.
>>
>> If you want I can prepend a patch doing that optimization.
> 
> I'd appreciate you doing so, yet I'd like to point out that
> then the same question remains for _write_trylock(). Perhaps
> a similar transformation is possible there, but it'll at
> least be more code churn. Which of course isn't a reason not
> to go this route there too.

Shouldn't be very hard. It would just need to split the if clause
into two clauses.

> This said - wouldn't what you suggest be wrong if we had
> actual preemption in the hypervisor? Preemption hitting
> between e.g. these two lines
> 
>      cnts = atomic_read(&lock->cnts);
>      if ( likely(_can_read_lock(cnts)) )
> 
> would not yield the intended result, would it? (It wouldn't
> affect correctness afaics, because the caller has to be
> prepared anyway that the attempt fails, but the amount of
> effectively false negatives would grow, as would the number
> of cases where the slower path is taken for no reason.)

And this in turn would hit _spin_trylock() the same way.

IMO we should harmonize all the trylock variants in this regard:
either they have an as small as possible preemption disabled
section or they have the initial test for success being possible
at all in this section.

> Question therefore is how much we care about keeping code
> ready for "real" preemption, when we have ample other places
> that would need changing first, before such could be enabled.

Yes. And depending on the answer the route to go (wide or narrow
no-preemption section) wither the rwlock or the spinlock trylock
variants should be adapted.


Juergen

