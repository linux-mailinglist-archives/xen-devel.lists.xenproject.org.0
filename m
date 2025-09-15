Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F0B56FF8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 08:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124157.1466664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2Gp-0001Y1-G9; Mon, 15 Sep 2025 06:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124157.1466664; Mon, 15 Sep 2025 06:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2Gp-0001TY-CL; Mon, 15 Sep 2025 06:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1124157;
 Mon, 15 Sep 2025 06:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yszo=32=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uy2Gn-00011Y-9V
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 06:00:57 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57ef27e3-91f9-11f0-9809-7dc792cee155;
 Mon, 15 Sep 2025 08:00:55 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-355739c7fc8so7951381fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 23:00:55 -0700 (PDT)
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
X-Inumbo-ID: 57ef27e3-91f9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757916055; x=1758520855; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf5BgwxyPouvItWKO9mTHtFoYvHKxPMjCLUlJIi3GSM=;
        b=fUmT79vzUYaKU3dEhpltSVDv5DYe06IepttC7mqhiHISSV0DYfsF11vEzwc7N6oJfi
         3aohdycqP5sTcDWbz1Lje3YBzNCCe37rUtwapZMdAiGj9SfuLGKEjetOQV/qpxgYyJCH
         j//M0Eun6+3sow1Yf8zZQrC5PpnOrs761fZS0Aj/2sDTzOqYAyZa0R1dluzHbHKSuLbS
         aq1eooZLfYOu4UMa+MLdAaHNrNvP45hovJsjN2Jxzl7vfGsJnzJqjNS8OXmcMqYq4tAn
         lwPUE2DnsrTLN5db0Rbj9+OLx//85nsQyjWzKen7vCucibK/aCCjgl4YFBb/X2NL90Ck
         Hn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757916055; x=1758520855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nf5BgwxyPouvItWKO9mTHtFoYvHKxPMjCLUlJIi3GSM=;
        b=Nb6sjsqVe4ShgIEov7faEYL8aPkz6JlI1I35svqyAjglQKKwrA5uGAAx079jhRHf2d
         MrvilyYUiEHe1IXcPlIwQmQxV8wopERElSnMkG8ZIjJ7/APD7T8j6iogOzxMH4Uvsepo
         YbICumH5oGVA418d5PZ4cIoo4rhtOuojmAekYa8q7OIS3liEQzjMiTS34xxxjSwtt2v/
         5XA//3gi/mgme+lSZEdxBfBZvToDhMbbPsZVz2B5Mcc++XBmxeDReGxvKvNFxCx0+7iR
         opZVGjROLtyaebRgewBeig0aDsal+WX5e9eg4l+b52UrZEbwfQ1rKKuGElO383JPbuct
         hhfA==
X-Gm-Message-State: AOJu0YwXNf6OwHYnyUTOhmaTND5OITOXcAxg4vnV1pf62ur1bN2QmJL5
	BDjTH3qeoiCb5+U0JpLDt93V4PAauQv99s3E77Ki6L4qg813wKUppsVEUpTxOl0Aq9cokvsHt3E
	yhKACv7uzvSrtzTrj7uu0WlOMO2IBhng=
X-Gm-Gg: ASbGncu7E4GhmXmM6lWhhmP4XFpovSMh5MP6yymijfGKRRpTdoARYM9v6cpyVg+wdia
	ilSX9pTBfoJ4AhKieHbdGS4uL8rRX3in4iYIQyWFJoC4TRr6WWWJuAGi91db7Z/11+U9njLG8o2
	DNSfmRohQWzi5kbbRznvCw6b26xz1mjThHyHHPZsWu8s6FwekVEXhuPlMXb4s0mYKI4HrncM5uO
	uQ0Uw==
X-Google-Smtp-Source: AGHT+IH6oEq6KcuOeriJ1q5kNa8zylqQAHLc3b8zGq6vnqNEgyqfCEcTK2Hmkb/I80968+Il0BB+x3NrGa8dVLgBe0c=
X-Received: by 2002:a05:651c:23c2:20b0:338:beb:88c8 with SMTP id
 38308e7fff4ca-3513b484841mr24908501fa.19.1757916054931; Sun, 14 Sep 2025
 23:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-8-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-8-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 15 Sep 2025 09:00:00 +0300
X-Gm-Features: Ac12FXzqB87rPykqNLyXEIl1CERp8BxXK2CNufCeBhdrk1iaQg7cVuce44qz0H8
Message-ID: <CAGeoDV_ALHF7hMc-ZEtAyag==4kX5+XJw7AieqrAXyO1vXDYYQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/16] emul/ns16x50: implement LCR/LSR registers
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 1:16=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add LCR/LSR registers implementation to the I/O port handler.
>
> Add implementation of ns16x50_dlab_get() and ns16x50_iir_check_lsi().
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - n/a
> ---
>  xen/common/emul/vuart/ns16x50.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 664d799ddaee..0831a576cd9e 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -87,12 +87,12 @@ struct vuart_ns16x50 {
>
>  static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
>  {
> -    return 0;
> +    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
>  }
>
>  static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *v=
dev)
>  {
> -    return false;
> +    return vdev->regs[UART_LSR] & UART_LSR_MASK;
>  }
>
>  static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *v=
dev)
> @@ -228,11 +228,16 @@ static int ns16x50_io_write8(
>              regs[UART_IER] =3D val & UART_IER_MASK;
>              break;
>
> +        case UART_LCR:
> +            regs[UART_LCR] =3D val;

I understand that this register is mostly used to control the hardware
behavior, but I think we should pay attention to Bit 7 in this register:

    Bit 7: Divisor Latch Access Bit (DLAB). It must be set high (logic 1)
    to access the Divisor Latches of the Baud Generator during a read or
    write operation. It must be set low (logic 0) to access the Receiver
    Buffer, the Transmitter Holding Register, or the Interrupt Enable
    Register.

I know that you are checking it before accessing DLAB registers, but what
about accesses to RBR, THR, and IER?

> +            break;
> +
>          /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
>          case UART_SCR:
>              regs[UART_SCR] =3D val;
>              break;
>
> +        case UART_LSR: /* RO */

Is there a reason we cannot simply leave this unchanged?

>          default:
>              rc =3D -EINVAL;
>              break;
> @@ -314,6 +319,15 @@ static int ns16x50_io_read8(
>              val =3D ns16x50_iir_get(vdev);
>              break;
>
> +        case UART_LCR:
> +            val =3D regs[UART_LCR];
> +            break;
> +
> +        case UART_LSR:
> +            val =3D regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;

Why are UART_LSR_THRE and UART_LSR_TEMT set unconditionally?
What about UART_LSR_DR?

> +            regs[UART_LSR] =3D val & ~UART_LSR_MASK;

Maybe it would be good to mention why we are not resetting
UART_LSR_PE and UART_LSR_FE on read.

> +            break;
> +
>          case UART_SCR:
>              val =3D regs[UART_SCR];
>              break;
> --
> 2.51.0
>
>

Best regards,
Mykola

