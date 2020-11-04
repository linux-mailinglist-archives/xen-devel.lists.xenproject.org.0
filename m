Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E82A6837
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 16:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19392.44554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaL6K-0004Mo-0E; Wed, 04 Nov 2020 15:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19392.44554; Wed, 04 Nov 2020 15:53:31 +0000
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
	id 1kaL6J-0004MP-Sw; Wed, 04 Nov 2020 15:53:31 +0000
Received: by outflank-mailman (input) for mailman id 19392;
 Wed, 04 Nov 2020 15:53:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaL6I-0004MK-SY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 15:53:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 372b27a0-f417-48be-9aaf-1dfcd7aec012;
 Wed, 04 Nov 2020 15:53:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4F80AE21;
 Wed,  4 Nov 2020 15:53:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaL6I-0004MK-SY
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 15:53:30 +0000
X-Inumbo-ID: 372b27a0-f417-48be-9aaf-1dfcd7aec012
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 372b27a0-f417-48be-9aaf-1dfcd7aec012;
	Wed, 04 Nov 2020 15:53:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604505208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJFO2VI+vE9y/ADUibwFoqOaJoZzmYkwl15bMIxXOSo=;
	b=hZ0dMu4mkggltgqWTE6FmM4bHlY8JvoI6t/2VKyfRXwU5wGMIjYyHldT/thvUQuA4CNbz5
	EcA0H+Ce++xDhVKAQ8RnLSn1pOEO05AH4SVSRpcgj/YnxFCa7AQwbK+oLDoeCDQroaSIdr
	P2TrjLj4TLUOYD+gh7JYwflXBNGEfXg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C4F80AE21;
	Wed,  4 Nov 2020 15:53:28 +0000 (UTC)
Subject: Re: [PATCH v4.1 2/2] xen/evtchn: rework per event channel lock
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201104115739.20144-1-jgross@suse.com>
 <ae263d8f-b81d-4c47-2760-6ef3823ca780@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f558dfae-ecec-9884-00de-4edd65e39b0f@suse.com>
Date: Wed, 4 Nov 2020 16:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ae263d8f-b81d-4c47-2760-6ef3823ca780@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.11.20 16:29, Jan Beulich wrote:
>> @@ -738,7 +725,8 @@ int evtchn_send(struct domain *ld, unsigned int lport)
>>   
>>       lchn = evtchn_from_port(ld, lport);
>>   
>> -    spin_lock_irqsave(&lchn->lock, flags);
>> +    if ( !evtchn_read_trylock(lchn) )
>> +        return 0;
> 
> Isn't there a change in behavior here? While sends through
> ECS_UNBOUND ports indeed get silently ignored, ECS_FREE ones ought
> to be getting -EINVAL (as should ECS_UNBOUND ones if they're
> Xen-consumer ones). With the failed trylock you don't know which
> of the two the port is in the process of being transitioned
> to/from. The same would apply for other operations distinguishing
> the two states. Right now both evtchn_status() and
> evtchn_bind_vcpu() only use the domain-wide lock, but the latter
> is getting switched by "evtchn: convert domain event lock to an
> r/w one" (granted there's an RFC remark there whether that
> transformation is worthwhile). Anyway, the main point of my remark
> is that there's another subtlety here which I don't think becomes
> obvious from description or comments - where the two states are
> mentioned, it gets to look as if they can be treated equally.

Hmm, evtchn_send() seems to be called always with interrupts enabled.
We could just use a standard read_lock() here if you think the different
states should be treated as today.

> 
>> --- a/xen/include/xen/event.h
>> +++ b/xen/include/xen/event.h
>> @@ -105,6 +105,39 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>>   #define bucket_from_port(d, p) \
>>       ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>>   
>> +/*
>> + * Lock an event channel exclusively. This is allowed only when the channel is
>> + * free or unbound either when taking or when releasing the lock, as any
>> + * concurrent operation on the event channel using evtchn_read_trylock() will
>> + * just assume the event channel is free or unbound at the moment when the
>> + * evtchn_read_trylock() returns false.
>> + */
>> +static inline void evtchn_write_lock(struct evtchn *evtchn)
>> +{
>> +    write_lock(&evtchn->lock);
>> +
>> +    evtchn->old_state = evtchn->state;
>> +}
>> +
>> +static inline void evtchn_write_unlock(struct evtchn *evtchn)
>> +{
>> +    /* Enforce lock discipline. */
>> +    ASSERT(evtchn->old_state == ECS_FREE || evtchn->old_state == ECS_UNBOUND ||
>> +           evtchn->state == ECS_FREE || evtchn->state == ECS_UNBOUND);
>> +
>> +    write_unlock(&evtchn->lock);
>> +}
> 
> These two aren't needed outside of event_channel.c, are they? If
> so, and if they ought to go in a header rather than directly into
> the .c file (where I'd prefer the latter, for the sake of minimal
> exposure), then it should be event_channel.h.

I wanted to have the locking functions in one place.

In case you prefer it otherwise (and you seem to do so) I'd rather move
the write lock functions to the .c file.

> 
>> @@ -114,6 +114,7 @@ struct evtchn
>>           u16 virq;      /* state == ECS_VIRQ */
>>       } u;
>>       u8 priority;
>> +    u8 old_state;      /* State when taking lock in write mode. */
>>       u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
>>   #ifdef CONFIG_XSM
>>       union {
> 
> While there's a gap here after the prior patch (which I'm still
> not overly happy about), I'm still inclined to ask that the field
> be put inside #ifndef NDEBUG, as its only consumer is an
> ASSERT().

Fine with me


Juergen

