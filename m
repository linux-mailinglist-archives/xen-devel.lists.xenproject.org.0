Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E862F10CE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 12:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64775.114504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyv2B-0002zS-59; Mon, 11 Jan 2021 11:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64775.114504; Mon, 11 Jan 2021 11:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyv2B-0002z6-22; Mon, 11 Jan 2021 11:06:51 +0000
Received: by outflank-mailman (input) for mailman id 64775;
 Mon, 11 Jan 2021 11:06:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyv29-0002z1-7j
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:06:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyv28-0002DQ-9S; Mon, 11 Jan 2021 11:06:48 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyv27-0007cm-RC; Mon, 11 Jan 2021 11:06:48 +0000
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
	bh=sjx11oUENH/8fzYRD9Znuw8t9gpoah1S9bhEDvxtS+U=; b=XaEVHS1CbJK736FvMtSOWgq/Yo
	E9sk3imOUGM56/V2pA4d3Pdf/mbh0B7t9F2Wuc65fzsQAGTYDEmL6gak2V5bjXwVDyPbfTPmiIW+y
	qGqZRln1rmn2cjAdEfYljjl9qWBq9h6uAwBzzM3jLR2gjcI/M+hA+NnrFZs78LNuBfc4=;
Subject: Re: [PATCH v4 01/10] evtchn: use per-channel lock where possible
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <e03cb246-c08b-5977-9137-a38974364445@suse.com>
 <3c393170-09f9-6d31-c227-b599f8769e35@xen.org>
 <69e94f3e-5fca-e77e-0b85-56057e7fce19@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a0978c49-7bda-3fb5-2c95-ba53b49b55ab@xen.org>
Date: Mon, 11 Jan 2021 11:06:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <69e94f3e-5fca-e77e-0b85-56057e7fce19@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/01/2021 10:14, Jan Beulich wrote:
> On 08.01.2021 21:32, Julien Grall wrote:
>> Hi Jan,
>>
>> On 05/01/2021 13:09, Jan Beulich wrote:
>>> Neither evtchn_status() nor domain_dump_evtchn_info() nor
>>> flask_get_peer_sid() need to hold the per-domain lock - they all only
>>> read a single channel's state (at a time, in the dump case).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v4: New.
>>>
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -968,15 +968,16 @@ int evtchn_status(evtchn_status_t *statu
>>>        if ( d == NULL )
>>>            return -ESRCH;
>>>    
>>> -    spin_lock(&d->event_lock);
>>> -
>>>        if ( !port_is_valid(d, port) )
>>
>> There is one issue that is now becoming more apparent. To be clear, the
>> problem is not in this patch, but I think it is the best place to
>> discuss it as d->event_lock may be part of the solution.
>>
>> After XSA-344, evtchn_destroy() will end up to decrement d->valid_evtchns.
>>
>> Given that evtchn_status() can work on the non-current domain, it would
>> be possible to run it concurrently with evtchn_destroy(). As a
>> consequence, port_is_valid() will be unstable as a valid event channel
>> may turn invalid.
>>
>> AFAICT, we are getting away so far, as the memory is not freed until the
>> domain is fully destroyed. However, we re-introduced XSA-338 in a
>> different way.
>>
>> To be clear this is not the fault of this patch. But I don't think this
>> is sane to re-introduce a behavior that lead us to an XSA.
> 
> I'm getting confused, I'm afraid, from the varying statements above:
> Are you suggesting this patch does re-introduce bad behavior or not?

No. I am pointing out that this is widening the bad behavior (again).

> 
> Yes, the decrementing of ->valid_evtchns has a similar effect, but
> I'm not convinced it gets us into XSA territory again. The problem
> wasn't the reducing of ->max_evtchns as such, but the derived
> assumptions elsewhere in the code. If there were any such again, I
> suppose we'd have reason to issue another XSA.

I don't think it get us to the XSA territory yet. However, the 
locking/interaction in the event channel code is quite complex.

To give a concrete example, below the current implementation of 
free_xen_event_channel():

     if ( !port_is_valid(d, port) )
     {
         /*
          * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
          * with the spin_barrier() and BUG_ON() in evtchn_destroy().
          */
         smp_rmb();
         BUG_ON(!d->is_dying);
         return;
     }

     evtchn_close(d, port, 0);

It would be fair for a developer to assume that after the check above, 
port_is_valid() would return true. However, this is not the case...

I am not aware of any issue so far... But I am not ready to be this is 
not going to be missed out. How about you?

 > If there were any such again, I
 > suppose we'd have reason to issue another XSA.

The point of my e-mail is to prevent this XSA to happen. I am pretty 
sure you want the same.

> 
> Furthermore there are other paths already using port_is_valid()
> without holding the domain's event lock; I've not been able to spot
> a problem with this though, so far.

Right. Most of the fine are fine because d == current. Therefore, the 
domain must be running and evtchn_destroy() couldn't happen concurrently.

> 
>> I can see two solutions:
>>     1) Use d->event_lock to protect port_is_valid() when d !=
>> current->domain. This would require evtchn_destroy() to grab the lock
>> when updating d->valid_evtchns.
>>     2) Never decrement d->valid_evtchns and use a different field for
>> closing ports
>>
>> I am not a big fan of 1) because this is muddying the already complex
>> locking situation in the event channel code. But I suggested it because
>> I wasn't sure whether you would be happy with 2).
> 
> I agree 1) wouldn't be very nice, and you're right in assuming I
> wouldn't like 2) very much. For the moment I'm not (yet) convinced
> we need to do anything at all - as you say yourself, while the
> result of port_is_valid() is potentially unstable when a domain is
> in the process of being cleaned up, the state guarded by such
> checks remains usable in (I think) a race free manner.

It remains usable *today*, the question is how long this will last?

All the recent XSAs in the event channel taught me that the 
locking/interaction is extremely complex. This series is another proof.

We would save us quite a bit of trouble by making port_is_valid() stable 
no matter the state of the domain.

I think an extra field (option 2) is quite a good compromise with space 
use, maintenance, speed.

I am would be interested to hear from others.

Cheers,

-- 
Julien Grall

