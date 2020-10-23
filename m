Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9D296F36
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 14:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10947.29086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVwCU-00066G-Pr; Fri, 23 Oct 2020 12:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10947.29086; Fri, 23 Oct 2020 12:29:42 +0000
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
	id 1kVwCU-00065r-MS; Fri, 23 Oct 2020 12:29:42 +0000
Received: by outflank-mailman (input) for mailman id 10947;
 Fri, 23 Oct 2020 12:29:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVwCS-00065m-Vv
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:29:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 700d1554-33fc-426d-b192-34a7332df53e;
 Fri, 23 Oct 2020 12:29:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 227B3AC6A;
 Fri, 23 Oct 2020 12:29:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVwCS-00065m-Vv
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:29:41 +0000
X-Inumbo-ID: 700d1554-33fc-426d-b192-34a7332df53e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 700d1554-33fc-426d-b192-34a7332df53e;
	Fri, 23 Oct 2020 12:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603456179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9ipaWFoA96wa51ziNHoT9h9mHLvv1E4EYwbX0EMRRw=;
	b=mUnAbejHL+98oFfpR9iQhJXfzjhYiCyLA09ZH6LE3oQtQOf46VrgEKMegA9j0TWvE/TzPo
	pFFSZoUpfDS6ywhoxBgv6M6YisPQK4FK25DMeTwreMnfOt9ywjkAife+3kDlXOHUf+F/8J
	UXX53Z90m9wwuIfCKj6FvbzNBULojwE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 227B3AC6A;
	Fri, 23 Oct 2020 12:29:39 +0000 (UTC)
Subject: Re: [PATCH v2 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3a7d136-0987-3be1-5b14-07e788354484@suse.com>
Date: Fri, 23 Oct 2020 14:29:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -595,6 +595,66 @@ int hvm_local_events_need_delivery(struct vcpu *v)
>      return !hvm_interrupt_blocked(v, intack);
>  }
>  
> +int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
> +                              struct hvm_gsi_eoi_callback *cb)
> +{
> +    if ( gsi >= hvm_domain_irq(d)->nr_gsis )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return -EINVAL;
> +    }
> +
> +    write_lock(&hvm_domain_irq(d)->gsi_callbacks_lock);
> +    list_add(&cb->list, &hvm_domain_irq(d)->gsi_callbacks[gsi]);
> +    write_unlock(&hvm_domain_irq(d)->gsi_callbacks_lock);
> +
> +    return 0;
> +}
> +
> +void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
> +                                 struct hvm_gsi_eoi_callback *cb)
> +{
> +    struct list_head *tmp;

This could be const if you used ...

> +    if ( gsi >= hvm_domain_irq(d)->nr_gsis )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    write_lock(&hvm_domain_irq(d)->gsi_callbacks_lock);
> +    list_for_each ( tmp, &hvm_domain_irq(d)->gsi_callbacks[gsi] )
> +        if ( tmp == &cb->list )
> +        {
> +            list_del(tmp);

... &cb->list here.

> +            break;
> +        }
> +    write_unlock(&hvm_domain_irq(d)->gsi_callbacks_lock);
> +}
> +
> +void hvm_gsi_execute_callbacks(unsigned int gsi, void *data)
> +{
> +    struct domain *currd = current->domain;
> +    struct hvm_gsi_eoi_callback *cb;
> +
> +    read_lock(&hvm_domain_irq(currd)->gsi_callbacks_lock);
> +    list_for_each_entry ( cb, &hvm_domain_irq(currd)->gsi_callbacks[gsi],
> +                          list )
> +        cb->callback(gsi, cb->data ?: data);

Are callback functions in principle permitted to unregister
themselves? If so, you'd need to use list_for_each_entry_safe()
here.

What's the idea of passing cb->data _or_ data?

Finally here and maybe in a few more places latch hvm_domain_irq()
into a local variable?

> +    read_unlock(&hvm_domain_irq(currd)->gsi_callbacks_lock);
> +}
> +
> +bool hvm_gsi_has_callbacks(struct domain *d, unsigned int gsi)

I think a function like this would want to have all const inputs,
and it looks to be possible thanks to hvm_domain_irq() yielding
a pointer.

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -393,6 +393,7 @@ static void eoi_callback(unsigned int vector, void *data)
>          for ( pin = 0; pin < vioapic->nr_pins; pin++ )
>          {
>              union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
> +            unsigned int gsi = vioapic->base_gsi + pin;
>  
>              if ( ent->fields.vector != vector )
>                  continue;
> @@ -402,13 +403,17 @@ static void eoi_callback(unsigned int vector, void *data)
>              if ( is_iommu_enabled(d) )
>              {
>                  spin_unlock(&d->arch.hvm.irq_lock);
> -                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
> +                hvm_dpci_eoi(gsi, ent);
>                  spin_lock(&d->arch.hvm.irq_lock);
>              }
>  
> +            spin_unlock(&d->arch.hvm.irq_lock);
> +            hvm_gsi_execute_callbacks(gsi, ent);
> +            spin_lock(&d->arch.hvm.irq_lock);

Iirc on an earlier patch Paul has already expressed concern about such
transient unlocking. At the very least I'd expect the description to
say why this is safe. One particular question would be in how far what
ents points to can't change across this window, disconnecting the uses
of it in the 1st locked section from those in the 2nd one.

> @@ -620,7 +628,7 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
>           * Add a callback for each possible vector injected by a redirection
>           * entry.
>           */
> -        if ( vector < 16 || !ent->fields.remote_irr ||
> +        if ( vector < 16 ||
>               (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
>              continue;

I'm having trouble identifying what this gets replaced by.

Jan

