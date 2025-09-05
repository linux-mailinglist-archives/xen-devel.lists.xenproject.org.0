Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E97B4668A
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 00:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112495.1460729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuemv-0006NP-SF; Fri, 05 Sep 2025 22:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112495.1460729; Fri, 05 Sep 2025 22:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuemv-0006KF-Ox; Fri, 05 Sep 2025 22:20:09 +0000
Received: by outflank-mailman (input) for mailman id 1112495;
 Fri, 05 Sep 2025 22:20:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uuemu-0006K9-I5
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 22:20:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uuems-0088oN-2x;
 Fri, 05 Sep 2025 22:20:07 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uuems-0001bQ-2f;
 Fri, 05 Sep 2025 22:20:07 +0000
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
	:Subject:Cc:To:Date:From; bh=Xfe4sXcyxst4Wy7udHhaBB4jDIOWl5jiVyvbmgjRVLk=; b=
	NsRdYAeIeSQDHMwRMtx7bwYM6WTkPaqyk/MwJvW11IwhqaBP/60tZNIZn/1i8hqgpU1ZBIy+CtYHr
	EAXOh93XwWN9dIF6cZ/xNvoDdvcPAyxxRw/+6sMR+NroqlmTA4wQBBTLDnLdGuE98WNo163eJuK5M
	X2y37NzYREdnDM6TE=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 15:20:05 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 06/15] emul/ns16x50: implement THR/RBR registers
Message-ID: <aLtiFWKhicoCCYMB@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-7-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291320330.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291320330.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 01:28:41PM -0700, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Add RBR/THR registers emulation to the I/O port handlder.
> > 
> > Also, add RX/TX FIFO management code since RBR depends on RX FIFO and
> > THR depends on TX FIFO.
> > 
> > FIFOs are not emulated as per UART specs for simplicity (not need to emulate
> > baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
> > NS16750 (64 bytes).
> > 
> > FIFOs are emulated by means of using xencons_interface which conveniently
> > provides primitives for buffer management and later can be used for
> > inter-domain communication similarly to vpl011.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - new patch
> > ---
> >  xen/common/emul/vuart/ns16x50.c | 135 ++++++++++++++++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> > 
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index 20597cc36b35..efb2f4c6441c 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -92,6 +92,119 @@ static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
> >      return cons->in_prod == cons->in_cons;
> >  }
> >  
> > +static bool ns16x50_fifo_rx_full(const struct vuart_ns16x50 *vdev)
> > +{
> > +    const struct xencons_interface *cons = &vdev->cons;
> > +
> > +    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
> > +}
> > +
> > +static void ns16x50_fifo_rx_reset(struct vuart_ns16x50 *vdev)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +
> > +    cons->in_cons = cons->in_prod;
> > +}
> > +
> > +static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +    int rc;
> > +
> > +    if ( ns16x50_fifo_rx_empty(vdev) )
> > +    {
> > +        ns16x50_debug(vdev, "RX FIFO empty\n");
> > +        rc = -ENODATA;
> > +    }
> > +    else
> > +    {
> > +        rc = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
> > +        cons->in_cons++;
> > +    }
> > +
> > +    return rc;
> 
> The signed integer to char conversion here is not great from a MISRA
> perspective. I think it would be better to keep rc as success/failure
> return value and take the read char as a pointer parameter.

Ack.

> 
> 
> > +}
> > +
> > +static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +    int rc;
> > +
> > +    /*
> > +     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
> > +     * of the THR.
> > +     */
> > +    if ( ns16x50_fifo_rx_full(vdev) )
> > +    {
> > +        ns16x50_debug(vdev, "RX FIFO full; resetting\n");
> > +        ns16x50_fifo_rx_reset(vdev);
> > +        rc = -ENOSPC;
> > +    }
> > +    else
> > +        rc = 0;
> > +
> > +    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
> > +    cons->in_prod++;
> > +
> > +    return rc;
> > +}
> > +
> > +static bool ns16x50_fifo_tx_empty(const struct vuart_ns16x50 *vdev)
> > +{
> > +    const struct xencons_interface *cons = &vdev->cons;
> > +
> > +    return cons->out_prod == cons->out_cons;
> > +}
> > +
> > +static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +
> > +    cons->out_prod = 0;
> > +    ASSERT(cons->out_cons == cons->out_prod);
> 
> I am not sure about this.. why resetting the out_prod index? In theory
> it could keep increasing until wrap around and still go forward thanks
> to the mask

I used TX buffer not as a FIFO but as a large buffer for simplicity...

I have reworked that into a normal circular buffer in v6.

> 
> 
> > +}
> > +
> > +/*
> > + * Flush cached output to Xen console.
> > + */
> > +static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +    struct domain *d = vdev->owner;
> > +
> > +    if ( ns16x50_fifo_tx_empty(vdev) )
> > +        return;
> > +
> > + UART_IIR_THR   ASSERT(cons->out_prod < ARRAY_SIZE(cons->out));
> > +    cons->out[cons->out_prod] = '\0';
> 
> should use MASK_XENCONS_IDX to access the array

Ack.

> 
> 
> > +    cons->out_prod++;
> > +
> > +    guest_printk(d, guest_prefix "%s", cons->out);
> > +
> > +    ns16x50_fifo_tx_reset(vdev);
> 
> set UART_IIR_THR and call ns16x50_irq_check ?

I moved that to the I/O handler calling ns16x50_fifo_tx_flush() instead,
because ns16x50_fifo_tx_flush() can be called during vuart destroy,
and there's no need to emulate IRQs at domain destroy.

> 
> 
> > +}
> > +
> > +/*
> > + * Accumulate guest OS output before sending to Xen console.
> > + */
> > +static void ns16x50_fifo_tx_putchar(struct vuart_ns16x50 *vdev, char ch)
> > +{
> > +    struct xencons_interface *cons = &vdev->cons;
> > +
> > +    if ( !is_console_printable(ch) )
> > +        return;
> > +
> > +    if ( ch != '\0' )
> > +    {
> > +        cons->out[cons->out_prod] = ch;
> 
> should use MASK_XENCONS_IDX to access the array

Ack.

> 
> 
> > +        cons->out_prod++;
> > +    }
> > +
> > +    if ( cons->out_prod == ARRAY_SIZE(cons->out) - 1 ||
> > +         ch == '\n' || ch == '\0' )
> > +        ns16x50_fifo_tx_flush(vdev);
> > +}
> > +
> >  static inline uint8_t cf_check ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
> >  {
> >      return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> > @@ -228,6 +341,16 @@ static int ns16x50_io_write8(
> >      {
> >          switch ( reg )
> >          {
> > +        case UART_THR:
> > +            if ( regs[UART_MCR] & UART_MCR_LOOP )
> > +                rc = ns16x50_fifo_rx_putchar(vdev, val);
> > +            else
> > +                ns16x50_fifo_tx_putchar(vdev, val);
> 
> should UART_IIR_THR be cleared here?

Yes, thanks for the catch!

> 
> 
> > +            rc = 0;
> > +
> > +            break;
> > +
> >          case UART_IER:
> >              /*
> >               * NB: Make sure THR interrupt is re-triggered once guest OS
> > @@ -312,6 +435,14 @@ static int ns16x50_io_read8(
> >      else {
> >          switch ( reg )
> >          {
> > +        case UART_RBR:
> > +            rc = ns16x50_fifo_rx_getchar(vdev);
> > +            if ( rc >= 0 )
> > +                val = (uint8_t)rc;
> 
> Empty fifo check?

Will do.

> 
> 
> > +            rc = 0;
> > +            break;
> > +
> >          case UART_IER:
> >              val = regs[UART_IER];
> >              break;
> > @@ -499,6 +630,10 @@ static void cf_check ns16x50_deinit(void *arg)
> >      struct vuart_ns16x50 *vdev = arg;
> >  
> >      ASSERT(vdev);
> > +
> > +    spin_lock(&vdev->lock);
> > +    ns16x50_fifo_tx_flush(vdev);
> > +    spin_unlock(&vdev->lock);
> >  }
> >  
> >  static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
> > -- 
> > 2.51.0
> > 

