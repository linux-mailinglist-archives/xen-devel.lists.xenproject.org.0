Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3DCC67A28
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164317.1491328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEll-000767-37; Tue, 18 Nov 2025 06:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164317.1491328; Tue, 18 Nov 2025 06:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElk-00074u-VE; Tue, 18 Nov 2025 06:00:48 +0000
Received: by outflank-mailman (input) for mailman id 1164317;
 Tue, 18 Nov 2025 06:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLEli-00062J-Ud
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:00:46 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc0c658-c443-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 07:00:46 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59578e38613so5469052e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:00:46 -0800 (PST)
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
X-Inumbo-ID: ecc0c658-c443-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445646; x=1764050446; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91oMGXh1mG+b/qR2D7O5Na00nBE0+P0/h/TFyb+qF7o=;
        b=c7xJKs0jd+ogyY4WI48zHD0/yd66t+XQEMaluiu6JoPIwAkYoBZh62IntuRy50PCH/
         OoCdPIr62/FhNGL5qbypEDCs7wB0Rt8dSY6qjZ5yoBvYYOeygShqc8Y5YnylpwAISHYV
         yd7KLwqQsV9Ov13xt017aRiYw009/czRjbFKPjCFQe05jwit/oqFbnNsggNgNIujvjRY
         KBnaVIBoMYVqVw8nyouG+lOk/hAQ2UGEEser/MvnxcyJvX/zmuqg3DHA4gUVJC4XAemO
         TK4qwt7Toa8x7wkGCmCrf+8KXFmlCHG1ExvKtRkNrzKXB/Ar2gzl5wj0q4DDtZIETj4/
         7ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445646; x=1764050446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=91oMGXh1mG+b/qR2D7O5Na00nBE0+P0/h/TFyb+qF7o=;
        b=jX8MrYa2+9geljI0dVPkOtBIzPY4Lxit38bTQk49dv0YoqVfzavtQmnvljzyagr7Sw
         6X7EL1Yx7YwExl3Mx7VWhlZE6exjPaP0OS3Wn+Dtg4oKc47+X06mKYwvNYIKA1v8Chmz
         4nVcU8Ln/c8EIttt92FGZU12qNjcqF3ojoiIDEh1ecioRCPEc6rPEbixKWqmS+gnyvOF
         m+oFuernqqmXEUFTWJAyCqVUzVNRGFiyn08mXd4H6jAhJJ86MGaHjVkBe8D8Y/tW4Aq2
         fWeDyPEWBBhLgPnto4POQ1BQM82tRxaWeMcLCRPi0o7HnGg4q68N8yDI68a4A6yafXB+
         IhSg==
X-Gm-Message-State: AOJu0YzuuV2bfn1mO345f61+M8b5wCZI8BeOGuNbjxNkpHJ4SANZcB/p
	xGbofOFQcbyNARxiao+Ms/3CsZytgX4xmJaFSTCQRb5KmZUoU/rzaxEYEW1R5uc1eK+Rse0YSty
	t0jro3NAjMy4rULoxCbL2cCXT/02KGZI8JtKl
X-Gm-Gg: ASbGncurqpuAuidg8AM98EHmczc/kwllM9hZ3mEn+UsO7BHF9CeBLyQB40NCDTsYOdF
	AT5jdw+cYOjPEwaRUXCuH0dTnXpcrbmrEsergTiI/dKgoRg0mFo+JMuTNAcTSbDCKpzBdCs6NgU
	Aa71+1JpSdxsMYqfilvKttRkQu6dIVa9E/367D4nVbzoBPjsheCfMa/O0mTb0sGN8rX6KGjE6EP
	rimAGqQwr+F4PpyFVrjEjTzxnlV5EtIraq7xONyU2AN4cKKo9J9qvvPldhJTIfFOQoRPA==
X-Google-Smtp-Source: AGHT+IFYJDxXNCtWIbUBdfdDUvuVfxT9wDBY2g6MdNFIYU0VdVXl2nhYbn+IdjBDZG6A+iB0pvdkW4WYkKiQDVKKBiA=
X-Received: by 2002:a05:6512:3e0a:b0:591:ec0f:fa92 with SMTP id
 2adb3069b0e04-5958419e9afmr5772873e87.3.1763445645665; Mon, 17 Nov 2025
 22:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-12-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-12-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_bkjUtXQctnnFd0Dy-YGJWqfEklliQtRnxhv8yfhgt7EZa_GS85Uk2mGQGk
Message-ID: <CAGeoDV-LLA3XQMORFgLU3fe8-Ueu9tJMFoAmmxmg4Oh80cK3Xw@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] emul/ns16x50: implement FCR register (write-only)
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 1:06=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add emulation logic for FCR register.
>
> Note, that does not hook FIFO interrupt moderation to the FIFO management
> code for simplicity.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - dropped UART_IIR_THR handling from UART_FCR_CLTX case
> ---
>  xen/common/emul/vuart/ns16x50.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 137ce08f4e1d..a92df6923aa5 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -374,6 +374,33 @@ static int ns16x50_io_write8(
>              regs[UART_IER] =3D val & UART_IER_MASK;
>              break;
>
> +        case UART_FCR: /* WO */
> +            if ( val & UART_FCR_RSRVD0 )
> +                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x=
\n",
> +                             UART_FCR_RSRVD0);
> +
> +            if ( val & UART_FCR_RSRVD1 )
> +                ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x=
\n",
> +                             UART_FCR_RSRVD1);

Do we really need these checks and prints?

> +
> +            if ( val & UART_FCR_CLRX )
> +            {
> +                ns16x50_fifo_rx_reset(vdev);

Note from the NS16550A datasheet:
Bit 0: This bit must be a 1 when other FCR bits are written to, or they
will not be programmed.

> +                regs[UART_LSR] &=3D ~UART_LSR_DR;
> +            }
> +
> +            if ( val & UART_FCR_CLTX )
> +                ns16x50_fifo_tx_reset(vdev);
> +
> +            if ( val & UART_FCR_ENABLE )
> +                val &=3D UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_M=
ASK;

Why can=E2=80=99t we just write back val as is, but with CLTX/CLRX cleared =
when
UART_FCR_ENABLE is set? For example:

    regs[UART_FCR] =3D val & ~(UART_FCR_CLTX | UART_FCR_CLRX);

> +            else
> +                val =3D 0;

If we take the above into account, I think we shouldn=E2=80=99t change the
content of FCR in the case where bit 0 is 0.

Also, from the spec:
=E2=80=9CResetting FCR0 will clear all bytes in both FIFOs.=E2=80=9D


Best regards,
Mykola



> +
> +            regs[UART_FCR] =3D val;
> +
> +            break;
> +
>          case UART_LCR:
>              regs[UART_LCR] =3D val;
>              break;
> --
> 2.51.0
>
>

