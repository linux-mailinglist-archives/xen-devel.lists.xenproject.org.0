Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D6C6133A
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 12:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163208.1490397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKasK-0008Q2-3E; Sun, 16 Nov 2025 11:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163208.1490397; Sun, 16 Nov 2025 11:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKasK-0008NR-0I; Sun, 16 Nov 2025 11:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1163208;
 Sun, 16 Nov 2025 11:24:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKasI-0008NJ-NS
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 11:24:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKasI-00A6Ox-09;
 Sun, 16 Nov 2025 11:24:54 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKasH-000ZIx-22;
 Sun, 16 Nov 2025 11:24:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=8Kvazm3Q1hwnhSP48kU+h7T/IgELmMxNSeocL2dWwMU=; b=L/wZoyB+BDbSqPlKnukFdgZyct
	cI8Pkp6zvlio7TdqR78k5778YZ7+KI73bXqTthBSyN6mKC/lXhbFfesKTjqQe7obpQvYBeoCg5ZZg
	CCh1pQifcJe0NdjoHivJCwvMggyt2F2ihZmOt7qpRg5SYp4dA2+8UHxd7OqVszvfT49w=;
Message-ID: <8099d0ed-74bd-4c98-9441-296daf76c41e@xen.org>
Date: Sun, 16 Nov 2025 11:24:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm/irq: Migrate IRQs from dyings CPUs
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <6371ac96102f48b55ffd884656770187ed3a7f84.1762939773.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6371ac96102f48b55ffd884656770187ed3a7f84.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 10:51, Mykyta Poturai wrote:
> Move IRQs from dying CPU to the online ones.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
> 
> If IRQ is to be migrated, it's affinity is set to a mask of all online
> CPUs. With current GIC implementation, this means they are routed to a
> random online CPU. This may cause extra moves if multiple cores are
> disabled in sequence, but should prevent all interrupts from piling up
> on CPU0 in case of repeated up-down cycles on different cores.

Wouldn't they eventually all move to CPU0 in the case of suspend/resume 
or if all the CPUs but CPU0 are turned off and then off? If so, 
shouldn't we try to rebalance the interrupts?

> 
> IRQs from CPU 0 are never migrated, as dying CPU 0 means we are either
> shutting down compeletely or entering system suspend.

I can't find a place where __cpu_disable() is called on CPU0. Do you 
have any pointer? In any case, I am not sure I want to bake that 
assumption in more places of the code.

> 
> Considering that all Xen-used IRQs are currently allocated during init
> on CPU 0, and setup_irq uses smp_processor_id for the initial affinity.

Looking at the SMMU driver, we seems to request IRQs at the time the 
device is attached. So are you sure about this?

> This change is not strictly required for correct operation for now, but
> it should future-proof cpu hotplug and system suspend support in case
> some kind if IRQ balancing is implemented later.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v3->v4:
> * patch introduced
> ---
>   xen/arch/arm/include/asm/irq.h |  2 ++
>   xen/arch/arm/irq.c             | 39 ++++++++++++++++++++++++++++++++++
>   xen/arch/arm/smpboot.c         |  2 ++
>   3 files changed, 43 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 09788dbfeb..6e6e27bb80 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -126,6 +126,8 @@ bool irq_type_set_by_domain(const struct domain *d);
>   void irq_end_none(struct irq_desc *irq);
>   #define irq_end_none irq_end_none
>   
> +void evacuate_irqs(unsigned int from);
> +
>   #endif /* _ASM_HW_IRQ_H */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 28b40331f7..b383d71930 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -158,6 +158,45 @@ static int init_local_irq_data(unsigned int cpu)
>       return 0;
>   }
>   
> +static void evacuate_irq(int irq, unsigned int from)

Any reason why the 'irq' is signed?

> +{
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    /* Don't move irqs from CPU 0 as it is always last to be disabled */

Per above, I am not convinced that we should special case CPU 0. But if 
we do, then shouldn't this be part of evacuate_irqs() so we don't 
pointlessly go through all the IRQs?

> +    if ( from == 0 )
> +        return;
> +
> +    ASSERT(!cpumask_empty(&cpu_online_map));
> +    ASSERT(!cpumask_test_cpu(from, &cpu_online_map));
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    if ( likely(!desc->action) )
> +        goto out;
> +
> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> +        goto out;
> +
> +    if ( cpumask_test_cpu(from, desc->affinity) )
> +        irq_set_affinity(desc, &cpu_online_map);

I think it would be worth explaining why we are routing to any CPU 
online rather than checking whether the affinity has other online CPUs.

Just to note, I don't have strong opinion either way. It mainly needs to 
be documented.

> +
> +out:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +    return;
> +}
> +
> +void evacuate_irqs(unsigned int from)
> +{
> +    int irq;
 > +> +    for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> +        evacuate_irq(irq, from);
> +
> +    for ( irq = ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )

AFAICT, irq_to_desc() would not be able to cope with ESPI interrupts 
when CONFIG_GICV3_ESPI is not set. Has this been tested?

> +        evacuate_irq(irq, from);
> +}
> +
>   static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>                           void *hcpu)
>   {
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7f3cfa812e..46b24783dd 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -425,6 +425,8 @@ void __cpu_disable(void)
>   
>       smp_mb();
>   
> +    evacuate_irqs(cpu);

I think it would be worth explaining why evacuate_irqs() is called this 
late in the process.

 > +>       /* Return to caller; eventually the IPI mechanism will 
unwind and the
>        * scheduler will drop to the idle loop, which will call stop_cpu(). */
>   }

Cheers,

-- 
Julien Grall


