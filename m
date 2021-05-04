Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8A372960
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122110.230289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsnD-0002x1-S9; Tue, 04 May 2021 11:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122110.230289; Tue, 04 May 2021 11:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsnD-0002wc-P5; Tue, 04 May 2021 11:00:43 +0000
Received: by outflank-mailman (input) for mailman id 122110;
 Tue, 04 May 2021 11:00:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldsnC-0002wX-OI
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:00:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 575acd95-a739-4f2d-baba-74d80dcb17eb;
 Tue, 04 May 2021 11:00:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 218BCB166;
 Tue,  4 May 2021 11:00:40 +0000 (UTC)
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
X-Inumbo-ID: 575acd95-a739-4f2d-baba-74d80dcb17eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620126040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3Gg8MY9+0WFljQhbZmbClJvUb35ue3ybLPt5I0ZFlI=;
	b=iw5dGp0q/hGvxaRtRTcMxPypPn4nuTTGDsszNBZUyK7mSa/bq3OSnav+ezHUzIpv1bUB9V
	6uQRJEYY84rvgc7bfAYtsfrXll7ordw7K8Vgusq1dH/ajlNTBtgATA/O1eF0PNWN9EE6q5
	Uk6q0jYYhP9yJRnxwnNv4/eZ3EQYVZU=
Subject: Re: [PATCH v4 08/12] x86/vpt: switch interrupt injection model
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2e83796-ea71-ce71-4fc4-2bf1fc3bc3dc@suse.com>
Date: Tue, 4 May 2021 13:00:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> @@ -295,188 +248,153 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
>              list_del(&pt->list);
>          pt->on_list = false;
>          pt->pending_intr_nr = 0;
> +
> +        return;
>      }
> -    else if ( mode_is(v->domain, one_missed_tick_pending) ||
> -              mode_is(v->domain, no_missed_ticks_pending) )
> -    {
> -        pt->last_plt_gtime = hvm_get_guest_time(v);
> -        pt_process_missed_ticks(pt);
> -        pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
> -        set_timer(&pt->timer, pt->scheduled);
> -    }
> -    else
> +
> +    pt_process_missed_ticks(pt);
> +    /* 'collapse' missed ticks according to the selected mode. */
> +    switch ( pt->vcpu->domain->arch.hvm.params[HVM_PARAM_TIMER_MODE] )
>      {
> -        pt->last_plt_gtime += pt->period;
> -        if ( --pt->pending_intr_nr == 0 )
> -        {
> -            pt_process_missed_ticks(pt);
> -            if ( pt->pending_intr_nr == 0 )
> -                set_timer(&pt->timer, pt->scheduled);
> -        }
> +    case HVMPTM_one_missed_tick_pending:
> +        pt->pending_intr_nr = min(pt->pending_intr_nr, 1u);
> +        break;
> +
> +    case HVMPTM_no_missed_ticks_pending:
> +        pt->pending_intr_nr = 0;
> +        break;
>      }
>  
> -    if ( mode_is(v->domain, delay_for_missed_ticks) &&
> -         (hvm_get_guest_time(v) < pt->last_plt_gtime) )
> -        hvm_set_guest_time(v, pt->last_plt_gtime);
> +    if ( !pt->pending_intr_nr )
> +        set_timer(&pt->timer, pt->scheduled);
>  }
>  
> -int pt_update_irq(struct vcpu *v)
> +static void pt_timer_fn(void *data)
>  {
> -    struct list_head *head = &v->arch.hvm.tm_list;
> -    struct periodic_time *pt, *temp, *earliest_pt;
> -    uint64_t max_lag;
> -    int irq, pt_vector = -1;
> -    bool level;
> +    struct periodic_time *pt = data;
> +    struct vcpu *v;
> +    time_cb *cb = NULL;
> +    void *cb_priv;
> +    unsigned int irq;
>  
> -    pt_vcpu_lock(v);
> +    pt_lock(pt);
>  
> -    earliest_pt = NULL;
> -    max_lag = -1ULL;
> -    list_for_each_entry_safe ( pt, temp, head, list )
> +    v = pt->vcpu;
> +    irq = pt->irq;
> +
> +    if ( inject_interrupt(pt) )
>      {
> -        if ( pt->pending_intr_nr )
> -        {
> -            if ( pt_irq_masked(pt) &&
> -                 /* Level interrupts should be asserted even if masked. */
> -                 !pt->level )
> -            {
> -                /* suspend timer emulation */
> -                list_del(&pt->list);
> -                pt->on_list = 0;
> -            }
> -            else
> -            {
> -                if ( (pt->last_plt_gtime + pt->period) < max_lag )
> -                {
> -                    max_lag = pt->last_plt_gtime + pt->period;
> -                    earliest_pt = pt;
> -                }
> -            }
> -        }
> +        pt->scheduled += pt->period;
> +        pt->do_not_freeze = 0;

Nit: "false" please.

> +        cb = pt->cb;
> +        cb_priv = pt->priv;
>      }
> -
> -    if ( earliest_pt == NULL )
> +    else
>      {
> -        pt_vcpu_unlock(v);
> -        return -1;
> +        /* Masked. */
> +        if ( pt->on_list )
> +            list_del(&pt->list);
> +        pt->on_list = false;
> +        pt->pending_intr_nr++;
>      }

inject_interrupt() returns whether it was able to deliver the interrupt.
This in particular fails if the interrupt was masked and is edge
triggered. This, unexpectedly to me, reports success if a level triggered
interrupt was already pending. But in either event, the missed ticks
accounting is, as per my understanding of the comment in hvm/params.h,
supposed to be dealing with missing delivery due to preemption only. An
interrupt being masked / already pending may not be in this state due to
the guest having got preempted, though. A guest keeping a timer interrupt
masked for an extended period of time should not get a flood of
interrupts later on, no matter what HVM_PARAM_TIMER_MODE is set to.

However, I'm not going to exclude that little bit of doc is wrong, or
implementation and doc aren't in agreement already before your change.

> -    earliest_pt->irq_issued = 1;

This looks to be the only place where the field gets set to non-zero.
If the field is unused after this change, it wants deleting. I notice
patch 11 does so, but it may be worthwhile pointing out
- in the description here, that field removal will happen later,
- in the later patch, that this field was already unused (and doesn't
  become dead by the other removal done there).

> -    irq = earliest_pt->irq;
> -    level = earliest_pt->level;
> +    pt_unlock(pt);
>  
> -    pt_vcpu_unlock(v);
> +    if ( cb )
> +        cb(v, cb_priv);
> +}
>  
> -    switch ( earliest_pt->source )
> -    {
> -    case PTSRC_lapic:
> -        /*
> -         * If periodic timer interrupt is handled by lapic, its vector in
> -         * IRR is returned and used to set eoi_exit_bitmap for virtual
> -         * interrupt delivery case. Otherwise return -1 to do nothing.
> -         */
> -        vlapic_set_irq(vcpu_vlapic(v), irq, 0);
> -        pt_vector = irq;
> -        break;
> +static void eoi_callback(struct periodic_time *pt)
> +{
> +    struct vcpu *v = NULL;
> +    time_cb *cb = NULL;
> +    void *cb_priv = NULL;
>  
> -    case PTSRC_isa:
> -        hvm_isa_irq_deassert(v->domain, irq);
> -        if ( platform_legacy_irq(irq) && vlapic_accept_pic_intr(v) &&
> -             v->domain->arch.hvm.vpic[irq >> 3].int_output )
> -            hvm_isa_irq_assert(v->domain, irq, NULL);
> -        else
> +    pt_lock(pt);
> +
> +    irq_eoi(pt);
> +    if ( pt->pending_intr_nr )
> +    {
> +        if ( inject_interrupt(pt) )
>          {
> -            pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
> -            /*
> -             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
> -             * when mask field of IOAPIC RTE is set. Check it again.
> -             */
> -            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> -                pt_vector = -1;
> +            pt->pending_intr_nr--;
> +            cb = pt->cb;
> +            cb_priv = pt->priv;
> +            v = pt->vcpu;
>          }
> -        break;
> -
> -    case PTSRC_ioapic:
> -        pt_vector = hvm_ioapic_assert(v->domain, irq, level);
> -        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
> +        else
>          {
> -            pt_vector = -1;
> -            if ( level )
> -            {
> -                /*
> -                 * Level interrupts are always asserted because the pin assert
> -                 * count is incremented regardless of whether the pin is masked
> -                 * or the vector latched in IRR, so also execute the callback
> -                 * associated with the timer.
> -                 */
> -                time_cb *cb = NULL;
> -                void *cb_priv = NULL;
> -
> -                pt_vcpu_lock(v);
> -                /* Make sure the timer is still on the list. */
> -                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
> -                    if ( pt == earliest_pt )
> -                    {
> -                        pt_irq_fired(v, pt);
> -                        cb = pt->cb;
> -                        cb_priv = pt->priv;
> -                        break;
> -                    }
> -                pt_vcpu_unlock(v);
> -
> -                if ( cb != NULL )
> -                    cb(v, cb_priv);
> -            }
> +            /* Masked. */
> +            if ( pt->on_list )
> +                list_del(&pt->list);
> +            pt->on_list = false;
>          }
> -        break;
>      }
>  
> -    return pt_vector;
> +    pt_unlock(pt);
> +
> +    if ( cb )
> +        cb(v, cb_priv);
>  }
>  
> -static struct periodic_time *is_pt_irq(
> -    struct vcpu *v, struct hvm_intack intack)
> +static void vlapic_eoi_callback(struct vcpu *unused, unsigned int unused2,
> +                                void *data)
>  {
> -    struct list_head *head = &v->arch.hvm.tm_list;
> -    struct periodic_time *pt;
> -
> -    list_for_each_entry ( pt, head, list )
> -    {
> -        if ( pt->pending_intr_nr && pt->irq_issued &&
> -             (intack.vector == pt_irq_vector(pt, intack.source)) )
> -            return pt;
> -    }
> +    eoi_callback(data);
> +}
>  
> -    return NULL;
> +static void vioapic_eoi_callback(struct domain *unused, unsigned int unused2,
> +                                 void *data)
> +{
> +    eoi_callback(data);
>  }
>  
> -void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
> +static bool inject_interrupt(struct periodic_time *pt)
>  {
> -    struct periodic_time *pt;
> -    time_cb *cb;
> -    void *cb_priv;
> +    struct vcpu *v = pt->vcpu;
> +    struct domain *d = v->domain;
> +    unsigned int irq = pt->irq;
>  
> -    if ( intack.source == hvm_intsrc_vector )
> -        return;
> +    /* Level interrupts should be asserted even if masked. */
> +    if ( pt_irq_masked(pt) && !pt->level )
> +        return false;
>  
> -    pt_vcpu_lock(v);
> -
> -    pt = is_pt_irq(v, intack);
> -    if ( pt == NULL )
> +    switch ( pt->source )
>      {
> -        pt_vcpu_unlock(v);
> -        return;
> +    case PTSRC_lapic:
> +        vlapic_set_irq_callback(vcpu_vlapic(v), pt->irq, 0, vlapic_eoi_callback,
> +                                pt);
> +        break;
> +
> +    case PTSRC_isa:
> +        hvm_isa_irq_deassert(d, irq);
> +        hvm_isa_irq_assert(d, irq, NULL);
> +        break;
> +
> +    case PTSRC_ioapic:
> +        hvm_ioapic_assert(d, irq, pt->level);
> +        break;
>      }

Why do ISA IRQs get de-asserted first, but IO-APIC ones don't? I
notice e.g. hvm_set_callback_irq_level() and hvm_set_pci_link_route()
have similar apparent asymmetries, so I guess I'm missing something.
In particular I can't spot - even prior to this change - where
hvm_irq->gsi_assert_count[gsi] would get decremented for a level
triggered IRQ, when hvm_ioapic_deassert() gets called only from
hvm/hpet.c:hpet_write(). I guess the main point is that that's the
only case of a level triggered timer interrupt for us?

> @@ -641,20 +590,29 @@ void pt_adjust_global_vcpu_target(struct vcpu *v)
>      write_unlock(&pl_time->vhpet.lock);
>  }
>  
> -
>  static void pt_resume(struct periodic_time *pt)
>  {
> +    struct vcpu *v;
> +    time_cb *cb = NULL;
> +    void *cb_priv;
> +
>      if ( pt->vcpu == NULL )
>          return;
>  
>      pt_lock(pt);
> -    if ( pt->pending_intr_nr && !pt->on_list )
> +    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
>      {
> +        pt->pending_intr_nr--;
> +        cb = pt->cb;
> +        cb_priv = pt->priv;
> +        v = pt->vcpu;
>          pt->on_list = 1;
>          list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
> -        vcpu_kick(pt->vcpu);

Just for my own understanding: The replacement of this is what happens
down the call tree from inject_interrupt()?

Jan

