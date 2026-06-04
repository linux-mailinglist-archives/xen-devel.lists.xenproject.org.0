Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iNxNNlKbIWpHJwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:35:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FDD6417EF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 17:35:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OKXCYBHE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328196.1592843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVA6W-0002IN-99; Thu, 04 Jun 2026 15:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328196.1592843; Thu, 04 Jun 2026 15:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVA6W-0002Go-5u; Thu, 04 Jun 2026 15:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1328196;
 Thu, 04 Jun 2026 15:35:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVA6U-0002Ga-NN
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:35:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVA6U-00Fh6H-44
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 17:35:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a219b27-bab6-0a2a0a5309dd-0a2a4509d596-48
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:35:30 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a219b41-2497-0a2a45090019-d1558032c430-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:35:30 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso7251735e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:35:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc4082c3sm76178275e9.13.2026.06.04.08.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 08:35:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780587329; x=1781192129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAFgSdHqn9nMXN9IuMgQEpnnNZ0L/N0eRJ75D9QFA1Y=;
        b=OKXCYBHEyipVPGrv1QAWzF+qnO9iRL5zNHQlUih0WpK/NYwif8tphFq+WTXIot9WLt
         1JgWcn6S+4qY9yk0XQupZEzTQy8Vibnqyhy3Wp6Eeny/xAGarhGnADL5LpsrNQKsFrCG
         WfCx3fv1D76FqpO/bQ/Hfoq37P/euN5wwlF1Y0gprR0OgVQU8mdSHyqo+7beCK/5Mk5Q
         ilktkI3ZvNBVb9hocisXLAys7JM+9tCbeQPut2w2dUa/7Ga3pRBM1kXagyOGWF3qjpzs
         hV+Wt/icSve0EYJHtAFe2yna4gNm9OyKhtLKXxPrOuh1bCjizLsfzgPAp5OaTzuNFe2q
         U4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780587329; x=1781192129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAFgSdHqn9nMXN9IuMgQEpnnNZ0L/N0eRJ75D9QFA1Y=;
        b=mRMCOArPiTzi6TWaKYAxxq7bzrzOAFLgV9n5D//YexrPy69nvyFdJM4aaTM+C0vGCQ
         MKRpXYSPdz2NA8RFGSyNf24O0k+J/otBMjgAefSMI9tuUy7QyjiDi9kayxLXYj8IwvlW
         luyKBn4grL6nuY9iKL7qu9Uy0sPtX+foHqetY44bO7Pxtj/kODiuplwGqbVgj5Uv0NUz
         Bn4gBMltvX9I60Oe6DCjHL4kTDbtBYk3Zzr6tl5Oyf7M/Zv7cIcfdoPY5AcOcphcUVe/
         wBYJKflo6BFiupm8vio345hXuh5/u4dyNFfwtHXKKa9PONLxuKALTepW+y6CHgRU3HTy
         Uc3w==
X-Forwarded-Encrypted: i=1; AFNElJ8RETbw2HmidUn+YgkIIrinEUf3k/uQtyFnAL5hkRBdOZGe6T9D3TqJNkINkBCI5rlMNCMmw16hS+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuFSpWtqU5XYk4nTSnu1ynPLrxit2AnstUu1fy63Jeo1Ej57AN
	yPn5/i6WXQ9sLIJdAOFoxlQ7cU29x0NaBWtAQVMBXNXsn9tqYamjLd/Q
X-Gm-Gg: Acq92OFnDYb4ggnhYGx/gBo6rt1aTQtRxIlpFhtJK/viNu7mQqYvJ8qvNf1tCvHknZ5
	A5qAnFd3G9LwWg9/6hPdQMZJCxGqxM5oh7SLgvB73QXfMLu3WTCBZcBONKIe1m0kfJCl/P9HWzR
	Nx1I9Kn/SPtVD6ozQbqVjthN9q2HUONNs6YAyocQTo1Cczen0DMIBbpQ08jV76Usu71dx0o/W9H
	h19lCyAQf9o7uCq+de3nF7r5z6aaDg87T5jUJ8h92Hi0JbGV+3nkzZjvl2wKUvdTzMODsfSn+Ap
	dsgdYvBO7MWfsWtIcKO4s2UTlYZzBVKwA14hGsSoNkB5nyD13gH9kAfh0LsDtluyQnBAmLjKe17
	VyvXx9ZcqReppYbyObrC22yG4AeHIXU6zF8oIlmmP9xCtOqk+rUJ96E8tK3ZLWA9s7By9CYnLfY
	gsw0gUD/iycQNJ23uAHcWS88kzhLbjVk2z1h9suFj2Ez6YeqYOj2MODf649OB4pX6p9Up8Ca9+K
	iOdhZKHS+BfOmniRVUqMrOKlUI=
X-Received: by 2002:a05:600c:348b:b0:490:be9e:fd07 with SMTP id 5b1f17b1804b1-490be9eff47mr48596805e9.10.1780587329226;
        Thu, 04 Jun 2026 08:35:29 -0700 (PDT)
Message-ID: <60ad843e-3fc0-4f99-bbff-0a2f84679274@gmail.com>
Date: Thu, 4 Jun 2026 17:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/26] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <ed5218e94790ff8de36af12852605454606a6d80.1778250616.git.oleksii.kurochko@gmail.com>
 <1941ee36-cbfd-4d7f-a15b-e74843371f3b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1941ee36-cbfd-4d7f-a15b-e74843371f3b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1780587330-8A589A53-B68258A8/10/73395122804
X-purgate-type: spam
X-purgate-size: 13601
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87FDD6417EF



On 6/3/26 6:01 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/device.c
>> @@ -0,0 +1,108 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/iocap.h>
>> +#include <xen/rangeset.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/intc.h>
>> +
>> +int map_irq_to_domain(struct domain *d, unsigned int irq,
>> +                      bool need_mapping, const char *devname)
>> +{
>> +    int res;
>> +
>> +    res = irq_permit_access(d, irq);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
> 
> Nit: Drop the first "to"?

Sure, I will drop that.

> 
>> +        return res;
>> +    }
>> +
>> +    if ( need_mapping )
>> +    {
>> +        /*
>> +         * Checking the return of vintc_reserve_virq is not
>> +         * necessary. It should not fail except when we try to map
>> +         * the IRQ twice. This can legitimately happen if the IRQ is shared.
>> +         */
>> +        vintc_reserve_virq(d, irq);
>> +
>> +        res = route_irq_to_guest(d, irq, irq, devname);
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
>> +            return res;
>> +        }
>> +    }
>> +
>> +    dt_dprintk("  - IRQ: %u\n", irq);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * map_device_irqs_to_domain retrieves the interrupts configuration from
>> + * a device tree node and maps those interrupts to the target domain.
>> + *
>> + * Returns:
>> + *   < 0 error
>> + *   0   success
>> + */
>> +int map_device_irqs_to_domain(struct domain *d,
>> +                              struct dt_device_node *dev,
>> +                              bool need_mapping,
>> +                              struct rangeset *irq_ranges)
>> +{
>> +    unsigned int i, nirq;
>> +    int res, irq;
>> +    struct dt_raw_irq rirq;
> 
> Move the latter three variables to the loop's scope and ...
> 
>> +    nirq = dt_number_of_irq(dev);
> 
> ... make this the variable's initializer?

It makes sense. I will do that.

> 
>> +    /* Give permission and map IRQs */
>> +    for ( i = 0; i < nirq; i++ )
>> +    {
>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>> +                   i, dt_node_full_name(dev));
>> +            return res;
>> +        }
>> +
>> +        /*
>> +         * Don't map IRQ that have no physical meaning
>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>> +         */
>> +        if ( rirq.controller != dt_interrupt_controller )
>> +        {
>> +            dt_dprintk("irq %u not connected to primary controller."
>> +                       "Connected to %s\n", i,
>> +                       dt_node_full_name(rirq.controller));
>> +            continue;
>> +        }
>> +
>> +        irq = platform_get_irq(dev, i);
>> +        if ( irq < 0 )
>> +        {
>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>> +            return irq;
>> +        }
>> +
>> +        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
>> +        if ( res )
>> +            return res;
>> +
>> +
>> +        /*
>> +         * At the moment there is only one user of map_device_irqs_to_domain()
>> +         * for RISC-V which calls it irq_ranges == NULL.
>> +         */
>> +        if ( irq_ranges )
>> +            return -EOPNOTSUPP;
> 
> Why is this checked last, and inside the loop (when it's loop invariant)?

Just to show the place where irq_ranges will be handled. But currently I 
agree it would be better just move outside the loop.

> 
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -13,8 +13,11 @@ enum intc_version {
>>   };
>>   
>>   struct cpu_user_regs;
>> +struct domain;
> 
> I can spot why this is needed, but ...
> 
>> +struct dt_device_node;
>>   struct irq_desc;
>>   struct kernel_info;
>> +struct rangeset;
>>   struct vcpu;
> 
> ... I'm at a loss to explain the need for these two additions.

Rudements from previous version of this patch series. I will drop them.
The same below ...

> 
>> --- a/xen/arch/riscv/include/asm/setup.h
>> +++ b/xen/arch/riscv/include/asm/setup.h
>> @@ -5,6 +5,10 @@
>>   
>>   #include <xen/types.h>
>>   
>> +struct domain;
>> +struct dt_device_node;
>> +struct rangeset;
> 
> Same here - why would they be needed when you make no other changes
> to this header?

... here.

> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -7,7 +7,9 @@
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>> +#include <xen/sched.h>
>>   #include <xen/spinlock.h>
>> +#include <xen/xvmalloc.h>
>>   
>>   #include <asm/aia.h>
>>   #include <asm/intc.h>
>> @@ -86,6 +88,22 @@ unsigned int intc_irq_nums(void)
>>       return intc_hw_ops->irq_nums();
>>   }
>>   
>> +int intc_route_irq_to_guest(struct irq_desc *desc,
>> +                            unsigned int priority)
>> +{
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +
>> +    ASSERT(intc_hw_ops->guest_irq_type);
>> +
>> +    desc->handler = intc_hw_ops->guest_irq_type;
>> +    set_bit(_IRQ_GUEST, &desc->status);
> 
> Is desc->status accessed anywhere without holding desc->lock? If not,
> __set_bit() or simply |= ?

In release_irq() it could be used without lock:
...
     /* Wait to make sure it's not being used on another CPU */
     do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );

> 
>> @@ -112,6 +130,14 @@ int domain_vintc_init(struct domain *d)
>>           break;
>>       }
>>   
>> +    if ( !ret )
>> +    {
>> +        d->arch.vintc->allocated_irqs =
>> +            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->irq_nums));
>> +        if ( !d->arch.vintc->allocated_irqs )
>> +            ret = -ENOMEM;
>> +    }
>> +
>>       return ret;
>>   }
>>   
>> @@ -129,4 +155,14 @@ void domain_vintc_deinit(struct domain *d)
>>           printk("vintc (ver:%d) isn't implemented\n", ver);
>>           break;
>>       }
>> +
>> +    xvfree(d->arch.vintc->allocated_irqs);
>> +}
> 
> XVFREE()
> 
>> +bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
>> +{
>> +    if ( virq >= d->arch.vintc->irq_nums )
>> +        return false;
>> +
>> +    return !test_and_set_bit(virq, d->arch.vintc->allocated_irqs);
>>   }
> 
> As to function / field naming: You don't look to be allocating IRQs. So
> is there a reason the field name gives the impression of allocation?
> Simply s/allocated/used/ or some such?

I am okay to rename to 'used' instead of 'allocated'.

> 
>> @@ -221,3 +239,160 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
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
>> +
>> +void release_irq(unsigned int irq, const void *dev_id)
>> +{
>> +    struct irq_desc *desc;
>> +    unsigned long flags;
>> +    struct irqaction *action, **action_ptr;
>> +
>> +    desc = irq_to_desc(irq);
>> +
>> +    spin_lock_irqsave(&desc->lock,flags);
>> +
>> +    action_ptr = &desc->action;
>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> +    for ( ;; )
>> +    {
>> +        action = *action_ptr;
>> +        if ( !action )
>> +        {
>> +            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
>> +            spin_unlock_irqrestore(&desc->lock, flags);
>> +            return;
>> +        }
>> +
>> +        if ( action->dev_id == dev_id )
>> +            break;
>> +
>> +        action_ptr = &action->next;
>> +    }
>> +
>> +    /* Found it - remove it from the action list */
>> +    *action_ptr = action->next;
>> +#else
>> +    action = *action_ptr;

It is needed to add *action_ptr = NULL here to deal with ...

>> +#endif
>> +
>> +    /* If this was the last action, shut down the IRQ */
>> +    if ( !desc->action )
>> +    {
>> +        desc->handler->shutdown(desc);
>> +        clear_bit(_IRQ_GUEST, &desc->status);
>> +    }
>> +
>> +    spin_unlock_irqrestore(&desc->lock,flags);
>> +
>> +    /* Wait to make sure it's not being used on another CPU */
>> +    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
>> +
>> +    if ( action->free_on_release )
>> +        xvfree(action);
> 
> When !IRQ_HAS_MULTIPLE_ACTION desc->action becomes a dangling pointer here.

... it could be xvfree here as action is local variable.

> 
>> +/* Route an IRQ to a specific guest */
>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>> +                       unsigned int irq, const char *devname)
>> +{
>> +    struct irqaction *action;
>> +    struct irq_guest *info;
>> +    struct irq_desc *desc;
>> +    unsigned long flags;
>> +    int retval = 0;
>> +
>> +    desc = irq_to_desc(irq);
>> +
>> +    action = xvmalloc(struct irqaction);
>> +    if ( !action )
>> +        return -ENOMEM;
> 
> This is freed by release_irq(), but ...
> 
>> +    info = xvmalloc(struct irq_guest);
>> +    if ( !info )
> 
> ... where is the (non-error-path) freeing of this?
> 

Agree it should be freed.

I am thing about just to update release_irq():

if ( action->free_on_release )
{
     xvfree(action->dev_id);
     xvfree(action);
}

But I think it is conceptually is incorrect as owner of ->dev_id in this 
case is guest so it would be better if guest will do that. So I think it 
would be better to intoduce now release_guest_irq():

int release_guest_irq(struct domain *d, unsigned int virq)
{
     struct irq_desc *desc;
     struct irq_guest *info;
     unsigned long flags;

     desc = irq_to_desc(virq);

     spin_lock_irqsave(&desc->lock, flags);

     if ( !test_bit(_IRQ_GUEST, &desc->status) )
         goto unlock_err;

     info = irq_get_guest_info(desc);
     if ( d != info->d )
         goto unlock_err;

     spin_unlock_irqrestore(&desc->lock, flags);

     release_irq(desc->irq, info);
     xvfree(info);

     return 0;

  unlock_err:
     spin_unlock_irqrestore(&desc->lock, flags);
     return -EINVAL;
}

and then call it in domain_vintc_deinit() for all virqs of a domain.

>> +    {
>> +        xvfree(action);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    info->d = d;
>> +    info->virq = virq;
>> +
>> +    action->dev_id = info;
>> +    action->name = devname;
>> +    action->free_on_release = 1;
> 
> true
> 
>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
>> +    /*
>> +     * If the IRQ is already used by someone
>> +     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
>> +     *  For safety check if we are not trying to assign the IRQ to a
>> +     *  different vIRQ.
>> +     *  - Otherwise -> For now, don't allow the IRQ to be shared between
>> +     *  Xen and domains.
>> +     */
>> +    if ( desc->action != NULL )
>> +    {
>> +        if ( test_bit(_IRQ_GUEST, &desc->status) )
>> +        {
>> +            struct domain *ad = irq_get_domain(desc);
>> +
>> +            if ( d != ad )
>> +            {
>> +                printk(XENLOG_G_ERR "IRQ %u is already used by domain %u\n",
>> +                       irq, ad->domain_id);
>> +                retval = -EBUSY;
>> +            }
>> +            else if ( irq_get_guest_info(desc)->virq != virq )
>> +            {
>> +                printk(XENLOG_G_ERR
>> +                       "d%u: IRQ %u is already assigned to vIRQ %u\n",
>> +                       d->domain_id, irq, irq_get_guest_info(desc)->virq);
> 
> Please can you get used to using %pd?

I'll do my best. Thanks for consistently pointing that out. I appreciate it.


> 
>> +                retval = -EBUSY;
>> +            }
>> +        }
>> +        else
>> +        {
>> +            printk(XENLOG_G_ERR "IRQ %u is already used by Xen\n", irq);
>> +            retval = -EBUSY;
>> +        }
>> +        goto out;
>> +    }
>> +
>> +    retval = _setup_irq(desc, 0, action);
>> +    if ( retval )
>> +        goto out;
>> +
>> +    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
>> +
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    if ( retval )
>> +    {
>> +        release_irq(desc->irq, info);
> 
> Is de-referencing desc legitimate / race free with desc->lock not held?

desc itself cannot be freed, it's a pointer into the statically 
allocated array irq_desc[NR_IRQS] (riscv/irq.c:29). The descriptor 
object lives for the lifetime of the system.

desc->irq is write-once, it's set during init_irq_data() at boot 
(riscv/irq.c:172) and never modified again. It's effectively an 
immutable field after initialization, so reading it without the lock 
held is safe.

Thanks.

~ Oleksii


