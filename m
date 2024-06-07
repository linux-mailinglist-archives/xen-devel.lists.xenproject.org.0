Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588098FFD50
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736308.1142341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUBg-00069C-62; Fri, 07 Jun 2024 07:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736308.1142341; Fri, 07 Jun 2024 07:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUBg-00066V-2e; Fri, 07 Jun 2024 07:39:00 +0000
Received: by outflank-mailman (input) for mailman id 736308;
 Fri, 07 Jun 2024 07:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UIad=NJ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sFUBe-000666-L4
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:38:58 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fef7b0d0-24a0-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 09:38:57 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6f95be3d4c4so95926a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:38:57 -0700 (PDT)
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
X-Inumbo-ID: fef7b0d0-24a0-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717745936; x=1718350736; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsiNEyc4kBw0pFyZ3blWgvfjWbD3I7zepT775YZ1EEE=;
        b=AgtUmA1VvwMj90VKV5XzNjng5xfk9CxA61jAkUOjP7R2Z7+3UKDC4m3yuhJ+s9N6TI
         b+iFpu7jJBcSycyKs2Z6UojSht21GtQmam43ZBjLngymv/z/YEuIedEUIWbLRmauPsGW
         9ejlbrX7sqR6dCWjfK3M+SChWie4tk2NTo/E/Qm/n0yotVazpPKNW64vdoW4s0LBn6OY
         y6618ZghFvN20tVPx9BP4n5B2BsZ8miO2XncOqW4Z0i9YzgqOTZaBjEHG6JLJ6Kdn4hS
         VrD5/78RenmXaJxxlrEEl9+Ly6r4mp7SRlTpoV/ADR2qkl8SC7gKanf+DeoC3sij0o2c
         oBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717745936; x=1718350736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsiNEyc4kBw0pFyZ3blWgvfjWbD3I7zepT775YZ1EEE=;
        b=G8ClMQmGqKAxTZPKPlp/wVIyJBdq1TkoXYiV2MJ5nlkxs268khbILEANsw5SNQEuap
         U5gxm3BJBDnNofcYC2G90e58slobicvuJQQjpQSqEjZ+z5xLcLZvpiZ9gvITE2lIZcZg
         kw+kmd0t9VYxjg99RF7dUyMCFuq2XjthcBZ/EBerDqmVNdNnnnfnXoq17oFlCTzMKqDU
         m9w6rqcSMK+NsHGIHKcbCjh7KSJto6NRV8+gL3NmyI5LYQ+vv5l4WXHPACyR32yjjkl2
         JjGVcbTHm94lVRpEmX6rvppvrsKNo+NRGModttzGb100bNOOXjgW3PrWpjMs+FfV4LUD
         sVag==
X-Forwarded-Encrypted: i=1; AJvYcCWKugq9ShS2flVjan9/cP60/YHLyS/HDB20NR+IJ4WoaKwh4vEk2hkzXXSKq+8jdjSpnIC9JMPl2pNi2SMaOWAs5AOhZpVMZxfIzsoA/N0=
X-Gm-Message-State: AOJu0YxhS0XIgafAiJHBZbW/KPeZlr56qGYG+7WrkCHKVNV4lQzLuGbo
	GsmYqJXlFa6y1i5LiujscssbWrsqzKxlPHz0W9SAGAA84CTNLhepK/tNJNC6rRQp3MHIJK6XrBB
	sYNED6bEYAtVhiSIZeBgCXox84IpfJnCEFGVV0exS27RzaGt1xq0=
X-Google-Smtp-Source: AGHT+IHuebJdmBNnwhEQYKmWSkqKL0GtkCPRmAyUZLrSnL2n/yvLkfSedSstjMhbtI75z2F3TF3olfIGAZhTqGQWB34=
X-Received: by 2002:a05:6830:3d17:b0:6f0:e793:1325 with SMTP id
 46e09a7af769-6f9571e5715mr1733503a34.2.1717745935551; Fri, 07 Jun 2024
 00:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-8-jens.wiklander@linaro.org> <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
 <CAHUa44GRNQV4X61YPZTxO+tkkwJS9hoqQ07U9vP1k6n1zUt9rQ@mail.gmail.com>
 <39045a8f-ea18-4264-b540-66645751d27d@xen.org> <CAHUa44Hrm7p9MyTwsp+XU+EAMPXb+bi0a7P8sbhsvz2Tobozow@mail.gmail.com>
 <ad94bed4-42a1-4c59-afc1-a542c9a406ea@xen.org> <D56844C2-D602-4109-BF9D-6FCD59B532EC@arm.com>
In-Reply-To: <D56844C2-D602-4109-BF9D-6FCD59B532EC@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 7 Jun 2024 09:38:43 +0200
Message-ID: <CAHUa44E0hZCJ9+eL160H3kv0QVwFDt5wvWLRYfDj9V+a7TcGmg@mail.gmail.com>
Subject: Re: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 5, 2024 at 12:45=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi,
>
> > On 4 Jun 2024, at 12:24, Julien Grall <julien@xen.org> wrote:
> >
> >
> >
> > On 03/06/2024 10:50, Jens Wiklander wrote:
> >> Hi Julien,
> >
> > Hi Jens,
> >
> >
> >> On Mon, Jun 3, 2024 at 11:12=E2=80=AFAM Julien Grall <julien@xen.org> =
wrote:
> >>>
> >>> Hi Jens,
> >>>
> >>> On 03/06/2024 10:01, Jens Wiklander wrote:
> >>>> On Fri, May 31, 2024 at 4:28=E2=80=AFPM Bertrand Marquis
> >>>> <Bertrand.Marquis@arm.com> wrote:
> >>>>>
> >>>>> Hi Jens,
> >>>>>
> >>>>>> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.or=
g> wrote:
> >>>>>>
> >>>>>> Add support for FF-A notifications, currently limited to an SP (Se=
cure
> >>>>>> Partition) sending an asynchronous notification to a guest.
> >>>>>>
> >>>>>> Guests and Xen itself are made aware of pending notifications with=
 an
> >>>>>> interrupt. The interrupt handler triggers a tasklet to retrieve th=
e
> >>>>>> notifications using the FF-A ABI and deliver them to their destina=
tions.
> >>>>>>
> >>>>>> Update ffa_partinfo_domain_init() to return error code like
> >>>>>> ffa_notif_domain_init().
> >>>>>>
> >>>>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>>>>> ---
> >>>>>> v4->v5:
> >>>>>> - Move the freeing of d->arch.tee to the new TEE mediator free_dom=
ain_ctx
> >>>>>>   callback to make the context accessible during rcu_lock_domain_b=
y_id()
> >>>>>>   from a tasklet
> >>>>>> - Initialize interrupt handlers for secondary CPUs from the new TE=
E mediator
> >>>>>>   init_interrupt() callback
> >>>>>> - Restore the ffa_probe() from v3, that is, remove the
> >>>>>>   presmp_initcall(ffa_init) approach and use ffa_probe() as usual =
now that we
> >>>>>>   have the init_interrupt callback.
> >>>>>> - A tasklet is added to handle the Schedule Receiver interrupt. Th=
e tasklet
> >>>>>>   finds each relevant domain with rcu_lock_domain_by_id() which no=
w is enough
> >>>>>>   to guarantee that the FF-A context can be accessed.
> >>>>>> - The notification interrupt handler only schedules the notificati=
on
> >>>>>>   tasklet mentioned above
> >>>>>>
> >>>>>> v3->v4:
> >>>>>> - Add another note on FF-A limitations
> >>>>>> - Clear secure_pending in ffa_handle_notification_get() if both SP=
 and SPM
> >>>>>>   bitmaps are retrieved
> >>>>>> - ASSERT that ffa_rcu_lock_domain_by_vm_id() isn't passed the vm_i=
d FF-A
> >>>>>>   uses for Xen itself
> >>>>>> - Replace the get_domain_by_id() call done via ffa_get_domain_by_v=
m_id() in
> >>>>>>   notif_irq_handler() with a call to rcu_lock_live_remote_domain_b=
y_id() via
> >>>>>>   ffa_rcu_lock_domain_by_vm_id()
> >>>>>> - Remove spinlock in struct ffa_ctx_notif and use atomic functions=
 as needed
> >>>>>>   to access and update the secure_pending field
> >>>>>> - In notif_irq_handler(), look for the first online CPU instead of=
 assuming
> >>>>>>   that the first CPU is online
> >>>>>> - Initialize FF-A via presmp_initcall() before the other CPUs are =
online,
> >>>>>>   use register_cpu_notifier() to install the interrupt handler
> >>>>>>   notif_irq_handler()
> >>>>>> - Update commit message to reflect recent updates
> >>>>>>
> >>>>>> v2->v3:
> >>>>>> - Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
> >>>>>>   FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
> >>>>>> - Register the Xen SRI handler on each CPU using on_selected_cpus(=
) and
> >>>>>>   setup_irq()
> >>>>>> - Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_I=
NTR
> >>>>>>   doesn't conflict with static SGI handlers
> >>>>>>
> >>>>>> v1->v2:
> >>>>>> - Addressing review comments
> >>>>>> - Change ffa_handle_notification_{bind,unbind,set}() to take struc=
t
> >>>>>>   cpu_user_regs *regs as argument.
> >>>>>> - Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to=
 return
> >>>>>>   an error code.
> >>>>>> - Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_=
INTR.
> >>>>>> ---
> >>>>>> xen/arch/arm/tee/Makefile       |   1 +
> >>>>>> xen/arch/arm/tee/ffa.c          |  72 +++++-
> >>>>>> xen/arch/arm/tee/ffa_notif.c    | 409 ++++++++++++++++++++++++++++=
++++
> >>>>>> xen/arch/arm/tee/ffa_partinfo.c |   9 +-
> >>>>>> xen/arch/arm/tee/ffa_private.h  |  56 ++++-
> >>>>>> xen/arch/arm/tee/tee.c          |   2 +-
> >>>>>> xen/include/public/arch-arm.h   |  14 ++
> >>>>>> 7 files changed, 548 insertions(+), 15 deletions(-)
> >>>>>> create mode 100644 xen/arch/arm/tee/ffa_notif.c
> >>>>>>
> >>>> [...]
> >>>>>>
> >>>>>> @@ -517,8 +567,10 @@ err_rxtx_destroy:
> >>>>>> static const struct tee_mediator_ops ffa_ops =3D
> >>>>>> {
> >>>>>>      .probe =3D ffa_probe,
> >>>>>> +    .init_interrupt =3D ffa_notif_init_interrupt,
> >>>>>
> >>>>> With the previous change on init secondary i would suggest to
> >>>>> have a ffa_init_secondary here actually calling the ffa_notif_init_=
interrupt.
> >>>>
> >>>> Yes, that makes sense. I'll update.
> >>>>
> >>>>>
> >>>>>>      .domain_init =3D ffa_domain_init,
> >>>>>>      .domain_teardown =3D ffa_domain_teardown,
> >>>>>> +    .free_domain_ctx =3D ffa_free_domain_ctx,
> >>>>>>      .relinquish_resources =3D ffa_relinquish_resources,
> >>>>>>      .handle_call =3D ffa_handle_call,
> >>>>>> };
> >>>>>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_n=
otif.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..e8e8b62590b3
> >>>>>> --- /dev/null
> >>>>>> +++ b/xen/arch/arm/tee/ffa_notif.c
> >>>> [...]
> >>>>>> +static void notif_vm_pend_intr(uint16_t vm_id)
> >>>>>> +{
> >>>>>> +    struct ffa_ctx *ctx;
> >>>>>> +    struct domain *d;
> >>>>>> +    struct vcpu *v;
> >>>>>> +
> >>>>>> +    /*
> >>>>>> +     * vm_id =3D=3D 0 means a notifications pending for Xen itsel=
f, but
> >>>>>> +     * we don't support that yet.
> >>>>>> +     */
> >>>>>> +    if ( !vm_id )
> >>>>>> +        return;
> >>>>>> +
> >>>>>> +    d =3D ffa_rcu_lock_domain_by_vm_id(vm_id);
> >>>>>> +    if ( !d )
> >>>>>> +        return;
> >>>>>> +
> >>>>>> +    ctx =3D d->arch.tee;
> >>>>>> +    if ( !ctx )
> >>>>>> +        goto out_unlock;
> >>>>>
> >>>>> In both previous cases you are silently ignoring an interrupt
> >>>>> due to an internal error.
> >>>>> Is this something that we should trace ? maybe just debug ?
> >>>>>
> >>>>> Could you add a comment to explain why this could happen
> >>>>> (when possible) or not and the possible side effects ?
> >>>>>
> >>>>> The second one would be a notification for a domain without
> >>>>> FF-A enabled which is ok but i am a bit more wondering on
> >>>>> the first one.
> >>>>
> >>>> The SPMC must be out of sync in both cases. I've been looking for a
> >>>> window where that can happen, but I can't find any. SPMC is called
> >>>> with FFA_NOTIFICATION_BITMAP_DESTROY during domain teardown so the
> >>>> SPMC shouldn't try to deliver any notifications after that.
> >>>
> >>> I don't think I agree with the conclusion. I believe, this can also
> >>> happen in normal operation.
> >>>
> >>> For example, the SPMC could have trigger the interrupt before
> >>> FFA_NOTIFICATION_BITMAP_DESTROY but Xen didn't handle the interrupt (=
or
> >>> run the tasklet) until later.
> >> You're right, there is a window. Delayed handling is OK since
> >> FFA_NOTIFICATION_INFO_GET_64 is invoked from the tasklet, but there is
> >> a window if the tasklet is suspended or another core destroys the
> >> domain before the tasklet has called ffa_rcu_lock_domain_by_vm_id().
> >> So far it's harmless and I guess we can afford a print.
> >
> > I think it would confuse more the user than anything else because this =
is an expected race. If we wanted to print a message, then I would argue it=
 should be in the case where...
> >
> >>>
> >>> This could be at the time where the domain has been fully destroyed o=
r
> >>> even when...
> >>>
> >>>> In the second case, the domain ID might have been reused for a domai=
n
> >>>> without FF-A enabled, but the SPMC should have known that already.
> >>>
> >>> ... a new domain has been created. Although, the latter is rather unl=
ikely.
> >>>
> >>> So what if the new domain has FFA enabled? Is there any potential
> >>> security issue?
> >> In this case, we'll inject an NPI in the guest, but when it invokes
> >> FFA_NOTIFICATION_GET it will get accurate information from the SPMC.
> >> The worst case is a spurious NPI. This shouldn't be a security issue.
> >
> > ... we inject the interrupt to the "wrong" domain. But I also understan=
d that it would be difficult for Xen to detect it.
> >
> > So I would say no print should be needed. Bertrand, what do you think?
>
> Yes i agree that it could confuse the user.
> I would just put comments to explain the situations where it could occur =
in the code.

Thanks, I'll add comments for the next version.

Cheers,
Jens

