Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429974DFE3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 22:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561407.877842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxyP-0008GV-RO; Mon, 10 Jul 2023 20:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561407.877842; Mon, 10 Jul 2023 20:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxyP-0008Ek-On; Mon, 10 Jul 2023 20:59:09 +0000
Received: by outflank-mailman (input) for mailman id 561407;
 Mon, 10 Jul 2023 20:59:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qIxyO-0008Eb-4P
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 20:59:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qIxyN-0001qE-0K; Mon, 10 Jul 2023 20:59:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qIxyM-0004Sr-Pz; Mon, 10 Jul 2023 20:59:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=jQhlamo0auyjYn+di/qoY4T1dB+rjc/i+EUateFuE6A=; b=M07OgVp/IRO91SSGVqpcI5L/3j
	09DFgI/u9iiVYiOFHArE7kyHJODRxxPRcz0DNQ9OtDl8Nf9sWOTRBTTRwSAtlmCD79BcydLqVc0mR
	5E63/KvcNTZuMJW438N1Ea3vgeiotFcv2UlP/6vtZPDfUQN03lbBgyNhUp9rwMlX3YpE=;
Message-ID: <0cd9d94b-0a8d-a3e1-d683-04fac1572750@xen.org>
Date: Mon, 10 Jul 2023 21:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
In-Reply-To: <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/05/2023 16:33, Jan Beulich wrote:
> ... by way of a new arch-selectable Kconfig control.
> 
> Note that some smaller pieces of code are left without #ifdef, to keep
> things better readable. Hence items like ECS_PIRQ, nr_static_irqs, or
> domain_pirq_to_irq() remain uniformly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm not really certain about XEN_DOMCTL_irq_permission: With pIRQ-s not
> used, the prior pIRQ -> IRQ translation cannot have succeeded on Arm, so
> quite possibly the entire domctl is unused there? Yet then how is access
> to particular device IRQs being granted/revoked?
> ---
> v2: New.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1120,7 +1120,7 @@ introduced with the Nehalem architecture
>         intended as an emergency option for people who first chose fast, then
>         change their minds to secure, and wish not to reboot.**
>   
> -### extra_guest_irqs
> +### extra_guest_irqs (x86)
>   > `= [<domU number>][,<dom0 number>]`
>   
>   > Default: `32,<variable>`
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -52,7 +52,6 @@ struct arch_irq_desc {
>   
>   extern const unsigned int nr_irqs;
>   #define nr_static_irqs NR_IRQS
> -#define arch_hwdom_irqs(domid) NR_IRQS
>   
>   struct irq_desc;
>   struct irqaction;
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -25,6 +25,7 @@ config X86
>   	select HAS_PCI
>   	select HAS_PCI_MSI
>   	select HAS_PDX
> +	select HAS_PIRQ
>   	select HAS_SCHED_GRANULARITY
>   	select HAS_UBSAN
>   	select HAS_VPCI if HVM
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -56,6 +56,9 @@ config HAS_KEXEC
>   config HAS_PDX
>   	bool
>   
> +config HAS_PIRQ
> +	bool
> +
>   config HAS_PMAP
>   	bool
>   
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -350,6 +350,8 @@ static int late_hwdom_init(struct domain
>   #endif
>   }
>   
> +#ifdef CONFIG_HAS_PIRQ
> +
>   static unsigned int __read_mostly extra_hwdom_irqs;
>   static unsigned int __read_mostly extra_domU_irqs = 32;
>   
> @@ -364,6 +366,8 @@ static int __init cf_check parse_extra_g
>   }
>   custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>   
> +#endif /* CONFIG_HAS_PIRQ */

NIT: I would suggest create a file pirq.c and move anything PIRQ 
specific there. This should reduce the number of #ifdef in the code.

> +
>   /*
>    * Release resources held by a domain.  There may or may not be live
>    * references to the domain, and it may or may not be fully constructed.
> @@ -653,6 +657,7 @@ struct domain *domain_create(domid_t dom
>       if ( is_system_domain(d) && !is_idle_domain(d) )
>           return d;
>   
> +#ifdef CONFIG_HAS_PIRQ
>       if ( !is_idle_domain(d) )
>       {
>           if ( !is_hardware_domain(d) )
> @@ -664,6 +669,7 @@ struct domain *domain_create(domid_t dom
>   
>           radix_tree_init(&d->pirq_tree);
>       }
> +#endif
>   
>       if ( (err = arch_domain_create(d, config, flags)) != 0 )
>           goto fail;
> @@ -755,7 +761,9 @@ struct domain *domain_create(domid_t dom
>       {
>           evtchn_destroy(d);
>           evtchn_destroy_final(d);
> +#ifdef CONFIG_HAS_PIRQ
>           radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
> +#endif
>       }
>       if ( init_status & INIT_watchdog )
>           watchdog_domain_destroy(d);
> @@ -1151,7 +1159,9 @@ static void cf_check complete_domain_des
>   
>       evtchn_destroy_final(d);
>   
> +#ifdef CONFIG_HAS_PIRQ
>       radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
> +#endif
>   
>       xfree(d->vcpu);
>   
> @@ -1864,6 +1874,8 @@ long do_vm_assist(unsigned int cmd, unsi
>   }
>   #endif
>   
> +#ifdef CONFIG_HAS_PIRQ
> +

With this change and some others, we probably can remove 
alloc_pirq_struct() & co. I will have a look to send a clean-up patch 
after this goes in.

>   struct pirq *pirq_get_info(struct domain *d, int pirq)
>   {
>       struct pirq *info = pirq_info(d, pirq);
> @@ -1893,6 +1905,8 @@ void cf_check free_pirq_struct(void *ptr
>       call_rcu(&pirq->rcu_head, _free_pirq_struct);
>   }
>   
> +#endif /* CONFIG_HAS_PIRQ */
> +
>   struct migrate_info {
>       long (*func)(void *data);
>       void *data;
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>           unsigned int pirq = op->u.irq_permission.pirq, irq;
>           int allow = op->u.irq_permission.allow_access;
>   
> +#ifdef CONFIG_HAS_PIRQ
>           if ( pirq >= current->domain->nr_pirqs )
>           {
>               ret = -EINVAL;
>               break;
>           }
> +#endif

This #ifdef reads a little bit strange. If we can get away with the 
check for Arm, then why can't when CONFIG_HAS_PIRQ=y? Overall, a comment 
would be helpful.

>           irq = pirq_access_permitted(current->domain, pirq);
>           if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
>               ret = -EPERM;

Cheers,

-- 
Julien Grall

