Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAACB3C3AF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 22:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102123.1454876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5UC-0003J0-3w; Fri, 29 Aug 2025 20:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102123.1454876; Fri, 29 Aug 2025 20:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5UC-0003Gn-1G; Fri, 29 Aug 2025 20:14:12 +0000
Received: by outflank-mailman (input) for mailman id 1102123;
 Fri, 29 Aug 2025 20:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zkx=3J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1us5UA-0003Gd-If
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 20:14:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a339e0-8514-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 22:14:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C77C16014D;
 Fri, 29 Aug 2025 20:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38ABAC4CEF0;
 Fri, 29 Aug 2025 20:14:05 +0000 (UTC)
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
X-Inumbo-ID: b7a339e0-8514-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756498446;
	bh=BuV4PQWc/RHXgC+6cMENqAV2puul7Tw8f6DESSJOLME=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hUZBUM23VlvZoox903QVHKEDg5mgpHNEAaJ8BIbo/SNIgWMo+0KPg7UYw7ksE6mqa
	 +60JkXiMxcRhpazzLgBNbuE8O9BeBuYkTt/KXzpwOvfSikuC+auMHYCMBBq9PWMkue
	 UGfhDjkl16A+qfklnWhwsu4vDYsA71U40V5zyoPPrxYdcM6h/idlAgb9iYbZrw5lCe
	 de32zci830Az6Ki5uPASaRrJBB7n14s+0h4P3cO6NHzM2FZoC1uFbjUwbAE674I+FK
	 h8omc+T5rDiVNCk2ZTtSYWLEncEcpHc5LKDA3Fu4e+9+N+X9k+cwrKjBlom/XP1MQx
	 q8ZAV0h/bZQvA==
Date: Fri, 29 Aug 2025 13:14:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 05/15] emul/ns16x50: implement EIR/IIR registers
In-Reply-To: <20250828235409.2835815-6-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291306550.341243@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-6-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add interrupt enable register emulation (EIR) and interrupt identity reason

EIR->IER

> (IIR) register emulation to the I/O port handler.
> 
> Also add routines for asserting/deasserting the virtual ns16x50 interrupt
> line as a dependent on IIR code.
> 
> Poke ns16x50_irq_check() on every I/O register access because the emulator
> does not have clock emulation anyway (e.g. for baud rate emulation).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - new patch
> ---
>  xen/common/emul/vuart/ns16x50.c | 177 +++++++++++++++++++++++++++++++-
>  1 file changed, 176 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index f9f307a4ad24..20597cc36b35 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -85,9 +85,131 @@ struct vuart_ns16x50 {
>      spinlock_t lock;                    /* Protection */
>  };
>  
> +static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod == cons->in_cons;
> +}

there is no ring so far so I would not add ns16x50_fifo_rx_empty for now


>  static inline uint8_t cf_check ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
>  {
> -    return 0;
> +    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> +}
> +
> +static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
> +{
> +    return vdev->regs[UART_LSR] & UART_LSR_MASK;
> +}
> +
> +static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
> +{
> +    return !ns16x50_fifo_rx_empty(vdev);
> +}
> +
> +static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
> +{
> +    return vdev->regs[NS16X50_REGS_NUM + UART_IIR] & UART_IIR_THR;
> +}
> +
> +static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
> +{
> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
> +}
> +
> +/*
> + * Get the interrupt identity reason.
> + *
> + * IIR is re-calculated once called, because ns16x50 always reports high
> + * priority events first.
> + * regs[NS16X50_REGS_NUM + UART_IIR] is used to store THR reason only.
> + */
> +static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
> +{
> +    /*
> +     * Interrupt identity reasons by priority.
> +     * NB: high priority are at lower indexes below.
> +     */
> +    static const struct {
> +        bool (*check)(const struct vuart_ns16x50 *vdev);
> +        uint8_t ier;
> +        uint8_t iir;
> +    } iir_by_prio[] = {
> +        [0] = { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
> +        [1] = { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
> +        [2] = { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
> +        [3] = { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
> +    };
> +    const uint8_t *regs = vdev->regs;
> +    uint8_t iir = 0;
> +    unsigned int i;
> +
> +    /*
> +     * NB: every interaction w/ ns16x50 registers (except DLAB=1) goes
> +     * through that call.
> +     */
> +    ASSERT(spin_is_locked(&vdev->lock));
> +
> +    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> +    {
> +        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
> +             iir_by_prio[i].check(vdev) )
> +            break;
> +
> +    }
> +    if ( i == ARRAY_SIZE(iir_by_prio) )
> +        iir |= UART_IIR_NOINT;
> +    else
> +        iir |= iir_by_prio[i].iir;
> +
> +    if ( regs[UART_FCR] & UART_FCR_ENABLE )
> +        iir |= UART_IIR_FE;
> +
> +    return iir;
> +}
> +
> +static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
> +{
> +    struct domain *d = vdev->owner;
> +    const struct vuart_info *info = vdev->info;
> +    int vector;
> +
> +    if ( has_vpic(d) ) /* HVM */
> +        vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    ns16x50_debug(vdev, "IRQ#%d vector %d assert\n", info->irq, vector);
> +}
> +
> +static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
> +{
> +    struct domain *d = vdev->owner;
> +    const struct vuart_info *info = vdev->info;
> +
> +    if ( has_vpic(d) ) /* HVM */
> +        hvm_isa_irq_deassert(d, info->irq);
> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    ns16x50_debug(vdev, "IRQ#%d deassert\n", info->irq);
> +}
> +
> +/*
> + * Assert/deassert virtual ns16x50 interrupt line.
> + */
> +static void ns16x50_irq_check(const struct vuart_ns16x50 *vdev)
> +{
> +    uint8_t iir = ns16x50_iir_get(vdev);
> +    const struct vuart_info *info = vdev->info;
> +
> +    if ( iir & UART_IIR_NOINT )
> +        ns16x50_irq_assert(vdev);

It is a bit strange that if "NOINT" is set, we raise the interrupt


> +    else
> +        ns16x50_irq_deassert(vdev);
> +
> +    ns16x50_debug(vdev, "IRQ#%d IIR 0x%02x %s\n", info->irq, iir,
> +                  (iir & UART_IIR_NOINT) ? "deassert" : "assert");
>  }
>  
>  /*
> @@ -102,6 +224,29 @@ static int ns16x50_io_write8(
>  
>      if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
>          regs[NS16X50_REGS_NUM + reg] = val;
> +    else
> +    {
> +        switch ( reg )
> +        {
> +        case UART_IER:
> +            /*
> +             * NB: Make sure THR interrupt is re-triggered once guest OS
> +             * re-enabled ETHREI in EIR.

EIR->IER


> +             */
> +            if ( val & regs[UART_IER] & UART_IER_ETHREI )
> +                regs[NS16X50_REGS_NUM + UART_IIR] |= UART_IIR_THR;

I am confused by this. Shouldn't it be :

if ( (val & UART_IER_ETHREI) && !(regs[UART_IER] & UART_IER_ETHREI) )

Meaning set UART_IIR_THR if ETHREI goes 0->1 ?


> +            regs[UART_IER] = val & UART_IER_MASK;
> +
> +            break;
> +
> +        default:
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        ns16x50_irq_check(vdev);
> +    }
>  
>      return rc;
>  }
> @@ -164,6 +309,29 @@ static int ns16x50_io_read8(
>  
>      if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
>          val = regs[NS16X50_REGS_NUM + reg];
> +    else {
> +        switch ( reg )
> +        {
> +        case UART_IER:
> +            val = regs[UART_IER];
> +            break;
> +
> +        case UART_IIR: /* RO */
> +            val = ns16x50_iir_get(vdev);
> +
> +            /* NB: clear IIR scratch location */
> +            if ( val & UART_IIR_THR )
> +                regs[NS16X50_REGS_NUM + UART_IIR] &= ~UART_IIR_THR;

Maybe add an in-code comment why it is a good idea to clear THR here


> +
> +            break;
> +
> +        default:
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        ns16x50_irq_check(vdev);
> +    }
>  
>      *data = val;
>  
> @@ -314,8 +482,15 @@ static int ns16x50_init(void *arg)
>      vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
>      vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
>  
> +    /* ns16x50 shall assert UART_IIR_THR whenever transmitter is empty. */
> +    vdev->regs[NS16X50_REGS_NUM + UART_IIR] = UART_IIR_THR;
> +
>      register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
>  
> +    spin_lock(&vdev->lock);
> +    ns16x50_irq_check(vdev);
> +    spin_unlock(&vdev->lock);
> +
>      return 0;
>  }
>  
> -- 
> 2.51.0
> 

