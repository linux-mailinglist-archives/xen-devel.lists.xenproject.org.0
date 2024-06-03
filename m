Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB678D7F63
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 11:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734790.1140859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE4Kw-0004ti-01; Mon, 03 Jun 2024 09:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734790.1140859; Mon, 03 Jun 2024 09:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE4Kv-0004re-TU; Mon, 03 Jun 2024 09:50:41 +0000
Received: by outflank-mailman (input) for mailman id 734790;
 Mon, 03 Jun 2024 09:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/E6=NF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sE4Ku-0004rY-Aw
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 09:50:40 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb5edcc0-218e-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 11:50:39 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5b9a35a0901so1456207eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 02:50:39 -0700 (PDT)
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
X-Inumbo-ID: bb5edcc0-218e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717408238; x=1718013038; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBoPPMx+b7L5SS8HwWs/CXS1yB/zV35i45OYl15iJL0=;
        b=dxid+m63e2Xvsbix8I4fLvoBhkk7gtZyjdYyTMWXyEl5uQjTV7qVypkySHEpWKJj5B
         OCGZlNA7z9F7+ifx0bGn/oIypYAVdTzgQr4Z/q0DyVK7hWekzmzXSEIEYi+nOzg45gce
         VJhugvK7JaMxXz7cNQxNi+w13tpyFw9uVa5cDgL8KJ6ARhKvJA6y17LBHyB339cDuuT/
         3hPU28nBqIjR1hDc26IOc1fY0QdQR6Dc2aET73DaE9M8v2hAvEEc/FE/s4XG0QM3/73V
         sY1+sVJnzkkjJpqes+NhpzZBJHcJRlhaxuuw+G+L0E3X8Yxpg42lsxIacDGNOfjOPUlM
         vL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408238; x=1718013038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBoPPMx+b7L5SS8HwWs/CXS1yB/zV35i45OYl15iJL0=;
        b=mBTvpiT0KL/5B1d1/yOjNTHAuXMv25UPAQ8jqWOivW2QJU1zVz0zqxAzPsQ3CrLDUs
         s+ahGaP/64Uiup4pPfTy5e97GqmavA1CkfzSH/Jz+GCoi7kCLziK4fGJ5yDX5qPQR652
         rdXEARGLGrk7CY1pYqDImeNh5c6t8HMw1iV5lTwUZk8zLmNkQBdw/BdXPkaBqt0/DYic
         bjNZgaSp50/fyc1lo+pskHM4YeMcEl1m1siX8O05ewT04XnLAKrKjxwdSIt6Zt2yqPFi
         iMPhWibmgKKmdRdgDxIfT0TUwWD1AuKV+f10/ByyEn5GB9LlNIXwXykIYonBSjgItiIT
         rp0w==
X-Forwarded-Encrypted: i=1; AJvYcCWbl+Ugdq+KpUO2aT7Medjz+O7vhMrVTNVBcuoMY5TTo5dcfwMQNX8+rQJ6eb3d+LJPM2YdxgsecrTHjEFkqa+0VGl34Y59jSqP9MrQGqY=
X-Gm-Message-State: AOJu0Ywf4t9sp2PziCUMtdyEHxzeWidVAUQVY27C2PvrkVX5Av9pCOFu
	8yS1ObE3Kec+OBnsH2H9mX2PNxRWYJQ/9Vv3dshUS64849eAVkfwc+BRdsRctHzi2oRcaJdofT/
	rloLGV1qkcwdj4cV9qngEDpU7cvxBmZMevEFK+w==
X-Google-Smtp-Source: AGHT+IFbtrRS7eKd4GEMiCJqtXB9/NmDCasGydI2BJCRvy2B7Wre5GnIt/HaKGz53UJJB9Kk3/KO4hFgUohHRC9hXGc=
X-Received: by 2002:a05:6820:16a6:b0:5b9:d636:416b with SMTP id
 006d021491bc7-5ba05af7a62mr9148962eaf.1.1717408237741; Mon, 03 Jun 2024
 02:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-8-jens.wiklander@linaro.org> <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
 <CAHUa44GRNQV4X61YPZTxO+tkkwJS9hoqQ07U9vP1k6n1zUt9rQ@mail.gmail.com> <39045a8f-ea18-4264-b540-66645751d27d@xen.org>
In-Reply-To: <39045a8f-ea18-4264-b540-66645751d27d@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 3 Jun 2024 11:50:25 +0200
Message-ID: <CAHUa44Hrm7p9MyTwsp+XU+EAMPXb+bi0a7P8sbhsvz2Tobozow@mail.gmail.com>
Subject: Re: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Jun 3, 2024 at 11:12=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Jens,
>
> On 03/06/2024 10:01, Jens Wiklander wrote:
> > On Fri, May 31, 2024 at 4:28=E2=80=AFPM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Add support for FF-A notifications, currently limited to an SP (Secur=
e
> >>> Partition) sending an asynchronous notification to a guest.
> >>>
> >>> Guests and Xen itself are made aware of pending notifications with an
> >>> interrupt. The interrupt handler triggers a tasklet to retrieve the
> >>> notifications using the FF-A ABI and deliver them to their destinatio=
ns.
> >>>
> >>> Update ffa_partinfo_domain_init() to return error code like
> >>> ffa_notif_domain_init().
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> v4->v5:
> >>> - Move the freeing of d->arch.tee to the new TEE mediator free_domain=
_ctx
> >>>   callback to make the context accessible during rcu_lock_domain_by_i=
d()
> >>>   from a tasklet
> >>> - Initialize interrupt handlers for secondary CPUs from the new TEE m=
ediator
> >>>   init_interrupt() callback
> >>> - Restore the ffa_probe() from v3, that is, remove the
> >>>   presmp_initcall(ffa_init) approach and use ffa_probe() as usual now=
 that we
> >>>   have the init_interrupt callback.
> >>> - A tasklet is added to handle the Schedule Receiver interrupt. The t=
asklet
> >>>   finds each relevant domain with rcu_lock_domain_by_id() which now i=
s enough
> >>>   to guarantee that the FF-A context can be accessed.
> >>> - The notification interrupt handler only schedules the notification
> >>>   tasklet mentioned above
> >>>
> >>> v3->v4:
> >>> - Add another note on FF-A limitations
> >>> - Clear secure_pending in ffa_handle_notification_get() if both SP an=
d SPM
> >>>   bitmaps are retrieved
> >>> - ASSERT that ffa_rcu_lock_domain_by_vm_id() isn't passed the vm_id F=
F-A
> >>>   uses for Xen itself
> >>> - Replace the get_domain_by_id() call done via ffa_get_domain_by_vm_i=
d() in
> >>>   notif_irq_handler() with a call to rcu_lock_live_remote_domain_by_i=
d() via
> >>>   ffa_rcu_lock_domain_by_vm_id()
> >>> - Remove spinlock in struct ffa_ctx_notif and use atomic functions as=
 needed
> >>>   to access and update the secure_pending field
> >>> - In notif_irq_handler(), look for the first online CPU instead of as=
suming
> >>>   that the first CPU is online
> >>> - Initialize FF-A via presmp_initcall() before the other CPUs are onl=
ine,
> >>>   use register_cpu_notifier() to install the interrupt handler
> >>>   notif_irq_handler()
> >>> - Update commit message to reflect recent updates
> >>>
> >>> v2->v3:
> >>> - Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
> >>>   FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
> >>> - Register the Xen SRI handler on each CPU using on_selected_cpus() a=
nd
> >>>   setup_irq()
> >>> - Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_INTR
> >>>   doesn't conflict with static SGI handlers
> >>>
> >>> v1->v2:
> >>> - Addressing review comments
> >>> - Change ffa_handle_notification_{bind,unbind,set}() to take struct
> >>>   cpu_user_regs *regs as argument.
> >>> - Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to re=
turn
> >>>   an error code.
> >>> - Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_INT=
R.
> >>> ---
> >>> xen/arch/arm/tee/Makefile       |   1 +
> >>> xen/arch/arm/tee/ffa.c          |  72 +++++-
> >>> xen/arch/arm/tee/ffa_notif.c    | 409 +++++++++++++++++++++++++++++++=
+
> >>> xen/arch/arm/tee/ffa_partinfo.c |   9 +-
> >>> xen/arch/arm/tee/ffa_private.h  |  56 ++++-
> >>> xen/arch/arm/tee/tee.c          |   2 +-
> >>> xen/include/public/arch-arm.h   |  14 ++
> >>> 7 files changed, 548 insertions(+), 15 deletions(-)
> >>> create mode 100644 xen/arch/arm/tee/ffa_notif.c
> >>>
> > [...]
> >>>
> >>> @@ -517,8 +567,10 @@ err_rxtx_destroy:
> >>> static const struct tee_mediator_ops ffa_ops =3D
> >>> {
> >>>      .probe =3D ffa_probe,
> >>> +    .init_interrupt =3D ffa_notif_init_interrupt,
> >>
> >> With the previous change on init secondary i would suggest to
> >> have a ffa_init_secondary here actually calling the ffa_notif_init_int=
errupt.
> >
> > Yes, that makes sense. I'll update.
> >
> >>
> >>>      .domain_init =3D ffa_domain_init,
> >>>      .domain_teardown =3D ffa_domain_teardown,
> >>> +    .free_domain_ctx =3D ffa_free_domain_ctx,
> >>>      .relinquish_resources =3D ffa_relinquish_resources,
> >>>      .handle_call =3D ffa_handle_call,
> >>> };
> >>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_noti=
f.c
> >>> new file mode 100644
> >>> index 000000000000..e8e8b62590b3
> >>> --- /dev/null
> >>> +++ b/xen/arch/arm/tee/ffa_notif.c
> > [...]
> >>> +static void notif_vm_pend_intr(uint16_t vm_id)
> >>> +{
> >>> +    struct ffa_ctx *ctx;
> >>> +    struct domain *d;
> >>> +    struct vcpu *v;
> >>> +
> >>> +    /*
> >>> +     * vm_id =3D=3D 0 means a notifications pending for Xen itself, =
but
> >>> +     * we don't support that yet.
> >>> +     */
> >>> +    if ( !vm_id )
> >>> +        return;
> >>> +
> >>> +    d =3D ffa_rcu_lock_domain_by_vm_id(vm_id);
> >>> +    if ( !d )
> >>> +        return;
> >>> +
> >>> +    ctx =3D d->arch.tee;
> >>> +    if ( !ctx )
> >>> +        goto out_unlock;
> >>
> >> In both previous cases you are silently ignoring an interrupt
> >> due to an internal error.
> >> Is this something that we should trace ? maybe just debug ?
> >>
> >> Could you add a comment to explain why this could happen
> >> (when possible) or not and the possible side effects ?
> >>
> >> The second one would be a notification for a domain without
> >> FF-A enabled which is ok but i am a bit more wondering on
> >> the first one.
> >
> > The SPMC must be out of sync in both cases. I've been looking for a
> > window where that can happen, but I can't find any. SPMC is called
> > with FFA_NOTIFICATION_BITMAP_DESTROY during domain teardown so the
> > SPMC shouldn't try to deliver any notifications after that.
>
> I don't think I agree with the conclusion. I believe, this can also
> happen in normal operation.
>
> For example, the SPMC could have trigger the interrupt before
> FFA_NOTIFICATION_BITMAP_DESTROY but Xen didn't handle the interrupt (or
> run the tasklet) until later.

You're right, there is a window. Delayed handling is OK since
FFA_NOTIFICATION_INFO_GET_64 is invoked from the tasklet, but there is
a window if the tasklet is suspended or another core destroys the
domain before the tasklet has called ffa_rcu_lock_domain_by_vm_id().
So far it's harmless and I guess we can afford a print.

>
> This could be at the time where the domain has been fully destroyed or
> even when...
>
> > In the second case, the domain ID might have been reused for a domain
> > without FF-A enabled, but the SPMC should have known that already.
>
> ... a new domain has been created. Although, the latter is rather unlikel=
y.
>
> So what if the new domain has FFA enabled? Is there any potential
> security issue?

In this case, we'll inject an NPI in the guest, but when it invokes
FFA_NOTIFICATION_GET it will get accurate information from the SPMC.
The worst case is a spurious NPI. This shouldn't be a security issue.

Thanks,
Jens

