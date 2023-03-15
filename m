Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF166BAF7A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 12:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510029.786959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcPbQ-0003dc-27; Wed, 15 Mar 2023 11:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510029.786959; Wed, 15 Mar 2023 11:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcPbP-0003br-Tn; Wed, 15 Mar 2023 11:47:31 +0000
Received: by outflank-mailman (input) for mailman id 510029;
 Wed, 15 Mar 2023 11:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm4b=7H=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pcPbO-0003bl-Iq
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 11:47:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2977b077-c327-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 12:47:28 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so887673wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 04:47:28 -0700 (PDT)
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
X-Inumbo-ID: 2977b077-c327-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678880848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaMSQ4iMoTS8FR85L5MdSB+3rm+Ssv8YGed7FpyKj3o=;
        b=UnLWwJ41qgRlsM1Un9v4vR8/92wwDNetkAwXZTxx7+YsxYWKIFAdUErCBZcawccFSm
         qmzyzn2CpM0su1adfAgX1cUrHZmUQhBlV164SCGkRWOQKox2bDDkAsc2JvAEMD2nisAy
         JhLvOwKoBLG+Z6b+GnW60kkVCZ173waq1pQN+UfEITWWiFeXtSDKYaIHkLMdgMYUmANS
         IKIXDg85kgjC7JbZihRFaVPvTXzgj9v+RpcwWrTcTcowMrvfkaJQdp0N2g28mjw1/jYV
         Xg4bzUbo/Z/NynMdwE/zpGcwUgb0sBj2tOwTp4cAp9BKBcYTzY/UEE68zfv6zQOfxwvh
         3Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678880848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaMSQ4iMoTS8FR85L5MdSB+3rm+Ssv8YGed7FpyKj3o=;
        b=yiFsmrlifk4F/YkgcbGlgln1IuOYVWm7xFE6KBpZBuT2DHUbb/p4X5ARhK8Qzpj0Dl
         5HUy6Oy83HaYcJyaaaO+t33jeY6SAAivLNipJ6A78LeDiJYdZZ+fswnP93LFhdnnnxU2
         o4ZMdXevLSEA88Eiot6I9groZNMDiS+OJUoG8pY6TlNI9P1iwGZRKdggGlbKj3obxSAS
         tA4kpNu/jDkWWVrPiShgv2SE4+7SHWkYhtIfgfbdeDoRtEr0yVs3NyB1gSf5Qyp7Q6+P
         mk4fTh8+snoKSWXC71aptIsBkJ/V5Ab7E3Z/XT8dcWFwjlgG7iu7txsMrV8U772u/23a
         ov2A==
X-Gm-Message-State: AO0yUKVAzp3aDoJIZ1p6LKGnAO8qHpDXV+pmO8PAd4KZ/evT6FDTWMNe
	Y3NWQKZuj7RoMxdfWT00+99vpWTfd1O0RMZEF3ml0A==
X-Google-Smtp-Source: AK7set940brpzCDhq14i+QhYfzax+p+jwu25P1yahl7eIrVJeNnaZkHUvQpZNTSJCQB8TjhHiaepryeWOrYlHI4sZ7I=
X-Received: by 2002:a05:600c:4fcb:b0:3df:97a1:75e2 with SMTP id
 o11-20020a05600c4fcb00b003df97a175e2mr5187573wmq.4.1678880848296; Wed, 15 Mar
 2023 04:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5a48b7c7a56b83138932850eb7f94f90604168e4.1677079672.git.jens.wiklander@linaro.org>
 <D9FBF922-1941-401B-9794-45641A02FC19@arm.com>
In-Reply-To: <D9FBF922-1941-401B-9794-45641A02FC19@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 15 Mar 2023 12:47:17 +0100
Message-ID: <CAHUa44FUHKqzSY1V0WV7-=LQEJTUuBFt_hLGsMbtgRsCtPuQTA@mail.gmail.com>
Subject: Re: [XEN PATCH v7 20/20] xen/arm: ffa: support sharing large memory ranges
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Mar 15, 2023 at 11:13=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds support for sharing large memory ranges transmitted in fragments
> > using FFA_MEM_FRAG_TX.
> >
> > The implementation is the bare minimum to be able to communicate with
> > OP-TEE running as an SPMC at S-EL1.
> >
> > Adds a check that the SP supports the needed FF-A feature
> > FFA_MEM_FRAG_TX.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 254 ++++++++++++++++++++++++++++++++++++++---
> > 1 file changed, 240 insertions(+), 14 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 3557edc455d0..72c0249d8cad 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -326,6 +326,7 @@ struct ffa_ctx {
> >     uint32_t guest_vers;
> >     bool tx_is_mine;
> >     bool interrupted;
> > +    struct list_head frag_list;
> >     struct list_head shm_list;
> >     unsigned int shm_count;
> >     spinlock_t lock;
> > @@ -340,6 +341,18 @@ struct ffa_shm_mem {
> >     struct page_info *pages[];
> > };
>
> We start to have a lot of fields here.
> It might be useful to have some quick documentation
> in comment here as some names are a bit generic.
> For example "frag_list" does not say much.

I'll add some comments.

>
> >
> > +struct mem_frag_state {
> > +    struct list_head list;
> > +    struct ffa_shm_mem *shm;
> > +    uint32_t range_count;
> > +    unsigned int current_page_idx;
> > +    unsigned int frag_offset;
> > +    unsigned int range_offset;
> > +    const uint8_t *buf;
> > +    unsigned int buf_size;
> > +    struct ffa_address_range range;
> > +};
>
> same here, at a first glance it is not quite clear why
> a fragment needs that much info. Some seem to only
> be needed during the transaction but do not need to be saved.

This struct is only used during the transaction, so this is freed once
the entire memory transaction descriptor has been processed.

>
> > +
> > /* Negotiated FF-A version to use with the SPMC */
> > static uint32_t ffa_version __ro_after_init;
> >
> > @@ -512,6 +525,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uin=
t32_t frag_len,
> >     }
> > }
> >
> > +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> > +                               uint16_t sender_id)
> > +{
> > +    struct arm_smccc_1_2_regs arg =3D {
> > +        .a0 =3D FFA_MEM_FRAG_TX,
> > +        .a1 =3D handle & UINT32_MAX,
> > +        .a2 =3D handle >> 32,
> > +        .a3 =3D frag_len,
> > +        .a4 =3D (uint32_t)sender_id << 16,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    switch ( resp.a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp.a2 )
> > +            return resp.a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +        return FFA_RET_OK;
> > +    case FFA_MEM_FRAG_RX:
> > +        return resp.a3;
> > +    default:
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> >                                uint32_t flags)
> > {
> > @@ -586,6 +629,14 @@ static void set_regs_success(struct cpu_user_regs =
*regs, uint32_t w2,
> >     set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> > }
> >
> > +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t hand=
le_lo,
> > +                             uint32_t handle_hi, uint32_t frag_offset,
> > +                             uint16_t sender_id)
> > +{
> > +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> > +             (uint32_t)sender_id << 16, 0, 0, 0);
> > +}
> > +
> > static void handle_version(struct cpu_user_regs *regs)
> > {
> >     struct domain *d =3D current->domain;
> > @@ -955,6 +1006,8 @@ static int share_shm(struct ffa_shm_mem *shm)
> >     paddr_t last_pa;
> >     unsigned int n;
> >     paddr_t pa;
> > +    bool first;
> > +    int ret;
> >
> >     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
> >     if ( !shm->page_count )
> > @@ -994,13 +1047,23 @@ static int share_shm(struct ffa_shm_mem *shm)
> >
> >     tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
,
> >                                 region_descr->address_range_count);
> > -    if ( tot_len > max_frag_len )
> > -        return FFA_RET_NOT_SUPPORTED;
> >
> > +    /*
> > +     * Sharing memory with secure world may have to be done with multi=
ple
> > +     * calls depending on how many address ranges will be needed. If w=
e're
> > +     * sharing physically contiguous memory we will only need one rang=
e but
> > +     * we will also need to deal with the worst case where all physica=
l
> > +     * pages are non-contiguous. For the first batch of address ranges=
 we
> > +     * call ffa_mem_share() and for all that follows ffa_mem_frag_tx()=
.
> > +     *
> > +     * We use frag_len to keep track of how far into the transmit buff=
er we
> > +     * have gone.
> > +     */
> >     addr_range =3D region_descr->address_range_array;
> >     frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_coun=
t, 1);
> >     last_pa =3D page_to_maddr(shm->pages[0]);
> >     init_range(addr_range, last_pa);
> > +    first =3D true;
> >     for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> >     {
> >         pa =3D page_to_maddr(shm->pages[n]);
> > @@ -1010,12 +1073,34 @@ static int share_shm(struct ffa_shm_mem *shm)
> >             continue;
> >         }
> >
> > -        frag_len +=3D sizeof(*addr_range);
> > -        addr_range++;
> > +        if ( frag_len =3D=3D max_frag_len )
> > +        {
> > +            if ( first )
> > +            {
> > +                ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->h=
andle);
> > +                first =3D false;
> > +            }
> > +            else
> > +            {
> > +                ret =3D ffa_mem_frag_tx(shm->handle, frag_len, shm->se=
nder_id);
> > +            }
> > +            if ( ret <=3D 0 )
> > +                return ret;
> > +            frag_len =3D sizeof(*addr_range);
> > +            addr_range =3D buf;
> > +        }
> > +        else
> > +        {
> > +            frag_len +=3D sizeof(*addr_range);
> > +            addr_range++;
> > +        }
> >         init_range(addr_range, pa);
> >     }
> >
> > -    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> > +    if ( first )
> > +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> > +    else
> > +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> > }
> >
> > static int read_mem_transaction(uint32_t ffa_vers, const void *buf, siz=
e_t blen,
> > @@ -1092,8 +1177,53 @@ static int read_mem_transaction(uint32_t ffa_ver=
s, const void *buf, size_t blen,
> >     return 0;
> > }
> >
> > +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int o=
ffs,
> > +                              unsigned int frag_len)
> > +{
> > +    struct domain *d =3D current->domain;
> > +    unsigned int o =3D offs;
> > +    unsigned int l;
> > +    int ret;
> > +
> > +    if ( frag_len < o )
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    /* Fill up the first struct ffa_address_range */
> > +    l =3D min_t(unsigned int, frag_len - o, sizeof(s->range) - s->rang=
e_offset);
> > +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> > +    s->range_offset +=3D l;
> > +    o +=3D l;
> > +    if ( s->range_offset !=3D sizeof(s->range) )
> > +        goto out;
> > +    s->range_offset =3D 0;
> > +
> > +    while ( true )
> > +    {
> > +        ret =3D get_shm_pages(d, s->shm, &s->range, 1, s->current_page=
_idx,
> > +                            &s->current_page_idx);
> > +        if ( ret )
> > +            return ret;
> > +        if ( s->range_count =3D=3D 1 )
> > +            return 0;
> > +        s->range_count--;
> > +        if ( frag_len - o < sizeof(s->range) )
> > +            break;
> > +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> > +        o +=3D sizeof(s->range);
> > +    }
> > +
> > +    /* Collect any remaining bytes for the next struct ffa_address_ran=
ge */
> > +    s->range_offset =3D frag_len - o;
> > +    memcpy(&s->range, s->buf + o, frag_len - o);
> > +out:
> > +    s->frag_offset +=3D frag_len;
> > +
> > +    return s->frag_offset;
> > +}
> > +
> > static void handle_mem_share(struct cpu_user_regs *regs)
> > {
> > +    static uint64_t next_handle =3D FFA_HANDLE_HYP_FLAG;
> >     uint32_t tot_len =3D get_user_reg(regs, 1);
> >     uint32_t frag_len =3D get_user_reg(regs, 2);
> >     uint64_t addr =3D get_user_reg(regs, 3);
> > @@ -1128,13 +1258,6 @@ static void handle_mem_share(struct cpu_user_reg=
s *regs)
> >         goto out_set_ret;
> >     }
> >
> > -    /* We currently only support a single fragment */
> > -    if ( frag_len !=3D tot_len )
> > -    {
> > -        ret =3D FFA_RET_NOT_SUPPORTED;
> > -        goto out_set_ret;
> > -    }
> > -
> >     spin_lock(&ctx->lock);
> >
> >     if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
> > @@ -1195,11 +1318,41 @@ static void handle_mem_share(struct cpu_user_re=
gs *regs)
> >     if ( !shm )
> >     {
> >         ret =3D FFA_RET_NO_MEMORY;
> > -        goto out_unlock;
> > +        goto out;
>
> Why is this changed ?
> You still have no shm here so call free_sha_shm does not make sense

Good catch, I'll fix it.

>
> >     }
> >     shm->sender_id =3D trans.sender_id;
> >     shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> >
> > +    if ( frag_len !=3D tot_len )
> > +    {
> > +        struct mem_frag_state *s =3D xzalloc(struct mem_frag_state);
> > +
> > +        if ( !s )
> > +        {
> > +            ret =3D FFA_RET_NO_MEMORY;
> > +            goto out;
> > +        }
> > +        s->shm =3D shm;
> > +        s->range_count =3D range_count;
> > +        s->buf =3D ctx->tx;
> > +        s->buf_size =3D ffa_page_count * FFA_PAGE_SIZE;
> > +        ret =3D add_mem_share_frag(s, sizeof(*region_descr)  + region_=
offs,
> > +                                 frag_len);
> > +        if ( ret <=3D 0 )
> > +        {
> > +            xfree(s);
> > +            if ( ret < 0 )
> > +                goto out;
> > +        }
> > +        else
> > +        {
> > +            shm->handle =3D next_handle++;
> > +            uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> > +            list_add_tail(&s->list, &ctx->frag_list);
> > +        }
> > +        goto out_unlock;
> > +    }
> > +
> >     /*
> >      * Check that the Composite memory region descriptor fits.
> >      */
> > @@ -1238,7 +1391,75 @@ out_unlock:
> >     spin_unlock(&ctx->lock);
> >
> > out_set_ret:
> > -    if ( ret =3D=3D 0)
> > +    if ( ret > 0 )
> > +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.se=
nder_id);
> > +    else if ( ret =3D=3D 0)
> > +            set_regs_success(regs, handle_lo, handle_hi);
> > +    else
> > +            set_regs_error(regs, ret);
> > +}
> > +
> > +static struct mem_frag_state *find_frag_state(struct ffa_ctx *ctx,
> > +                                              uint64_t handle)
> > +{
> > +    struct mem_frag_state *s;
> > +
> > +    list_for_each_entry(s, &ctx->frag_list, list)
> > +        if ( s->shm->handle =3D=3D handle )
> > +            return s;
> > +
> > +    return NULL;
> > +}
> > +
> > +static void handle_mem_frag_tx(struct cpu_user_regs *regs)
> > +{
> > +    struct domain *d =3D current->domain;
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +    uint32_t frag_len =3D get_user_reg(regs, 3);
> > +    uint32_t handle_lo =3D get_user_reg(regs, 1);
> > +    uint32_t handle_hi =3D get_user_reg(regs, 2);
> > +    uint64_t handle =3D regpair_to_uint64(handle_hi, handle_lo);
> > +    struct mem_frag_state *s;
> > +    uint16_t sender_id =3D 0;
> > +    int ret;
> > +
> > +    spin_lock(&ctx->lock);
> > +    s =3D find_frag_state(ctx, handle);
> > +    if ( !s )
> > +    {
> > +        ret =3D FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +    sender_id =3D s->shm->sender_id;
> > +
> > +    if ( frag_len > s->buf_size )
> > +    {
> > +        ret =3D FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    ret =3D add_mem_share_frag(s, 0, frag_len);
> > +    if ( ret =3D=3D 0 )
> > +    {
> > +        /* Note that share_shm() uses our tx buffer */
> > +        spin_lock(&ffa_tx_buffer_lock);
> > +        ret =3D share_shm(s->shm);
> > +        spin_unlock(&ffa_tx_buffer_lock);
> > +        if ( ret =3D=3D 0 )
> > +            list_add_tail(&s->shm->list, &ctx->shm_list);
> > +        else
> > +            free_ffa_shm_mem(ctx, s->shm);
> > +    }
> > +    else if ( ret < 0 )
> > +        free_ffa_shm_mem(ctx, s->shm);
>
>
> If there is not error the stuff allocated are kept but i do not see
> where/when they would be freed or used.
> Could you explain why we need to save all those ?

s->shm is the final shared memory object which is added to the list of
shared memory objects when the transaction is completed successfully.
The fragment state, s, is kept as long as the transaction is ongoing.
Once the transaction is completed successfully or due to a failure
it's freed.

The specification doesn't say what to do if an invalid frag_len is
detected, except that we should return FFA_RET_INVALID_PARAMETERS.
Currently, we just return an error, but keep the state. Another option
is to free the state instead since the caller might have lost track of
the state.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > +    list_del(&s->list);
> > +    xfree(s);
> > +out:
> > +    spin_unlock(&ctx->lock);
> > +
> > +    if ( ret > 0 )
> > +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_i=
d);
> > +    else if ( ret =3D=3D 0)
> >             set_regs_success(regs, handle_lo, handle_hi);
> >     else
> >             set_regs_error(regs, ret);
> > @@ -1357,6 +1578,9 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
> >         else
> >             set_regs_success(regs, 0, 0);
> >         return true;
> > +    case FFA_MEM_FRAG_TX:
> > +        handle_mem_frag_tx(regs);
> > +        return true;
> >
> >     default:
> >         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> > @@ -1396,6 +1620,7 @@ static int ffa_domain_init(struct domain *d)
> >         }
> >     }
> >
> > +    INIT_LIST_HEAD(&ctx->frag_list);
> >     INIT_LIST_HEAD(&ctx->shm_list);
> >
> >     d->arch.tee =3D ctx;
> > @@ -1560,6 +1785,7 @@ static bool ffa_probe(void)
> > #endif
> >          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> >          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> > +         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
> >          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> >          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >         return false;
> > --
> > 2.34.1
> >
>

