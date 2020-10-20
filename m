Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F402937F2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 11:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9016.24255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUntN-0007VR-MH; Tue, 20 Oct 2020 09:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9016.24255; Tue, 20 Oct 2020 09:25:17 +0000
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
	id 1kUntN-0007V2-J0; Tue, 20 Oct 2020 09:25:17 +0000
Received: by outflank-mailman (input) for mailman id 9016;
 Tue, 20 Oct 2020 09:25:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUntM-0007Ux-5r
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:25:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6529c936-f715-4e44-8c76-53f4f8469560;
 Tue, 20 Oct 2020 09:25:14 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUntH-0006RL-Mt; Tue, 20 Oct 2020 09:25:11 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUntH-0000eV-Ab; Tue, 20 Oct 2020 09:25:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUntM-0007Ux-5r
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:25:16 +0000
X-Inumbo-ID: 6529c936-f715-4e44-8c76-53f4f8469560
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6529c936-f715-4e44-8c76-53f4f8469560;
	Tue, 20 Oct 2020 09:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IP0aLCAZ0NPf9jmG0UGvDcOQv+dvf5RqIa86OPq8vuE=; b=26QXCBC1L8WOiCOqHGNuMPg+kn
	FG4dvK527rBcxZRKpw6aXamWZUlmK9PMOiuSjCz4qjOhhFXejYP2vm6ois1zxerZQBXzuKFPDfPqO
	SCHOK5cLu5YGIr7rAvDW1/ypDgPHHl4BwYFZxiAyBxU3qZ2gjyQ+V2oJ4I7+bUpKzJBo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUntH-0006RL-Mt; Tue, 20 Oct 2020 09:25:11 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUntH-0000eV-Ab; Tue, 20 Oct 2020 09:25:11 +0000
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Jan Beulich <jbeulich@suse.com>
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
 <4eb073bb-67ca-5376-bae1-e555d3c5fb30@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2eb42b0e-f31e-2c1e-28bf-32c366fb1688@xen.org>
Date: Tue, 20 Oct 2020 10:25:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <4eb073bb-67ca-5376-bae1-e555d3c5fb30@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 16/10/2020 13:09, Jan Beulich wrote:
> On 16.10.2020 11:36, Julien Grall wrote:
>> On 15/10/2020 13:07, Jan Beulich wrote:
>>> On 14.10.2020 13:40, Julien Grall wrote:
>>>> On 13/10/2020 15:26, Jan Beulich wrote:
>>>>> On 13.10.2020 16:20, Jürgen Groß wrote:
>>>>>> Especially Julien was rather worried by the current situation. In
>>>>>> case you can convince him the current handling is fine, we can
>>>>>> easily drop this patch.
>>>>>
>>>>> Julien, in the light of the above - can you clarify the specific
>>>>> concerns you (still) have?
>>>>
>>>> Let me start with that the assumption if evtchn->lock is not held when
>>>> evtchn_fifo_set_pending() is called. If it is held, then my comment is moot.
>>>
>>> But this isn't interesting - we know there are paths where it is
>>> held, and ones (interdomain sending) where it's the remote port's
>>> lock instead which is held. What's important here is that a
>>> _consistent_ lock be held (but it doesn't need to be evtchn's).
>>
>> Yes, a _consistent_ lock *should* be sufficient. But it is better to use
>> the same lock everywhere so it is easier to reason (see more below).
> 
> But that's already not the case, due to the way interdomain channels
> have events sent. You did suggest acquiring both locks, but as
> indicated at the time I think this goes too far. As far as the doc
> aspect - we can improve the situation. Iirc it was you who made me
> add the respective comment ahead of struct evtchn_port_ops.
> 
>>>>    From my understanding, the goal of lock_old_queue() is to return the
>>>> old queue used.
>>>>
>>>> last_priority and last_vcpu_id may be updated separately and I could not
>>>> convince myself that it would not be possible to return a queue that is
>>>> neither the current one nor the old one.
>>>>
>>>> The following could happen if evtchn->priority and
>>>> evtchn->notify_vcpu_id keeps changing between calls.
>>>>
>>>> pCPU0				| pCPU1
>>>> 				|
>>>> evtchn_fifo_set_pending(v0,...)	|
>>>> 				| evtchn_fifo_set_pending(v1, ...)
>>>>     [...]				|
>>>>     /* Queue has changed */	|
>>>>     evtchn->last_vcpu_id = v0 	|
>>>> 				| -> evtchn_old_queue()
>>>> 				| v = d->vcpu[evtchn->last_vcpu_id];
>>>>      				| old_q = ...
>>>> 				| spin_lock(old_q->...)
>>>> 				| v = ...
>>>> 				| q = ...
>>>> 				| /* q and old_q would be the same */
>>>> 				|
>>>>     evtchn->las_priority = priority|
>>>>
>>>> If my diagram is correct, then pCPU1 would return a queue that is
>>>> neither the current nor old one.
>>>
>>> I think I agree.
>>>
>>>> In which case, I think it would at least be possible to corrupt the
>>>> queue. From evtchn_fifo_set_pending():
>>>>
>>>>            /*
>>>>             * If this event was a tail, the old queue is now empty and
>>>>             * its tail must be invalidated to prevent adding an event to
>>>>             * the old queue from corrupting the new queue.
>>>>             */
>>>>            if ( old_q->tail == port )
>>>>                old_q->tail = 0;
>>>>
>>>> Did I miss anything?
>>>
>>> I don't think you did. The important point though is that a consistent
>>> lock is being held whenever we come here, so two racing set_pending()
>>> aren't possible for one and the same evtchn. As a result I don't think
>>> the patch here is actually needed.
>>
>> I haven't yet read in full details the rest of the patches to say
>> whether this is necessary or not. However, at a first glance, I think
>> this is not a sane to rely on different lock to protect us. And don't
>> get me started on the lack of documentation...
>>
>> Furthermore, the implementation of old_lock_queue() suggests that the
>> code was planned to be lockless. Why would you need the loop otherwise?
> 
> The lock-less aspect of this affects multiple accesses to e.g.
> the same queue, I think.
I don't think we are talking about the same thing. What I was referring 
to is the following code:

static struct evtchn_fifo_queue *lock_old_queue(const struct domain *d,
                                                 struct evtchn *evtchn,
                                                 unsigned long *flags)
{
     struct vcpu *v;
     struct evtchn_fifo_queue *q, *old_q;
     unsigned int try;

     for ( try = 0; try < 3; try++ )
     {
         v = d->vcpu[evtchn->last_vcpu_id];
         old_q = &v->evtchn_fifo->queue[evtchn->last_priority];

         spin_lock_irqsave(&old_q->lock, *flags);

         v = d->vcpu[evtchn->last_vcpu_id];
         q = &v->evtchn_fifo->queue[evtchn->last_priority];

         if ( old_q == q )
             return old_q;

         spin_unlock_irqrestore(&old_q->lock, *flags);
     }

     gprintk(XENLOG_WARNING,
             "dom%d port %d lost event (too many queue changes)\n",
             d->domain_id, evtchn->port);
     return NULL;
}

Given that evtchn->last_vcpu_id and evtchn->last_priority can only be 
modified in evtchn_fifo_set_pending(), this suggests that it is expected 
for the function to multiple called concurrently on the same event channel.

> I'm unconvinced it was really considered
> whether racing sending on the same channel is also safe this way.

How would you explain the 3 try in lock_old_queue then?

> 
>> Therefore, regardless the rest of the discussion, I think this patch
>> would be useful to have for our peace of mind.
> 
> That's a fair position to take. My counterargument is mainly
> that readability (and hence maintainability) suffers with those
> changes.

We surely have different opinion... I don't particularly care about the 
approach as long as it is *properly* documented.

Cheers,

-- 
Julien Grall

