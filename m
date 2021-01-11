Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30012F0FCC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64738.114415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuDH-0006Ce-LK; Mon, 11 Jan 2021 10:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64738.114415; Mon, 11 Jan 2021 10:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuDH-0006CF-HQ; Mon, 11 Jan 2021 10:14:15 +0000
Received: by outflank-mailman (input) for mailman id 64738;
 Mon, 11 Jan 2021 10:14:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyuDG-0006CA-0h
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:14:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 265bb5c4-a194-4f97-ac9b-530063c05190;
 Mon, 11 Jan 2021 10:14:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA2E1AD19;
 Mon, 11 Jan 2021 10:14:11 +0000 (UTC)
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
X-Inumbo-ID: 265bb5c4-a194-4f97-ac9b-530063c05190
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610360051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wuAfBkmkVZEi3EGT4aHnSLLWcPBT5Ih/ReylLV8eGM=;
	b=BhGZPA6NATZWIvoP4zalgyCTa6gCPGHntJJ7aCuowOm3SCszFbFQP6ngz5C2xDl+vDSMx+
	9zYTm8KIMuKVWuvDDxsAW8ooy5sb+36GzDu/ub73koylN/a3jeNh8iplWSJyPzrBmeKR2Z
	zTju/1KKIw7UFMA5ng/nDykf4dhvf2E=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69e94f3e-5fca-e77e-0b85-56057e7fce19@suse.com>
Date: Mon, 11 Jan 2021 11:14:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3c393170-09f9-6d31-c227-b599f8769e35@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 21:32, Julien Grall wrote:
> Hi Jan,
> 
> On 05/01/2021 13:09, Jan Beulich wrote:
>> Neither evtchn_status() nor domain_dump_evtchn_info() nor
>> flask_get_peer_sid() need to hold the per-domain lock - they all only
>> read a single channel's state (at a time, in the dump case).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v4: New.
>>
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -968,15 +968,16 @@ int evtchn_status(evtchn_status_t *statu
>>       if ( d == NULL )
>>           return -ESRCH;
>>   
>> -    spin_lock(&d->event_lock);
>> -
>>       if ( !port_is_valid(d, port) )
> 
> There is one issue that is now becoming more apparent. To be clear, the 
> problem is not in this patch, but I think it is the best place to 
> discuss it as d->event_lock may be part of the solution.
> 
> After XSA-344, evtchn_destroy() will end up to decrement d->valid_evtchns.
> 
> Given that evtchn_status() can work on the non-current domain, it would 
> be possible to run it concurrently with evtchn_destroy(). As a 
> consequence, port_is_valid() will be unstable as a valid event channel 
> may turn invalid.
> 
> AFAICT, we are getting away so far, as the memory is not freed until the 
> domain is fully destroyed. However, we re-introduced XSA-338 in a 
> different way.
> 
> To be clear this is not the fault of this patch. But I don't think this 
> is sane to re-introduce a behavior that lead us to an XSA.

I'm getting confused, I'm afraid, from the varying statements above:
Are you suggesting this patch does re-introduce bad behavior or not?

Yes, the decrementing of ->valid_evtchns has a similar effect, but
I'm not convinced it gets us into XSA territory again. The problem
wasn't the reducing of ->max_evtchns as such, but the derived
assumptions elsewhere in the code. If there were any such again, I
suppose we'd have reason to issue another XSA.

Furthermore there are other paths already using port_is_valid()
without holding the domain's event lock; I've not been able to spot
a problem with this though, so far.

> I can see two solutions:
>    1) Use d->event_lock to protect port_is_valid() when d != 
> current->domain. This would require evtchn_destroy() to grab the lock 
> when updating d->valid_evtchns.
>    2) Never decrement d->valid_evtchns and use a different field for 
> closing ports
> 
> I am not a big fan of 1) because this is muddying the already complex 
> locking situation in the event channel code. But I suggested it because 
> I wasn't sure whether you would be happy with 2).

I agree 1) wouldn't be very nice, and you're right in assuming I
wouldn't like 2) very much. For the moment I'm not (yet) convinced
we need to do anything at all - as you say yourself, while the
result of port_is_valid() is potentially unstable when a domain is
in the process of being cleaned up, the state guarded by such
checks remains usable in (I think) a race free manner.

Jan

