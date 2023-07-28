Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDE7678D4
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 01:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571609.895903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPWdz-00084k-Iq; Fri, 28 Jul 2023 23:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571609.895903; Fri, 28 Jul 2023 23:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPWdz-00081p-GF; Fri, 28 Jul 2023 23:13:11 +0000
Received: by outflank-mailman (input) for mailman id 571609;
 Fri, 28 Jul 2023 23:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jbsw=DO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qPWdy-00081j-87
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 23:13:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f9eb993-2d9c-11ee-8613-37d641c3527e;
 Sat, 29 Jul 2023 01:13:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AE2962201;
 Fri, 28 Jul 2023 23:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2E3C433C8;
 Fri, 28 Jul 2023 23:13:04 +0000 (UTC)
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
X-Inumbo-ID: 4f9eb993-2d9c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690585985;
	bh=MGEgEeES9uVyGsG2fL5MOJ1TWGra4DkMJWJNqGc+lE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KyC90UNHe4narjH+3zv3bbcVogAgU2vj1Fnlu+1yr2DhaisPaZ42WOji9Q3VcroKS
	 ZBR1e6SGLwRChiz4VjaBPta5dHo6Hv5H1ZK4lVI1hX6KTkKS5YQY2FJkcTWxuGaL/m
	 CKKPRKOzQHl6qxEmRUMOFeNBE4hmG7fofbuuLizw3taNsxkOlWp/jEWeG/Amq09xYl
	 1yUNXNxWWPNaaPHxqjmcTOnFBJJdLQGQVsjzkXNfOISlMRBWUm+mwWFvpbRMss7nBK
	 EDlRCm3gCf0b3+Sd37rVl19TOUZpVEzOEon+JRioP/QDsB3/uVIYNd+32IKLZszWt6
	 O79rYzHHkElyw==
Date: Fri, 28 Jul 2023 16:13:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 2/2] x86/IRQ: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
In-Reply-To: <da6fc50b926e72b497db251ca640c60244db3632.1690544434.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307281611360.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690544434.git.federico.serafini@bugseng.com> <da6fc50b926e72b497db251ca640c60244db3632.1690544434.git.federico.serafini@bugseng.com>
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
> No functional changes
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Also one comment below



> ---
> Changes in v2:
>   - use 'pirq' instead of 'irq';
>   - removed changes involving function pointers.
> ---
>  xen/arch/x86/include/asm/irq.h | 30 +++++++++++++++---------------
>  xen/arch/x86/irq.c             |  4 ++--
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
> index 3f95dd39b7..ad907fc97f 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -107,12 +107,12 @@ void alloc_direct_apic_vector(
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
> @@ -142,15 +142,15 @@ struct arch_pirq {
>  #define pirq_dpci(pirq) ((pirq) ? &(pirq)->arch.hvm.dpci : NULL)
>  #define dpci_pirq(pd) container_of(pd, struct pirq, arch.hvm.dpci)
>  
> -int pirq_shared(struct domain *d , int irq);
> +int pirq_shared(struct domain *d , int pirq);
>  
>  int map_domain_pirq(struct domain *d, int pirq, int irq, int type,
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

I am OK with this but please remember to also fix
xen/arch/arm/irq.c:irq_set_affinity which still uses "cpu_mask"


> -int init_domain_irq_mapping(struct domain *);
> -void cleanup_domain_irq_mapping(struct domain *);
> +int init_domain_irq_mapping(struct domain *d);
> +void cleanup_domain_irq_mapping(struct domain *d);
>  
>  #define domain_pirq_to_irq(d, pirq) pirq_field(d, pirq, arch.irq, 0)
>  #define domain_irq_to_pirq(d, irq) ({                           \
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 20150b1c7f..6abfd81621 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
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
> -- 
> 2.34.1
> 
> 

