Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A78D7DFD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 11:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734755.1140820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE3ZJ-00045n-M1; Mon, 03 Jun 2024 09:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734755.1140820; Mon, 03 Jun 2024 09:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE3ZJ-00042g-JP; Mon, 03 Jun 2024 09:01:29 +0000
Received: by outflank-mailman (input) for mailman id 734755;
 Mon, 03 Jun 2024 09:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/E6=NF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sE3ZH-00042Z-Tv
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 09:01:27 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db7f52b3-2187-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 11:01:26 +0200 (CEST)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6f8d0a7b18bso1457449a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 02:01:26 -0700 (PDT)
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
X-Inumbo-ID: db7f52b3-2187-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717405285; x=1718010085; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+H7pObS/b5siSWbttXRNCagqw5g9fdwQAB6Z8V9ywg=;
        b=am7Yez/D9gpJSiwO3yafn7dC7san4bXiObKatAfY+xJih1RXPJxDMEdVcmGLzjQpeM
         9bU4bRYUlSKJKtlWFvnf/sfYIxOqIhRXfOO8tzl/wi+nziK/EwqB7vchiEhZulT2Gt8R
         Jx08cMGwiNgWaRiIjEI5QYM4uZLqMNHxfsCZoBWXWEV2M3AYYHqv8boLxb2+3HH1VaWb
         1GwPZy4MybNxF9RLNYZc0nTiKrHJ1+GzrM5g0/8Fge1A/DjOspWpTODqKgENF4MAiBhV
         StPSsQxvjssG/VGGPwzvEapsz4sbpBw2ghZ7QPW4gthJ9tPbt1q2mswjOER6LRQ3E+69
         wBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717405285; x=1718010085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+H7pObS/b5siSWbttXRNCagqw5g9fdwQAB6Z8V9ywg=;
        b=ETFWyj4tvbHmpxB3Vrt6f6d8oE26Hz6DiHHTLMxzut+WtofeazXQsnt58wcaevXFF3
         Da/DJF83Z4RDo1WSWud07a9o+z+zGZUqw4DOR5+Q8qt/6a3Ey0mWj6wIt3VQ9TLD0WHQ
         pgQWb0i/OH5rGI5flBFuPrmB9U7kHMocqWC4W9F6j77+dAQzA4LB7GZ0E9htR85nohkZ
         d3Pt+mBHSi7PQhPTX8gjVQZ4IJo0Lz8525CucNIIn4diWwt0+6FIKVrnjBg8b5x5M+bx
         00rFBM8xPEKY7hMrX7I8v2XDZuE6QIqVbJXbvAwR/4XaBm73q/cCFhMyx7HnWL5MS/ug
         Kd+Q==
X-Gm-Message-State: AOJu0YwaYuEptdzIAmcD7QnRxMLSti0W3N21anA/WkdYW++8Yr32z30/
	XlnL5IctfLNgMebz3ffOIkONtSJJt0ZDKnu64ZBkI9TeVedZGswB69wA9gXK/yyXUALAYKC2VV9
	D0B0BSjcFZFHjPrOc4ipDE5gn2MpI+ZmMfmefLg==
X-Google-Smtp-Source: AGHT+IF3X5wjr+H1fPRUyv06pZ9YgHDM+CDvAlHe7jjJhdtWj+vSW4djk1iFEBo8y1Xl6v1loBQLToMia9MDy/276WA=
X-Received: by 2002:a05:6870:4154:b0:24f:d90b:fcd3 with SMTP id
 586e51a60fabf-2508b19810dmr4066776fac.25.1717405285154; Mon, 03 Jun 2024
 02:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-8-jens.wiklander@linaro.org> <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
In-Reply-To: <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 3 Jun 2024 11:01:12 +0200
Message-ID: <CAHUa44GRNQV4X61YPZTxO+tkkwJS9hoqQ07U9vP1k6n1zUt9rQ@mail.gmail.com>
Subject: Re: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, May 31, 2024 at 4:28=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Add support for FF-A notifications, currently limited to an SP (Secure
> > Partition) sending an asynchronous notification to a guest.
> >
> > Guests and Xen itself are made aware of pending notifications with an
> > interrupt. The interrupt handler triggers a tasklet to retrieve the
> > notifications using the FF-A ABI and deliver them to their destinations=
.
> >
> > Update ffa_partinfo_domain_init() to return error code like
> > ffa_notif_domain_init().
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > v4->v5:
> > - Move the freeing of d->arch.tee to the new TEE mediator free_domain_c=
tx
> >  callback to make the context accessible during rcu_lock_domain_by_id()
> >  from a tasklet
> > - Initialize interrupt handlers for secondary CPUs from the new TEE med=
iator
> >  init_interrupt() callback
> > - Restore the ffa_probe() from v3, that is, remove the
> >  presmp_initcall(ffa_init) approach and use ffa_probe() as usual now th=
at we
> >  have the init_interrupt callback.
> > - A tasklet is added to handle the Schedule Receiver interrupt. The tas=
klet
> >  finds each relevant domain with rcu_lock_domain_by_id() which now is e=
nough
> >  to guarantee that the FF-A context can be accessed.
> > - The notification interrupt handler only schedules the notification
> >  tasklet mentioned above
> >
> > v3->v4:
> > - Add another note on FF-A limitations
> > - Clear secure_pending in ffa_handle_notification_get() if both SP and =
SPM
> >  bitmaps are retrieved
> > - ASSERT that ffa_rcu_lock_domain_by_vm_id() isn't passed the vm_id FF-=
A
> >  uses for Xen itself
> > - Replace the get_domain_by_id() call done via ffa_get_domain_by_vm_id(=
) in
> >  notif_irq_handler() with a call to rcu_lock_live_remote_domain_by_id()=
 via
> >  ffa_rcu_lock_domain_by_vm_id()
> > - Remove spinlock in struct ffa_ctx_notif and use atomic functions as n=
eeded
> >  to access and update the secure_pending field
> > - In notif_irq_handler(), look for the first online CPU instead of assu=
ming
> >  that the first CPU is online
> > - Initialize FF-A via presmp_initcall() before the other CPUs are onlin=
e,
> >  use register_cpu_notifier() to install the interrupt handler
> >  notif_irq_handler()
> > - Update commit message to reflect recent updates
> >
> > v2->v3:
> > - Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
> >  FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
> > - Register the Xen SRI handler on each CPU using on_selected_cpus() and
> >  setup_irq()
> > - Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_INTR
> >  doesn't conflict with static SGI handlers
> >
> > v1->v2:
> > - Addressing review comments
> > - Change ffa_handle_notification_{bind,unbind,set}() to take struct
> >  cpu_user_regs *regs as argument.
> > - Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to retu=
rn
> >  an error code.
> > - Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_INTR.
> > ---
> > xen/arch/arm/tee/Makefile       |   1 +
> > xen/arch/arm/tee/ffa.c          |  72 +++++-
> > xen/arch/arm/tee/ffa_notif.c    | 409 ++++++++++++++++++++++++++++++++
> > xen/arch/arm/tee/ffa_partinfo.c |   9 +-
> > xen/arch/arm/tee/ffa_private.h  |  56 ++++-
> > xen/arch/arm/tee/tee.c          |   2 +-
> > xen/include/public/arch-arm.h   |  14 ++
> > 7 files changed, 548 insertions(+), 15 deletions(-)
> > create mode 100644 xen/arch/arm/tee/ffa_notif.c
> >
[...]
> >
> > @@ -517,8 +567,10 @@ err_rxtx_destroy:
> > static const struct tee_mediator_ops ffa_ops =3D
> > {
> >     .probe =3D ffa_probe,
> > +    .init_interrupt =3D ffa_notif_init_interrupt,
>
> With the previous change on init secondary i would suggest to
> have a ffa_init_secondary here actually calling the ffa_notif_init_interr=
upt.

Yes, that makes sense. I'll update.

>
> >     .domain_init =3D ffa_domain_init,
> >     .domain_teardown =3D ffa_domain_teardown,
> > +    .free_domain_ctx =3D ffa_free_domain_ctx,
> >     .relinquish_resources =3D ffa_relinquish_resources,
> >     .handle_call =3D ffa_handle_call,
> > };
> > diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.=
c
> > new file mode 100644
> > index 000000000000..e8e8b62590b3
> > --- /dev/null
> > +++ b/xen/arch/arm/tee/ffa_notif.c
[...]
> > +static void notif_vm_pend_intr(uint16_t vm_id)
> > +{
> > +    struct ffa_ctx *ctx;
> > +    struct domain *d;
> > +    struct vcpu *v;
> > +
> > +    /*
> > +     * vm_id =3D=3D 0 means a notifications pending for Xen itself, bu=
t
> > +     * we don't support that yet.
> > +     */
> > +    if ( !vm_id )
> > +        return;
> > +
> > +    d =3D ffa_rcu_lock_domain_by_vm_id(vm_id);
> > +    if ( !d )
> > +        return;
> > +
> > +    ctx =3D d->arch.tee;
> > +    if ( !ctx )
> > +        goto out_unlock;
>
> In both previous cases you are silently ignoring an interrupt
> due to an internal error.
> Is this something that we should trace ? maybe just debug ?
>
> Could you add a comment to explain why this could happen
> (when possible) or not and the possible side effects ?
>
> The second one would be a notification for a domain without
> FF-A enabled which is ok but i am a bit more wondering on
> the first one.

The SPMC must be out of sync in both cases. I've been looking for a
window where that can happen, but I can't find any. SPMC is called
with FFA_NOTIFICATION_BITMAP_DESTROY during domain teardown so the
SPMC shouldn't try to deliver any notifications after that.
In the second case, the domain ID might have been reused for a domain
without FF-A enabled, but the SPMC should have known that already.
I'll add comments and prints since these errors indicate a bug
somewhere.

>
> > +
> > +    /*
> > +     * arch.tee is freed from complete_domain_destroy() so the RCU loc=
k
> > +     * guarantees that the data structure isn't freed while we're acce=
ssing
> > +     * it.
> > +     */
> > +    ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> > +
> > +    /*
> > +     * Since we're only delivering global notification, always
> > +     * deliver to the first online vCPU. It doesn't matter
> > +     * which we chose, as long as it's available.
> > +     */
> > +    for_each_vcpu(d, v)
> > +    {
> > +        if ( is_vcpu_online(v) )
> > +        {
> > +            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
> > +                            true);
> > +            break;
> > +        }
> > +    }
> > +    if ( !v )
> > +        printk(XENLOG_ERR "ffa: can't inject NPI, all vCPUs offline\n"=
);
> > +
> > +out_unlock:
> > +    rcu_unlock_domain(d);
> > +}

Thanks,
Jens

