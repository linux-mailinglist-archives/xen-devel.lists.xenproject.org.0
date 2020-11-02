Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B12A2BB6
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 14:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17661.42459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZa5z-0002Or-QB; Mon, 02 Nov 2020 13:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17661.42459; Mon, 02 Nov 2020 13:42:03 +0000
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
	id 1kZa5z-0002OS-NE; Mon, 02 Nov 2020 13:42:03 +0000
Received: by outflank-mailman (input) for mailman id 17661;
 Mon, 02 Nov 2020 13:42:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kZa5y-0002ON-Qn
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:42:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1130bbd7-d25c-4f8d-a91d-a2b6f5882fb1;
 Mon, 02 Nov 2020 13:42:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2EA7B933;
 Mon,  2 Nov 2020 13:41:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kZa5y-0002ON-Qn
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 13:42:02 +0000
X-Inumbo-ID: 1130bbd7-d25c-4f8d-a91d-a2b6f5882fb1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 1130bbd7-d25c-4f8d-a91d-a2b6f5882fb1;
	Mon, 02 Nov 2020 13:42:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604324519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDUO+DQwIHvMULVJb6sBEqas3ynl/02HlJzoSrE8BzI=;
	b=NbkBkTTxXf5IcYoUWSvLRgsLmb1m1nJ58yo3MtJ5nS49cdUwODrzziyMfyZb8asJf341wu
	Td5cEG6HmQ190C0D0YQxIHFIHcQ6Co7vUgOPAWA84ZlnAwLzacl74cIC7/7Rj/PfR6fw6L
	NWTwIxmCZvHNVwBOxRdCDojjzFaF0BM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E2EA7B933;
	Mon,  2 Nov 2020 13:41:58 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] xen/evtchn: rework per event channel lock
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201016105839.14796-1-jgross@suse.com>
 <20201016105839.14796-3-jgross@suse.com>
 <0c5975b1-97ec-9bbb-0ed9-9055556215cd@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0c39eb60-9843-9659-f7c5-4e2c3e697ee0@suse.com>
Date: Mon, 2 Nov 2020 14:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0c5975b1-97ec-9bbb-0ed9-9055556215cd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.20 11:28, Jan Beulich wrote:
> On 16.10.2020 12:58, Juergen Gross wrote:
>> --- a/xen/arch/x86/pv/shim.c
>> +++ b/xen/arch/x86/pv/shim.c
>> @@ -660,11 +660,12 @@ void pv_shim_inject_evtchn(unsigned int port)
>>       if ( port_is_valid(guest, port) )
>>       {
>>           struct evtchn *chn = evtchn_from_port(guest, port);
>> -        unsigned long flags;
>>   
>> -        spin_lock_irqsave(&chn->lock, flags);
>> -        evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
>> -        spin_unlock_irqrestore(&chn->lock, flags);
>> +        if ( evtchn_read_trylock(chn) )
>> +        {
>> +            evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
>> +            evtchn_read_unlock(chn);
>> +        }
> 
> Does this want some form of else, e.g. at least a printk_once()?

No, I don't think so.

This is just a race with the port_is_valid() test above where the
port is just being switched to invalid.

> 
>> @@ -360,7 +352,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>>       if ( rc )
>>           goto out;
>>   
>> -    flags = double_evtchn_lock(lchn, rchn);
>> +    double_evtchn_lock(lchn, rchn);
> 
> This introduces an unfortunate conflict with my conversion of
> the per-domain event lock to an rw one: It acquires rd's lock
> in read mode only, while the requirements here would not allow
> doing so. (Same in evtchn_close() then.)

Is it a problem to use write mode for those cases?

> 
>> @@ -736,7 +723,8 @@ int evtchn_send(struct domain *ld, unsigned int lport)
>>   
>>       lchn = evtchn_from_port(ld, lport);
>>   
>> -    spin_lock_irqsave(&lchn->lock, flags);
>> +    if ( !evtchn_read_trylock(lchn) )
>> +        return 0;
> 
> With this, the auxiliary call to xsm_evtchn_send() up from
> here should also go away again (possibly in a separate follow-
> on, which would then likely be a clean revert).

Yes.

> 
>> @@ -798,9 +786,11 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
>>   
>>       d = v->domain;
>>       chn = evtchn_from_port(d, port);
>> -    spin_lock(&chn->lock);
>> -    evtchn_port_set_pending(d, v->vcpu_id, chn);
>> -    spin_unlock(&chn->lock);
>> +    if ( evtchn_read_trylock(chn) )
>> +    {
>> +        evtchn_port_set_pending(d, v->vcpu_id, chn);
>> +        evtchn_read_unlock(chn);
>> +    }
>>   
>>    out:
>>       spin_unlock_irqrestore(&v->virq_lock, flags);
>> @@ -829,9 +819,11 @@ void send_guest_global_virq(struct domain *d, uint32_t virq)
>>           goto out;
>>   
>>       chn = evtchn_from_port(d, port);
>> -    spin_lock(&chn->lock);
>> -    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
>> -    spin_unlock(&chn->lock);
>> +    if ( evtchn_read_trylock(chn) )
>> +    {
>> +        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
>> +        evtchn_read_unlock(chn);
>> +    }
>>   
>>    out:
>>       spin_unlock_irqrestore(&v->virq_lock, flags);
> 
> As said before, I think these lock uses can go away altogether.
> I shall put together a patch.
> 
> And on the whole I'd really prefer if we first convinced ourselves
> that there's no way to simply get rid of the IRQ-safe locking
> forms instead, before taking a decision to go with this model with
> its extra constraints.
> 
>> @@ -1060,15 +1053,16 @@ int evtchn_unmask(unsigned int port)
>>   {
>>       struct domain *d = current->domain;
>>       struct evtchn *evtchn;
>> -    unsigned long flags;
>>   
>>       if ( unlikely(!port_is_valid(d, port)) )
>>           return -EINVAL;
>>   
>>       evtchn = evtchn_from_port(d, port);
>> -    spin_lock_irqsave(&evtchn->lock, flags);
>> -    evtchn_port_unmask(d, evtchn);
>> -    spin_unlock_irqrestore(&evtchn->lock, flags);
>> +    if ( evtchn_read_trylock(evtchn) )
>> +    {
>> +        evtchn_port_unmask(d, evtchn);
>> +        evtchn_read_unlock(evtchn);
>> +    }
> 
> I think this wants mentioning together with send / query in the
> description.

Okay.

> 
>> --- a/xen/include/xen/event.h
>> +++ b/xen/include/xen/event.h
>> @@ -105,6 +105,60 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>>   #define bucket_from_port(d, p) \
>>       ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>>   
>> +#define EVENT_WRITE_LOCK_INC    INT_MIN
>> +
>> +/*
>> + * Lock an event channel exclusively. This is allowed only with holding
>> + * d->event_lock AND when the channel is free or unbound either when taking
>> + * or when releasing the lock, as any concurrent operation on the event
>> + * channel using evtchn_read_trylock() will just assume the event channel is
>> + * free or unbound at the moment.
> 
> ... when the evtchn_read_trylock() returns false.

Okay.

> 
>> + */
>> +static inline void evtchn_write_lock(struct evtchn *evtchn)
>> +{
>> +    int val;
>> +
>> +    /*
>> +     * The lock can't be held by a writer already, as all writers need to
>> +     * hold d->event_lock.
>> +     */
>> +    ASSERT(atomic_read(&evtchn->lock) >= 0);
>> +
>> +    /* No barrier needed, atomic_add_return() is full barrier. */
>> +    for ( val = atomic_add_return(EVENT_WRITE_LOCK_INC, &evtchn->lock);
>> +          val != EVENT_WRITE_LOCK_INC;
> 
> The _INC suffix is slightly odd for this 2nd use, but I guess
> the dual use will make it so for about any name you may pick.

I'll switch to a normal rwlock in V4.


Juergen

