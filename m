Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F87236666A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 09:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114135.217386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ7bY-0006Ib-Dv; Wed, 21 Apr 2021 07:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114135.217386; Wed, 21 Apr 2021 07:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ7bY-0006IC-Ax; Wed, 21 Apr 2021 07:49:00 +0000
Received: by outflank-mailman (input) for mailman id 114135;
 Wed, 21 Apr 2021 07:48:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IQv=JS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lZ7bW-0006I6-Pk
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 07:48:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cde2ad99-4129-4a23-99ae-fc0a6795c4ac;
 Wed, 21 Apr 2021 07:48:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D48611B3;
 Wed, 21 Apr 2021 00:48:56 -0700 (PDT)
Received: from [10.57.28.119] (unknown [10.57.28.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18F1D3F73B;
 Wed, 21 Apr 2021 00:48:54 -0700 (PDT)
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
X-Inumbo-ID: cde2ad99-4129-4a23-99ae-fc0a6795c4ac
Subject: Re: [PATCH 3/9] arm/gic: Get rid of READ/WRITE_SYSREG32
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-4-michal.orzel@arm.com>
 <1a087bed-94e5-bada-76c4-92e0c429cce6@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <fd5924c5-685d-a9fc-1116-c1b8909c9aea@arm.com>
Date: Wed, 21 Apr 2021 09:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1a087bed-94e5-bada-76c4-92e0c429cce6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 20.04.2021 15:28, Julien Grall wrote:
> Hi Michal,
> 
> On 20/04/2021 08:08, Michal Orzel wrote:
>> AArch64 system registers are 64bit whereas AArch32 ones
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 sysregs have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
>>
>> Modify types of following members of struct gic_v3 to register_t:
>> -hcr(not used at all in Xen)
> 
> It looks like we never used it (even in the patch introducing it). So I would suggest to remove it in a patch before this one.
>
Ok. In v2 I will add a patch before this one removing hcr from gic_v3.
>> -vmcr
>> -sre_el1
>> -apr0
>> -apr1
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/gic-v3-lpi.c |  2 +-
>>   xen/arch/arm/gic-v3.c     | 96 ++++++++++++++++++++-------------------
>>   xen/include/asm-arm/gic.h |  6 +--
>>   3 files changed, 54 insertions(+), 50 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>> index 869bc97fa1..e1594dd20e 100644
>> --- a/xen/arch/arm/gic-v3-lpi.c
>> +++ b/xen/arch/arm/gic-v3-lpi.c
>> @@ -178,7 +178,7 @@ void gicv3_do_LPI(unsigned int lpi)
>>       irq_enter();
>>         /* EOI the LPI already. */
>> -    WRITE_SYSREG32(lpi, ICC_EOIR1_EL1);
>> +    WRITE_SYSREG(lpi, ICC_EOIR1_EL1);
>>         /* Find out if a guest mapped something to this physical LPI. */
>>       hlpip = gic_get_host_lpi(lpi);
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index ac28013c19..0634013a67 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -246,12 +246,12 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
>>    */
>>   static void gicv3_enable_sre(void)
>>   {
>> -    uint32_t val;
>> +    register_t val;
>>   -    val = READ_SYSREG32(ICC_SRE_EL2);
>> +    val = READ_SYSREG(ICC_SRE_EL2);
>>       val |= GICC_SRE_EL2_SRE;
>>   -    WRITE_SYSREG32(val, ICC_SRE_EL2);
>> +    WRITE_SYSREG(val, ICC_SRE_EL2);
>>       isb();
>>   }
>>   @@ -315,16 +315,16 @@ static void restore_aprn_regs(const union gic_state_data *d)
>>       switch ( gicv3.nr_priorities )
>>       {
>>       case 7:
>> -        WRITE_SYSREG32(d->v3.apr0[2], ICH_AP0R2_EL2);
>> -        WRITE_SYSREG32(d->v3.apr1[2], ICH_AP1R2_EL2);
>> +        WRITE_SYSREG(d->v3.apr0[2], ICH_AP0R2_EL2);
>> +        WRITE_SYSREG(d->v3.apr1[2], ICH_AP1R2_EL2);
>>           /* Fall through */
>>       case 6:
>> -        WRITE_SYSREG32(d->v3.apr0[1], ICH_AP0R1_EL2);
>> -        WRITE_SYSREG32(d->v3.apr1[1], ICH_AP1R1_EL2);
>> +        WRITE_SYSREG(d->v3.apr0[1], ICH_AP0R1_EL2);
>> +        WRITE_SYSREG(d->v3.apr1[1], ICH_AP1R1_EL2);
>>           /* Fall through */
>>       case 5:
>> -        WRITE_SYSREG32(d->v3.apr0[0], ICH_AP0R0_EL2);
>> -        WRITE_SYSREG32(d->v3.apr1[0], ICH_AP1R0_EL2);
>> +        WRITE_SYSREG(d->v3.apr0[0], ICH_AP0R0_EL2);
>> +        WRITE_SYSREG(d->v3.apr1[0], ICH_AP1R0_EL2);
>>           break;
>>       default:
>>           BUG();
>> @@ -338,16 +338,16 @@ static void save_aprn_regs(union gic_state_data *d)
>>       switch ( gicv3.nr_priorities )
>>       {
>>       case 7:
>> -        d->v3.apr0[2] = READ_SYSREG32(ICH_AP0R2_EL2);
>> -        d->v3.apr1[2] = READ_SYSREG32(ICH_AP1R2_EL2);
>> +        d->v3.apr0[2] = READ_SYSREG(ICH_AP0R2_EL2);
>> +        d->v3.apr1[2] = READ_SYSREG(ICH_AP1R2_EL2);
>>           /* Fall through */
>>       case 6:
>> -        d->v3.apr0[1] = READ_SYSREG32(ICH_AP0R1_EL2);
>> -        d->v3.apr1[1] = READ_SYSREG32(ICH_AP1R1_EL2);
>> +        d->v3.apr0[1] = READ_SYSREG(ICH_AP0R1_EL2);
>> +        d->v3.apr1[1] = READ_SYSREG(ICH_AP1R1_EL2);
>>           /* Fall through */
>>       case 5:
>> -        d->v3.apr0[0] = READ_SYSREG32(ICH_AP0R0_EL2);
>> -        d->v3.apr1[0] = READ_SYSREG32(ICH_AP1R0_EL2);
>> +        d->v3.apr0[0] = READ_SYSREG(ICH_AP0R0_EL2);
>> +        d->v3.apr1[0] = READ_SYSREG(ICH_AP1R0_EL2);
>>           break;
>>       default:
>>           BUG();
>> @@ -371,15 +371,15 @@ static void gicv3_save_state(struct vcpu *v)
>>       dsb(sy);
>>       gicv3_save_lrs(v);
>>       save_aprn_regs(&v->arch.gic);
>> -    v->arch.gic.v3.vmcr = READ_SYSREG32(ICH_VMCR_EL2);
>> -    v->arch.gic.v3.sre_el1 = READ_SYSREG32(ICC_SRE_EL1);
>> +    v->arch.gic.v3.vmcr = READ_SYSREG(ICH_VMCR_EL2);
>> +    v->arch.gic.v3.sre_el1 = READ_SYSREG(ICC_SRE_EL1);
>>   }
>>     static void gicv3_restore_state(const struct vcpu *v)
>>   {
>> -    uint32_t val;
>> +    register_t val;
>>   -    val = READ_SYSREG32(ICC_SRE_EL2);
>> +    val = READ_SYSREG(ICC_SRE_EL2);
>>       /*
>>        * Don't give access to system registers when the guest is using
>>        * GICv2
>> @@ -388,7 +388,7 @@ static void gicv3_restore_state(const struct vcpu *v)
>>           val &= ~GICC_SRE_EL2_ENEL1;
>>       else
>>           val |= GICC_SRE_EL2_ENEL1;
>> -    WRITE_SYSREG32(val, ICC_SRE_EL2);
>> +    WRITE_SYSREG(val, ICC_SRE_EL2);
>>         /*
>>        * VFIQEn is RES1 if ICC_SRE_EL1.SRE is 1. This causes a Group0
>> @@ -398,9 +398,9 @@ static void gicv3_restore_state(const struct vcpu *v)
>>        * want before starting to mess with the rest of the GIC, and
>>        * VMCR_EL1 in particular.
>>        */
>> -    WRITE_SYSREG32(v->arch.gic.v3.sre_el1, ICC_SRE_EL1);
>> +    WRITE_SYSREG(v->arch.gic.v3.sre_el1, ICC_SRE_EL1);
>>       isb();
>> -    WRITE_SYSREG32(v->arch.gic.v3.vmcr, ICH_VMCR_EL2);
>> +    WRITE_SYSREG(v->arch.gic.v3.vmcr, ICH_VMCR_EL2);
>>       restore_aprn_regs(&v->arch.gic);
>>       gicv3_restore_lrs(v);
>>   @@ -468,24 +468,25 @@ static void gicv3_mask_irq(struct irq_desc *irqd)
>>   static void gicv3_eoi_irq(struct irq_desc *irqd)
>>   {
>>       /* Lower the priority */
>> -    WRITE_SYSREG32(irqd->irq, ICC_EOIR1_EL1);
>> +    WRITE_SYSREG(irqd->irq, ICC_EOIR1_EL1);
>>       isb();
>>   }
>>     static void gicv3_dir_irq(struct irq_desc *irqd)
>>   {
>>       /* Deactivate */
>> -    WRITE_SYSREG32(irqd->irq, ICC_DIR_EL1);
>> +    WRITE_SYSREG(irqd->irq, ICC_DIR_EL1);
>>       isb();
>>   }
>>     static unsigned int gicv3_read_irq(void)
>>   {
>> -    unsigned int irq = READ_SYSREG32(ICC_IAR1_EL1);
>> +    register_t irq = READ_SYSREG(ICC_IAR1_EL1);
>>         dsb(sy);
>>   -    return irq;
>> +    /* Number of IRQs do not exceed 32bit. */
> 
> If we want to be pedantic, the IRQs are encoded using 23-bit. So maybe we want to mask them below.
> 
>> +    return (unsigned int)irq;
> 
> NIT: We tend to avoid explicit cast unless they are strictly necessary because they can be more harmful than implicit cast (the compiler may not cast every conversion). So I would drop it and just keep the comment.
> 
Ok. I will do:
return (irq & 0xffffff);
>>   }
>>     /*
>> @@ -857,16 +858,16 @@ static int gicv3_cpu_init(void)
>>       gicv3_enable_sre();
>>         /* No priority grouping */
>> -    WRITE_SYSREG32(0, ICC_BPR1_EL1);
>> +    WRITE_SYSREG(0, ICC_BPR1_EL1);
>>         /* Set priority mask register */
>> -    WRITE_SYSREG32(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
>> +    WRITE_SYSREG(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
>>         /* EOI drops priority, DIR deactivates the interrupt (mode 1) */
>> -    WRITE_SYSREG32(GICC_CTLR_EL1_EOImode_drop, ICC_CTLR_EL1);
>> +    WRITE_SYSREG(GICC_CTLR_EL1_EOImode_drop, ICC_CTLR_EL1);
>>         /* Enable Group1 interrupts */
>> -    WRITE_SYSREG32(1, ICC_IGRPEN1_EL1);
>> +    WRITE_SYSREG(1, ICC_IGRPEN1_EL1);
>>         /* Sync at once at the end of cpu interface configuration */
>>       isb();
>> @@ -876,15 +877,15 @@ static int gicv3_cpu_init(void)
>>     static void gicv3_cpu_disable(void)
>>   {
>> -    WRITE_SYSREG32(0, ICC_CTLR_EL1);
>> +    WRITE_SYSREG(0, ICC_CTLR_EL1);
>>       isb();
>>   }
>>     static void gicv3_hyp_init(void)
>>   {
>> -    uint32_t vtr;
>> +    register_t vtr;
>>   -    vtr = READ_SYSREG32(ICH_VTR_EL2);
>> +    vtr = READ_SYSREG(ICH_VTR_EL2);
>>       gicv3_info.nr_lrs  = (vtr & ICH_VTR_NRLRGS) + 1;
>>       gicv3.nr_priorities = ((vtr >> ICH_VTR_PRIBITS_SHIFT) &
>>                             ICH_VTR_PRIBITS_MASK) + 1;
>> @@ -892,8 +893,8 @@ static void gicv3_hyp_init(void)
>>       if ( !((gicv3.nr_priorities > 4) && (gicv3.nr_priorities < 8)) )
>>           panic("GICv3: Invalid number of priority bits\n");
>>   -    WRITE_SYSREG32(ICH_VMCR_EOI | ICH_VMCR_VENG1, ICH_VMCR_EL2);
>> -    WRITE_SYSREG32(GICH_HCR_EN, ICH_HCR_EL2);
>> +    WRITE_SYSREG(ICH_VMCR_EOI | ICH_VMCR_VENG1, ICH_VMCR_EL2);
>> +    WRITE_SYSREG(GICH_HCR_EN, ICH_HCR_EL2);
>>   }
>>     /* Set up the per-CPU parts of the GIC for a secondary CPU */
>> @@ -917,11 +918,11 @@ out:
>>     static void gicv3_hyp_disable(void)
>>   {
>> -    uint32_t hcr;
>> +    register_t hcr;
>>   -    hcr = READ_SYSREG32(ICH_HCR_EL2);
>> +    hcr = READ_SYSREG(ICH_HCR_EL2);
>>       hcr &= ~GICH_HCR_EN;
>> -    WRITE_SYSREG32(hcr, ICH_HCR_EL2);
>> +    WRITE_SYSREG(hcr, ICH_HCR_EL2);
>>       isb();
>>   }
>>   @@ -1140,39 +1141,42 @@ static void gicv3_write_lr(int lr_reg, const struct gic_lr *lr)
>>     static void gicv3_hcr_status(uint32_t flag, bool status)
>>   {
>> -    uint32_t hcr;
>> +    register_t hcr;
>>   -    hcr = READ_SYSREG32(ICH_HCR_EL2);
>> +    hcr = READ_SYSREG(ICH_HCR_EL2);
>>       if ( status )
>> -        WRITE_SYSREG32(hcr | flag, ICH_HCR_EL2);
>> +        WRITE_SYSREG(hcr | flag, ICH_HCR_EL2);
>>       else
>> -        WRITE_SYSREG32(hcr & (~flag), ICH_HCR_EL2);
>> +        WRITE_SYSREG(hcr & (~flag), ICH_HCR_EL2);
>>       isb();
>>   }
>>     static unsigned int gicv3_read_vmcr_priority(void)
>>   {
>> -   return ((READ_SYSREG32(ICH_VMCR_EL2) >> ICH_VMCR_PRIORITY_SHIFT) &
>> +   return ((READ_SYSREG(ICH_VMCR_EL2) >> ICH_VMCR_PRIORITY_SHIFT) &
>>               ICH_VMCR_PRIORITY_MASK);
>>   }
>>     /* Only support reading GRP1 APRn registers */
>>   static unsigned int gicv3_read_apr(int apr_reg)
>>   {
>> +    register_t apr;
> 
> NIT: Please add a newline after the declaration. This will be easier to read.
> 
Ok.
>>       switch ( apr_reg )
>>       {
>>       case 0:
>>           ASSERT(gicv3.nr_priorities > 4 && gicv3.nr_priorities < 8);
>> -        return READ_SYSREG32(ICH_AP1R0_EL2);
>> +        apr = READ_SYSREG(ICH_AP1R0_EL2);
>>       case 1:
>>           ASSERT(gicv3.nr_priorities > 5 && gicv3.nr_priorities < 8);
>> -        return READ_SYSREG32(ICH_AP1R1_EL2);
>> +        apr = READ_SYSREG(ICH_AP1R1_EL2);
>>       case 2:
>>           ASSERT(gicv3.nr_priorities > 6 && gicv3.nr_priorities < 8);
>> -        return READ_SYSREG32(ICH_AP1R2_EL2);
>> +        apr = READ_SYSREG(ICH_AP1R2_EL2);
>>       default:
>>           BUG();
>>       }
> 
> NIT: Please add a newline here. This will be easier to read.
> 
Ok.
>> +    /* Number of priority levels do not exceed 32bit */
>> +    return (unsigned int)apr;
> 
> NIT: Same remark as before for the cast.
> 
Ok. I will do just:
return apr;
>>   }
>>     static bool gicv3_read_pending_state(struct irq_desc *irqd)
>> diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
>> index ad0f7452d0..d750d070b4 100644
>> --- a/xen/include/asm-arm/gic.h
>> +++ b/xen/include/asm-arm/gic.h
>> @@ -171,9 +171,9 @@
>>    * GICv3 registers that needs to be saved/restored
>>    */
>>   struct gic_v3 {
>> -    uint32_t hcr, vmcr, sre_el1;
>> -    uint32_t apr0[4];
>> -    uint32_t apr1[4];
>> +    register_t hcr, vmcr, sre_el1;
>> +    register_t apr0[4];
>> +    register_t apr1[4];
>>       uint64_t lr[16];
>>   };
>>   #endif
>>
> 
> Cheers,
> 

Cheers

