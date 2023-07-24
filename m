Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB87602F7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 01:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569264.889670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4fp-0007F9-9X; Mon, 24 Jul 2023 23:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569264.889670; Mon, 24 Jul 2023 23:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4fp-0007DU-5u; Mon, 24 Jul 2023 23:09:05 +0000
Received: by outflank-mailman (input) for mailman id 569264;
 Mon, 24 Jul 2023 23:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO4fo-0007DO-Fq
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 23:09:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1421c33e-2a77-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 01:09:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C85886145F;
 Mon, 24 Jul 2023 23:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7F4C433C8;
 Mon, 24 Jul 2023 23:08:59 +0000 (UTC)
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
X-Inumbo-ID: 1421c33e-2a77-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690240141;
	bh=+GM9qScBHJhZPZmCDzrmXRXW1HhK2Vjnf0mP4FPhLrE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nMRx+P4DyEAexRJOE/r2mYNjGgrzqpYGqIQkMrWQ+IaXg+F+38KtgrcCpGfH+bvu1
	 O9hm/8w6aVb7Su1pFGvXJL+Lu+F9kys5qY3vlsNAks2JwIgwNHQPGJLnPmoRfW8IJ5
	 MikztO4rPl684SdPQXtDMW8JAee/FMbLTAb9lzzbOwXMa+nvZENoGzzL6aKqOLbr6h
	 Os1bQO9NS3YH2nuYtqL0C23AjFoow/cF00B8U0DMYjMNUIAPy+a+hShvzZi0XNLvJo
	 Gpv+k42PIg+NSu6DNZTkfCRlp5Pn2kQ8nFXKdw+mMWaRHCdjsWmIQX0VCjizRO9FyN
	 ym69HPRLe6jPg==
Date: Mon, 24 Jul 2023 16:08:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/3] x86/irq: address violations of MISRA C:2012
 Rules 8.2 and 8.3
In-Reply-To: <ae48788c6c41e5e506b9995037d176ac8b08d3f2.1690217195.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241558350.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690217195.git.federico.serafini@bugseng.com> <ae48788c6c41e5e506b9995037d176ac8b08d3f2.1690217195.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Federico Serafini wrote:
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
> ---
>  xen/arch/x86/include/asm/irq.h | 32 ++++++++++++++++----------------
>  xen/arch/x86/irq.c             | 28 ++++++++++++++--------------
>  2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index 3f95dd39b7..bb8b7ff2cc 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -101,18 +101,18 @@ void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs);
>  uint8_t alloc_hipriority_vector(void);
>  
>  void set_direct_apic_vector(
> -    uint8_t vector, void (*handler)(struct cpu_user_regs *));
> +    uint8_t vector, void (*handler)(struct cpu_user_regs *regs));
>  void alloc_direct_apic_vector(
> -    uint8_t *vector, void (*handler)(struct cpu_user_regs *));
> +    uint8_t *vector, void (*handler)(struct cpu_user_regs *regs));
>  
>  void do_IRQ(struct cpu_user_regs *regs);
>  
> -void cf_check disable_8259A_irq(struct irq_desc *);
> -void cf_check enable_8259A_irq(struct irq_desc *);
> +void cf_check disable_8259A_irq(struct irq_desc *desc);
> +void cf_check enable_8259A_irq(struct irq_desc *desc);
>  int i8259A_irq_pending(unsigned int irq);
>  void mask_8259A(void);
>  void unmask_8259A(void);
> -void init_8259A(int aeoi);
> +void init_8259A(int auto_eoi);
>  void make_8259A_irq(unsigned int irq);
>  bool bogus_8259A_irq(unsigned int irq);
>  int i8259A_suspend(void);
> @@ -148,9 +148,9 @@ int map_domain_pirq(struct domain *d, int pirq, int irq, int type,
>                             void *data);
>  int unmap_domain_pirq(struct domain *d, int pirq);
>  int get_free_pirq(struct domain *d, int type);
> -int get_free_pirqs(struct domain *, unsigned int nr);
> +int get_free_pirqs(struct domain *d, unsigned int nr);
>  void free_domain_pirqs(struct domain *d);
> -int map_domain_emuirq_pirq(struct domain *d, int pirq, int irq);
> +int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
>  int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
>  
>  /* Reset irq affinities to match the given CPU mask. */
> @@ -168,9 +168,9 @@ int irq_to_vector(int irq);
>   */
>  int create_irq(nodeid_t node, bool grant_access);
>  void destroy_irq(unsigned int irq);
> -int assign_irq_vector(int irq, const cpumask_t *);
> +int assign_irq_vector(int irq, const cpumask_t *mask);
>  
> -void cf_check irq_complete_move(struct irq_desc *);
> +void cf_check irq_complete_move(struct irq_desc *desc);
>  
>  extern struct irq_desc *irq_desc;
>  
> @@ -179,16 +179,16 @@ void unlock_vector_lock(void);
>  
>  void setup_vector_irq(unsigned int cpu);
>  
> -void move_native_irq(struct irq_desc *);
> -void move_masked_irq(struct irq_desc *);
> +void move_native_irq(struct irq_desc *desc);
> +void move_masked_irq(struct irq_desc *desc);
>  
> -int bind_irq_vector(int irq, int vector, const cpumask_t *);
> +int bind_irq_vector(int irq, int vector, const cpumask_t *mask);
>  
> -void cf_check end_nonmaskable_irq(struct irq_desc *, uint8_t vector);
> -void irq_set_affinity(struct irq_desc *, const cpumask_t *mask);
> +void cf_check end_nonmaskable_irq(struct irq_desc *desc, uint8_t vector);
> +void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask);
>  
> -int init_domain_irq_mapping(struct domain *);
> -void cleanup_domain_irq_mapping(struct domain *);
> +int init_domain_irq_mapping(struct domain *d);
> +void cleanup_domain_irq_mapping(struct domain *d);
>  
>  #define domain_pirq_to_irq(d, pirq) pirq_field(d, pirq, arch.irq, 0)
>  #define domain_irq_to_pirq(d, irq) ({                           \
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 20150b1c7f..c2ec1182f1 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -148,14 +148,14 @@ static void trace_irq_mask(uint32_t event, int irq, int vector,
>  }
>  
>  static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
> -                                   const cpumask_t *cpu_mask)
> +                                   const cpumask_t *mask)
>  {
>      cpumask_t online_mask;
>      int cpu;
>  
>      BUG_ON((unsigned)vector >= X86_NR_VECTORS);
>  
> -    cpumask_and(&online_mask, cpu_mask, &cpu_online_map);
> +    cpumask_and(&online_mask, mask, &cpu_online_map);
>      if (cpumask_empty(&online_mask))
>          return -EINVAL;
>      if ( (desc->arch.vector == vector) &&
> @@ -177,7 +177,7 @@ static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
>      return 0;
>  }
>  
> -int __init bind_irq_vector(int irq, int vector, const cpumask_t *cpu_mask)
> +int __init bind_irq_vector(int irq, int vector, const cpumask_t *mask)
>  {
>      struct irq_desc *desc = irq_to_desc(irq);
>      unsigned long flags;
> @@ -187,7 +187,7 @@ int __init bind_irq_vector(int irq, int vector, const cpumask_t *cpu_mask)
>  
>      spin_lock_irqsave(&desc->lock, flags);
>      spin_lock(&vector_lock);
> -    ret = _bind_irq_vector(desc, vector, cpu_mask);
> +    ret = _bind_irq_vector(desc, vector, mask);
>      spin_unlock(&vector_lock);
>      spin_unlock_irqrestore(&desc->lock, flags);
>  
> @@ -893,10 +893,10 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>      desc->status |= IRQ_MOVE_PENDING;
>  }
>  
> -void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
> +void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *mask)

I welcome feedback from the other maintainers on this but I would keep
the original "pirq" parameter name here...


>  {
>      unsigned long flags;
> -    struct irq_desc *desc = domain_spin_lock_irq_desc(d, pirq, &flags);
> +    struct irq_desc *desc = domain_spin_lock_irq_desc(d, irq, &flags);
>  
>      if ( !desc )
>          return;
> @@ -915,16 +915,16 @@ uint8_t alloc_hipriority_vector(void)
>      return next++;
>  }
>  
> -static void (*direct_apic_vector[X86_NR_VECTORS])(struct cpu_user_regs *);
> +static void (*direct_apic_vector[X86_NR_VECTORS])(struct cpu_user_regs *regs);
>  void set_direct_apic_vector(
> -    uint8_t vector, void (*handler)(struct cpu_user_regs *))
> +    uint8_t vector, void (*handler)(struct cpu_user_regs *regs))
>  {
>      BUG_ON(direct_apic_vector[vector] != NULL);
>      direct_apic_vector[vector] = handler;
>  }
>  
>  void alloc_direct_apic_vector(
> -    uint8_t *vector, void (*handler)(struct cpu_user_regs *))
> +    uint8_t *vector, void (*handler)(struct cpu_user_regs *regs))
>  {
>      static DEFINE_SPINLOCK(lock);
>  
> @@ -964,7 +964,7 @@ static int __init cf_check irq_ratelimit_init(void)
>  __initcall(irq_ratelimit_init);
>  
>  int __init request_irq(unsigned int irq, unsigned int irqflags,
> -        void (*handler)(int, void *, struct cpu_user_regs *),
> +        void (*handler)(int irq, void *dev_id, struct cpu_user_regs *regs),
>          const char * devname, void *dev_id)

I think hpet_interrupt_handler should be adapted for consistency



>  {
>      struct irqaction * action;
> @@ -1194,9 +1194,9 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>   * to the per-domain irq-to-vector mapping.
>   */
>  struct irq_desc *domain_spin_lock_irq_desc(
> -    struct domain *d, int pirq, unsigned long *pflags)
> +    struct domain *d, int irq, unsigned long *pflags)
>  {
> -    const struct pirq *info = pirq_info(d, pirq);
> +    const struct pirq *info = pirq_info(d, irq);
>  
>      return info ? pirq_spin_lock_irq_desc(info, pflags) : NULL;
>  }

... and here


> @@ -1525,14 +1525,14 @@ static int irq_acktype(const struct irq_desc *desc)
>      return 0;
>  }
>  
> -int pirq_shared(struct domain *d, int pirq)
> +int pirq_shared(struct domain *d, int irq)

and here


>  {
>      struct irq_desc    *desc;
>      const irq_guest_action_t *action;
>      unsigned long       flags;
>      int                 shared;
>  
> -    desc = domain_spin_lock_irq_desc(d, pirq, &flags);
> +    desc = domain_spin_lock_irq_desc(d, irq, &flags);

and here

I change the declarations as needed



>      if ( desc == NULL )
>          return 0;
>  
> -- 
> 2.34.1
> 
> 

