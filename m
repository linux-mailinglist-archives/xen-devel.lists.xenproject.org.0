Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6235710F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106784.204181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUASc-0008Ni-DL; Wed, 07 Apr 2021 15:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106784.204181; Wed, 07 Apr 2021 15:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUASc-0008NI-A3; Wed, 07 Apr 2021 15:51:18 +0000
Received: by outflank-mailman (input) for mailman id 106784;
 Wed, 07 Apr 2021 15:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUASa-0008ND-Ha
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:51:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb1f6193-4909-446a-b680-92eb6c454dee;
 Wed, 07 Apr 2021 15:51:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CF64B17A;
 Wed,  7 Apr 2021 15:51:14 +0000 (UTC)
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
X-Inumbo-ID: cb1f6193-4909-446a-b680-92eb6c454dee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617810674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36g4tBJYkFl96eornkmZi6TegJJU/GrB2pStwKTEVeg=;
	b=oyO1VPv9PqNGf7TeXYArMHt00GP2UUK+w3gKKIVir3ytaDDlsmq3TfGpzryb4r6W5eKIOg
	coQ24OdTbziB8mNw4bspNGUhEjNjEY4A9r041r/AdxRYHYdIj2dO0o8EGnYUgpCUowA0y/
	/twISYtMvHQ3xHKncxMVeCEJ5uOkbPQ=
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
Date: Wed, 7 Apr 2021 17:51:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -595,6 +595,69 @@ int hvm_local_events_need_delivery(struct vcpu *v)
>      return !hvm_interrupt_blocked(v, intack);
>  }
>  
> +int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
> +                              struct hvm_gsi_eoi_callback *cb)
> +{
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> +
> +    if ( gsi >= hvm_irq->nr_gsis )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return -EINVAL;
> +    }
> +
> +    write_lock(&hvm_irq->gsi_callbacks_lock);
> +    list_add(&cb->list, &hvm_irq->gsi_callbacks[gsi]);
> +    write_unlock(&hvm_irq->gsi_callbacks_lock);
> +
> +    return 0;
> +}
> +
> +void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
> +                                 struct hvm_gsi_eoi_callback *cb)
> +{
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> +    const struct list_head *tmp;
> +
> +    if ( gsi >= hvm_irq->nr_gsis )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    write_lock(&hvm_irq->gsi_callbacks_lock);
> +    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
> +        if ( tmp == &cb->list )
> +        {
> +            list_del(&cb->list);
> +            break;
> +        }
> +    write_unlock(&hvm_irq->gsi_callbacks_lock);
> +}

Perhaps somehow flag, at least in debug builds, if the callback
wasn#t found?

> +void hvm_gsi_execute_callbacks(unsigned int gsi)
> +{
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(current->domain);
> +    struct hvm_gsi_eoi_callback *cb;
> +
> +    read_lock(&hvm_irq->gsi_callbacks_lock);
> +    list_for_each_entry ( cb, &hvm_irq->gsi_callbacks[gsi], list )
> +        cb->callback(gsi, cb->data);
> +    read_unlock(&hvm_irq->gsi_callbacks_lock);
> +}

Just as an observation (for now at least) - holding the lock here
means the callbacks cannot re-register themselves.

> +bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi)
> +{
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> +    bool has_callbacks;
> +
> +    read_lock(&hvm_irq->gsi_callbacks_lock);
> +    has_callbacks = !list_empty(&hvm_irq->gsi_callbacks[gsi]);
> +    read_unlock(&hvm_irq->gsi_callbacks_lock);
> +
> +    return has_callbacks;
> +}

What use is this function? Its result is stale by the time the
caller can look at it, as you've dropped the lock.

> @@ -421,13 +423,25 @@ static void eoi_callback(unsigned int vector, void *data)
>              if ( is_iommu_enabled(d) )
>              {
>                  spin_unlock(&d->arch.hvm.irq_lock);
> -                hvm_dpci_eoi(vioapic->base_gsi + pin);
> +                hvm_dpci_eoi(gsi);
>                  spin_lock(&d->arch.hvm.irq_lock);
>              }
>  
> +            /*
> +             * Callbacks don't expect to be executed with any lock held, so
> +             * drop the lock that protects the vIO-APIC fields from changing.
> +             *
> +             * Note that the redirection entry itself cannot go away, so upon
> +             * retaking the lock we only need to avoid making assumptions on
> +             * redirection entry field values (ie: recheck the IRR field).
> +             */
> +            spin_unlock(&d->arch.hvm.irq_lock);
> +            hvm_gsi_execute_callbacks(gsi);
> +            spin_lock(&d->arch.hvm.irq_lock);

The two pairs of unlock / re-lock want folding, I think - there's
no point causing extra contention on the lock here.

> @@ -443,7 +457,8 @@ static void ioapic_inj_irq(
>      struct vlapic *target,
>      uint8_t vector,
>      uint8_t trig_mode,
> -    uint8_t delivery_mode)
> +    uint8_t delivery_mode,
> +    bool callback)
>  {
>      HVM_DBG_LOG(DBG_LEVEL_IOAPIC, "irq %d trig %d deliv %d",
>                  vector, trig_mode, delivery_mode);
> @@ -452,7 +467,7 @@ static void ioapic_inj_irq(
>             (delivery_mode == dest_LowestPrio));
>  
>      vlapic_set_irq_callback(target, vector, trig_mode,
> -                            trig_mode ? eoi_callback : NULL, NULL);
> +                            callback ? eoi_callback : NULL, NULL);

I think you'd better use trig_mode || callback here and ...

> @@ -466,6 +481,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>      struct vlapic *target;
>      struct vcpu *v;
>      unsigned int irq = vioapic->base_gsi + pin;
> +    bool callback = trig_mode || hvm_gsi_has_callbacks(d, irq);
>  
>      ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
>  
> @@ -492,7 +508,8 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>              target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
>          if ( target != NULL )
>          {
> -            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode);
> +            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode,
> +                           callback);

... invoke hvm_gsi_has_callbacks() right here and ...

> @@ -507,7 +524,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>          for_each_vcpu ( d, v )
>              if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
>                  ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
> -                               delivery_mode);
> +                               delivery_mode, callback);

... here, avoiding to call the function when you don't need the
result.

Jan

