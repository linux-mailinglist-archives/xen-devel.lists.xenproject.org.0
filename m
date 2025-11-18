Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBFC6A7D7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 17:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165145.1491947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOCG-0005NS-RE; Tue, 18 Nov 2025 16:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165145.1491947; Tue, 18 Nov 2025 16:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOCG-0005LF-OB; Tue, 18 Nov 2025 16:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1165145;
 Tue, 18 Nov 2025 16:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLOCF-0005L9-Jb
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 16:04:47 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d83169f-c498-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 17:04:46 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-37a5bc6b491so44720351fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 08:04:46 -0800 (PST)
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
X-Inumbo-ID: 4d83169f-c498-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481886; x=1764086686; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGmLsHwBq9lqotzSisRsukQM3cS3ykmHtuLNrAui7gU=;
        b=hyp4aMb0Ojm8kq3YK/KrQflWHhdEeG9Bt1ocIPQuq7hVzDUFWMGJWIrzI8b03wwjPp
         MTnVy268EN21JEyda4A20yrcDW+Y9bkqpb6lz1PwoItiGbxT6+N+XADcTTCFzdKX9esm
         IE12sHojY8DO+MHxLvBRwdMc5lC/HKin4xSOhfZwG9gHBhHAJ9x32c3SJQyPGKt+OrNE
         21fl/JOx3vbwzwMgARmUA2JliHZ1jcs2BFB9jSkD/8rLbiiDqqWJo2vhiKnPdw3E94l1
         oGYHldpw+2ShleK9f2xISQhKtM5nNsEH4V7cobyy6+QladmdRmsmt8OnuqY3YXwlFRpx
         mAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481886; x=1764086686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGmLsHwBq9lqotzSisRsukQM3cS3ykmHtuLNrAui7gU=;
        b=bOJHbsRVEAHwAD3BlVZFhXbzhfT3v1DWSgx4qPAjjT2ow2OieuEre4+fbEA8aalCIF
         s1TvXqeK/UDoPDPC4gKPQ/Xu7eO3rjs8ECp62Oq1elNpOtDyfllkDQPG46IPvCyr0WH1
         T+DDW+t+Du/6YkMv7V838jVCiBbdoE71EhjVsvL/qFT4ZSrxOqSSfA1cCBL4LVZLUy+B
         soVGeNj8lkwaW3ogKxefN+L4OjGgv+Tr5sn6C7Zc+oek2sKOpOfWkDGn+N2kUZ1YYKkV
         MBM5aO2Ewlkm9Rd7Bu/oizzYbY0s4EuyGPHiXUtzVDyj5RCJzhHua/dINVT5Y2gEcGuL
         Rclg==
X-Gm-Message-State: AOJu0YzXMCMODaoi1f491My/FPodToht1xPvLzGFe05/ovUAEQUpfAA7
	6SPP8M938LlZza7JjmMPFr70Fhb/G4fSycerTrV5tmc0Wko/GeVb2cvWAfTjQJHxJtjic1Pl+M0
	4/EyWaGz67h4+mp3PfXUV6TCCetCkd4HIGOREySE=
X-Gm-Gg: ASbGnct3kL4JVrynfoIszu4vga+EoFi6WfW4Yg804qdLJsT/pBelLQqkaxNiYNzm4EY
	QMOKRYTYvYbSqUlWVxHZW/Imle4c8YnYKSfQyAdS6St+2xNUwVUbK/4jnieXHGWsfX1dumzgUjN
	MYbqevQLepNd6zdqpje7tuc0yP0nuOaKfIFAKLL07Z0khgL6842L/0ON3eIAb5tuV/XvTLpzTA0
	KX+MoL3aW73E4c95xYMju6T6BHH6uayVti19zzbI8g13CFHfLaBeKtS/nPxW2Z9fpRdBA==
X-Google-Smtp-Source: AGHT+IHKs04jtTfdYL7dP5c1ZYQzsK6Nxr5FMesPIrKOpR1pjsATUMWZ5WDDj/RL8stTk+7WHhXMwea9PGtIWVgwCBs=
X-Received: by 2002:a05:6512:108e:b0:594:35d5:f837 with SMTP id
 2adb3069b0e04-595841b49f7mr6018848e87.19.1763481885255; Tue, 18 Nov 2025
 08:04:45 -0800 (PST)
MIME-Version: 1.0
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
In-Reply-To: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 18:04:32 +0200
X-Gm-Features: AWmQ_bk7OfQVqEH3IbZ0JrBlN97q4hQA45We3fWS8jmvZMy9l38GKJT0ttgmKd0
Message-ID: <CAGeoDV9_irT4Ggdtr0KfxoNfJwTLJ+XkFPX=-UY+XkPLcPDr+Q@mail.gmail.com>
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF driver
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Friendly ping on this series.

As far as I can see, all comments have been addressed and this series
already has the relevant Reviewed-by/Acked-by tags.

Is there anything else needed before this can be queued or merged?

Best regards,
Mykola

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

