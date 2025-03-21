Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FEA6B81F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923845.1327242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ5A-0001yb-IT; Fri, 21 Mar 2025 09:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923845.1327242; Fri, 21 Mar 2025 09:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZ5A-0001x9-Fd; Fri, 21 Mar 2025 09:54:28 +0000
Received: by outflank-mailman (input) for mailman id 923845;
 Fri, 21 Mar 2025 09:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvZ0T-0004YZ-Ej
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:49:37 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbcc7a3d-0639-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:49:35 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54ac9d57173so3116486e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:49:35 -0700 (PDT)
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
X-Inumbo-ID: cbcc7a3d-0639-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550575; x=1743155375; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAb00lVAUIpbhjfudIc6w3Mle7wzLkEOsmQou+kyTjo=;
        b=MFAMb6HacP+GxgDViWLBMVR/nWrh/ktGHCcMWQH1FL3kYu0h3IqHfS0Gu0Rkf/Q3Wb
         YNwrnj+soEH5C5/oqicKSjb7kV+XheIz3XHDNM3MMxdXVFMGBm/mE/j7zyUSLkj3AvDM
         TE3YoLUGaA9B2l30EyrirPDCjlWLv1gbpN5Mk/zZAUcYFbF+vJ2ynZ9pUQT+sGeDIhe1
         mwqUp5a+2uhVJ+1kf0cBlHYa1VmsW6CgJIEHATH5HOebNXuXvSqwT9119v0LKDEUo4gj
         sUrErcU2jtrl3TL/zv098SOKBxNkER0yM4yO4lv7RF3sDQd/GhqZYPoPn49bk8esr7xV
         JKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550575; x=1743155375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAb00lVAUIpbhjfudIc6w3Mle7wzLkEOsmQou+kyTjo=;
        b=viXIBESY+P7nARPZA3bZTXXbR4umRyOfKRp8IYZ5pszB0KOTmdZf/VyPOdCDcIfAZb
         pim0H7UPWSw8rEXnHaT277DisgFxsbHZt+ECHbB1QqQmkcS0LgTiJCnApO1IDfG9aPEV
         KY9mLXR5mCT9tEVJNKKTQSwyt656fAJYfTpQJ7Ko3S94k4TLr5OeRN/cSx701OP5eeZp
         WFjpK+uesetMVgwKRjfWOazdXpkapB8Voif6s0GTn+S6dFg347qIOa8/YsRw7kv6RQj1
         IikPM6IIrx0Seq84h4V1M71gT8RI4MTQe2kv3sivGo3GteuRMNZYuRfFRuyaGxPhPNF/
         CdDg==
X-Gm-Message-State: AOJu0Yxjm2exucaVqWMbmosoN+doXa+Ill8E6AiAxnFalkKvFJ0sZKRS
	JBlnN9RYQb/SFYP00TH20ca839U8yLe44jAUhodcO4XN1aUW48Zdl0Mr15xBcE59FdcTfOOcHQx
	qfWW/pAJLCA2/VHoK64N9dQrQJU8=
X-Gm-Gg: ASbGncshP7/4F8FXEr3JQLF5SMdYWMqh5luC+3cH/8StgXLUrSCCjy1eapMGMI19Gqc
	x2qjn/PRDeWhH3j9JWNrbmJih4imopmi7e+scogRqyH640/vQkgDZG5K2AO5Vu4YqWGXDZrYLG/
	Nu+UVFP+R043zrnKHU4EZnGMCv
X-Google-Smtp-Source: AGHT+IHrX/ypJWoI9A2I/dh6XAFHpCagJ3YlLzoOX1y4yiIN6D2eWUMzNFXCTznL5zPigHYCRSGj14vnCkfTNUNIX68=
X-Received: by 2002:a05:6512:3d8b:b0:545:a70:74c5 with SMTP id
 2adb3069b0e04-54ad604dba2mr843487e87.13.1742550574401; Fri, 21 Mar 2025
 02:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <503edd5fb277699aaeb87507bb39fbb52e81f168.1741164138.git.xakep.amatop@gmail.com>
 <13ed6492-9677-40b7-a4ac-e6516f7ed130@epam.com>
In-Reply-To: <13ed6492-9677-40b7-a4ac-e6516f7ed130@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:49:22 +0200
X-Gm-Features: AQ5f1JqciW-yHl8af4Ph3mQIjmwWabx3Zq3Ep29-NgqsavZOghgW0mZTs7Dw_KA
Message-ID: <CAGeoDV_gQsxnqRcC9F4wR7TMm7oD8Hgs8T3dD-incz-6QEtwPQ@mail.gmail.com>
Subject: Re: [PATCH 07/16] xen/char: implement suspend/resume calls for SCIF driver
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 19, 2025 at 7:21=E2=80=AFPM Grygorii Strashko
<grygorii_strashko@epam.com> wrote:
>
>
>
> On 05.03.25 11:11, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The changes have been tested only on the Renesas R-Car-H3 Starter Kit b=
oard.
> >
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >   xen/drivers/char/scif-uart.c | 31 ++++++++++++++++++++++++++++++-
> >   1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.=
c
> > index 757793ca45..e166fb0f36 100644
> > --- a/xen/drivers/char/scif-uart.c
> > +++ b/xen/drivers/char/scif-uart.c
> > @@ -139,7 +139,7 @@ static void scif_uart_interrupt(int irq, void *data=
)
> >       }
> >   }
> >
> > -static void __init scif_uart_init_preirq(struct serial_port *port)
> > +static void scif_uart_init_preirq(struct serial_port *port)
> >   {
> >       struct scif_uart *uart =3D port->uart;
> >       const struct port_params *params =3D uart->params;
> > @@ -271,6 +271,33 @@ static void scif_uart_stop_tx(struct serial_port *=
port)
> >       scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCS=
CR_TIE);
> >   }
> >
>
> I assume you want ifdef CONFIG_SYSTEM_SUSPEND here also

I was thinking about it and decided that since we have the
suspend/resume fields uncovered for uart_driver,
I'll leave the functions uncovered as well.

I'll add coverage in the next patch series.
It=E2=80=99s probably needed to cover the suspend/resume fields too, but th=
at
will require additional changes for other UART drivers.
Thank you for pointing that out.

>
>
> > +static void scif_uart_suspend(struct serial_port *port)
> > +{
> > +    struct scif_uart *uart =3D port->uart;
> > +
> > +    scif_uart_stop_tx(port);
> > +
> > +    /* Wait until last bit has been transmitted. */
> > +    while ( !(scif_readw(uart, SCIF_SCFSR) & SCFSR_TEND) );
> > +
> > +    /* Disable TX/RX parts and all interrupts */
> > +    scif_writew(uart, SCIF_SCSCR, 0);
> > +
> > +    /* Reset TX/RX FIFOs */
> > +    scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> > +}
> > +
> > +static void scif_uart_resume(struct serial_port *port)
> > +{
> > +    struct scif_uart *uart =3D port->uart;
> > +
> > +    scif_uart_init_preirq(port);
> > +
> > +    /* Enable TX/RX and Error Interrupts  */
> > +    scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
> > +                SCSCR_TIE | SCSCR_RIE | SCSCR_REIE);
> > +}
> > +
> >   static struct uart_driver __read_mostly scif_uart_driver =3D {
> >       .init_preirq  =3D scif_uart_init_preirq,
> >       .init_postirq =3D scif_uart_init_postirq,
> > @@ -281,6 +308,8 @@ static struct uart_driver __read_mostly scif_uart_d=
river =3D {
> >       .start_tx     =3D scif_uart_start_tx,
> >       .stop_tx      =3D scif_uart_stop_tx,
> >       .vuart_info   =3D scif_vuart_info,
> > +    .suspend      =3D scif_uart_suspend,
> > +    .resume       =3D scif_uart_resume,
> >   };
> >
> >   static const struct dt_device_match scif_uart_dt_match[] __initconst =
=3D
>
> --
> Best regards,
> -grygorii

Best regards,
Mykola

