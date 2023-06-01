Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E2719AC0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 13:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542408.846231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gEb-00061X-EA; Thu, 01 Jun 2023 11:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542408.846231; Thu, 01 Jun 2023 11:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gEb-0005yP-Av; Thu, 01 Jun 2023 11:12:49 +0000
Received: by outflank-mailman (input) for mailman id 542408;
 Thu, 01 Jun 2023 11:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhak=BV=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1q4gEZ-0005y3-HU
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 11:12:47 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c61ff18-006d-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 13:12:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b1a6a8e851so1843541fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 04:12:46 -0700 (PDT)
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
X-Inumbo-ID: 3c61ff18-006d-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685617965; x=1688209965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qofz0hv4X7M+Q5bS6a11XmenLDXkc2fOL5tpkf9bWU0=;
        b=LqI+tAo+fouFe8SqblQ/2T649XwugOCBkJAbKCRaQjQnn2nkgQJBisPfTXzhKaE/B3
         2JX6cuF0jLDCstq/dahd1ja7MYUlTzTR85mvOg1z8L/N8eIhEQlNqz/YnRnyjXP2LFZ2
         6TSazWQVfXJygRFD3MdHZDCVXm+gqnPLFr0Ul9Bd4Q5sskul+dreLty4FLoLtJmZZLbx
         p9FYeI6fJWtsvutyZsAvThxMryGLnTLtisY+UbjpfmFrEb2Ks+QYIAEtwllUpSpviiVC
         hBupXaJpaeoO3XK/NfaBOqzcNiD8qLpmI+RO2+4xxJcNQUoGy1Y+cdwGAN8DPzlOkuLd
         d4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685617965; x=1688209965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qofz0hv4X7M+Q5bS6a11XmenLDXkc2fOL5tpkf9bWU0=;
        b=QfRT0I7DpBq8VlqzdPM4gwXAm3NV3bN6KrY1P25gKg05PXcnbdn5InRa5d3HfO4MYX
         1TmIgbDekJpDJAF3+cMXLjDyIJXyrKbWn2g2q43cuOan5ySxjwd8Bb/DzX9mbpssGZ8z
         aGNmHrliE2KFh4qXmpnF9ez8ro+IldrjbisgiTkcJVUF+kBO0Y4VCPkr+NbPqoYB5KxK
         xZtMtfTuCJx9k879J2KMaQhDc1eGbTWvQTCYPeztMajPYu5iYjbL9o9hFHdfxTjTEBPm
         gqepvvKGRiEfliuSlur9/z88qtxlj6wvNib9ypuGJb3W8qHmAfIvFuhOsnFQ5pLT0XBG
         aphQ==
X-Gm-Message-State: AC+VfDxQZQmFIb1A+aox6VZLCkmhH2NMRlWztEQJXp0yz+eGMkdocL1/
	XuEVTF2tSA2+x/B3TbOjzGOz/6tIP32C/KX6VzM=
X-Google-Smtp-Source: ACHHUZ7KIPOufvAgPNWZKY7VfVR9sAomuzjzDRRw5/8WsTtlIcxvhrKgFvzdRAyEBv8/tlwMpQ1SiPIkYROZMwMbdjE=
X-Received: by 2002:a2e:a445:0:b0:2a9:ee54:9fad with SMTP id
 v5-20020a2ea445000000b002a9ee549fadmr4387012ljn.7.1685617965168; Thu, 01 Jun
 2023 04:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230601085001.1782-1-michal.orzel@amd.com> <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
 <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
In-Reply-To: <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 1 Jun 2023 13:12:33 +0200
Message-ID: <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader compatibility
To: Michal Orzel <michal.orzel@amd.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000000a7e3105fd0f847b"

--0000000000000a7e3105fd0f847b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the formatting.

On Thu, 1 Jun 2023 at 12:31, Michal Orzel <michal.orzel@amd.com> wrote:

> Hi Bertrand,
>
> On 01/06/2023 12:19, Bertrand Marquis wrote:
> >
> >
> > Hi Michal,
> >
> >> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com> wrote:
> >>
> >> There are implementations of the PL011 that can only handle 32-bit
> >> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-widt=
h'
> >> dt property set to 4. On such UARTs, the current early printk code for
> >> arm64 does not work. To fix this issue, make all the accesses to be
> 32-bit
> >> by using ldr, str without a size field. This makes it possible to use
> >> early printk on such platforms, while all the other implementations
> should
> >> generally cope with 32-bit accesses. In case they do not, they would
> >> already fail as we explicitly use writel/readl in the runtime driver t=
o
> >> maintain broader compatibility and to be SBSAv2 compliant. Therefore,
> this
> >> change makes the runtime/early handling consistent (also it matches th=
e
> >> arm32 debug-pl011 code).
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
> >> 1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/arm64/debug-pl011.inc
> b/xen/arch/arm/arm64/debug-pl011.inc
> >> index 6d60e78c8ba3..80eb8fdc1ec7 100644
> >> --- a/xen/arch/arm/arm64/debug-pl011.inc
> >> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> >> @@ -25,9 +25,9 @@
> >>  */
> >> .macro early_uart_init xb, c
> >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> >> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor
> fraction) */
> >> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor
> fraction) */
> >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> >> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor
> integer) */
> >> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor
> integer) */
> >>         mov   x\c, #WLEN_8           /* 8n1 */
> >>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> >>         ldr   x\c, =3D(RXE | TXE | UARTEN)
> >> @@ -41,7 +41,7 @@
> >>  */
> >> .macro early_uart_ready xb, c
> >> 1:
> >> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
> >> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
> >>         tst   w\c, #BUSY             /* Check BUSY bit */
> >>         b.ne  1b                     /* Wait for the UART to be ready
> */
> >> .endm
> >> @@ -52,7 +52,7 @@
> >>  * wt: register which contains the character to transmit
> >>  */
> >> .macro early_uart_transmit xb, wt
> >> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
> >> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
> >
> > Is it really ok to drop the 8bit access here ?
> It is not only ok, it is necessary. Otherwise it won't work on the above
> mentioned UARTs (they can only perform 32-bit access).


IIRC some compilers will complain because you use wN with =E2=80=9Cstr=E2=
=80=9D.


> And following to what I wrote in commit msg:
> - we use str already in arm32 which results in 32-bit access


> - we use reald/writel that end up as str/ldr in runtime driver


> - we are down to SBSAv2 spec that runtime driver follows (meaning we can
> use early printk for SBSA too)


The runtime driver is meant to follow the PL011 spec first and may have
some adaptation for SBSA.


> - this way we support broader list of PL011s consistently (i.e. both earl=
y
> and runtime driver works as oppose to only runtime)


 I am not sure I agree here. You are focussing on HW that only support
32-bit access. And, AFAICT this shouldn=E2=80=99t be the norm.

I think it would be best if we have an option to select the width supported
and modify the code accordingly.

And yes, I know that there might be some issues in the runtime driver. But
they can be handled separately. With that we don=E2=80=99t promote a behavi=
our that
AFAICT is not meant to be normal.


>
> Also, before every early_uart_transmit we use ldrb (to convert to char)
> which means that the rest of the \wt register (8:31) is zero extended.
>
> ~Michal
>

--0000000000000a7e3105fd0f847b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><div dir=3D"auto">So=
rry for the formatting.</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 1 Jun 2023 at 12:31, Michal Orzel &lt=
;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">Hi Bertrand,<br>
<br>
On 01/06/2023 12:19, Bertrand Marquis wrote:<br>
&gt; <br>
&gt; <br>
&gt; Hi Michal,<br>
&gt; <br>
&gt;&gt; On 1 Jun 2023, at 10:50, Michal Orzel &lt;<a href=3D"mailto:michal=
.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; There are implementations of the PL011 that can only handle 32-bit=
<br>
&gt;&gt; accesses (i.e. no 16-bit or 8-bit), usually advertised by &#39;reg=
-io-width&#39;<br>
&gt;&gt; dt property set to 4. On such UARTs, the current early printk code=
 for<br>
&gt;&gt; arm64 does not work. To fix this issue, make all the accesses to b=
e 32-bit<br>
&gt;&gt; by using ldr, str without a size field. This makes it possible to =
use<br>
&gt;&gt; early printk on such platforms, while all the other implementation=
s should<br>
&gt;&gt; generally cope with 32-bit accesses. In case they do not, they wou=
ld<br>
&gt;&gt; already fail as we explicitly use writel/readl in the runtime driv=
er to<br>
&gt;&gt; maintain broader compatibility and to be SBSAv2 compliant. Therefo=
re, this<br>
&gt;&gt; change makes the runtime/early handling consistent (also it matche=
s the<br>
&gt;&gt; arm32 debug-pl011 code).<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd=
.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----<br>
&gt;&gt; 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm=
64/debug-pl011.inc<br>
&gt;&gt; index 6d60e78c8ba3..80eb8fdc1ec7 100644<br>
&gt;&gt; --- a/xen/arch/arm/arm64/debug-pl011.inc<br>
&gt;&gt; +++ b/xen/arch/arm/arm64/debug-pl011.inc<br>
&gt;&gt; @@ -25,9 +25,9 @@<br>
&gt;&gt;=C2=A0 */<br>
&gt;&gt; .macro early_uart_init xb, c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0x\c, #(7372800 / =
CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 strh=C2=A0 w\c, [\xb, #FBRD]=C2=A0 =
=C2=A0 =C2=A0 /* -&gt; UARTFBRD (Baud divisor fraction) */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0w\c, [\xb, #FBRD]=C2=
=A0 =C2=A0 =C2=A0 /* -&gt; UARTFBRD (Baud divisor fraction) */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0x\c, #(7372800 / =
CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 strh=C2=A0 w\c, [\xb, #IBRD]=C2=A0 =
=C2=A0 =C2=A0 /* -&gt; UARTIBRD (Baud divisor integer) */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0w\c, [\xb, #IBRD]=C2=
=A0 =C2=A0 =C2=A0 /* -&gt; UARTIBRD (Baud divisor integer) */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0x\c, #WLEN_8=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 8n1 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0w\c, [\xb, #LCR_H=
]=C2=A0 =C2=A0 =C2=A0/* -&gt; UARTLCR_H (Line control) */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0x\c, =3D(RXE | TX=
E | UARTEN)<br>
&gt;&gt; @@ -41,7 +41,7 @@<br>
&gt;&gt;=C2=A0 */<br>
&gt;&gt; .macro early_uart_ready xb, c<br>
&gt;&gt; 1:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldrh=C2=A0 w\c, [\xb, #FR]=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* &lt;- UARTFR (Flag register) */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0w\c, [\xb, #FR]=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* &lt;- UARTFR (Flag register) */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst=C2=A0 =C2=A0w\c, #BUSY=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check BUSY bit */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://b.ne" rel=3D"no=
referrer" target=3D"_blank">b.ne</a>=C2=A0 1b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for the UART to be =
ready */<br>
&gt;&gt; .endm<br>
&gt;&gt; @@ -52,7 +52,7 @@<br>
&gt;&gt;=C2=A0 * wt: register which contains the character to transmit<br>
&gt;&gt;=C2=A0 */<br>
&gt;&gt; .macro early_uart_transmit xb, wt<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 strb=C2=A0 \wt, [\xb, #DR]=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* -&gt; UARTDR (Data Register) */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0\wt, [\xb, #DR]=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTDR (Data Register) */<br>
&gt; <br>
&gt; Is it really ok to drop the 8bit access here ?<br>
It is not only ok, it is necessary. Otherwise it won&#39;t work on the abov=
e mentioned UARTs (they can only perform 32-bit access).</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">IIRC some compilers will complain b=
ecause you use wN with =E2=80=9Cstr=E2=80=9D.</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)" dir=3D"auto"><br>
And following to what I wrote in commit msg:<br>
- we use str already in arm32 which results in 32-bit access</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)" dir=3D"auto"><br>
- we use reald/writel that end up as str/ldr in runtime driver</blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)" dir=3D"auto"><br>
- we are down to SBSAv2 spec that runtime driver follows (meaning we can us=
e early printk for SBSA too)</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">The runtime driver is meant to follow the PL011 spec first and =
may have some adaptation for SBSA.</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)" dir=3D"auto"><br>
- this way we support broader list of PL011s consistently (i.e. both early =
and runtime driver works as oppose to only runtime)</blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">=C2=A0I am not sure I agree here. You ar=
e focussing on HW that only support 32-bit access. And, AFAICT this shouldn=
=E2=80=99t be the norm.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
I think it would be best if we have an option to select the width supported=
 and modify the code accordingly.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">And yes, I know that there might be some issues in the runtime dr=
iver. But they can be handled separately. With that we don=E2=80=99t promot=
e a behaviour that AFAICT is not meant to be normal.</div><div dir=3D"auto"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Also, before every early_uart_transmit we use ldrb (to convert to char) whi=
ch means that the rest of the \wt register (8:31) is zero extended.<br>
<br>
~Michal<br>
</blockquote></div></div>

--0000000000000a7e3105fd0f847b--

