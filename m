Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B293C67A31
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164314.1491317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEli-0006mP-QP; Tue, 18 Nov 2025 06:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164314.1491317; Tue, 18 Nov 2025 06:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEli-0006kn-NN; Tue, 18 Nov 2025 06:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1164314;
 Tue, 18 Nov 2025 06:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLElh-0006JB-2C
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:00:45 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e92f1495-c443-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 07:00:40 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-59583505988so5584488e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:00:40 -0800 (PST)
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
X-Inumbo-ID: e92f1495-c443-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445640; x=1764050440; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH2WvzXiMYoh2E1E9Vmt2V7z9YyguiRZ31Wqr+ddZiE=;
        b=mYUtr7mt/lVUjvNQF9ytsY5ysun/+h7ozYlVpduMf2qKjXqhD5DLhRawH/pgf/n6iF
         4CKZqW4xAiNMOwX3Rk+T/AM2uyB3lFucF6Q2O6WSj9EaPoOE3w9bFlJi1vmnZ7WivPko
         dZyXXoJ/aVfvKKdyqQL7F3nIQPNlOY5DzpRPesNRgM+LTlnPjXs+eFp3zpBOAb+d4o2p
         8CjpcqyNa+nhFvY+jqUs/ueWGZxwvaJaKMRNRIm0uw5v3wxDhh22DGqkH06axkyCyP19
         fL87TRT4+uQ+xw30lzP4wXsZ7CarKC1WixLKbuqfMxUsj/YAqENItwuIMvbixsQ5XtBG
         e2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445640; x=1764050440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VH2WvzXiMYoh2E1E9Vmt2V7z9YyguiRZ31Wqr+ddZiE=;
        b=d4l3YVvZfsDvlq76yjHWUON2qlZcgZgcTv57/hJvmsppgfYflcdzeprHAqB/iZgYBc
         yzThNAH9VJ59ArJxS2fKN01CxyLQ1TWuvcMlLg+ZwDt2jUBJBHVmfTPSJAK+jUUdYxAe
         yekqNuVcwl0NvjLR+FPA5jAi1z3Un9X6D0zTjCUY59fai7ZxFHUtazI0NjIqAmdEvM4/
         hIIy+SMi/tO4MxsHPYVNqOL1DPQGutZI5SVkAnawwrFe/fcWfST7ct9spUX+YNni0xQD
         l2HhdtTGHR3APrqeSxo+xM9ULN8LkW/0w4ivA3Vzz0j4IjbApq0xCqCHizcWL7ECLJMs
         5Iig==
X-Gm-Message-State: AOJu0Yw6x9GxRG3nCyh9jXpMS6z7xw2Wt6Hgi6hqkh31aV0jrWZMDW1+
	a9kE4sznKJWOWpgRv7FL0ZDRQ1lSQlHL3D9WdhstPfOzF+sKQB7WN3DEsXaVe1LaXscsa1Jy3df
	9WKXw3XfDH/EsxrZaSchzFimo24B1ftQ=
X-Gm-Gg: ASbGncuAn8fEygnS6z2sVdmeljg8/1hRt/k12J5mDtVeBxGz68mo2Cb0RbRJd8WlI9X
	MI0xIEulevNyq/nDyCh6FWvr0bmrw2SKEN5oQOAz5IrWRAbkkSRECFWjOqMUfHdrN7azbhwek3f
	PkcgmDkHPJ5OCQksCeKErpbhRCeuGtw4rbf7cqxn+uyZsnZMEy0ExObNBfHS+0g6rqpadPUaiGN
	aSfzpre3M+zc33xavRPKWO6W12SkUe+COUs7buF3/eMg6XQcQ9+Fm0Mv9E1pUG4uPLT0A==
X-Google-Smtp-Source: AGHT+IEhnIXSSxPYhcY0neTxlyHZDADmVNVbCDzQa3tkMUh6vAVxQBqibLLARfkLnU86UWSWZeFQiQbzRudujMMTAPg=
X-Received: by 2002:a05:6512:1113:b0:595:7e4f:3eb2 with SMTP id
 2adb3069b0e04-59598751575mr743503e87.10.1763445639603; Mon, 17 Nov 2025
 22:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-13-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-13-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_bl6OzXPtJeNBojF9QPHAp86dF_WXx9vdKlOmDW2CkN9ze4sOLtJSxzf6HQ
Message-ID: <CAGeoDV_g0kTbTMq4dSXWjzBD5Gjf2CVTxgPRWPZ23dRV3QCjzA@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] emul/ns16550: implement dump_state() hook
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
> Implement dump_state() vUART hook for debugging UART state machine over X=
en
> console. dump_state() prints state of all emulated registers (including
> state-less IIR) and state of RX/TX FIFOs.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - n/a
> ---
>  xen/common/emul/vuart/ns16x50.c | 59 ++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index a92df6923aa5..c341f012d005 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -640,6 +640,58 @@ static int ns16x50_io_read(
>      return rc;
>  }
>
> +static void cf_check ns16x50_dump_state(void *arg)
> +{
> +#ifdef CONFIG_VUART_NS16X50_DEBUG
> +    struct vuart_ns16x50 *vdev =3D arg;
> +    const struct domain *d =3D vdev->owner;
> +    const struct vuart_info *info =3D vdev->info;
> +    const struct xencons_interface *cons;
> +    const uint8_t *regs;
> +
> +    if ( !vdev )

Is this NULL check actually useful here? At this point we=E2=80=99ve alread=
y
dereferenced vdev (vdev->owner / vdev->info), so if arg could be NULL
we=E2=80=99d already be in UB. Either the hook never receives NULL (and we =
can
drop the check or turn it into ASSERT(vdev)), or the check should be
moved before the first dereference.

> +        return;
> +
> +    /* Allow printing state in case of a deadlock. */
> +    if ( !spin_trylock(&vdev->lock) )
> +        return;
> +
> +    cons =3D &vdev->cons;
> +    regs =3D &vdev->regs[0];
> +
> +    printk("Virtual " pr_prefix " (%s) I/O port 0x%04x IRQ#%d owner %pd\=
n",
> +            vdev->name, info->base_addr, info->irq, d);
> +
> +    printk("  RX FIFO size %ld in_prod %d in_cons %d used %d\n",
> +            ARRAY_SIZE(cons->in), cons->in_prod, cons->in_cons,
> +            cons->in_prod - cons->in_cons);
> +
> +    printk("  TX FIFO size %ld out_prod %d out_cons %d used %d\n",
> +            ARRAY_SIZE(cons->out), cons->out_prod, cons->out_cons,
> +            cons->out_prod - cons->out_cons);
> +
> +    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DL=
M %02"PRIx8"\n",
> +            UART_RBR,

Should this be using cons->in / cons->out instead of cons?

> +            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
> +            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],

As written, MASK_XENCONS_IDX() gets &vdev->cons (struct pointer), not the
RX/TX arrays themselves, so its size/index calculation will use the size
of the pointer/struct rather than the in[]/out[] ring size. I think this
should be:

    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)],
    cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)],


Best regards,
Mykola


> +            regs[NS16X50_REGS_NUM + UART_DLL],
> +            regs[NS16X50_REGS_NUM + UART_DLM]);
> +
> +    printk("  %02"PRIx8" IER %02"PRIx8"\n", UART_IER, regs[UART_IER]);
> +
> +    printk("  %02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
> +            UART_FCR, regs[UART_FCR], ns16x50_iir_get(vdev));
> +
> +    printk("  %02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, regs[UART_LCR]);
> +    printk("  %02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, regs[UART_MCR]);
> +    printk("  %02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, regs[UART_LSR]);
> +    printk("  %02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, regs[UART_MSR]);
> +    printk("  %02"PRIx8" SCR %02"PRIx8"\n", UART_SCR, regs[UART_SCR]);
> +
> +    spin_unlock(&vdev->lock);
> +#endif /* CONFIG_VUART_NS16X50_DEBUG */
> +}
> +
>  /*
>   * Emulate I/O access to ns16x50 register.
>   * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is en=
abled.
> @@ -709,6 +761,9 @@ static int cf_check ns16x50_io_handle(
>
>      spin_unlock(&vdev->lock);
>
> +    if ( ns16x50_log_level >=3D 3 )
> +        ns16x50_dump_state(vdev);
> +
>      if ( rc =3D=3D 0 )
>          ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"P=
RIx32"\n",
>                        op, addr, size, dlab, reg, *data);
> @@ -844,6 +899,8 @@ static int cf_check ns16x50_put_rx(void *arg, char ch=
)
>      }
>
>      spin_unlock(&vdev->lock);
> +    if ( ns16x50_log_level >=3D 3 )
> +        ns16x50_dump_state(vdev);
>
>      return rc;
>  }
> @@ -853,7 +910,7 @@ static int cf_check ns16x50_put_rx(void *arg, char ch=
)
>      .compatible =3D "ns16550",            \
>      .alloc      =3D ns16x50_alloc,        \
>      .free       =3D ns16x50_free,         \
> -    .dump_state =3D NULL,                 \
> +    .dump_state =3D ns16x50_dump_state,   \
>      .put_rx     =3D ns16x50_put_rx,       \
>  }
>
> --
> 2.51.0
>
>

