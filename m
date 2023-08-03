Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED976DDC8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 04:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575954.901543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNdS-0007s2-7i; Thu, 03 Aug 2023 02:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575954.901543; Thu, 03 Aug 2023 02:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNdS-0007pl-51; Thu, 03 Aug 2023 02:00:18 +0000
Received: by outflank-mailman (input) for mailman id 575954;
 Thu, 03 Aug 2023 02:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNdR-0007pf-8V
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 02:00:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c72e0fa-31a1-11ee-b267-6b7b168915f2;
 Thu, 03 Aug 2023 04:00:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D841A61069;
 Thu,  3 Aug 2023 02:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A47C433C8;
 Thu,  3 Aug 2023 02:00:11 +0000 (UTC)
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
X-Inumbo-ID: 7c72e0fa-31a1-11ee-b267-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691028013;
	bh=8V7IIqQLl9s20Gt2MiDLHn34a5YPUaUtQhF0fee8D7U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FaqR3DxxRTSiU7rMxUnBDTpcteqIBBtJUuqDFGWdBng7tvHbYxfgo20/4fVT0RJJT
	 JP0zigJtuIYio6DzJLGIGv0Fq56eZRxxJYCLRU4SXOWTNWzAq6rjFsQ5VwPb+0vVAc
	 Xr365xYx17Cx+K6ur3KNdqCWvUdnvNA2WNDpBEpFeMoIT0AoLVJpa3MS/oNeI3hQT2
	 BBNUWqizuw53Y5/ayKBsw9xPIxCVwpbsiiOJ+7pa1lphOUqrkNBbjKB6Gl2NNvhgxO
	 VM74NO23b+7P3amP3EIrLxfU1wrWTHrE9T/+ft7erJD4acj4TGZig1yphFuOlvVYB9
	 0/h087a+qUuuQ==
Date: Wed, 2 Aug 2023 19:00:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 3/4] x86/irq: rename variable to address MISRA C:2012
 Rule 5.3
In-Reply-To: <af52de5af977362330680707e0acf890e3cb0995.1690969271.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021900030.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com> <af52de5af977362330680707e0acf890e3cb0995.1690969271.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> The extern variable 'irq_desc' defined in 'irq.h' is shadowed by
> local variables in the changed file. To avoid this, the variable is
> renamed to 'irq_description'.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/hvm/hvm.c         |  2 +-
>  xen/arch/x86/include/asm/irq.h |  2 +-
>  xen/arch/x86/io_apic.c         | 10 +++++-----
>  xen/arch/x86/irq.c             | 12 ++++++------
>  xen/arch/x86/msi.c             |  4 ++--
>  xen/include/xen/irq.h          |  2 +-
>  6 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 2180abeb33..ca5bb96388 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -474,7 +474,7 @@ void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
>  
>          if ( !desc )
>              return;
> -        ASSERT(MSI_IRQ(desc - irq_desc));
> +        ASSERT(MSI_IRQ(desc - irq_descriptor));
>          irq_set_affinity(desc, cpumask_of(v->processor));
>          spin_unlock_irq(&desc->lock);
>      }
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index ad907fc97f..f6df977170 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -172,7 +172,7 @@ int assign_irq_vector(int irq, const cpumask_t *mask);
>  
>  void cf_check irq_complete_move(struct irq_desc *desc);
>  
> -extern struct irq_desc *irq_desc;
> +extern struct irq_desc *irq_descriptor;
>  
>  void lock_vector_lock(void);
>  void unlock_vector_lock(void);
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index b3afef8933..b59d6cfb9e 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -990,9 +990,9 @@ static inline void ioapic_register_intr(int irq, unsigned long trigger)
>  {
>      if ((trigger == IOAPIC_AUTO && IO_APIC_irq_trigger(irq)) ||
>          trigger == IOAPIC_LEVEL)
> -        irq_desc[irq].handler = &ioapic_level_type;
> +        irq_descriptor[irq].handler = &ioapic_level_type;
>      else
> -        irq_desc[irq].handler = &ioapic_edge_type;
> +        irq_descriptor[irq].handler = &ioapic_edge_type;
>  }
>  
>  static void __init setup_IO_APIC_irqs(void)
> @@ -1098,7 +1098,7 @@ static void __init setup_ExtINT_IRQ0_pin(unsigned int apic, unsigned int pin, in
>       * The timer IRQ doesn't have to know that behind the
>       * scene we have a 8259A-master in AEOI mode ...
>       */
> -    irq_desc[0].handler = &ioapic_edge_type;
> +    irq_descriptor[0].handler = &ioapic_edge_type;
>  
>      /*
>       * Add it to the IO-APIC irq-routing table:
> @@ -1912,7 +1912,7 @@ static void __init check_timer(void)
>      if ((ret = bind_irq_vector(0, vector, &cpumask_all)))
>          printk(KERN_ERR"..IRQ0 is not set correctly with ioapic!!!, err:%d\n", ret);
>      
> -    irq_desc[0].status &= ~IRQ_DISABLED;
> +    irq_descriptor[0].status &= ~IRQ_DISABLED;
>  
>      /*
>       * Subtle, code in do_timer_interrupt() expects an AEOI
> @@ -2009,7 +2009,7 @@ static void __init check_timer(void)
>      printk(KERN_INFO "...trying to set up timer as Virtual Wire IRQ...");
>  
>      disable_8259A_irq(irq_to_desc(0));
> -    irq_desc[0].handler = &lapic_irq_type;
> +    irq_descriptor[0].handler = &lapic_irq_type;
>      apic_write(APIC_LVT0, APIC_DM_FIXED | vector);	/* Fixed mode */
>      enable_8259A_irq(irq_to_desc(0));
>  
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 6abfd81621..ed95896bce 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -45,7 +45,7 @@ integer_param("irq-max-guests", irq_max_guests);
>  
>  vmask_t global_used_vector_map;
>  
> -struct irq_desc __read_mostly *irq_desc = NULL;
> +struct irq_desc __read_mostly *irq_descriptor = NULL;
>  
>  static DECLARE_BITMAP(used_vectors, X86_NR_VECTORS);
>  
> @@ -424,9 +424,9 @@ int __init init_irq_data(void)
>      for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
>          this_cpu(vector_irq)[vector] = INT_MIN;
>  
> -    irq_desc = xzalloc_array(struct irq_desc, nr_irqs);
> -    
> -    if ( !irq_desc )
> +    irq_descriptor = xzalloc_array(struct irq_desc, nr_irqs);
> +
> +    if ( !irq_descriptor )
>          return -ENOMEM;
>  
>      for ( irq = 0; irq < nr_irqs_gsi; irq++ )
> @@ -1133,7 +1133,7 @@ static void cf_check set_eoi_ready(void *data);
>  static void cf_check irq_guest_eoi_timer_fn(void *data)
>  {
>      struct irq_desc *desc = data;
> -    unsigned int i, irq = desc - irq_desc;
> +    unsigned int i, irq = desc - irq_descriptor;
>      irq_guest_action_t *action;
>  
>      spin_lock_irq(&desc->lock);
> @@ -1382,7 +1382,7 @@ static void __set_eoi_ready(const struct irq_desc *desc)
>      struct pending_eoi *peoi = this_cpu(pending_eoi);
>      int                 irq, sp;
>  
> -    irq = desc - irq_desc;
> +    irq = desc - irq_descriptor;
>  
>      if ( !action || action->in_flight ||
>           !cpumask_test_and_clear_cpu(smp_processor_id(),
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index d0bf63df1d..35d417c63a 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -1322,7 +1322,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>          unsigned int i = 0, nr = 1;
>  
>          irq = entry->irq;
> -        desc = &irq_desc[irq];
> +        desc = &irq_descriptor[irq];
>  
>          spin_lock_irqsave(&desc->lock, flags);
>  
> @@ -1377,7 +1377,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>                  break;
>  
>              spin_unlock_irqrestore(&desc->lock, flags);
> -            desc = &irq_desc[entry[++i].irq];
> +            desc = &irq_descriptor[entry[++i].irq];
>              spin_lock_irqsave(&desc->lock, flags);
>              if ( desc->msi_desc != entry + i )
>                  goto bogus;
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index 9747e818f7..56a3aa6a29 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -107,7 +107,7 @@ typedef struct irq_desc {
>  } __cacheline_aligned irq_desc_t;
>  
>  #ifndef irq_to_desc
> -#define irq_to_desc(irq)    (&irq_desc[irq])
> +#define irq_to_desc(irq)    (&irq_descriptor[irq])
>  #endif
>  
>  int init_one_irq_desc(struct irq_desc *desc);
> -- 
> 2.34.1
> 

