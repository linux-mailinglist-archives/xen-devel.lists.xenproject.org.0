Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C22E0842
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 10:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57699.101033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kreFv-0005bX-3T; Tue, 22 Dec 2020 09:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57699.101033; Tue, 22 Dec 2020 09:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kreFu-0005b8-W1; Tue, 22 Dec 2020 09:46:58 +0000
Received: by outflank-mailman (input) for mailman id 57699;
 Tue, 22 Dec 2020 09:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kreFt-0005b3-FL
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 09:46:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20ed7f96-7dd8-48ea-95a9-9d40055911d3;
 Tue, 22 Dec 2020 09:46:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33A1CAEA2;
 Tue, 22 Dec 2020 09:46:55 +0000 (UTC)
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
X-Inumbo-ID: 20ed7f96-7dd8-48ea-95a9-9d40055911d3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608630415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH2tsfNS/wT6yUcJmU1L7Ai6jugWwSqwfdZVi1IqJhc=;
	b=gqKfdkhDaenTpkNZ8qTYQmLJfoKZ8VMqf+emmcAqbmxosZ7K170iMVto4oq76sRP0VMnWR
	1uXrWFpPexnTbieMhnjc81Y5XvNq2l+ky3OQWQXKAEu822PuyFzGs788ifW98jLqUMG2cC
	Aq/vYMHAVG+Gh2ggQCOjm42ujgYNT/0=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <099b99bc-c544-0aa8-c3b4-4871ef618e4a@suse.com>
Date: Tue, 22 Dec 2020 10:46:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1f3571eb-5aec-e76e-0b61-2602356fb436@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.12.2020 18:45, Julien Grall wrote:
> Hi Jan,
> 
> On 14/12/2020 09:40, Jan Beulich wrote:
>> On 11.12.2020 11:57, Julien Grall wrote:
>>> On 11/12/2020 10:32, Jan Beulich wrote:
>>>> On 09.12.2020 12:54, Julien Grall wrote:
>>>>> On 23/11/2020 13:29, Jan Beulich wrote:
>>>>>> @@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
>>>>>>         long           rc = 0;
>>>>>>     
>>>>>>      again:
>>>>>> -    spin_lock(&d1->event_lock);
>>>>>> +    write_lock(&d1->event_lock);
>>>>>>     
>>>>>>         if ( !port_is_valid(d1, port1) )
>>>>>>         {
>>>>>> @@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
>>>>>>                     BUG();
>>>>>>     
>>>>>>                 if ( d1 < d2 )
>>>>>> -            {
>>>>>> -                spin_lock(&d2->event_lock);
>>>>>> -            }
>>>>>> +                read_lock(&d2->event_lock);
>>>>>
>>>>> This change made me realized that I don't quite understand how the
>>>>> rwlock is meant to work for event_lock. I was actually expecting this to
>>>>> be a write_lock() given there are state changed in the d2 events.
>>>>
>>>> Well, the protection needs to be against racing changes, i.e.
>>>> parallel invocations of this same function, or evtchn_close().
>>>> It is debatable whether evtchn_status() and
>>>> domain_dump_evtchn_info() would better also be locked out
>>>> (other read_lock() uses aren't applicable to interdomain
>>>> channels).
>>>>
>>>>> Could you outline how a developper can find out whether he/she should
>>>>> use read_lock or write_lock?
>>>>
>>>> I could try to, but it would again be a port type dependent
>>>> model, just like for the per-channel locks.
>>>
>>> It is quite important to have clear locking strategy (in particular
>>> rwlock) so we can make correct decision when to use read_lock or write_lock.
>>>
>>>> So I'd like it to
>>>> be clarified first whether you aren't instead indirectly
>>>> asking for these to become write_lock()
>>>
>>> Well, I don't understand why this is a read_lock() (even with your
>>> previous explanation). I am not suggesting to switch to a write_lock(),
>>> but instead asking for the reasoning behind the decision.
>>
>> So if what I've said in my previous reply isn't enough (including the
>> argument towards using two write_lock() here), I'm struggling to
>> figure what else to say. The primary goal is to exclude changes to
>> the same ports. For this it is sufficient to hold just one of the two
>> locks in writer mode, as the other (racing) one will acquire that
>> same lock for at least reading. The question whether both need to use
>> writer mode can only be decided when looking at the sites acquiring
>> just one of the locks in reader mode (hence the reference to
>> evtchn_status() and domain_dump_evtchn_info()) - if races with them
>> are deemed to be a problem, switching to both-writers will be needed.
> 
> I had another look at the code based on your explanation. I don't think 
> it is fine to allow evtchn_status() to be concurrently called with 
> evtchn_close().
> 
> evtchn_close() contains the following code:
> 
>    chn2->state = ECS_UNBOUND;
>    chn2->u.unbound.remote_domid = d1->domain_id;
> 
> Where chn2 is a event channel of the remote domain (d2). Your patch will 
> only held the read lock for d2.
> 
> However evtchn_status() expects the event channel state to not change 
> behind its back. This assumption doesn't hold for d2, and you could 
> possibly end up to see the new value of chn2->state after the new 
> chn2->u.unbound.remote_domid.
> 
> Thanksfully, it doesn't look like chn2->u.interdomain.remote_domain 
> would be overwritten. Otherwise, this would be a straight dereference of 
> an invalid pointer.
> 
> So I think, we need to held the write event lock for both domain.

Well, okay. Three considerations though:

1) Neither evtchn_status() nor domain_dump_evtchn_info() appear to
have a real need to acquire the per-domain lock. They could as well
acquire the per-channel ones. (In the latter case this will then
also allow inserting the so far missing process_pending_softirqs()
call; it shouldn't be made with a lock held.)

2) With the double-locking changed and with 1) addressed, there's
going to be almost no read_lock() left. hvm_migrate_pirqs() and
do_physdev_op()'s PHYSDEVOP_eoi handling, evtchn_move_pirqs(), and
hvm_dpci_msi_eoi(). While for these it may still be helpful to be
possible to run in parallel, I then nevertheless wonder whether the
change as a whole is still worthwhile.

3) With the per-channel double locking and with 1) addressed I
can't really see the need for the double per-domain locking in
evtchn_bind_interdomain() and evtchn_close(). The write lock is
needed for the domain allocating a new port or freeing one. But why
is there any need for holding the remote domain's lock, when its
side of the channel gets guarded by the per-channel lock anyway?
Granted the per-channel locks may then need acquiring a little
earlier, before checking the remote channel's state. But this
shouldn't be an issue.

I guess I'll make addressing 1) and 3) prereq patches to this one,
unless I learn of reasons why things need to remain the way they
are.

Jan

