Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5B6A951A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505752.778674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2ZB-0007jM-3L; Fri, 03 Mar 2023 10:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505752.778674; Fri, 03 Mar 2023 10:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2ZA-0007h7-VJ; Fri, 03 Mar 2023 10:23:08 +0000
Received: by outflank-mailman (input) for mailman id 505752;
 Fri, 03 Mar 2023 10:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pyx=63=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pY2Z9-0007gz-Cq
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:23:07 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6313b931-b9ad-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 11:23:06 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id g3so1744257wri.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:23:06 -0800 (PST)
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
X-Inumbo-ID: 6313b931-b9ad-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677838985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7yhbG7+TlcjBYIO1gAsPu0yEEKwY1GhKuxfl4tFw48=;
        b=XxNTmWsFegn6qn94QMP2X8m6sXIrD8fwDA0euxX0blEvbEN/otRhqSzJRzRkwOxTAi
         w86zCMie9Ne1Qxz5nVBg/38PaBaM6SEok3cBqK0tMu2YbGeek/vpXSd6sFeBE8S7O0BX
         /BhUcJaaKHiWllXrzikZWQO9lTW/kgvYTAGux2Q2L24BBsot5hPV94zdl8xQI0QpU3CS
         gGQQnVB6cyW5Iv0a5xvdTIfJ0u5Zmdq1XNCdn865jJYQbXVKJ70HQ+vXTwPnZ4LEEA4H
         eLLHFE94jnGSxwLQ/BwLHmYy/wqGPB6N7LKION3wwbY4Sl/pH6D1xC0uBY9BGclaYKiG
         l8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677838985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7yhbG7+TlcjBYIO1gAsPu0yEEKwY1GhKuxfl4tFw48=;
        b=Pdbu+EfaMZ4sAXVsuczzkVrjjD/iNH+sbIjYzA6FLdIsMOFA43xib9NRqwz8x5eb2c
         k9e4ebHKVRM9qDkWNn16jRH2BXsaGCxSxeyNoZPWGZqS7KGBh8c6KBkVuYNBnko1cl3E
         VdCkKETDg4ft0M+OzkZ3k87PVYa9oqTOl9wicvJWd1wmtlN8dQueiuOxm/vEMy5GeRFa
         +sg3MVSH+h/Zb7BYYFPoBTK6ORiz+q44lm/T234+z7gBwWjxm1qEJ7anNtz7bBgrimKK
         3uTuqnr0jXnbHkdY0d4sgb6yB6hm08d+Mv/CnttdsSum+R3+8qo6JcPf9+ee03+bC9bs
         LQew==
X-Gm-Message-State: AO0yUKU2p9ijcKkLRycWqID1wtsuYdIU0PXo1GK86VB0irg2byBp2AvC
	m9CNj5e0aHVazs5eu7y2ZavrzU8CigCJ7Zmhh9fsmw==
X-Google-Smtp-Source: AK7set/MXdSUiVFsejNrlyhnOoFwGD2znRmo2VK20BuxOmirIKYsjVNRdSagOGoOhEr7dRsUOax3bSr/4CY336LeXQU=
X-Received: by 2002:adf:e3c3:0:b0:2c7:478:d1d7 with SMTP id
 k3-20020adfe3c3000000b002c70478d1d7mr326758wrm.3.1677838985610; Fri, 03 Mar
 2023 02:23:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <be5a37c0ec23bf8119f5cb68ec58d8cca16d9812.1677079672.git.jens.wiklander@linaro.org>
 <BE16E58C-FBDF-4815-A6C1-CB0D3C573816@arm.com> <CAHUa44HmBsH2tCk=N=sovVVbgs9v5kLkOfJNzLfqXifZ=8iZtw@mail.gmail.com>
 <7A0F0605-7A22-4DE1-AF0A-FE7921F4935C@arm.com>
In-Reply-To: <7A0F0605-7A22-4DE1-AF0A-FE7921F4935C@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 Mar 2023 11:22:54 +0100
Message-ID: <CAHUa44F+DzgS0URp+mSn=ws8UVvj4evXahg5DXRR_MZJJewU6Q@mail.gmail.com>
Subject: Re: [XEN PATCH v7 13/20] xen/arm: ffa: support mapping guest RX/TX buffers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 3, 2023 at 9:16=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 3 Mar 2023, at 08:41, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Thu, Mar 2, 2023 at 4:05=E2=80=AFPM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Adds support in the mediator to map and unmap the RX and TX buffers
> >>> provided by the guest using the two FF-A functions FFA_RXTX_MAP and
> >>> FFA_RXTX_UNMAP.
> >>>
> >>> These buffer are later used to to transmit data that cannot be passed=
 in
> >>> registers only.
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/ffa.c | 127 ++++++++++++++++++++++++++++++++++++++++=
+
> >>> 1 file changed, 127 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index f1b014b6c7f4..953b6dfd5eca 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -149,10 +149,17 @@ struct ffa_partition_info_1_1 {
> >>> };
> >>>
> >>> struct ffa_ctx {
> >>> +    void *rx;
> >>> +    const void *tx;
> >>> +    struct page_info *rx_pg;
> >>> +    struct page_info *tx_pg;
> >>> +    unsigned int page_count;
> >>>    uint32_t guest_vers;
> >>> +    bool tx_is_mine;
> >>>    bool interrupted;
> >>> };
> >>>
> >>> +
> >> Newline probably added by mistake.
> >
> > Yes, I'll remove it.
> >
> >>
> >>> /* Negotiated FF-A version to use with the SPMC */
> >>> static uint32_t ffa_version __ro_after_init;
> >>>
> >>> @@ -337,6 +344,11 @@ static void set_regs(struct cpu_user_regs *regs,=
 register_t v0, register_t v1,
> >>>        set_user_reg(regs, 7, v7);
> >>> }
> >>>
> >>> +static void set_regs_error(struct cpu_user_regs *regs, uint32_t erro=
r_code)
> >>> +{
> >>> +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> >>> +}
> >>> +
> >>> static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> >>>                             uint32_t w3)
> >>> {
> >>> @@ -358,6 +370,99 @@ static void handle_version(struct cpu_user_regs =
*regs)
> >>>    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> >>> }
> >>>
> >>> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> >>> +                                register_t rx_addr, uint32_t page_co=
unt)
> >>> +{
> >>> +    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> >>> +    struct domain *d =3D current->domain;
> >>> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >>> +    struct page_info *tx_pg;
> >>> +    struct page_info *rx_pg;
> >>> +    p2m_type_t t;
> >>> +    void *rx;
> >>> +    void *tx;
> >>> +
> >>> +    if ( !smccc_is_conv_64(fid) )
> >>> +    {
> >>> +        tx_addr &=3D UINT32_MAX;
> >>> +        rx_addr &=3D UINT32_MAX;
> >>> +    }
> >>
> >> I am bit wondering here what we should do:
> >> - we could just say that 32bit version of the call is not allowed for =
non 32bit guests
> >> - we could check that the highest bits are 0 for 64bit guests and retu=
rn an error if not
> >> - we can just mask hopping that if there was a mistake the address aft=
er the mask
> >> does not exist in the guest space
> >>
> >> At the end nothing in the spec is preventing a 64bit guest to use the =
32bit so it might
> >> be a good idea to return an error if the highest 32bit are not 0 here =
?
> >
> > The SMC Calling Convention says:
> > When an SMC32/HVC32 call is made from AArch64:
> > - A Function Identifier is passed in register W0.
> > - Arguments are passed in registers W1-W7.
> >
> > So masking off the higher bits is all that should be done.
>
> Please put a comment saying that in 32 bit convention higher bits should =
be ignored.

OK.

Thanks,
Jens

>
> >
> >>
> >>> +
> >>> +    /* For now to keep things simple, only deal with a single page *=
/
> >>> +    if ( page_count !=3D 1 )
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>
> >> Please add a TODO here and a print as this is a limitation we will pro=
bably have to
> >> work on soon.
> >
> > I'll add an arbitrary upper limit and a print if it's exceeded.
>
> thanks
>
> >
> >>
> >>
> >>> +
> >>> +    /* Already mapped */
> >>> +    if ( ctx->rx )
> >>> +        return FFA_RET_DENIED;
> >>> +
> >>> +    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t,=
 P2M_ALLOC);
> >>> +    if ( !tx_pg )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +    /* Only normal RAM for now */
> >>> +    if ( !p2m_is_ram(t) )
> >>> +        goto err_put_tx_pg;
> >>> +
> >>> +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t,=
 P2M_ALLOC);
> >>> +    if ( !tx_pg )
> >>> +        goto err_put_tx_pg;
> >>> +    /* Only normal RAM for now */
> >>> +    if ( !p2m_is_ram(t) )
> >>> +        goto err_put_rx_pg;
> >>> +
> >>> +    tx =3D __map_domain_page_global(tx_pg);
> >>> +    if ( !tx )
> >>> +        goto err_put_rx_pg;
> >>> +
> >>> +    rx =3D __map_domain_page_global(rx_pg);
> >>> +    if ( !rx )
> >>> +        goto err_unmap_tx;
> >>> +
> >>> +    ctx->rx =3D rx;
> >>> +    ctx->tx =3D tx;
> >>> +    ctx->rx_pg =3D rx_pg;
> >>> +    ctx->tx_pg =3D tx_pg;
> >>> +    ctx->page_count =3D 1;
> >>
> >> please use page_count here instead of 1 so that this is not forgotten =
once
> >> we add support for more pages.
> >
> > OK
>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >>
> >>
> >> Cheers
> >> Bertrand
> >>
> >>> +    ctx->tx_is_mine =3D true;
> >>> +    return FFA_RET_OK;
> >>> +
> >>> +err_unmap_tx:
> >>> +    unmap_domain_page_global(tx);
> >>> +err_put_rx_pg:
> >>> +    put_page(rx_pg);
> >>> +err_put_tx_pg:
> >>> +    put_page(tx_pg);
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +
> >>> +static void rxtx_unmap(struct ffa_ctx *ctx)
> >>> +{
> >>> +    unmap_domain_page_global(ctx->rx);
> >>> +    unmap_domain_page_global(ctx->tx);
> >>> +    put_page(ctx->rx_pg);
> >>> +    put_page(ctx->tx_pg);
> >>> +    ctx->rx =3D NULL;
> >>> +    ctx->tx =3D NULL;
> >>> +    ctx->rx_pg =3D NULL;
> >>> +    ctx->tx_pg =3D NULL;
> >>> +    ctx->page_count =3D 0;
> >>> +    ctx->tx_is_mine =3D false;
> >>> +}
> >>> +
> >>> +static uint32_t handle_rxtx_unmap(void)
> >>> +{
> >>> +    struct domain *d =3D current->domain;
> >>> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >>> +
> >>> +    if ( !ctx->rx )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +    rxtx_unmap(ctx);
> >>> +
> >>> +    return FFA_RET_OK;
> >>> +}
> >>> +
> >>> static void handle_msg_send_direct_req(struct cpu_user_regs *regs, ui=
nt32_t fid)
> >>> {
> >>>    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> >>> @@ -423,6 +528,7 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
> >>>    uint32_t fid =3D get_user_reg(regs, 0);
> >>>    struct domain *d =3D current->domain;
> >>>    struct ffa_ctx *ctx =3D d->arch.tee;
> >>> +    int e;
> >>>
> >>>    if ( !ctx )
> >>>        return false;
> >>> @@ -435,6 +541,24 @@ static bool ffa_handle_call(struct cpu_user_regs=
 *regs)
> >>>    case FFA_ID_GET:
> >>>        set_regs_success(regs, get_vm_id(d), 0);
> >>>        return true;
> >>> +    case FFA_RXTX_MAP_32:
> >>> +#ifdef CONFIG_ARM_64
> >>> +    case FFA_RXTX_MAP_64:
> >>> +#endif
> >>> +        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_r=
eg(regs, 2),
> >>> +                            get_user_reg(regs, 3));
> >>> +        if ( e )
> >>> +            set_regs_error(regs, e);
> >>> +        else
> >>> +            set_regs_success(regs, 0, 0);
> >>> +        return true;
> >>> +    case FFA_RXTX_UNMAP:
> >>> +        e =3D handle_rxtx_unmap();
> >>> +        if ( e )
> >>> +            set_regs_error(regs, e);
> >>> +        else
> >>> +            set_regs_success(regs, 0, 0);
> >>> +        return true;
> >>>    case FFA_MSG_SEND_DIRECT_REQ_32:
> >>> #ifdef CONFIG_ARM_64
> >>>    case FFA_MSG_SEND_DIRECT_REQ_64:
> >>> @@ -515,6 +639,9 @@ static int ffa_relinquish_resources(struct domain=
 *d)
> >>>                   get_vm_id(d), subscr_vm_destroyed[n], res);
> >>>    }
> >>>
> >>> +    if ( ctx->rx )
> >>> +        rxtx_unmap(ctx);
> >>> +
> >>>    XFREE(d->arch.tee);
> >>>
> >>>    return 0;
> >>> --
> >>> 2.34.1
>
>

