Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CBAB56FF9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 08:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124161.1466673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2H0-0001tF-NS; Mon, 15 Sep 2025 06:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124161.1466673; Mon, 15 Sep 2025 06:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy2H0-0001qJ-JP; Mon, 15 Sep 2025 06:01:10 +0000
Received: by outflank-mailman (input) for mailman id 1124161;
 Mon, 15 Sep 2025 06:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yszo=32=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uy2Gz-00011Y-73
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 06:01:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f06444e-91f9-11f0-9809-7dc792cee155;
 Mon, 15 Sep 2025 08:01:07 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f78e3cdf9so4333296e87.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 23:01:07 -0700 (PDT)
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
X-Inumbo-ID: 5f06444e-91f9-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757916067; x=1758520867; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iImlh/71Mnv5AjhQqadSQLy2vbzq1b5PoMNI95mShAw=;
        b=YH207ptCl7setXUMSLpoHLBLMvFKkGSSA0TkfK84akYxr/8GBb+B5lxk3eUlAO7+1Q
         h9A0KjeUhO7ZFTTboatG2rSIEr9sZCAfxDjmMvR6NF6QlMJUqoktxORlJ7voXrY2cenr
         lIf0dOBYaUuoVw2aQrHVCGatxqoI5fyAZ2Q7fyVDhCpvw/RnGkUA/HL4hm1I1727SgOY
         Sja5pCukvoszFh0LYS9YZhdS7NASjweYFj3aZGiVxlrT7+Zd63Lz9nHfcOnfVhQe94Cf
         BeMqJc5VPjevKCvPgWXpLv59Rhm9l6GO/i+bZl278lXdIqZo17DZHSPB+WFI/fbCJjym
         oUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757916067; x=1758520867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iImlh/71Mnv5AjhQqadSQLy2vbzq1b5PoMNI95mShAw=;
        b=CVMLrwDH8hJNhgSKQzsaOQPbrNGnigcbJu6DuNBa3WJF3K2IgyowBWQf/jX4sHzySy
         3w0Vp4HkInU9UJND9cDLoampK5QuseY4QqRen1aJpV1N2SPwOjAhmLNdtBRdp6Bl0sCf
         EdxQ5JGv8EzbKoi3yVMnGGEtjJBSqYMpRgtxCUgpCVmsVINe+fcfVKjOPwKZ3gPYzK1q
         IukUd87LldwESeKuiRQsmh9YpOlZu4XQe2R7eXPx3A5EZsqwXTi232jEqv06YS7uVROI
         9aeMNYS98vp6wBxnLFC+iUBhaOAGFnA36RdKrCfCe15ZQcuXG4I3wid3PSRGyRamHbM+
         At3A==
X-Gm-Message-State: AOJu0YziqoiffGOlAHa+d9ympuM2t6KvtvZrRFKFQrZ9CwOn+i+NW28z
	FWY/x1bFIzZ2coPMMFJcGs7beRn6yUCn2BwmOdSoDh6PUwWrANPc8OeibVHllh9ivacu093btGJ
	fRKJY8h7HYMZlDuNfqpnAJyEefiNpWzE=
X-Gm-Gg: ASbGncvDwS10tjKNnTYM7CpZ4tdqKs1HZ76bfu+1cxomWWXKviNx1Pfba3DcC0mUeER
	LimjlhnEg7DykJMuGJwWCW9zvcFmYHXwi/Qhiqzgq8ZCHYtPSuohK8FLsaTZmhB6hB3MaVvaE5b
	0vHNA2nHd4k3miF+gFVnssbxLEwHi7sQNSYPpWvIqCGr+wp4fouBgzkdOjYzgcSTh1TwK4DtkTx
	QypFeLxgR2hr5K01/J1KjnuP7I=
X-Google-Smtp-Source: AGHT+IFxrEzlLs++lPK5cYh0EJpAsaWR8l3JW7V/LWvCS5UuTUZ6YfzvxbY8woACJM1rt+gBeDWDuGLLE1lH3Aea1eo=
X-Received: by 2002:a05:651c:4397:20b0:337:e4cd:b2df with SMTP id
 38308e7fff4ca-3513db5a478mr30085001fa.20.1757916066689; Sun, 14 Sep 2025
 23:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-9-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-9-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 15 Sep 2025 09:00:00 +0300
X-Gm-Features: Ac12FXxQEVkBwcBctz-HGni0BeJU20yZFWmJwjNkTkRavWrkyzm1CjbwgBfuX1s
Message-ID: <CAGeoDV8iL374T7n=f_AQTA5VPfKThcEq-fN4X3kzWLzbjCzjew@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] emul/ns16x50: implement MCR/MSR registers
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
> Add MCR/MSR registers emulation to the I/O port handler.
>
> Add implementation of ns16x50_iir_check_msi().
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - fixed UART_MSR_TERI handling
> ---
>  xen/common/emul/vuart/ns16x50.c | 62 ++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index 0831a576cd9e..fdc20124d4c9 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -107,7 +107,7 @@ static bool cf_check ns16x50_iir_check_thr(const stru=
ct vuart_ns16x50 *vdev)
>
>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *v=
dev)
>  {
> -    return false;
> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
>  }
>
>  /*
> @@ -232,12 +232,63 @@ static int ns16x50_io_write8(
>              regs[UART_LCR] =3D val;
>              break;
>
> +        case UART_MCR: {

Probably the opening brace should be moved to the next line.
See CODING_STYLE:

Braces ('{' and '}') are usually placed on a line of their own, except
for:

- the do/while loop
- the opening brace in definitions of enum, struct, and union
- the opening brace in initializers
- compound literals

> +            uint8_t msr_curr, msr_next, msr_delta;
> +
> +            msr_curr =3D regs[UART_MSR];
> +            msr_next =3D 0;
> +            msr_delta =3D 0;
> +
> +            if ( val & UART_MCR_RSRVD0 )
> +                ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %x=
\n",
> +                             UART_MCR_RSRVD0);
> +
> +            if ( val & UART_MCR_TCRTLR )
> +                ns16x50_warn(vdev, "MCR: not supported: %x\n",
> +                             UART_MCR_TCRTLR);
> +
> +            if ( val & UART_MCR_RSRVD1 )
> +                ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %x=
\n",
> +                             UART_MCR_RSRVD1);
> +
> +            /* Set modem status */
> +            if ( val & UART_MCR_LOOP )
> +            {
> +                if ( val & UART_MCR_DTR )
> +                    msr_next |=3D UART_MSR_DSR;
> +                if ( val & UART_MCR_RTS )
> +                    msr_next |=3D UART_MSR_CTS;
> +                if ( val & UART_MCR_OUT1 )
> +                    msr_next |=3D UART_MSR_RI;
> +                if ( val & UART_MCR_OUT2 )
> +                    msr_next |=3D UART_MSR_DCD;
> +            }
> +            else
> +                msr_next |=3D UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS=
;
> +
> +            /* Calculate changes in modem status */
> +            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> +                msr_delta |=3D UART_MSR_DCTS;
> +            if ( (msr_curr & UART_MSR_DSR) ^ (msr_next & UART_MSR_DSR) )
> +                msr_delta |=3D UART_MSR_DDSR;
> +            if ( !(msr_curr & UART_MSR_RI) && (msr_next & UART_MSR_RI) )
> +                msr_delta |=3D UART_MSR_TERI;
> +            if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
> +                msr_delta |=3D UART_MSR_DDCD;

It looks like this could be simplified to something like:
    msr_delta =3D ((regs[UART_MSR] ^ msr_next) >> 4);

> +
> +            regs[UART_MCR] =3D val & UART_MCR_MASK;
> +            regs[UART_MSR] =3D msr_next | msr_delta;

Does this description for the first four bits of MSR:
    "... input to the chip has changed state since the last time it was
    read by the CPU"

mean that we shouldn't modify bits that are already set but have not yet
been read by the CPU?

> +
> +            break;
> +        }
> +
>          /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
>          case UART_SCR:
>              regs[UART_SCR] =3D val;
>              break;
>
>          case UART_LSR: /* RO */
> +        case UART_MSR: /* RO */
>          default:
>              rc =3D -EINVAL;
>              break;
> @@ -323,11 +374,20 @@ static int ns16x50_io_read8(
>              val =3D regs[UART_LCR];
>              break;
>
> +        case UART_MCR:
> +            val =3D regs[UART_MCR];
> +            break;
> +
>          case UART_LSR:
>              val =3D regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
>              regs[UART_LSR] =3D val & ~UART_LSR_MASK;
>              break;
>
> +        case UART_MSR:
> +            val =3D regs[UART_MSR];
> +            regs[UART_MSR] &=3D ~UART_MSR_CHANGE;
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

