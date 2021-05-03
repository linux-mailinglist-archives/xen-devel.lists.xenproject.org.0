Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987E371873
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121737.229613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldaqK-0003Uv-1p; Mon, 03 May 2021 15:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121737.229613; Mon, 03 May 2021 15:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldaqJ-0003UW-V1; Mon, 03 May 2021 15:50:43 +0000
Received: by outflank-mailman (input) for mailman id 121737;
 Mon, 03 May 2021 15:50:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldaqI-0003UR-Cn
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:50:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03490bff-fbd4-4548-9724-83d10e329e84;
 Mon, 03 May 2021 15:50:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38305B20F;
 Mon,  3 May 2021 15:50:40 +0000 (UTC)
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
X-Inumbo-ID: 03490bff-fbd4-4548-9724-83d10e329e84
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620057040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vgsUSIt1qrfYBtRqm5wgG+fvrjDxM14z0fDosLzFv8=;
	b=bXipMq5TMsk3/0DHUMOOHXAakdAPEhlBR1L7eSabUUhsPu5/FLGeowjLnICskCq7Xt9YEK
	e4q7GOmpYhCB8Woanbn6jO7CK4fqzWph/em7McWC3y4ACLX0HlbJLYbhvVf8y3vpKC1dFn
	sj9uO7avpHksmi8oNkGbM1R9O4KQtDE=
Subject: Re: [PATCH v4 05/12] x86/hvm: allowing registering EOI callbacks for
 GSIs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19b0b30d-2fd6-4cc3-fd7a-4f4a3ce735f7@suse.com>
Date: Mon, 3 May 2021 17:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> Such callbacks will be executed once a EOI is performed by the guest,
> regardless of whether the interrupts are injected from the vIO-APIC or
> the vPIC, as ISA IRQs are translated to GSIs and then the
> corresponding callback is executed at EOI.
> 
> The vIO-APIC infrastructure for handling EOIs is build on top of the
> existing vlapic EOI callback functionality, while the vPIC one is
> handled when writing to the vPIC EOI register.
> 
> Note that such callbacks need to be registered and de-registered, and
> that a single GSI can have multiple callbacks associated. That's
> because GSIs can be level triggered and shared, as that's the case
> with legacy PCI interrupts shared between several devices.
> 
> Strictly speaking this is a non-functional change, since there are no
> users of this new interface introduced by this change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

In principle, as everything looks functionally correct to me,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless, besides a few remarks further down, I have to admit I'm
concerned of the direct-to-indirect calls conversion (not just here,
but also covering earlier patches), which (considering we're talking
of EOI) I expect may occur quite frequently for at least some guests.
There aren't that many different callback functions which get
registered, are there? Hence I wonder whether enumerating them and
picking the right one via, say, an enum wouldn't be more efficient
and still allow elimination of (in the case here) unconditional calls
to hvm_dpci_eoi() for every EOI.

> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -595,6 +595,81 @@ int hvm_local_events_need_delivery(struct vcpu *v)
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
> +int hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
> +                                struct hvm_gsi_eoi_callback *cb)
> +{
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> +    const struct list_head *tmp;
> +    bool found = false;
> +
> +    if ( gsi >= hvm_irq->nr_gsis )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return -EINVAL;
> +    }
> +
> +    write_lock(&hvm_irq->gsi_callbacks_lock);
> +    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
> +        if ( tmp == &cb->list )
> +        {
> +            list_del(&cb->list);

Minor remark: Would passing "tmp" here lead to better generated
code?

> @@ -419,13 +421,25 @@ static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
>              if ( is_iommu_enabled(d) )
>              {
>                  spin_unlock(&d->arch.hvm.irq_lock);
> -                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
> +                hvm_dpci_eoi(d, gsi);
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
> +            hvm_gsi_execute_callbacks(d, gsi);
> +            spin_lock(&d->arch.hvm.irq_lock);

While this may be transient in the series, as said before I'm not
happy about this double unlock/relock sequence. I didn't really
understand what would be wrong with

            spin_unlock(&d->arch.hvm.irq_lock);
            if ( is_iommu_enabled(d) )
                hvm_dpci_eoi(d, gsi);
            hvm_gsi_execute_callbacks(d, gsi);
            spin_lock(&d->arch.hvm.irq_lock);

This in particular wouldn't grow but even shrink the later patch
dropping the call to hvm_dpci_eoi().

> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -235,6 +235,8 @@ static void vpic_ioport_write(
>                  unsigned int pin = __scanbit(pending, 8);
>  
>                  ASSERT(pin < 8);
> +                hvm_gsi_execute_callbacks(current->domain,
> +                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
>                  hvm_dpci_eoi(current->domain,
>                               hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
>                  __clear_bit(pin, &pending);
> @@ -285,6 +287,8 @@ static void vpic_ioport_write(
>                  /* Release lock and EOI the physical interrupt (if any). */
>                  vpic_update_int_output(vpic);
>                  vpic_unlock(vpic);
> +                hvm_gsi_execute_callbacks(current->domain,
> +                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
>                  hvm_dpci_eoi(current->domain,
>                               hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
>                  return; /* bail immediately */

Another presumably minor remark: In the IO-APIC case you insert after
the call to hvm_dpci_eoi(). I wonder if consistency wouldn't help
avoid questions of archeologists in a couple of years time.

Jan

