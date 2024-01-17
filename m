Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC830351
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668352.1040477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2u1-0002Lp-HB; Wed, 17 Jan 2024 10:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668352.1040477; Wed, 17 Jan 2024 10:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2u1-0002JE-Ci; Wed, 17 Jan 2024 10:12:09 +0000
Received: by outflank-mailman (input) for mailman id 668352;
 Wed, 17 Jan 2024 10:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFEv=I3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rQ2tz-0002Hp-SR
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:12:08 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dce6c8ff-b520-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 11:12:06 +0100 (CET)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-598bcccca79so3007899eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:12:06 -0800 (PST)
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
X-Inumbo-ID: dce6c8ff-b520-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705486324; x=1706091124; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/XXe5UvqHnIb0Jv0+n1QtDe02fY/UNY8xIANbHog4U=;
        b=t5kgZDQk+tXny4JM7IHDqoJc44avSMSSG/drnL7fvBHq/Jb55bVi20EwCplux46Wgk
         8CNnz2kNnV1QZ4RGe7ERhJno4XnU2x9tzWuU608uLa4hL+JZcKWLp7EWCXqB1zrJbx+k
         zXTiWtqSjI4mX90wd/eRdd4GyLxjvr2+eOBZhRSHnTUohvdQteGPceEzo/PTM5qS2f6o
         iVtYSZfZebJl5ZOyr4CbU5lo72VEmB0XbFeYCV0C8ol/smEIcrvlcs9nXz/q8DaVuSa6
         mm+aeyZONV8KOvQl9hjMOJ30nn+d84dZIl/RGD0brr9y5zX1QE4YV83wL5gov0p2U9Jf
         64ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705486324; x=1706091124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/XXe5UvqHnIb0Jv0+n1QtDe02fY/UNY8xIANbHog4U=;
        b=KnyHufigZ/HPFEd+pfcidkNHQuvphLZVnG2g5AX0w3tAQPkE4WSUIra1PgKdtd0g/R
         hnf6BmI8nl5A8evmbGNoXWgu7e8nXTnS4PhQmb3vwbcFRz6CrCRxJ3TCHEhwY3eqw/WY
         OhEmauH4WKzBM3tZBQRTdmzfMGdLOhsYETMyIdpFjG4xnS6c2v1Y0aoGMA5ON94eRuz4
         ZgSsCgMH5l9mqhsNOjTgZg3PTlXA2iocTDapizmLfNFKk4P+x5rpWoybHbQUZ1/chzmF
         t5l0DeiBGnWl7BG9JU99k2FvLVAoOY2Q3sggBIveUj39HI7qm6WEBr/863SUTHf7aju0
         ODOg==
X-Gm-Message-State: AOJu0YyWoXdka+6eG9GzDm64mS3Lb/aho8lEOJfOXbc3gx8g3CagHghs
	zFuH4r0iHzdFCqw2JmGxUoK4mvNfA11L3wkoHuJ3qYVCOOUhww==
X-Google-Smtp-Source: AGHT+IFXfM4d5TcJ1Fas7NQHo8nbvNHtZmEB/avCVYfyDXJt7zSc90gueU/QO5qfah7J4fqwkrLG19p6G+pbnL476IQ=
X-Received: by 2002:a4a:9d19:0:b0:598:6603:e4d with SMTP id
 w25-20020a4a9d19000000b0059866030e4dmr4750605ooj.18.1705486323820; Wed, 17
 Jan 2024 02:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20231213112557.2393086-1-jens.wiklander@linaro.org> <766738F2-9DE5-4B75-8579-5D49DEA5BC1D@arm.com>
In-Reply-To: <766738F2-9DE5-4B75-8579-5D49DEA5BC1D@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 17 Jan 2024 11:11:52 +0100
Message-ID: <CAHUa44HFg_-zo71x3c_tdmpM4anTafpsnSyiU5EaEkgpW7V18w@mail.gmail.com>
Subject: Re: [XEN PATCH v2] xen/arm: ffa: reclaim shared memory on guest destroy
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Jan 15, 2024 at 12:15=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> Very sorry for the long delay.
>
> > On 13 Dec 2023, at 12:25, Jens Wiklander <jens.wiklander@linaro.org> wr=
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
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > Hi,
> >
> > This is a follow-up to the RFC patch. In this patch, I take an explicit
> > reference on the domain when FF-A shared memory is registered. I've
> > discovered that it might not be strictly necessary until all the shared
> > pages are released with put_page() they also keep a reference to the
> > domain.
> >
> > I'm not entirely sure what is the status of the shared memory when the
> > domain has turned into a zombie. We still hold references on the shared
> > pages until put_page() is called on each. Is that enough to guarantee t=
hat
> > they will not be reused?
> >
> > Thanks,
> > Jens
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
> >
> > ---
> > xen/arch/arm/tee/ffa.c | 270 ++++++++++++++++++++++++++++++++++-------
> > 1 file changed, 224 insertions(+), 46 deletions(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 183528d13388..22906a6e1cff 100644
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
> > @@ -384,11 +385,6 @@ struct ffa_ctx {
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
> > @@ -402,6 +398,15 @@ struct ffa_ctx {
> >     spinlock_t tx_lock;
> >     spinlock_t rx_lock;
> >     spinlock_t lock;
> > +    /* Used if domain can't be teared down immediately */
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
> > @@ -436,6 +441,12 @@ static void *ffa_tx __read_mostly;
> > static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> > static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
> >
> > +
> > +/* Used if domain can't be teared down immediately */
>
> Please adapt the comment as this for all domains.
> Suggest: Used to track domains that could not be teared down immediately.

I'll update.

>
> > +static struct timer ffa_teardown_timer;
> > +static struct list_head ffa_teardown_head;
> > +static DEFINE_SPINLOCK(ffa_teardown_lock);
> > +
> > static bool ffa_get_version(uint32_t *vers)
> > {
> >     const struct arm_smccc_1_2_regs arg =3D {
> > @@ -850,7 +861,6 @@ static int32_t handle_partition_info_get(uint32_t w=
1, uint32_t w2, uint32_t w3,
> >             goto out_rx_release;
> >         }
> >
> > -
>
> You have several style changes like that in the patch.
> Those are not major so I am ok if you keep them in the patch but please
> mention in the commit messages that you do some code style fixes.

OK

>
> >         memcpy(ctx->rx, ffa_rx, sz);
> >     }
> >     ctx->rx_is_free =3D false;
> > @@ -989,53 +999,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm=
)
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
> > +     * counter as we may need to domain around a bit longer to reclaim=
 the
>
> This sentence needs fixing (need to keep the domain..)

OK, I'll remove the word "may".

>
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
> > @@ -1303,7 +1335,7 @@ static void handle_mem_share(struct cpu_user_regs=
 *regs)
> >         goto out_unlock;
> >     }
> >
> > -    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> > +    shm =3D alloc_ffa_shm_mem(d, page_count);
> >     if ( !shm )
> >     {
> >         ret =3D FFA_RET_NO_MEMORY;
> > @@ -1347,7 +1379,7 @@ static void handle_mem_share(struct cpu_user_regs=
 *regs)
> >
> > out:
> >     if ( ret )
> > -        free_ffa_shm_mem(ctx, shm);
> > +        free_ffa_shm_mem(d, shm);
> > out_unlock:
> >     spin_unlock(&ctx->tx_lock);
> >
> > @@ -1398,7 +1430,7 @@ static int handle_mem_reclaim(uint64_t handle, ui=
nt32_t flags)
> >     }
> >     else
> >     {
> > -        free_ffa_shm_mem(ctx, shm);
> > +        free_ffa_shm_mem(d, shm);
> >     }
> >
> >     return ret;
> > @@ -1481,6 +1513,41 @@ static bool ffa_handle_call(struct cpu_user_regs=
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
> > @@ -1496,11 +1563,14 @@ static int ffa_domain_init(struct domain *d)
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
> > @@ -1510,64 +1580,169 @@ static int ffa_domain_init(struct domain *d)
> >         {
> >             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id =
%u to  %u: res %d\n",
> >                    get_vm_id(d), subscr_vm_created[n], res);
> > -            ctx->create_signal_count =3D n;
> > +            vm_destroy_bitmap_init(ctx, n);
>
> Here you could just break and ..
>
> >             return -EIO;
> >         }
> >     }
> > -    ctx->create_signal_count =3D subscr_vm_created_count;
> > -
> > -    INIT_LIST_HEAD(&ctx->shm_list);
> > +    vm_destroy_bitmap_init(ctx, subscr_vm_created_count);
>
> call with n and return -EIO if n !=3D vm_created_count.

OK

>
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
> > +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> > +    {
> > +        register_t handle_hi;
> > +        register_t handle_lo;
> > +
> > +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> > +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
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
> > +static bool ffa_domain_teardown_continue(struct ffa_ctx *ctx)
> > +{
> > +    send_vm_destroyed(ctx->teardown_d);
> > +    reclaim_shms(ctx->teardown_d);
> > +
> > +    if ( ctx->shm_count )
> > +    {
> > +        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, r=
etrying\n", ctx->teardown_d);
> > +        return false;
> > +    }
> > +    else
> > +    {
> > +        return true;
> > +    }
> > +}
> > +
> > +static void ffa_teardown_timer_callback(void *arg)
> > +{
> > +    struct ffa_ctx *ctx;
> > +    bool do_free;
> > +
> > +    spin_lock(&ffa_teardown_lock);
> > +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ct=
x,
> > +                                   teardown_list);
> > +    spin_unlock(&ffa_teardown_lock);
> > +
> >     if ( !ctx )
> > -        return 0;
> > +    {
> > +        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
> > +        return;
> > +    }
> >
> > -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> > +    do_free =3D ffa_domain_teardown_continue(ctx);
> > +
> > +    spin_lock(&ffa_teardown_lock);
> > +    list_del(&ctx->teardown_list);
> > +    if ( !do_free )
> > +    {
> > +        ctx->teardown_expire =3D NOW() + SECONDS(1);
> > +        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> > +    }
> > +    spin_unlock(&ffa_teardown_lock);
> > +
> > +    if ( do_free )
> >     {
> >         /*
> > -         * Skip SPs subscribed to the VM created event that never was
> > -         * notified of the VM creation due to an error during
> > -         * ffa_domain_init().
> > +         * domain_destroy() has likely been called (via put_domain() i=
n
> > +         * reclaim_shms()) by now, so we can't touch the domain
> > +         * structure anymore.
> >          */
> > -        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_c=
ount,
> > -                               subscr_vm_created_count,
> > -                               subscr_vm_destroyed[n]) )
> > -            continue;
> > +        xfree(ctx);
> > +    }
> >
> > -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_=
id(d),
> > -                                     FFA_MSG_SEND_VM_DESTROYED);
> > +    spin_lock(&ffa_teardown_lock);
> > +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ct=
x,
> > +                                   teardown_list);
>
> Why not using list_empty here ?

Because we need the first ctx if there is any in the list. If there's
more than one, it's not the one we used above since that's last in the
list now.

>
> > +    spin_unlock(&ffa_teardown_lock);
> >
> > -        if ( res )
> > -            printk(XENLOG_ERR "ffa: Failed to report destruction of vm=
_id %u to  %u: res %d\n",
> > -                   get_vm_id(d), subscr_vm_destroyed[n], res);
> > -    }
> > +    if ( ctx )
> > +        set_timer(&ffa_teardown_timer, ctx->teardown_expire);
>
> I am a bit lost in the teardown_expire here.
>
> Why not just always set the timer to NOW() + SECONDS(1) ?

teardown_expire is assigned when ctx is added to the list. The
elements in the list is ordered with the one to expire the soonest
first. So two ctx'es in the list are not necessarily torn down with
one seconds delay between them, it depends on when they were added to
the list.

> Don't you have the risk of using an entry where the value was set previou=
sly and would now
> be in the past ?

Yes, there's a risk of that. Is that a problem? The reason I'm doing
it one at a time is to take as few CPU cycles at a time and at the
same time try to tear down after the expected delay.

>
> By the way could you create a proper define for the SECONDS(1) part so
> that one wanting to do this more or less frequently would just have to ch=
ange
> one define value instead ?

Sure, I'll fix.

>
> > +}
> > +
> > +static void ffa_queue_ctx_teardown(struct ffa_ctx *ctx)
> > +{
> > +    ctx->teardown_expire =3D  NOW() + SECONDS(1);
> > +
> > +    spin_lock(&ffa_teardown_lock);
> > +
> > +    /*
> > +     * The timer is already active if there are queued teardown entrie=
s.
> > +     */
> > +    if ( list_empty(&ffa_teardown_head) )
> > +        set_timer(&ffa_teardown_timer, ctx->teardown_expire);
> > +
> > +    list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> > +
> > +    spin_unlock(&ffa_teardown_lock);
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
> >
> >     if ( ctx->rx )
> >         rxtx_unmap(ctx);
> >
> > +    send_vm_destroyed(d);
> > +    reclaim_shms(d);
> > +
> > +    if ( ctx->shm_count )
> > +    {
> > +        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, r=
etrying\n", d);
>
> This block of code is the same as ffa_domain_teardown_continue so you cou=
ld just call it and ..
>
> > +        ffa_queue_ctx_teardown(ctx);
>
> call this if it returns false.
>
> Overall i am a bit thinking that we could just have a generic function fo=
r one
> context doing:
> - try send vm_destroy
> - try reclaim shms
> - if succeed free tee
> - if not put the context at the end of the teardown list and refire the t=
imer if needed
>
> It feels that we have a bit of code duplication here that might be possib=
le to reduce a bit.
>

I'll try to reduce the code duplication.

Thanks,
Jens

>
> > +        return 0;
> > +    }
> > +
> >     XFREE(d->arch.tee);
> >
> >     return 0;
> > @@ -1733,6 +1908,9 @@ static bool ffa_probe(void)
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
>
> Cheers
> Bertrand
>

