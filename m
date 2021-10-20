Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6C4351C0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 19:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214033.372447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFe2-0007z1-2L; Wed, 20 Oct 2021 17:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214033.372447; Wed, 20 Oct 2021 17:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdFe1-0007wT-UU; Wed, 20 Oct 2021 17:44:53 +0000
Received: by outflank-mailman (input) for mailman id 214033;
 Wed, 20 Oct 2021 17:44:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdFe0-0007wN-8D
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 17:44:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFe0-0002Xx-1Z; Wed, 20 Oct 2021 17:44:52 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdFdz-0006Vn-Ra; Wed, 20 Oct 2021 17:44:51 +0000
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
	bh=lnUufDzmqrfkpoDsqMN6bHxloRQxnwp/dc6IOvJTuG0=; b=0DlWUPe3HT+UweE0mnRDk2nklK
	V8XakiA47PywLhrpQGO89DcaeyfwUpgTy8NF22wOHkeSB2zrqdg213JZ8o+aXqIeCY+h5Zwrq8DIn
	UZFakI11g16NhKhXD/CAcgEJ79oz8XZ0QFkG51mTW0E/wZL6GLaA4+Wrh7GJOGLpWmAc=;
Message-ID: <f856653e-b8ea-c632-be6d-5dbb1b18c5f8@xen.org>
Date: Wed, 20 Oct 2021 18:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211020101021.9793-1-Hongda.Deng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211020101021.9793-1-Hongda.Deng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hongda,

Title: I would suggest the following title:

xen/arm: vgic: Ignore write access to ICPENDR*

On 20/10/2021 11:10, Hongda Deng wrote:
> Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> registers. This will raise a data abort inside guest. For Linux Guest,
> these virtual registers will not be accessed. But for Zephyr, in its
> GIC initialization code, these virtual registers will be accessed. And
> zephyr guest will get an IO data abort in initilization stage and enter
Typo: s/initilization/initialization/

I would also s/in/during the/

> fatal error. Emulating ICPENDR is not easy with the existing vGIC, so

How about s/enter fatal error/crash/?

> we currently ignore these virtual registers access and print a message

To me 'currently' refers to the existing code base (i.e. without your 
patch). In fact, this seems to be how you use 'currently' in the first 
paragraph. So how about replace "so we currently" with "rework the 
emulation to ignore...".

This seems to suggest the patch will modify both read and write access. 
However, AFAICT, only the write emulation is modified. Can this be 
clarified in the commit message?

> about whether they are already pending instead of returning unhandled.
> More details can be found at [1].
> 
> [1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
> cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274
> 
> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> ---
> Changes since v2:
>   *  Avoid to print messages when there is no pending interrupt
>   *  Add helper vgic_check_inflight_irqs_pending to check pending status
>   *  Print a message for each interrupt separately
> Changes since v1:
>   *  Check pending states by going through vcpu->arch.vgic.inflight_irqs
>      instead of checking hardware registers
> ---
>   xen/arch/arm/vgic-v2.c     | 10 ++++++----
>   xen/arch/arm/vgic-v3.c     | 16 ++++++++--------
>   xen/arch/arm/vgic.c        | 36 ++++++++++++++++++++++++++++++++++++
>   xen/include/asm-arm/vgic.h |  3 ++-
>   4 files changed, 52 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b2da886adc..7c30da327c 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -481,10 +481,12 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d\n",
> -               v, r, gicd_reg - GICD_ICPENDR);
> -        return 0;
> +        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r); > +
> +        goto write_ignore_32;

NIT: We already check the access above. So I would simply use 
"write_ignore" here.

>   
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index cb5a70c42e..4913301d22 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -817,10 +817,12 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>   
>       case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
> -               v, name, r, reg - GICD_ICPENDR);
> -        return 0;
> +        rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
> +        if ( rank == NULL ) goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
> +
> +        goto write_ignore_32;

NIT: Same remark as the previous write_ignore_32.

>   
>       case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> @@ -987,10 +989,8 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
>   
>       case VREG32(GICR_ICPENDR0):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ICPENDR0\n",
> -               v, r);
> -        return 0;
> +        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> +                                                 info, gicr_reg, r);
>   
>       case VREG32(GICR_IGRPMODR0):
>           /* We do not implement security extensions for guests, write ignore */
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 8f9400a519..0565557814 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -726,6 +726,42 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
>       }
>   }
>   
> +void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
> +                                      unsigned int rank, uint32_t r)
> +{
> +    const unsigned long mask = r;
> +    unsigned int i;
> +    unsigned long flags;
> +    struct pending_irq *p;
> +    bool private = rank == 0;
> +    struct vcpu *v_target;

AFAIC, flags, p, v_target are only used within the loop. So please 
reduce the scope and only declare them in for_each_set_bit().

> +
> +    for_each_set_bit( i, &mask, 32 )
> +    {
> +        unsigned int irq = i + 32 * rank;
> +
> +        if ( private )
> +            v_target = vgic_get_target_vcpu(v, irq);
> +        else
> +            v_target = vgic_get_target_vcpu(d->vcpu[0], irq);

Shared interrupts can be accessed from any vCPU. So you can replace the 
4 lines with:
    v_target = vgic_get_target_vcpu(v, irq);

> +
> +        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
> +
> +        p = irq_to_pending(v_target, irq);
> +
> +        if ( unlikely(!p) )
> +        {
> +            spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
> +            continue;
> +        }

irq_to_pending() cannot return NULL for non-LPI interrupts. But if you 
still want to check it, then the two if can be combined to something like:

if ( p && !list_empty(&p->inflight) )
   printk(...)

spin_unlock_irqrestore(...);

> +
> +        if ( !list_empty(&p->inflight) )
> +            printk("%pv trying to clear pending interrupt %u.\n", v, irq);

This wants to be a printk(XENLOG_G_WARNING ...) so the message will be 
appropriately rate-limited.

> +
> +        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
> +    }
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index 62c2ae538d..abcaae2969 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -298,7 +298,8 @@ extern bool vgic_to_sgi(struct vcpu *v, register_t sgir,
>                           enum gic_sgi_mode irqmode, int virq,
>                           const struct sgi_target *target);
>   extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq);
> -
> +extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
> +                                             unsigned int rank, uint32_t r);

Please keep the newline before the #endif.

>   #endif /* !CONFIG_NEW_VGIC */
>   
>   /*** Common VGIC functions used by Xen arch code ****/
> 

Cheers,

-- 
Julien Grall

