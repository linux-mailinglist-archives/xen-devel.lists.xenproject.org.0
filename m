Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58350B47193
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 16:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113388.1461215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuuLt-00037N-VI; Sat, 06 Sep 2025 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113388.1461215; Sat, 06 Sep 2025 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuuLt-00035x-Rm; Sat, 06 Sep 2025 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1113388;
 Sat, 06 Sep 2025 14:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTp=3R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uuuLt-00035r-50
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 14:57:17 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c628eb1a-8b31-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 16:57:14 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5607c2f1598so3169386e87.3
 for <xen-devel@lists.xenproject.org>; Sat, 06 Sep 2025 07:57:14 -0700 (PDT)
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
X-Inumbo-ID: c628eb1a-8b31-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757170634; x=1757775434; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlTtPpR8RMUC4GLRdCF17L/D6D1eCOR6eggI+Sb6QQo=;
        b=mpHV1dNmOAx2k9vApy3NU17BWy+sif21oA/xS0gCa77WxoWj7S0/Cc/2zxhBH+Iz02
         amwslk7ACGFGo228fmqLBHILsnad5ycvKzbGMAfGjhwULTNCztjCw5o2MHxJpaps8+PP
         EAx5hA4W4OP3ACIZA+930gZVUqomUigJC49mq/QwRQ3KuHcI+VPKQ2lGZGMXJJd8dfrU
         1pX/h7juBUAPem8IV0FDCK8w0IB2NxsTE1y9y7teYj4SbvkwaLh7QTXWrAxys9WS3PPS
         rf0n9WYvqBtx2Qd61/pe2e/tbiX4Zyaebp31kYxDaef9YUqzZ8wyOrc56VOZsPPwujvN
         WxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757170634; x=1757775434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlTtPpR8RMUC4GLRdCF17L/D6D1eCOR6eggI+Sb6QQo=;
        b=f4eMinzNrAXx7N0Dq5efJfgHGsYFkagVKwQ4No9uSV/e0dfxvSvT06/Vb794okWIcZ
         4Jjz6osmCMnrJBSmrwinSiYjhIv7mA9avWp3JE9XE4un0MGZdrRYYyJIDLXfUwVpWiP0
         xYps+NrM/JS2WqsB8EhxdGETnZpWE1BbJhmzDrgRkwj12RNrkX6I3DyffE+bHOzIkKBA
         2tJ2xiL1H8Q9fF9OYeq/Zs7w6UVIi2SZTt1JOUPcEYEVKxXrLyKUrNedDifkd8UxmwHz
         q2UNcX/VhA+tXFyoTYU7jsE68fZmWy28PD9lAH4ObLfRadx0SfH0SuIjdIYouyuZTFES
         qoUA==
X-Gm-Message-State: AOJu0YwNJpt4tVJGMY1kZQ1ENwzOx1engqI/r5h6xXICu5aRcoFMFjcQ
	9tYpawq9VchxWPEa7+GBcUojoHfOnFbgGV/Tt+drKrsnhxwpot2sy8hmPtPfW/VjPntOgf/Odxs
	GacFN0wyfk1jEHkuRDGuCxOzOTYtfYhI=
X-Gm-Gg: ASbGncuKCZcnNgO4Sl3i+E56NNKy4LJT5ED9gL08iqorTf/D6Ah6AwQ4neBLNo0Iitv
	dyTzr2lUbJ3P1eSFpSFed1IYawpKN//8x5HpVfhbycvcJMRsdWVzWIXAqtmxTHt00XCxQ+9FEgH
	RoA+q6snnE/07GdXSVCqCjEoYemKAYQd7Rugb9a6htIaf/9Zy3RPadW/O07MnxxMgNbMiqdLfiG
	CBA98reRuEvO8LW
X-Google-Smtp-Source: AGHT+IGhDVdgvLzKa2HyBz0qq5oOFERCsLsXvgi6NDVo2FuFblqT8roa9JrD++8b/B6RJ6B7rN23IvKeoPLzH1gGegs=
X-Received: by 2002:a05:6512:2c94:b0:55f:5f7e:9ba8 with SMTP id
 2adb3069b0e04-56260e42a9bmr751287e87.31.1757170633509; Sat, 06 Sep 2025
 07:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-3-dmukhin@ford.com>
In-Reply-To: <20250905232715.440758-3-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 6 Sep 2025 17:57:02 +0300
X-Gm-Features: Ac12FXyc8lz7iWirGMSYGarP0BTW1dpBGjMlRbLpsTyjpI_JlGf_ZMxMzTGeWu0
Message-ID: <CAGeoDV8Q5i_KAmU9Sdu7e06vC72O97ZmdcmJpGNe=AxbE+3jeg@mail.gmail.com>
Subject: Re: [PATCH v6 02/15] xen/8250-uart: update definitions
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Sat, Sep 6, 2025 at 2:27=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Added missing definitions needed for NS16550 UART emulator.
>
> Newly introduced MSR definitions re-used in the existing ns16550 driver.
>
> Also, corrected FCR DMA definition bit#3 (0x08) as per:
>   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> See "7.7.2 FIFO Control Register (FCR)".
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v5:
> - fixed commentaries
> - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-3-=
dmukhin@ford.com/
> ---
>  xen/drivers/char/ns16550.c  | 16 ++++++------
>  xen/include/xen/8250-uart.h | 50 ++++++++++++++++++++++++++++++-------
>  2 files changed, 49 insertions(+), 17 deletions(-)
>
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index df7fff7f81df..0e80fadbb894 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -388,7 +388,7 @@ static void __init cf_check ns16550_init_preirq(struc=
t serial_port *port)
>
>      /* Check this really is a 16550+. Otherwise we have no FIFOs. */
>      if ( uart->fifo_size <=3D 1 &&
> -         ((ns_read_reg(uart, UART_IIR) & 0xc0) =3D=3D 0xc0) &&
> +         ((ns_read_reg(uart, UART_IIR) & UART_IIR_FE) =3D=3D UART_IIR_FE=
) &&
>           ((ns_read_reg(uart, UART_FCR) & UART_FCR_TRG14) =3D=3D UART_FCR=
_TRG14) )
>          uart->fifo_size =3D 16;
>  }
> @@ -728,20 +728,20 @@ static int __init check_existence(struct ns16550 *u=
art)
>       * Mask out IER[7:4] bits for test as some UARTs (e.g. TL
>       * 16C754B) allow only to modify them if an EFR bit is set.
>       */
> -    scratch2 =3D ns_read_reg(uart, UART_IER) & 0x0f;
> -    ns_write_reg(uart,UART_IER, 0x0F);
> -    scratch3 =3D ns_read_reg(uart, UART_IER) & 0x0f;
> +    scratch2 =3D ns_read_reg(uart, UART_IER) & UART_IER_MASK;
> +    ns_write_reg(uart, UART_IER, UART_IER_MASK);
> +    scratch3 =3D ns_read_reg(uart, UART_IER) & UART_IER_MASK;
>      ns_write_reg(uart, UART_IER, scratch);
> -    if ( (scratch2 !=3D 0) || (scratch3 !=3D 0x0F) )
> +    if ( (scratch2 !=3D 0) || (scratch3 !=3D UART_IER_MASK) )
>          return 0;
>
>      /*
>       * Check to see if a UART is really there.
>       * Use loopback test mode.
>       */
> -    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
> -    status =3D ns_read_reg(uart, UART_MSR) & 0xF0;
> -    return (status =3D=3D 0x90);
> +    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_MCR=
_OUT2);
> +    status =3D ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
> +    return (status =3D=3D (UART_MSR_CTS | UART_MSR_DCD));
>  }
>
>  #ifdef CONFIG_HAS_PCI
> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c13..bbbffb14d320 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,6 +32,7 @@
>  #define UART_MCR          0x04    /* Modem control        */
>  #define UART_LSR          0x05    /* line status          */
>  #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=3D1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=3D1) */
> @@ -42,6 +43,8 @@
>  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>  #define UART_IER_ELSI     0x04    /* rx line status       */
>  #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_MASK \
> +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
>
>  /* Interrupt Identification Register */
>  #define UART_IIR_NOINT    0x01    /* no interrupt pending */
> @@ -51,12 +54,19 @@
>  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
>
>  /* FIFO Control Register */
> -#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> -#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> -#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> +#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
> +#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
> +#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
> +#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */
> +#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
> +#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */
> +#define UART_FCR_RTB0       BIT(6, U)   /* receiver trigger bit #0 */
> +#define UART_FCR_RTB1       BIT(7, U)   /* receiver trigger bit #1 */
> +#define UART_FCR_TRG_MASK   (UART_FCR_RTB0 | UART_FCR_RTB1)

Thanks for the patch. I noticed that in this changeset some bit
definitions (e.g. UART_FCR_*) were rewritten using the BIT(n, U)
macro, while others (e.g. UART_IER_* and rest of UART_FCR_*) are
still left as plain hex values (0x01, 0x02, etc.), even though they
are also powers of two.

Could you clarify the reasoning behind this choice? From a reader=E2=80=99s
perspective it looks inconsistent. Would it make sense to either:

  - update all of them to use BIT() for consistency, or
  - keep the existing style unchanged in this patch and move a full
    conversion to BIT() into a separate cleanup patch?

This would make the codebase easier to follow.

> +
>  #define UART_FCR_TRG1     0x00    /* Rx FIFO trig lev 1   */
>  #define UART_FCR_TRG4     0x40    /* Rx FIFO trig lev 4   */
>  #define UART_FCR_TRG8     0x80    /* Rx FIFO trig lev 8   */
> @@ -96,11 +106,32 @@
>  #define UART_LCR_CONF_MODE_B   0xBF            /* Configuration mode B *=
/
>
>  /* Modem Control Register */
> -#define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
> -#define UART_MCR_RTS      0x02    /* Request to Send      */
> -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> -#define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> -#define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=3D=
1) */
> +#define UART_MCR_DTR            BIT(0, U)   /* Data Terminal Ready  */
> +#define UART_MCR_RTS            BIT(1, U)   /* Request to Send      */
> +#define UART_MCR_OUT1           BIT(2, U)   /* Output #1 */
> +#define UART_MCR_OUT2           BIT(3, U)   /* Output #2 */
> +#define UART_MCR_LOOP           BIT(4, U)   /* Enable loopback test mode=
 */
> +#define UART_MCR_RESERVED0      BIT(5, U)   /* Reserved #0 */
> +#define UART_MCR_TCRTLR         BIT(6, U)   /* Access TCR/TLR (TI16C752,=
 EFR[4]=3D1) */
> +#define UART_MCR_RESERVED1      BIT(7, U)   /* Reserved #1 */
> +#define UART_MCR_MASK \
> +    (UART_MCR_DTR | UART_MCR_RTS | \
> +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> +     UART_MCR_LOOP | UART_MCR_TCRTLR)
> +
> +/* Modem Status Register */
> +#define UART_MSR_DCTS           BIT(0, U)   /* Change in CTS */
> +#define UART_MSR_DDSR           BIT(1, U)   /* Change in DSR */
> +#define UART_MSR_TERI           BIT(2, U)   /* Change in RI */
> +#define UART_MSR_DDCD           BIT(3, U)   /* Change in DCD */
> +#define UART_MSR_CTS            BIT(4, U)
> +#define UART_MSR_DSR            BIT(5, U)
> +#define UART_MSR_RI             BIT(6, U)
> +#define UART_MSR_DCD            BIT(7, U)
> +#define UART_MSR_CHANGE \
> +    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
> +#define UART_MSR_STATUS \
> +    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
>
>  /* Line Status Register */
>  #define UART_LSR_DR       0x01    /* Data ready           */
> @@ -111,6 +142,7 @@
>  #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
>  #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
>  #define UART_LSR_ERR      0x80    /* Error                */
> +#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
>
>  /* These parity settings can be ORed directly into the LCR. */
>  #define UART_PARITY_NONE  (0<<3)
> --
> 2.51.0
>
>

Best regards,
Mykola

