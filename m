Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513B75922D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565728.884157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3xW-0006tu-9W; Wed, 19 Jul 2023 09:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565728.884157; Wed, 19 Jul 2023 09:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3xW-0006rz-6X; Wed, 19 Jul 2023 09:59:02 +0000
Received: by outflank-mailman (input) for mailman id 565728;
 Wed, 19 Jul 2023 09:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8L3=DF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qM3xV-0006rt-AI
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:59:01 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c78cb8-261a-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:59:00 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-635dc2f6ef9so41403176d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 02:58:59 -0700 (PDT)
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
X-Inumbo-ID: e1c78cb8-261a-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689760739; x=1690365539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLIi/2d0xR4KmfyRsQNMJ5p+P91jQVTkA+B7bEUNLtg=;
        b=D+YuGmiG46sGauLDBNP9U80we0ZOY5cQtJQCJPFN9+RC156xB9ahcJItplmNlZSKKP
         8LwmbVJbK7LWU9QpdI21teCk9npTIL435awNFNIELvKIFbfIMGN/auD1MfVewkXavrsz
         zld+dsy5zyHeXqm19hXBrO2ru6WdibvUwcUGKuv37B3vSbydjtZ1rsRQUMdvkNaIZFqh
         Kob0QX+V29pX8l4mHYnRV+gPj0EVTaBmXLLIoVyMA8VvxcfEf6z3sKtgBAgGXxNGVJ2h
         BB16VN/XqDTBq5B+6/KCf5FMmSjuf6BKxQmsAaEl8ZIdUF5MA0hNFXOEAAs8AdgA25y7
         wHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689760739; x=1690365539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLIi/2d0xR4KmfyRsQNMJ5p+P91jQVTkA+B7bEUNLtg=;
        b=C8VyArYjQfErt7tUvDai2WpIc2TXArYWvZaQ5pm02wJgDaAHk5SsQdfcfW9wQWoMaL
         8uOZ/yD98uKMoVmci8X6XQtVTZyb0cITJimgAEk2uB17B0M0pmTqm/C1YHgrxPB/0xIy
         BLyIkT9vYLGb65aBI6wH559xdkXmGH1WzmEaWqWNyOCzU+6hXpcMXhMxmCq68uql4XMV
         ebmHAzPmTnMg11atXrhLAwySNT06cuX+0ZXsAqwLr9rtbtpUoXLoCCSK016EFJd6fckn
         9iWxxevLrX5VRl5RT0SnRBAFIdSFUcNcn+MBXvjDWHf65u/Eu/PAFT3p0ObnKpUSRvpN
         j7YA==
X-Gm-Message-State: ABy/qLZqzZPtg6Ef6SMnzytAzLiqKsCX6r4GTScz9dL3znUH6u3xt8gW
	AqtonUxRnig7W/oCUSQcWcFKzaWVx4pM2tPJS8LDpA==
X-Google-Smtp-Source: APBJJlElJAnCU/3QrXegPttCzz1Hrvs58PavS8bgcALJyG5olU9/01gmNaLyzPs8VM1tMJp3c83mGFpr4KdVdWgeZag=
X-Received: by 2002:a0c:d802:0:b0:635:fa7b:6c22 with SMTP id
 h2-20020a0cd802000000b00635fa7b6c22mr16347642qvj.55.1689760738851; Wed, 19
 Jul 2023 02:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-15-jens.wiklander@linaro.org> <D09E02DC-DE2A-4876-B5E7-10DD131EC98F@arm.com>
In-Reply-To: <D09E02DC-DE2A-4876-B5E7-10DD131EC98F@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Jul 2023 11:58:47 +0200
Message-ID: <CAHUa44FOR2cqcdF8Sw-U4v05XRWNnLy8xurjyCM4euZqTcrm7g@mail.gmail.com>
Subject: Re: [XEN PATCH v10 14/24] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 12:22=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
> > from a guest. The requests are forwarded to the SPMC and the response i=
s
> > translated according to the FF-A version in use by the guest.
> >
> > Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> > caller (the guest in this case), so once it is done with the buffer it
> > must be released using FFA_RX_RELEASE before another call can be made.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 131 +++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 131 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index ffabb5ed0a80..d5748b9ce88c 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -166,7 +166,18 @@
> > #define FFA_MSG_SEND                    0x8400006EU
> > #define FFA_MSG_POLL                    0x8400006AU
> >
> > +/*
> > + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> > + * struct ending with _1_1 are defined in FF-A-1.1-REL0.
>
> Nit: For coherency, second line should be "Structs" instead of "struct"

OK

>
> > + */
> > +
> > /* Partition information descriptor */
> > +struct ffa_partition_info_1_0 {
> > +    uint16_t id;
> > +    uint16_t execution_context;
> > +    uint32_t partition_properties;
> > +};
> > +
> > struct ffa_partition_info_1_1 {
> >     uint16_t id;
> >     uint16_t execution_context;
> > @@ -189,6 +200,7 @@ struct ffa_ctx {
> >      */
> >     uint16_t create_signal_count;
> >     bool rx_is_free;
> > +    spinlock_t lock;
> > };
> >
> > /* Negotiated FF-A version to use with the SPMC */
> > @@ -203,9 +215,15 @@ static uint16_t subscr_vm_destroyed_count __read_m=
ostly;
> > /*
> >  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> >  * number of pages used in each of these buffers.
> > + *
> > + * The RX buffer is protected from concurrent usage with ffa_rx_buffer=
_lock.
> > + * Note that the SPMC is also tracking the ownership of our RX buffer =
so
> > + * for calls which uses our RX buffer to deliver a result we must call
> > + * ffa_rx_release() to let the SPMC know that we're done with the buff=
er.
> >  */
> > static void *ffa_rx __read_mostly;
> > static void *ffa_tx __read_mostly;
> > +static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> >
> > static bool ffa_get_version(uint32_t *vers)
> > {
> > @@ -510,6 +528,100 @@ static uint32_t handle_rxtx_unmap(void)
> >     return FFA_RET_OK;
> > }
> >
> > +static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uin=
t32_t w3,
> > +                                         uint32_t w4, uint32_t w5,
> > +                                         uint32_t *count)
> > +{
> > +    int32_t ret =3D FFA_RET_DENIED;
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> > +    /*
> > +     * FF-A v1.0 has w5 MBZ while v1.1 allows
> > +     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> > +     */
>
> You should add something to say that the INFO_GET_COUNT does
> not use the rxtx buffer to explain why you do the call directly in this c=
ase.
>
> Reading the code as is, on might wonder why this case is different.
>
> How about:
> FFA_PARTITION_INFO_GET_COUNT is only using registers and not
> the rxtx buffer so do the partition_info_get directly.

OK, I'll add it.

Thanks,
Jens

>
> > +    if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> > +         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> > +        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> > +    if ( w5 )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    if ( !ffa_rx )
> > +        return FFA_RET_DENIED;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || !ctx->rx_is_free )
> > +        goto out;
> > +    spin_lock(&ffa_rx_buffer_lock);
> > +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> > +    if ( ret )
> > +        goto out_rx_buf_unlock;
> > +    /*
> > +     * ffa_partition_info_get() succeeded so we now own the RX buffer =
we
> > +     * share with the SPMC. We must give it back using ffa_rx_release(=
)
> > +     * once we've copied the content.
> > +     */
> > +
> > +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> > +    {
> > +        size_t n;
> > +        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> > +        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> > +
> > +        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
> > +        {
> > +            ret =3D FFA_RET_NO_MEMORY;
> > +            goto out_rx_release;
> > +        }
> > +
> > +        for ( n =3D 0; n < *count; n++ )
> > +        {
> > +            dst[n].id =3D src[n].id;
> > +            dst[n].execution_context =3D src[n].execution_context;
> > +            dst[n].partition_properties =3D src[n].partition_propertie=
s;
> > +        }
> > +    }
> > +    else
> > +    {
> > +        size_t sz =3D *count * sizeof(struct ffa_partition_info_1_1);
> > +
> > +        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
> > +        {
> > +            ret =3D FFA_RET_NO_MEMORY;
> > +            goto out_rx_release;
> > +        }
> > +
> > +
> > +        memcpy(ctx->rx, ffa_rx, sz);
> > +    }
> > +    ctx->rx_is_free =3D false;
> > +out_rx_release:
> > +    ffa_rx_release();
> > +out_rx_buf_unlock:
> > +    spin_unlock(&ffa_rx_buffer_lock);
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static int32_t handle_rx_release(void)
> > +{
> > +    int32_t ret =3D FFA_RET_DENIED;
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || ctx->rx_is_free )
> > +        goto out;
> > +    ret =3D FFA_RET_OK;
> > +    ctx->rx_is_free =3D true;
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint=
32_t fid)
> > {
> >     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> > @@ -566,6 +678,7 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
> >     uint32_t fid =3D get_user_reg(regs, 0);
> >     struct domain *d =3D current->domain;
> >     struct ffa_ctx *ctx =3D d->arch.tee;
> > +    uint32_t count;
> >     int e;
> >
> >     if ( !ctx )
> > @@ -595,6 +708,24 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> >         else
> >             set_regs_success(regs, 0, 0);
> >         return true;
> > +    case FFA_PARTITION_INFO_GET:
> > +        e =3D handle_partition_info_get(get_user_reg(regs, 1),
> > +                                      get_user_reg(regs, 2),
> > +                                      get_user_reg(regs, 3),
> > +                                      get_user_reg(regs, 4),
> > +                                      get_user_reg(regs, 5), &count);
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, count, 0);
> > +        return true;
> > +    case FFA_RX_RELEASE:
> > +        e =3D handle_rx_release();
> > +        if ( e )
> > +            set_regs_error(regs, e);
> > +        else
> > +            set_regs_success(regs, 0, 0);
> > +        return true;
> >     case FFA_MSG_SEND_DIRECT_REQ_32:
> >     case FFA_MSG_SEND_DIRECT_REQ_64:
> >         handle_msg_send_direct_req(regs, fid);
> > --
> > 2.34.1
> >
>
> Cheers
> Bertrand
>

