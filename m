Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32036B46668
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 00:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112467.1460718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uueYu-0003ex-L3; Fri, 05 Sep 2025 22:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112467.1460718; Fri, 05 Sep 2025 22:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uueYu-0003dE-IU; Fri, 05 Sep 2025 22:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1112467;
 Fri, 05 Sep 2025 22:05:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uueYt-0003d8-CI
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 22:05:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uueYr-0088Xc-2Y;
 Fri, 05 Sep 2025 22:05:38 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uueYr-0000rO-2B;
 Fri, 05 Sep 2025 22:05:37 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=N9BhIsW6Yjq0ySvhS7rzG8xH0TH0/z3tG+y5P7+uCe4=; b=
	C4ww9JlrEtP+T/aaV38+n7wIPFjO970XbHCN7QxgDPAtSoG3TVl0GjH9mc/J/vv5X6RvMYp+5mGos
	ZlkjrWA6xwToAHVSzJvA1vsQ13kkvZyEip2Rs23qWQ5WWx0Qw2hZbk40Fi7K/glM7hTdR9nHATA8D
	3AsKGC6ScM9/Kb1M4=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 15:05:36 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 05/15] emul/ns16x50: implement EIR/IIR registers
Message-ID: <aLtesDrD+nM5jFXH@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-6-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291306550.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291306550.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 01:14:03PM -0700, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Add interrupt enable register emulation (EIR) and interrupt identity reason
> 
> EIR->IER

Whooops, thanks.

> 
> > (IIR) register emulation to the I/O port handler.
> > 
> > Also add routines for asserting/deasserting the virtual ns16x50 interrupt
> > line as a dependent on IIR code.
> > 
> > Poke ns16x50_irq_check() on every I/O register access because the emulator
> > does not have clock emulation anyway (e.g. for baud rate emulation).
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - new patch
> > ---
> >  xen/common/emul/vuart/ns16x50.c | 177 +++++++++++++++++++++++++++++++-
> >  1 file changed, 176 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index f9f307a4ad24..20597cc36b35 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -85,9 +85,131 @@ struct vuart_ns16x50 {
> >      spinlock_t lock;                    /* Protection */
> >  };
> >  
> > +static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
> > +{
> > +    const struct xencons_interface *cons = &vdev->cons;
> > +
> > +    return cons->in_prod == cons->in_cons;
> > +}
> 
> there is no ring so far so I would not add ns16x50_fifo_rx_empty for now

Ack.

> 
> 
> >  static inline uint8_t cf_check ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
> >  {
> > -    return 0;
> > +    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> > +}
> > +
> > +static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
> > +{
> > +    return vdev->regs[UART_LSR] & UART_LSR_MASK;
> > +}
> > +
> > +static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
> > +{
> > +    return !ns16x50_fifo_rx_empty(vdev);
> > +}
> > +
> > +static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
> > +{
> > +    return vdev->regs[NS16X50_REGS_NUM + UART_IIR] & UART_IIR_THR;
> > +}
> > +
> > +static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
> > +{
> > +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
> > +}
> > +
> > +/*
> > + * Get the interrupt identity reason.
> > + *
> > + * IIR is re-calculated once called, because ns16x50 always reports high
> > + * priority events first.
> > + * regs[NS16X50_REGS_NUM + UART_IIR] is used to store THR reason only.
> > + */
> > +static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
> > +{
> > +    /*
> > +     * Interrupt identity reasons by priority.
> > +     * NB: high priority are at lower indexes below.
> > +     */
> > +    static const struct {
> > +        bool (*check)(const struct vuart_ns16x50 *vdev);
> > +        uint8_t ier;
> > +        uint8_t iir;
> > +    } iir_by_prio[] = {
> > +        [0] = { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
> > +        [1] = { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
> > +        [2] = { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
> > +        [3] = { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
> > +    };
> > +    const uint8_t *regs = vdev->regs;
> > +    uint8_t iir = 0;
> > +    unsigned int i;
> > +
> > +    /*
> > +     * NB: every interaction w/ ns16x50 registers (except DLAB=1) goes
> > +     * through that call.
> > +     */
> > +    ASSERT(spin_is_locked(&vdev->lock));
> > +
> > +    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
> > +    {
> > +        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
> > +             iir_by_prio[i].check(vdev) )
> > +            break;
> > +
> > +    }
> > +    if ( i == ARRAY_SIZE(iir_by_prio) )
> > +        iir |= UART_IIR_NOINT;
> > +    else
> > +        iir |= iir_by_prio[i].iir;
> > +
> > +    if ( regs[UART_FCR] & UART_FCR_ENABLE )
> > +        iir |= UART_IIR_FE;
> > +
> > +    return iir;
> > +}
> > +
> > +static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
> > +{
> > +    struct domain *d = vdev->owner;
> > +    const struct vuart_info *info = vdev->info;
> > +    int vector;
> > +
> > +    if ( has_vpic(d) ) /* HVM */
> > +        vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
> > +    else
> > +        ASSERT_UNREACHABLE();
> > +
> > +    ns16x50_debug(vdev, "IRQ#%d vector %d assert\n", info->irq, vector);
> > +}
> > +
> > +static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
> > +{
> > +    struct domain *d = vdev->owner;
> > +    const struct vuart_info *info = vdev->info;
> > +
> > +    if ( has_vpic(d) ) /* HVM */
> > +        hvm_isa_irq_deassert(d, info->irq);
> > +    else
> > +        ASSERT_UNREACHABLE();
> > +
> > +    ns16x50_debug(vdev, "IRQ#%d deassert\n", info->irq);
> > +}
> > +
> > +/*
> > + * Assert/deassert virtual ns16x50 interrupt line.
> > + */
> > +static void ns16x50_irq_check(const struct vuart_ns16x50 *vdev)
> > +{
> > +    uint8_t iir = ns16x50_iir_get(vdev);
> > +    const struct vuart_info *info = vdev->info;
> > +
> > +    if ( iir & UART_IIR_NOINT )
> > +        ns16x50_irq_assert(vdev);
> 
> It is a bit strange that if "NOINT" is set, we raise the interrupt

Yes, that is wrong.
Thank you!

> 
> 
> > +    else
> > +        ns16x50_irq_deassert(vdev);
> > +
> > +    ns16x50_debug(vdev, "IRQ#%d IIR 0x%02x %s\n", info->irq, iir,
> > +                  (iir & UART_IIR_NOINT) ? "deassert" : "assert");
> >  }
> >  
> >  /*
> > @@ -102,6 +224,29 @@ static int ns16x50_io_write8(
> >  
> >      if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
> >          regs[NS16X50_REGS_NUM + reg] = val;
> > +    else
> > +    {
> > +        switch ( reg )
> > +        {
> > +        case UART_IER:
> > +            /*
> > +             * NB: Make sure THR interrupt is re-triggered once guest OS
> > +             * re-enabled ETHREI in EIR.
> 
> EIR->IER

Will fix.

> 
> 
> > +             */
> > +            if ( val & regs[UART_IER] & UART_IER_ETHREI )
> > +                regs[NS16X50_REGS_NUM + UART_IIR] |= UART_IIR_THR;
> 
> I am confused by this. Shouldn't it be :
> 
> if ( (val & UART_IER_ETHREI) && !(regs[UART_IER] & UART_IER_ETHREI) )
> 
> Meaning set UART_IIR_THR if ETHREI goes 0->1 ?

That is by design to re-toggle the UART_IIR_THR since there's no baud
rate emulation.

> 
> 
> > +            regs[UART_IER] = val & UART_IER_MASK;
> > +
> > +            break;
> > +
> > +        default:
> > +            rc = -EINVAL;
> > +            break;
> > +        }
> > +
> > +        ns16x50_irq_check(vdev);
> > +    }
> >  
> >      return rc;
> >  }
> > @@ -164,6 +309,29 @@ static int ns16x50_io_read8(
> >  
> >      if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
> >          val = regs[NS16X50_REGS_NUM + reg];
> > +    else {
> > +        switch ( reg )
> > +        {
> > +        case UART_IER:
> > +            val = regs[UART_IER];
> > +            break;
> > +
> > +        case UART_IIR: /* RO */
> > +            val = ns16x50_iir_get(vdev);
> > +
> > +            /* NB: clear IIR scratch location */
> > +            if ( val & UART_IIR_THR )
> > +                regs[NS16X50_REGS_NUM + UART_IIR] &= ~UART_IIR_THR;
> 
> Maybe add an in-code comment why it is a good idea to clear THR here

Will fix.

> 
> 
> > +
> > +            break;
> > +
> > +        default:
> > +            rc = -EINVAL;
> > +            break;
> > +        }
> > +
> > +        ns16x50_irq_check(vdev);
> > +    }
> >  
> >      *data = val;
> >  
> > @@ -314,8 +482,15 @@ static int ns16x50_init(void *arg)
> >      vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
> >      vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
> >  
> > +    /* ns16x50 shall assert UART_IIR_THR whenever transmitter is empty. */
> > +    vdev->regs[NS16X50_REGS_NUM + UART_IIR] = UART_IIR_THR;
> > +
> >      register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
> >  
> > +    spin_lock(&vdev->lock);
> > +    ns16x50_irq_check(vdev);
> > +    spin_unlock(&vdev->lock);
> > +
> >      return 0;
> >  }
> >  
> > -- 
> > 2.51.0
> > 

