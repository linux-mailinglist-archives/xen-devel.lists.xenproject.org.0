Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E79C1EE3D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 09:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153391.1483745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENZq-0002TZ-JX; Thu, 30 Oct 2025 08:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153391.1483745; Thu, 30 Oct 2025 08:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vENZq-0002Rf-GN; Thu, 30 Oct 2025 08:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1153391;
 Thu, 30 Oct 2025 08:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R46B=5H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vENZo-0002RT-TE
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 08:00:08 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 710cf7cb-b566-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 09:00:03 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-592fd97c03eso844743e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 01:00:03 -0700 (PDT)
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
X-Inumbo-ID: 710cf7cb-b566-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761811203; x=1762416003; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/v+7w5Dx/1kLEYKPSlGfyHOafvT4cBIMDhg84Ptmks=;
        b=i+0/Eg8xe7Yy9xImufIc+BTUZcSYfsBDF7jMwEL7rNvddwGOi7PVBDU2Wqp3aelKo9
         c7DnD1gf6Eiqi3pc5giwTG6U8wnUM4DaSicLMeZ5V3xj2UPCvqWAYiHzYUc5o/WsuLcF
         1YUCUV/QAXaOcuBRP13L7i542DL/xl8JcG/2efR1CcKWRXa3+j/KIsrnZBBzQIqsIZFv
         uwpQH+NLgiCd+LHRFSyADW9VcSPoGHrlD531Mtz4S24fs5HNsGYL3yXuDN7Sq9tsNINf
         WtMSfS5kPBwrd2QaNYFV9nMKdpUNi3T62o1cCWxRGIvXu/8qhZ2escKioHKSmukaxdFH
         5AaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761811203; x=1762416003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/v+7w5Dx/1kLEYKPSlGfyHOafvT4cBIMDhg84Ptmks=;
        b=YNKCVkkYbOO2zwhADaK52JlsQSbBuNdDtXx573yQYWvkqifXLYc04SiYmILjBlkLOS
         JOvsgrsrdVWEeVkb88ec3/TyJr7ymTZJoe7bmyju+JYc/Hu/mzCHuKzF3hDHhp+bW+Ne
         QcWd723K6vjoj2ehRg5hLy4lMCSnHwthj78A8j+PJHwDm8EpwZn4CrEZiQpNgcK/waNP
         hWX/sexpz8DoHWukK+EQzs4cSWJS6dhSd4V1mx2f2WxGp3gUEnLxnRCVFbwCyqhfmCwo
         9zHpw6m9xH66CGcCDpwxBBqoPQx/y/myT1+mPQNXZRoE0DHnE/mLUkPN8lBrUKUWSSyp
         gnQQ==
X-Gm-Message-State: AOJu0YwYy1yRiZaMIxp9w1pLbIZEVc3RWxodAzH/MjeMnex6ynbNtSg5
	/7iKCwnVgL0an1jUGOjfJy4fzQZARN2P4cANsv7OkdWiOZoWucZ1qC+Hz5UHB3WQ0+8tczfwqfd
	DGQ9sxJvMJZs4EJ7VVWcNksEDh8N2DuserQ==
X-Gm-Gg: ASbGncv+uaNcO1OYfQYSUNvmzGf0p7OU4fen1f2YW3lZN0FN8qDhEsPsgDrnCnt3aPF
	d5LV41bzbpwqdIuk+is3jy0T9vlqrTV35mygsfffD6zKE3R6CnQ4LIyRBguD0sdIhCdVfudXnx1
	dl2osqjuZqdRekAy9sX+YusPb+oJ/99JaAfGPaU4G89w5HOQkcVSa3eMWJces8YI1KSSh6Z/s0B
	bjsIqmEmugN+aqzzZINrpKirvZLp8/x4baqEkW9hPdwiH6bEYPErV5jkwHp
X-Google-Smtp-Source: AGHT+IFchR8tg6vjqK7QScj9Otoi3SMpUEDtuQqn2KSnQrdEmKvoBhE+Iz61dYMcTdug0v8ykmr4M5C1EnbCqeC5DIM=
X-Received: by 2002:a05:6512:124d:b0:57b:d5d4:e7e0 with SMTP id
 2adb3069b0e04-59416ee144bmr599516e87.42.1761811202613; Thu, 30 Oct 2025
 01:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
In-Reply-To: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 30 Oct 2025 09:59:49 +0200
X-Gm-Features: AWmQ_bnQAJNgsmAjqhsHnt9k9WPXzsEnCqfjAY2mUiyhX_MZyeo6GwrG9uSjWuo
Message-ID: <CAGeoDV9ejB-6tg0eNK-6jD8zEZb1G0+AmJNaKVt50P4DiB6Kng@mail.gmail.com>
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF driver
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Stefano Stabellini @Michal Orzel @Julien Grall @Bertrand Marquis ping

On Thu, Aug 7, 2025 at 8:16=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> Implement suspend and resume callbacks for the SCIF UART driver,
> enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
> handling of UART state across system suspend/resume cycles.
>
> Tested on Renesas R-Car H3 Starter Kit.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> In patch v5, there are no changes at all;
> it was done just to trigger a review.
>
> In patch v4, enhance commit message, no functional changes
>
> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
> the suspend/resume functions in the SCIF driver.
> ---
>  xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 757793ca45..888821a3b8 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
>      }
>  }
>
> -static void __init scif_uart_init_preirq(struct serial_port *port)
> +static void scif_uart_disable(struct scif_uart *uart)
>  {
> -    struct scif_uart *uart =3D port->uart;
>      const struct port_params *params =3D uart->params;
>
>      /*
> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct seri=
al_port *port)
>
>      /* Reset TX/RX FIFOs */
>      scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> +}
> +
> +static void scif_uart_init_preirq(struct serial_port *port)
> +{
> +    struct scif_uart *uart =3D port->uart;
> +    const struct port_params *params =3D uart->params;
> +
> +    scif_uart_disable(uart);
>
>      /* Clear all errors and flags */
>      scif_readw(uart, params->status_reg);
> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *po=
rt)
>      scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_=
TIE);
>  }
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void scif_uart_suspend(struct serial_port *port)
> +{
> +    struct scif_uart *uart =3D port->uart;
> +
> +    scif_uart_stop_tx(port);
> +    scif_uart_disable(uart);
> +}
> +
> +static void scif_uart_resume(struct serial_port *port)
> +{
> +    struct scif_uart *uart =3D port->uart;
> +    const struct port_params *params =3D uart->params;
> +    uint16_t ctrl;
> +
> +    scif_uart_init_preirq(port);
> +
> +    /* Enable TX/RX and Error Interrupts  */
> +    ctrl =3D scif_readw(uart, SCIF_SCSCR);
> +    scif_writew(uart, SCIF_SCSCR, ctrl | params->irq_flags);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  static struct uart_driver __read_mostly scif_uart_driver =3D {
>      .init_preirq  =3D scif_uart_init_preirq,
>      .init_postirq =3D scif_uart_init_postirq,
> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_dr=
iver =3D {
>      .start_tx     =3D scif_uart_start_tx,
>      .stop_tx      =3D scif_uart_stop_tx,
>      .vuart_info   =3D scif_vuart_info,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend      =3D scif_uart_suspend,
> +    .resume       =3D scif_uart_resume,
> +#endif
>  };
>
>  static const struct dt_device_match scif_uart_dt_match[] __initconst =3D
> --
> 2.48.1
>

