Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FDA6B66D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 09:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923417.1326929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYAc-0007aR-AU; Fri, 21 Mar 2025 08:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923417.1326929; Fri, 21 Mar 2025 08:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYAc-0007XJ-7M; Fri, 21 Mar 2025 08:56:02 +0000
Received: by outflank-mailman (input) for mailman id 923417;
 Fri, 21 Mar 2025 08:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IQbR=WI=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tvYAb-0007XD-58
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 08:56:01 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3873e8-0632-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 09:55:58 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2c6ed7efb1dso939631fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 01:55:58 -0700 (PDT)
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
X-Inumbo-ID: 4e3873e8-0632-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742547357; x=1743152157; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pyqt6S63RWin5WeaS7K51Eb0Cv40rK9Rso5MXHrhs0=;
        b=c2LlHEJzQYnTTvjefaZhbk5rH3CLtVh+EG8fupWAidt5K4XBZ2Mi8qWxLMMEUNdi+6
         00oi+vrMynto+ve1x5OziAv8ZY47PV85c+R11/mdY4kk5t5rqKLlEG5pYsan+g9b1G8d
         Z944iAXkm8auSIkszTfC8cnu7PVTfDg8qRXkVY0TNdHQD2f5uedaWooauXdSmDAtPzRc
         PS+ZD6Rii5Z4OgTYR+MBeqNfIOWTi3+8fDg0AyhmrgTQ6VyDQm9BKpczZenMnfagZRh1
         tD5TbBOSF1A/vf7jkkIEHQ0ZIf68tXzwE9YGkul0WqrCSpFRK0SprcF8I6rW7VpH7orX
         qtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742547357; x=1743152157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pyqt6S63RWin5WeaS7K51Eb0Cv40rK9Rso5MXHrhs0=;
        b=Ke2vFHnhPSl35g2yHJVAhW+eE6UYUUnO3lPcjGiP8z6VF+U07a93T/wIwHzEnVl0kh
         YmRgIhFc3GlCdKyJLQmh/MEnLuLtwn8NFRwV/yFvrTBS+YliClyJyufJPXbinLwqhuoP
         d+ge3G7+5aQDdDa/s28p2D3zKK4GgYV86aOfHV5fQk7gp5YQqB10KBtVki/WpEGkjY4N
         spUZtkagKJOE21QQOy1eCBY+bFIgSiuLRrQ6sRzSZl/ujB9AuQ3hf9qLRMH08+33Tuib
         rhzC6+xUjjJ6Yg9D4hfjhSLslMS3OTKiI/xmZCatKChO5MSIIpDtPdGdd1kjNaXZg5zp
         vp3Q==
X-Gm-Message-State: AOJu0YxS7QII6Hgh6YO4f/p9Rw1oOmfoeJ2tmDRmtqzy/bs6kKdYMVX9
	4bdEHvSTmhG66UDaCKn2aHaBpAG65ELzpvAhKW7hfS+yPwOHNY0F22i1AGbcVhvSXjFdaPcPiwG
	x/8IkTqdKr9hWJoDwl8L11twJkaAFYgUpdGKdP+G/PWTy14xy6Yw=
X-Gm-Gg: ASbGncvRyAsyS7etsqKTXanaG0b49raxGUwBi6nySMGrd749d4G8lcM78Ol9iMVKOK7
	28kwiIfodSg3ozDLEWPbxqTZdztKpOGWNWHQz3zibSTMRL9OOMPM/ybJ8qQB00kt4horDCnryQ5
	PqECXht+OdBgNJ0fEQbfk12MqlFqg=
X-Google-Smtp-Source: AGHT+IETnsSq7Ef+McD/tnLxUDqmvs8D758aoR7y2AqUI3p1xjhkj7Q80CwU+GxaJk7fobW0TildSi32lybrkhab574=
X-Received: by 2002:a05:6871:2002:b0:29e:499d:1d33 with SMTP id
 586e51a60fabf-2c78028d856mr1783828fac.14.1742547357282; Fri, 21 Mar 2025
 01:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741617888.git.bertrand.marquis@arm.com> <400fdd82de6e61e8e7598a120bb0bbe2c354ab72.1741617888.git.bertrand.marquis@arm.com>
In-Reply-To: <400fdd82de6e61e8e7598a120bb0bbe2c354ab72.1741617888.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 21 Mar 2025 09:55:46 +0100
X-Gm-Features: AQ5f1Jp8BEVq1fbyu6BVG4HkQ2arbWw5nJ2QnRCcJAnTMky9s1YILzCHEdMJVIk
Message-ID: <CAHUa44FW02v4_6pTiGqcWrFMLqdayuUF5pXM8cfKusOXHC7Jyw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 10, 2025 at 3:51=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is Optee running in the secure world and using the non FF-A

It's spelled OP-TEE in text, and optee or OPTEE in identifiers.

> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or Optee could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.
>
> To make buffer full notification work between VMs when there is not

s/not/no/

> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
>
> Modify part_info_get to return the list of VMs when there is no firmware
> support.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - replace ifdef with IS_ENABLED when possible
> ---
>  xen/arch/arm/tee/ffa.c          |  12 +++-
>  xen/arch/arm/tee/ffa_notif.c    | 114 ++++++++++++++++----------------
>  xen/arch/arm/tee/ffa_partinfo.c |   3 +-
>  3 files changed, 69 insertions(+), 60 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3bbdd7168a6b..f6582d2e855a 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -324,8 +324,9 @@ static int ffa_domain_init(struct domain *d)
>      struct ffa_ctx *ctx;
>      int ret;
>
> -    if ( !ffa_fw_version )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
>          return -ENODEV;
> +
>      /*
>       * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A ID =
0 is
>       * reserved for the hypervisor and we only support secure endpoints =
using
> @@ -549,6 +550,15 @@ err_no_fw:
>      bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>      printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
>
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        INIT_LIST_HEAD(&ffa_teardown_head);
> +        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NUL=
L, 0);
> +
> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
> +        return true;
> +    }
> +
>      return false;
>  }
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index d19aa5c5bef6..0673e53a9def 100644
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
_lo,
> -                           bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )

Please add space before and after '>>', here and in the function below
in this patch.

> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> +                               bitmap_lo, bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> @@ -51,32 +47,34 @@ int ffa_handle_notification_unbind(struct cpu_user_re=
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
lo,
> -                            bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(src_dst>>16) && fw_notif_enabled )
> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_lo,
> +                                bitmap_hi);
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
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>      {
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          return;
>      }
>
> -    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> +    notif_pending =3D ctx->notif.secure_pending;
> +#ifdef CONFIG_FFA_VM_TO_VM
> +    notif_pending |=3D ctx->notif.buff_full_pending;
> +#endif

Shouldn't ctx->notif.secure_pending and ctx->notif.secure_pending be
cleared also, like:
notif_pending =3D test_and_clear_bool(ctx->notif.secure_pending) ||
                test_and_clear_bool(ctx->notif.buff_full_pending);

> +
> +    if ( notif_pending )
>      {
>          /* A pending global notification for the guest */
>          ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> @@ -103,7 +101,7 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>      uint32_t w6 =3D 0;
>      uint32_t w7 =3D 0;
>
> -    if ( !notif_enabled )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>      {
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          return;
> @@ -115,7 +113,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>          return;
>      }
>
> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP
> +                                        | FFA_NOTIF_FLAG_BITMAP_SPM )) )

Please end the previous line with the '|' operator.

>      {
>          struct arm_smccc_1_2_regs arg =3D {
>              .a0 =3D FFA_NOTIFICATION_GET,
> @@ -170,15 +169,14 @@ int ffa_handle_notification_set(struct cpu_user_reg=
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
> @@ -190,7 +188,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
>          return;
>
>      if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
> -        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
> +        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, tru=
e);

Please move this to the patch "xen/arm: ffa: Add buffer full
notification support"

>  }
>  #endif
>
> @@ -363,7 +361,7 @@ void ffa_notif_init_interrupt(void)
>  {
>      int ret;
>
> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
>      {
>          /*
>           * An error here is unlikely since the primary CPU has already
> @@ -394,41 +392,41 @@ void ffa_notif_init(void)
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
> @@ -439,6 +437,6 @@ void ffa_notif_domain_destroy(struct domain *d)
>       * Call bitmap_destroy even if bitmap create failed as the SPMC will
>       * return a DENIED error that we will ignore.
>       */
> -    if ( notif_enabled )
> +    if ( fw_notif_enabled )
>          ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
>  }
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 7af1eca2d0c4..291396c8f635 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -130,7 +130,8 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>          goto out;
>      }
>
> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&

Doesn't this belong in the patch "xen/arm: ffa: Introduce VM to VM support"=
?
And wouldn't ffa_vm_count make more sense?

Cheers,
Jens

> +         !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
>          /* Just give an empty partition list to the caller */
>          ret =3D FFA_RET_OK;
> --
> 2.47.1
>

