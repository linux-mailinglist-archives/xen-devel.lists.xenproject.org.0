Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D470DB3C3C8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 22:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102135.1454885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5iM-0005MN-9x; Fri, 29 Aug 2025 20:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102135.1454885; Fri, 29 Aug 2025 20:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5iM-0005Jz-72; Fri, 29 Aug 2025 20:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1102135;
 Fri, 29 Aug 2025 20:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zkx=3J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1us5iL-0005Jt-7k
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 20:28:49 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2c26e04-8516-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 22:28:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7527C40AB5;
 Fri, 29 Aug 2025 20:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAC6C4CEF0;
 Fri, 29 Aug 2025 20:28:43 +0000 (UTC)
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
X-Inumbo-ID: c2c26e04-8516-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756499324;
	bh=hZKqGQdv8TBMMkcAGR4c4QvQW5e1NsG/JyzWmMHfsFM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GUo/Q4wmlamTPcdb581FYl4001Zu+pl2AMSilJtj0I3ksrXIjf7NarS5RMS3a9C9c
	 xBQg2G0ljQa05ARYfROze1JKKseLcGwlU2f6EMJs5BCtfCoyawdA0Evf9sUy6Wb3KL
	 wfaKc15WjYWto0wWNw6Vysd0z3h+YEXsK9fIIU6u9NIIux6cZHqUVWiDPn1ZlIcpZI
	 RhBshau5fk/8qseyayDbNSNu2SfWS8w1er7EhuBGo1/3EME0f+FaejP0HduQXtsN1i
	 qZtRXtD8YBC3hMtPM5IKAYSGY2LB/I8tG+K6Somyo/YBqukHZG7YE2optnqoAfzUjk
	 XT8uMnToXfPUg==
Date: Fri, 29 Aug 2025 13:28:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v5 06/15] emul/ns16x50: implement THR/RBR registers
In-Reply-To: <20250828235409.2835815-7-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291320330.341243@ubuntu-linux-20-04-desktop>
References: <20250828235409.2835815-1-dmukhin@ford.com> <20250828235409.2835815-7-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add RBR/THR registers emulation to the I/O port handlder.
> 
> Also, add RX/TX FIFO management code since RBR depends on RX FIFO and
> THR depends on TX FIFO.
> 
> FIFOs are not emulated as per UART specs for simplicity (not need to emulate
> baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
> NS16750 (64 bytes).
> 
> FIFOs are emulated by means of using xencons_interface which conveniently
> provides primitives for buffer management and later can be used for
> inter-domain communication similarly to vpl011.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v4:
> - new patch
> ---
>  xen/common/emul/vuart/ns16x50.c | 135 ++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index 20597cc36b35..efb2f4c6441c 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -92,6 +92,119 @@ static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
>      return cons->in_prod == cons->in_cons;
>  }
>  
> +static bool ns16x50_fifo_rx_full(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
> +}
> +
> +static void ns16x50_fifo_rx_reset(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->in_cons = cons->in_prod;
> +}
> +
> +static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    int rc;
> +
> +    if ( ns16x50_fifo_rx_empty(vdev) )
> +    {
> +        ns16x50_debug(vdev, "RX FIFO empty\n");
> +        rc = -ENODATA;
> +    }
> +    else
> +    {
> +        rc = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
> +        cons->in_cons++;
> +    }
> +
> +    return rc;

The signed integer to char conversion here is not great from a MISRA
perspective. I think it would be better to keep rc as success/failure
return value and take the read char as a pointer parameter.


> +}
> +
> +static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    int rc;
> +
> +    /*
> +     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
> +     * of the THR.
> +     */
> +    if ( ns16x50_fifo_rx_full(vdev) )
> +    {
> +        ns16x50_debug(vdev, "RX FIFO full; resetting\n");
> +        ns16x50_fifo_rx_reset(vdev);
> +        rc = -ENOSPC;
> +    }
> +    else
> +        rc = 0;
> +
> +    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
> +    cons->in_prod++;
> +
> +    return rc;
> +}
> +
> +static bool ns16x50_fifo_tx_empty(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->out_prod == cons->out_cons;
> +}
> +
> +static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->out_prod = 0;
> +    ASSERT(cons->out_cons == cons->out_prod);

I am not sure about this.. why resetting the out_prod index? In theory
it could keep increasing until wrap around and still go forward thanks
to the mask


> +}
> +
> +/*
> + * Flush cached output to Xen console.
> + */
> +static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    struct domain *d = vdev->owner;
> +
> +    if ( ns16x50_fifo_tx_empty(vdev) )
> +        return;
> +
> + UART_IIR_THR   ASSERT(cons->out_prod < ARRAY_SIZE(cons->out));
> +    cons->out[cons->out_prod] = '\0';

should use MASK_XENCONS_IDX to access the array


> +    cons->out_prod++;
> +
> +    guest_printk(d, guest_prefix "%s", cons->out);
> +
> +    ns16x50_fifo_tx_reset(vdev);

set UART_IIR_THR and call ns16x50_irq_check ?


> +}
> +
> +/*
> + * Accumulate guest OS output before sending to Xen console.
> + */
> +static void ns16x50_fifo_tx_putchar(struct vuart_ns16x50 *vdev, char ch)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    if ( !is_console_printable(ch) )
> +        return;
> +
> +    if ( ch != '\0' )
> +    {
> +        cons->out[cons->out_prod] = ch;

should use MASK_XENCONS_IDX to access the array


> +        cons->out_prod++;
> +    }
> +
> +    if ( cons->out_prod == ARRAY_SIZE(cons->out) - 1 ||
> +         ch == '\n' || ch == '\0' )
> +        ns16x50_fifo_tx_flush(vdev);
> +}
> +
>  static inline uint8_t cf_check ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
>  {
>      return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> @@ -228,6 +341,16 @@ static int ns16x50_io_write8(
>      {
>          switch ( reg )
>          {
> +        case UART_THR:
> +            if ( regs[UART_MCR] & UART_MCR_LOOP )
> +                rc = ns16x50_fifo_rx_putchar(vdev, val);
> +            else
> +                ns16x50_fifo_tx_putchar(vdev, val);

should UART_IIR_THR be cleared here?


> +            rc = 0;
> +
> +            break;
> +
>          case UART_IER:
>              /*
>               * NB: Make sure THR interrupt is re-triggered once guest OS
> @@ -312,6 +435,14 @@ static int ns16x50_io_read8(
>      else {
>          switch ( reg )
>          {
> +        case UART_RBR:
> +            rc = ns16x50_fifo_rx_getchar(vdev);
> +            if ( rc >= 0 )
> +                val = (uint8_t)rc;

Empty fifo check?


> +            rc = 0;
> +            break;
> +
>          case UART_IER:
>              val = regs[UART_IER];
>              break;
> @@ -499,6 +630,10 @@ static void cf_check ns16x50_deinit(void *arg)
>      struct vuart_ns16x50 *vdev = arg;
>  
>      ASSERT(vdev);
> +
> +    spin_lock(&vdev->lock);
> +    ns16x50_fifo_tx_flush(vdev);
> +    spin_unlock(&vdev->lock);
>  }
>  
>  static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
> -- 
> 2.51.0
> 

