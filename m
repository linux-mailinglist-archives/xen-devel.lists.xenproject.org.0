Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD096A9836
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 14:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505999.779010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5IB-00068P-2t; Fri, 03 Mar 2023 13:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505999.779010; Fri, 03 Mar 2023 13:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5IA-00065N-Vb; Fri, 03 Mar 2023 13:17:46 +0000
Received: by outflank-mailman (input) for mailman id 505999;
 Fri, 03 Mar 2023 13:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pyx=63=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pY5I8-0005Vf-VD
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 13:17:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7914ced-b9c5-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 14:17:42 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id l1so2192176wry.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 05:17:42 -0800 (PST)
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
X-Inumbo-ID: c7914ced-b9c5-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677849462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZeNRIhR/i1EuSw7nQaZHPch+6OrBk9oOpq2R+uejTc=;
        b=MZCOKSvl635iGKNaO7/k3iEzlHuAo9QfNw2x5BvOzPNeP14eUQFIGaJ/reGy1SSltZ
         uvk9ivObLcigzpNYEqLNH7M8xh7v6b0Szgp4w2izTJezBD4p+Kb9WZvF/2v1ZXw1FZdS
         Kw1Swdzc7riAkBkZxGAF5Vk7MsE5N6+q/DzwUoMA8knhPMy9hMDP0d8kCZt56CLo0Qfr
         cggM2ZGtTUogS92cF0ouARp2OfLaGy1K2k9GIWBGDSxHDRjDUaSZycatSUQUNt1ZDnmK
         lbTnzWb70s8NCbzmIyyt+lUteW7/NzpT42JCWvqHtm662U1DFRO53wLmA8ble7Fvd4Bd
         2zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677849462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZeNRIhR/i1EuSw7nQaZHPch+6OrBk9oOpq2R+uejTc=;
        b=ZDMV2cT3rDxBucpWMLnqT+pPACeiV8q6HMC/yDcPv/c39wO4nGAGiepFYbpkGyv/26
         9YsNSc+tiq7+0uwqkjt03X38v6jpMqkgyrjALlTEtpjqfUOaArR5jrAJejWqjjukHd3V
         i8eeqNAtgKVh9KqZPFprUPoAwf0W5//hrP3c2gn5Qbu0ulIEj2qDHugotQELPBsSt0pN
         GcYDGxdABbyWUO40HM78/MgCPuHrxKtAK34jPhfx+iu/aIcY8Ae7oDdjI4kx8xa+5B4p
         PvOJvzfUu+pj54vZGMHNu+snrK75pIdOn1J/a5NH8pwjwPRxx+2wjHnRkGy3uKbQAC/d
         uRlA==
X-Gm-Message-State: AO0yUKXR1Gkgwmxrx67RqMRegqsczcLLBY3rWH6IefWfT5HwiV1ToM/X
	2FPtRLxuLIZiNX1UsBsPWNJLOCvmoy9oeTWJ049PtQ==
X-Google-Smtp-Source: AK7set9+v2rN4IOwxtW5RQCgGDuRZAyJsbmp/CM7bGd0eddFMxBR9P2ltcDXaWLt+MQc6yt0J+mO8LmgJahCv6RfpUs=
X-Received: by 2002:a5d:45ca:0:b0:2c7:1aa8:7cfa with SMTP id
 b10-20020a5d45ca000000b002c71aa87cfamr379825wrs.14.1677849462094; Fri, 03 Mar
 2023 05:17:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <fc8e8f1d2d8dbefffd28f6ff1dff600094be8182.1677079672.git.jens.wiklander@linaro.org>
 <55C1E9E3-1515-40BD-8C9B-93564A2B4421@arm.com>
In-Reply-To: <55C1E9E3-1515-40BD-8C9B-93564A2B4421@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 Mar 2023 14:17:31 +0100
Message-ID: <CAHUa44HyQv0f=eaMS9McpzsMAT_xrOOs8HynV7bq+WnjE5CqxA@mail.gmail.com>
Subject: Re: [XEN PATCH v7 14/20] xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Mar 3, 2023 at 10:51=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
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
> > xen/arch/arm/tee/ffa.c | 126 ++++++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 124 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 953b6dfd5eca..3571817c0bcd 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -141,6 +141,12 @@
> > #define FFA_MSG_POLL                    0x8400006AU
> >
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
> > @@ -157,9 +163,8 @@ struct ffa_ctx {
> >     uint32_t guest_vers;
> >     bool tx_is_mine;
> >     bool interrupted;
> > +    spinlock_t lock;
> > };
> > -
> > -
>
> This is removing 2 empty lines (previous patch was wrongly adding one)
> but one empty line is required here.

I'll fix it.

>
> > /* Negotiated FF-A version to use with the SPMC */
> > static uint32_t ffa_version __ro_after_init;
> >
> > @@ -173,10 +178,16 @@ static unsigned int subscr_vm_destroyed_count __r=
ead_mostly;
> >  * Our rx/tx buffers shared with the SPMC.
> >  *
> >  * ffa_page_count is the number of pages used in each of these buffers.
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
> > static unsigned int ffa_page_count __read_mostly;
> > +static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> >
> > static bool ffa_get_version(uint32_t *vers)
> > {
> > @@ -463,6 +474,98 @@ static uint32_t handle_rxtx_unmap(void)
> >     return FFA_RET_OK;
> > }
> >
> > +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, ui=
nt32_t w3,
> > +                                          uint32_t w4, uint32_t w5,
> > +                                          uint32_t *count)
> > +{
> > +    bool query_count_only =3D w5 & FFA_PARTITION_INFO_GET_COUNT_FLAG;
> > +    uint32_t w5_mask =3D 0;
> > +    uint32_t ret =3D FFA_RET_DENIED;
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> > +    /*
> > +     * FF-A v1.0 has w5 MBZ while v1.1 allows
> > +     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> > +     */
> > +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> > +        w5_mask =3D FFA_PARTITION_INFO_GET_COUNT_FLAG;
> > +    if ( w5 & ~w5_mask )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    if ( query_count_only )
> > +        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
>
> This code seems a bit to complex.
> I would suggest the following:
>
> if (w5 & FFA_PARTITION_INFO_GET_COUNT_FLAG)
> {
>      if ( ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
>         return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
>      else
>         return FFA_RET_INVALID_PARAMETERS;
> }

OK, I can use that. I'll have to add a
if (w5)
    return FFA_RET_INVALID_PARAMETERS;

since the rest of the bits must be zero.

>
> > +
> > +    if ( !ffa_page_count )
> > +        return FFA_RET_DENIED;
> > +
> > +    spin_lock(&ctx->lock);
> > +    spin_lock(&ffa_rx_buffer_lock);
> > +    if ( !ctx->page_count || !ctx->tx_is_mine )
>
> If i understand correctly tx_is_mine is protecting the guest rx
> buffer until rx_release is called by the guest so that we do not
> write in it before the guest has retrieved the data from it.
>
> The name is very misleading, maybe rx_is_writeable or free would be bette=
r ?

The FF-A specification talks about ownership of the TX buffer (from
the VMs point of view), hence the name.
I'll change it to rx_is_free to be more intuitive without the spec.

>
> Also it would be more optimal to test it before taking ffa_rx_buffer_lock=
.

Yes, I'll change that.

>
>
> > +        goto out;
> > +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> > +    if ( ret )
> > +        goto out;
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
> > +    ctx->tx_is_mine =3D false;
>
> at this point we have no reason to hold ctx->lock

ctx->lock is special, we're never supposed to have contention on that
lock. I believe that we in principle could use spin_trylock() instead
and return FFA_RET_BUSY if it fails, but that might be a bit too much.
The VM is supposed to synchronize calls that use the RXTX buffers. So
unlocking ctx->lock early should give nothing for well-behaving
guests, I'd prefer to keep things simple and unlock in reverse order
if you don't mind. I'll add a comment.

>
> > +out_rx_release:
> > +    ffa_rx_release();
>
> There should be no case where do release without unlocking.
>
> It might be cleaner to have 2 functions ffa_rx_get and ffa_rx_release
>  handling both the lock and the rx_release message.

I'd like to keep ffa_rx_release() as a dumb wrapper. ffa_rx_release()
is also used in init_subscribers()  where we don't use any locks.
ffa_rx_release() is called after a successful call to
ffa_partition_info_get() where we also gained ownership of our RX
buffer. Things might be a bit too intertwined for further abstraction.
I'll add a comment explaining the relationship between
ffa_partition_info_get() and ffa_rx_release().

>
> > +out:
> > +    spin_unlock(&ffa_rx_buffer_lock);
>
> this should stay with ffa_rx_release

Depending on if you accept my explanation above.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > +    spin_unlock(&ctx->lock);
> > +
> > +    return ret;
> > +}
> > +
> > +static uint32_t handle_rx_release(void)
> > +{
> > +    uint32_t ret =3D FFA_RET_DENIED;
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> > +    spin_lock(&ctx->lock);
> > +    if ( !ctx->page_count || ctx->tx_is_mine )
> > +        goto out;
> > +    ret =3D FFA_RET_OK;
> > +    ctx->tx_is_mine =3D true;
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
> > @@ -528,6 +631,7 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
> >     uint32_t fid =3D get_user_reg(regs, 0);
> >     struct domain *d =3D current->domain;
> >     struct ffa_ctx *ctx =3D d->arch.tee;
> > +    uint32_t count;
> >     int e;
> >
> >     if ( !ctx )
> > @@ -559,6 +663,24 @@ static bool ffa_handle_call(struct cpu_user_regs *=
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
> > #ifdef CONFIG_ARM_64
> >     case FFA_MSG_SEND_DIRECT_REQ_64:
> > --
> > 2.34.1
> >
>

