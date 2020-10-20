Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F519293818
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 11:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9023.24279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUo2O-00009z-Uv; Tue, 20 Oct 2020 09:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9023.24279; Tue, 20 Oct 2020 09:34:36 +0000
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
	id 1kUo2O-00009a-RT; Tue, 20 Oct 2020 09:34:36 +0000
Received: by outflank-mailman (input) for mailman id 9023;
 Tue, 20 Oct 2020 09:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUo2M-00009V-RJ
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:34:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29b9364d-9ce0-40f4-ad82-008cd254cf06;
 Tue, 20 Oct 2020 09:34:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C46E0AFEA;
 Tue, 20 Oct 2020 09:34:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUo2M-00009V-RJ
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:34:34 +0000
X-Inumbo-ID: 29b9364d-9ce0-40f4-ad82-008cd254cf06
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 29b9364d-9ce0-40f4-ad82-008cd254cf06;
	Tue, 20 Oct 2020 09:34:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603186472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/qsYyzz3ne4SLzXXczuoLGZspSjo2Gi2Dp4PFXWkrU=;
	b=T92FsbIE+MhO+l5yiJqcC+xCxwvbWlOCPp9uni95XGNmLz56FTDJbvDCxox1h3/3FirsUK
	aUi+qIcZ8jSBU3Ub6FRXzEwAVWN3+TuLogw1ODXwR8rCQFbnr/0HWtjkvfGtvJfWlEQyHg
	CM83bg8FhMqrO6qLBk5UxeZdBWQN6s8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C46E0AFEA;
	Tue, 20 Oct 2020 09:34:32 +0000 (UTC)
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
 <4eb073bb-67ca-5376-bae1-e555d3c5fb30@suse.com>
 <2eb42b0e-f31e-2c1e-28bf-32c366fb1688@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abaf4b52-df8d-6df0-9100-a4c9884c09da@suse.com>
Date: Tue, 20 Oct 2020 11:34:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <2eb42b0e-f31e-2c1e-28bf-32c366fb1688@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.10.2020 11:25, Julien Grall wrote:
> Hi Jan,
> 
> On 16/10/2020 13:09, Jan Beulich wrote:
>> On 16.10.2020 11:36, Julien Grall wrote:
>>> On 15/10/2020 13:07, Jan Beulich wrote:
>>>> On 14.10.2020 13:40, Julien Grall wrote:
>>>>> On 13/10/2020 15:26, Jan Beulich wrote:
>>>>>> On 13.10.2020 16:20, Jürgen Groß wrote:
>>>>>>> Especially Julien was rather worried by the current situation. In
>>>>>>> case you can convince him the current handling is fine, we can
>>>>>>> easily drop this patch.
>>>>>>
>>>>>> Julien, in the light of the above - can you clarify the specific
>>>>>> concerns you (still) have?
>>>>>
>>>>> Let me start with that the assumption if evtchn->lock is not held when
>>>>> evtchn_fifo_set_pending() is called. If it is held, then my comment is moot.
>>>>
>>>> But this isn't interesting - we know there are paths where it is
>>>> held, and ones (interdomain sending) where it's the remote port's
>>>> lock instead which is held. What's important here is that a
>>>> _consistent_ lock be held (but it doesn't need to be evtchn's).
>>>
>>> Yes, a _consistent_ lock *should* be sufficient. But it is better to use
>>> the same lock everywhere so it is easier to reason (see more below).
>>
>> But that's already not the case, due to the way interdomain channels
>> have events sent. You did suggest acquiring both locks, but as
>> indicated at the time I think this goes too far. As far as the doc
>> aspect - we can improve the situation. Iirc it was you who made me
>> add the respective comment ahead of struct evtchn_port_ops.
>>
>>>>>    From my understanding, the goal of lock_old_queue() is to return the
>>>>> old queue used.
>>>>>
>>>>> last_priority and last_vcpu_id may be updated separately and I could not
>>>>> convince myself that it would not be possible to return a queue that is
>>>>> neither the current one nor the old one.
>>>>>
>>>>> The following could happen if evtchn->priority and
>>>>> evtchn->notify_vcpu_id keeps changing between calls.
>>>>>
>>>>> pCPU0				| pCPU1
>>>>> 				|
>>>>> evtchn_fifo_set_pending(v0,...)	|
>>>>> 				| evtchn_fifo_set_pending(v1, ...)
>>>>>     [...]				|
>>>>>     /* Queue has changed */	|
>>>>>     evtchn->last_vcpu_id = v0 	|
>>>>> 				| -> evtchn_old_queue()
>>>>> 				| v = d->vcpu[evtchn->last_vcpu_id];
>>>>>      				| old_q = ...
>>>>> 				| spin_lock(old_q->...)
>>>>> 				| v = ...
>>>>> 				| q = ...
>>>>> 				| /* q and old_q would be the same */
>>>>> 				|
>>>>>     evtchn->las_priority = priority|
>>>>>
>>>>> If my diagram is correct, then pCPU1 would return a queue that is
>>>>> neither the current nor old one.
>>>>
>>>> I think I agree.
>>>>
>>>>> In which case, I think it would at least be possible to corrupt the
>>>>> queue. From evtchn_fifo_set_pending():
>>>>>
>>>>>            /*
>>>>>             * If this event was a tail, the old queue is now empty and
>>>>>             * its tail must be invalidated to prevent adding an event to
>>>>>             * the old queue from corrupting the new queue.
>>>>>             */
>>>>>            if ( old_q->tail == port )
>>>>>                old_q->tail = 0;
>>>>>
>>>>> Did I miss anything?
>>>>
>>>> I don't think you did. The important point though is that a consistent
>>>> lock is being held whenever we come here, so two racing set_pending()
>>>> aren't possible for one and the same evtchn. As a result I don't think
>>>> the patch here is actually needed.
>>>
>>> I haven't yet read in full details the rest of the patches to say
>>> whether this is necessary or not. However, at a first glance, I think
>>> this is not a sane to rely on different lock to protect us. And don't
>>> get me started on the lack of documentation...
>>>
>>> Furthermore, the implementation of old_lock_queue() suggests that the
>>> code was planned to be lockless. Why would you need the loop otherwise?
>>
>> The lock-less aspect of this affects multiple accesses to e.g.
>> the same queue, I think.
> I don't think we are talking about the same thing. What I was referring 
> to is the following code:
> 
> static struct evtchn_fifo_queue *lock_old_queue(const struct domain *d,
>                                                  struct evtchn *evtchn,
>                                                  unsigned long *flags)
> {
>      struct vcpu *v;
>      struct evtchn_fifo_queue *q, *old_q;
>      unsigned int try;
> 
>      for ( try = 0; try < 3; try++ )
>      {
>          v = d->vcpu[evtchn->last_vcpu_id];
>          old_q = &v->evtchn_fifo->queue[evtchn->last_priority];
> 
>          spin_lock_irqsave(&old_q->lock, *flags);
> 
>          v = d->vcpu[evtchn->last_vcpu_id];
>          q = &v->evtchn_fifo->queue[evtchn->last_priority];
> 
>          if ( old_q == q )
>              return old_q;
> 
>          spin_unlock_irqrestore(&old_q->lock, *flags);
>      }
> 
>      gprintk(XENLOG_WARNING,
>              "dom%d port %d lost event (too many queue changes)\n",
>              d->domain_id, evtchn->port);
>      return NULL;
> }
> 
> Given that evtchn->last_vcpu_id and evtchn->last_priority can only be 
> modified in evtchn_fifo_set_pending(), this suggests that it is expected 
> for the function to multiple called concurrently on the same event channel.
> 
>> I'm unconvinced it was really considered
>> whether racing sending on the same channel is also safe this way.
> 
> How would you explain the 3 try in lock_old_queue then?

Queue changes (as said by the gprintk()) can't result from sending
alone, but require re-binding to a different vCPU or altering the
priority. I'm simply unconvinced that the code indeed fully reflects
the original intentions. IOW I'm unsure whether we talk about the
same thing ...

Jan

