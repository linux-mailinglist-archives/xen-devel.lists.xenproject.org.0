Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8A2937FB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 11:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9019.24267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUnwH-0007hW-7s; Tue, 20 Oct 2020 09:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9019.24267; Tue, 20 Oct 2020 09:28:17 +0000
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
	id 1kUnwH-0007h7-4n; Tue, 20 Oct 2020 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 9019;
 Tue, 20 Oct 2020 09:28:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUnwG-0007h2-2I
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:28:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28d1500d-3cf4-4c7e-8b9c-526fd1e0456f;
 Tue, 20 Oct 2020 09:28:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD5A6ABCC;
 Tue, 20 Oct 2020 09:28:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUnwG-0007h2-2I
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:28:16 +0000
X-Inumbo-ID: 28d1500d-3cf4-4c7e-8b9c-526fd1e0456f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 28d1500d-3cf4-4c7e-8b9c-526fd1e0456f;
	Tue, 20 Oct 2020 09:28:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603186093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lt0Wrl6rx3rsiH6AE/De57HWZ93c+gPsRNaUPfUJcpE=;
	b=uDubRB768QTfgwBcKZMaRAs/ydYCT6r+vC1jryc5aj7gay9u1mcjrO9nhwScZSVzV8iOmv
	MKx46NDGo1QZOIpsnGD8eoruDZa2k4TPKHa5nPON/9Wlhc/OVCAg6tT364PjL3PD9vSrms
	crU3Fny5s+rDi0ed24vMQuo8C1/t4uo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BD5A6ABCC;
	Tue, 20 Oct 2020 09:28:13 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201016105839.14796-1-jgross@suse.com>
 <20201016105839.14796-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c5975b1-97ec-9bbb-0ed9-9055556215cd@suse.com>
Date: Tue, 20 Oct 2020 11:28:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201016105839.14796-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 12:58, Juergen Gross wrote:
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -660,11 +660,12 @@ void pv_shim_inject_evtchn(unsigned int port)
>      if ( port_is_valid(guest, port) )
>      {
>          struct evtchn *chn = evtchn_from_port(guest, port);
> -        unsigned long flags;
>  
> -        spin_lock_irqsave(&chn->lock, flags);
> -        evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
> -        spin_unlock_irqrestore(&chn->lock, flags);
> +        if ( evtchn_read_trylock(chn) )
> +        {
> +            evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
> +            evtchn_read_unlock(chn);
> +        }

Does this want some form of else, e.g. at least a printk_once()?

> @@ -360,7 +352,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>      if ( rc )
>          goto out;
>  
> -    flags = double_evtchn_lock(lchn, rchn);
> +    double_evtchn_lock(lchn, rchn);

This introduces an unfortunate conflict with my conversion of
the per-domain event lock to an rw one: It acquires rd's lock
in read mode only, while the requirements here would not allow
doing so. (Same in evtchn_close() then.)

> @@ -736,7 +723,8 @@ int evtchn_send(struct domain *ld, unsigned int lport)
>  
>      lchn = evtchn_from_port(ld, lport);
>  
> -    spin_lock_irqsave(&lchn->lock, flags);
> +    if ( !evtchn_read_trylock(lchn) )
> +        return 0;

With this, the auxiliary call to xsm_evtchn_send() up from
here should also go away again (possibly in a separate follow-
on, which would then likely be a clean revert).

> @@ -798,9 +786,11 @@ void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
>  
>      d = v->domain;
>      chn = evtchn_from_port(d, port);
> -    spin_lock(&chn->lock);
> -    evtchn_port_set_pending(d, v->vcpu_id, chn);
> -    spin_unlock(&chn->lock);
> +    if ( evtchn_read_trylock(chn) )
> +    {
> +        evtchn_port_set_pending(d, v->vcpu_id, chn);
> +        evtchn_read_unlock(chn);
> +    }
>  
>   out:
>      spin_unlock_irqrestore(&v->virq_lock, flags);
> @@ -829,9 +819,11 @@ void send_guest_global_virq(struct domain *d, uint32_t virq)
>          goto out;
>  
>      chn = evtchn_from_port(d, port);
> -    spin_lock(&chn->lock);
> -    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
> -    spin_unlock(&chn->lock);
> +    if ( evtchn_read_trylock(chn) )
> +    {
> +        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
> +        evtchn_read_unlock(chn);
> +    }
>  
>   out:
>      spin_unlock_irqrestore(&v->virq_lock, flags);

As said before, I think these lock uses can go away altogether.
I shall put together a patch.

And on the whole I'd really prefer if we first convinced ourselves
that there's no way to simply get rid of the IRQ-safe locking
forms instead, before taking a decision to go with this model with
its extra constraints.

> @@ -1060,15 +1053,16 @@ int evtchn_unmask(unsigned int port)
>  {
>      struct domain *d = current->domain;
>      struct evtchn *evtchn;
> -    unsigned long flags;
>  
>      if ( unlikely(!port_is_valid(d, port)) )
>          return -EINVAL;
>  
>      evtchn = evtchn_from_port(d, port);
> -    spin_lock_irqsave(&evtchn->lock, flags);
> -    evtchn_port_unmask(d, evtchn);
> -    spin_unlock_irqrestore(&evtchn->lock, flags);
> +    if ( evtchn_read_trylock(evtchn) )
> +    {
> +        evtchn_port_unmask(d, evtchn);
> +        evtchn_read_unlock(evtchn);
> +    }

I think this wants mentioning together with send / query in the
description.

> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -105,6 +105,60 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>  #define bucket_from_port(d, p) \
>      ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>  
> +#define EVENT_WRITE_LOCK_INC    INT_MIN
> +
> +/*
> + * Lock an event channel exclusively. This is allowed only with holding
> + * d->event_lock AND when the channel is free or unbound either when taking
> + * or when releasing the lock, as any concurrent operation on the event
> + * channel using evtchn_read_trylock() will just assume the event channel is
> + * free or unbound at the moment.

... when the evtchn_read_trylock() returns false.

> + */
> +static inline void evtchn_write_lock(struct evtchn *evtchn)
> +{
> +    int val;
> +
> +    /*
> +     * The lock can't be held by a writer already, as all writers need to
> +     * hold d->event_lock.
> +     */
> +    ASSERT(atomic_read(&evtchn->lock) >= 0);
> +
> +    /* No barrier needed, atomic_add_return() is full barrier. */
> +    for ( val = atomic_add_return(EVENT_WRITE_LOCK_INC, &evtchn->lock);
> +          val != EVENT_WRITE_LOCK_INC;

The _INC suffix is slightly odd for this 2nd use, but I guess
the dual use will make it so for about any name you may pick.

> +          val = atomic_read(&evtchn->lock) )
> +        cpu_relax();
> +}
> +
> +static inline void evtchn_write_unlock(struct evtchn *evtchn)
> +{
> +    arch_lock_release_barrier();
> +
> +    atomic_sub(EVENT_WRITE_LOCK_INC, &evtchn->lock);
> +}
> +
> +static inline bool evtchn_read_trylock(struct evtchn *evtchn)
> +{
> +    if ( atomic_read(&evtchn->lock) < 0 )
> +        return false;
> +
> +    /* No barrier needed, atomic_inc_return() is full barrier. */
> +    if ( atomic_inc_return(&evtchn->lock) >= 0 )

atomic_*_return() return the new value, so I think you mean ">"
here?

Jan

