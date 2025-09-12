Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73935B543C4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 09:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121508.1465758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwy8U-0006RD-N1; Fri, 12 Sep 2025 07:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121508.1465758; Fri, 12 Sep 2025 07:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwy8U-0006O4-KS; Fri, 12 Sep 2025 07:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1121508;
 Fri, 12 Sep 2025 07:23:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8Qx=3X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uwy8T-0006Ny-Gg
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 07:23:57 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70db4044-8fa9-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 09:23:55 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5688ac2f39dso1798994e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 00:23:55 -0700 (PDT)
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
X-Inumbo-ID: 70db4044-8fa9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757661835; x=1758266635; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XBtKd030PtX4VgNSyh7U2rBK96P7C4gA9am3ktsEBw=;
        b=EVquBs0mBjcczyXbjrjtzfzjQMXRU/S2sro96YXeYCpzH9VOjHDKxi48Dt2xpfVHNA
         y6dBhSuVumNuh3ANHi25UF0RRPrEMLuAtccdsCiW/P7mVfBP7Ltk3mfl7ZdwUFPxj0gD
         xe4Po7GjG4K7eKrRGvOv2cjsswDEjW8N7fHPDXu9uFhqgNBA+upJh/9Ud5P4Gw+AYjli
         ULaLQFQxyisNgrj724ouM8NUunLAkyVtfZ2fNo70IxiiRwzBTjwfPFSGd4jxPrTsjoDD
         IgL8m5Wrb1Om5ygOoa0TcwskmZOEHPzgGl0fTLrx69akciTH/kjyY/aux383wkTu7t9z
         kTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757661835; x=1758266635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XBtKd030PtX4VgNSyh7U2rBK96P7C4gA9am3ktsEBw=;
        b=TDnqo4jKRe9Hw5xian2xqz1ntM45oVCwwH3CFwhveFjXkH6yMtZPWdV7Q2Ke6c7XpN
         GJcnr4kQjziF1a79jlBFf4t9QdAz1lGuzYh84EoBCbEvBwYqPb+jdFtg260bG0D68OYu
         EJ+9XAFGB0iXwCFljCypDyJ2FKHdVc+gS9Zjk5KNeuuienPaB0RfPsKzh1ZczJ4YaiOJ
         9j6g0ZN6+E5/QbvhWTtu8xlyHQ98pyfPY/3EQtQrNdBkGse9e+c5b4sb940TwC8GaHPL
         86m+s5SGdzhY+5DSEYZ9L8An1/yATQxpogyMlpLiM0pYDqudkg6U852X+JZWPKnK2W9q
         sYWA==
X-Gm-Message-State: AOJu0YyD3y1IBeDtFBakcNU5x41nLg9hEIq9N/93Hm2WnKghDHdjXpEh
	zXk9JiKzq5W27+/GnztU4uOQ943olTMVxBBTM2O4pXEAW5oT8eC4VkcX9XSqScoWOctCRv0nNP+
	Hm+jV5t14eWW+TJHzIRT9SNXwAwviRcY=
X-Gm-Gg: ASbGncvED+2PkH38LbH4z+0YO07PH7KYt6VleHl7SR8DoIitYo6kOzSVj6WfxkiQ1Am
	9EyhL2yHzsGVY1Sc1Hte4M9PXUykRaFcTuJO1mn/SIDM/qn1Nbq+LPX7e3sqU2ltWLK63c/5leg
	TxX8VpfaqYSwop0F7kfGKOBFF3TKh42TwdDQ/PWoP1gLIeTVmicNCKQQCnI1v5uB13wGayrEJxT
	81mH0Q3rktpBnn4
X-Google-Smtp-Source: AGHT+IHgwEP2w9zcActW5zsVd93iodZHaojQBpFqqXGFF7lbwNT9cefyZgGD08KypNHAIUAWfw5FoTXm9eEVdzNVhCo=
X-Received: by 2002:a05:6512:3599:b0:562:d04d:fa05 with SMTP id
 2adb3069b0e04-5704fb8634dmr517183e87.54.1757661834640; Fri, 12 Sep 2025
 00:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-6-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-6-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 12 Sep 2025 10:23:42 +0300
X-Gm-Features: Ac12FXwZPcQsXKAtGl9ieahyjpUhQXfZJ9pjXTrDT5SvYeWfKCjFAlREpZIQays
Message-ID: <CAGeoDV8PoGgYkXH89jSQYEq6faLcJ9Xe1GoeONDMeLhP95bAAA@mail.gmail.com>
Subject: Re: [PATCH v7 05/16] emul/ns16x50: implement SCR register
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add SCR register emulation to the I/O port handler.
> Firmware (e.g. OVMF) may use SCR during the guest OS boot.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - default handling of non-DLL/DLM registers moved to the previous patch
> ---
>  xen/common/emul/vuart/ns16x50.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index da8583a1dc93..5643ef4cc01e 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -106,6 +106,11 @@ static int ns16x50_io_write8(
>      {
>          switch ( reg )
>          {
> +        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
> +        case UART_SCR:
> +            regs[UART_SCR] =3D val;
> +            break;
> +
>          default:
>              rc =3D -EINVAL;
>              break;
> @@ -177,6 +182,10 @@ static int ns16x50_io_read8(
>      {
>          switch ( reg )
>          {
> +        case UART_SCR:
> +            val =3D regs[UART_SCR];
> +            break;
> +
>          default:
>              rc =3D -EINVAL;
>              break;
> --
> 2.51.0
>
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

