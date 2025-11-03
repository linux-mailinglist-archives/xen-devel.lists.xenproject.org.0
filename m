Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB068C2A557
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 08:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155211.1484726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFp1E-0006KQ-LV; Mon, 03 Nov 2025 07:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155211.1484726; Mon, 03 Nov 2025 07:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFp1E-0006Hc-Hh; Mon, 03 Nov 2025 07:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1155211;
 Mon, 03 Nov 2025 07:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKkM=5L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vFp1D-0006HW-Gq
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 07:30:23 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3b14a8b-b886-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 08:30:20 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-378de7d3057so38863921fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Nov 2025 23:30:20 -0800 (PST)
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
X-Inumbo-ID: f3b14a8b-b886-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762155020; x=1762759820; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U4aeEbj9TmQR25U08x38zCt+2gVaF+ShW7hAAzzrZY=;
        b=WMHPlJ6YBo/IHaozjuq1DeDs09UWLXPTh579pJpOxzmRisph5oUl0qv5Fr/c/ZC21D
         2NDtp+744tHAzRy3LrO/dRFuvLrT3Th5BpJaLy8DGyldB0u1ur/fLDzvTtqyop+qr4Ov
         47xAx8oPcaXJp8vvsbqxKS6gTwVM3RcPEmVux/f/lhDX77xZtlcRifZUMCrqJSftqeZC
         FzW20Endcw8w8GJTTx2j6igb0VZj/lotLgQMTObTks98NzTC5I2fYUVdawzktgU6UUiL
         p3A9wq3HJhcBdVpsFiq3K1oqQd5gQkGhCarXTm4jYglAG2m0mIsALrFk2Ii2KKWsgK3K
         Dw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155020; x=1762759820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1U4aeEbj9TmQR25U08x38zCt+2gVaF+ShW7hAAzzrZY=;
        b=rC4jMstsGAUnI94Bg6RFUOyVW9eJjYEkfUUX7hkW/gieYLnAa4LhMMDqJQ8r3xP9/3
         rWx3YOHFRB+jhdq4SYbLuyXZd9bfFYDuFBcYenYZIzUkn2GfUrABn6b5sPbYKzSkZspa
         BXQmU+R3qZvZh2NMRMwMbsy+dON/CWMWXEvl45moOiepeCtlvb2pYbye+U+dsf9H1c8W
         ngsIwcoWmGaNMUbbLzVFhGrGRhQ9HSiUQfqdtEoaCIQTj3Zl9jnynBwadU82/IAMTUF0
         VgZE0G8MSW5eihR7r6PbhS1EcTmZi7SVzdU6jpWj3jgE8kZLDzKf5NYy3p8LXmxFySsu
         TsGA==
X-Gm-Message-State: AOJu0YxWLu1nmNSOJY0uF7zVorfkJfk3ViweKLxLkbShg3oOQ5MzR2OL
	ThJTwC9wlD3mNEjrvVc+QB8HG1ttjG2VssGUpfQUvRWLFmB9cLe0o9goVtKRNTvmz41mulAXI/N
	5xwyFWe0+AwL7Cm0t0wZHyFgmtLGxrbE=
X-Gm-Gg: ASbGncsIKbZP7CtMA6CNNJ3ZxhgSSLFoUvoPRC3pB7OaNG61Ajowh56G9JK9P2dDnfs
	u9QLm+ybjWvcCL1La4/b96O8xgKh6ahlmBeI3xhuejrIDMHtpbp2aC4PMkKtLstQZIf8Eh6hX5K
	nVXzCbx1k3h4saNU0UmorRMgckFjQh3s3h6rUQyQVMK4IdABzXGs3d9KbGK5oBPCL0w6w5kX4Vw
	3rI8zup8Mo6DKhY1nOv+CCDrszDmAKuGz0lZ8+LNBlkhJMghKtaKccNn4DYyy+yMp5sfg==
X-Google-Smtp-Source: AGHT+IFn7rAEuSSC7/7q5j3ANvEBnBLlmVKiqmFKt+/oFaPaSQGTWoy4z8io32D7Dx0Yef8Q+gQoHQgzezg7G9zTQNk=
X-Received: by 2002:a05:651c:1506:b0:37a:323b:267b with SMTP id
 38308e7fff4ca-37a323b2a38mr12212651fa.41.1762155019230; Sun, 02 Nov 2025
 23:30:19 -0800 (PST)
MIME-Version: 1.0
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <CAGeoDV9ejB-6tg0eNK-6jD8zEZb1G0+AmJNaKVt50P4DiB6Kng@mail.gmail.com> <5c1db85b-8733-47d5-b751-864cdb45aca4@amd.com>
In-Reply-To: <5c1db85b-8733-47d5-b751-864cdb45aca4@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 3 Nov 2025 09:30:00 +0200
X-Gm-Features: AWmQ_bm_CPZ4p1Qc80ju0c4CuX5ISzB_sX64yayzFU_t_wYpIMuj5FF76K0HQ0o
Message-ID: <CAGeoDV96uei_QLCYBrFsJP5OU2=x2xjGKOHyKSDHfGJfk0RomQ@mail.gmail.com>
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF driver
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thank you for the fast response and the review.

On Thu, Oct 30, 2025 at 10:41=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 30/10/2025 08:59, Mykola Kvach wrote:
> > @Stefano Stabellini @Michal Orzel @Julien Grall @Bertrand Marquis ping
> >
> > On Thu, Aug 7, 2025 at 8:16=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail=
.com> wrote:
> >>
> >> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >>
> >> Implement suspend and resume callbacks for the SCIF UART driver,
> >> enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
> >> handling of UART state across system suspend/resume cycles.
> >>
> >> Tested on Renesas R-Car H3 Starter Kit.
> >>
> >> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.c=
om>
> >> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> ---
> >> In patch v5, there are no changes at all;
> >> it was done just to trigger a review.
> >>
> >> In patch v4, enhance commit message, no functional changes
> >>
> >> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
> >> the suspend/resume functions in the SCIF driver.
> >> ---
> >>  xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++-=
-
> >>  1 file changed, 38 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart=
.c
> >> index 757793ca45..888821a3b8 100644
> >> --- a/xen/drivers/char/scif-uart.c
> >> +++ b/xen/drivers/char/scif-uart.c
> >> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *dat=
a)
> >>      }
> >>  }
> >>
> >> -static void __init scif_uart_init_preirq(struct serial_port *port)
> >> +static void scif_uart_disable(struct scif_uart *uart)
> >>  {
> >> -    struct scif_uart *uart =3D port->uart;
> >>      const struct port_params *params =3D uart->params;
> >>
> >>      /*
> >> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct s=
erial_port *port)
> >>
> >>      /* Reset TX/RX FIFOs */
> >>      scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> >> +}
> >> +
> >> +static void scif_uart_init_preirq(struct serial_port *port)
> >> +{
> >> +    struct scif_uart *uart =3D port->uart;
> >> +    const struct port_params *params =3D uart->params;
> >> +
> >> +    scif_uart_disable(uart);
> >>
> >>      /* Clear all errors and flags */
> >>      scif_readw(uart, params->status_reg);
> >> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port =
*port)
> >>      scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCS=
CR_TIE);
> >>  }
> >>
> >> +#ifdef CONFIG_SYSTEM_SUSPEND
> >> +
> >> +static void scif_uart_suspend(struct serial_port *port)
> >> +{
> >> +    struct scif_uart *uart =3D port->uart;
> >> +
> >> +    scif_uart_stop_tx(port);
> >> +    scif_uart_disable(uart);
> >> +}
> >> +
> >> +static void scif_uart_resume(struct serial_port *port)
> >> +{
> >> +    struct scif_uart *uart =3D port->uart;
> >> +    const struct port_params *params =3D uart->params;
> >> +    uint16_t ctrl;
> >> +
> >> +    scif_uart_init_preirq(port);
> This will also call scif_uart_disable() that was already invoked during s=
uspend.
> Why do we need to re-disable it when resuming?

Thanks for the question.

Yes, resume calls scif_uart_init_preirq(), which in turn calls
scif_uart_disable(). This is intentional.

- While Xen is suspended, EL3 firmware (e.g. TF-A) may use an early
  or runtime console and reconfigure the SCIF, including enabling
  TX. Re-disabling gives a quiescent baseline.

- PSCI does not guarantee device state across SYSTEM_SUSPEND; device
  preconditions are outside PSCI's scope. We cannot rely on the state
  Xen left before suspend.

- We reuse scif_uart_init_preirq() on resume to keep a single,
  well-tested initialization path identical to cold boot. This avoids
  split logic and keeps behavior consistent.

- The extra disable is idempotent and cheap (FIFO/status clear), while
  preventing spurious data on bring-up.

I can add an inline comment to make this explicit:

/* On resume, EL3/firmware may have touched SCIF (early/runtime
 * console). Disable again to start from a clean, quiescent state
 * before reinit; reuse scif_uart_init_preirq() to keep the cold-boot
 * sequence.
 */

>
> Other than that:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>

Best regards,
Mykola

