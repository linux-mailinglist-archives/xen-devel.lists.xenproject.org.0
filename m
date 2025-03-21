Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76913A6BC49
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924052.1327406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcvB-0001ID-Ta; Fri, 21 Mar 2025 14:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924052.1327406; Fri, 21 Mar 2025 14:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcvB-0001GC-Q7; Fri, 21 Mar 2025 14:00:25 +0000
Received: by outflank-mailman (input) for mailman id 924052;
 Fri, 21 Mar 2025 14:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IQbR=WI=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvcvA-0001FD-4w
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:00:24 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4378e87-065c-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 15:00:22 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-601ad30bc0cso1843425eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 07:00:22 -0700 (PDT)
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
X-Inumbo-ID: d4378e87-065c-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742565621; x=1743170421; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZ9ixmm422uNLNbAJGx1/wGmNvySrezgfzzhP9Jlnck=;
        b=JXZ0NXLXrUjRFdX773omNPj25b7s9FCQcr0HwoiTM7OcTfU65A8Evx7ja5/y6wYRyr
         hrsa+kHTa0pH+D7C8dhkOqvwOS89+KJC08WP30rzzftY+/WtPOi5xul2WqnJs+4kz/Ki
         84F9R8sZq/ghiZAL+Fry1vVQh5CHxJ3FHkNUBh41HXUXchAvZiMYwt8w1ar5TDtuf6vE
         XuVchTMnDNYZEs60JZcpmm43CDpBrAB4+TPGTpOmgOQs6rTm8AkXqWYEgAU9FZZJmjgg
         pia+9fWmKaPQVQvz2GZQ/AOZXOiBcMIV2ofa1wYwQpkxmJJS0LFCLdX6/6uLDY2tqFEZ
         iASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565621; x=1743170421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZ9ixmm422uNLNbAJGx1/wGmNvySrezgfzzhP9Jlnck=;
        b=pbKLE/K49z2EsdXp727FhYMwIWcBVMzIQb2LWhLCmrxZL3yDRmC0MdoMigOwf94AW4
         KiOEfnY67Hve4zpiko4N6UbLKqlMkezpSlJ7lf6McbZaEe9DD+eB1c+ADpRkOpy/LfcZ
         Ne194CwJAbPcbaalJ+Npb/ikkDA1kEfosRgUlXl2QsorKDpaPsq9lb1G5/Rd7WfXUOno
         uFhp11Nqs3x/ea1oBptG0m7ZM7ZZixcbutPzpCluMq0724TIyFdijcxA+jsoDVQ5dYVe
         A5/HasFwdOBP5Eu3jW4x5ELzt8hwtipFFXl8ChP6NZekDNMXckxRET49nsQXfBjWlReR
         pnXA==
X-Gm-Message-State: AOJu0YwvGML/kDdsJWFgHI3VgbKoe75AhnpsenFKZzFfDSrY4FO81QHc
	n3n+nxAyQpBUust1QWx0q8fkwosVwg8ps2iS74tncD+9YaJUtNTvjA20R6uhkKN7COaq5dlx+Ca
	5/w+T3YDIGjT6W3TOAapCdZYSbe9htW8Uv9WGBA==
X-Gm-Gg: ASbGnct9yvQED5KtMr+whunwnQnMopOhyK0H00MdHxjiBDM8AzoTv1pA9P+VEsJMjRt
	aqb1azVp2kg6QLuV/XFCMNrpSmDmF+0IDicpt45fX3LSmUS/cy8gSkS1eZSLH7y9yFPiqol6pio
	Z7Vu+79HeV5dpn+L/s4DOy8mf6tLMWYJ6CWkv0NQ==
X-Google-Smtp-Source: AGHT+IFvSaewo/HjJPRyQ8yhkEjbXlPSKtQ41VgxPXf2KmbYbj3jRE0onHGZusvJLHjby5duQs3Ff7hTgmUcpqlpr1U=
X-Received: by 2002:a05:6870:8307:b0:297:683:8b5b with SMTP id
 586e51a60fabf-2c760b98905mr5321315fac.10.1742565620617; Fri, 21 Mar 2025
 07:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <400fdd82de6e61e8e7598a120bb0bbe2c354ab72.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44FW02v4_6pTiGqcWrFMLqdayuUF5pXM8cfKusOXHC7Jyw@mail.gmail.com>
 <7B45963D-8908-420C-89ED-15769357779C@arm.com> <CAHUa44HumXeMR66Pu4xMODHms4PiM7+ANmPB1tG+UO9BpGDpLQ@mail.gmail.com>
 <783A9243-EBA6-40CC-A0A7-4DD9E8AFE57F@arm.com>
In-Reply-To: <783A9243-EBA6-40CC-A0A7-4DD9E8AFE57F@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 21 Mar 2025 15:00:08 +0100
X-Gm-Features: AQ5f1JqRC9vkcO2xJQqo5GpBscOz9aRyEcMQ1LsQJ6SDNQ3xLmoKFIp9UEHAzV8
Message-ID: <CAHUa44Hm3Uv31LEEruBu-APCkkD2wwQew4UcUcqqgk+4_Tug9w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Mar 21, 2025 at 2:47=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 21 Mar 2025, at 11:09, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi,
> >
> > On Fri, Mar 21, 2025 at 10:25=E2=80=AFAM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 21 Mar 2025, at 09:55, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Hi Bertrand,
> >>>
> >>> On Mon, Mar 10, 2025 at 3:51=E2=80=AFPM Bertrand Marquis
> >>> <bertrand.marquis@arm.com> wrote:
> >>>>
> >>>> When VM to VM support is activated and there is no suitable FF-A sup=
port
> >>>> in the firmware, enable FF-A support for VMs to allow using it for V=
M to
> >>>> VM communications.
> >>>> If there is Optee running in the secure world and using the non FF-A
> >>>
> >>> It's spelled OP-TEE in text, and optee or OPTEE in identifiers.
> >>
> >> ack
> >>
> >>>
> >>>> communication system, having CONFIG_FFA_VM_TO_VM could be non functi=
onal
> >>>> (if optee is probed first) or Optee could be non functional (if FF-A=
 is
> >>>> probed first) so it is not recommended to activate the configuration
> >>>> option for such systems.
> >>>>
> >>>> To make buffer full notification work between VMs when there is not
> >>>
> >>> s/not/no/
> >>
> >> ack
> >>
> >>>
> >>>> firmware, rework the notification handling and modify the global fla=
g to
> >>>> only be used as check for firmware notification support instead.
> >>>>
> >>>> Modify part_info_get to return the list of VMs when there is no firm=
ware
> >>>> support.
> >>>>
> >>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> Changes in v2:
> >>>> - replace ifdef with IS_ENABLED when possible
> >>>> ---
> >>>> xen/arch/arm/tee/ffa.c          |  12 +++-
> >>>> xen/arch/arm/tee/ffa_notif.c    | 114 ++++++++++++++++--------------=
--
> >>>> xen/arch/arm/tee/ffa_partinfo.c |   3 +-
> >>>> 3 files changed, 69 insertions(+), 60 deletions(-)
> >>>>
> >>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>>> index 3bbdd7168a6b..f6582d2e855a 100644
> >>>> --- a/xen/arch/arm/tee/ffa.c
> >>>> +++ b/xen/arch/arm/tee/ffa.c
> >>>> @@ -324,8 +324,9 @@ static int ffa_domain_init(struct domain *d)
> >>>>    struct ffa_ctx *ctx;
> >>>>    int ret;
> >>>>
> >>>> -    if ( !ffa_fw_version )
> >>>> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
> >>>>        return -ENODEV;
> >>>> +
> >>>>    /*
> >>>>     * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A =
ID 0 is
> >>>>     * reserved for the hypervisor and we only support secure endpoin=
ts using
> >>>> @@ -549,6 +550,15 @@ err_no_fw:
> >>>>    bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> >>>>    printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
> >>>>
> >>>> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >>>> +    {
> >>>> +        INIT_LIST_HEAD(&ffa_teardown_head);
> >>>> +        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback=
, NULL, 0);
> >>>> +
> >>>> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n")=
;
> >>>> +        return true;
> >>>> +    }
> >>>> +
> >>>>    return false;
> >>>> }
> >>>>
> >>>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_not=
if.c
> >>>> index d19aa5c5bef6..0673e53a9def 100644
> >>>> --- a/xen/arch/arm/tee/ffa_notif.c
> >>>> +++ b/xen/arch/arm/tee/ffa_notif.c
> >>>> @@ -16,7 +16,7 @@
> >>>>
> >>>> #include "ffa_private.h"
> >>>>
> >>>> -static bool __ro_after_init notif_enabled;
> >>>> +static bool __ro_after_init fw_notif_enabled;
> >>>> static unsigned int __ro_after_init notif_sri_irq;
> >>>>
> >>>> int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> >>>> @@ -27,21 +27,17 @@ int ffa_handle_notification_bind(struct cpu_user=
_regs *regs)
> >>>>    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> >>>>    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> >>>>
> >>>> -    if ( !notif_enabled )
> >>>> -        return FFA_RET_NOT_SUPPORTED;
> >>>> -
> >>>>    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> >>>>        return FFA_RET_INVALID_PARAMETERS;
> >>>>
> >>>>    if ( flags )    /* Only global notifications are supported */
> >>>>        return FFA_RET_DENIED;
> >>>>
> >>>> -    /*
> >>>> -     * We only support notifications from SP so no need to check th=
e sender
> >>>> -     * endpoint ID, the SPMC will take care of that for us.
> >>>> -     */
> >>>> -    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, b=
itmap_lo,
> >>>> -                           bitmap_hi);
> >>>> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >>>
> >>> Please add space before and after '>>', here and in the function belo=
w
> >>> in this patch.
> >>
> >> ack
> >>
> >>>
> >>>> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flag=
s,
> >>>> +                               bitmap_lo, bitmap_hi);
> >>>> +
> >>>> +    return FFA_RET_NOT_SUPPORTED;
> >>>> }
> >>>>
> >>>> int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> >>>> @@ -51,32 +47,34 @@ int ffa_handle_notification_unbind(struct cpu_us=
er_regs *regs)
> >>>>    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> >>>>    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> >>>>
> >>>> -    if ( !notif_enabled )
> >>>> -        return FFA_RET_NOT_SUPPORTED;
> >>>> -
> >>>>    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> >>>>        return FFA_RET_INVALID_PARAMETERS;
> >>>>
> >>>> -    /*
> >>>> -     * We only support notifications from SP so no need to check th=
e
> >>>> -     * destination endpoint ID, the SPMC will take care of that for=
 us.
> >>>> -     */
> >>>> -    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bi=
tmap_lo,
> >>>> -                            bitmap_hi);
> >>>> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >>>> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0=
, bitmap_lo,
> >>>> +                                bitmap_hi);
> >>>> +
> >>>> +    return FFA_RET_NOT_SUPPORTED;
> >>>> }
> >>>>
> >>>> void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> >>>> {
> >>>>    struct domain *d =3D current->domain;
> >>>>    struct ffa_ctx *ctx =3D d->arch.tee;
> >>>> +    bool notif_pending =3D false;
> >>>>
> >>>> -    if ( !notif_enabled )
> >>>> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
> >>>>    {
> >>>>        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>>>        return;
> >>>>    }
> >>>>
> >>>> -    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> >>>> +    notif_pending =3D ctx->notif.secure_pending;
> >>>> +#ifdef CONFIG_FFA_VM_TO_VM
> >>>> +    notif_pending |=3D ctx->notif.buff_full_pending;
> >>>> +#endif
> >>>
> >>> Shouldn't ctx->notif.secure_pending and ctx->notif.secure_pending be
> >>> cleared also, like:
> >>> notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending) ||
> >>>               test_and_clear_bool(ctx->notif.buff_full_pending);
> >>
> >> Notification info get is returning who has pending notification but on=
ly
> >> notification get should erase pending notifications.
> >
> > FFA_NOTIFICATION_INFO_GET can return a "More pending notifications
> > flag" in w2/x2 to inform the caller that it should call
> > FFA_NOTIFICATION_INFO_GET again to get the remaining receiver
> > endpoints. How can the ABI know where to resume the next time if the
> > previous pending receivers aren't cleared?
>
> I just checked the specification and you are right.
> It is explicitly saying that "Information about pending notifications is
> returned only once".
>
> >
> > The more pending notifications flag will not be needed here as we're
> > dealing with a single endpoint at a time so it might be more of a
> > philosophical question. I don't think it causes problems for the guest
> > to keep secure_pending unchanged for FFA_NOTIFICATION_INFO_GET, but we
> > should mention the changed behaviour in the commit message.
> >
>
> I agree I should discard the secure_pending flag in the implementation bu=
t
> I need to find a solution for the buffer full notification as I still nee=
d to signal
> it in notification get even if notification info get was called.
>
> I will do the following:
> - change secure_pending into pending_notif.
> - set pending_notif when current secure_pending is set
> - set pending_notif and buff_full_pending on indirect message
> - clean pending_notif in notif_info_get
> - clean pending_notif and buff_full in notif_get
>
> Do you agree this is the right path ?

Yes, this is the way. :-)

Cheers,
Jens

>
> Cheers
> Bertrand
>
> > Cheers,
> > Jens
> >
> >>
> >>>
> >>>> +
> >>>> +    if ( notif_pending )
> >>>>    {
> >>>>        /* A pending global notification for the guest */
> >>>>        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> >>>> @@ -103,7 +101,7 @@ void ffa_handle_notification_get(struct cpu_user=
_regs *regs)
> >>>>    uint32_t w6 =3D 0;
> >>>>    uint32_t w7 =3D 0;
> >>>>
> >>>> -    if ( !notif_enabled )
> >>>> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
> >>>>    {
> >>>>        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>>>        return;
> >>>> @@ -115,7 +113,8 @@ void ffa_handle_notification_get(struct cpu_user=
_regs *regs)
> >>>>        return;
> >>>>    }
> >>>>
> >>>> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP=
_SPM ) )
> >>>> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP
> >>>> +                                        | FFA_NOTIF_FLAG_BITMAP_SPM=
 )) )
> >>>
> >>> Please end the previous line with the '|' operator.
> >>
> >> ack
> >>
> >>>
> >>>>    {
> >>>>        struct arm_smccc_1_2_regs arg =3D {
> >>>>            .a0 =3D FFA_NOTIFICATION_GET,
> >>>> @@ -170,15 +169,14 @@ int ffa_handle_notification_set(struct cpu_use=
r_regs *regs)
> >>>>    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> >>>>    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> >>>>
> >>>> -    if ( !notif_enabled )
> >>>> -        return FFA_RET_NOT_SUPPORTED;
> >>>> -
> >>>>    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> >>>>        return FFA_RET_INVALID_PARAMETERS;
> >>>>
> >>>> -    /* Let the SPMC check the destination of the notification */
> >>>> -    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bi=
tmap_lo,
> >>>> -                           bitmap_hi);
> >>>> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> >>>> +        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags=
, bitmap_lo,
> >>>> +                               bitmap_hi);
> >>>> +
> >>>> +    return FFA_RET_NOT_SUPPORTED;
> >>>> }
> >>>>
> >>>> #ifdef CONFIG_FFA_VM_TO_VM
> >>>> @@ -190,7 +188,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
> >>>>        return;
> >>>>
> >>>>    if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
> >>>> -        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
> >>>> +        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID=
, true);
> >>>
> >>> Please move this to the patch "xen/arm: ffa: Add buffer full
> >>> notification support"
> >>
> >> Ack
> >>
> >>>
> >>>> }
> >>>> #endif
> >>>>
> >>>> @@ -363,7 +361,7 @@ void ffa_notif_init_interrupt(void)
> >>>> {
> >>>>    int ret;
> >>>>
> >>>> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >>>> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> >>>>    {
> >>>>        /*
> >>>>         * An error here is unlikely since the primary CPU has alread=
y
> >>>> @@ -394,41 +392,41 @@ void ffa_notif_init(void)
> >>>>    int ret;
> >>>>
> >>>>    /* Only enable fw notification if all ABIs we need are supported =
*/
> >>>> -    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> >>>> -           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> >>>> -           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> >>>> -           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> >>>> -        return;
> >>>> -
> >>>> -    arm_smccc_1_2_smc(&arg, &resp);
> >>>> -    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >>>> -        return;
> >>>> -
> >>>> -    irq =3D resp.a2;
> >>>> -    notif_sri_irq =3D irq;
> >>>> -    if ( irq >=3D NR_GIC_SGI )
> >>>> -        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> >>>> -    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NU=
LL);
> >>>> -    if ( ret )
> >>>> +    if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> >>>> +         ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> >>>> +         ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> >>>> +         ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64) )
> >>>>    {
> >>>> -        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d=
\n",
> >>>> -               irq, ret);
> >>>> -        return;
> >>>> -    }
> >>>> +        arm_smccc_1_2_smc(&arg, &resp);
> >>>> +        if ( resp.a0 !=3D FFA_SUCCESS_32 )
> >>>> +            return;
> >>>>
> >>>> -    notif_enabled =3D true;
> >>>> +        irq =3D resp.a2;
> >>>> +        notif_sri_irq =3D irq;
> >>>> +        if ( irq >=3D NR_GIC_SGI )
> >>>> +            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> >>>> +        ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif"=
, NULL);
> >>>> +        if ( ret )
> >>>> +        {
> >>>> +            printk(XENLOG_ERR "ffa: request_irq irq %u failed: erro=
r %d\n",
> >>>> +                   irq, ret);
> >>>> +            return;
> >>>> +        }
> >>>> +        fw_notif_enabled =3D true;
> >>>> +    }
> >>>> }
> >>>>
> >>>> int ffa_notif_domain_init(struct domain *d)
> >>>> {
> >>>>    int32_t res;
> >>>>
> >>>> -    if ( !notif_enabled )
> >>>> -        return 0;
> >>>> +    if ( fw_notif_enabled )
> >>>> +    {
> >>>>
> >>>> -    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max=
_vcpus);
> >>>> -    if ( res )
> >>>> -        return -ENOMEM;
> >>>> +        res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d-=
>max_vcpus);
> >>>> +        if ( res )
> >>>> +            return -ENOMEM;
> >>>> +    }
> >>>>
> >>>>    return 0;
> >>>> }
> >>>> @@ -439,6 +437,6 @@ void ffa_notif_domain_destroy(struct domain *d)
> >>>>     * Call bitmap_destroy even if bitmap create failed as the SPMC w=
ill
> >>>>     * return a DENIED error that we will ignore.
> >>>>     */
> >>>> -    if ( notif_enabled )
> >>>> +    if ( fw_notif_enabled )
> >>>>        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> >>>> }
> >>>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_=
partinfo.c
> >>>> index 7af1eca2d0c4..291396c8f635 100644
> >>>> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >>>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >>>> @@ -130,7 +130,8 @@ void ffa_handle_partition_info_get(struct cpu_us=
er_regs *regs)
> >>>>        goto out;
> >>>>    }
> >>>>
> >>>> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >>>> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
> >>>
> >>> Doesn't this belong in the patch "xen/arm: ffa: Introduce VM to VM su=
pport"?
> >>> And wouldn't ffa_vm_count make more sense?
> >>
> >> ack. I will modify that and fold it into the VM to VM support patch.
> >>
> >> Cheers
> >> Bertrand
> >>
> >>>
> >>> Cheers,
> >>> Jens
> >>>
> >>>> +         !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> >>>>    {
> >>>>        /* Just give an empty partition list to the caller */
> >>>>        ret =3D FFA_RET_OK;
> >>>> --
> >>>> 2.47.1
>
>

