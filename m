Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4F7678CE
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 01:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571607.895894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPWZJ-0006dm-0s; Fri, 28 Jul 2023 23:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571607.895894; Fri, 28 Jul 2023 23:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPWZI-0006bj-Tr; Fri, 28 Jul 2023 23:08:20 +0000
Received: by outflank-mailman (input) for mailman id 571607;
 Fri, 28 Jul 2023 23:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jbsw=DO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qPWZI-0006bd-0D
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 23:08:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a239f704-2d9b-11ee-8613-37d641c3527e;
 Sat, 29 Jul 2023 01:08:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93BCC62196;
 Fri, 28 Jul 2023 23:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AADCC433C8;
 Fri, 28 Jul 2023 23:08:13 +0000 (UTC)
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
X-Inumbo-ID: a239f704-2d9b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690585695;
	bh=+pJJSoEay1f5TrZkP8X2Y7qCVMHae+jGGS10/4sO0js=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LBcoqvAryi4xa5/pE51Cuh/ps1oCx/qdF0gS8SS1n8HdC9VQIUwFWXasBDolpojZt
	 FWmkH1icex0JCeP6CoTzsFvbk08CXTsMprgDlIw1+X4XZQOvqGwv5TrZg7bt4C7+XP
	 7OgoHTgxGLKPeqRE/UcecWhELyyzI7F60+6BMPV5Ws09SP3xQYfS2+vMnmqF6TcpJe
	 SRCgnndBn761CCEp/DIo/22W9Updh8T4bpz8STxjx6UDz2m4TZN3uHVcUxCAar2VIH
	 eqyiHq5YQLxtXULcqRo7t+UXOFjBY05M25XDE/FP0Gr23ngP5xg/GdTAwCyFMx3NXw
	 k8vveHXhF4zgQ==
Date: Fri, 28 Jul 2023 16:08:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 1/2] xen/IRQ: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
In-Reply-To: <6a72c66e2bfd83ca92c1fd9c702f6125d27062b1.1690544434.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307281608070.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690544434.git.federico.serafini@bugseng.com> <6a72c66e2bfd83ca92c1fd9c702f6125d27062b1.1690544434.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Jul 2023, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>   - use 'pirq' instead of 'irq';
>   - removed changes involving function pointers.
> ---
>  xen/arch/arm/irq.c        |  2 +-
>  xen/include/xen/irq.h     | 41 ++++++++++++++++++++-------------------
>  xen/include/xen/softirq.h |  2 +-
>  3 files changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 16e56f8945..054bb281d8 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -58,7 +58,7 @@ hw_irq_controller no_irq_type = {
>  static irq_desc_t irq_desc[NR_IRQS];
>  static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
>  
> -irq_desc_t *__irq_to_desc(int irq)
> +struct irq_desc *__irq_to_desc(int irq)
>  {
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index 300625e56d..9747e818f7 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -110,22 +110,22 @@ typedef struct irq_desc {
>  #define irq_to_desc(irq)    (&irq_desc[irq])
>  #endif
>  
> -int init_one_irq_desc(struct irq_desc *);
> -int arch_init_one_irq_desc(struct irq_desc *);
> +int init_one_irq_desc(struct irq_desc *desc);
> +int arch_init_one_irq_desc(struct irq_desc *desc);
>  
>  #define irq_desc_initialized(desc) ((desc)->handler != NULL)
>  
>  extern int setup_irq(unsigned int irq, unsigned int irqflags,
> -                     struct irqaction *);
> +                     struct irqaction *new);
>  extern void release_irq(unsigned int irq, const void *dev_id);
>  extern int request_irq(unsigned int irq, unsigned int irqflags,
>                 void (*handler)(int, void *, struct cpu_user_regs *),
> -               const char * devname, void *dev_id);
> +               const char *devname, void *dev_id);
>  
>  extern hw_irq_controller no_irq_type;
>  void cf_check no_action(int cpl, void *dev_id, struct cpu_user_regs *regs);
> -unsigned int cf_check irq_startup_none(struct irq_desc *);
> -void cf_check irq_actor_none(struct irq_desc *);
> +unsigned int cf_check irq_startup_none(struct irq_desc *desc);
> +void cf_check irq_actor_none(struct irq_desc *desc);
>  #define irq_shutdown_none irq_actor_none
>  #define irq_disable_none irq_actor_none
>  #define irq_enable_none irq_actor_none
> @@ -146,7 +146,7 @@ struct pirq {
>  #define pirq_info(d, p) ((struct pirq *)radix_tree_lookup(&(d)->pirq_tree, p))
>  
>  /* Use this instead of pirq_info() if the structure may need allocating. */
> -extern struct pirq *pirq_get_info(struct domain *, int pirq);
> +extern struct pirq *pirq_get_info(struct domain *d, int pirq);
>  
>  #define pirq_field(d, p, f, def) ({ \
>      const struct pirq *__pi = pirq_info(d, p); \
> @@ -155,30 +155,31 @@ extern struct pirq *pirq_get_info(struct domain *, int pirq);
>  #define pirq_to_evtchn(d, pirq) pirq_field(d, pirq, evtchn, 0)
>  #define pirq_masked(d, pirq) pirq_field(d, pirq, masked, 0)
>  
> -void pirq_cleanup_check(struct pirq *, struct domain *);
> +void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
>  
>  #define pirq_cleanup_check(pirq, d) \
>      ((pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
>  
> -extern void pirq_guest_eoi(struct pirq *);
> -extern void desc_guest_eoi(struct irq_desc *, struct pirq *);
> +extern void pirq_guest_eoi(struct pirq *pirq);
> +extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
>  extern int pirq_guest_unmask(struct domain *d);
> -extern int pirq_guest_bind(struct vcpu *, struct pirq *, int will_share);
> -extern void pirq_guest_unbind(struct domain *d, struct pirq *);
> -extern void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *);
> -extern irq_desc_t *domain_spin_lock_irq_desc(
> -    struct domain *d, int irq, unsigned long *pflags);
> -extern irq_desc_t *pirq_spin_lock_irq_desc(
> -    const struct pirq *, unsigned long *pflags);
> +extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
> +extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
> +extern void pirq_set_affinity(struct domain *d, int pirq,
> +                              const cpumask_t *mask);
> +extern struct irq_desc *domain_spin_lock_irq_desc(
> +    struct domain *d, int pirq, unsigned long *pflags);
> +extern struct irq_desc *pirq_spin_lock_irq_desc(
> +    const struct pirq *pirq, unsigned long *pflags);
>  
> -unsigned int set_desc_affinity(struct irq_desc *, const cpumask_t *);
> +unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask);
>  
>  #ifndef arch_hwdom_irqs
> -unsigned int arch_hwdom_irqs(domid_t);
> +unsigned int arch_hwdom_irqs(domid_t domid);
>  #endif
>  
>  #ifndef arch_evtchn_bind_pirq
> -void arch_evtchn_bind_pirq(struct domain *, int pirq);
> +void arch_evtchn_bind_pirq(struct domain *d, int pirq);
>  #endif
>  
>  #endif /* __XEN_IRQ_H__ */
> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
> index 1f6c4783da..33d6f2ecd2 100644
> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -26,7 +26,7 @@ typedef void (*softirq_handler)(void);
>  void do_softirq(void);
>  void open_softirq(int nr, softirq_handler handler);
>  
> -void cpumask_raise_softirq(const cpumask_t *, unsigned int nr);
> +void cpumask_raise_softirq(const cpumask_t *mask, unsigned int nr);
>  void cpu_raise_softirq(unsigned int cpu, unsigned int nr);
>  void raise_softirq(unsigned int nr);
>  
> -- 
> 2.34.1
> 

