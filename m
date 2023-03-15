Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCCE6BB61C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 15:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510093.787161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSC0-0007wO-2c; Wed, 15 Mar 2023 14:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510093.787161; Wed, 15 Mar 2023 14:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSBz-0007ua-Vx; Wed, 15 Mar 2023 14:33:27 +0000
Received: by outflank-mailman (input) for mailman id 510093;
 Wed, 15 Mar 2023 14:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm4b=7H=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pcSBy-0007uT-3j
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 14:33:26 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 561230dd-c33e-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 15:33:22 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 m18-20020a05600c3b1200b003ed2a3d635eso1377976wms.4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 07:33:22 -0700 (PDT)
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
X-Inumbo-ID: 561230dd-c33e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678890801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmjMcqgn3FYCAoeZ6lrz6/YNjPZkX/WYGTVNpDqi4Lk=;
        b=iSKZSIQs3Tq5rpB2BszMm/bxxA1MuUMNRuiDLfIO0FeUmM3n7s1xmw5TOj7r8P6eVP
         O7gSZ2xhSMMZ7nNA+yxZOYQlLbM/MwVAld4cPtfLTR8fbPdhcybN56cy5R82nFYldoHv
         pF/IDEQN0lzcXCo6pWKBGNNYLws/xzYSeiAhdkfrH6lJBNkcSW8IYuBMP5tqfwmsZr/Q
         PFdGlisrJRVYodMAtPz2gskDdtuobps3oWKugR+r88orUMhff/IabGPzhg99fscdEXXU
         pjxSIvFtcwwSWoumiAJcdT/SYAzkg8OkH5MWe4tTEm8O8byCSt6R4wBJh0IlCiv6XUf0
         9GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678890801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmjMcqgn3FYCAoeZ6lrz6/YNjPZkX/WYGTVNpDqi4Lk=;
        b=ugDdyZlD744bo+avyRYm0LBnSMf58SkAYCELmiuP5UJfmgCad2RPeMmGJC9DzYNrE3
         JX0+SSUhivzg2BqDyMq9DmqrBz/5QuT0qcpqsBY3tVshPgn0MK+f0vjIoBFvJde02kWd
         ucKxTBeEY9TxCIYnolbzT2Ne/W5/Hs2HkYeXFWx/r+ux7/l6r6hOoJeDpWBU8Y7J1s/G
         kZBl56MQz4A4tRhcmwwFiuCrDdOsvm+oirGlGKuO08+lr0tmGw6bUl/nFkkcXK9qr8C1
         Osvmlin4Dgm08Hl2lc3DRhKeFXTSE//DY5QRFMZQyAc1/Ce47OBe9tItDDu1dD6V0wWa
         3vaA==
X-Gm-Message-State: AO0yUKUeuhQM5EOJqWnJb7lRPJa+sQjqGbJ6kCrwQOTqeQYIoItQKUE2
	HXZwaEW5XrzW16tozdfoplcgZMad15462NGDlRZZSg==
X-Google-Smtp-Source: AK7set/EIjff+tV12+ujW+dgARTgV2Zmx/NtYhKjDtF5z2w+kHGjKacUgd0pNhH+9HFQRk+E/1SDmmYNjs+IkL9vMZ8=
X-Received: by 2002:a05:600c:512a:b0:3ed:26fa:6ee5 with SMTP id
 o42-20020a05600c512a00b003ed26fa6ee5mr2844775wms.4.1678890801259; Wed, 15 Mar
 2023 07:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <fdca8effb1c2c209fd9d15c90360196fa67a845c.1677079672.git.jens.wiklander@linaro.org>
 <CC630914-0816-40F9-B33C-86EC4E3B4BE6@arm.com> <CAHUa44FHh1d4+6dc2CW0Zpu+7uBaK0i=DRENQbtZwGoOR50aDw@mail.gmail.com>
 <ABA67A6F-F0D4-413C-9FD1-C7E2FF8FAF16@arm.com>
In-Reply-To: <ABA67A6F-F0D4-413C-9FD1-C7E2FF8FAF16@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 15 Mar 2023 15:33:09 +0100
Message-ID: <CAHUa44Fu6G-xKesrXn8uWaOTW4ujf=S0XtOgPcnGvwHdZxLTJA@mail.gmail.com>
Subject: Re: [XEN PATCH v7 18/20] xen/arm: ffa: support sharing memory
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Mar 15, 2023 at 2:24=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 14 Mar 2023, at 18:56, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Mon, Mar 13, 2023 at 9:49=E2=80=AFAM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Adds support for a guest to share memory with an SP using FFA_MEM_SHA=
RE
> >>> and FFA_MEM_RECLAIM. Only small memory regions can be shared using a
> >>> single call to FFA_MEM_SHARE are supported.
> >>
> >> This sentence needs a bit of rephrasing and to add more details: what =
is "small".
> >
> > OK, how about "Only memory regions small enough to be shared with a
> > single call..."
>
> Ok
>
> >
> >>
> >>>
> >>> A memory region that doesn't need to be shared any longer can be
> >>> reclaimed with FFA_MEM_RECLAIM once the SP doesn't use it any longer.
> >>> This is checked by the SPMC and not in control of the mediator.
> >>
> >> This explanation would make more sense in the following patch adding s=
upport
> >> for Reclaim.
> >
> > Quite right, I'll move it to the next patch.
> >
> >>
> >>>
> >>> With this commit we have a FF-A version 1.1 [1] mediator able to
> >>> communicate with a Secure Partition in secure world using shared memo=
ry.
> >>> The secure world must use FF-A version 1.1, but the guest is free to =
use
> >>> version 1.0 or version 1.1.
> >>
> >> I do not see anything limiting that in the code.
> >> During init we accept 1.0 or 1.1 versions of the secure world.
> >
> > Good catch, I'll update to only accept version 1.1 in the secure world.
> >
> >>
> >>>
> >>> Adds a check that the SP supports the needed FF-A features
> >>> FFA_MEM_SHARE_64 or FFA_MEM_SHARE_32.
> >>>
> >>> [1] https://developer.arm.com/documentation/den0077/latest
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/ffa.c | 491 ++++++++++++++++++++++++++++++++++++++++=
+
> >>> 1 file changed, 491 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index 94c90b252454..cdc286caf62c 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -270,6 +270,38 @@ struct ffa_mem_transaction_1_1 {
> >>>    uint8_t reserved[12];
> >>> };
> >>>
> >>> +/* Calculate offset of struct ffa_mem_access from start of buffer */
> >>> +#define MEM_ACCESS_OFFSET(access_idx) \
> >>> +    ( sizeof(struct ffa_mem_transaction_1_1) + \
> >>> +      ( access_idx ) * sizeof(struct ffa_mem_access) )
> >>> +
> >>> +/* Calculate offset of struct ffa_mem_region from start of buffer */
> >>> +#define REGION_OFFSET(access_count, region_idx) \
> >>> +    ( MEM_ACCESS_OFFSET(access_count) + \
> >>> +      ( region_idx ) * sizeof(struct ffa_mem_region) )
> >>> +
> >>> +/* Calculate offset of struct ffa_address_range from start of buffer=
 */
> >>> +#define ADDR_RANGE_OFFSET(access_count, region_count, range_idx) \
> >>> +    ( REGION_OFFSET(access_count, region_count) + \
> >>> +      ( range_idx ) * sizeof(struct ffa_address_range) )
> >>> +
> >>> +/*
> >>> + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> >>> + * ffa_mem_transaction_1_1, used to provide an abstraction of differ=
ence in
> >>> + * data structures between version 1.0 and 1.1. This is just an inte=
rnal
> >>> + * interface and can be changed without changing any ABI.
> >>> + */
> >>> +struct ffa_mem_transaction_x {
> >>
> >> I would suggest to s/_x/_int/ in the name here
> >
> > OK, I'll update
> >
> >>
> >>> +    uint16_t sender_id;
> >>> +    uint8_t mem_reg_attr;
> >>> +    uint8_t flags;
> >>> +    uint8_t mem_access_size;
> >>> +    uint8_t mem_access_count;
> >>> +    uint16_t mem_access_offs;
> >>> +    uint64_t global_handle;
> >>> +    uint64_t tag;
> >>> +};
> >>> +
> >>> /* Endpoint RX/TX descriptor */
> >>> struct ffa_endpoint_rxtx_descriptor_1_0 {
> >>>    uint16_t sender_id;
> >>> @@ -294,8 +326,20 @@ struct ffa_ctx {
> >>>    uint32_t guest_vers;
> >>>    bool tx_is_mine;
> >>>    bool interrupted;
> >>> +    struct list_head shm_list;
> >>> +    unsigned int shm_count;
> >>>    spinlock_t lock;
> >>> };
> >>> +
> >>> +struct ffa_shm_mem {
> >>> +    struct list_head list;
> >>> +    uint16_t sender_id;
> >>> +    uint16_t ep_id;     /* endpoint, the one lending */
> >>> +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> >>> +    unsigned int page_count;
> >>> +    struct page_info *pages[];
> >>> +};
> >>> +
> >>> /* Negotiated FF-A version to use with the SPMC */
> >>> static uint32_t ffa_version __ro_after_init;
> >>>
> >>> @@ -310,6 +354,8 @@ static unsigned int subscr_vm_destroyed_count __r=
ead_mostly;
> >>> *
> >>> * ffa_page_count is the number of pages used in each of these buffers=
.
> >>> *
> >>> + * The TX buffer is protected from concurrent usage with ffa_tx_buff=
er_lock.
> >>> + *
> >>> * The RX buffer is protected from concurrent usage with ffa_rx_buffer=
_lock.
> >>> * Note that the SPMC is also tracking the ownership of our RX buffer =
so
> >>> * for calls which uses our RX buffer to deliver a result we must call
> >>> @@ -319,6 +365,7 @@ static void *ffa_rx __read_mostly;
> >>> static void *ffa_tx __read_mostly;
> >>> static unsigned int ffa_page_count __read_mostly;
> >>> static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> >>> +static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
> >>>
> >>> static bool ffa_get_version(uint32_t *vers)
> >>> {
> >>> @@ -429,6 +476,42 @@ static int32_t ffa_rx_release(void)
> >>>    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> >>> }
> >>>
> >>> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> >>> +                             register_t addr, uint32_t pg_count,
> >>> +                             uint64_t *handle)
> >>> +{
> >>> +    struct arm_smccc_1_2_regs arg =3D {
> >>> +        .a0 =3D FFA_MEM_SHARE_32,
> >>> +        .a1 =3D tot_len,
> >>> +        .a2 =3D frag_len,
> >>> +        .a3 =3D addr,
> >>> +        .a4 =3D pg_count,
> >>> +    };
> >>> +    struct arm_smccc_1_2_regs resp;
> >>> +
> >>> +    if ( IS_ENABLED(CONFIG_ARM_64) )
> >>> +        arg.a0 =3D FFA_MEM_SHARE_64;
> >>> +
> >>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>> +
> >>> +    switch ( resp.a0 )
> >>> +    {
> >>> +    case FFA_ERROR:
> >>> +        if ( resp.a2 )
> >>> +            return resp.a2;
> >>> +        else
> >>> +            return FFA_RET_NOT_SUPPORTED;
> >>> +    case FFA_SUCCESS_32:
> >>> +        *handle =3D regpair_to_uint64(resp.a3, resp.a2);
> >>> +        return FFA_RET_OK;
> >>> +    case FFA_MEM_FRAG_RX:
> >>> +        *handle =3D regpair_to_uint64(resp.a2, resp.a1);
> >>> +        return resp.a3;
> >>
> >> You are using an int32_t type to cast something that is uint32_t from =
the spec
> >> and here could in fact be a uint64_t.
> >
> > In practice only much smaller values can be valid, however, I
> > understand that that's not your point. What's the best recovery if the
> > SPMC gives an invalid value for FFA_MEM_FRAG_RX? The SPMC has
> > allocated a memory-sharing state when it returns FFA_MEM_FRAG_RX. The
> > specification doesn't say how to remove that state apart from either
> > completing it successfully or if it's terminated earlier by the SPMC.
> > One option is to do a FFA_MEM_FRAG_TX call with invalid arguments so
> > that the SPMC can free up the memory-sharing state. Thoughts?
>
> I do not think it is Xen responsability to fix SPMC problems here.
> If we detect something of an error we should just return back an error to=
 the client.
>
> If the SPMC is returning an invalid value, we cannot really make much ass=
umptions.
>
> An other solution here would just be to mask out to prevent the implicit =
cast.

OK, I'll do that.

>
> >
> >>
> >>
> >>> +    default:
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>> +    }
> >>> +}
> >>> +
> >>> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> >>>                                      uint8_t msg)
> >>> {
> >>> @@ -757,6 +840,404 @@ out:
> >>>             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 &=
 mask);
> >>> }
> >>>
> >>> +/*
> >>> + * Gets all page and assigns them to the supplied shared memory obje=
ct. If
> >>> + * this function fails then the caller is still expected to call
> >>> + * put_shm_pages() as a cleanup.
> >>> + */
> >>> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> >>> +                         const struct ffa_address_range *range,
> >>> +                         uint32_t range_count, unsigned int start_pa=
ge_idx,
> >>> +                         unsigned int *last_page_idx)
> >>> +{
> >>> +    unsigned int pg_idx =3D start_page_idx;
> >>> +    gfn_t gfn;
> >>> +    unsigned int n;
> >>> +    unsigned int m;
> >>> +    p2m_type_t t;
> >>> +    uint64_t addr;
> >>> +
> >>> +    for ( n =3D 0; n < range_count; n++ )
> >>> +    {
> >>> +        for ( m =3D 0; m < range[n].page_count; m++ )
> >>> +        {
> >>> +            if ( pg_idx >=3D shm->page_count )
> >>> +                return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +            addr =3D read_atomic(&range[n].address);
> >>> +            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> >>> +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), =
&t,
> >>> +   P2M_ALLOC);
> >>> +            if ( !shm->pages[pg_idx] )
> >>> +                return FFA_RET_DENIED;
> >>> +            pg_idx++;
> >>
> >> This increment could be done at the end, why here ?
> >
> > Do you mean after the p2m_is_ram() check? I'll move it there.
>
> yes that would be more natural i think.
>
> >
> >>
> >>> +            /* Only normal RAM for now */
> >>> +            if ( !p2m_is_ram(t) )
> >>> +                return FFA_RET_DENIED;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    *last_page_idx =3D pg_idx;
> >>> +
> >>> +    return FFA_RET_OK;
> >>> +}
> >>> +
> >>> +static void put_shm_pages(struct ffa_shm_mem *shm)
> >>> +{
> >>> +    unsigned int n;
> >>> +
> >>> +    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> >>> +    {
> >>> +        put_page(shm->pages[n]);
> >>> +        shm->pages[n] =3D NULL;
> >>
> >> If an error occured during the generation you might have part
> >> of the pages which are NULL already.
> >>
> >> So you should do a if (pages[n] !=3D NULL) here
> >
> > I'm doing that above in the head of the loop, the loop is terminated
> > at the first pages[n] =3D=3D NULL.
>
> Right, sorry i missed that.
>
> >
> >>
> >>> +    }
> >>> +}
> >>> +
> >>> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> >>> +                                             unsigned int page_count=
)
> >>> +{
> >>> +    struct ffa_shm_mem *shm;
> >>> +
> >>> +    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT ||
> >>> +         ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> >>> +        return NULL;
> >>
> >> Shouldn't you also filter out for page_count =3D 0 ?
> >
> > Sure, 0 doesn't make sense. But I should probably do it before this
> > function is called since I suppose we'd like to return something
> > different from FFA_RET_NO_MEMORY.
>
> Very true.
>
> >
> >>
> >>> +
> >>> +    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_coun=
t);
> >>> +    if ( shm )
> >>> +    {
> >>> +        ctx->shm_count++;
> >>> +        shm->page_count =3D page_count;
> >>> +    }
> >>> +
> >>> +    return shm;
> >>> +}
> >>> +
> >>> +static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem=
 *shm)
> >>> +{
> >>> +    if ( shm ) {
> >>> +        ASSERT(ctx->shm_count > 0);
> >>> +        ctx->shm_count--;
> >>> +        put_shm_pages(shm);
> >>> +        xfree(shm);
> >>> +    }
> >>> +}
> >>> +
> >>> +static void init_range(struct ffa_address_range *addr_range,
> >>> +                       paddr_t pa)
> >>> +{
> >>> +    memset(addr_range, 0, sizeof(*addr_range));
> >>> +    addr_range->address =3D pa;
> >>> +    addr_range->page_count =3D 1;
> >>> +}
> >>> +
> >>> +/*
> >>> + * This function uses the ffa_tx buffer to transmit the memory trans=
action
> >>> + * descriptor. The function depends ffa_tx_buffer_lock to be used to=
 guard
> >>> + * the buffer from concurrent use.
> >>> + */
> >>> +static int share_shm(struct ffa_shm_mem *shm)
> >>> +{
> >>> +    const uint32_t max_frag_len =3D ffa_page_count * FFA_PAGE_SIZE;
> >>> +    struct ffa_mem_access *mem_access_array;
> >>> +    struct ffa_mem_transaction_1_1 *descr;
> >>> +    struct ffa_address_range *addr_range;
> >>> +    struct ffa_mem_region *region_descr;
> >>> +    const unsigned int region_count =3D 1;
> >>> +    void *buf =3D ffa_tx;
> >>> +    uint32_t frag_len;
> >>> +    uint32_t tot_len;
> >>> +    paddr_t last_pa;
> >>> +    unsigned int n;
> >>> +    paddr_t pa;
> >>> +
> >>> +    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
> >>> +    if ( !shm->page_count )
> >>> +    {
> >>> +        ASSERT_UNREACHABLE();
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>
> >> page_count =3D 0 should be filtered out before reaching this and this =
should
> >> only be an assert if you want but no unreachable with a return.
> >
> > I'm adding code to filter out page_count =3D 0. I'm not sure what you
> > expect here, should I remove the entire check here or what do you
> > want?
>
> As this is checked before, this could just be an assert and not something=
 with a return.

OK, I'll do that.

>
> >
> >>
> >>> +    }
> >>> +
> >>> +    descr =3D buf;
> >>> +    memset(descr, 0, sizeof(*descr));
> >>> +    descr->sender_id =3D shm->sender_id;
> >>> +    descr->global_handle =3D shm->handle;
> >>> +    descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> >>> +    descr->mem_access_count =3D 1;
> >>> +    descr->mem_access_size =3D sizeof(*mem_access_array);
> >>> +    descr->mem_access_offs =3D MEM_ACCESS_OFFSET(0);
> >>> +
> >>> +    mem_access_array =3D buf + descr->mem_access_offs;
> >>> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> >>> +    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> >>> +    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> >>> +    mem_access_array[0].region_offs =3D REGION_OFFSET(descr->mem_acc=
ess_count, 0);
> >>> +
> >>> +    region_descr =3D buf + mem_access_array[0].region_offs;
> >>> +    memset(region_descr, 0, sizeof(*region_descr));
> >>> +    region_descr->total_page_count =3D shm->page_count;
> >>> +
> >>> +    region_descr->address_range_count =3D 1;
> >>> +    last_pa =3D page_to_maddr(shm->pages[0]);
> >>> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> >>> +    {
> >>> +        pa =3D page_to_maddr(shm->pages[n]);
> >>> +        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> >>> +            continue;
> >>> +        region_descr->address_range_count++;
> >>> +    }
> >>> +
> >>> +    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_co=
unt,
> >>> +                                region_descr->address_range_count);
> >>> +    if ( tot_len > max_frag_len )
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>> +
> >>> +    addr_range =3D region_descr->address_range_array;
> >>> +    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_c=
ount, 1);
> >>> +    last_pa =3D page_to_maddr(shm->pages[0]);
> >>> +    init_range(addr_range, last_pa);
> >>> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> >>> +    {
> >>> +        pa =3D page_to_maddr(shm->pages[n]);
> >>> +        if ( last_pa + FFA_PAGE_SIZE =3D=3D pa )
> >>> +        {
> >>> +            addr_range->page_count++;
> >>> +            continue;
> >>> +        }
> >>> +
> >>> +        frag_len +=3D sizeof(*addr_range);
> >>> +        addr_range++;
> >>> +        init_range(addr_range, pa);
> >>> +    }
> >>> +
> >>> +    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> >>> +}
> >>> +
> >>> +static int read_mem_transaction(uint32_t ffa_vers, const void *buf, =
size_t blen,
> >>> +                                struct ffa_mem_transaction_x *trans)
> >>> +{
> >>> +    uint16_t mem_reg_attr;
> >>> +    uint32_t flags;
> >>> +    uint32_t count;
> >>> +    uint32_t offs;
> >>> +    uint32_t size;
> >>> +
> >>> +    if ( ffa_vers >=3D FFA_VERSION_1_1 )
> >>> +    {
> >>> +        const struct ffa_mem_transaction_1_1 *descr;
> >>> +
> >>> +        if ( blen < sizeof(*descr) )
> >>> +            return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +        descr =3D buf;
> >>> +        trans->sender_id =3D descr->sender_id;
> >>> +        mem_reg_attr =3D descr->mem_reg_attr;
> >>> +        flags =3D descr->flags;
> >>> +        trans->global_handle =3D descr->global_handle;
> >>> +        trans->tag =3D descr->tag;
> >>> +
> >>> +        count =3D descr->mem_access_count;
> >>> +        size =3D descr->mem_access_size;
> >>> +        offs =3D descr->mem_access_offs;
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        const struct ffa_mem_transaction_1_0 *descr;
> >>> +
> >>> +        if ( blen < sizeof(*descr) )
> >>> +            return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +        descr =3D buf;
> >>> +        trans->sender_id =3D descr->sender_id;
> >>> +        mem_reg_attr =3D descr->mem_reg_attr;
> >>> +        flags =3D descr->flags;
> >>> +        trans->global_handle =3D descr->global_handle;
> >>> +        trans->tag =3D descr->tag;
> >>> +
> >>> +        count =3D descr->mem_access_count;
> >>> +        size =3D sizeof(struct ffa_mem_access);
> >>> +        offs =3D offsetof(struct ffa_mem_transaction_1_0, mem_access=
_array);
> >>> +    }
> >>> +    /*
> >>> +     * Make sure that "descr" which is shared with the guest isn't a=
ccessed
> >>> +     * again after this point.
> >>> +     */
> >>> +    barrier();
> >>
> >> I am not really following the comment here. You accessed the content o=
f descr
> >> before and it is in the rxtx buffer so why is this needed ?
> >
> > I'm making sure that the compiler doesn't optimize and reorders the
> > reads from memory in funny ways, for instance, reading again after the
> > ifs just below. The RXTX buffer is shared with the guest so it can
> > potentially be updated concurrently by another CPU.
>
> The client is not suppose to modify the buffer during the call, using ato=
mic
> operations here is not really solving any issue if this is modified while=
 we use it right ?

We are guarding against a TOCTOU (time-of-check to time-of-use) type
of attack or bug.

>
> >
> >>
> >>> +
> >>> +    /*
> >>> +     * We're doing a rough check to see that no information is lost =
when
> >>> +     * tranfering the values into a struct ffa_mem_transaction_x bel=
ow. The
> >>> +     * fields in struct ffa_mem_transaction_x are wide enough to hol=
d any
> >>> +     * valid value so being out of range means that something is wro=
ng.
> >>> +     */
> >>> +    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UIN=
T8_MAX ||
> >>> +        count > UINT8_MAX || offs > UINT16_MAX )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +    /* Check that the endpoint memory access descriptor array fits *=
/
> >>> +    if ( size * count + offs > blen )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +    trans->mem_reg_attr =3D mem_reg_attr;
> >>> +    trans->flags =3D flags;
> >>> +    trans->mem_access_size =3D size;
> >>> +    trans->mem_access_count =3D count;
> >>> +    trans->mem_access_offs =3D offs;
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static void handle_mem_share(struct cpu_user_regs *regs)
> >>> +{
> >>> +    uint32_t tot_len =3D get_user_reg(regs, 1);
> >>> +    uint32_t frag_len =3D get_user_reg(regs, 2);
> >>> +    uint64_t addr =3D get_user_reg(regs, 3);
> >>> +    uint32_t page_count =3D get_user_reg(regs, 4);
> >>> +    const struct ffa_mem_region *region_descr;
> >>> +    const struct ffa_mem_access *mem_access;
> >>> +    struct ffa_mem_transaction_x trans;
> >>> +    struct domain *d =3D current->domain;
> >>> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >>> +    struct ffa_shm_mem *shm =3D NULL;
> >>> +    unsigned int last_page_idx =3D 0;
> >>> +    register_t handle_hi =3D 0;
> >>> +    register_t handle_lo =3D 0;
> >>> +    int ret =3D FFA_RET_DENIED;
> >>> +    uint32_t range_count;
> >>> +    uint32_t region_offs;
> >>> +
> >>> +    /*
> >>> +     * We're only accepting memory transaction descriptors via the r=
x/tx
> >>> +     * buffer.
> >>
> >> Is this a limitation coming fomr the spec or from the implementation ?
> >
> > This is just a limitation in the implementation.
> >
> >>
> >>> +     */
> >>> +    if ( addr )
> >>> +    {
> >>> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_set_ret;
> >>> +    }
> >>> +
> >>> +    /* Check that fragment length doesn't exceed total length */
> >>> +    if ( frag_len > tot_len )
> >>> +    {
> >>> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >>> +        goto out_set_ret;
> >>> +    }
> >>> +
> >>> +    /* We currently only support a single fragment */
> >>
> >> It would make sense to add some text at the beginning of the files lis=
ting
> >> the current limitations of the implementation.
> >
> > That's quite a bit to keep track of, especially since it will change
> > with each patch. If it's important perhaps we can summarize that in a
> > final commit instead. By the way, this particular limitation is
> > removed in a later patch.
>
> I am more thinking at the end of the serie to have one place with the cur=
rent
> state and limitations of the implementation.
>
> We cannot really expect someone to browse all comments to get what is
>  supported or not.

OK

>
> >
> >>
> >>> +    if ( frag_len !=3D tot_len )
> >>> +    {
> >>> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_set_ret;
> >>> +    }
> >>> +
> >>> +    spin_lock(&ctx->lock);
> >>> +
> >>> +    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
> >>> +        goto out_unlock;
> >>> +
> >>> +    if ( !ffa_page_count )
> >>> +    {
> >>> +        ret =3D FFA_RET_NO_MEMORY;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len,=
 &trans);
> >>> +    if ( ret )
> >>> +        goto out_unlock;
> >>> +
> >>> +    if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> >>> +    {
> >>> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    /* Only supports sharing it with one SP for now */
> >>
> >> Also a limitation to list.
> >
> > OK
> >
> >>
> >>> +    if ( trans.mem_access_count !=3D 1 )
> >>> +    {
> >>> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    if ( trans.sender_id !=3D get_vm_id(d) )
> >>> +    {
> >>> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    /* Check that it fits in the supplied data */
> >>> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> >>> +        goto out_unlock;
> >>> +
> >>
> >> Why are you using atomic operations to access rxtx buffer after here ?
> >
> > To limit how the compiler can reorder the reads from memory.
>
> As stated before, don't we assume that the buffer is not modified by the =
client
>  while we use it ?

No, as I'm saying above we're guarding against it.

Thanks,
Jens

>
> >
> >>
> >>> +    mem_access =3D ctx->tx + trans.mem_access_offs;
> >>> +    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC=
_RW )
> >>
> >> Also a limitation to list.
> >
> > OK
>
> Cheers
> Bertrand
>
> >
> > Thanks,
> > Jens
> >
> >>
> >>> +    {
> >>> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    region_offs =3D read_atomic(&mem_access->region_offs);
> >>> +    if ( sizeof(*region_descr) + region_offs > frag_len )
> >>> +    {
> >>> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +
> >>> +    region_descr =3D ctx->tx + region_offs;
> >>> +    range_count =3D read_atomic(&region_descr->address_range_count);
> >>> +    page_count =3D read_atomic(&region_descr->total_page_count);
> >>> +
> >>> +    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> >>> +    if ( !shm )
> >>> +    {
> >>> +        ret =3D FFA_RET_NO_MEMORY;
> >>> +        goto out_unlock;
> >>> +    }
> >>> +    shm->sender_id =3D trans.sender_id;
> >>> +    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id)=
;
> >>> +
> >>> +    /*
> >>> +     * Check that the Composite memory region descriptor fits.
> >>> +     */
> >>> +    if ( sizeof(*region_descr) + region_offs +
> >>> +         range_count * sizeof(struct ffa_address_range) > frag_len )
> >>> +    {
> >>> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    ret =3D get_shm_pages(d, shm, region_descr->address_range_array,=
 range_count,
> >>> +                        0, &last_page_idx);
> >>> +    if ( ret )
> >>> +        goto out;
> >>> +    if ( last_page_idx !=3D shm->page_count )
> >>> +    {
> >>> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    /* Note that share_shm() uses our tx buffer */
> >>> +    spin_lock(&ffa_tx_buffer_lock);
> >>> +    ret =3D share_shm(shm);
> >>> +    spin_unlock(&ffa_tx_buffer_lock);
> >>> +    if ( ret )
> >>> +        goto out;
> >>> +
> >>> +    list_add_tail(&shm->list, &ctx->shm_list);
> >>> +
> >>> +    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> >>> +
> >>> +out:
> >>> +    if ( ret )
> >>> +        free_ffa_shm_mem(ctx, shm);
> >>> +out_unlock:
> >>> +    spin_unlock(&ctx->lock);
> >>> +
> >>> +out_set_ret:
> >>> +    if ( ret =3D=3D 0)
> >>> +            set_regs_success(regs, handle_lo, handle_hi);
> >>> +    else
> >>> +            set_regs_error(regs, ret);
> >>> +}
> >>> +
> >>> static bool ffa_handle_call(struct cpu_user_regs *regs)
> >>> {
> >>>    uint32_t fid =3D get_user_reg(regs, 0);
> >>> @@ -818,6 +1299,12 @@ static bool ffa_handle_call(struct cpu_user_reg=
s *regs)
> >>> #endif
> >>>        handle_msg_send_direct_req(regs, fid);
> >>>        return true;
> >>> +    case FFA_MEM_SHARE_32:
> >>> +#ifdef CONFIG_ARM_64
> >>> +    case FFA_MEM_SHARE_64:
> >>> +#endif
> >>> +        handle_mem_share(regs);
> >>> +        return true;
> >>>
> >>>    default:
> >>>        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> >>> @@ -857,6 +1344,8 @@ static int ffa_domain_init(struct domain *d)
> >>>        }
> >>>    }
> >>>
> >>> +    INIT_LIST_HEAD(&ctx->shm_list);
> >>> +
> >>>    d->arch.tee =3D ctx;
> >>>
> >>>    return 0;
> >>> @@ -1012,11 +1501,13 @@ static bool ffa_probe(void)
> >>>         !check_mandatory_feature(FFA_RX_RELEASE) ||
> >>> #ifdef CONFIG_ARM_64
> >>>         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> >>> +         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
> >>> #endif
> >>> #ifdef CONFIG_ARM_32
> >>>         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> >>> #endif
> >>>         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> >>> +         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> >>>         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >>>        return false;
> >>>
> >>> --
> >>> 2.34.1
> >>
> >>
> >> Cheers
> >> Bertrand
>
>

