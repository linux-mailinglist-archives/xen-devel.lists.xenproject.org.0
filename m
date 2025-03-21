Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED9AA6B882
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 11:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923856.1327253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZJk-0005g6-Rc; Fri, 21 Mar 2025 10:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923856.1327253; Fri, 21 Mar 2025 10:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvZJk-0005cy-NA; Fri, 21 Mar 2025 10:09:32 +0000
Received: by outflank-mailman (input) for mailman id 923856;
 Fri, 21 Mar 2025 10:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IQbR=WI=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvZJj-0005cq-23
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 10:09:31 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92d19f3b-063c-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 11:09:28 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2c2504fa876so457031fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 03:09:28 -0700 (PDT)
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
X-Inumbo-ID: 92d19f3b-063c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742551767; x=1743156567; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3k6NJua43cQSXE4tgZjOlNKYWsReREj/xZSQ3Lj4Po=;
        b=Neb42/hz3b9VJq0SHVLGsvLYBfKY3zHjvB83fWOo1ayRriWgKHSnwEb0MWNjPcCwPz
         2aySPpo6K7Kc/GwAtfCwprRsqlZygxtfEKERnkOIpgoJy8bKTvMOtD466NJeAMS9uzdu
         i+AdlH2ySfYg0wpz04CEtM1BL1s7J35JuDVexjPdpBllt6dZnMaISDHMSeJ7pmURHjy+
         7T79xGuVEE22ifD4jR5pywK7rQh/5MCckYw+Ee+8zOhbUlGWDBMejxb7MhHDRlKh2lDi
         Qj9g3RD7ykfjl3luYVwWv4TmDHlD4pB1rIAvyV0gX4t6/5Cg2so1wXjvlDZuD3ijJ4ua
         uZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742551767; x=1743156567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3k6NJua43cQSXE4tgZjOlNKYWsReREj/xZSQ3Lj4Po=;
        b=lzlgS4fKYGQkGJZxN86uhusiQUadK3h3OMO/8/To+kMtMsN9st1DoGrs72RJbRXW4K
         u5+CH3laPko8PRHkb1s4VlfTItIfLO+MOM8yhZ2SMZRKBHOFGiqu1irQ7I5YeqAUob+w
         npLASxpuSbtjVbeh2Q6LR5TObgAQnHWx7UcwAzhKLtzgJnRP2Z8WwNwD4Jl2qcBYD4v0
         2aJKrVQEiISwAqMbM3O0/0ZzpML6F/O62Hb11sFUTv1dCKiiJLc+fas436X0cRRocdeV
         6n65BBnCCFLOrpY8sAbZaYy0SSHKlbbeOPFR15/YgMYcGsej9EYHiTqG62VDuxrsVHuS
         b3NA==
X-Gm-Message-State: AOJu0YwtETPHf6WiXYnjr7WpfU3+UOglsMxSW/LEG3KQpJb0EDKRpEfb
	+NLVhRk+4HVXweoq1g8KGC8K6+k3+668V8saqmv4MNAzeuEGY1ATxixORunwDR368VWfibY1nHD
	FuKmgSqhV5+cFJO0qROfEbizVkVzhDUBHQjcBVA==
X-Gm-Gg: ASbGncs3bGezfzQgHzYA021Fx6w3kLPpF2m7B4Sz3jbBckBs5ZDaJG3zP2wY1s4Os8h
	hwQcEnjLtfWJJceGnqURA8VfZSPYwZGL5t7HMljyCmHaYQ77VuOLQH+2BZGOKGL/o3Lg1+XMDfs
	oL7/KT5Ybwe2YvGWOROc90p9boAa0=
X-Google-Smtp-Source: AGHT+IGIRoCpBtqWi7OdhWZrXhEfQvAos4NWwhdlmbzU+pTn232OCPGE4GTHN7TSh4110w/a/3RGcjCt39NPR+LY/t4=
X-Received: by 2002:a05:6870:498a:b0:297:c04:9191 with SMTP id
 586e51a60fabf-2c780202280mr1769778fac.3.1742551767018; Fri, 21 Mar 2025
 03:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <400fdd82de6e61e8e7598a120bb0bbe2c354ab72.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44FW02v4_6pTiGqcWrFMLqdayuUF5pXM8cfKusOXHC7Jyw@mail.gmail.com> <7B45963D-8908-420C-89ED-15769357779C@arm.com>
In-Reply-To: <7B45963D-8908-420C-89ED-15769357779C@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 21 Mar 2025 11:09:15 +0100
X-Gm-Features: AQ5f1JpI10vpuiYYM6ERvFWF9gxNJAvkB-erkp6XbAm8DOkt04pJ9NY4yrgScNE
Message-ID: <CAHUa44HumXeMR66Pu4xMODHms4PiM7+ANmPB1tG+UO9BpGDpLQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 21, 2025 at 10:25=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 21 Mar 2025, at 09:55, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Mon, Mar 10, 2025 at 3:51=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> When VM to VM support is activated and there is no suitable FF-A suppo=
rt
> >> in the firmware, enable FF-A support for VMs to allow using it for VM =
to
> >> VM communications.
> >> If there is Optee running in the secure world and using the non FF-A
> >
> > It's spelled OP-TEE in text, and optee or OPTEE in identifiers.
>
> ack
>
> >
> >> communication system, having CONFIG_FFA_VM_TO_VM could be non function=
al
> >> (if optee is probed first) or Optee could be non functional (if FF-A i=
s
> >> probed first) so it is not recommended to activate the configuration
> >> option for such systems.
> >>
> >> To make buffer full notification work between VMs when there is not
> >
> > s/not/no/
>
> ack
>
> >
> >> firmware, rework the notification handling and modify the global flag =
to
> >> only be used as check for firmware notification support instead.
> >>
> >> Modify part_info_get to return the list of VMs when there is no firmwa=
re
> >> support.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2:
> >> - replace ifdef with IS_ENABLED when possible
> >> ---
> >> xen/arch/arm/tee/ffa.c          |  12 +++-
> >> xen/arch/arm/tee/ffa_notif.c    | 114 ++++++++++++++++----------------
> >> xen/arch/arm/tee/ffa_partinfo.c |   3 +-
> >> 3 files changed, 69 insertions(+), 60 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 3bbdd7168a6b..f6582d2e855a 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -324,8 +324,9 @@ static int ffa_domain_init(struct domain *d)
> >>     struct ffa_ctx *ctx;
> >>     int ret;
> >>
> >> -    if ( !ffa_fw_version )
> >> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
> >>         return -ENODEV;
> >> +
> >>     /*
> >>      * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A I=
D 0 is
> >>      * reserved for the hypervisor and we only support secure endpoint=
s using
> >> @@ -549,6 +550,15 @@ err_no_fw:
> >>     bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >>     printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >>
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +    {
> >> +        INIT_LIST_HEAD(&ffa_teardown_head);
> >> +        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, =
NULL, 0);
> >> +
> >> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> >> +        return true;
> >> +    }
> >> +
> >>     return false;
> >> }
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif=
.c
> >> index d19aa5c5bef6..0673e53a9def 100644
> >> --- a/xen/arch/arm/tee/ffa_notif.c
> >> +++ b/xen/arch/arm/tee/ffa_notif.c
> >> @@ -16,7 +16,7 @@
> >>
> >> #include "ffa_private.h"
> >>
> >> -static bool __ro_after_init notif_enabled;
> >> +static bool __ro_after_init fw_notif_enabled;
> >> static unsigned int __ro_after_init notif_sri_irq;
> >>
> >> int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> >> @@ -27,21 +27,17 @@ int ffa_handle_notification_bind(struct cpu_user_r=
egs *regs)
> >>     uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> >>     uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> >>
> >> -    if ( !notif_enabled )
> >> -        return FFA_RET_NOT_SUPPORTED;
> >> -
> >>     if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> >>         return FFA_RET_INVALID_PARAMETERS;
> >>
> >>     if ( flags )    /* Only global notifications are supported */
> >>         return FFA_RET_DENIED;
> >>
> >> -    /*
> >> -     * We only support notifications from SP so no need to check the =
sender
> >> -     * endpoint ID, the SPMC will take care of that for us.
> >> -     */
> >> -    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bit=
map_lo,
> >> -                           bitmap_hi);
> >> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >
> > Please add space before and after '>>', here and in the function below
> > in this patch.
>
> ack
>
> >
> >> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> >> +                               bitmap_lo, bitmap_hi);
> >> +
> >> +    return FFA_RET_NOT_SUPPORTED;
> >> }
> >>
> >> int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> >> @@ -51,32 +47,34 @@ int ffa_handle_notification_unbind(struct cpu_user=
_regs *regs)
> >>     uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> >>     uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> >>
> >> -    if ( !notif_enabled )
> >> -        return FFA_RET_NOT_SUPPORTED;
> >> -
> >>     if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> >>         return FFA_RET_INVALID_PARAMETERS;
> >>
> >> -    /*
> >> -     * We only support notifications from SP so no need to check the
> >> -     * destination endpoint ID, the SPMC will take care of that for u=
s.
> >> -     */
> >> -    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitm=
ap_lo,
> >> -                            bitmap_hi);
> >> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, =
bitmap_lo,
> >> +                                bitmap_hi);
> >> +
> >> +    return FFA_RET_NOT_SUPPORTED;
> >> }
> >>
> >> void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> >> {
> >>     struct domain *d =3D current->domain;
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >> +    bool notif_pending =3D false;
> >>
> >> -    if ( !notif_enabled )
> >> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
> >>     {
> >>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         return;
> >>     }
> >>
> >> -    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> >> +    notif_pending =3D ctx->notif.secure_pending;
> >> +#ifdef CONFIG_FFA_VM_TO_VM
> >> +    notif_pending |=3D ctx->notif.buff_full_pending;
> >> +#endif
> >
> > Shouldn't ctx->notif.secure_pending and ctx->notif.secure_pending be
> > cleared also, like:
> > notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending) ||
> >                test_and_clear_bool(ctx->notif.buff_full_pending);
>
> Notification info get is returning who has pending notification but only
> notification get should erase pending notifications.

FFA_NOTIFICATION_INFO_GET can return a "More pending notifications
flag" in w2/x2 to inform the caller that it should call
FFA_NOTIFICATION_INFO_GET again to get the remaining receiver
endpoints. How can the ABI know where to resume the next time if the
previous pending receivers aren't cleared?

The more pending notifications flag will not be needed here as we're
dealing with a single endpoint at a time so it might be more of a
philosophical question. I don't think it causes problems for the guest
to keep secure_pending unchanged for FFA_NOTIFICATION_INFO_GET, but we
should mention the changed behaviour in the commit message.

Cheers,
Jens

>
> >
> >> +
> >> +    if ( notif_pending )
> >>     {
> >>         /* A pending global notification for the guest */
> >>         ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> >> @@ -103,7 +101,7 @@ void ffa_handle_notification_get(struct cpu_user_r=
egs *regs)
> >>     uint32_t w6 =3D 0;
> >>     uint32_t w7 =3D 0;
> >>
> >> -    if ( !notif_enabled )
> >> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
> >>     {
> >>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         return;
> >> @@ -115,7 +113,8 @@ void ffa_handle_notification_get(struct cpu_user_r=
egs *regs)
> >>         return;
> >>     }
> >>
> >> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_S=
PM ) )
> >> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP
> >> +                                        | FFA_NOTIF_FLAG_BITMAP_SPM )=
) )
> >
> > Please end the previous line with the '|' operator.
>
> ack
>
> >
> >>     {
> >>         struct arm_smccc_1_2_regs arg =3D {
> >>             .a0 =3D FFA_NOTIFICATION_GET,
> >> @@ -170,15 +169,14 @@ int ffa_handle_notification_set(struct cpu_user_=
regs *regs)
> >>     uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> >>     uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> >>
> >> -    if ( !notif_enabled )
> >> -        return FFA_RET_NOT_SUPPORTED;
> >> -
> >>     if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> >>         return FFA_RET_INVALID_PARAMETERS;
> >>
> >> -    /* Let the SPMC check the destination of the notification */
> >> -    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitm=
ap_lo,
> >> -                           bitmap_hi);
> >> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >> +        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, =
bitmap_lo,
> >> +                               bitmap_hi);
> >> +
> >> +    return FFA_RET_NOT_SUPPORTED;
> >> }
> >>
> >> #ifdef CONFIG_FFA_VM_TO_VM
> >> @@ -190,7 +188,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
> >>         return;
> >>
> >>     if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
> >> -        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
> >> +        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, =
true);
> >
> > Please move this to the patch "xen/arm: ffa: Add buffer full
> > notification support"
>
> Ack
>
> >
> >> }
> >> #endif
> >>
> >> @@ -363,7 +361,7 @@ void ffa_notif_init_interrupt(void)
> >> {
> >>     int ret;
> >>
> >> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >>     {
> >>         /*
> >>          * An error here is unlikely since the primary CPU has already
> >> @@ -394,41 +392,41 @@ void ffa_notif_init(void)
> >>     int ret;
> >>
> >>     /* Only enable fw notification if all ABIs we need are supported *=
/
> >> -    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> >> -           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> >> -           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> >> -           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> >> -        return;
> >> -
> >> -    arm_smccc_1_2_smc(&arg, &resp);
> >> -    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >> -        return;
> >> -
> >> -    irq =3D resp.a2;
> >> -    notif_sri_irq =3D irq;
> >> -    if ( irq >=3D NR_GIC_SGI )
> >> -        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> >> -    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL=
);
> >> -    if ( ret )
> >> +    if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> >> +         ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> >> +         ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> >> +         ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64) )
> >>     {
> >> -        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n=
",
> >> -               irq, ret);
> >> -        return;
> >> -    }
> >> +        arm_smccc_1_2_smc(&arg, &resp);
> >> +        if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >> +            return;
> >>
> >> -    notif_enabled =3D true;
> >> +        irq =3D resp.a2;
> >> +        notif_sri_irq =3D irq;
> >> +        if ( irq >=3D NR_GIC_SGI )
> >> +            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> >> +        ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", =
NULL);
> >> +        if ( ret )
> >> +        {
> >> +            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error =
%d\n",
> >> +                   irq, ret);
> >> +            return;
> >> +        }
> >> +        fw_notif_enabled =3D true;
> >> +    }
> >> }
> >>
> >> int ffa_notif_domain_init(struct domain *d)
> >> {
> >>     int32_t res;
> >>
> >> -    if ( !notif_enabled )
> >> -        return 0;
> >> +    if ( fw_notif_enabled )
> >> +    {
> >>
> >> -    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_v=
cpus);
> >> -    if ( res )
> >> -        return -ENOMEM;
> >> +        res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->m=
ax_vcpus);
> >> +        if ( res )
> >> +            return -ENOMEM;
> >> +    }
> >>
> >>     return 0;
> >> }
> >> @@ -439,6 +437,6 @@ void ffa_notif_domain_destroy(struct domain *d)
> >>      * Call bitmap_destroy even if bitmap create failed as the SPMC wi=
ll
> >>      * return a DENIED error that we will ignore.
> >>      */
> >> -    if ( notif_enabled )
> >> +    if ( fw_notif_enabled )
> >>         ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> >> }
> >> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
> >> index 7af1eca2d0c4..291396c8f635 100644
> >> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >> @@ -130,7 +130,8 @@ void ffa_handle_partition_info_get(struct cpu_user=
_regs *regs)
> >>         goto out;
> >>     }
> >>
> >> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
> >
> > Doesn't this belong in the patch "xen/arm: ffa: Introduce VM to VM supp=
ort"?
> > And wouldn't ffa_vm_count make more sense?
>
> ack. I will modify that and fold it into the VM to VM support patch.
>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +         !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >>     {
> >>         /* Just give an empty partition list to the caller */
> >>         ret =3D FFA_RET_OK;
> >> --
> >> 2.47.1
>
>

