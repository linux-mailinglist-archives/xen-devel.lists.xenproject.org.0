Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1D2DFF0E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 18:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57484.100594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPFY-00063Z-LL; Mon, 21 Dec 2020 17:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57484.100594; Mon, 21 Dec 2020 17:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPFY-00063A-Hi; Mon, 21 Dec 2020 17:45:36 +0000
Received: by outflank-mailman (input) for mailman id 57484;
 Mon, 21 Dec 2020 17:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krPFW-000635-SZ
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 17:45:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krPFW-0002Ka-7m; Mon, 21 Dec 2020 17:45:34 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krPFV-0007fZ-Vw; Mon, 21 Dec 2020 17:45:34 +0000
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
	bh=BkrRymnUmYJro9bAFzAgr6HO7qKXsBObkY72rMY6ntA=; b=C2XRBtonYOkohEPEkjehArLc2W
	iCeHr1+zqxe1y/MmAe+xFY+DfaiVe9zZy6nGVkI6JPN1/woqgcMmyeindLevJLBO6Hk6mSsBjVCzH
	606mAStZiuJ74PytgTEpo44yebJHNkICg4r/HIA7h4eMK1SBv4q8VDqbnI0xjx4eNXao=;
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
 <55dc24b4-88c6-1b22-411e-267231632377@xen.org>
 <cf3faa68-ba4a-b864-66e0-f379a24a48ce@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f3571eb-5aec-e76e-0b61-2602356fb436@xen.org>
Date: Mon, 21 Dec 2020 17:45:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <cf3faa68-ba4a-b864-66e0-f379a24a48ce@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/12/2020 09:40, Jan Beulich wrote:
> On 11.12.2020 11:57, Julien Grall wrote:
>> On 11/12/2020 10:32, Jan Beulich wrote:
>>> On 09.12.2020 12:54, Julien Grall wrote:
>>>> On 23/11/2020 13:29, Jan Beulich wrote:
>>>>> @@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
>>>>>         long           rc = 0;
>>>>>     
>>>>>      again:
>>>>> -    spin_lock(&d1->event_lock);
>>>>> +    write_lock(&d1->event_lock);
>>>>>     
>>>>>         if ( !port_is_valid(d1, port1) )
>>>>>         {
>>>>> @@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
>>>>>                     BUG();
>>>>>     
>>>>>                 if ( d1 < d2 )
>>>>> -            {
>>>>> -                spin_lock(&d2->event_lock);
>>>>> -            }
>>>>> +                read_lock(&d2->event_lock);
>>>>
>>>> This change made me realized that I don't quite understand how the
>>>> rwlock is meant to work for event_lock. I was actually expecting this to
>>>> be a write_lock() given there are state changed in the d2 events.
>>>
>>> Well, the protection needs to be against racing changes, i.e.
>>> parallel invocations of this same function, or evtchn_close().
>>> It is debatable whether evtchn_status() and
>>> domain_dump_evtchn_info() would better also be locked out
>>> (other read_lock() uses aren't applicable to interdomain
>>> channels).
>>>
>>>> Could you outline how a developper can find out whether he/she should
>>>> use read_lock or write_lock?
>>>
>>> I could try to, but it would again be a port type dependent
>>> model, just like for the per-channel locks.
>>
>> It is quite important to have clear locking strategy (in particular
>> rwlock) so we can make correct decision when to use read_lock or write_lock.
>>
>>> So I'd like it to
>>> be clarified first whether you aren't instead indirectly
>>> asking for these to become write_lock()
>>
>> Well, I don't understand why this is a read_lock() (even with your
>> previous explanation). I am not suggesting to switch to a write_lock(),
>> but instead asking for the reasoning behind the decision.
> 
> So if what I've said in my previous reply isn't enough (including the
> argument towards using two write_lock() here), I'm struggling to
> figure what else to say. The primary goal is to exclude changes to
> the same ports. For this it is sufficient to hold just one of the two
> locks in writer mode, as the other (racing) one will acquire that
> same lock for at least reading. The question whether both need to use
> writer mode can only be decided when looking at the sites acquiring
> just one of the locks in reader mode (hence the reference to
> evtchn_status() and domain_dump_evtchn_info()) - if races with them
> are deemed to be a problem, switching to both-writers will be needed.

I had another look at the code based on your explanation. I don't think 
it is fine to allow evtchn_status() to be concurrently called with 
evtchn_close().

evtchn_close() contains the following code:

   chn2->state = ECS_UNBOUND;
   chn2->u.unbound.remote_domid = d1->domain_id;

Where chn2 is a event channel of the remote domain (d2). Your patch will 
only held the read lock for d2.

However evtchn_status() expects the event channel state to not change 
behind its back. This assumption doesn't hold for d2, and you could 
possibly end up to see the new value of chn2->state after the new 
chn2->u.unbound.remote_domid.

Thanksfully, it doesn't look like chn2->u.interdomain.remote_domain 
would be overwritten. Otherwise, this would be a straight dereference of 
an invalid pointer.

So I think, we need to held the write event lock for both domain.

Cheers,

-- 
Julien Grall

