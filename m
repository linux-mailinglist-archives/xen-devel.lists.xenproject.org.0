Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAEECB6F62
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184710.1507086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlq3-0003cn-Jn; Thu, 11 Dec 2025 18:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184710.1507086; Thu, 11 Dec 2025 18:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlq3-0003aS-H2; Thu, 11 Dec 2025 18:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1184710;
 Thu, 11 Dec 2025 18:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlq1-0003aM-U9
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:56:29 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a802df-d6c3-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:56:28 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so373225e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:56:28 -0800 (PST)
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
X-Inumbo-ID: 19a802df-d6c3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765479388; x=1766084188; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/Hj2LYdJG9idikz8lHiPRxzo/hY3J6vGgWG7i1vWCs=;
        b=GkhNtKr7NZGURI7mZ4FstnF1AVIhTTFjdBOo2k6jszrqYvT1jYzP4h9nOdrTGKzTRn
         cNFHRxZg4JKK1oB7wdf3J8WGnfP5usHEemdc79WtdN2tOw33zJTup3WZBGJjZC+y/OnQ
         4eURNrM38cf26NKQ+PkJSjhlZUR/60VRSytj0V6DFTzTa+unnv6tzLzIxnTzgtA5wGMK
         K5Jk1Hxc0qxiC1u70Tuukj5aRR9SjLqk0vvcBo6UTiNimNT4+yiI6AuaxJZ3Z4D74tC7
         OhxavHHZq0QWH4sn6LMMHtc7zccqZTAdI9OL0WtpCSlkwlhEPwvZkv+4/Vhey30Fe+Si
         SWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765479388; x=1766084188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/Hj2LYdJG9idikz8lHiPRxzo/hY3J6vGgWG7i1vWCs=;
        b=T4iusfRcTyK5ZQAuGX5HhywvVn2weTlGYS/t9b624A+Q7OAkL6wpTrpmn6I7iLirzd
         3lvkegLsTn/ZCu+OuG5GBHkrKw5Ow0BmwbLuF+121g3hzW9linUhRiQav/b0KQ0ZGpm3
         KZBZOycGuPGS1k2LXlhlYZhw6Xur+ym6GC/kW3dPtVS32kbu+ENOuC7kn1jmho9wZuhj
         cB+KlwhWRjZP/JeG8rPStJbG72GC6cNkUCfDMRjTeQs+UxvvVYHgOVwV3bfKXCmhsGPA
         RKIUDgV9sW2S/X0Gb3UcbCH/0WnAcsCEQMG128NydS3XsEvgFqrQ8NsA1pHTBi71Hhki
         W5LQ==
X-Gm-Message-State: AOJu0YzO/bWRvTExZoZNHjD0GZBmISpvIy6AQAxGy2ZG4uIyesg6o6WR
	hN3T+Yi6t8lzV5LF68DT1LlYOMJ9sqvwh2tugnzc8qmTBlpLoeeAzMxF6EkwH3QksiQxRYu+RL6
	7vkLvIOHlpCmHs6czBzXQvk/CKIyGLbW4W1tOkCQ=
X-Gm-Gg: AY/fxX50LHS/mfG2ci54oMoHZzGKSQWKr+rs7UkLWmaYGnbIslLbZzG+qD82usTfsvA
	ElykjLnofGSVI0ZEKdIK9MQSGKoVLVKpwfRAOYFoQMGLqKe2gYbs8xJgcoUmtMIDUcw3OXG1s3p
	CMvWWeFZK9cOAY2u8tmXPhRFDtHybzmvvolyqubuS7KFgaTYSVEXm7bQ/iC3Gerbizv7KZQ7UQk
	oYoWvumTDLMhTrrXSMP0fLUKWCqH4fzLRoFrxd6xjUC8W8yG8mKXMPmo2FwFsjhRjd3
X-Google-Smtp-Source: AGHT+IF3K8r1RRaYmClqwQkjkXxzHhsv20K7mKcwFierz/m8fJoZRmHl0/E3lUz/ovcmlZbOA77TMYcEMJzIVjRsomo=
X-Received: by 2002:a2e:a803:0:b0:37e:5208:e2d7 with SMTP id
 38308e7fff4ca-37fbfe6293emr11153041fa.19.1765479387753; Thu, 11 Dec 2025
 10:56:27 -0800 (PST)
MIME-Version: 1.0
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
In-Reply-To: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 11 Dec 2025 20:56:16 +0200
X-Gm-Features: AQt7F2of81WKMe1uUDf8Tt45NXXqDTGZjRIvwpqbtNFeFbiujn71AnP1By7MG6E
Message-ID: <CAGeoDV-j4nu1JhHyLpeDoqZ6evsExGvJSws-MK09M4HbUam1BA@mail.gmail.com>
Subject: Ping: [PATCH v5] xen/char: implement suspend/resume calls for SCIF driver
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this series.
It has already received a few Acks/Reviews - could it be considered for mer=
ging,
or is there anything else I should address?

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

