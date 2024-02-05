Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1C849D38
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676154.1052086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX08l-0000Mu-Ny; Mon, 05 Feb 2024 14:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676154.1052086; Mon, 05 Feb 2024 14:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX08l-0000Kq-Kz; Mon, 05 Feb 2024 14:40:07 +0000
Received: by outflank-mailman (input) for mailman id 676154;
 Mon, 05 Feb 2024 14:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdDv=JO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rX08k-00007n-5v
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:40:06 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 722d3d30-c434-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 15:40:03 +0100 (CET)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3bba0ac2e88so3383059b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:40:03 -0800 (PST)
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
X-Inumbo-ID: 722d3d30-c434-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707144002; x=1707748802; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GtgUTwFFp/baIi5Y1KiC1kr4cfbXr3t2oWJQI/zDrk=;
        b=SbwVMhRJYyiitIdM3sHZvwDtZ/Fd9ly3qI4WTm8dpQEnFrUAOFTzDjzbkaGjZBi9pI
         WgTemaO/cgeaW9VlQ695sVy8RMkeLeehr8vEHKfAnNuCyWjreBluCKOh/5NtAPuWv/lm
         UK8aosv9oh5kW9LsfMVaGCptU/dYpFQJHbIb7jgBHI4NLXXBFimPJKVbOGCvRd+m43a1
         fKhiVEk6ZIH1f2VR9YcMvB4EemKv1sHtcmYVYqLHkRRVJCK5CHBmTQlisGRp8I52gXi7
         FHE7bKJs71TZyauiFBAKCF1d6eqlQxmomICWjbp3d7x3GCZMWwzetzS5acULgHdgL84c
         kCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707144002; x=1707748802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GtgUTwFFp/baIi5Y1KiC1kr4cfbXr3t2oWJQI/zDrk=;
        b=t58eHwTG99LWrqD3GF9wT8nVLrHcJ8WEgol77RwzBDyg4ZShMNcm4hJ3M68KCpCuTS
         lvQc80qfj2ffQywFypIGR4oI+Mmd9XrzhYBP7p3wASJZsIRYdrqD8qTVbmyCSD639Pnl
         qV9QxIhutW7Horp4Y2EibpOpGSUFYBvku0GHCBGOZAioOc38XR4VJYbc1CRKQJWzU1fu
         Ju0q1QwysR63zb77v+HPjFppJ2aZJcWzNZRDVwH/KFx4/Snf8KuI2yNnSXF9tmO9XzyP
         EizMB3PeU9Zudu6pIhW4xhX5qZ+uw42f0FmuU1webKXOGGQXE0V9poTb6z1jQxmepdVL
         yQHQ==
X-Gm-Message-State: AOJu0YydczPVl9o3w4tkQVqlQ+gAA8a+OX9L/KYmx2JICygHyEYQ61xB
	48aWmWMXGO6dxHs1zcIY/znfeavV2S3lGHm7gRGqO2YkANhK2dbMkyuNzEMd4BeQb1vkPqTB+1r
	Hy1ClPgcJBD6lV9iJFG+rPQvPGHn44+e3CGeCog==
X-Google-Smtp-Source: AGHT+IEmlw7ujFJoWkML+FSgXeBLHZoqiiUph5XzJ67laEdrb2tMjoL5cXvDOQRL5SLbxVGADf2VvPC+GDtFel6khso=
X-Received: by 2002:a05:6870:7e12:b0:219:8075:25d4 with SMTP id
 wx18-20020a0568707e1200b00219807525d4mr1392773oab.13.1707144002141; Mon, 05
 Feb 2024 06:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20240117110618.2183977-1-jens.wiklander@linaro.org> <6980D75D-544A-4A3B-906B-DC27D68A260B@arm.com>
In-Reply-To: <6980D75D-544A-4A3B-906B-DC27D68A260B@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Feb 2024 15:39:51 +0100
Message-ID: <CAHUa44GS7hX=7msPgzMestM+Dpre0rjuFs9gOq-WY+c=waxi8g@mail.gmail.com>
Subject: Re: [XEN PATCH v3] xen/arm: ffa: reclaim shared memory on guest destroy
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Feb 1, 2024 at 2:57=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 17 Jan 2024, at 12:06, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > When an FF-A enabled guest is destroyed it may leave behind memory
> > shared with SPs. This memory must be reclaimed before it's reused or an
> > SP may make changes to memory used by a new unrelated guest. So when th=
e
> > domain is teared down add FF-A requests to reclaim all remaining shared
> > memory.
> >
> > SPs in the secure world are notified using VM_DESTROYED that a guest ha=
s
> > been destroyed. An SP is supposed to relinquish all shared memory to al=
low
> > reclaiming the memory. The relinquish operation may need to be delayed =
if
> > the shared memory is for instance part of a DMA operation.
> >
> > The domain reference counter is increased when the first FF-A shared
> > memory is registered and the counter is decreased again when the last
> > shared memory is reclaimed. If FF-A shared memory registrations remain
> > at the end of of ffa_domain_teardown() a timer is set to try to reclaim
> > the shared memory every second until the memory is reclaimed.
> >
> > A few minor style fixes with a removed empty line here and an added new
> > line there.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >
> > v3:
> > - Mentioning in the commit message that there are some style fixes
> > - Addressing review comments
> > - Refactor the ffa_domain_teardown() path to let
> >  ffa_domain_teardown_continue() do most of the work.
> >
> > v2:
> > - Update commit message to match the new implementation
> > - Using a per domain bitfield to keep track of which SPs has been notif=
ied
> >  with VM_DESTROYED
> > - Holding a domain reference counter to keep the domain as a zombie dom=
ain
> >  while there still is shared memory registrations remaining to be recla=
imed
> > - Using a timer to retry reclaiming remaining shared memory registratio=
ns
> > ---
> > xen/arch/arm/tee/ffa.c | 253 +++++++++++++++++++++++++++++++++--------
> > 1 file changed, 204 insertions(+), 49 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 0793c1c7585d..80ebbf4f01c6 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -54,6 +54,7 @@
> > #include <xen/mm.h>
> > #include <xen/sched.h>
> > #include <xen/sizes.h>
> > +#include <xen/timer.h>
> > #include <xen/types.h>
> >
> > #include <asm/event.h>
> > @@ -144,6 +145,12 @@
> >  */
> > #define FFA_MAX_SHM_COUNT               32
> >
> > +/*
> > + * The time we wait until trying to tear down a domain again if it was
> > + * blocked initially.
> > + */
> > +#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
> > +
> > /* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> > #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> > #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> > @@ -384,11 +391,6 @@ struct ffa_ctx {
> >     unsigned int page_count;
> >     /* FF-A version used by the guest */
> >     uint32_t guest_vers;
> > -    /*
> > -     * Number of SPs that we have sent a VM created signal to, used in
> > -     * ffa_domain_teardown() to know which SPs need to be signalled.
> > -     */
> > -    uint16_t create_signal_count;
> >     bool rx_is_free;
> >     /* Used shared memory objects, struct ffa_shm_mem */
> >     struct list_head shm_list;
> > @@ -402,6 +404,15 @@ struct ffa_ctx {
> >     spinlock_t tx_lock;
> >     spinlock_t rx_lock;
> >     spinlock_t lock;
> > +    /* Used if domain can't be torn down immediately */
> > +    struct domain *teardown_d;
> > +    struct list_head teardown_list;
> > +    s_time_t teardown_expire;
> > +    /*
> > +     * Used for ffa_domain_teardown() to keep track of which SPs shoul=
d be
> > +     * notified that this guest is being destroyed.
> > +     */
> > +    unsigned long vm_destroy_bitmap[];
> > };
> >
> > struct ffa_shm_mem {
> > @@ -436,6 +447,12 @@ static void *ffa_tx __read_mostly;
> > static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> > static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
> >
> > +
> > +/* Used to track domains that could not be torn down immediately. */
> > +static struct timer ffa_teardown_timer;
> > +static struct list_head ffa_teardown_head;
> > +static DEFINE_SPINLOCK(ffa_teardown_lock);
> > +
> > static bool ffa_get_version(uint32_t *vers)
> > {
> >     const struct arm_smccc_1_2_regs arg =3D {
> > @@ -853,7 +870,6 @@ static int32_t handle_partition_info_get(uint32_t w=
1, uint32_t w2, uint32_t w3,
> >             goto out_rx_release;
> >         }
> >
> > -
> >         memcpy(ctx->rx, ffa_rx, sz);
> >     }
> >     ctx->rx_is_free =3D false;
> > @@ -992,53 +1008,75 @@ static void put_shm_pages(struct ffa_shm_mem *sh=
m)
> >     }
> > }
> >
> > -static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> > +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> > {
> >     bool ret =3D true;
> >
> >     spin_lock(&ctx->lock);
> > +
> > +    /*
> > +     * If this is the first shm added, increase the domain reference
> > +     * counter as we need to keep domain around a bit longer to reclai=
m the
> > +     * shared memory in the teardown path.
> > +     */
> > +    if ( !ctx->shm_count )
> > +        get_knownalive_domain(d);
> > +
> >     if (ctx->shm_count >=3D FFA_MAX_SHM_COUNT)
> >         ret =3D false;
> >     else
> >         ctx->shm_count++;
> > +
> >     spin_unlock(&ctx->lock);
> >
> >     return ret;
> > }
> >
> > -static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> > +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> > {
> >     spin_lock(&ctx->lock);
> > +
> >     ASSERT(ctx->shm_count > 0);
> >     ctx->shm_count--;
> > +
> > +    /*
> > +     * If this was the last shm removed, let go of the domain referenc=
e we
> > +     * took in inc_ctx_shm_count() above.
> > +     */
> > +    if ( !ctx->shm_count )
> > +        put_domain(d);
> > +
> >     spin_unlock(&ctx->lock);
> > }
> >
> > -static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> > +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
> >                                              unsigned int page_count)
> > {
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> >     struct ffa_shm_mem *shm;
> >
> >     if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
> >         return NULL;
> > -    if ( !inc_ctx_shm_count(ctx) )
> > +    if ( !inc_ctx_shm_count(d, ctx) )
> >         return NULL;
> >
> >     shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> >     if ( shm )
> >         shm->page_count =3D page_count;
> >     else
> > -        dec_ctx_shm_count(ctx);
> > +        dec_ctx_shm_count(d, ctx);
> >
> >     return shm;
> > }
> >
> > -static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *=
shm)
> > +static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm=
)
> > {
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> >     if ( !shm )
> >         return;
> >
> > -    dec_ctx_shm_count(ctx);
> > +    dec_ctx_shm_count(d, ctx);
> >     put_shm_pages(shm);
> >     xfree(shm);
> > }
> > @@ -1306,7 +1344,7 @@ static void handle_mem_share(struct cpu_user_regs=
 *regs)
> >         goto out_unlock;
> >     }
> >
> > -    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> > +    shm =3D alloc_ffa_shm_mem(d, page_count);
> >     if ( !shm )
> >     {
> >         ret =3D FFA_RET_NO_MEMORY;
> > @@ -1350,7 +1388,7 @@ static void handle_mem_share(struct cpu_user_regs=
 *regs)
> >
> > out:
> >     if ( ret )
> > -        free_ffa_shm_mem(ctx, shm);
> > +        free_ffa_shm_mem(d, shm);
> > out_unlock:
> >     spin_unlock(&ctx->tx_lock);
> >
> > @@ -1401,7 +1439,7 @@ static int handle_mem_reclaim(uint64_t handle, ui=
nt32_t flags)
> >     }
> >     else
> >     {
> > -        free_ffa_shm_mem(ctx, shm);
> > +        free_ffa_shm_mem(d, shm);
> >     }
> >
> >     return ret;
> > @@ -1486,6 +1524,41 @@ static bool ffa_handle_call(struct cpu_user_regs=
 *regs)
> >     }
> > }
> >
> > +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> > +                              uint16_t end, uint16_t sp_id)
> > +{
> > +    unsigned int n;
> > +
> > +    for ( n =3D start; n < end; n++ )
> > +    {
> > +        if ( subscr[n] =3D=3D sp_id )
> > +            return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> > +                                   unsigned int create_signal_count)
> > +{
> > +    unsigned int n;
> > +
> > +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> > +    {
> > +        /*
> > +         * Skip SPs subscribed to the VM created event that never was
> > +         * notified of the VM creation due to an error during
> > +         * ffa_domain_init().
> > +         */
> > +        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> > +                               subscr_vm_created_count,
> > +                               subscr_vm_destroyed[n]) )
> > +            continue;
> > +
> > +        set_bit(n, ctx->vm_destroy_bitmap);
> > +    }
> > +}
> > +
> > static int ffa_domain_init(struct domain *d)
> > {
> >     struct ffa_ctx *ctx;
> > @@ -1501,11 +1574,14 @@ static int ffa_domain_init(struct domain *d)
> >     if ( d->domain_id >=3D UINT16_MAX)
> >         return -ERANGE;
> >
> > -    ctx =3D xzalloc(struct ffa_ctx);
> > +    ctx =3D xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
> > +                              BITS_TO_LONGS(subscr_vm_destroyed_count)=
);
> >     if ( !ctx )
> >         return -ENOMEM;
> >
> >     d->arch.tee =3D ctx;
> > +    ctx->teardown_d =3D d;
> > +    INIT_LIST_HEAD(&ctx->shm_list);
> >
> >     for ( n =3D 0; n < subscr_vm_created_count; n++ )
> >     {
> > @@ -1515,65 +1591,141 @@ static int ffa_domain_init(struct domain *d)
> >         {
> >             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id =
%u to  %u: res %d\n",
> >                    get_vm_id(d), subscr_vm_created[n], res);
> > -            ctx->create_signal_count =3D n;
> > -            return -EIO;
> > +            break;
> >         }
> >     }
> > -    ctx->create_signal_count =3D subscr_vm_created_count;
> > -
> > -    INIT_LIST_HEAD(&ctx->shm_list);
> > +    vm_destroy_bitmap_init(ctx, n);
> > +    if ( n !=3D subscr_vm_created_count )
> > +        return -EIO;
> >
> >     return 0;
> > }
> >
> > -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> > -                              uint16_t end, uint16_t sp_id)
> > +static void send_vm_destroyed(struct domain *d)
> > {
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> >     unsigned int n;
> > +    int32_t res;
> >
> > -    for ( n =3D start; n < end; n++ )
> > +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> >     {
> > -        if ( subscr[n] =3D=3D sp_id )
> > -            return true;
> > -    }
> > +        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
> > +            continue;
> >
> > -    return false;
> > +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_=
id(d),
> > +                                     FFA_MSG_SEND_VM_DESTROYED);
> > +
>
> I think here we should dinstinguish cases depending on the error received=
:
> - retry: we should keep the bit set and retry later
> - other: unset the bit as there is not much we can do but log it.

Makes sense.

>
> The interrupted case can happen, we handle that already in the direct mes=
sage
> request but we will get back here if that does not work after some retrie=
s so
> putting it in the other category is ok i think.

In the case of FFA_MSG_SEND_VM_DESTROYED is think it makes more sense
to also retry FFA_RET_INTERRUPTED later. To me it seems that there
will be an even better chance for an eventual non-secure interrupt to
be handled if wait a little before retrying. So, if you don't mind,
I'll skip clearing the bit below for both FFA_RET_INTERRUPTED and
FFA_RET_RETRY.

>
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction =
of vm_id %u to %u: res %d\n",
> > +                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
> > +        }
> > +        else
> > +        {
> > +            clear_bit(n, ctx->vm_destroy_bitmap);
> > +        }
> > +    }
> > }
> >
> > -/* This function is supposed to undo what ffa_domain_init() has done *=
/
> > -static int ffa_domain_teardown(struct domain *d)
> > +static void reclaim_shms(struct domain *d)
> > {
> >     struct ffa_ctx *ctx =3D d->arch.tee;
> > -    unsigned int n;
> > +    struct ffa_shm_mem *shm, *tmp;
> >     int32_t res;
> >
> > -    if ( !ctx )
> > -        return 0;
> > +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> > +    {
> > +        register_t handle_hi;
> > +        register_t handle_lo;
> >
> > -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> > +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> > +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
>
> Same here as for the VM_DESTROYED, there are some error code that we shou=
ld
> not reiterate on as they will also fail next time:
> - invalid parameters: stop and log an error, this will always fail
> - no memory: for now I would say do the same as invalid parameter with a =
comment
>  maybe because we could retry and memory coud be available next time
> - abort: stop and log an error, this is a major fault on the other side
> - denied: retry.

I agree, I'll propose something like that in the v4.

>
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %=
#lx : %d\n",
> > +                   d, shm->handle, res);
> > +        }
> > +        else
> > +        {
> > +            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> > +                   d, shm->handle);
> > +            list_del(&shm->list);
> > +            free_ffa_shm_mem(d, shm);
> > +        }
> > +    }
> > +}
> > +
> > +static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool fir=
st_time)
> > +{
> > +    struct ffa_ctx *next_ctx =3D NULL;
> > +
> > +    send_vm_destroyed(ctx->teardown_d);
> > +    reclaim_shms(ctx->teardown_d);
> > +
> > +    if ( ctx->shm_count )
> > +    {
>
> If i do understand right you only retry if there are remaining SHM to rec=
laim but what
> if you have destroy messages that were not sent successfully, shouldn't w=
e reiterate
> in that case to send the destroy message again ?

I agree, I'll fix.

Cheers,
Jens

>
> > +        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, r=
etrying\n", ctx->teardown_d);
> > +
> > +        ctx->teardown_expire =3D NOW() + FFA_CTX_TEARDOWN_DELAY;
> > +
> > +        spin_lock(&ffa_teardown_lock);
> > +        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> > +        /* Need to set a new timer for the next ctx in line */
> > +        next_ctx =3D list_first_entry(&ffa_teardown_head, struct ffa_c=
tx,
> > +                                    teardown_list);
> > +        spin_unlock(&ffa_teardown_lock);
> > +    }
> > +    else
> >     {
> >         /*
> > -         * Skip SPs subscribed to the VM created event that never was
> > -         * notified of the VM creation due to an error during
> > -         * ffa_domain_init().
> > +         * domain_destroy() might have been called (via put_domain() i=
n
> > +         * reclaim_shms()), so we can't touch the domain structure any=
more.
> >          */
> > -        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_c=
ount,
> > -                               subscr_vm_created_count,
> > -                               subscr_vm_destroyed[n]) )
> > -            continue;
> > +        xfree(ctx);
> >
> > -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_=
id(d),
> > -                                     FFA_MSG_SEND_VM_DESTROYED);
> > -
> > -        if ( res )
> > -            printk(XENLOG_ERR "ffa: Failed to report destruction of vm=
_id %u to  %u: res %d\n",
> > -                   get_vm_id(d), subscr_vm_destroyed[n], res);
> > +        /* Only check if there has been a change to the teardown queue=
 */
> > +        if ( !first_time )
> > +        {
> > +            spin_lock(&ffa_teardown_lock);
> > +            next_ctx =3D list_first_entry_or_null(&ffa_teardown_head,
> > +                                                struct ffa_ctx, teardo=
wn_list);
> > +            spin_unlock(&ffa_teardown_lock);
> > +        }
> >     }
> >
> > +    if ( next_ctx )
> > +        set_timer(&ffa_teardown_timer, next_ctx->teardown_expire);
> > +}
> > +
> > +static void ffa_teardown_timer_callback(void *arg)
> > +{
> > +    struct ffa_ctx *ctx;
> > +
> > +    spin_lock(&ffa_teardown_lock);
> > +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ct=
x,
> > +                                   teardown_list);
> > +    if ( ctx )
> > +        list_del(&ctx->teardown_list);
> > +    spin_unlock(&ffa_teardown_lock);
> > +
> > +    if ( ctx )
> > +        ffa_domain_teardown_continue(ctx, false /* !first_time */);
> > +    else
> > +        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
> > +}
> > +
> > +/* This function is supposed to undo what ffa_domain_init() has done *=
/
> > +static int ffa_domain_teardown(struct domain *d)
> > +{
> > +    struct ffa_ctx *ctx =3D d->arch.tee;
> > +
> > +    if ( !ctx )
> > +        return 0;
> > +
> >     if ( ctx->rx )
> >         rxtx_unmap(ctx);
> >
> > -    XFREE(d->arch.tee);
> > +    ffa_domain_teardown_continue(ctx, true /* first_time */);
> >
> >     return 0;
> > }
> > @@ -1739,6 +1891,9 @@ static bool ffa_probe(void)
> >     if ( !init_sps() )
> >         goto err_free_ffa_tx;
> >
> > +    INIT_LIST_HEAD(&ffa_teardown_head);
> > +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL,=
 0);
> > +
> >     return true;
> >
> > err_free_ffa_tx:
> > --
> > 2.34.1
> >
>
> Regards
> Bertrand
>
>

