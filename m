Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121569AE69E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825290.1239488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xyJ-0001E9-Qt; Thu, 24 Oct 2024 13:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825290.1239488; Thu, 24 Oct 2024 13:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xyJ-0001CC-Np; Thu, 24 Oct 2024 13:33:51 +0000
Received: by outflank-mailman (input) for mailman id 825290;
 Thu, 24 Oct 2024 13:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3xyH-0001C6-TJ
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:33:50 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9824e9b7-920c-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 15:33:47 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-288642376bcso535220fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:33:47 -0700 (PDT)
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
X-Inumbo-ID: 9824e9b7-920c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729776825; x=1730381625; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf2tjYYfu3xXp401bkdojDqHVKOHtRtGUAa4VDrVDUI=;
        b=eZMxEzgLx4Ud0cIKSa8rXA767+gNLlDlQX8BKV/t3TUR/4fbXIM2ojLoIDKfOkaVKO
         GasFK3EJdIJeWp7LfteQSz45svFBY1/5xDxwxB0T4Ii3QjoWwNzpQbQxJbzefE9r2KSa
         nGgCIdRkswwUUYv4PLlsOk0LmEqJAVTj1bxNwL1zXlkA/lB5RFKGVAR3Yqnlb0g677yN
         t2V5CuGAZunD4dmIMSVYuJnmK2M47+dir7MJ2o26Ag0rZ0B3Bei+IK7OlLRfl28gX3x4
         MxCJjD6Eu+EPULabC7rn8UKzcpMax6u5lOCt0UE70bBgj2W+df6Z+ISoS2wshOhlHQYF
         Bdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776825; x=1730381625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf2tjYYfu3xXp401bkdojDqHVKOHtRtGUAa4VDrVDUI=;
        b=rp0gdiGXnqFY56c2atjNHj8hN6LOa2n6XT5xE2+bxWAYOW0AKo+ywkze9T4QO2Hhal
         giJ47A8Zdne3K8EdfWwN7S+PtCfwP08kxIjBObijRLPQ2bUTXoBwsr87qrthQVeDocDF
         IOVQ9pG09Pl7swNGV9CMrIv7RUbtH2LwAVqEeY69Tjm3WvtE7D1gidEX15QgiOlkuAVB
         wUpVJhqPLYsbn2MJN425dGygbI05JZdkWUkt20zsT629JOBuZ1NS6NObdKA6y+a4Q+BE
         VyEODZuKGngREL5hklbBtswQbeL52h/DMUwByMfJDcbjY1/W/JmY+9Lb1zCpPDZ0ygdz
         XknQ==
X-Gm-Message-State: AOJu0Yxhbb5kkzXL2IlV53xFWF93/KZheu9c5eXZ8tAMhGYh9e+IT3i6
	N7nwBSVhErT5/DOveJs/vKEhZAtvkhsSty5GFyGHcjW821CINXXBRHJMWsMtQQ62r0ifWCNTNqb
	SaQyuYdoyFTdqvy0K0D85hx8J28UyAQsKUSSRQQ==
X-Google-Smtp-Source: AGHT+IFaIhY8HOteS9yCNprlOB+pSJcx/hDiSbyxoG7L6yprxhGK6Hr4pjO6iE6eZIaSwLnff5qdKy2LepxZ370VTy8=
X-Received: by 2002:a05:6870:2045:b0:261:f8e:a37a with SMTP id
 586e51a60fabf-28ccb7f3a34mr6463366fac.14.1729776825478; Thu, 24 Oct 2024
 06:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <f6037d0d077d793864ec10875dccf9e82a19e100.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44F5yXW5yb_+RgBrof7c3yRoMp3Jh2n3OkAVV2mND7c6QA@mail.gmail.com> <CDDAEF0D-92C4-45A4-95C1-E775A26DB03A@arm.com>
In-Reply-To: <CDDAEF0D-92C4-45A4-95C1-E775A26DB03A@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 15:33:34 +0200
Message-ID: <CAHUa44Fa_ajsvPwPrzH9G1DTkpA-G5zD0RzJJ5-ZnD7oqHJ76Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Oct 24, 2024 at 11:46=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 23 Oct 2024, at 16:51, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> When an RXTX buffer is mapped by a VM transmit it to the SPMC when it
> >> supports RX_ACQUIRE.
> >> As a consequence of that, we must acquire the RX buffer of a VM from t=
he
> >> SPMC when we want to use it:
> >> - create a generic acquire and release function to get the rx buffer o=
f
> >>  a VM which gets it from the SPMC when supported
> >> - rename the rx_acquire to hyp_rx_acquire to remove confusion
> >> - rework the rx_lock to only lock access to rx_is_free and only allow
> >>  usage of the rx buffer to one who managed to acquire it, thus removin=
g
> >>  the trylock and returning busy if rx_is_free is false
> >>
> >> As part of this change move some structure definition to ffa_private
> >> from ffa_shm as those are need for the MAP call with the SPMC.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2:
> >> - unmap VM rxtx buffer in SPMC on unmap call or on VM destroy
> >> - rework the unmap call to the SPMC to properly pass the VM ID
> >> ---
> >> xen/arch/arm/tee/ffa.c          |   2 +-
> >> xen/arch/arm/tee/ffa_partinfo.c |  29 ++----
> >> xen/arch/arm/tee/ffa_private.h  |  22 ++++-
> >> xen/arch/arm/tee/ffa_rxtx.c     | 158 ++++++++++++++++++++++++++------
> >> xen/arch/arm/tee/ffa_shm.c      |  15 ---
> >> 5 files changed, 161 insertions(+), 65 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index a292003ca9fe..40ea5398fa21 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -347,7 +347,7 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> >>         ffa_handle_partition_info_get(regs);
> >>         return true;
> >>     case FFA_RX_RELEASE:
> >> -        e =3D ffa_handle_rx_release();
> >> +        e =3D ffa_rx_release(d);
> >>         break;
> >>     case FFA_MSG_SEND_DIRECT_REQ_32:
> >>     case FFA_MSG_SEND_DIRECT_REQ_64:
> >> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
> >> index 3cf801523296..fde187dba4e5 100644
> >> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >> @@ -121,11 +121,9 @@ void ffa_handle_partition_info_get(struct cpu_use=
r_regs *regs)
> >>         goto out;
> >>     }
> >>
> >> -    if ( !spin_trylock(&ctx->rx_lock) )
> >> -    {
> >> -        ret =3D FFA_RET_BUSY;
> >> +    ret =3D ffa_rx_acquire(d);
> >> +    if ( ret !=3D FFA_RET_OK )
> >>         goto out;
> >> -    }
> >>
> >>     dst_buf =3D ctx->rx;
> >>
> >> @@ -135,22 +133,16 @@ void ffa_handle_partition_info_get(struct cpu_us=
er_regs *regs)
> >>         goto out_rx_release;
> >>     }
> >>
> >> -    if ( !ctx->page_count || !ctx->rx_is_free )
> >> -    {
> >> -        ret =3D FFA_RET_DENIED;
> >> -        goto out_rx_release;
> >> -    }
> >> -
> >>     spin_lock(&ffa_rx_buffer_lock);
> >>
> >>     ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
> >>
> >>     if ( ret )
> >> -        goto out_rx_buf_unlock;
> >> +        goto out_rx_hyp_unlock;
> >>
> >>     /*
> >>      * ffa_partition_info_get() succeeded so we now own the RX buffer =
we
> >> -     * share with the SPMC. We must give it back using ffa_rx_release=
()
> >> +     * share with the SPMC. We must give it back using ffa_hyp_rx_rel=
ease()
> >>      * once we've copied the content.
> >>      */
> >>
> >> @@ -193,15 +185,13 @@ void ffa_handle_partition_info_get(struct cpu_us=
er_regs *regs)
> >>         }
> >>     }
> >>
> >> -    ctx->rx_is_free =3D false;
> >> -
> >> out_rx_hyp_release:
> >> -    ffa_rx_release();
> >> -out_rx_buf_unlock:
> >> +    ffa_hyp_rx_release();
> >> +out_rx_hyp_unlock:
> >>     spin_unlock(&ffa_rx_buffer_lock);
> >> out_rx_release:
> >> -    spin_unlock(&ctx->rx_lock);
> >> -
> >> +    if ( ret !=3D FFA_RET_OK )
> >> +        ffa_rx_release(d);
> >
> > Please comment on why ffa_rx_release() must only be called on failure.
>
> It is because the buffer contains data for the caller in case of success =
so
> it must be released by the caller.

Please mention the transfer of buffer ownership since that might be
easy to miss if only skimming the spec.

>
> Do i get it right that you want me to add a comment saying that in the co=
de
> and not only tell you here ?

Yes. :-)

Cheers,
Jens

>
> >
> >> out:
> >>     if ( ret )
> >>         ffa_set_regs_error(regs, ret);
> >> @@ -368,8 +358,7 @@ bool ffa_partinfo_init(void)
> >>     ret =3D init_subscribers(count, fpi_size);
> >>
> >> out:
> >> -    ffa_rx_release();
> >> -
> >> +    ffa_hyp_rx_release();
> >>     return ret;
> >> }
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index afe69b43dbef..9adfe687c3c9 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -265,6 +265,21 @@
> >> #define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
> >>                                FFA_ABI_CONV(id))
> >>
> >> +/* Constituent memory region descriptor */
> >> +struct ffa_address_range {
> >> +    uint64_t address;
> >> +    uint32_t page_count;
> >> +    uint32_t reserved;
> >> +};
> >> +
> >> +/* Composite memory region descriptor */
> >> +struct ffa_mem_region {
> >> +    uint32_t total_page_count;
> >> +    uint32_t address_range_count;
> >> +    uint64_t reserved;
> >> +    struct ffa_address_range address_range_array[];
> >> +};
> >> +
> >> struct ffa_ctx_notif {
> >>     bool enabled;
> >>
> >> @@ -292,7 +307,7 @@ struct ffa_ctx {
> >>     struct ffa_ctx_notif notif;
> >>     /*
> >>      * tx_lock is used to serialize access to tx
> >> -     * rx_lock is used to serialize access to rx
> >> +     * rx_lock is used to serialize access to rx_is_free
> >>      * lock is used for the rest in this struct
> >>      */
> >>     spinlock_t tx_lock;
> >> @@ -331,7 +346,8 @@ void ffa_rxtx_domain_destroy(struct domain *d);
> >> uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> >>                             register_t rx_addr, uint32_t page_count);
> >> uint32_t ffa_handle_rxtx_unmap(void);
> >> -int32_t ffa_handle_rx_release(void);
> >> +int32_t ffa_rx_acquire(struct domain *d);
> >> +int32_t ffa_rx_release(struct domain *d);
> >>
> >> void ffa_notif_init(void);
> >> void ffa_notif_init_interrupt(void);
> >> @@ -420,7 +436,7 @@ static inline int32_t ffa_simple_call(uint32_t fid=
, register_t a1,
> >>     return ffa_get_ret_code(&resp);
> >> }
> >>
> >> -static inline int32_t ffa_rx_release(void)
> >> +static inline int32_t ffa_hyp_rx_release(void)
> >> {
> >>     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> >> }
> >> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> >> index b6931c855779..a5d43e51f843 100644
> >> --- a/xen/arch/arm/tee/ffa_rxtx.c
> >> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> >> @@ -30,6 +30,17 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
> >>     uint32_t tx_region_offs;
> >> };
> >>
> >> +static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> >> +                            uint32_t page_count)
> >> +{
> >> +    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_co=
unt, 0);
> >> +}
> >> +
> >> +static int32_t ffa_rxtx_unmap(uint16_t id)
> >> +{
> >> +    return ffa_simple_call(FFA_RXTX_UNMAP, ((uint64_t)id)<<16, 0, 0, =
0);
> >> +}
> >> +
> >> uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> >>                             register_t rx_addr, uint32_t page_count)
> >> {
> >> @@ -42,6 +53,9 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_=
t tx_addr,
> >>     void *rx;
> >>     void *tx;
> >>
> >> +    /* The code is considering that we only get one page for now */
> >> +    BUILD_BUG_ON(FFA_MAX_RXTX_PAGE_COUNT !=3D 1);
> >> +
> >>     if ( !smccc_is_conv_64(fid) )
> >>     {
> >>         /*
> >> @@ -87,6 +101,65 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, registe=
r_t tx_addr,
> >>     if ( !rx )
> >>         goto err_unmap_tx;
> >>
> >> +    /*
> >> +     * Transmit the RX/TX buffer information to the SPM if acquire is=
 supported
> >> +     * as the spec says that if not there is not need to acquire/rele=
ase/map
> >> +     * rxtx buffers from the SPMC
> >> +     */
> >> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> >> +    {
> >> +        struct ffa_endpoint_rxtx_descriptor_1_1 *rxtx_desc;
> >> +        struct ffa_mem_region *mem_reg;
> >> +
> >> +        /* All must fit in our TX buffer */
> >> +        BUILD_BUG_ON((sizeof(*rxtx_desc) + sizeof(*mem_reg)*2 +
> >> +                      sizeof(struct ffa_address_range)*2) > FFA_PAGE_=
SIZE);
> >
> > Please add space before and after the binary operator "*".
> Ack
>
> > The size of the TX buffer is FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE.
> Very right, I will fix that in v3.
>
> > Nit: the outer parenthesis around the left expression aren't needed.
> Ack
>
> >
> >> +
> >> +        spin_lock(&ffa_tx_buffer_lock);
> >> +        rxtx_desc =3D ffa_tx;
> >> +
> >> +        /*
> >> +         * We have only one page for each so we pack everything:
> >> +         * - rx region descriptor
> >> +         * - rx region range
> >> +         * - tx region descriptor
> >> +         * - tx region range
> >> +         */
> >> +        rxtx_desc->sender_id =3D ffa_get_vm_id(d);
> >> +        rxtx_desc->reserved =3D 0;
> >> +        rxtx_desc->rx_region_offs =3D sizeof(*rxtx_desc);
> >> +        rxtx_desc->tx_region_offs =3D sizeof(*rxtx_desc) +
> >> +                                    offsetof(struct ffa_mem_region,
> >> +                                             address_range_array[1]);
> >> +
> >> +        /* rx buffer */
> >> +        mem_reg =3D ffa_tx + sizeof(*rxtx_desc);
> >> +        mem_reg->total_page_count =3D 1;
> >> +        mem_reg->address_range_count =3D 1;
> >> +        mem_reg->reserved =3D 0;
> >> +
> >> +        mem_reg->address_range_array[0].address =3D page_to_maddr(rx_=
pg);
> >> +        mem_reg->address_range_array[0].page_count =3D 1;
> >> +        mem_reg->address_range_array[0].reserved =3D 0;
> >> +
> >> +        /* tx buffer */
> >> +        mem_reg =3D ffa_tx + rxtx_desc->tx_region_offs;
> >> +        mem_reg->total_page_count =3D 1;
> >> +        mem_reg->address_range_count =3D 1;
> >> +        mem_reg->reserved =3D 0;
> >> +
> >> +        mem_reg->address_range_array[0].address =3D page_to_maddr(tx_=
pg);
> >> +        mem_reg->address_range_array[0].page_count =3D 1;
> >> +        mem_reg->address_range_array[0].reserved =3D 0;
> >> +
> >> +        ret =3D ffa_rxtx_map(0, 0, 1);
> >
> > The last parameter is also MBZ when forwarding on behalf of an endpoint=
.
>
> Ack, will fix in v3.
>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +
> >> +        spin_unlock(&ffa_tx_buffer_lock);
> >> +
> >> +        if ( ret !=3D FFA_RET_OK )
> >> +            goto err_unmap_rx;
> >> +    }
> >> +
> >>     ctx->rx =3D rx;
> >>     ctx->tx =3D tx;
> >>     ctx->rx_pg =3D rx_pg;
> >> @@ -95,6 +168,8 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register=
_t tx_addr,
> >>     ctx->rx_is_free =3D true;
> >>     return FFA_RET_OK;
> >>
> >> +err_unmap_rx:
> >> +    unmap_domain_page_global(rx);
> >> err_unmap_tx:
> >>     unmap_domain_page_global(tx);
> >> err_put_rx_pg:
> >> @@ -105,8 +180,22 @@ err_put_tx_pg:
> >>     return ret;
> >> }
> >>
> >> -static void rxtx_unmap(struct ffa_ctx *ctx)
> >> +static uint32_t  rxtx_unmap(struct domain *d)
> >> {
> >> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >> +
> >> +    if ( !ctx->page_count )
> >> +        return FFA_RET_INVALID_PARAMETERS;
> >> +
> >> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> >> +    {
> >> +        uint32_t ret;
> >> +
> >> +        ret =3D ffa_rxtx_unmap(ffa_get_vm_id(d));
> >> +        if ( ret !=3D FFA_RET_OK )
> >> +            return ret;
> >> +    }
> >> +
> >>     unmap_domain_page_global(ctx->rx);
> >>     unmap_domain_page_global(ctx->tx);
> >>     put_page(ctx->rx_pg);
> >> @@ -117,32 +206,63 @@ static void rxtx_unmap(struct ffa_ctx *ctx)
> >>     ctx->tx_pg =3D NULL;
> >>     ctx->page_count =3D 0;
> >>     ctx->rx_is_free =3D false;
> >> +
> >> +    return FFA_RET_OK;
> >> }
> >>
> >> uint32_t ffa_handle_rxtx_unmap(void)
> >> {
> >> -    struct domain *d =3D current->domain;
> >> +    return rxtx_unmap(current->domain);
> >> +}
> >> +
> >> +int32_t ffa_rx_acquire(struct domain *d)
> >> +{
> >> +    int32_t ret =3D FFA_RET_OK;
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >>
> >> -    if ( !ctx->rx )
> >> -        return FFA_RET_INVALID_PARAMETERS;
> >> +    spin_lock(&ctx->rx_lock);
> >>
> >> -    rxtx_unmap(ctx);
> >> +    if ( !ctx->page_count )
> >> +    {
> >> +        ret =3D FFA_RET_DENIED;
> >> +        goto out;
> >> +    }
> >>
> >> -    return FFA_RET_OK;
> >> +    if ( !ctx->rx_is_free )
> >> +    {
> >> +        ret =3D FFA_RET_BUSY;
> >> +        goto out;
> >> +    }
> >> +
> >> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> >> +    {
> >> +        ret =3D ffa_simple_call(FFA_RX_ACQUIRE, ffa_get_vm_id(d), 0, =
0, 0);
> >> +        if ( ret !=3D FFA_RET_OK )
> >> +            goto out;
> >> +    }
> >> +    ctx->rx_is_free =3D false;
> >> +out:
> >> +    spin_unlock(&ctx->rx_lock);
> >> +
> >> +    return ret;
> >> }
> >>
> >> -int32_t ffa_handle_rx_release(void)
> >> +int32_t ffa_rx_release(struct domain *d)
> >> {
> >>     int32_t ret =3D FFA_RET_DENIED;
> >> -    struct domain *d =3D current->domain;
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >>
> >> -    if ( !spin_trylock(&ctx->rx_lock) )
> >> -        return FFA_RET_BUSY;
> >> +    spin_lock(&ctx->rx_lock);
> >>
> >>     if ( !ctx->page_count || ctx->rx_is_free )
> >>         goto out;
> >> +
> >> +    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> >> +    {
> >> +        ret =3D ffa_simple_call(FFA_RX_RELEASE, ffa_get_vm_id(d), 0, =
0, 0);
> >> +        if ( ret !=3D FFA_RET_OK )
> >> +            goto out;
> >> +    }
> >>     ret =3D FFA_RET_OK;
> >>     ctx->rx_is_free =3D true;
> >> out:
> >> @@ -151,23 +271,9 @@ out:
> >>     return ret;
> >> }
> >>
> >> -static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> >> -                            uint32_t page_count)
> >> -{
> >> -    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_co=
unt, 0);
> >> -}
> >> -
> >> -static int32_t ffa_rxtx_unmap(void)
> >> -{
> >> -    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
> >> -}
> >> -
> >> void ffa_rxtx_domain_destroy(struct domain *d)
> >> {
> >> -    struct ffa_ctx *ctx =3D d->arch.tee;
> >> -
> >> -    if ( ctx->rx )
> >> -        rxtx_unmap(ctx);
> >> +    rxtx_unmap(d);
> >> }
> >>
> >> void ffa_rxtx_destroy(void)
> >> @@ -186,7 +292,7 @@ void ffa_rxtx_destroy(void)
> >>     }
> >>
> >>     if ( need_unmap )
> >> -        ffa_rxtx_unmap();
> >> +        ffa_rxtx_unmap(0);
> >> }
> >>
> >> bool ffa_rxtx_init(void)
> >> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> >> index 29675f9ba3f7..d628c1b70609 100644
> >> --- a/xen/arch/arm/tee/ffa_shm.c
> >> +++ b/xen/arch/arm/tee/ffa_shm.c
> >> @@ -16,21 +16,6 @@
> >>
> >> #include "ffa_private.h"
> >>
> >> -/* Constituent memory region descriptor */
> >> -struct ffa_address_range {
> >> -    uint64_t address;
> >> -    uint32_t page_count;
> >> -    uint32_t reserved;
> >> -};
> >> -
> >> -/* Composite memory region descriptor */
> >> -struct ffa_mem_region {
> >> -    uint32_t total_page_count;
> >> -    uint32_t address_range_count;
> >> -    uint64_t reserved;
> >> -    struct ffa_address_range address_range_array[];
> >> -};
> >> -
> >> /* Memory access permissions descriptor */
> >> struct ffa_mem_access_perm {
> >>     uint16_t endpoint_id;
> >> --
> >> 2.47.0
>
>

