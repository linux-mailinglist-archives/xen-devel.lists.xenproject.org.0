Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F528D9C0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 08:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6449.17210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSZpy-0003OV-Ef; Wed, 14 Oct 2020 06:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6449.17210; Wed, 14 Oct 2020 06:00:34 +0000
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
	id 1kSZpy-0003O6-Bb; Wed, 14 Oct 2020 06:00:34 +0000
Received: by outflank-mailman (input) for mailman id 6449;
 Wed, 14 Oct 2020 06:00:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSZpw-0003O1-S1
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 06:00:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75ba719a-04e7-4d17-97cd-bf033d28b651;
 Wed, 14 Oct 2020 06:00:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BBA8BAFF7;
 Wed, 14 Oct 2020 06:00:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSZpw-0003O1-S1
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 06:00:32 +0000
X-Inumbo-ID: 75ba719a-04e7-4d17-97cd-bf033d28b651
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 75ba719a-04e7-4d17-97cd-bf033d28b651;
	Wed, 14 Oct 2020 06:00:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602655230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvtUh/JjDBZzHEfOflQD1P/EAJrul9ia2HCqSusmwUQ=;
	b=lB4esmQ6ApaVOc0fSsnQL4cI3Gd+3Lqb79F2j6+1737lHV0ydGgmSTC7DgTVWJtdfwHRG0
	AtE1MZTPLDXnPhTi8RKBWV2am1ZC+aJbcRFtktx4PrgoSBFYdP3v/aJHpyXxLMooYEUhUB
	AteWyiiwtGKQQGFFJDmMe7PeW0jUxbY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BBA8BAFF7;
	Wed, 14 Oct 2020 06:00:30 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
 <75c5328c-c061-7ddf-a34d-0cd8b93043fc@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dbaff977-796b-bbd3-64e5-fbe30817077f@suse.com>
Date: Wed, 14 Oct 2020 08:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <75c5328c-c061-7ddf-a34d-0cd8b93043fc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.20 17:28, Jan Beulich wrote:
> On 12.10.2020 11:27, Juergen Gross wrote:
>> @@ -798,9 +786,11 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
>>   
>>       d = v->domain;
>>       chn = evtchn_from_port(d, port);
>> -    spin_lock(&chn->lock);
>> -    evtchn_port_set_pending(d, v->vcpu_id, chn);
>> -    spin_unlock(&chn->lock);
>> +    if ( evtchn_tryread_lock(chn) )
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
>> +    if ( evtchn_tryread_lock(chn) )
>> +    {
>> +        evtchn_port_set_pending(d, v->vcpu_id, chn);
> 
> Is this simply a copy-and-paste mistake (re-using the code from
> send_guest_vcpu_virq()), or is there a reason you switch from
> where to obtain the vCPU to send to (in which case this ought
> to be mentioned in the description, and in which case you could
> use literal zero)?

Thanks for spotting! Its a copy-and-paste mistake.

> 
>> --- a/xen/include/xen/event.h
>> +++ b/xen/include/xen/event.h
>> @@ -105,6 +105,45 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>>   #define bucket_from_port(d, p) \
>>       ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>>   
>> +#define EVENT_WRITE_LOCK_INC    MAX_VIRT_CPUS
> 
> Isn't the ceiling on simultaneous readers the number of pCPU-s,
> and the value here then needs to be NR_CPUS + 1 to accommodate
> the maximum number of readers? Furthermore, with you dropping
> the disabling of interrupts, one pCPU can acquire a read lock
> now more than once, when interrupting a locked region.

Yes, I think you are right.

So at least 2 * (NR-CPUS + 1), or even 3 * (NR_CPUS + 1) for covering
NMIs, too?

> 
>> +static inline void evtchn_write_lock(struct evtchn *evtchn)
>> +{
>> +    int val;
>> +
>> +    /* No barrier needed, atomic_add_return() is full barrier. */
>> +    for ( val = atomic_add_return(EVENT_WRITE_LOCK_INC, &evtchn->lock);
>> +          val != EVENT_WRITE_LOCK_INC;
>> +          val = atomic_read(&evtchn->lock) )
>> +        cpu_relax();
>> +}
>> +
>> +static inline void evtchn_write_unlock(struct evtchn *evtchn)
>> +{
>> +    arch_lock_release_barrier();
>> +
>> +    atomic_sub(EVENT_WRITE_LOCK_INC, &evtchn->lock);
>> +}
>> +
>> +static inline bool evtchn_tryread_lock(struct evtchn *evtchn)
> 
> The corresponding "generic" function is read_trylock() - I'd
> suggest to use the same base name, with the evtchn_ prefix.

Okay.

> 
>> @@ -274,12 +312,12 @@ static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
>>       if ( port_is_valid(d, port) )
>>       {
>>           struct evtchn *evtchn = evtchn_from_port(d, port);
>> -        unsigned long flags;
>>   
>> -        spin_lock_irqsave(&evtchn->lock, flags);
>> -        if ( evtchn_usable(evtchn) )
>> +        if ( evtchn_tryread_lock(evtchn) && evtchn_usable(evtchn) )
>> +        {
>>               rc = evtchn_is_pending(d, evtchn);
>> -        spin_unlock_irqrestore(&evtchn->lock, flags);
>> +            evtchn_read_unlock(evtchn);
>> +        }
>>       }
> 
> This needs to be two nested if()-s, as you need to drop the lock
> even when evtchn_usable() returns false.

Oh, yes.


Juergen

