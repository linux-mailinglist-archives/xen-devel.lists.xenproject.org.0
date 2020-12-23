Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673452E1C72
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 13:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58336.102470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks3iK-0002Pg-Dl; Wed, 23 Dec 2020 12:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58336.102470; Wed, 23 Dec 2020 12:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks3iK-0002PE-AN; Wed, 23 Dec 2020 12:58:00 +0000
Received: by outflank-mailman (input) for mailman id 58336;
 Wed, 23 Dec 2020 12:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks3iI-0002P6-Co
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 12:57:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4197f79d-6117-4178-bad3-463784b843e4;
 Wed, 23 Dec 2020 12:57:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 679A1ACF5;
 Wed, 23 Dec 2020 12:57:56 +0000 (UTC)
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
X-Inumbo-ID: 4197f79d-6117-4178-bad3-463784b843e4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608728276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTSZKHnJ9KUXBRG35fiTp3KF/r3oGEaIooh6/1OmZRk=;
	b=fR3HCEhUMLl6B5MUAUTff/kiFstL8yTchF6MRLL8wE/AD3Ei7knURiAjPh9F3+bZU2FZ01
	oaYXNUiZZ58NdIP9itqlDZTGLdqDmuuOC3xgKkLzkbBxyuWHgJzZZp1LxhqxPyR0LyBrjP
	d3AvRoyRITjOFLVVHP0JUXFkDgRDrnw=
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
 <6e34fd25-14a2-f655-b019-aca94ce086c8@suse.com>
 <55dc24b4-88c6-1b22-411e-267231632377@xen.org>
 <cf3faa68-ba4a-b864-66e0-f379a24a48ce@suse.com>
 <1f3571eb-5aec-e76e-0b61-2602356fb436@xen.org>
 <099b99bc-c544-0aa8-c3b4-4871ef618e4a@suse.com>
 <aa169dc2-77f2-b3e9-80f4-d5f4d6ea54f1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0b3079b-ae83-a14e-1fc6-ea76bdc7db79@suse.com>
Date: Wed, 23 Dec 2020 13:57:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <aa169dc2-77f2-b3e9-80f4-d5f4d6ea54f1@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 12:22, Julien Grall wrote:
> Hi Jan,
> 
> On 22/12/2020 09:46, Jan Beulich wrote:
>> On 21.12.2020 18:45, Julien Grall wrote:
>>> On 14/12/2020 09:40, Jan Beulich wrote:
>>>> On 11.12.2020 11:57, Julien Grall wrote:
>>>>> On 11/12/2020 10:32, Jan Beulich wrote:
>>>>>> On 09.12.2020 12:54, Julien Grall wrote:
>>>>>>> On 23/11/2020 13:29, Jan Beulich wrote:
>>>>>>>> @@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
>>>>>>>>          long           rc = 0;
>>>>>>>>      
>>>>>>>>       again:
>>>>>>>> -    spin_lock(&d1->event_lock);
>>>>>>>> +    write_lock(&d1->event_lock);
>>>>>>>>      
>>>>>>>>          if ( !port_is_valid(d1, port1) )
>>>>>>>>          {
>>>>>>>> @@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
>>>>>>>>                      BUG();
>>>>>>>>      
>>>>>>>>                  if ( d1 < d2 )
>>>>>>>> -            {
>>>>>>>> -                spin_lock(&d2->event_lock);
>>>>>>>> -            }
>>>>>>>> +                read_lock(&d2->event_lock);
>>>>>>>
>>>>>>> This change made me realized that I don't quite understand how the
>>>>>>> rwlock is meant to work for event_lock. I was actually expecting this to
>>>>>>> be a write_lock() given there are state changed in the d2 events.
>>>>>>
>>>>>> Well, the protection needs to be against racing changes, i.e.
>>>>>> parallel invocations of this same function, or evtchn_close().
>>>>>> It is debatable whether evtchn_status() and
>>>>>> domain_dump_evtchn_info() would better also be locked out
>>>>>> (other read_lock() uses aren't applicable to interdomain
>>>>>> channels).
>>>>>>
>>>>>>> Could you outline how a developper can find out whether he/she should
>>>>>>> use read_lock or write_lock?
>>>>>>
>>>>>> I could try to, but it would again be a port type dependent
>>>>>> model, just like for the per-channel locks.
>>>>>
>>>>> It is quite important to have clear locking strategy (in particular
>>>>> rwlock) so we can make correct decision when to use read_lock or write_lock.
>>>>>
>>>>>> So I'd like it to
>>>>>> be clarified first whether you aren't instead indirectly
>>>>>> asking for these to become write_lock()
>>>>>
>>>>> Well, I don't understand why this is a read_lock() (even with your
>>>>> previous explanation). I am not suggesting to switch to a write_lock(),
>>>>> but instead asking for the reasoning behind the decision.
>>>>
>>>> So if what I've said in my previous reply isn't enough (including the
>>>> argument towards using two write_lock() here), I'm struggling to
>>>> figure what else to say. The primary goal is to exclude changes to
>>>> the same ports. For this it is sufficient to hold just one of the two
>>>> locks in writer mode, as the other (racing) one will acquire that
>>>> same lock for at least reading. The question whether both need to use
>>>> writer mode can only be decided when looking at the sites acquiring
>>>> just one of the locks in reader mode (hence the reference to
>>>> evtchn_status() and domain_dump_evtchn_info()) - if races with them
>>>> are deemed to be a problem, switching to both-writers will be needed.
>>>
>>> I had another look at the code based on your explanation. I don't think
>>> it is fine to allow evtchn_status() to be concurrently called with
>>> evtchn_close().
>>>
>>> evtchn_close() contains the following code:
>>>
>>>     chn2->state = ECS_UNBOUND;
>>>     chn2->u.unbound.remote_domid = d1->domain_id;
>>>
>>> Where chn2 is a event channel of the remote domain (d2). Your patch will
>>> only held the read lock for d2.
>>>
>>> However evtchn_status() expects the event channel state to not change
>>> behind its back. This assumption doesn't hold for d2, and you could
>>> possibly end up to see the new value of chn2->state after the new
>>> chn2->u.unbound.remote_domid.
>>>
>>> Thanksfully, it doesn't look like chn2->u.interdomain.remote_domain
>>> would be overwritten. Otherwise, this would be a straight dereference of
>>> an invalid pointer.
>>>
>>> So I think, we need to held the write event lock for both domain.
>>
>> Well, okay. Three considerations though:
>>
>> 1) Neither evtchn_status() nor domain_dump_evtchn_info() appear to
>> have a real need to acquire the per-domain lock. They could as well
>> acquire the per-channel ones. (In the latter case this will then
>> also allow inserting the so far missing process_pending_softirqs()
>> call; it shouldn't be made with a lock held.)
> I agree that evtchn_status() doesn't need to acquire the per-domain 
> lock. I am not entirely sure about domain_dump_evtchn_info() because 
> AFAICT the PIRQ tree (used by domain_pirq_to_irq()) is protected with 
> d->event_lock.

It is, but calling it without the lock just to display the IRQ
is not a problem afaict.

>> 3) With the per-channel double locking and with 1) addressed I
>> can't really see the need for the double per-domain locking in
>> evtchn_bind_interdomain() and evtchn_close(). The write lock is
>> needed for the domain allocating a new port or freeing one. But why
>> is there any need for holding the remote domain's lock, when its
>> side of the channel gets guarded by the per-channel lock anyway?
> 
> If 1) is addressed, then I think it should be fine to just acquire the 
> read event lock of the remote domain.

For bind-interdomain I've eliminated the double locking, so the
question goes away there altogether. While for close I thought
I had managed to eliminate it too, the change looks to be
causing a deadlock of some sort, which I'll have to figure out.
However, the change might be controversial anyway, because I
need to play games already prior to fixing that bug ...

All of this said - for the time being it'll be both write_lock()
in evtchn_close(), as I consider it risky to make the remote one
a read_lock() merely based on the observation that there is
currently (i.e. with 1) addressed) no conflict.

Jan

