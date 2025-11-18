Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356EAC67AAC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:11:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164380.1491358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEw6-0002Cn-IG; Tue, 18 Nov 2025 06:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164380.1491358; Tue, 18 Nov 2025 06:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEw6-0002AS-Ez; Tue, 18 Nov 2025 06:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1164380;
 Tue, 18 Nov 2025 06:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLEmS-00062J-2V
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:01:32 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07a61cc3-c444-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 07:01:31 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so5702532e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:01:31 -0800 (PST)
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
X-Inumbo-ID: 07a61cc3-c444-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445691; x=1764050491; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BgZr8IRTp2+3z7NzYoA2QTxxVVOaI5lJNKU3i0mTay4=;
        b=Qa2CfRvu1khH1P634AtfCYY4yoE1J+qXZxIYMVc18i3Dt+suPs3ooLV2vCLoy9Oou3
         T5oKhk/ysXWFwZyiazwFzBsh6zn6rPK1vNMIsKfsXvbP7wikYMwzUx+Mzoa9b3cZ+YPy
         qlZGUrzzOW8Srzs/ofCa1T7xrfGDtb+aerSly739wfTIzHSv4f2K2qOyGxxVc2wr9nYd
         JLKERM8w+0ClOxrxau39dLE8LjQlwR8bg0hrb5dfoZuGt/Dnz6czof96Kf0tGIJBKV3U
         uleeR7Uf7LTamQomhdq0oR/aVXdU1qVOHB+OtJhyPm1xiDzpbwGV1FSBJHdhTVtw8p8T
         XB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445691; x=1764050491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgZr8IRTp2+3z7NzYoA2QTxxVVOaI5lJNKU3i0mTay4=;
        b=CNH6IFqYQ+Bhq4Ja3h7cMpX55T9fKUUEjEJ9+nTRPuUuwSw6PdoUtnKwM9gHhNKb8n
         fVn/oneVk+pIvhYyXOECnBXQpzWNJeg8TI34kH0aRTuAtecdXSiCSO84rPQ57l2Mo8gv
         cPzEm0xvOrZsuXDhYPYbCYS5eeBsZobUxupf/NOUgmtByJbJ/eOHmqzKZq4cZmF0jxi4
         V4qGjRhBL8kcGWxAgOp9dxw91C60WYI2onL7yRyh6kt4cPWg6BcoxJF1ZAyW6H7xe3fC
         N5SAOad2CkAO7HU8UzSkEVgkgDEahzowtvMxBeaorda7ucUqw7Tv2XtYVy0Rtk7qpeUI
         XKdg==
X-Forwarded-Encrypted: i=1; AJvYcCUWOFfAkwZtUdieP0+TZa3OHKfqze/VAELZ+RLqypSEm/evGdRuAEjkkEbDHkoAmLYkq/wQ65J7MgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1gaMtYVLTPLYqqQCWb5mVcIgda1gjaseklYjuwyjSO0B6pTOH
	viWIRNAtcsnR08Ddyf88IJY/2Uvgr8b4k1aYG9ingA9slsB1NhDBTj8WFnAtdl6mq8AxBKoiGlz
	c5ggOKcA7/YVnB+0qXF6fCuFmDW1Y/Ow=
X-Gm-Gg: ASbGnctCJ2BTddo0AzZir4uzJyLMZNVdYtyz0ZGR4KUVuAgYM1XtPqW+QpxxZPAnpW4
	eziIhTtnWHFXBHF3AK3IPAB4k/VR4PxfZxKeFYHGMjskkNH2wpakNufoCjhhDb2lrjH5SaO9VYF
	7Eq+WCaeXyn2+F6hjVfj3+jd4yUgOUjG3CLaDOZ0WLJ/EDw0cOvBpmncUH5eCV2CjkLG8iS0QjS
	4mXhYcDjctoIHmpz5bZdvdiGLKo/2eZ36fMcm3/T3ocbCz0yKLTtstfGEg=
X-Google-Smtp-Source: AGHT+IG+umzn6cqy64Ler0ptFKcByweA0xSdQHexD4Ox5iuQP6iTxmz/WdxVGyVUXLNFS6zi27PC1whOscv+L+U4/LQ=
X-Received: by 2002:a05:6512:3d08:b0:594:7718:ecb7 with SMTP id
 2adb3069b0e04-5959874ca7dmr689007e87.9.1763445690702; Mon, 17 Nov 2025
 22:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-10-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-10-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_blDRxuIjcdNNGZYUb1J04PxSw2vQyo3hAulPCdVO09CQGivZ_HJA6bftjA
Message-ID: <CAGeoDV_jpCxvgk-5g5sh-HY1qX4FFCSOY8nQCApr3-L4TN8npQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/16] emul/ns16x50: implement RBR register
To: dmukhin@xen.org, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, 
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, 
	sstabellini@kernel.org, dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"

Hi Denis,

Thank you for the patch.

On 09/09/2025 00:11, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add RBR register emulation to the I/O port handlder.
>
> Add RX FIFO management code since RBR depends on RX FIFO.
>
> RX FIFO is not emulated as per UART specs for simplicity (not need to emulate
> baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
> NS16750 (64 bytes).
>
> RX FIFO is emulated by means of using xencons_interface which conveniently
> provides primitives for buffer management and later can be used for
> inter-domain communication similarly to vpl011.
>
> Account for DLL == 0: in this case, disable receiver.
>
> Add UART_LSR_DR handling since it depends on RBR register access.
>
> Finally, implement put_rx() vUART hook for placing a character into the
> emulated RX FIFO from console driver. That implements physical console
> forwarding to the guest OS over emulated NS16550.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - added DLL == 0 case handling as per Mykola's suggestion
> ---
>   xen/common/emul/vuart/ns16x50.c | 134 +++++++++++++++++++++++++++++++-
>   1 file changed, 132 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> index fdc20124d4c9..250411e0a7d8 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -9,6 +9,8 @@
>    *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
>    * - UART w/ 64 byte FIFO:
>    *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> + * - DesignWare DW_apb_uart Databook, v4.02a:
> + *     https://iccircle.com/static/upload/img20240313113905.pdf
>    *
>    * Limitations:
>    * - Only x86;
> @@ -85,6 +87,74 @@ struct vuart_ns16x50 {
>       struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
>   };
>
> +static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
> +{
> +    const struct xencons_interface *cons = &vdev->cons;
> +
> +    return cons->in_prod == cons->in_cons;
> +}
> +
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
> +/*
> + * Transfer character from RX FIFO and return the RX FIFO status after the
> + * transfer.
> + */
> +static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev, uint8_t *ptr)
> +{
> +    struct xencons_interface *cons = &vdev->cons;
> +
> +    if ( ns16x50_fifo_rx_empty(vdev) )
> +        return -ENODATA;
> +
> +    *ptr = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
> +    cons->in_cons++;
> +
> +    return ns16x50_fifo_rx_empty(vdev) ? -ENODATA : 0;
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

Do we really need to drop everything from the buffer here?
Should we document somewhere that in case of OE the whole RX buffer is dropped?

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
> +static bool ns16x50_is_running(const struct vuart_ns16x50 *vdev)
> +{
> +    /* DLL set to 0 disables serial communication. */
> +    return vdev->regs[NS16X50_REGS_NUM + UART_DLL];
> +}
> +
>   static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
>   {
>       return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
> @@ -97,7 +167,7 @@ static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
>
>   static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
>   {
> -    return false;
> +    return !ns16x50_fifo_rx_empty(vdev);
>   }
>
>   static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
> @@ -362,6 +432,20 @@ static int ns16x50_io_read8(
>       {
>           switch ( reg )
>           {
> +        case UART_RBR:
> +            if ( !ns16x50_is_running(vdev) )
> +                break;
> +
> +            /* NB: do not forget to clear overrun condition */
> +            regs[UART_LSR] &= ~UART_LSR_OE;

The "NS16550A Universal Asynchronous Receiver/Transmitter
with FIFOs" states:

The OE indicator is set to a logic 1 upon detection of an overrun
condition and reset whenever the CPU reads the contents of the Line
Status Register.

So it looks like we don't need to clear this bit here.
According to the spec it should be cleared only on LSR read.

Best regards,
Mykola


> +
> +            if ( ns16x50_fifo_rx_getchar(vdev, &val) )
> +                regs[UART_LSR] &= ~UART_LSR_DR;
> +            else
> +                regs[UART_LSR] |= UART_LSR_DR;
> +
> +            break;
> +
>           case UART_IER:
>               val = regs[UART_IER];
>               break;
> @@ -611,13 +695,59 @@ static void cf_check ns16x50_free(void *arg)
>       xvfree(arg);
>   }
>
> +static int cf_check ns16x50_put_rx(void *arg, char ch)
> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +    uint8_t *regs;
> +    uint8_t dlab;
> +    int rc = -EBUSY;
> +
> +    spin_lock(&vdev->lock);
> +
> +    dlab = ns16x50_dlab_get(vdev);
> +    regs = vdev->regs;
> +
> +    if ( !ns16x50_is_running(vdev) )
> +        ns16x50_debug(vdev, "THR/RBR access disabled: DLL == 0\n");
> +    else if ( dlab )
> +        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=1\n");
> +    else if ( regs[UART_MCR] & UART_MCR_LOOP )
> +        ns16x50_debug(vdev, "THR/RBR access disabled: loopback mode\n");
> +    else
> +    {
> +        const struct domain *d = vdev->owner;
> +
> +        /*
> +         * Echo the user input on Xen console iff Xen console input is owned
> +         * by ns16x50 domain.
> +         * NB: use 'console_timestamps=none' to disable Xen timestamps.
> +         */
> +        if ( is_console_printable(ch) )
> +            guest_printk(d, "%c", ch);
> +
> +        if ( ns16x50_fifo_rx_putchar(vdev, ch) )
> +            regs[UART_LSR] |= UART_LSR_OE;
> +
> +        regs[UART_LSR] |= UART_LSR_DR;
> +
> +        /* TODO: check FCR when to fire an interrupt */
> +        ns16x50_irq_check(vdev);
> +
> +        rc = 0;
> +    }
> +
> +    spin_unlock(&vdev->lock);
> +
> +    return rc;
> +}
> +
>   #define ns16x50_emulator                \
>   {                                       \
>       .compatible = "ns16550",            \
>       .alloc      = ns16x50_alloc,        \
>       .free       = ns16x50_free,         \
>       .dump_state = NULL,                 \
> -    .put_rx     = NULL,                 \
> +    .put_rx     = ns16x50_put_rx,       \
>   }
>
>   VUART_REGISTER(ns16x50, ns16x50_emulator);

