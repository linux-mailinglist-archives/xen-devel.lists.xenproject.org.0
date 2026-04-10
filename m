Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I3BNL/E2GnxhwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:37:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC43D4FF9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278577.1563359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8I6-0000ER-Fc; Fri, 10 Apr 2026 09:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278577.1563359; Fri, 10 Apr 2026 09:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8I6-0000BH-CM; Fri, 10 Apr 2026 09:36:42 +0000
Received: by outflank-mailman (input) for mailman id 1278577;
 Fri, 10 Apr 2026 09:36:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wB8I4-0000BA-Kp
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:36:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8I4-00GYaz-0Z
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:36:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69d8c4a0-e002-0a2a0a5209dd-0a2a4504bc22-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:36:39 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <olekstysh@gmail.com>)
 id 69d8c4a7-bb33-0a2a45040019-d155a730d1e4-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:36:39 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a283c44478so2861391e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:36:39 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.140])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38e49541ddfsm5992931fa.27.2026.04.10.02.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 02:36:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775813799; x=1776418599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRSueHNz2o5rXuQgWRz7KFXF7KSny49Ei2qJMBfBcuo=;
        b=C8V3mo1GrMvV5lfwgJGwh1XPCdfY8eJovleuuHq9bzHMqgnjYVm8eh6vLV7d8JNRfH
         cJBV+3MPLkRxX3k7NY1t7Zi2SbNlNY941ljcoMf/lKnWwWWvguA0jsYfxwoem1hHEi1v
         ywdIxhTZhnfpP3FNDUJebp6pd6kQSgOOlJ+SKUIlYt++DyVym6M45TAnqdxkneLeXelN
         eFN3fsH2Zi/G5ZsO8rkz7kZWlvqw2Wt8D5WTyIqFth6PXrAk0c9E4yQgrWOkb5h4R7LL
         BM6WvTY4AVJYqQ8kgy2XxrySm+70qaunsJ825fryJh5hZp+oMAR6odM9W6SuELMfDhYa
         TB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813799; x=1776418599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRSueHNz2o5rXuQgWRz7KFXF7KSny49Ei2qJMBfBcuo=;
        b=HAEwDApQTjVOLna1dCHeOgEhmhxrcLQEBAYXUecxcuacLA1t6HdhZL7x0T0t9/+yfE
         G7TPJOju0i4bvDRKQXGbtS4l/a7slq9LvtSe/anSVcPStUDooa9vRwAhvsy7/gJ9BX2U
         qRKJmsTR2/Kk8zDfrKS60t7D9Ei05SsXLWgvt0dthMKEZ63pDi1bX0xpK3YLIu/RCPp2
         pXnZXWey5bM587UWLRImPZAcKed9aymo7UKAQms6RKebEMepejMfDsP2lond06Xd6rzj
         GQqy7cnYVsiuSC0CwV4+837LgFVL9u1zrs7IrGr8s9goyuseaap5cvEwxGkxkLMK17HG
         qDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtVm4gW4fn1j2i4btaeIKJFjiqK9hYeTp/U6mnIZ9o2V17/9nP15NOmMDuOutM3Hxplh5UTu7Y7GE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEuPfOI2qwmGLv7Q/QvQ3PZ3+uBJ3JJ2Mo9nTXCTEcSNCzhe9x
	t/UtSxAUkai/8OVcrL8xz0755f3QtqLmJ6w8q/+3Px1siEtCpxYx9KxEa3EZyQ==
X-Gm-Gg: AeBDieswujYS8e1mLvSliSEKGdY0mkwfaTWT/N/QivBkQpuRqDBTMnbh5uKEsTv7M9F
	v6ROUdwq1m+yFh71PG8Ml3A/RJ5niKhC9sNhTqpKWhek8E1QZWT8NCjX94FHg8DRn7w39zokwDK
	L3eUOv/TRKJgRVJFLhp/1PmdCaCbkexuI12jEZQrEH70H/Ze38fDsrVN/PsQP4ePRlH7Kb6GYTU
	3Iq893kKHoyaRyOy8LfYSIVrfUKLfBfml1xo3dykpZdl4geIHGwQSKk6DkHj4Yqk5duYJDHXy0Z
	oaf4hde9oBav4xTTCovDGp7SWg/ZXjVSkPY2RnmdeaAw47e7dZgdFQt5tXNtDnKPYTwDz1FIwMx
	00zSm2DxqGojNBpJZLIhqGVUdDMtpC36qwKFVCb95+Hdc58xDJdVssBpTRq8e/4lApIRS6KwL7s
	H175FQNgHkgA6fsnHQsQVh750h5iw=
X-Received: by 2002:a05:6512:3d07:b0:5a2:ca1d:8ea8 with SMTP id 2adb3069b0e04-5a3efb282fbmr821476e87.25.1775813798502;
        Fri, 10 Apr 2026 02:36:38 -0700 (PDT)
Message-ID: <bf39819f-12dc-4b64-9738-1ce0f4f2e111@gmail.com>
Date: Fri, 10 Apr 2026 12:36:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <d1fce979525d4296b0f461fda7dc08ad1d596d6d.1774871881.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <d1fce979525d4296b0f461fda7dc08ad1d596d6d.1774871881.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775813799-3212551B-B8226B98/0/0
X-purgate-type: clean
X-purgate-size: 5488
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4AFC43D4FF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/26 14:59, Mykyta Poturai wrote:

Hello Mykyta


> Move IRQs from dying CPU to the online ones when a CPU is getting
> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v6->v7:
> * replace ifdef with IS_ENABLED
> 
> v5->v6:
> * don't do any balancing on boot
> * only do balancing when cpu hotplug is enabled
> 
> v4->v5:
> * handle CPU onlining as well
> * more comments
> * fix crash when ESPI is disabled
> * don't assume CPU 0 is a boot CPU
> * use insigned int for irq number
> * remove assumption that all irqs a bound to CPU 0 by default from the
>    commit message
> 
> v3->v4:
> * patch introduced
> ---
>   xen/arch/arm/include/asm/irq.h |  6 ++++
>   xen/arch/arm/irq.c             | 59 ++++++++++++++++++++++++++++++++++
>   xen/arch/arm/smpboot.c         |  7 ++++
>   3 files changed, 72 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 09788dbfeb..3ed55e02c3 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -126,6 +126,12 @@ bool irq_type_set_by_domain(const struct domain *d);
>   void irq_end_none(struct irq_desc *irq);
>   #define irq_end_none irq_end_none
>   
> +#ifdef CONFIG_CPU_HOTPLUG
> +void rebalance_irqs(unsigned int from, bool up);
> +#else
> +static inline void rebalance_irqs(unsigned int from, bool up) {}
> +#endif
> +
>   #endif /* _ASM_HW_IRQ_H */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7204bc2b68..447bee428e 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -158,6 +158,60 @@ static int init_local_irq_data(unsigned int cpu)
>       return 0;
>   }
>   
> +#ifdef CONFIG_CPU_HOTPLUG
> +static int cpu_next;
> +
> +static void balance_irq(int irq, unsigned int from, bool up)
> +{
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    ASSERT(!cpumask_empty(&cpu_online_map));
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    if ( likely(!desc->action) )
> +        goto out;
> +
> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> +        goto out;
> +
> +    /*
> +     * Setting affinity to a mask of multiple CPUs causes the GIC drivers to
> +     * select one CPU from that mask. If the dying CPU was included in the IRQ's
> +     * affinity mask, we cannot determine exactly which CPU the interrupt is
> +     * currently routed to, as GIC drivers lack a concrete get_affinity API. So
> +     * to be safe we must reroute it to a new, definitely online, CPU. In the
> +     * case of CPU going down, we move only the interrupt that could reside on
> +     * it. Otherwise, we rearrange all interrupts in a round-robin fashion.
> +     */
> +    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
> +        goto out;
> +
> +    cpu_next = cpumask_cycle(cpu_next, &cpu_online_map);
> +    irq_set_affinity(desc, cpumask_of(cpu_next));
> +
> +out:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +}
> +
> +void rebalance_irqs(unsigned int from, bool up)
> +{
> +    int irq;
> +
> +    if ( cpumask_empty(&cpu_online_map) )
> +        return;
> +
> +    for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> +        balance_irq(irq, from, up);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( irq = ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
> +        balance_irq(irq, from, up);

I think, here we have an inefficient iteration over the ESPI range.
Even when CONFIG_GICV3_ESPI=y, the GIC HW might not support ESPIs at 
runtime.

We should probably check if they are present before entering the loop so 
we do not waste cycles on 1024 unnecessary NULL lookups. Could we use 
something like ESPI_BASE_INTID + gic_number_espis() to set the loop 
boundary? What do you think?

> +#endif
> +}
> +#endif /* CONFIG_CPU_HOTPLUG */
> +
>   static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>                           void *hcpu)
>   {
> @@ -172,6 +226,11 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>               printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
>                      cpu);
>           break;
> +    case CPU_ONLINE:
> +        if ( IS_ENABLED(CONFIG_CPU_HOTPLUG) &&
> +             system_state >= SYS_STATE_active )
> +            rebalance_irqs(cpu, true);
> +        break;
>       }
>   
>       return notifier_from_errno(rc);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7f3cfa812e..7d877179c0 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -425,6 +425,13 @@ void __cpu_disable(void)
>   
>       smp_mb();
>   
> +    /*
> +     * Now that the interrupts are cleared and the CPU marked as offline,
> +     * move interrupts out of it
> +     */
> +    if ( IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +        rebalance_irqs(cpu, false);
> +
>       /* Return to caller; eventually the IPI mechanism will unwind and the
>        * scheduler will drop to the idle loop, which will call stop_cpu(). */
>   }


