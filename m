Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E800054BEBE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 02:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349492.575596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Gxr-0006D5-2K; Wed, 15 Jun 2022 00:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349492.575596; Wed, 15 Jun 2022 00:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Gxq-00069d-Vn; Wed, 15 Jun 2022 00:32:54 +0000
Received: by outflank-mailman (input) for mailman id 349492;
 Wed, 15 Jun 2022 00:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1Gxp-00069X-EL
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 00:32:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0fb83a9-ec42-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 02:32:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93D45B815A3;
 Wed, 15 Jun 2022 00:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA71FC3411B;
 Wed, 15 Jun 2022 00:32:49 +0000 (UTC)
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
X-Inumbo-ID: b0fb83a9-ec42-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655253170;
	bh=jfdbZ95q8z+IJK2N0Pr3tzIbKDlLFpMLlKv5d86pQ4Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=davfAyTQKUHdsG0hLEN3j+86P7klCtdDQDsjK0Bht7DCQ2SslHH5985Ep3crdpzc+
	 GDIAnrEqxpsZZwJOF9HJcuUGCGIsS/E4tbQxhtCz6oEf86pwWkm3oaikFCVxK4MHkL
	 g/hWZ7kh9JKB8ogdDbPoeG8uFncngYC/waRfiKKs6RBspZwa0/C0mKSWFmpirSuVV/
	 VbnW3XMe+uNYIrS+BcyBgGlVKjo6XYxj7U4lT5F646Q1WXOE8eqdFmagexlIwT5Slm
	 SB3WkTBKB/H1WpCoS4+6xGwUF/NSKIjzoniEDzrg1taCrvU7KfvphGAdam/30vMI9y
	 5FSYnQ45grAzQ==
Date: Tue, 14 Jun 2022 17:32:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
In-Reply-To: <20220614094157.95631-1-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206141731320.1837490@ubuntu-linux-20-04-desktop>
References: <20220614094157.95631-1-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jun 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
> xmalloc()" extended the checks in _xmalloc() to catch any use of the
> helpers from context with interrupts disabled.
> 
> Unfortunately, the rule is not followed when initializing the per-CPU
> IRQs:
> 
> (XEN) Xen call trace:
> (XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
> (XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
> (XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
> (XEN)    [<00288fa4>] start_secondary+0x194/0x274
> (XEN)    [<40010170>] 40010170
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:601
> (XEN) ****************************************
> 
> This is happening because zalloc_cpumask_var() may allocate memory
> if NR_CPUS is > 2 * sizeof(unsigned long).
> 
> Avoid the problem by allocate the per-CPU IRQs while preparing the
> CPU.
> 
> This also has the benefit to remove a BUG_ON() in the secondary CPU
> code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/include/asm/irq.h |  1 -
>  xen/arch/arm/irq.c             | 35 +++++++++++++++++++++++++++-------
>  xen/arch/arm/smpboot.c         |  2 --
>  3 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index e45d57459899..245f49dcbac5 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -73,7 +73,6 @@ static inline bool is_lpi(unsigned int irq)
>  bool is_assignable_irq(unsigned int irq);
>  
>  void init_IRQ(void);
> -void init_secondary_IRQ(void);
>  
>  int route_irq_to_guest(struct domain *d, unsigned int virq,
>                         unsigned int irq, const char *devname);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b761d90c4063..56bdcb95335d 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -17,6 +17,7 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <xen/cpu.h>
>  #include <xen/lib.h>
>  #include <xen/spinlock.h>
>  #include <xen/irq.h>
> @@ -100,7 +101,7 @@ static int __init init_irq_data(void)
>      return 0;
>  }
>  
> -static int init_local_irq_data(void)
> +static int init_local_irq_data(unsigned int cpu)
>  {
>      int irq;
>  
> @@ -108,7 +109,7 @@ static int init_local_irq_data(void)
>  
>      for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
>      {
> -        struct irq_desc *desc = irq_to_desc(irq);
> +        struct irq_desc *desc = &per_cpu(local_irq_desc, cpu)[irq];
>          int rc = init_one_irq_desc(desc);
>  
>          if ( rc )
> @@ -131,6 +132,29 @@ static int init_local_irq_data(void)
>      return 0;
>  }
>  
> +static int cpu_callback(struct notifier_block *nfb, unsigned long action,
> +                        void *hcpu)
> +{
> +    unsigned long cpu = (unsigned long)hcpu;

unsigned int cpu ?

The rest looks good


> +    int rc = 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_UP_PREPARE:
> +        rc = init_local_irq_data(cpu);
> +        if ( rc )
> +            printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%lu\n",
> +                   cpu);
> +        break;
> +    }
> +
> +    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
> +}
> +
> +static struct notifier_block cpu_nfb = {
> +    .notifier_call = cpu_callback,
> +};
> +
>  void __init init_IRQ(void)
>  {
>      int irq;
> @@ -140,13 +164,10 @@ void __init init_IRQ(void)
>          local_irqs_type[irq] = IRQ_TYPE_INVALID;
>      spin_unlock(&local_irqs_type_lock);
>  
> -    BUG_ON(init_local_irq_data() < 0);
> +    BUG_ON(init_local_irq_data(smp_processor_id()) < 0);
>      BUG_ON(init_irq_data() < 0);
> -}
>  
> -void init_secondary_IRQ(void)
> -{
> -    BUG_ON(init_local_irq_data() < 0);
> +    register_cpu_notifier(&cpu_nfb);
>  }
>  
>  static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 9bb32a301a70..4888bcd78a5a 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -359,8 +359,6 @@ void start_secondary(void)
>  
>      gic_init_secondary_cpu();
>  
> -    init_secondary_IRQ();
> -
>      set_current(idle_vcpu[cpuid]);
>  
>      setup_cpu_sibling_map(cpuid);
> -- 
> 2.32.0
> 

