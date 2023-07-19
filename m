Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2AD7591E9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565719.884136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3lA-0004I1-Rk; Wed, 19 Jul 2023 09:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565719.884136; Wed, 19 Jul 2023 09:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3lA-0004GK-Ox; Wed, 19 Jul 2023 09:46:16 +0000
Received: by outflank-mailman (input) for mailman id 565719;
 Wed, 19 Jul 2023 09:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8L3=DF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qM3l8-0004G6-Vy
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:46:15 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19127ded-2619-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:46:13 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-634f59e7d47so36651106d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 02:46:13 -0700 (PDT)
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
X-Inumbo-ID: 19127ded-2619-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689759972; x=1690364772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIC5XWMIY4srebN43oLmEIGgSwbY2kIXDCSH1F1uzp8=;
        b=Opt3aQkMYsoC3EcMK8+5hSqp0GjLcjEbgPJwXZ9FjBh+o+0FPKgVxbQKhhJyKHmZcF
         GSZDzC8DD6v59x0NEN8yF9GhIzbvaMaLm23ZX9Ouv3dAWnYT+4vlHiJlYTd+dEoFfE1Q
         bMdSrLSLaabYuH+BjjEzl0y1ZXKV7FiY+LYReEdHGkO6VQeTWybiduVyqdPynPmn0aIi
         H/O0IFnxCilWeYoLdWFWAPJrUFQF5AzTUbAHoBN4tdUXeO+1K0YJb+KHvBfJaFuTuAbs
         oxQp0iB3yRDRpBHEqYKKilD1C1eJXzZ6w03gzon/ICrQv4spKocpIOQ1qpjWi4YCMowH
         KbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689759972; x=1690364772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIC5XWMIY4srebN43oLmEIGgSwbY2kIXDCSH1F1uzp8=;
        b=YqzOa32lt5kEPbshDp9gWFjNqxVVbuaP0kUyzbYisgTCS5GIdHL7KJIAua7nOOR8nq
         gO7GmwO6aX2lX8Bzs5uwQZkYMXnBZrNtHyAzYEwPKSBR5vjZ4jxHPlZeXU+5RYzqZ5bu
         UiEaKHXxvlNF0l3d1OMdWef2aBD8Y/cWEE9pym+GaKR2dE5uQRAso6euR7jB60JZl/A2
         nECwXsopZZX9A9USC0eQXw3BuffDYhouOQRH/kmudxSKGlmYUI09rHtTV4BmD3zv2Wk2
         1YV0Cwv46VXlJaHcvcxynlvvxx2x3BfbOKpkq0Z5nlRfnIL9NQFlO+tvDqP6gldaUodh
         ixbA==
X-Gm-Message-State: ABy/qLZucgE6REk4rFp3/5JhLl1rrFaOEMT385Mr/Dj04GgNUopSH5/s
	dWItmDZy9Zn4+KAEXxTrgipO6MoaO9phV6Vz+MdZbjuwFnEgxSyl
X-Google-Smtp-Source: APBJJlGD23QcP3bVnQEYNIahp0B64HJ6gwqAxNi1RMBEARRZmOTszNffCcPJzG08aVH46veJwa9yX9GHlMkuA6LOvZg=
X-Received: by 2002:a0c:e093:0:b0:636:60c6:203d with SMTP id
 l19-20020a0ce093000000b0063660c6203dmr4923928qvk.35.1689759972616; Wed, 19
 Jul 2023 02:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-14-jens.wiklander@linaro.org> <88B6CFB1-81B3-4B55-AF8E-2BA8970CA5BB@arm.com>
In-Reply-To: <88B6CFB1-81B3-4B55-AF8E-2BA8970CA5BB@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Jul 2023 11:46:01 +0200
Message-ID: <CAHUa44G8BkcWv6HSnDW6uMQYSaCrTqoN9YdL9rkWRvDnvqNGzg@mail.gmail.com>
Subject: Re: [XEN PATCH v10 13/24] xen/arm: ffa: support mapping guest RX/TX buffers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Tue, Jul 18, 2023 at 12:10=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds support in the mediator to map and unmap the RX and TX buffers
> > provided by the guest using the two FF-A functions FFA_RXTX_MAP and
> > FFA_RXTX_UNMAP.
> >
> > These buffer are later used to transmit data that cannot be passed in
> > registers only.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 138 +++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 138 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index d755363de686..ffabb5ed0a80 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -74,6 +74,12 @@
> >  */
> > #define FFA_RXTX_PAGE_COUNT             1
> >
> > +/*
> > + * Limits the number of pages RX/TX buffers guests can map.
>
> Typo: s/Limits/Limit/

OK

>
> > + * TODO support a larger number.
> > + */
> > +#define FFA_MAX_RXTX_PAGE_COUNT         1
> > +
> > /*
> >  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
> >  * BIT(31): Framework or partition message
> > @@ -169,6 +175,12 @@ struct ffa_partition_info_1_1 {
> > };
> >
> > struct ffa_ctx {
> > +    void *rx;
> > +    const void *tx;
> > +    struct page_info *rx_pg;
> > +    struct page_info *tx_pg;
> > +    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> > +    unsigned int page_count;
> >     /* FF-A version used by the guest */
> >     uint32_t guest_vers;
> >     /*
> > @@ -176,6 +188,7 @@ struct ffa_ctx {
> >      * ffa_domain_teardown() to know which SPs need to be signalled.
> >      */
> >     uint16_t create_signal_count;
> > +    bool rx_is_free;
> > };
> >
> > /* Negotiated FF-A version to use with the SPMC */
> > @@ -371,6 +384,11 @@ static void set_regs(struct cpu_user_regs *regs, r=
egister_t v0, register_t v1,
> >         set_user_reg(regs, 7, v7);
> > }
> >
> > +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_=
code)
> > +{
> > +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> > +}
> > +
> > static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> >                              uint32_t w3)
> > {
> > @@ -392,6 +410,106 @@ static void handle_version(struct cpu_user_regs *=
regs)
> >     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> > }
> >
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
> > +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
> > +    {
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
> > +    if ( !tx_pg )
> > +        return FFA_RET_INVALID_PARAMETERS;
>
> Please add a newline here

OK

>
> > +    /* Only normal RW RAM for now */
> > +    if ( t !=3D p2m_ram_rw )
> > +        goto err_put_tx_pg;
> > +
> > +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P=
2M_ALLOC);
> > +    if ( !tx_pg )
> > +        goto err_put_tx_pg;
>
> Please add a newline here

OK

Thanks,
Jens

>
> > +    /* Only normal RW RAM for now */
> > +    if ( t !=3D p2m_ram_rw )
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
> > +    ctx->rx_is_free =3D true;
> > +    return FFA_RET_OK;
> > +
> > +err_unmap_tx:
> > +    unmap_domain_page_global(tx);
> > +err_put_rx_pg:
> > +    put_page(rx_pg);
> > +err_put_tx_pg:
> > +    put_page(tx_pg);
> > +
> > +    return ret;
> > +}
> > +
> > +static void rxtx_unmap(struct ffa_ctx *ctx)
> > +{
> > +    unmap_domain_page_global(ctx->rx);
> > +    unmap_domain_page_global(ctx->tx);
> > +    put_page(ctx->rx_pg);
> > +    put_page(ctx->tx_pg);
> > +    ctx->rx =3D NULL;
> > +    ctx->tx =3D NULL;
> > +    ctx->rx_pg =3D NULL;
> > +    ctx->tx_pg =3D NULL;
> > +    ctx->page_count =3D 0;
> > +    ctx->rx_is_free =3D false;
> > +}
> > +
> > +static uint32_t handle_rxtx_unmap(void)
> > +{
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> > +    if ( !ctx->rx )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    rxtx_unmap(ctx);
> > +
> > +    return FFA_RET_OK;
> > +}
> > +
> > static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint=
32_t fid)
> > {
> >     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> > @@ -448,6 +566,7 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
> >     uint32_t fid =3D get_user_reg(regs, 0);
> >     struct domain *d =3D current->domain;
> >     struct ffa_ctx *ctx =3D d->arch.tee;
> > +    int e;
> >
> >     if ( !ctx )
> >         return false;
> > @@ -460,6 +579,22 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> >     case FFA_ID_GET:
> >         set_regs_success(regs, get_vm_id(d), 0);
> >         return true;
> > +    case FFA_RXTX_MAP_32:
> > +    case FFA_RXTX_MAP_64:
> > +        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg=
(regs, 2),
> > +                            get_user_reg(regs, 3));
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> > +    case FFA_RXTX_UNMAP:
> > +        e =3D handle_rxtx_unmap();
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> >     case FFA_MSG_SEND_DIRECT_REQ_32:
> >     case FFA_MSG_SEND_DIRECT_REQ_64:
> >         handle_msg_send_direct_req(regs, fid);
> > @@ -551,6 +686,9 @@ static int ffa_domain_teardown(struct domain *d)
> >                    get_vm_id(d), subscr_vm_destroyed[n], res);
> >     }
> >
> > +    if ( ctx->rx )
> > +        rxtx_unmap(ctx);
> > +
> >     XFREE(d->arch.tee);
> >
> >     return 0;
> > --
> > 2.34.1
> >
>
> Cheers
> Bertrand
>
>

