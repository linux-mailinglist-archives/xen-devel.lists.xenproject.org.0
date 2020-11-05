Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143222A7D06
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 12:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19733.45053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kadW4-0006rX-IX; Thu, 05 Nov 2020 11:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19733.45053; Thu, 05 Nov 2020 11:33:20 +0000
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
	id 1kadW4-0006r8-F1; Thu, 05 Nov 2020 11:33:20 +0000
Received: by outflank-mailman (input) for mailman id 19733;
 Thu, 05 Nov 2020 11:33:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kadW2-0006r3-2X
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:33:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de39cebb-fcb7-42e9-bcfa-f79d3b787125;
 Thu, 05 Nov 2020 11:33:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FBF8ABE3;
 Thu,  5 Nov 2020 11:33:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kadW2-0006r3-2X
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:33:18 +0000
X-Inumbo-ID: de39cebb-fcb7-42e9-bcfa-f79d3b787125
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id de39cebb-fcb7-42e9-bcfa-f79d3b787125;
	Thu, 05 Nov 2020 11:33:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604575995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/FW7ZIc43wsFfXwFpsgIs8hKt6y6twweyPDlhTMzmFQ=;
	b=LYr36KQfi8F5T+nqzxBXyURwPl/cucLx3hiMle6zlOozjMIXE7Nwnj+nkjmRi9yaWF7tn8
	0UCbdHjV6owhcC/KuzVnAdjbFOa3mRChj1X4geBKxXn9sxmtGJjMMqISs3isyquRh4ZVWP
	ym/azaLMrq2xbnI9bvBQ/PX0u125gk0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4FBF8ABE3;
	Thu,  5 Nov 2020 11:33:15 +0000 (UTC)
Subject: Re: [PATCH v4.1 2/2] xen/evtchn: rework per event channel lock
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201104115739.20144-1-jgross@suse.com>
 <ae263d8f-b81d-4c47-2760-6ef3823ca780@suse.com>
 <f558dfae-ecec-9884-00de-4edd65e39b0f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e930bc95-eeac-b16e-48c8-ef7a5dcb1ec2@suse.com>
Date: Thu, 5 Nov 2020 12:33:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f558dfae-ecec-9884-00de-4edd65e39b0f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.11.2020 16:53, Jürgen Groß wrote:
> On 04.11.20 16:29, Jan Beulich wrote:
>>> @@ -738,7 +725,8 @@ int evtchn_send(struct domain *ld, unsigned int lport)
>>>   
>>>       lchn = evtchn_from_port(ld, lport);
>>>   
>>> -    spin_lock_irqsave(&lchn->lock, flags);
>>> +    if ( !evtchn_read_trylock(lchn) )
>>> +        return 0;
>>
>> Isn't there a change in behavior here? While sends through
>> ECS_UNBOUND ports indeed get silently ignored, ECS_FREE ones ought
>> to be getting -EINVAL (as should ECS_UNBOUND ones if they're
>> Xen-consumer ones). With the failed trylock you don't know which
>> of the two the port is in the process of being transitioned
>> to/from. The same would apply for other operations distinguishing
>> the two states. Right now both evtchn_status() and
>> evtchn_bind_vcpu() only use the domain-wide lock, but the latter
>> is getting switched by "evtchn: convert domain event lock to an
>> r/w one" (granted there's an RFC remark there whether that
>> transformation is worthwhile). Anyway, the main point of my remark
>> is that there's another subtlety here which I don't think becomes
>> obvious from description or comments - where the two states are
>> mentioned, it gets to look as if they can be treated equally.
> 
> Hmm, evtchn_send() seems to be called always with interrupts enabled.
> We could just use a standard read_lock() here if you think the different
> states should be treated as today.

This would avoid the caveat in this specific case, but it would
remain elsewhere (at least as an abstract trap to fall into). I
suppose evtchn_status() could use a regular read_lock() too, for
the same reason (if it was to be switched), and evtchn_bind_vcpu()
may need a write lock anyway (which is forbidden in your model,
i.e. I'd likely need to drop the switch to the finer grained lock
there).

>>> --- a/xen/include/xen/event.h
>>> +++ b/xen/include/xen/event.h
>>> @@ -105,6 +105,39 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>>>   #define bucket_from_port(d, p) \
>>>       ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>>>   
>>> +/*
>>> + * Lock an event channel exclusively. This is allowed only when the channel is
>>> + * free or unbound either when taking or when releasing the lock, as any
>>> + * concurrent operation on the event channel using evtchn_read_trylock() will
>>> + * just assume the event channel is free or unbound at the moment when the
>>> + * evtchn_read_trylock() returns false.
>>> + */
>>> +static inline void evtchn_write_lock(struct evtchn *evtchn)
>>> +{
>>> +    write_lock(&evtchn->lock);
>>> +
>>> +    evtchn->old_state = evtchn->state;
>>> +}
>>> +
>>> +static inline void evtchn_write_unlock(struct evtchn *evtchn)
>>> +{
>>> +    /* Enforce lock discipline. */
>>> +    ASSERT(evtchn->old_state == ECS_FREE || evtchn->old_state == ECS_UNBOUND ||
>>> +           evtchn->state == ECS_FREE || evtchn->state == ECS_UNBOUND);
>>> +
>>> +    write_unlock(&evtchn->lock);
>>> +}
>>
>> These two aren't needed outside of event_channel.c, are they? If
>> so, and if they ought to go in a header rather than directly into
>> the .c file (where I'd prefer the latter, for the sake of minimal
>> exposure), then it should be event_channel.h.
> 
> I wanted to have the locking functions in one place.
> 
> In case you prefer it otherwise (and you seem to do so) I'd rather move
> the write lock functions to the .c file.

Yes please.

Jan

