Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD54F365A1B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 15:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113676.216631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqQn-0004Vg-1Z; Tue, 20 Apr 2021 13:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113676.216631; Tue, 20 Apr 2021 13:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqQm-0004VH-UU; Tue, 20 Apr 2021 13:28:44 +0000
Received: by outflank-mailman (input) for mailman id 113676;
 Tue, 20 Apr 2021 13:28:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYqQl-0004VC-CP
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:28:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYqQk-0001dJ-39; Tue, 20 Apr 2021 13:28:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYqQj-0002KF-Mz; Tue, 20 Apr 2021 13:28:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=w+ED1bRBmaLTm6AhZzFwstCqZC5Lp+ipEI+V93GAsVg=; b=4E2h7YfUTWYuC/gpRS/Rnd7jlP
	IfFgQ60mncWMNplbTOQb1o6dMh8lyVxHPYahTY5iyPqn3jc63kzfHTyyVGaelpqW7o1GTLzffKEUV
	FeOZbmnWJOdDkrkwtGSg7zSzLuH8p53Vh6uIl8ovgc8kSLxBMLpjVTvXBR8ts3RgJuaU=;
Subject: Re: [PATCH 3/9] arm/gic: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-4-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1a087bed-94e5-bada-76c4-92e0c429cce6@xen.org>
Date: Tue, 20 Apr 2021 14:28:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420070853.8918-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/04/2021 08:08, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 sysregs have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify types of following members of struct gic_v3 to register_t:
> -hcr(not used at all in Xen)

It looks like we never used it (even in the patch introducing it). So I 
would suggest to remove it in a patch before this one.

> -vmcr
> -sre_el1
> -apr0
> -apr1
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/gic-v3-lpi.c |  2 +-
>   xen/arch/arm/gic-v3.c     | 96 ++++++++++++++++++++-------------------
>   xen/include/asm-arm/gic.h |  6 +--
>   3 files changed, 54 insertions(+), 50 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 869bc97fa1..e1594dd20e 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -178,7 +178,7 @@ void gicv3_do_LPI(unsigned int lpi)
>       irq_enter();
>   
>       /* EOI the LPI already. */
> -    WRITE_SYSREG32(lpi, ICC_EOIR1_EL1);
> +    WRITE_SYSREG(lpi, ICC_EOIR1_EL1);
>   
>       /* Find out if a guest mapped something to this physical LPI. */
>       hlpip = gic_get_host_lpi(lpi);
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index ac28013c19..0634013a67 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -246,12 +246,12 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
>    */
>   static void gicv3_enable_sre(void)
>   {
> -    uint32_t val;
> +    register_t val;
>   
> -    val = READ_SYSREG32(ICC_SRE_EL2);
> +    val = READ_SYSREG(ICC_SRE_EL2);
>       val |= GICC_SRE_EL2_SRE;
>   
> -    WRITE_SYSREG32(val, ICC_SRE_EL2);
> +    WRITE_SYSREG(val, ICC_SRE_EL2);
>       isb();
>   }
>   
> @@ -315,16 +315,16 @@ static void restore_aprn_regs(const union gic_state_data *d)
>       switch ( gicv3.nr_priorities )
>       {
>       case 7:
> -        WRITE_SYSREG32(d->v3.apr0[2], ICH_AP0R2_EL2);
> -        WRITE_SYSREG32(d->v3.apr1[2], ICH_AP1R2_EL2);
> +        WRITE_SYSREG(d->v3.apr0[2], ICH_AP0R2_EL2);
> +        WRITE_SYSREG(d->v3.apr1[2], ICH_AP1R2_EL2);
>           /* Fall through */
>       case 6:
> -        WRITE_SYSREG32(d->v3.apr0[1], ICH_AP0R1_EL2);
> -        WRITE_SYSREG32(d->v3.apr1[1], ICH_AP1R1_EL2);
> +        WRITE_SYSREG(d->v3.apr0[1], ICH_AP0R1_EL2);
> +        WRITE_SYSREG(d->v3.apr1[1], ICH_AP1R1_EL2);
>           /* Fall through */
>       case 5:
> -        WRITE_SYSREG32(d->v3.apr0[0], ICH_AP0R0_EL2);
> -        WRITE_SYSREG32(d->v3.apr1[0], ICH_AP1R0_EL2);
> +        WRITE_SYSREG(d->v3.apr0[0], ICH_AP0R0_EL2);
> +        WRITE_SYSREG(d->v3.apr1[0], ICH_AP1R0_EL2);
>           break;
>       default:
>           BUG();
> @@ -338,16 +338,16 @@ static void save_aprn_regs(union gic_state_data *d)
>       switch ( gicv3.nr_priorities )
>       {
>       case 7:
> -        d->v3.apr0[2] = READ_SYSREG32(ICH_AP0R2_EL2);
> -        d->v3.apr1[2] = READ_SYSREG32(ICH_AP1R2_EL2);
> +        d->v3.apr0[2] = READ_SYSREG(ICH_AP0R2_EL2);
> +        d->v3.apr1[2] = READ_SYSREG(ICH_AP1R2_EL2);
>           /* Fall through */
>       case 6:
> -        d->v3.apr0[1] = READ_SYSREG32(ICH_AP0R1_EL2);
> -        d->v3.apr1[1] = READ_SYSREG32(ICH_AP1R1_EL2);
> +        d->v3.apr0[1] = READ_SYSREG(ICH_AP0R1_EL2);
> +        d->v3.apr1[1] = READ_SYSREG(ICH_AP1R1_EL2);
>           /* Fall through */
>       case 5:
> -        d->v3.apr0[0] = READ_SYSREG32(ICH_AP0R0_EL2);
> -        d->v3.apr1[0] = READ_SYSREG32(ICH_AP1R0_EL2);
> +        d->v3.apr0[0] = READ_SYSREG(ICH_AP0R0_EL2);
> +        d->v3.apr1[0] = READ_SYSREG(ICH_AP1R0_EL2);
>           break;
>       default:
>           BUG();
> @@ -371,15 +371,15 @@ static void gicv3_save_state(struct vcpu *v)
>       dsb(sy);
>       gicv3_save_lrs(v);
>       save_aprn_regs(&v->arch.gic);
> -    v->arch.gic.v3.vmcr = READ_SYSREG32(ICH_VMCR_EL2);
> -    v->arch.gic.v3.sre_el1 = READ_SYSREG32(ICC_SRE_EL1);
> +    v->arch.gic.v3.vmcr = READ_SYSREG(ICH_VMCR_EL2);
> +    v->arch.gic.v3.sre_el1 = READ_SYSREG(ICC_SRE_EL1);
>   }
>   
>   static void gicv3_restore_state(const struct vcpu *v)
>   {
> -    uint32_t val;
> +    register_t val;
>   
> -    val = READ_SYSREG32(ICC_SRE_EL2);
> +    val = READ_SYSREG(ICC_SRE_EL2);
>       /*
>        * Don't give access to system registers when the guest is using
>        * GICv2
> @@ -388,7 +388,7 @@ static void gicv3_restore_state(const struct vcpu *v)
>           val &= ~GICC_SRE_EL2_ENEL1;
>       else
>           val |= GICC_SRE_EL2_ENEL1;
> -    WRITE_SYSREG32(val, ICC_SRE_EL2);
> +    WRITE_SYSREG(val, ICC_SRE_EL2);
>   
>       /*
>        * VFIQEn is RES1 if ICC_SRE_EL1.SRE is 1. This causes a Group0
> @@ -398,9 +398,9 @@ static void gicv3_restore_state(const struct vcpu *v)
>        * want before starting to mess with the rest of the GIC, and
>        * VMCR_EL1 in particular.
>        */
> -    WRITE_SYSREG32(v->arch.gic.v3.sre_el1, ICC_SRE_EL1);
> +    WRITE_SYSREG(v->arch.gic.v3.sre_el1, ICC_SRE_EL1);
>       isb();
> -    WRITE_SYSREG32(v->arch.gic.v3.vmcr, ICH_VMCR_EL2);
> +    WRITE_SYSREG(v->arch.gic.v3.vmcr, ICH_VMCR_EL2);
>       restore_aprn_regs(&v->arch.gic);
>       gicv3_restore_lrs(v);
>   
> @@ -468,24 +468,25 @@ static void gicv3_mask_irq(struct irq_desc *irqd)
>   static void gicv3_eoi_irq(struct irq_desc *irqd)
>   {
>       /* Lower the priority */
> -    WRITE_SYSREG32(irqd->irq, ICC_EOIR1_EL1);
> +    WRITE_SYSREG(irqd->irq, ICC_EOIR1_EL1);
>       isb();
>   }
>   
>   static void gicv3_dir_irq(struct irq_desc *irqd)
>   {
>       /* Deactivate */
> -    WRITE_SYSREG32(irqd->irq, ICC_DIR_EL1);
> +    WRITE_SYSREG(irqd->irq, ICC_DIR_EL1);
>       isb();
>   }
>   
>   static unsigned int gicv3_read_irq(void)
>   {
> -    unsigned int irq = READ_SYSREG32(ICC_IAR1_EL1);
> +    register_t irq = READ_SYSREG(ICC_IAR1_EL1);
>   
>       dsb(sy);
>   
> -    return irq;
> +    /* Number of IRQs do not exceed 32bit. */

If we want to be pedantic, the IRQs are encoded using 23-bit. So maybe 
we want to mask them below.

> +    return (unsigned int)irq;

NIT: We tend to avoid explicit cast unless they are strictly necessary 
because they can be more harmful than implicit cast (the compiler may 
not cast every conversion). So I would drop it and just keep the comment.

>   }
>   
>   /*
> @@ -857,16 +858,16 @@ static int gicv3_cpu_init(void)
>       gicv3_enable_sre();
>   
>       /* No priority grouping */
> -    WRITE_SYSREG32(0, ICC_BPR1_EL1);
> +    WRITE_SYSREG(0, ICC_BPR1_EL1);
>   
>       /* Set priority mask register */
> -    WRITE_SYSREG32(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
> +    WRITE_SYSREG(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
>   
>       /* EOI drops priority, DIR deactivates the interrupt (mode 1) */
> -    WRITE_SYSREG32(GICC_CTLR_EL1_EOImode_drop, ICC_CTLR_EL1);
> +    WRITE_SYSREG(GICC_CTLR_EL1_EOImode_drop, ICC_CTLR_EL1);
>   
>       /* Enable Group1 interrupts */
> -    WRITE_SYSREG32(1, ICC_IGRPEN1_EL1);
> +    WRITE_SYSREG(1, ICC_IGRPEN1_EL1);
>   
>       /* Sync at once at the end of cpu interface configuration */
>       isb();
> @@ -876,15 +877,15 @@ static int gicv3_cpu_init(void)
>   
>   static void gicv3_cpu_disable(void)
>   {
> -    WRITE_SYSREG32(0, ICC_CTLR_EL1);
> +    WRITE_SYSREG(0, ICC_CTLR_EL1);
>       isb();
>   }
>   
>   static void gicv3_hyp_init(void)
>   {
> -    uint32_t vtr;
> +    register_t vtr;
>   
> -    vtr = READ_SYSREG32(ICH_VTR_EL2);
> +    vtr = READ_SYSREG(ICH_VTR_EL2);
>       gicv3_info.nr_lrs  = (vtr & ICH_VTR_NRLRGS) + 1;
>       gicv3.nr_priorities = ((vtr >> ICH_VTR_PRIBITS_SHIFT) &
>                             ICH_VTR_PRIBITS_MASK) + 1;
> @@ -892,8 +893,8 @@ static void gicv3_hyp_init(void)
>       if ( !((gicv3.nr_priorities > 4) && (gicv3.nr_priorities < 8)) )
>           panic("GICv3: Invalid number of priority bits\n");
>   
> -    WRITE_SYSREG32(ICH_VMCR_EOI | ICH_VMCR_VENG1, ICH_VMCR_EL2);
> -    WRITE_SYSREG32(GICH_HCR_EN, ICH_HCR_EL2);
> +    WRITE_SYSREG(ICH_VMCR_EOI | ICH_VMCR_VENG1, ICH_VMCR_EL2);
> +    WRITE_SYSREG(GICH_HCR_EN, ICH_HCR_EL2);
>   }
>   
>   /* Set up the per-CPU parts of the GIC for a secondary CPU */
> @@ -917,11 +918,11 @@ out:
>   
>   static void gicv3_hyp_disable(void)
>   {
> -    uint32_t hcr;
> +    register_t hcr;
>   
> -    hcr = READ_SYSREG32(ICH_HCR_EL2);
> +    hcr = READ_SYSREG(ICH_HCR_EL2);
>       hcr &= ~GICH_HCR_EN;
> -    WRITE_SYSREG32(hcr, ICH_HCR_EL2);
> +    WRITE_SYSREG(hcr, ICH_HCR_EL2);
>       isb();
>   }
>   
> @@ -1140,39 +1141,42 @@ static void gicv3_write_lr(int lr_reg, const struct gic_lr *lr)
>   
>   static void gicv3_hcr_status(uint32_t flag, bool status)
>   {
> -    uint32_t hcr;
> +    register_t hcr;
>   
> -    hcr = READ_SYSREG32(ICH_HCR_EL2);
> +    hcr = READ_SYSREG(ICH_HCR_EL2);
>       if ( status )
> -        WRITE_SYSREG32(hcr | flag, ICH_HCR_EL2);
> +        WRITE_SYSREG(hcr | flag, ICH_HCR_EL2);
>       else
> -        WRITE_SYSREG32(hcr & (~flag), ICH_HCR_EL2);
> +        WRITE_SYSREG(hcr & (~flag), ICH_HCR_EL2);
>       isb();
>   }
>   
>   static unsigned int gicv3_read_vmcr_priority(void)
>   {
> -   return ((READ_SYSREG32(ICH_VMCR_EL2) >> ICH_VMCR_PRIORITY_SHIFT) &
> +   return ((READ_SYSREG(ICH_VMCR_EL2) >> ICH_VMCR_PRIORITY_SHIFT) &
>               ICH_VMCR_PRIORITY_MASK);
>   }
>   
>   /* Only support reading GRP1 APRn registers */
>   static unsigned int gicv3_read_apr(int apr_reg)
>   {
> +    register_t apr;

NIT: Please add a newline after the declaration. This will be easier to 
read.

>       switch ( apr_reg )
>       {
>       case 0:
>           ASSERT(gicv3.nr_priorities > 4 && gicv3.nr_priorities < 8);
> -        return READ_SYSREG32(ICH_AP1R0_EL2);
> +        apr = READ_SYSREG(ICH_AP1R0_EL2);
>       case 1:
>           ASSERT(gicv3.nr_priorities > 5 && gicv3.nr_priorities < 8);
> -        return READ_SYSREG32(ICH_AP1R1_EL2);
> +        apr = READ_SYSREG(ICH_AP1R1_EL2);
>       case 2:
>           ASSERT(gicv3.nr_priorities > 6 && gicv3.nr_priorities < 8);
> -        return READ_SYSREG32(ICH_AP1R2_EL2);
> +        apr = READ_SYSREG(ICH_AP1R2_EL2);
>       default:
>           BUG();
>       }

NIT: Please add a newline here. This will be easier to read.

> +    /* Number of priority levels do not exceed 32bit */
> +    return (unsigned int)apr;

NIT: Same remark as before for the cast.

>   }
>   
>   static bool gicv3_read_pending_state(struct irq_desc *irqd)
> diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
> index ad0f7452d0..d750d070b4 100644
> --- a/xen/include/asm-arm/gic.h
> +++ b/xen/include/asm-arm/gic.h
> @@ -171,9 +171,9 @@
>    * GICv3 registers that needs to be saved/restored
>    */
>   struct gic_v3 {
> -    uint32_t hcr, vmcr, sre_el1;
> -    uint32_t apr0[4];
> -    uint32_t apr1[4];
> +    register_t hcr, vmcr, sre_el1;
> +    register_t apr0[4];
> +    register_t apr1[4];
>       uint64_t lr[16];
>   };
>   #endif
> 

Cheers,

-- 
Julien Grall

