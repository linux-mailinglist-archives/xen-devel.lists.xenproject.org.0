Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C46AD9462
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 20:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014819.1392904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ96n-0003UH-2g; Fri, 13 Jun 2025 18:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014819.1392904; Fri, 13 Jun 2025 18:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ96m-0003Sn-W9; Fri, 13 Jun 2025 18:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1014819;
 Fri, 13 Jun 2025 18:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5wsr=Y4=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uQ96l-0003Sh-DJ
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 18:26:31 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec64a662-4883-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 20:26:29 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-553241d30b3so2065017e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 11:26:29 -0700 (PDT)
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
X-Inumbo-ID: ec64a662-4883-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749839189; x=1750443989; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=744Q4BaZEA37rjJV9mLugsQfyO+L5XOIK9X7Q5KQDbc=;
        b=erGdm9TZ+/h7yTXQD6sD3wIiERYoKFXCx8+2vtwMVE2WwYbIC9cXVnOEdi6dmZ31Nx
         SfFv/aZzPavAVyg50uElCguYBvZs4ho9pR6iu6mrqWOxKDY6+gFwS1eI7oduLVOqlru4
         HnlkOPHicURwP6Cnm6bQBVt2lj7y7i5Srqg49ZjSBoKncmCPgRZSUhP6zw/4SowkVRth
         4cBPT82CkDKLW7UHY+NIJOxTqTisISghD1/uFKQTuTBTSo3egZ6d/NqAG8ZxjodxqdC+
         dWatRU/RKazLuMB5ILehG+CUdTF4ncW4MEvNA+IfioeeuZsxUMCMbZxRZchvoeTeNGSV
         1+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749839189; x=1750443989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=744Q4BaZEA37rjJV9mLugsQfyO+L5XOIK9X7Q5KQDbc=;
        b=s3H34VVywsGnkLo5jevePW+aaLMzMl6Aw6+rrIUzFsX7vRdk0pjn5jqzUxKjRRUorc
         8j1qgYQt0KSCExmJLY8poaHLvsxdgBMXibF2yflH5mFutG14FrawdS9xZMv1qFUQ5bEu
         4UL/dj0ZtfSHaIF1Y5sDzgC8qOTIYHiW61SihEsbewYgLxDtPPmGCpCjrTafhNKyxNtO
         sEB9bxxOGOintl94F9nYl1LXsH1byuL9LOti8HDPiniG6Lgo0YMn6egkpmH1U16yXaQQ
         Tyz0EGJRpagOXKT1Fpxs20oX+pOWtGGUrHRlKB6Bb5PrfTBqDg4iZYQihQk/Te9nV5gV
         FFZw==
X-Gm-Message-State: AOJu0YybPa6awJPAC1BZPoGts3YuVFB3Mo94GEUIinLQhjzzwu0fqMow
	OG8pHOZqvnJlMkVILMmR8+p99HDKXLYAR5VCp3To6cDPYVzRJKQ0F/3YpmH0OLzPxL7SDyuHT3o
	oUGhjAg4hOmG6ptb9GcTYspPeI4D0wQA=
X-Gm-Gg: ASbGncuqfnFiY7n083ty2/1WfAMVjN81HKm47N2D5kubiNRBbARQUH/r77yn99wOhSv
	i4EDQYZcwxb4hXDEIpzht4IEMT3kogxpcC2WvUSc1l9N4RlHIu99c86wRD2m/R/koJSGrqoqWns
	4x4jIIrKXRhH7XEOMYtNyy5XPEn3e/20Ev4lQ2F3brCA==
X-Google-Smtp-Source: AGHT+IEmMNVKSWJ6ZcdzB6hiq0iiWMoOGop98C+43yBO+IDYHL9fpfPXTTJ654SWhYnS9MYPDIpnuRxuGO6da3JCqZw=
X-Received: by 2002:a05:6512:68a:b0:553:663d:736c with SMTP id
 2adb3069b0e04-553b6e84d23mr100310e87.15.1749839188485; Fri, 13 Jun 2025
 11:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749204282.git.mykola_kvach@epam.com> <3be3369910ec5159eab3cb26155da645dd1df83b.1749204282.git.mykola_kvach@epam.com>
 <4403d50b-3380-4f94-8c14-f0eb2884b50d@amd.com>
In-Reply-To: <4403d50b-3380-4f94-8c14-f0eb2884b50d@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 13 Jun 2025 21:26:16 +0300
X-Gm-Features: AX0GCFsh2EuSdYXKiv9tWNwCaeneeehXf_c1JaYNHsH5VfCHhZrq2I1e-i0rZmQ
Message-ID: <CAGeoDV-shygCux0BumGNPxZHFbhPGy6guJg83Pih5quBp820cQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] xen/char: implement suspend/resume calls for SCIF driver
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ayan

On Fri, Jun 13, 2025 at 5:36=E2=80=AFPM Ayan Kumar Halder <ayankuma@amd.com=
> wrote:
>
> Hi Mykola,
>
> On 06/06/2025 11:11, Mykola Kvach wrote:
> > CAUTION: This message has originated from an External Source. Please us=
e proper judgment and caution when opening attachments, clicking links, or =
responding to this email.
> >
> >
> > From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >
> > The changes have been tested only on the Renesas R-Car H3 Starter Kit b=
oard.
>
> The commit message need to explain what the change is and why it is neede=
d.

Thanks for the feedback. I thought the information from the commit
message title would be enough.

I will add a few more words to clarify what the change is and why it's
needed to the commit message body.

>
> Also ...
>
> >
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
> > the suspend/resume functions in the SCIF driver.
> > ---
> >   xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 38 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.=
c
> > index 757793ca45..888821a3b8 100644
> > --- a/xen/drivers/char/scif-uart.c
> > +++ b/xen/drivers/char/scif-uart.c
> > @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data=
)
> >       }
> >   }
> >
> > -static void __init scif_uart_init_preirq(struct serial_port *port)
> > +static void scif_uart_disable(struct scif_uart *uart)
> >   {
> > -    struct scif_uart *uart =3D port->uart;
> >       const struct port_params *params =3D uart->params;
> >
> >       /*
> > @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct se=
rial_port *port)
> >
> >       /* Reset TX/RX FIFOs */
> >       scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> > +}
> > +
> > +static void scif_uart_init_preirq(struct serial_port *port)
> > +{
> > +    struct scif_uart *uart =3D port->uart;
> > +    const struct port_params *params =3D uart->params;
> > +
> > +    scif_uart_disable(uart);
> >
> >       /* Clear all errors and flags */
> >       scif_readw(uart, params->status_reg);
> > @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *=
port)
> >       scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCS=
CR_TIE);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static void scif_uart_suspend(struct serial_port *port)
> > +{
> > +    struct scif_uart *uart =3D port->uart;
> > +
> > +    scif_uart_stop_tx(port);
> > +    scif_uart_disable(uart);
> > +}
> > +
> > +static void scif_uart_resume(struct serial_port *port)
> > +{
> > +    struct scif_uart *uart =3D port->uart;
> > +    const struct port_params *params =3D uart->params;
> > +    uint16_t ctrl;
> > +
> > +    scif_uart_init_preirq(port);
> > +
> > +    /* Enable TX/RX and Error Interrupts  */
> > +    ctrl =3D scif_readw(uart, SCIF_SCSCR);
> > +    scif_writew(uart, SCIF_SCSCR, ctrl | params->irq_flags);
>
> If you can give reference to a public doc which describe these
> registers, it will be great.

I don't think I can share documentation for the board I used for testing
this commit.

However, I searched for Linux boards that use the same driver and SCIF
register set with available documentation, and I found a few boards with
open documentation, for example, RZ/G1H or RZ/G1M:

https://www.renesas.com/en/products/microcontrollers-microprocessors/rz-mpu=
s/rzg1m-ultra-high-performance-microprocessors-15ghz-dual-core-arm-cortex-a=
15-cpus-3d-graphics-and-video

>
> Otherwise, the changes look ok to me.
>
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   static struct uart_driver __read_mostly scif_uart_driver =3D {
> >       .init_preirq  =3D scif_uart_init_preirq,
> >       .init_postirq =3D scif_uart_init_postirq,
> > @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_=
driver =3D {
> >       .start_tx     =3D scif_uart_start_tx,
> >       .stop_tx      =3D scif_uart_stop_tx,
> >       .vuart_info   =3D scif_vuart_info,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend      =3D scif_uart_suspend,
> > +    .resume       =3D scif_uart_resume,
> > +#endif
> >   };
> >
> >   static const struct dt_device_match scif_uart_dt_match[] __initconst =
=3D
> - Ayan
> > --
> > 2.48.1
> >
> >

Best regards,
Mykola

