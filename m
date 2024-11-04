Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2939BADD5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 09:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829864.1244772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7sGA-0001QD-Uq; Mon, 04 Nov 2024 08:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829864.1244772; Mon, 04 Nov 2024 08:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7sGA-0001NC-Rz; Mon, 04 Nov 2024 08:16:26 +0000
Received: by outflank-mailman (input) for mailman id 829864;
 Mon, 04 Nov 2024 08:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qZKN=R7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t7sG9-0001N3-0w
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 08:16:25 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1237ddfa-9a85-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 09:16:20 +0100 (CET)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3e6075cba82so1758775b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 00:16:20 -0800 (PST)
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
X-Inumbo-ID: 1237ddfa-9a85-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoyMzYiLCJoZWxvIjoibWFpbC1vaTEteDIzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEyMzdkZGZhLTlhODUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzA4MTgwLjc2MjUyLCJzZW5kZXIiOiJqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730708179; x=1731312979; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xwen7feZ0JhMVHZuXwshQEly9lgKGsE+v0KeHJEql98=;
        b=kLBt9qqmECj/Y46x/GSyldrHetYCqhlBjVE8fl6DRxHPzdwza+ENTJIlv9+Lz4myRw
         2+b99GabTfeO+he/WYk3QL7CdQ33FQT5Q5tx3c2DhVcd+0EuM0fabSXTwEBQ9ke/eSFN
         BsNxV8gSW8G010ejE4YMEP+4ev7iMGiX2/VafJHtG2ItbJ2hiBaJStjZ1cGU9v7mohnr
         h+Bnh2hGankftzFy2CJOLAid5BvLrXjzPk1Von8FzlkiXECcY21iv4hs3ccQxhs4SMzf
         XS2Y5QIOKCyMJPvjADIJyxjYaUIGYpHuyT48FIeRLGTKpIt9SfRgENOpC+/o5ISlFShm
         6h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730708179; x=1731312979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xwen7feZ0JhMVHZuXwshQEly9lgKGsE+v0KeHJEql98=;
        b=Uy3WuGnR5ZonwmcC1gFKHDv0ark62ji4GoliRbvoZdmJFadOogvzqfLREadb+J+aXw
         QEtrvGcvzLljnyOU+PaaWNL+KYtxGa7FI97j27vREtbaEZIOupXkxjEpAv+gO5W8YIoo
         E2pqfs2QyO1/7KQM8EgJq0gS65c0PyHvZvMOzjGgeTi1IybLUB5PbZvLUVDrxbUjmX9Z
         Wwy1bbYnH8ILv2iYVzg3WA2RqBagXzcsDZHVYUgofq9/1qdAM5pGfSlOcGXQJodIlM7I
         rrVEi0jv6Vk/dboMgf5igN6Fkg6dhC+kD4Kq1dm5DuBPPuZVaNvf0TZaa/M+xDp0il6q
         zPIg==
X-Gm-Message-State: AOJu0Yz/aiYddtnkitkff9CJultXs3zDhSIkDLVf+NYFRTjuutoc0Igw
	2ZwV84B8mt3rdAnThVov/Fkp84X6qcmGPSKm0UWwqG5+2qpqIMUxiAt7fHpi9+GsIXLRqisDAS2
	Uy0mmf4KerIkCAXd/sYe+K6RcCaa2LiSP5yBmTg==
X-Google-Smtp-Source: AGHT+IEvSQ60cz3k7GDIxyHRWRupua8G3i8YcIUJF22usYdpwYHIdU5VexS6v2X4Kg5hltX3IFNWzBtmFWGG9ABwxGc=
X-Received: by 2002:a05:6870:179d:b0:259:8cb3:db2e with SMTP id
 586e51a60fabf-2949f03ad8amr7518289fac.39.1730708179061; Mon, 04 Nov 2024
 00:16:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1729069025.git.bertrand.marquis@arm.com>
 <57c59cae4141dd9601d7b4e9260030a16809b764.1729069025.git.bertrand.marquis@arm.com>
 <CAHUa44FPihAeGEZsj023tj22+a_xLj08gu+AsF_0E5v3PNs=jQ@mail.gmail.com> <9A0A125D-04ED-4454-8E94-1E9D4F6EFE09@arm.com>
In-Reply-To: <9A0A125D-04ED-4454-8E94-1E9D4F6EFE09@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 4 Nov 2024 09:16:07 +0100
Message-ID: <CAHUa44HQPHrnqAMwh=yjqvZJZ74A94ZZubAJhxqXTYEs17BfOA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Nov 4, 2024 at 8:27=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 1 Nov 2024, at 11:44, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Wed, Oct 16, 2024 at 11:22=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> When VM to VM support is activated and there is no suitable FF-A suppo=
rt
> >> in the firmware, enable FF-A support for VMs to allow using it for VM =
to
> >> VM communications.
> >> If there is Optee running in the secure world and using the non FF-A
> >> communication system, having CONFIG_FFA_VM_TO_VM could be non function=
al
> >> (if optee is probed first) or Optee could be non functional (if FF-A i=
s
> >> probed first) so it is not recommended to activate the configuration
> >> option for such systems.
> >>
> >> To make buffer full notification work between VMs when there is not
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
> >> xen/arch/arm/tee/ffa.c          |  11 +++
> >> xen/arch/arm/tee/ffa_notif.c    | 118 ++++++++++++++++----------------
> >> xen/arch/arm/tee/ffa_partinfo.c |   2 +
> >> 3 files changed, 73 insertions(+), 58 deletions(-)
> >
> > I think it is desirable or at least a good goal to be able to have all
> > TEE configurations enabled at compile time.
> >
> > For optee_probe() to succeed, a DT node with compatible
> > "linaro,optee-tz" must be present, and a trusted OS responding with
> > the UUID used by OP-TEE. False positives can be ruled out unless the
> > system is grossly misconfigured and shouldn't be used.
> >
> > If we could make the probe order deterministic with OP-TEE before
> > FF-A, we should be OK. If there is an odd system with OP-TEE SMC ABI
> > in the secure world that wants to use FF-A VM to VM, removing the
> > "linaro,optee-tz" compatible node from DT is enough to disable
> > optee_probe() without recompiling Xen.
>
> I do agree with the deterministic argument but I am not sure having
> the order forced is the right solution.

CONFIG_FFA_VM_TO_VM ensures that FF-A probing always succeeds and
claims the TEE configuration. Logically, this should be last after all
other probing has been tried since it disables further probing.

>
> Maybe we could use a command line argument so that one could
> select explicitly the tee:
> tee=3Dffa / tee=3Doptee
>
> If we could prevent to modify the device tree that will probably make
> things easier.
>
> What do you think ?

That works for me.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 21d41b452dc9..6d427864f3da 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -324,8 +324,11 @@ static int ffa_domain_init(struct domain *d)
> >>     struct ffa_ctx *ctx;
> >>     int ret;
> >>
> >> +#ifndef CONFIG_FFA_VM_TO_VM
> >>     if ( !ffa_fw_version )
> >>         return -ENODEV;
> >> +#endif
> >> +
> >>     /*
> >>      * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A I=
D 0 is
> >>      * reserved for the hypervisor and we only support secure endpoint=
s using
> >> @@ -549,7 +552,15 @@ err_no_fw:
> >>     bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >>     printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >>
> >> +#ifdef CONFIG_FFA_VM_TO_VM
> >> +    INIT_LIST_HEAD(&ffa_teardown_head);
> >> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL=
, 0);
> >> +
> >> +    printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> >> +    return true;
> >> +#else
> >>     return false;
> >> +#endif
> >> }
> >>
> >> static const struct tee_mediator_ops ffa_ops =3D
> >> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif=
.c
> >> index 052b3e364a70..f2c87d1320de 100644
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
map_hi,
> >> -                           bitmap_lo);
> >> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> >> +                               bitmap_hi, bitmap_lo);
> >> +
> >> +    return FFA_RET_NOT_SUPPORTED;
> >> }
> >>
> >> int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> >> @@ -51,32 +47,36 @@ int ffa_handle_notification_unbind(struct cpu_user=
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
ap_hi,
> >> -                            bitmap_lo);
> >> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, =
bitmap_hi,
> >> +                                bitmap_lo);
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
> >> +#ifndef CONFIG_FFA_VM_TO_VM
> >> +    if ( !fw_notif_enabled )
> >>     {
> >>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         return;
> >>     }
> >> +#endif
> >>
> >> -    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> >> +    notif_pending =3D ctx->notif.secure_pending;
> >> +#ifdef CONFIG_FFA_VM_TO_VM
> >> +    notif_pending |=3D ctx->notif.buff_full_pending;
> >> +#endif
> >> +
> >> +    if ( notif_pending )
> >>     {
> >>         /* A pending global notification for the guest */
> >>         ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> >> @@ -103,11 +103,13 @@ void ffa_handle_notification_get(struct cpu_user=
_regs *regs)
> >>     uint32_t w6 =3D 0;
> >>     uint32_t w7 =3D 0;
> >>
> >> -    if ( !notif_enabled )
> >> +#ifndef CONFIG_FFA_VM_TO_VM
> >> +    if ( !fw_notif_enabled )
> >>     {
> >>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>         return;
> >>     }
> >> +#endif
> >>
> >>     if ( (recv & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> >>     {
> >> @@ -115,7 +117,8 @@ void ffa_handle_notification_get(struct cpu_user_r=
egs *regs)
> >>         return;
> >>     }
> >>
> >> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_S=
PM ) )
> >> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP
> >> +                                        | FFA_NOTIF_FLAG_BITMAP_SPM )=
) )
> >>     {
> >>         struct arm_smccc_1_2_regs arg =3D {
> >>             .a0 =3D FFA_NOTIFICATION_GET,
> >> @@ -170,15 +173,14 @@ int ffa_handle_notification_set(struct cpu_user_=
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
> >> @@ -190,7 +192,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
> >>         return;
> >>
> >>     if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
> >> -        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
> >> +        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, =
true);
> >> }
> >> #endif
> >>
> >> @@ -363,7 +365,7 @@ void ffa_notif_init_interrupt(void)
> >> {
> >>     int ret;
> >>
> >> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >>     {
> >>         /*
> >>          * An error here is unlikely since the primary CPU has already
> >> @@ -394,47 +396,47 @@ void ffa_notif_init(void)
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
> >>
> >> void ffa_notif_domain_destroy(struct domain *d)
> >> {
> >> -    if ( notif_enabled )
> >> +    if ( fw_notif_enabled )
> >>         ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> >> }
> >> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
> >> index d699a267cc76..2e09440fe6c2 100644
> >> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >> @@ -128,12 +128,14 @@ void ffa_handle_partition_info_get(struct cpu_us=
er_regs *regs)
> >>         goto out;
> >>     }
> >>
> >> +#ifndef CONFIG_FFA_VM_TO_VM
> >>     if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >>     {
> >>         /* Just give an empty partition list to the caller */
> >>         ret =3D FFA_RET_OK;
> >>         goto out;
> >>     }
> >> +#endif
> >>
> >>     ret =3D ffa_rx_acquire(d);
> >>     if ( ret !=3D FFA_RET_OK )
> >> --
> >> 2.47.0
>
>

