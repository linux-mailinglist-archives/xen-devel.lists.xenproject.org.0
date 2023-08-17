Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31A780178
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 01:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585665.916841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWm2D-0001ia-9Y; Thu, 17 Aug 2023 23:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585665.916841; Thu, 17 Aug 2023 23:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWm2D-0001fZ-6n; Thu, 17 Aug 2023 23:04:09 +0000
Received: by outflank-mailman (input) for mailman id 585665;
 Thu, 17 Aug 2023 23:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWm2B-0001fT-IN
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 23:04:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c4dee9c-3d52-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 01:04:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7120660C95;
 Thu, 17 Aug 2023 23:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06725C433C7;
 Thu, 17 Aug 2023 23:04:01 +0000 (UTC)
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
X-Inumbo-ID: 5c4dee9c-3d52-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692313442;
	bh=BfAtrLRPI9bnMbVk3PP4P8Y3JuLz7CUHhnAKOw5MvSM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bwp9w5twV+Ziy0WXorX+uFFMwT6DYOY+asL5lJoDUnBlgelrw7+Bj4VHO0e2lp/P8
	 mpJ6P7j2FXd9FRtyQdfnEBtaUkuloZjBwhME74qhfpjvS9ZyFpJItLxAXsn/vZqWHM
	 HuBmd+NDgBxF3XTRHPyna/4+TkpS37Xq6BDN9FYHTklZK3tfq5A7HI1jlfwK6AqVPt
	 nsitpzoJKTekzIBiUxLs+RrssmsXXdw/HZB09UYz9f2dUib3qHHnSY6u33t4FPG8v6
	 aHGlVTe9M+enLSPhX4qTFY3jyUy9cvp09xVj5UmUNpUGHhY4881ei2pbu439EOJKyC
	 uopVNf2ASDm9Q==
Date: Thu, 17 Aug 2023 16:04:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/3] xen/arm: vgic: Use 'unsigned int' rather than 'int'
 whenever it is possible
In-Reply-To: <20230817214356.47174-3-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308171602450.6458@ubuntu-linux-20-04-desktop>
References: <20230817214356.47174-1-julien@xen.org> <20230817214356.47174-3-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Aug 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Switch to unsigned int for the return/parameters of the following
> functions:
>     * REG_RANK_NR(): 'b' (number of bits) and the return is always positive.
>       'n' doesn't need to be size specific.
>     * vgic_rank_offset(): 'b' (number of bits), 'n' (register index),
>       's' (size of the access) are always positive.
>     * vgic_{enable, disable}_irqs(): 'n' (rank index) is always positive
>     * vgic_get_virq_type(): 'n' (rank index) and 'index' (register
>       index) are always positive.
> 
> Take the opportunity to propogate the unsignedness to the local
> variable used for the arguments.
> 
> This will remove some of the warning reported by GCC 12.2.1 when
> passing the flags -Wsign-conversion/-Wconversion.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/include/asm/vgic.h | 11 +++++++----
>  xen/arch/arm/vgic-v2.c          | 12 ++++++++++--
>  xen/arch/arm/vgic.c             | 21 ++++++++++++---------
>  3 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 6901a05c0669..922779ce146a 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -252,7 +252,7 @@ struct vgic_ops {
>   * Rank containing GICD_<FOO><n> for GICD_<FOO> with
>   * <b>-bits-per-interrupt
>   */
> -static inline int REG_RANK_NR(int b, uint32_t n)
> +static inline unsigned int REG_RANK_NR(unsigned int b, unsigned int n)
>  {
>      switch ( b )
>      {
> @@ -297,10 +297,13 @@ extern void gic_remove_from_lr_pending(struct vcpu *v, struct pending_irq *p);
>  extern void vgic_init_pending_irq(struct pending_irq *p, unsigned int virq);
>  extern struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq);
>  extern struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq);
> -extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n, int s);
> +extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,
> +                                              unsigned int b,
> +                                              unsigned int n,
> +                                              unsigned int s);
>  extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
> -extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
> -extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
> +extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
> +extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
>  extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
>                                    unsigned int rank);
>  extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 2a2eda2e6f4c..0aa10fff0f10 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -161,7 +161,11 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>  {
>      struct hsr_dabt dabt = info->dabt;
>      struct vgic_irq_rank *rank;
> -    int gicd_reg = (int)(info->gpa - v->domain->arch.vgic.dbase);
> +    /*
> +     * gpa/dbase are paddr_t which size may be higher than 32-bit. Yet
> +     * the difference will always be smaller than 32-bit.
> +     */
> +    unsigned int gicd_reg = info->gpa - v->domain->arch.vgic.dbase;
>      unsigned long flags;
>  
>      perfc_incr(vgicd_reads);
> @@ -403,7 +407,11 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>  {
>      struct hsr_dabt dabt = info->dabt;
>      struct vgic_irq_rank *rank;
> -    int gicd_reg = (int)(info->gpa - v->domain->arch.vgic.dbase);
> +    /*
> +     * gpa/dbase are paddr_t which size may be higher than 32-bit. Yet
> +     * the difference will always be smaller than 32-bit.
> +     */
> +    unsigned int gicd_reg = info->gpa - v->domain->arch.vgic.dbase;
>      uint32_t tr;
>      unsigned long flags;
>  
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index afcac791fe4b..269b804974e0 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -24,7 +24,8 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
>  
> -static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v, int rank)
> +static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
> +                                                  unsigned int rank)
>  {
>      if ( rank == 0 )
>          return v->arch.vgic.private_irqs;
> @@ -38,17 +39,17 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v, int rank)
>   * Returns rank corresponding to a GICD_<FOO><n> register for
>   * GICD_<FOO> with <b>-bits-per-interrupt.
>   */
> -struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n,
> -                                              int s)
> +struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, unsigned int b,
> +                                       unsigned int n, unsigned int s)
>  {
> -    int rank = REG_RANK_NR(b, (n >> s));
> +    unsigned int rank = REG_RANK_NR(b, (n >> s));
>  
>      return vgic_get_rank(v, rank);
>  }
>  
>  struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq)
>  {
> -    int rank = irq/32;
> +    unsigned int rank = irq / 32;
>  
>      return vgic_get_rank(v, rank);
>  }
> @@ -324,14 +325,14 @@ void arch_move_irqs(struct vcpu *v)
>      }
>  }
>  
> -void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
> +void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
>  {
>      const unsigned long mask = r;
>      struct pending_irq *p;
>      struct irq_desc *desc;
>      unsigned int irq;
>      unsigned long flags;
> -    int i = 0;
> +    unsigned int i = 0;
>      struct vcpu *v_target;
>  
>      /* LPIs will never be disabled via this function. */
> @@ -361,7 +362,9 @@ void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
>  #define VGIC_ICFG_MASK(intr) (1U << ((2 * ((intr) % 16)) + 1))
>  
>  /* The function should be called with the rank lock taken */
> -static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
> +static inline unsigned int vgic_get_virq_type(struct vcpu *v,
> +                                              unsigned int n,
> +                                              unsigned int index)
>  {
>      struct vgic_irq_rank *r = vgic_get_rank(v, n);
>      uint32_t tr = r->icfg[index >> 4];
> @@ -374,7 +377,7 @@ static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
>          return IRQ_TYPE_LEVEL_HIGH;
>  }
>  
> -void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n)
> +void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
>  {
>      const unsigned long mask = r;
>      struct pending_irq *p;

It looks like you could also switch 'i' to unsigned int in
vgic_enable_irqs like you did in vgic_disable_irqs

You could do that on commit:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

