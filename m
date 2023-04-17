Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFE6E3FCB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 08:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521748.810578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poILb-0001Ma-Fa; Mon, 17 Apr 2023 06:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521748.810578; Mon, 17 Apr 2023 06:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poILb-0001Kr-Bi; Mon, 17 Apr 2023 06:28:19 +0000
Received: by outflank-mailman (input) for mailman id 521748;
 Mon, 17 Apr 2023 06:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5U/i=AI=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1poILa-0001Ki-7z
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 06:28:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09caec83-dce9-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 08:28:17 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so380484f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 16 Apr 2023 23:28:16 -0700 (PDT)
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
X-Inumbo-ID: 09caec83-dce9-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712896; x=1684304896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tQQU4zJUs1IaMa5esJ+nKNalf4Avzhr/SufnUx+NCw=;
        b=cqzTcONMfhf0RcHZqKcTVBQJN0AItWw4f94hORDEuT6ZleTKHHrHdyU16QVoI/gDvx
         xyKkWtmAbhOXwsXAdl5BcqH9b162apqmFWtWFgB+MP1+WbWCmLW8v2QSzs71kKc8LFPl
         pR4sX7AuKzZQA8Hntd6tN7sgEi0T+NuTKur0MJyTIDlFvA2CG58cU8h7mnGbRuFIVfbg
         BX2zNprTWnEpYoWy2WsAAmyPN25OKHimkYoKYwfiJl8GKPvcWNa7hQ2PGAvKc0tzK0L0
         uzePbQlIu4aWfmVO36U7NQ8Wt1XRm18cATrRSTfz2KNhoTLr4Y4bCooLxIMuCcBLxnqT
         gLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712896; x=1684304896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tQQU4zJUs1IaMa5esJ+nKNalf4Avzhr/SufnUx+NCw=;
        b=DrGklLCcnk/vGx4OGel+zS5Qcd98ODOsvoeaQeMk6gtjJW9m1fCuNa4HHnWPQ7NYZW
         kOinBe9sr7BUmQFQsQUNp53dukAIWnhnWhjy3/t+jubMHCZCHmDl/u2CZ8OlNChPNiP+
         J0o/gF61gpUQmO6TGs2iAB5XnCPshcFv0Vic9xqQLs2853oHdtvjPbQn6OgDz1Zk2k+4
         o1j+2iA+w1A4jl3XQRZNQ0XvApFySwBV2wUx/EPIkWwXxi0lIWI9tRhCi/QTX8Iy0TFC
         iJFlt7NvLDGZvxDKXYocxgjEqOQDCalgSZmFzhMiDKGrQuHVOtDgzb16LGsqKoybfR8Z
         usCw==
X-Gm-Message-State: AAQBX9fOzZWBbQ2ZaltuU3S333JabhkkAouN4DFuIRP/J46Ifkvw9Vuz
	Zoj4uy2BWAYZ1j66+kiWUBvpIudPyndZifqu7AOwPg==
X-Google-Smtp-Source: AKy350ajAuC1xjTVg5v5AturCDM83O5kaI0/c/FQjeKQVMfKROSCEqOeYV+8pG7SLj+9HqFNthaYCLGzTLNWkz3K5t0=
X-Received: by 2002:a05:6000:1049:b0:2f5:6a2f:660f with SMTP id
 c9-20020a056000104900b002f56a2f660fmr1059730wrx.3.1681712896384; Sun, 16 Apr
 2023 23:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-13-jens.wiklander@linaro.org> <6d1b8904-374c-4392-6945-2746f97c31f6@xen.org>
In-Reply-To: <6d1b8904-374c-4392-6945-2746f97c31f6@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 17 Apr 2023 08:28:05 +0200
Message-ID: <CAHUa44HHHycgzsYhArkgVncbFP+GE1qEU7mOcUcp7TYgon8tWA@mail.gmail.com>
Subject: Re: [XEN PATCH v8 12/22] xen/arm: ffa: support mapping guest RX/TX buffers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Apr 13, 2023 at 10:31=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 13/04/2023 08:14, Jens Wiklander wrote:
> > +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> > +                                register_t rx_addr, uint32_t page_coun=
t)
> > +{
> > +    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +    struct page_info *tx_pg;
> > +    struct page_info *rx_pg;
> > +    p2m_type_t t;
> > +    void *rx;
> > +    void *tx;
> > +
> > +    if ( !smccc_is_conv_64(fid) )
> > +    {
> > +        /*
> > +         * Calls using the 32-bit calling convention must ignore the u=
pper
> > +         * 32 bits in the argument registers.
> > +         */
> > +        tx_addr &=3D UINT32_MAX;
> > +        rx_addr &=3D UINT32_MAX;
> > +    }
> > +
> > +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT ) {
>
> Coding style:

OK

>
> if ( ... )
> {
>
> > +        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (l=
imit %u)\n",
> > +               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +
> > +    /* Already mapped */
> > +    if ( ctx->rx )
> > +        return FFA_RET_DENIED;
> > +
> > +    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P=
2M_ALLOC);
>
> I might be missing something. Here you only get the reference on one
> page. Per the value of FFA_MAX_RXTX_PAGE_COUNT, it looks like the buffer
> can be up to 32 pages.
>
> Can you clarify?

Good catch. I'll reduce FFA_MAX_RXTX_PAGE_COUNT to 1 since that's what
I've been testing with. I'll add a TODO for supporting a larger
number.

>
> > +    if ( !tx_pg )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +    /* Only normal RAM for now */
> > +    if ( !p2m_is_ram(t) )
>
> p2m_is_ram() would allow RAM page marked read-only in stage-2. Is it
> intended?
>
> If not, then I think you want to use t !=3D p2m_ram_rw.

Thanks, I'll update it.

>
> > +        goto err_put_tx_pg;
> > +
> > +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P=
2M_ALLOC);
> > +    if ( !tx_pg )
> > +        goto err_put_tx_pg;
> > +    /* Only normal RAM for now */
> > +    if ( !p2m_is_ram(t) )
>
> Same here.

OK

Thanks,
Jens

>
> > +        goto err_put_rx_pg;
> > +
> > +    tx =3D __map_domain_page_global(tx_pg);
> > +    if ( !tx )
> > +        goto err_put_rx_pg;
> > +
> > +    rx =3D __map_domain_page_global(rx_pg);
> > +    if ( !rx )
> > +        goto err_unmap_tx;
> > +
> > +    ctx->rx =3D rx;
> > +    ctx->tx =3D tx;
> > +    ctx->rx_pg =3D rx_pg;
> > +    ctx->tx_pg =3D tx_pg;
> > +    ctx->page_count =3D page_count;
> > +    ctx->tx_is_free =3D true;
> > +    return FFA_RET_OK;
>
> Cheers,
>
> --
> Julien Grall

