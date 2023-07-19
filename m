Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12F759A4D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 17:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565946.884583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM9YZ-00069V-9z; Wed, 19 Jul 2023 15:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565946.884583; Wed, 19 Jul 2023 15:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM9YZ-00067i-6e; Wed, 19 Jul 2023 15:57:39 +0000
Received: by outflank-mailman (input) for mailman id 565946;
 Wed, 19 Jul 2023 15:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8L3=DF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qM9YX-00067c-Ae
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 15:57:37 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f66a22-264c-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 17:57:33 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b0156a1c49so5354950fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 08:57:33 -0700 (PDT)
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
X-Inumbo-ID: f8f66a22-264c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689782252; x=1690387052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svetkbUc1rTQYh6Z0Ofw6Rk/aQhd8hKQb+XXFFjwwrA=;
        b=LSsNqzmbjJmJRRm5Asej15BsJ6jP2fhwNe28as1vXwmebqIM1dvVUgPtc7cP6hDqwZ
         IvsPslTNkoHsy76hUOAnbnSXdKrX4CVD3gSPf0x6aakfB7Ce5GR2MZqFc8el6qMaCuFT
         92AI4FRkpWOo3R1C6Ritlx3ok1pvfTEsjRhi4h3ABCU9B7UP3LrHWnEGMktBCosRih7s
         6NXjWiHPu90PiFYR6uFKDoSq620y6ONZnNKMKvrNbylFwdo1ai4zyk6amL/0C4sxo4Em
         fHnW5UagI2pDj2PGE2l2O2R1MYW1ccdSb+LcTouLjcBhzPzj56rMTXrdoG88Xf1rqXzP
         x62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782252; x=1690387052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svetkbUc1rTQYh6Z0Ofw6Rk/aQhd8hKQb+XXFFjwwrA=;
        b=S8RrzVGO2/XH81AIJepvmJCqfFyjrU13BT870mrC/gnrbJDPaa0+LRlQ6DJFtVINJH
         1cHeHS8oaI0oxz0oGnw9q4upq1YIpTvr3tZ6y05q4mp9kfHVapyO43aMpGvi0YrwVjAb
         4VUGzHl/fVZD0XwtZOaxKH/xF+4nE1LAn+0/fhT+gYeLCYC0YuxLE22sALFNE7TvksWH
         k9Bypg6lLYVMMcrrDiW2vctnoPdyPe9/XZOVqxxrmQuujaWM9C33p3S10IfkXYPTv8tS
         3WFU6COrnkRNZmDoJFzzTMuEq/Pry/trnBKZw6z0g6TBUZEXYK25dilmTT+U6DXcY1ms
         ZZjQ==
X-Gm-Message-State: ABy/qLba1luJWGOZNTxRl6ceg8omu69AbUtkcMXOKOIlDNtPEmpQdq/e
	bEIe6/pX6QXVNPqokbOKKn+j+dfN2B3zOqs2gBdZZg==
X-Google-Smtp-Source: APBJJlE7faV8k8I/dHWo//rId4KWKE211+9wKED+v1djAdWFvCeIcBGM7hSzpvZQikRx+TSg0wOQNiRYio8NaVk10hs=
X-Received: by 2002:a05:6870:3929:b0:1b0:48aa:e0a9 with SMTP id
 b41-20020a056870392900b001b048aae0a9mr2949187oap.3.1689782252561; Wed, 19 Jul
 2023 08:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-21-jens.wiklander@linaro.org> <8304EFA9-FA48-4823-B7B0-11311351592B@arm.com>
In-Reply-To: <8304EFA9-FA48-4823-B7B0-11311351592B@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Jul 2023 17:57:21 +0200
Message-ID: <CAHUa44HSQ1nE8cKyUPwR6RS5-O=M7dhFtbFgUCpCpXEx1KHj4Q@mail.gmail.com>
Subject: Re: [XEN PATCH v10 20/24] xen/arm: ffa: support sharing large memory ranges
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Jul 19, 2023 at 11:37=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 17 Jul 2023, at 09:21, Jens Wiklander <jens.wiklander@linaro.org> wr=
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
> > xen/arch/arm/tee/ffa.c | 253 ++++++++++++++++++++++++++++++++++++++---
> > 1 file changed, 240 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index c623c51168b9..ac23b9edc74c 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -359,6 +359,8 @@ struct ffa_ctx {
> >      */
> >     uint16_t create_signal_count;
> >     bool rx_is_free;
> > +    /* Currently used fragment states, struct mem_frag_state */
> > +    struct list_head frag_list;
> >     /* Used shared memory objects, struct ffa_shm_mem */
> >     struct list_head shm_list;
> >     /* Number of allocated shared memory object */
> > @@ -375,6 +377,18 @@ struct ffa_shm_mem {
> >     struct page_info *pages[];
> > };
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
> Please add some comments inside this structure as
> from reading the code it is not quite clear what is done.

OK

>
> > +
> > /* Negotiated FF-A version to use with the SPMC */
> > static uint32_t __ro_after_init ffa_version;
> >
> > @@ -538,6 +552,36 @@ static int32_t ffa_mem_share(uint32_t tot_len, uin=
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
> > @@ -627,6 +671,14 @@ static void set_regs_success(struct cpu_user_regs =
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
> > @@ -999,6 +1051,8 @@ static int share_shm(struct ffa_shm_mem *shm)
> >     paddr_t last_pa;
> >     unsigned int n;
> >     paddr_t pa;
> > +    bool first;
> > +    int ret;
> >
> >     ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
> >     ASSERT(shm->page_count);
> > @@ -1034,13 +1088,23 @@ static int share_shm(struct ffa_shm_mem *shm)
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
> > @@ -1050,12 +1114,34 @@ static int share_shm(struct ffa_shm_mem *shm)
> >             continue;
> >         }
> >
> > -        frag_len +=3D sizeof(*addr_range);
> > -        addr_range++;
> > +        if ( frag_len =3D=3D max_frag_len )
>
> This test seem a bit dangerous as there is nothing ensuring that frag_len=
 will end
> up aligned to a page.

flag_len is always a multiple of 16

>
> I would suggest here to do frag_len + sizeof(*addr_range) > max_frag_len =
to check
> if we can fit or not an extra address range in the area.

If we have that check instead, then I'm not sure what we should do
with the part that doesn't belong there.

>
>
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
> > @@ -1132,8 +1218,53 @@ static int read_mem_transaction(uint32_t ffa_ver=
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
>
> The magic here after requires some explanation, could you add more detail=
s in
> the comment ?

OK

>
> > +    l =3D min_t(unsigned int, frag_len - o, sizeof(s->range) - s->rang=
e_offset);
> > +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> > +    s->range_offset +=3D l;
> > +    o +=3D l;
> > +    if ( s->range_offset !=3D sizeof(s->range) )
> > +        goto out;
>
> Shouldn't we test this before doing the memcpy ?
> Is this an error case ?

No, it's an unusually small fragment but not necessarily an error.

> What is the expected frag_offset value here ?

That depends, usually, I'd expect it to be a multiple of 4k, but the
caller can use different fragment lengths.

>
>
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
>
> Overall the processing in this function is not quite clear so we either n=
eed
> to add comments to explain it more or find a better way to implement to m=
ake
> it a bit clearer.
>
> The implementation for fragmented memory sharing requests here is very
> complex and I am not quite feeling confident that it does not contains bu=
gs.

Yeah, I had to debug it a few time before I got it to work. This is
one of the more complicated parts of the specification.

>
> As this is not something required to have optee support, I would suggest =
to
> discard this part for now in the support.
>
> What do you think ?

Sure, we can skip it for now. I'll remove it from the next version of
the patch set.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > +
> > static void handle_mem_share(struct cpu_user_regs *regs)
> > {
> > +    static uint64_t next_handle =3D FFA_HANDLE_HYP_FLAG;
> >     uint32_t tot_len =3D get_user_reg(regs, 1);
> >     uint32_t frag_len =3D get_user_reg(regs, 2);
> >     uint64_t addr =3D get_user_reg(regs, 3);
> > @@ -1168,13 +1299,6 @@ static void handle_mem_share(struct cpu_user_reg=
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
> > @@ -1240,6 +1364,36 @@ static void handle_mem_share(struct cpu_user_reg=
s *regs)
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
> > +        s->buf_size =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
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
> > @@ -1278,7 +1432,75 @@ out_unlock:
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
> > +        goto out_free_s;
> > +    }
> > +
> > +    ret =3D add_mem_share_frag(s, 0, frag_len);
> > +    if ( ret < 0 )
> > +        goto out_free_s;
> > +
> > +    /* Note that share_shm() uses our tx buffer */
> > +    spin_lock(&ffa_tx_buffer_lock);
> > +    ret =3D share_shm(s->shm);
> > +    spin_unlock(&ffa_tx_buffer_lock);
> > +    if ( ret < 0 )
> > +        goto out_free_s;
> > +    list_add_tail(&s->shm->list, &ctx->shm_list);
> > +out_free_s:
> > +    if ( ret < 0 )
> > +        free_ffa_shm_mem(ctx, s->shm);
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
> > @@ -1391,6 +1613,9 @@ static bool ffa_handle_call(struct cpu_user_regs =
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
> > @@ -1432,6 +1657,7 @@ static int ffa_domain_init(struct domain *d)
> >     }
> >     ctx->create_signal_count =3D n;
> >
> > +    INIT_LIST_HEAD(&ctx->frag_list);
> >     INIT_LIST_HEAD(&ctx->shm_list);
> >
> >     return 0;
> > @@ -1625,6 +1851,7 @@ static bool ffa_probe(void)
> >          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
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

