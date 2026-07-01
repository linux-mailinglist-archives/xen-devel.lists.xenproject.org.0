Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id StNTLSApRWog8AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:50:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADC6EEFA6
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:50:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OTt87HKB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1350082.1607666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewGE-0002gW-Sm; Wed, 01 Jul 2026 14:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350082.1607666; Wed, 01 Jul 2026 14:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewGE-0002eX-P5; Wed, 01 Jul 2026 14:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1350082;
 Wed, 01 Jul 2026 14:49:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wewGD-0002eM-DO
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 14:49:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewGC-00BKFF-QW
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 16:49:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a452907-2eae-0a2a0a5409dd-0a2a450ce92a-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:49:56 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a452914-f399-0a2a450c0019-d155dd34ed8a-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:49:56 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47231f1f8f3so939119f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 07:49:56 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm369712f8f.13.2026.07.01.07.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 07:49:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782917396; x=1783522196; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhomrUxY6p8P6yVy0jlqXNfKQuZ1YGtwLW+fYV1vUCM=;
        b=OTt87HKBGdi413QIBNhjj1PSweJ3BO2mOFNoJVzUKW8dag58W17dEtKqsT9o4FnXh+
         f87n5tktzFlTl+eEcKuvyXvcF/Es0A7xnqi85eNRqEaUfSNDazu4vMoezudsbd5uu1Cz
         g9vY7kyHON46XmlCHbcK2cmmeX8PBQGGCgR9qgTT7WTTI9Ko2rxsPW7aujkg5QvrFF3f
         9oZX+srKf3I+pGXeIncTp3vNioK4fEm5BC7Ad+YgV3E19KwVD/POY/RcAGySoIi09Qae
         jjSO9IPyXfB3jYXhmWhM6nihPCvnP3/1++MNi+oLs2XwcqpPi2NodEPLJKcuiNLarf2a
         9e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917396; x=1783522196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhomrUxY6p8P6yVy0jlqXNfKQuZ1YGtwLW+fYV1vUCM=;
        b=VoK4Qs1S5RjkgBMRzDbPYmGPjJUkb5lJcGs2XUIw2QrdJd72yPsZszioiMUiBd01/J
         4beevRNrq20B/6daDC8yX61N3j26EeLUiXOrbwRxayDfcgwSIkiApvkqG2/tgRj6rblG
         VvOw/8Vkaxti4YAhWFPHY8wLf6J9eH9xMm+M38zuAEWGQKNZHqyO1TEkTyGHlKHoRjvw
         QZFgAHIGVwMzaZuure25KwvxhTfeP7+C9vOwQ7Jm0v2OvIXmGhuSZanWIrwM7Ftxdmdw
         qIRFA1zj/clVo1ykBS6hPxN3Refw1gwT+ewk3yZZkZV3fZbY/2mreIGWPIkX2738QAC2
         mPUw==
X-Forwarded-Encrypted: i=1; AHgh+RrwOYRAAqUNd7vzghMj08q9QFNt/QD2AUr6tyjXfj8cqNBLcqfXtE79jQ8x8iGAHHDNpC2a7tKK8E0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaVSe0K1QZacKlT5vioNwz3dtbMimKqoI6HHxDI7T6pYs7dRov
	e3ticokTeZgWqVcj0masZaxu8kV/TiLkuzyGBdVv+Vy+Kb6TDHQPdF5X
X-Gm-Gg: AfdE7cl/pwvk6M9HHiDjKqFMlAoaPXJHsAOCmQ3f6x47KdgS4ATjRSi6JtVywTSL3QO
	cn405PlpPlAJbxQF162SEF8RAvD0UkoKNzwtPNaW7zNT8kvaAHFpllNOAcR0KurLGhgdb29/nRG
	A4cjAh/nMPtIDRQ1g/4JCjFJ7o3sUqGlWJTPXXC15U0BwSka0a2ZPlok+c0eAz2eZJ8tjr37GqM
	ijcu4W8Fe4vhyJEAqUB8MuxDuckmGpNUQzwO7ZiSRALwA7ci0+7c7/+bVI1cXyOABF1s8FuJ1VC
	h5SmAspOcwqfuNH6eo9Q1lAJkcWy3Utkp5jizNu4D35qms83algAUNggA5qoQwCbQ3WD6D0dNj9
	B7UE6d/Dnatf1v+1ysiCIWvskQO39Svhc3kmX7o6xu/F7vH+P6D8+carx0b1GV5rITx7TlO/2BY
	HkrnzOMbhLC09QKHDY4C/OEkzEy5t02ZDZBO9pxyQqfZfwcPH4ICBuDLiac6e2+2WOKO0=
X-Received: by 2002:a05:6000:4a09:b0:46f:3046:2bf1 with SMTP id ffacd0b85a97d-477b3982ce5mr1395687f8f.13.1782917395894;
        Wed, 01 Jul 2026 07:49:55 -0700 (PDT)
Message-ID: <6aafbeb5-2f33-49f4-9d14-937b0bc4d15d@gmail.com>
Date: Wed, 1 Jul 2026 16:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
 <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782917396-0D329D51-F8B1046D/10/73395122804
X-purgate-type: spam
X-purgate-size: 10845
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19ADC6EEFA6



On 6/29/26 5:55 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> dom0less device passthrough requires granting guest domains access to
>> device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
>> a DT node's interrupt properties, skipping those not owned by
>> the primary interrupt controller (as at the moment I haven't seen usages
>> of it), and map_irq_to_domain() to grant domain access and configure
>> Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
>> rejected.
>>
>> Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
>> __overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
>> __init, so the functions are init-only and need no XSM check; with
>> CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
>> entry point is dt_overlay_domctl(), which performs the XSM checks at the
>> domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
>> strictly __init; if/when overlay support is added, the domctl-level XSM
>> gating must be added together with it, as on Arm.
>>
>> route_irq_to_guest() and release_irq() manage irq_desc ownership for
>> guest-assigned interrupts.  Each assignment carries a small irq_guest
>> structure as irqaction::dev_id, recording the owning domain and virtual
>> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
>> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
>> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
>>
>> Host and guest interrupts may differ in some operations (EOI timing in
>> particular, possibly others): a host IRQ is completed once Xen's handler
>> runs, whereas a passthrough IRQ must defer the physical completion until
>> the guest issues its own EOI, otherwise a still-asserted level line would
>> immediately retrigger and storm.  This affects only the .end callback;
>> the rest of hw_interrupt_type is shared, hence the separate host and
>> guest hw_interrupt_type instances.
>>
>> With APLIC+IMSIC, guest interrupts are delivered directly by hardware
>> through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
>> do_IRQ() is therefore left as BUG() until a platform without direct
>> IMSIC delivery is encountered.
> 
> And this is secure, i.e. one guest (by mishandling things, e.g. simply
> never claiming / servicing an interrupt) cannot affect another guest?

It will be just affect this specific interrupt which isn't claimed/serviced.

> 
>> +int __overlay_init map_device_irqs_to_domain(struct domain *d,
>> +                                             struct dt_device_node *dev,
>> +                                             bool need_mapping,
>> +                                             struct rangeset *irq_ranges)
>> +{
>> +    unsigned int i, nirq = dt_number_of_irq(dev);
>> +
>> +    if ( irq_ranges )
>> +        return -EOPNOTSUPP;
>> +
>> +    /* Give permission and map IRQs */
>> +    for ( i = 0; i < nirq; i++ )
>> +    {
>> +        int res, irq;
>> +        struct dt_raw_irq rirq;
>> +
>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>> +                   i, dt_node_full_name(dev));
>> +            return res;
>> +        }
>> +
>> +        /*
>> +         * Don't map IRQs that have no physical meaning
>> +         * ie: IRQs whose controller is not APLIC/IMSIC/PLIC.
>> +         */
>> +        if ( rirq.controller != dt_interrupt_controller )
>> +        {
>> +            dt_dprintk("irq %u not connected to primary controller."
>> +                       "Connected to %s\n", i,
> 
> Nit: By splitting a format string like this, you pretty effectively hide
> that there's a blank missing after the full stop.
> 
> Further after an already wrapped function argument there shouldn't follow
> another one, to maintain visual clarity.

I would be okay to have a format string a little bit long. I would 
change that line to (if you are okay with that):
   ...("irq %u not connected to primary controller. Connected to %s\n",
       i, dt_node_full_name(rirq.controller));

> 
>> @@ -101,12 +119,28 @@ int domain_vintc_init(struct domain *d)
>>           break;
>>       }
>>   
>> +    if ( !ret )
>> +    {
>> +        d->arch.vintc->used_irqs =
>> +            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->nr_virqs));
> 
> Nit: Overlong line.
> 

I will reformat that in the following way:
         d->arch.vintc->used_irqs =
             xvzalloc_array(unsigned long,
                            BITS_TO_LONGS(d->arch.vintc->nr_virqs));

>> +        if ( !d->arch.vintc->used_irqs )
>> +            ret = -ENOMEM;
>> +    }
>> +
>>       return ret;
>>   }
>>   
>>   void domain_vintc_deinit(struct domain *d)
>>   {
>>       const enum intc_variant variant = intc_hw_ops->info->hw_variant;
>> +    unsigned int virq;
>> +
>> +    if ( !d->arch.vintc )
>> +        return;
> 
> Seeing this and ...
> 
>> +    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
>> +        if ( test_bit(virq, d->arch.vintc->used_irqs) )
>> +            release_guest_irq(d, virq);
>>   
>>       switch ( variant )
>>       {
>> @@ -117,4 +151,14 @@ void domain_vintc_deinit(struct domain *d)
>>       default:
>>           break;
>>       }
>> +
>> +    XVFREE(d->arch.vintc->used_irqs);
> 
> ... this, ...
> 
>> +}
> 
> ... where is d->arch.vintc being freed? That would logically look to
> belong into this function.

Right, it is an issue: d->arch.vintc is being NULLed inside 
domain_vaplic_deinit(), which are called from domain_vintc_deinit(), so 
XVFREE(d->arch.vintc->used_irqs) must be moved to just after the for() 
loop (before the switch).

As for d->arch.vintc itself, it should only be NULLed and not freed, 
since it is a pointer to &vaplic->vintc which is embedded in the vaplic 
struct and not separately allocated.

> 
>> --- a/xen/arch/riscv/irq.c
>> +++ b/xen/arch/riscv/irq.c
>> @@ -12,11 +12,20 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/sched.h>
>>   #include <xen/spinlock.h>
>> +#include <xen/xvmalloc.h>
>>   
>>   #include <asm/hardirq.h>
>>   #include <asm/intc.h>
>>   
>> +/* Describe an IRQ assigned to a guest */
>> +struct irq_guest
>> +{
>> +    struct domain *d;
>> +    unsigned int virq;
>> +};
>> +
>>   static irq_desc_t irq_desc[NR_IRQS];
>>   
>>   static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>> @@ -192,6 +201,15 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>>       if ( desc->handler->ack )
>>           desc->handler->ack(desc);
>>   
>> +    if ( desc->status & IRQ_GUEST )
>> +        /*
>> +         * As at the moment APLIC + IMSIC is used for guest interrupts will
>> +         * be directly passed to guest. But if/when IMSIC won't be available
>> +         * all interrupts will go through Xenand here an irq injection
>> +         * will be necessary to do.
>> +         */
>> +        panic("unimplemented");
> 
> The first comment sentence doesn't parse for me. In the 2nd there's a blank
> missing between "Xen" and "and".

I will rephrase it for clarity:

/*
  * With APLIC + IMSIC, guest interrupts bypass Xen and are delivered
  * directly to the guest. Without IMSIC, interrupts would be trapped
  * by Xen and would need injecting into the guest here.
  */

It looks more clearer to me.


> 
>> @@ -221,3 +239,215 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>>       spin_unlock(&desc->lock);
>>       irq_exit();
>>   }
>> +
>> +static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>> +{
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>> +    ASSERT(desc->action != NULL);
>> +
>> +    return desc->action->dev_id;
>> +}
>> +
>> +static inline struct domain *irq_get_domain(struct irq_desc *desc)
>> +{
>> +    return irq_get_guest_info(desc)->d;
>> +}
> 
> Does this really need a separate helper? (You effectively open-code it
> anyway in release_guest_irq().)

Considering that I used irq_get_domain() once at all (even in 
downstream) I will drop that.

> 
> For both functions: "inline" generally wants limiting to header files.

Regarding inline I think that I don't understand, it isn't in the header 
file as irq_get_guest_info() is used only in this file.

Do I understand you correctly and it is needed just to drop "inline" for
irq_get_guest_info()?

> 
>> +int release_guest_irq(struct domain *d, unsigned int virq)
>> +{
>> +    struct irq_desc *desc = irq_to_desc(virq);
>> +    struct irq_guest *info;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
>> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
>> +        goto unlock_err;
>> +
>> +    info = irq_get_guest_info(desc);
>> +    if ( d != info->d )
>> +        goto unlock_err;
>> +
>> +    /*
>> +     * Live IRQ unrouting from a running domain is not supported: the tear-down
>> +     * drops desc->lock across release_irq()/xvfree() and relies on no
>> +     * concurrent route_irq_to_guest() being issued for this domain. Only permit
>> +     * it for a dying domain, where assignment is frozen and no new routes can
>> +     * appear.
>> +     */
>> +    if ( !d->is_dying )
>> +    {
>> +        spin_unlock_irqrestore(&desc->lock, flags);
>> +        return -EBUSY;
>> +    }
> 
> Yet route_irq_to_guest() looks to happily act on dying guests. IOW assignment
> doesn't look to be frozen, despite the comment saying so.

Right, it is needed to add:
     if ( d->is_dying )
         return -EINVAL;
at the top of route_irq_to_guest().


> 
>> +    /*
>> +     * Clear _IRQ_GUEST while still holding the lock so that a concurrent
>> +     * release_guest_irq() for the same IRQ observes it and bails out, rather
>> +     * than capturing the same 'info' and double-freeing it below.
>> +     */
>> +    clear_bit(_IRQ_GUEST, &desc->status);
> 
> You use __set_bit() / __clear_bit() elsewhere - why not here?

As it is under spinlock it could __clear_bit here.

> 
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    release_irq(desc->irq, info);
>> +    xvfree(info);
> 
> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
> a dangling pointer. (I think I did point this out before.)

It should freed in release_irq() as route_irq_to_guest() always set 
action->free_on_release = true;

Thanks.

~ Oleksii

