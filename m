Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0872EF939
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 21:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63834.113215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyQb-0003vE-UV; Fri, 08 Jan 2021 20:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63834.113215; Fri, 08 Jan 2021 20:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyQb-0003un-R4; Fri, 08 Jan 2021 20:32:09 +0000
Received: by outflank-mailman (input) for mailman id 63834;
 Fri, 08 Jan 2021 20:32:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxyQb-0003uc-2p
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 20:32:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxyQX-0000MT-1f; Fri, 08 Jan 2021 20:32:05 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxyQW-0007ln-KA; Fri, 08 Jan 2021 20:32:04 +0000
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
	bh=DUov5tXuZGkhZ9xt1Ow5i5JkmeVo5a7uGpqB1zLq0Ng=; b=Plidu1v/N6d6Tyva7mqSINDmLj
	2HpHoXK3Til7V+5GHD2IicTHf+yb0gZInhDVrHaI+aLyXzyjvioBOQfUt4iBT7L/mAExHJI18fR0D
	BLFxCSeK1Hb1X9xicvFEtt+lTsVC8GTPvOOTABiXmPjoLPJPo2/kqMiqFw0gnSo2IOY8=;
Subject: Re: [PATCH v4 01/10] evtchn: use per-channel lock where possible
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <e03cb246-c08b-5977-9137-a38974364445@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3c393170-09f9-6d31-c227-b599f8769e35@xen.org>
Date: Fri, 8 Jan 2021 20:32:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e03cb246-c08b-5977-9137-a38974364445@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 13:09, Jan Beulich wrote:
> Neither evtchn_status() nor domain_dump_evtchn_info() nor
> flask_get_peer_sid() need to hold the per-domain lock - they all only
> read a single channel's state (at a time, in the dump case).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: New.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -968,15 +968,16 @@ int evtchn_status(evtchn_status_t *statu
>       if ( d == NULL )
>           return -ESRCH;
>   
> -    spin_lock(&d->event_lock);
> -
>       if ( !port_is_valid(d, port) )

There is one issue that is now becoming more apparent. To be clear, the 
problem is not in this patch, but I think it is the best place to 
discuss it as d->event_lock may be part of the solution.

After XSA-344, evtchn_destroy() will end up to decrement d->valid_evtchns.

Given that evtchn_status() can work on the non-current domain, it would 
be possible to run it concurrently with evtchn_destroy(). As a 
consequence, port_is_valid() will be unstable as a valid event channel 
may turn invalid.

AFAICT, we are getting away so far, as the memory is not freed until the 
domain is fully destroyed. However, we re-introduced XSA-338 in a 
different way.

To be clear this is not the fault of this patch. But I don't think this 
is sane to re-introduce a behavior that lead us to an XSA.

I can see two solutions:
   1) Use d->event_lock to protect port_is_valid() when d != 
current->domain. This would require evtchn_destroy() to grab the lock 
when updating d->valid_evtchns.
   2) Never decrement d->valid_evtchns and use a different field for 
closing ports

I am not a big fan of 1) because this is muddying the already complex 
locking situation in the event channel code. But I suggested it because 
I wasn't sure whether you would be happy with 2).

If you are happy with 2), then the lock can be dropped here. I would be 
happy to send the patch for either 1) or 2) depending on the agreement here.

Cheers,


>       {
> -        rc = -EINVAL;
> -        goto out;
> +        rcu_unlock_domain(d);
> +        return -EINVAL;
>       }
>   
>       chn = evtchn_from_port(d, port);
> +
> +    evtchn_read_lock(chn);
> +
>       if ( consumer_is_xen(chn) )
>       {
>           rc = -EACCES;
> @@ -1021,7 +1022,7 @@ int evtchn_status(evtchn_status_t *statu
>       status->vcpu = chn->notify_vcpu_id;
>   
>    out:
> -    spin_unlock(&d->event_lock);
> +    evtchn_read_unlock(chn);
>       rcu_unlock_domain(d);
>   
>       return rc;
> @@ -1576,22 +1577,32 @@ void evtchn_move_pirqs(struct vcpu *v)
>   static void domain_dump_evtchn_info(struct domain *d)
>   {
>       unsigned int port;
> -    int irq;
>   
>       printk("Event channel information for domain %d:\n"
>              "Polling vCPUs: {%*pbl}\n"
>              "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
>   
> -    spin_lock(&d->event_lock);
> -
>       for ( port = 1; port_is_valid(d, port); ++port )
>       {
> -        const struct evtchn *chn;
> +        struct evtchn *chn;
>           char *ssid;
>   
> +        if ( !(port & 0x3f) )
> +            process_pending_softirqs();
> +
>           chn = evtchn_from_port(d, port);
> +
> +        if ( !evtchn_read_trylock(chn) )
> +        {
> +            printk("    %4u in flux\n", port);
> +            continue;
> +        }
> +
>           if ( chn->state == ECS_FREE )
> +        {
> +            evtchn_read_unlock(chn);
>               continue;
> +        }
>   
>           printk("    %4u [%d/%d/",
>                  port,
> @@ -1601,26 +1612,49 @@ static void domain_dump_evtchn_info(stru
>           printk("]: s=%d n=%d x=%d",
>                  chn->state, chn->notify_vcpu_id, chn->xen_consumer);
>   
> +        ssid = xsm_show_security_evtchn(d, chn);
> +
>           switch ( chn->state )
>           {
>           case ECS_UNBOUND:
>               printk(" d=%d", chn->u.unbound.remote_domid);
>               break;
> +
>           case ECS_INTERDOMAIN:
>               printk(" d=%d p=%d",
>                      chn->u.interdomain.remote_dom->domain_id,
>                      chn->u.interdomain.remote_port);
>               break;
> -        case ECS_PIRQ:
> -            irq = domain_pirq_to_irq(d, chn->u.pirq.irq);
> -            printk(" p=%d i=%d", chn->u.pirq.irq, irq);
> +
> +        case ECS_PIRQ: {
> +            unsigned int pirq = chn->u.pirq.irq;
> +
> +            /*
> +             * The per-channel locks nest inside the per-domain one, so we
> +             * can't acquire the latter without first letting go of the former.
> +             */
> +            evtchn_read_unlock(chn);
> +            chn = NULL;
> +            if ( spin_trylock(&d->event_lock) )
> +            {
> +                int irq = domain_pirq_to_irq(d, pirq);
> +
> +                spin_unlock(&d->event_lock);
> +                printk(" p=%u i=%d", pirq, irq);
> +            }
> +            else
> +                printk(" p=%u i=?", pirq);
>               break;
> +        }
> +
>           case ECS_VIRQ:
>               printk(" v=%d", chn->u.virq);
>               break;
>           }
>   
> -        ssid = xsm_show_security_evtchn(d, chn);
> +        if ( chn )
> +            evtchn_read_unlock(chn);
> +
>           if (ssid) {
>               printk(" Z=%s\n", ssid);
>               xfree(ssid);
> @@ -1628,8 +1662,6 @@ static void domain_dump_evtchn_info(stru
>               printk("\n");
>           }
>       }
> -
> -    spin_unlock(&d->event_lock);
>   }
>   
>   static void dump_evtchn_info(unsigned char key)
> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -555,12 +555,13 @@ static int flask_get_peer_sid(struct xen
>       struct evtchn *chn;
>       struct domain_security_struct *dsec;
>   
> -    spin_lock(&d->event_lock);
> -
>       if ( !port_is_valid(d, arg->evtchn) )
> -        goto out;
> +        return -EINVAL;
>   
>       chn = evtchn_from_port(d, arg->evtchn);
> +
> +    evtchn_read_lock(chn);
> +
>       if ( chn->state != ECS_INTERDOMAIN )
>           goto out;
>   
> @@ -573,7 +574,7 @@ static int flask_get_peer_sid(struct xen
>       rv = 0;
>   
>    out:
> -    spin_unlock(&d->event_lock);
> +    evtchn_read_unlock(chn);
>       return rv;
>   }
>   
> 

-- 
Julien Grall

