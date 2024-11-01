Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B99B8F9D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 11:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829023.1244106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6p8i-0006C4-9g; Fri, 01 Nov 2024 10:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829023.1244106; Fri, 01 Nov 2024 10:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6p8i-00069Z-6h; Fri, 01 Nov 2024 10:44:24 +0000
Received: by outflank-mailman (input) for mailman id 829023;
 Fri, 01 Nov 2024 10:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PD0T=R4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t6p8g-000691-93
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 10:44:22 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e171eaf-983e-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 11:44:17 +0100 (CET)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7187e0041d5so1042193a34.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 03:44:17 -0700 (PDT)
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
X-Inumbo-ID: 3e171eaf-983e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC1vdDEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNlMTcxZWFmLTk4M2UtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDU3ODU3LjczMzg4NCwic2VuZGVyIjoiamVucy53aWtsYW5kZXJAbGluYXJvLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730457856; x=1731062656; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz+WxhaAL6zQ3LolyiKyPpRCYy2XL2Y0dCOuQsKzxGc=;
        b=g62vEaSYG/YsqbDOz0xzT3RETRHTxlhTZaiplmX/4RQeLRorzwoqBr3+cWs80fCMgo
         kR3oFLJwNff6j5eJTgO3npz2MzPyVsrIiPs6quT8qObYL6B/j6B90SvJVPOBO3MQgjb9
         ykIkUOHWZNy0LBDlwCqhHSIkWJI3mUrvsXt0axDrMnP6KwZeZYfal8hwvJ8D6w7Xonjw
         N1F8lZW65gsH4y01xz4DLK5K4Q78tUVaNpENOtEAfg5qz97PK7fwhYSms7/H4aeo9XTv
         Qt4PjDyWfTYgoLo0jt2qxkmAzrPgTojAN5bki9aF2rlA2gTb5Rl47xkS5EWO7LAAvGc0
         BcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730457856; x=1731062656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nz+WxhaAL6zQ3LolyiKyPpRCYy2XL2Y0dCOuQsKzxGc=;
        b=KbOnDIn6X2hEfNFu63WIjL5FHSR3vPdIoiWgmf4x0Hr5rgkXRV4/ZBQuSeiAGw1FVz
         08C8C8TvVJXvWmQGHLS05QhP5VMxlkXZKZ9mBBzhCZHLzdkquMNzQWRjYsStGvXcLKq/
         bAyQWJdYGn7IWtz6to67cEbI6Z2jUjVqKqmsfd6v9p9QQzh1qbzObvU1dEgnUcAXoXpF
         T7vXnXxtFq4XRfcI/fOcW9zXSnqeujAmaqdZB2cDnlQzP1Z34+nPEcSH/87GTjqfLlyN
         WmobXTSradzL3aMFhAdjG+gW7mFw4kdfegjcg5URgjY38RHyA3YHwxJBNcIlQkVItHEj
         w/2w==
X-Gm-Message-State: AOJu0YzkUkML4p6bPcF0QnvgXBv1iXWJ/MPimXNUFV0keju5Y7lg31hC
	+ta2FCz9wxh5XVav3XljZEbli+LZm3x/sLM++zj9fInL3la7JrJxzjqFCbzHeW8hE4FySN/IFY8
	OrYCX5a1rWR4QLmLZ2MWmqpPvjJ7W8aONVm9pZTAg8qGxrZb1J18=
X-Google-Smtp-Source: AGHT+IFpe9WJaZSQ8oHSycktJoKLh25e6q9zQi7F2xOobxOEmHaRrP5IR3nS0cg/g72gmUuOhhyZs2DE9MGUxEPfgOw=
X-Received: by 2002:a05:6870:7247:b0:287:20ea:2db2 with SMTP id
 586e51a60fabf-2948450b9e1mr5591534fac.25.1730457856220; Fri, 01 Nov 2024
 03:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729069025.git.bertrand.marquis@arm.com> <57c59cae4141dd9601d7b4e9260030a16809b764.1729069025.git.bertrand.marquis@arm.com>
In-Reply-To: <57c59cae4141dd9601d7b4e9260030a16809b764.1729069025.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 1 Nov 2024 11:44:04 +0100
Message-ID: <CAHUa44FPihAeGEZsj023tj22+a_xLj08gu+AsF_0E5v3PNs=jQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Oct 16, 2024 at 11:22=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is Optee running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or Optee could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.
>
> To make buffer full notification work between VMs when there is not
> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
>
> Modify part_info_get to return the list of VMs when there is no firmware
> support.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c          |  11 +++
>  xen/arch/arm/tee/ffa_notif.c    | 118 ++++++++++++++++----------------
>  xen/arch/arm/tee/ffa_partinfo.c |   2 +
>  3 files changed, 73 insertions(+), 58 deletions(-)

I think it is desirable or at least a good goal to be able to have all
TEE configurations enabled at compile time.

For optee_probe() to succeed, a DT node with compatible
"linaro,optee-tz" must be present, and a trusted OS responding with
the UUID used by OP-TEE. False positives can be ruled out unless the
system is grossly misconfigured and shouldn't be used.

If we could make the probe order deterministic with OP-TEE before
FF-A, we should be OK. If there is an odd system with OP-TEE SMC ABI
in the secure world that wants to use FF-A VM to VM, removing the
"linaro,optee-tz" compatible node from DT is enough to disable
optee_probe() without recompiling Xen.

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 21d41b452dc9..6d427864f3da 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -324,8 +324,11 @@ static int ffa_domain_init(struct domain *d)
>      struct ffa_ctx *ctx;
>      int ret;
>
> +#ifndef CONFIG_FFA_VM_TO_VM
>      if ( !ffa_fw_version )
>          return -ENODEV;
> +#endif
> +
>      /*
>       * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A ID =
0 is
>       * reserved for the hypervisor and we only support secure endpoints =
using
> @@ -549,7 +552,15 @@ err_no_fw:
>      bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>      printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
>
> +#ifdef CONFIG_FFA_VM_TO_VM
> +    INIT_LIST_HEAD(&ffa_teardown_head);
> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
> +
> +    printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> +    return true;
> +#else
>      return false;
> +#endif
>  }
>
>  static const struct tee_mediator_ops ffa_ops =3D
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 052b3e364a70..f2c87d1320de 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -16,7 +16,7 @@
>
>  #include "ffa_private.h"
>
> -static bool __ro_after_init notif_enabled;
> +static bool __ro_after_init fw_notif_enabled;
>  static unsigned int __ro_after_init notif_sri_irq;
>
>  int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> @@ -27,21 +27,17 @@ int ffa_handle_notification_bind(struct cpu_user_regs=
 *regs)
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>
> -    if ( !notif_enabled )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>      if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>          return FFA_RET_INVALID_PARAMETERS;
>
>      if ( flags )    /* Only global notifications are supported */
>          return FFA_RET_DENIED;
>
> -    /*
> -     * We only support notifications from SP so no need to check the sen=
der
> -     * endpoint ID, the SPMC will take care of that for us.
> -     */
> -    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_hi,
> -                           bitmap_lo);
> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> +                               bitmap_hi, bitmap_lo);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> @@ -51,32 +47,36 @@ int ffa_handle_notification_unbind(struct cpu_user_re=
gs *regs)
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>
> -    if ( !notif_enabled )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>      if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    /*
> -     * We only support notifications from SP so no need to check the
> -     * destination endpoint ID, the SPMC will take care of that for us.
> -     */
> -    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
hi,
> -                            bitmap_lo);
> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_hi,
> +                                bitmap_lo);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    bool notif_pending =3D false;
>
> -    if ( !notif_enabled )
> +#ifndef CONFIG_FFA_VM_TO_VM
> +    if ( !fw_notif_enabled )
>      {
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          return;
>      }
> +#endif
>
> -    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> +    notif_pending =3D ctx->notif.secure_pending;
> +#ifdef CONFIG_FFA_VM_TO_VM
> +    notif_pending |=3D ctx->notif.buff_full_pending;
> +#endif
> +
> +    if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
>          ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> @@ -103,11 +103,13 @@ void ffa_handle_notification_get(struct cpu_user_re=
gs *regs)
>      uint32_t w6 =3D 0;
>      uint32_t w7 =3D 0;
>
> -    if ( !notif_enabled )
> +#ifndef CONFIG_FFA_VM_TO_VM
> +    if ( !fw_notif_enabled )
>      {
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          return;
>      }
> +#endif
>
>      if ( (recv & 0xFFFFU) !=3D ffa_get_vm_id(d) )
>      {
> @@ -115,7 +117,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>          return;
>      }
>
> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP
> +                                        | FFA_NOTIF_FLAG_BITMAP_SPM )) )
>      {
>          struct arm_smccc_1_2_regs arg =3D {
>              .a0 =3D FFA_NOTIFICATION_GET,
> @@ -170,15 +173,14 @@ int ffa_handle_notification_set(struct cpu_user_reg=
s *regs)
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
>
> -    if ( !notif_enabled )
> -        return FFA_RET_NOT_SUPPORTED;
> -
>      if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    /* Let the SPMC check the destination of the notification */
> -    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_=
lo,
> -                           bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bit=
map_lo,
> +                               bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  #ifdef CONFIG_FFA_VM_TO_VM
> @@ -190,7 +192,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>          return;
>
>      if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
> -        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
> +        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, tru=
e);
>  }
>  #endif
>
> @@ -363,7 +365,7 @@ void ffa_notif_init_interrupt(void)
>  {
>      int ret;
>
> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
>      {
>          /*
>           * An error here is unlikely since the primary CPU has already
> @@ -394,47 +396,47 @@ void ffa_notif_init(void)
>      int ret;
>
>      /* Only enable fw notification if all ABIs we need are supported */
> -    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> -           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> -           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> -           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
> -        return;
> -
> -    arm_smccc_1_2_smc(&arg, &resp);
> -    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> -        return;
> -
> -    irq =3D resp.a2;
> -    notif_sri_irq =3D irq;
> -    if ( irq >=3D NR_GIC_SGI )
> -        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> -    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
> -    if ( ret )
> +    if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> +         ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
> +         ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
> +         ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64) )
>      {
> -        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> -               irq, ret);
> -        return;
> -    }
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_SUCCESS_32 )
> +            return;
>
> -    notif_enabled =3D true;
> +        irq =3D resp.a2;
> +        notif_sri_irq =3D irq;
> +        if ( irq >=3D NR_GIC_SGI )
> +            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +        ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NUL=
L);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\=
n",
> +                   irq, ret);
> +            return;
> +        }
> +        fw_notif_enabled =3D true;
> +    }
>  }
>
>  int ffa_notif_domain_init(struct domain *d)
>  {
>      int32_t res;
>
> -    if ( !notif_enabled )
> -        return 0;
> +    if ( fw_notif_enabled )
> +    {
>
> -    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpu=
s);
> -    if ( res )
> -        return -ENOMEM;
> +        res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_=
vcpus);
> +        if ( res )
> +            return -ENOMEM;
> +    }
>
>      return 0;
>  }
>
>  void ffa_notif_domain_destroy(struct domain *d)
>  {
> -    if ( notif_enabled )
> +    if ( fw_notif_enabled )
>          ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
>  }
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index d699a267cc76..2e09440fe6c2 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -128,12 +128,14 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          goto out;
>      }
>
> +#ifndef CONFIG_FFA_VM_TO_VM
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
>          /* Just give an empty partition list to the caller */
>          ret =3D FFA_RET_OK;
>          goto out;
>      }
> +#endif
>
>      ret =3D ffa_rx_acquire(d);
>      if ( ret !=3D FFA_RET_OK )
> --
> 2.47.0
>

