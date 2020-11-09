Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241C82AB79F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 12:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22422.48728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc5ol-0006ub-35; Mon, 09 Nov 2020 11:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22422.48728; Mon, 09 Nov 2020 11:58:39 +0000
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
	id 1kc5ok-0006uC-WB; Mon, 09 Nov 2020 11:58:38 +0000
Received: by outflank-mailman (input) for mailman id 22422;
 Mon, 09 Nov 2020 11:58:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kc5oj-0006u7-Uz
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 11:58:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08cfcfc7-c043-4b0c-b0dc-f6b3ac316f51;
 Mon, 09 Nov 2020 11:58:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4995ABDE;
 Mon,  9 Nov 2020 11:58:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kc5oj-0006u7-Uz
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 11:58:37 +0000
X-Inumbo-ID: 08cfcfc7-c043-4b0c-b0dc-f6b3ac316f51
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 08cfcfc7-c043-4b0c-b0dc-f6b3ac316f51;
	Mon, 09 Nov 2020 11:58:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604923115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6SX85wqVND53dpcJa/GHF2mK9WMNe5pyTVY7T8E/fo=;
	b=tdRkG1H7+zTt48OA/wek3SfbxKStGo5pDqrWxhWm+YU2toS9paCGJDJ+J0E52Ybp6Wwccw
	I0hirOCmHLnIczjTw+FqN33/Ruj4mEQAFLzMzO2ik5GaLZrZe2SztzrqPiQRsqqYhB9MMM
	ynf6hFh7EtZhHJHcw4kgIDeh4KqEx0o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D4995ABDE;
	Mon,  9 Nov 2020 11:58:34 +0000 (UTC)
Subject: Re: [PATCH v5 2/2] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109064128.3908-1-jgross@suse.com>
 <20201109064128.3908-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df9737a4-f90a-0498-b67d-ce254b835287@suse.com>
Date: Mon, 9 Nov 2020 12:58:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109064128.3908-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 07:41, Juergen Gross wrote:
> Currently the lock for a single event channel needs to be taken with
> interrupts off, which causes deadlocks in some cases.
> 
> Rework the per event channel lock to be non-blocking for the case of
> sending an event and removing the need for disabling interrupts for
> taking the lock.
> 
> The lock is needed for avoiding races between event channel state
> changes (creation, closing, binding) against normal operations (set
> pending, [un]masking, priority changes).
> 
> Use a rwlock, but with some restrictions:
> 
> - normal operations use read_trylock(), in case of not obtaining the
>   lock the operation is omitted or a default state is returned
> 
> - closing an event channel is using write_lock(), with ASSERT()ing that
>   the lock is taken as writer only when the state of the event channel
>   is either before or after the locked region appropriate (either free
>   or unbound).

This has become stale, and may have been incomplete already before:
- Normal operations now may use two diffeent approaches. Which one
is to be used when would want writing down here.
- write_lock() use goes beyond closing.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2495,14 +2495,12 @@ static void dump_irqs(unsigned char key)
>                  pirq = domain_irq_to_pirq(d, irq);
>                  info = pirq_info(d, pirq);
>                  evtchn = evtchn_from_port(d, info->evtchn);
> -                local_irq_disable();
> -                if ( spin_trylock(&evtchn->lock) )
> +                if ( evtchn_read_trylock(evtchn) )
>                  {
>                      pending = evtchn_is_pending(d, evtchn);
>                      masked = evtchn_is_masked(d, evtchn);
> -                    spin_unlock(&evtchn->lock);
> +                    evtchn_read_unlock(evtchn);
>                  }
> -                local_irq_enable();
>                  printk("d%d:%3d(%c%c%c)%c",
>                         d->domain_id, pirq, "-P?"[pending],
>                         "-M?"[masked], info->masked ? 'M' : '-',

Using trylock here has a reason different from that in sending
functions, aiui. Please say so in the description, to justify
exposure of evtchn_read_lock().

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

Does this need trylock?

> @@ -1068,15 +1088,16 @@ int evtchn_unmask(unsigned int port)
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

I think this one could as well use plain read_lock().

> @@ -234,12 +244,13 @@ static inline bool evtchn_is_masked(const struct domain *d,
>  static inline bool evtchn_port_is_masked(struct domain *d, evtchn_port_t port)
>  {
>      struct evtchn *evtchn = evtchn_from_port(d, port);
> -    bool rc;
> -    unsigned long flags;
> +    bool rc = true;
>  
> -    spin_lock_irqsave(&evtchn->lock, flags);
> -    rc = evtchn_is_masked(d, evtchn);
> -    spin_unlock_irqrestore(&evtchn->lock, flags);
> +    if ( evtchn_read_trylock(evtchn) )
> +    {
> +        rc = evtchn_is_masked(d, evtchn);
> +        evtchn_read_unlock(evtchn);
> +    }
>  
>      return rc;
>  }
> @@ -252,12 +263,13 @@ static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
>      if ( port_is_valid(d, port) )
>      {
>          struct evtchn *evtchn = evtchn_from_port(d, port);
> -        unsigned long flags;
>  
> -        spin_lock_irqsave(&evtchn->lock, flags);
> -        if ( evtchn_usable(evtchn) )
> -            rc = evtchn_is_pending(d, evtchn);
> -        spin_unlock_irqrestore(&evtchn->lock, flags);
> +        if ( evtchn_read_trylock(evtchn) )
> +        {
> +            if ( evtchn_usable(evtchn) )
> +                rc = evtchn_is_pending(d, evtchn);
> +            evtchn_read_unlock(evtchn);
> +        }
>      }
>  
>      return rc;

At least for the latter I suppose it should also be plain read_lock().
We ought to keep the exceptions to where they're actually needed, I
think.

Jan

