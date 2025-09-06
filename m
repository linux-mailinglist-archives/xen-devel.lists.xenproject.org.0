Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE2B46835
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 03:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112963.1461076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiDL-0001Nd-CR; Sat, 06 Sep 2025 01:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112963.1461076; Sat, 06 Sep 2025 01:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiDL-0001KS-9K; Sat, 06 Sep 2025 01:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1112963;
 Sat, 06 Sep 2025 01:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiDJ-0001K6-Sq
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 01:59:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 228aa08b-8ac5-11f0-9d12-b5c5bf9af7f9;
 Sat, 06 Sep 2025 03:59:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FF4340235;
 Sat,  6 Sep 2025 01:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA97C4CEF1;
 Sat,  6 Sep 2025 01:59:32 +0000 (UTC)
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
X-Inumbo-ID: 228aa08b-8ac5-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757123973;
	bh=W2xF6dFNqGHeSkThUdFZmzfdp8upCwIkO04CllFZZ2A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mESRxTFTHRi8d9duvn7rKdHFxPBDVfXYmbdokhdMGppw8R5syedbXhryvyzJMcq8x
	 plfVYcLyBZwy+ewkOYeXDkWSj+Ixs7h4XGEri338qrZ3dbzb6h9X18mnkjX5mzXmLq
	 jO+Z6Yw5VToOGugPLKx0+p16gagvj9hFq5NK9OSdktV5ouBFclDqsqow6vNJQD8VTa
	 5ALlIyvesfPdifYA1MX/knxvnHauvocyKggXsLVWQlQlwKhx5nKiGQ3RDQ74Wumf+i
	 zpUj/oXc12XC7ylMKhRvJHF0RPJvqpDgS5UwPXVo5L+Gn51Clcngo0SUlduOBM7QV0
	 8tWp/CXFoLXxA==
Date: Fri, 5 Sep 2025 18:59:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 10/15] emul/ns16x50: implement THR register
In-Reply-To: <20250905232715.440758-11-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051830070.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-11-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add THR register emulation to the I/O port handlder.
> 
> Add TX FIFO management code since THR depends on TX FIFO.
> 
> TX FIFOs is not emulated as per UART specs for simplicity (not need to emulate
> baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
> NS16750 (64 bytes).
> 
> TX FIFOs is emulated by using xencons_interface which conveniently provides
> primitives for buffer management and later can be used for inter-domain
> communication similarly to vpl011.
> 
> Add UART_IIR_THR interrupt reason handling since it depends on THR register
> access.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - new patch
> - Link to v5 (both THR/RBR): https://lore.kernel.org/xen-devel/20250828235409.2835815-7-dmukhin@ford.com/
> ---
>  xen/common/emul/vuart/ns16x50.c | 103 +++++++++++++++++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index cac5128f0573..987d4c06e23b 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -148,6 +148,66 @@ static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
>      return rc;
>  }
>  
> +static bool ns16x50_fifo_tx_full(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->out_prod - cons->out_cons == ARRAY_SIZE(cons->out);
> +}
> +
> +static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    cons->out_cons = cons->out_prod;
> +}
> +
> +/*
> + * Flush cached output to Xen console.
> + */
> +static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +    struct domain *d = vdev->owner;
> +    XENCONS_RING_IDX i, n, len = cons->out_prod - cons->out_cons;
> +
> +    ASSERT(len <= ARRAY_SIZE(cons->out));
> +    if ( !len )
> +        return;
> +
> +    i = MASK_XENCONS_IDX(cons->out_cons, cons->out);
> +    n = min_t(XENCONS_RING_IDX, len, ARRAY_SIZE(cons->out) - i);
> +    if ( n )
> +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
> +
> +    i = 0;
> +    n = len - n;
> +    if ( n )
> +        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
> +
> +    cons->out_cons += len;
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
> +    if ( !ns16x50_fifo_tx_full(vdev) )
> +    {
> +        cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)] = ch;
> +        cons->out_prod++;
> +    }
> +
> +    if ( ch == '\n' || ch == '\0' || ns16x50_fifo_tx_full(vdev) )
> +        ns16x50_fifo_tx_flush(vdev);
> +}
> +
>  static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
>  {
>      return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> @@ -165,7 +225,7 @@ static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
>  
>  static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
>  {
> -    return false;
> +    return vdev->regs[NS16X50_REGS_NUM + UART_IIR] & UART_IIR_THR;
>  }
>  
>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
> @@ -284,7 +344,31 @@ static int ns16x50_io_write8(
>      {
>          switch ( reg )
>          {
> +        case UART_THR:
> +            if ( regs[UART_MCR] & UART_MCR_LOOP )
> +            {
> +                if ( ns16x50_fifo_rx_putchar(vdev, val) )
> +                    regs[UART_LSR] |= UART_LSR_OE;
> +
> +                regs[UART_LSR] |= UART_LSR_DR;
> +            }
> +            else
> +            {
> +                ns16x50_fifo_tx_putchar(vdev, val);
> +                regs[NS16X50_REGS_NUM + UART_IIR] |= UART_IIR_THR;
> +            }
> +            break;
> +
>          case UART_IER:
> +            /*
> +             * NB: Make sure THR interrupt is re-triggered once guest OS
> +             * re-enables ETHREI in IER since all THR writes are immediate,
> +             * there's no baud rate emulation.
> +             */
> +            if ( val & regs[UART_IER] & UART_IER_ETHREI )
> +                regs[NS16X50_REGS_NUM + UART_IIR] |= UART_IIR_THR;
> +
>              regs[UART_IER] = val & UART_IER_MASK;
>              break;
>  
> @@ -439,6 +523,16 @@ static int ns16x50_io_read8(
>  
>          case UART_IIR: /* RO */
>              val = ns16x50_iir_get(vdev);
> +
> +            /*
> +             * Since there's no baud rate emulation, transmits are immediate
> +             * to the guest. Clear IIR scratch location to make sure there
> +             * will be interrupt generated once guest re-enabled ETHREI in
> +             * IER.
> +             */
> +            if ( val & UART_IIR_THR )
> +                regs[NS16X50_REGS_NUM + UART_IIR] &= ~UART_IIR_THR;

Why clear UART_IIR_THR here?

UART_IIR_THR should be set if the out buffer is not full and should not
be set of the out buffer is full?

Given that the only function adding to out is ns16x50_fifo_tx_putchar,
and given that ns16x50_fifo_tx_putchar clears the out buffer when full
by calling ns16x50_fifo_tx_flush if ns16x50_fifo_tx_full, then basically
we can keep UART_IIR_THR set all the time?


>              break;
>  
>          case UART_LCR:
> @@ -620,6 +714,9 @@ static int ns16x50_init(void *arg)
>      vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
>      vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
>  
> +    /* Report UART is ready to transmit. */
> +    vdev->regs[NS16X50_REGS_NUM + UART_IIR] = UART_IIR_THR;
> +
>      register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
>  
>      spin_lock(&vdev->lock);


