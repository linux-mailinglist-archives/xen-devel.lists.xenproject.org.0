Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D688AB3ACCC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 23:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100041.1453641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkIw-0001af-Oh; Thu, 28 Aug 2025 21:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100041.1453641; Thu, 28 Aug 2025 21:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkIw-0001Yd-MA; Thu, 28 Aug 2025 21:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1100041;
 Thu, 28 Aug 2025 21:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urkIv-0001YX-GJ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 21:37:09 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25fa1c34-8457-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 23:37:08 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f42dcbf4aso1450645e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 14:37:08 -0700 (PDT)
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
X-Inumbo-ID: 25fa1c34-8457-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756417028; x=1757021828; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPPzdITbHwXFm+n1YY5New0n5HM3nsOlC7W51sLt3q4=;
        b=mBJXDLTlduWSIM9nroadRoFnuQDQ0+X5Bf8hSZ238Q2CYhEsa7pDcnTW4xIW+ctSZc
         Fi9JE8jlPRG2MTD5Wfpmq8sRV91hq/HstP7mKOteRTMlnxfXmsQm8vevqi8wMxdGDGyf
         Gh+Qimk/otjV8gVTZagdTx89sR751a8NvyKMXcstgl6xnMAYUDVaSwBc4U8nQJNQRmgS
         t33hIyr6dwDCHAk38PGSBVXMRaGmsGXnNTT5Y0lJ6NaOrssqYt3XhS8ELjOsQEVlpYNp
         RkMCqQp14Oe3ZFCC5GpRqHw9YjDwRYEt4IzB1/uxPicD7OgJQQN5R7XbgydTjMwHZzQW
         dr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756417028; x=1757021828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPPzdITbHwXFm+n1YY5New0n5HM3nsOlC7W51sLt3q4=;
        b=IMQEFMy2z0YqEwbRS0fa07QchKkEYkltn96KuMqoLWshdZFg0NtdS/Fgnv1qesvLFt
         uOO3z68POxRcf+fTkmU6d66gn4+K3oNBMH95ByoXulFAhl/S7lnbZwX6ORhRlmSpmlF0
         TvssK7QHR0FEzrj88Khdt0mahKBu69KcZ0z/lOwY1ZA6hz/XopPZl2QAhJT28ysjVnk/
         HONz9ZoAVx271oobhJzAoufYxv7IErq1iq9PUpnFoZEVyG+5ZFMtE1XdFUWKT/kEgWuc
         tQ5gV2uknQwJkHWOv9gRYyXrLy7LQGuEFEM/tE3v4YKoV2aWc8GwwsCMFVQ7kQ1bXkk3
         iqZA==
X-Gm-Message-State: AOJu0Yy2YvEu5x2nxumV6LhBmVGYny0pdHijQkoSzg8HN3HiD1CYco1y
	Dq6e/iHP4nVu8M/+qZ1m7mc3qPsS9idCXySHBtK+Q05+gmWaOfJND7pu7hPqZ8F/KOSEnWvq3uW
	vgn1u2m2pJDAGvsJjbLH7fvSS9V/B5zeKVXWe
X-Gm-Gg: ASbGncvqyXJh3EJmSN1iGY8WQEILMnrcmCVIhfjnw/b7mLD4OMX1V6KoN/4ltuV042K
	fcmJF/XIwgodL2BkJTwrb/GVsgk8/IBpsSbRq+1zIwpxff6ZV3/gd6Ts5td2SZYcSiJkMU0GT5c
	Q1EBzNFbIJSxVknBCSFHmQA/ZM3oaT3otN/1tatWllCLUSbhRb8lGwNtpQOIqkGX2wI+yIaj8+Y
	7jdce9Ia2MnApeh
X-Google-Smtp-Source: AGHT+IFSk+3tLJwawpjU9WwEHuda/pfg+ijrtKkaL3/VApjzb0KSFryJY4Dc5LhmgjB+i+VcLPt6B2wkpfCbHbwaP3U=
X-Received: by 2002:a05:6512:3b85:b0:55f:6881:980f with SMTP id
 2adb3069b0e04-55f688199e2mr26707e87.11.1756417027580; Thu, 28 Aug 2025
 14:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <60c0b456-bfda-430d-a1e9-f64c9a49ac54@gmail.com>
In-Reply-To: <60c0b456-bfda-430d-a1e9-f64c9a49ac54@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 29 Aug 2025 00:36:55 +0300
X-Gm-Features: Ac12FXwMbO6W9yKPuh23ZJyWMSBbSzkO1Q88BDPdPPU64O7HKIA8_WdNL8dPVyM
Message-ID: <CAGeoDV9ov_SfbOFVGZ25a=-g9tjus6Wg2-8cXQaJDWk3_QOg1Q@mail.gmail.com>
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF driver
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

Thank you for your review.

On Tue, Aug 26, 2025 at 6:51=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 07.08.25 08:16, Mykola Kvach wrote:
>
>
> Hello Mykola,
>
> In general patch looks good to me, just one question below ...
>
> > From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >
> > Implement suspend and resume callbacks for the SCIF UART driver,
> > enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
> > handling of UART state across system suspend/resume cycles.
> >
> > Tested on Renesas R-Car H3 Starter Kit.
> >
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > In patch v5, there are no changes at all;
> > it was done just to trigger a review.
>
> I think, you could ping on V4.
>
>
> >
> > In patch v4, enhance commit message, no functional changes
> >
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
>
>   ... I wonder, whether the call above (that disables Transmit
> interrupt) is really needed as the call below disables all interrupts
> anyway?

I have checked the relevant documentation and did not find any requirement
to clear TIE before disabling the rest of the SCSCR bits, according to the
R-Car Series, 3rd Generation User=E2=80=99s Manual: Hardware, Rev. 0.52.

However, based on how the serial subsystem works, I believe this call is
justified.

Disabling TX IRQs before fully stopping the serial prevents new data
from being added to the FIFO by the IRQ handler during suspend (see
serial_tx_interrupt). This ensures the FIFO is flushed (loop inside
scif_uart_disable) and no further transmissions occur.

If a flush handler were implemented for this driver, we could avoid
calling scif_uart_stop_tx and remove the loop inside scif_uart_disable,
as the flush handler would ensure the FIFO is empty after any invocation
of serial_tx_interrupt.

>
>
> > +    scif_uart_disable(uart);
> > +}
>
> [snip]

Best regards,
Mykola

