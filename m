Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51303054D6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 08:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75766.136496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4fQB-00014u-56; Wed, 27 Jan 2021 07:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75766.136496; Wed, 27 Jan 2021 07:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4fQB-00014V-1M; Wed, 27 Jan 2021 07:39:23 +0000
Received: by outflank-mailman (input) for mailman id 75766;
 Wed, 27 Jan 2021 07:39:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4fQ8-00014Q-Rz
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 07:39:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cecfee7-ec32-4ecc-bf79-275e71e7401a;
 Wed, 27 Jan 2021 07:39:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 901E8AD7F;
 Wed, 27 Jan 2021 07:39:18 +0000 (UTC)
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
X-Inumbo-ID: 9cecfee7-ec32-4ecc-bf79-275e71e7401a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611733158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BG6mb1+fxHiWJbMqA+mfmVM5ygqUlDR+zs32eBDPnU=;
	b=b2wxWaj+QkaQfzhZhstPwq/hp1xGggvDJviSGXp/V4mkydHGztPw0omsD046a0zDhhra6n
	VwuDLsTEo0t+/EeTc9zvS9NS8VgOVwzG1ttZdBo+XuT4vEXP4MS87OkcVeye32Aw1XXJ7p
	TDr7WrO854JlkugQyEh+GX4xyHjehAc=
Subject: Re: [PATCH v4 01/10] evtchn: use per-channel lock where possible
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <e03cb246-c08b-5977-9137-a38974364445@suse.com>
 <3c393170-09f9-6d31-c227-b599f8769e35@xen.org>
 <69e94f3e-5fca-e77e-0b85-56057e7fce19@suse.com>
 <a0978c49-7bda-3fb5-2c95-ba53b49b55ab@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1a18e1a-6792-36c4-7b3b-56faecd09e08@suse.com>
Date: Wed, 27 Jan 2021 08:39:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a0978c49-7bda-3fb5-2c95-ba53b49b55ab@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 12:06, Julien Grall wrote:
> On 11/01/2021 10:14, Jan Beulich wrote:
>> On 08.01.2021 21:32, Julien Grall wrote:
>>> On 05/01/2021 13:09, Jan Beulich wrote:
>>>> Neither evtchn_status() nor domain_dump_evtchn_info() nor
>>>> flask_get_peer_sid() need to hold the per-domain lock - they all only
>>>> read a single channel's state (at a time, in the dump case).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v4: New.
>>>>
>>>> --- a/xen/common/event_channel.c
>>>> +++ b/xen/common/event_channel.c
>>>> @@ -968,15 +968,16 @@ int evtchn_status(evtchn_status_t *statu
>>>>        if ( d == NULL )
>>>>            return -ESRCH;
>>>>    
>>>> -    spin_lock(&d->event_lock);
>>>> -
>>>>        if ( !port_is_valid(d, port) )
>>>
>>> There is one issue that is now becoming more apparent. To be clear, the
>>> problem is not in this patch, but I think it is the best place to
>>> discuss it as d->event_lock may be part of the solution.
>>>
>>> After XSA-344, evtchn_destroy() will end up to decrement d->valid_evtchns.
>>>
>>> Given that evtchn_status() can work on the non-current domain, it would
>>> be possible to run it concurrently with evtchn_destroy(). As a
>>> consequence, port_is_valid() will be unstable as a valid event channel
>>> may turn invalid.
>>>
>>> AFAICT, we are getting away so far, as the memory is not freed until the
>>> domain is fully destroyed. However, we re-introduced XSA-338 in a
>>> different way.
>>>
>>> To be clear this is not the fault of this patch. But I don't think this
>>> is sane to re-introduce a behavior that lead us to an XSA.
>>
>> I'm getting confused, I'm afraid, from the varying statements above:
>> Are you suggesting this patch does re-introduce bad behavior or not?
> 
> No. I am pointing out that this is widening the bad behavior (again).

Since I'd really like to get in some more of this series before
the full freeze, and hence I want (need) to re-post, I thought
I'd reply here despite (or in light of) your request for input
from others not having been met.

I don't view this as "bad" behaviour, btw. The situation is
quite different to that which had led to the XSA: Here we
only deal with the "illusion" of a port having become invalid.
IOW yes, ...

>> Yes, the decrementing of ->valid_evtchns has a similar effect, but
>> I'm not convinced it gets us into XSA territory again. The problem
>> wasn't the reducing of ->max_evtchns as such, but the derived
>> assumptions elsewhere in the code. If there were any such again, I
>> suppose we'd have reason to issue another XSA.
> 
> I don't think it get us to the XSA territory yet. However, the 
> locking/interaction in the event channel code is quite complex.
> 
> To give a concrete example, below the current implementation of 
> free_xen_event_channel():
> 
>      if ( !port_is_valid(d, port) )
>      {
>          /*
>           * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
>           * with the spin_barrier() and BUG_ON() in evtchn_destroy().
>           */
>          smp_rmb();
>          BUG_ON(!d->is_dying);
>          return;
>      }
> 
>      evtchn_close(d, port, 0);
> 
> It would be fair for a developer to assume that after the check above, 
> port_is_valid() would return true. However, this is not the case...

... there needs to be awareness that putting e.g.

    ASSERT(port_is_valid(d, port));

anywhere past the if() cannot be done without considering domain
cleanup logic.

> I am not aware of any issue so far... But I am not ready to be this is 
> not going to be missed out. How about you?

There is a risk of this being overlooked, yes. But I'm unconvinced
this absolutely requires measures to be taken beyond, maybe, the
addition of a comment somewhere. I do, in particular, not think
this should stand in the way of the locking relaxation done by
this patch, even more so that (just to repeat) it merely introduces
more instances of a pattern found elsewhere already.

Jan

