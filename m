Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6579E2971D6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 16:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11060.29324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVyX0-0005LN-D1; Fri, 23 Oct 2020 14:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11060.29324; Fri, 23 Oct 2020 14:59:02 +0000
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
	id 1kVyX0-0005Ky-9K; Fri, 23 Oct 2020 14:59:02 +0000
Received: by outflank-mailman (input) for mailman id 11060;
 Fri, 23 Oct 2020 14:59:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVyWy-0005Ks-Li
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:59:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7de0acfa-d57a-42be-b941-4f12bc17ca2b;
 Fri, 23 Oct 2020 14:58:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1383AD09;
 Fri, 23 Oct 2020 14:58:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVyWy-0005Ks-Li
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:59:00 +0000
X-Inumbo-ID: 7de0acfa-d57a-42be-b941-4f12bc17ca2b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7de0acfa-d57a-42be-b941-4f12bc17ca2b;
	Fri, 23 Oct 2020 14:58:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603465138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgGmob6u60vj5rQwir3hB1HfE+wHt+CUgGlG6PpiMdc=;
	b=XbYygUT2op50uGIyEsLVohn03xBnQrBM21+rdBEthqWurbP8CTTgpx8exe+QZOu4lWvDwK
	5W8FvYpBarrFKGGZzVPBO49JlPfktL3hy032V5YGKKgPVWI87LIRQUKsij79ISFhP2GSF2
	viCRTqV6w2HztrvKD2uodjcSTjYGzi0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A1383AD09;
	Fri, 23 Oct 2020 14:58:58 +0000 (UTC)
Subject: Re: [PATCH v2 09/11] x86/vpt: switch interrupt injection model
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-10-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63ed7745-a37f-5df2-6eaa-b0ed4a0a30e3@suse.com>
Date: Fri, 23 Oct 2020 16:59:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> Currently vPT relies on timers being assigned to a vCPU and performing
> checks on every return to HVM guest in order to check if an interrupt
> from a vPT timer assigned to the vCPU is currently being injected.
> 
> This model doesn't work properly since the interrupt destination vCPU
> of a vPT timer can be different from the vCPU where the timer is
> currently assigned, in which case the timer would get stuck because it
> never sees the interrupt as being injected.
> 
> Knowing when a vPT interrupt is injected is relevant for the guest
> timer modes where missed vPT interrupts are not discarded and instead
> are accumulated and injected when possible.
> 
> This change aims to modify the logic described above, so that vPT
> doesn't need to check on every return to HVM guest if a vPT interrupt
> is being injected. In order to achieve this the vPT code is modified
> to make use of the new EOI callbacks, so that virtual timers can
> detect when a interrupt has been serviced by the guest by waiting for
> the EOI callback to execute.
> 
> This model also simplifies some of the logic, as when executing the
> timer EOI callback Xen can try to inject another interrupt if the
> timer has interrupts pending for delivery.
> 
> Note that timers are still bound to a vCPU for the time being, this
> relation however doesn't limit the interrupt destination anymore, and
> will be removed by further patches.
> 
> This model has been tested with Windows 7 guests without showing any
> timer delay, even when the guest was limited to have very little CPU
> capacity and pending virtual timer interrupts accumulate.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.
> ---
> Sorry, this is a big change, but I'm having issues splitting it into
> smaller pieces as the functionality needs to be changed in one go, or
> else timers would be broken.
> 
> If this approach seems sensible I can try to split it up.

If it can't sensibly be split, so be it, I would say. And yes, the
approach does look sensible to me, supported by ...

> ---
>  xen/arch/x86/hvm/svm/intr.c   |   3 -
>  xen/arch/x86/hvm/vmx/intr.c   |  59 ------
>  xen/arch/x86/hvm/vpt.c        | 326 ++++++++++++++--------------------
>  xen/include/asm-x86/hvm/vpt.h |   5 +-
>  4 files changed, 135 insertions(+), 258 deletions(-)

... this diffstat. Good work!

Just a couple of nits, but before giving this my ack I may need to
go through it a 2nd time.

> +/*
> + * The same callback is shared between LAPIC and PIC/IO-APIC based timers, as
> + * we ignore the first parameter that's different between them.
> + */
> +static void eoi_callback(unsigned int unused, void *data)
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
>  
> -    pt_vcpu_lock(v);
> +    pt_lock(pt);
>  
> -    earliest_pt = NULL;
> -    max_lag = -1ULL;
> -    list_for_each_entry_safe ( pt, temp, head, list )
> +    pt_irq_fired(pt->vcpu, pt);
> +    if ( pt->pending_intr_nr )
>      {
> -        if ( pt->pending_intr_nr )
> +        if ( inject_interrupt(pt) )
> +        {
> +            pt->pending_intr_nr--;
> +            cb = pt->cb;
> +            cb_priv = pt->priv;
> +            v = pt->vcpu;
> +        }
> +        else
>          {
> -            /* RTC code takes care of disabling the timer itself. */
> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
> -                 /* Level interrupts should be asserted even if masked. */
> -                 !pt->level )
> -            {
> -                /* suspend timer emulation */
> +            /* Masked. */
> +            if ( pt->on_list )
>                  list_del(&pt->list);
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
> +            pt->on_list = false;
>          }
>      }
>  
> -    if ( earliest_pt == NULL )
> -    {
> -        pt_vcpu_unlock(v);
> -        return -1;
> -    }
> +    pt_unlock(pt);
>  
> -    earliest_pt->irq_issued = 1;
> -    irq = earliest_pt->irq;
> -    level = earliest_pt->level;
> +    if ( cb != NULL )
> +        cb(v, cb_priv);

Nit: Like done elsewhere, omit the " != NULL"?

> +    /* Update time when an interrupt is injected. */
> +    if ( mode_is(v->domain, one_missed_tick_pending) ||
> +         mode_is(v->domain, no_missed_ticks_pending) )
> +        pt->last_plt_gtime = hvm_get_guest_time(v);
> +    else
> +        pt->last_plt_gtime += pt->period;
>  
> -    pt_vcpu_unlock(v);
> +    if ( mode_is(v->domain, delay_for_missed_ticks) &&

This looks to be possible to move into the "else" above, but on the
whole maybe everything together would best be handled by switch()?

> @@ -543,6 +443,24 @@ void create_periodic_time(
>      pt->cb = cb;
>      pt->priv = data;
>  
> +    switch ( pt->source )
> +    {
> +        int rc;
> +
> +    case PTSRC_isa:
> +        irq = hvm_isa_irq_to_gsi(irq);
> +        /* fallthrough */
> +    case PTSRC_ioapic:
> +        pt->eoi_cb.callback = eoi_callback;
> +        pt->eoi_cb.data = pt;
> +        rc = hvm_gsi_register_callback(v->domain, irq, &pt->eoi_cb);
> +        if ( rc )
> +            gdprintk(XENLOG_WARNING,
> +                     "unable to register callback for timer GSI %u: %d\n",
> +                     irq, rc);

If this triggers, would it be helpful to also log pt->source?

Jan

