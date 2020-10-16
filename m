Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF142904C0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 14:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8054.21437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTOYH-0007SI-DF; Fri, 16 Oct 2020 12:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8054.21437; Fri, 16 Oct 2020 12:09:41 +0000
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
	id 1kTOYH-0007Rt-9p; Fri, 16 Oct 2020 12:09:41 +0000
Received: by outflank-mailman (input) for mailman id 8054;
 Fri, 16 Oct 2020 12:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTOYE-0007Rg-WD
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:09:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 294377e8-71c1-4e0a-a4ea-1c458f112663;
 Fri, 16 Oct 2020 12:09:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AFF8ADC2;
 Fri, 16 Oct 2020 12:09:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTOYE-0007Rg-WD
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:09:39 +0000
X-Inumbo-ID: 294377e8-71c1-4e0a-a4ea-1c458f112663
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 294377e8-71c1-4e0a-a4ea-1c458f112663;
	Fri, 16 Oct 2020 12:09:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602850176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lviW8b5HNZW/WCv+CuAMlTXf2AzD76bGJTDfpVbQgnI=;
	b=X39xD7EBMHywMNKf8LNG4WQLBuWZ3qn+vuOOYUZ4KVSBKZ7tKKHo3VlkvDkIEl/BFNhAKP
	xccLpDGZPpmBUgzoTFN9twqatAwuzPbKrpzBxHQJUOdztEKQGpzQmkZOs30bfAwsh55mdv
	YlXFmsQfLQr0FY0es5nuveAD7bHBYlA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6AFF8ADC2;
	Fri, 16 Oct 2020 12:09:36 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
 <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
 <821a77d3-7e37-d1d2-d904-94db0177893a@suse.com>
 <350a5738-b239-e36b-59aa-05b8f86648b8@suse.com>
 <548f80a9-0fa3-cd9e-ec44-5cd37d98eadc@xen.org>
 <4f4ecc8d-f5d2-81e9-1615-0f2925b928ba@suse.com>
 <4b77ba6d-bf49-7286-8f2a-53f7b2e7d122@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4eb073bb-67ca-5376-bae1-e555d3c5fb30@suse.com>
Date: Fri, 16 Oct 2020 14:09:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <4b77ba6d-bf49-7286-8f2a-53f7b2e7d122@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.10.2020 11:36, Julien Grall wrote:
> On 15/10/2020 13:07, Jan Beulich wrote:
>> On 14.10.2020 13:40, Julien Grall wrote:
>>> On 13/10/2020 15:26, Jan Beulich wrote:
>>>> On 13.10.2020 16:20, Jürgen Groß wrote:
>>>>> Especially Julien was rather worried by the current situation. In
>>>>> case you can convince him the current handling is fine, we can
>>>>> easily drop this patch.
>>>>
>>>> Julien, in the light of the above - can you clarify the specific
>>>> concerns you (still) have?
>>>
>>> Let me start with that the assumption if evtchn->lock is not held when
>>> evtchn_fifo_set_pending() is called. If it is held, then my comment is moot.
>>
>> But this isn't interesting - we know there are paths where it is
>> held, and ones (interdomain sending) where it's the remote port's
>> lock instead which is held. What's important here is that a
>> _consistent_ lock be held (but it doesn't need to be evtchn's).
> 
> Yes, a _consistent_ lock *should* be sufficient. But it is better to use 
> the same lock everywhere so it is easier to reason (see more below).

But that's already not the case, due to the way interdomain channels
have events sent. You did suggest acquiring both locks, but as
indicated at the time I think this goes too far. As far as the doc
aspect - we can improve the situation. Iirc it was you who made me
add the respective comment ahead of struct evtchn_port_ops.

>>>   From my understanding, the goal of lock_old_queue() is to return the
>>> old queue used.
>>>
>>> last_priority and last_vcpu_id may be updated separately and I could not
>>> convince myself that it would not be possible to return a queue that is
>>> neither the current one nor the old one.
>>>
>>> The following could happen if evtchn->priority and
>>> evtchn->notify_vcpu_id keeps changing between calls.
>>>
>>> pCPU0				| pCPU1
>>> 				|
>>> evtchn_fifo_set_pending(v0,...)	|
>>> 				| evtchn_fifo_set_pending(v1, ...)
>>>    [...]				|
>>>    /* Queue has changed */	|
>>>    evtchn->last_vcpu_id = v0 	|
>>> 				| -> evtchn_old_queue()
>>> 				| v = d->vcpu[evtchn->last_vcpu_id];
>>>     				| old_q = ...
>>> 				| spin_lock(old_q->...)
>>> 				| v = ...
>>> 				| q = ...
>>> 				| /* q and old_q would be the same */
>>> 				|
>>>    evtchn->las_priority = priority|
>>>
>>> If my diagram is correct, then pCPU1 would return a queue that is
>>> neither the current nor old one.
>>
>> I think I agree.
>>
>>> In which case, I think it would at least be possible to corrupt the
>>> queue. From evtchn_fifo_set_pending():
>>>
>>>           /*
>>>            * If this event was a tail, the old queue is now empty and
>>>            * its tail must be invalidated to prevent adding an event to
>>>            * the old queue from corrupting the new queue.
>>>            */
>>>           if ( old_q->tail == port )
>>>               old_q->tail = 0;
>>>
>>> Did I miss anything?
>>
>> I don't think you did. The important point though is that a consistent
>> lock is being held whenever we come here, so two racing set_pending()
>> aren't possible for one and the same evtchn. As a result I don't think
>> the patch here is actually needed.
> 
> I haven't yet read in full details the rest of the patches to say 
> whether this is necessary or not. However, at a first glance, I think 
> this is not a sane to rely on different lock to protect us. And don't 
> get me started on the lack of documentation...
> 
> Furthermore, the implementation of old_lock_queue() suggests that the 
> code was planned to be lockless. Why would you need the loop otherwise?

The lock-less aspect of this affects multiple accesses to e.g.
the same queue, I think. I'm unconvinced it was really considered
whether racing sending on the same channel is also safe this way.

> Therefore, regardless the rest of the discussion, I think this patch 
> would be useful to have for our peace of mind.

That's a fair position to take. My counterargument is mainly
that readability (and hence maintainability) suffers with those
changes.

>> If I take this further, then I think I can reason why it wasn't
>> necessary to add further locking to send_guest_{global,vcpu}_virq():
>> The virq_lock is the "consistent lock" protecting ECS_VIRQ ports. The
>> spin_barrier() while closing the port guards that side against the
>> port changing to a different ECS_* behind the sending functions' backs.
>> And binding such ports sets ->virq_to_evtchn[] last, with a suitable
>> barrier (the unlock).
> 
> This makes sense.
> 
>>
>> Which leaves send_guest_pirq() before we can drop the IRQ-safe locking
>> again. I guess we would need to work towards using the underlying
>> irq_desc's lock as consistent lock here, but this certainly isn't the
>> case just yet, and I'm not really certain this can be achieved.
> I can't comment on the PIRQ code but I think this is a risky approach 
> (see more above).

It may be; one would only know how risky it is once it is being tried.
For the moment, with your apparent agreement above, I'll see whether I
can put together a relaxation patch for the vIRQ sending. Main
question is going to be whether in the process I wouldn't find a
reason why this isn't a safe thing to do.

Jan

