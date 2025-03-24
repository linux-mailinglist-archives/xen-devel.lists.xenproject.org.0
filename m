Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F7A6D898
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925337.1328204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfLw-0005Qs-2w; Mon, 24 Mar 2025 10:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925337.1328204; Mon, 24 Mar 2025 10:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfLv-0005PH-VV; Mon, 24 Mar 2025 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 925337;
 Mon, 24 Mar 2025 10:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9GC=WL=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1twfLt-0005P7-Vo
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:48:18 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d8538ce-089d-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:48:16 +0100 (CET)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2c7e5fb8c38so403564fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:48:16 -0700 (PDT)
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
X-Inumbo-ID: 7d8538ce-089d-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742813295; x=1743418095; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Nic27HkApsR1bpwTj6NURV/f9UK6s5voPUyXu0IfHg=;
        b=sbLNe9w9sWaCy105ZklFmo7XLvMbL2AMXIr8m5h+5oHPmGui4oYlNv+OQYTojZ+HM7
         874dWQ5vOQAHJPqgvtdSinHq0u+yYWzIXvGbj9ivx1687h5JTbdV0BgB6N8Bi3bb3Ddy
         i/hdsQUvotWSk7ofeJhbEcWq2iWDY0Ksz4m65QXp1CQig3iup0at63mTSN+cJNPrO71V
         4TkrBZRAG3BsMFWAlQhlMt+TBRidz1cPztmIr5YOMZBSpCtnHiXd7jmW1RjD/hecBEVX
         v2BHni1T9Z+fUjy+1WqKZcT0nqj+w1cwWPEbz5mKW9FmJ243+FMzC9Y2kOMpZMx5K5bq
         MSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813295; x=1743418095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Nic27HkApsR1bpwTj6NURV/f9UK6s5voPUyXu0IfHg=;
        b=nP5Tg4GPkdynNJxkXWebekbFI+FcvkQLB/dyuyfEk45r9hTwnoeuSeCAMHf/JedsV/
         0qHEn0c7BvimFjhXqeLyyHs6nfrFBHihqjAV5y8pWifSksYMaDf1eoLcgCvOaGyKWQx/
         JRXwOKtjI8yWSI+8KD6pNlPgacDyceBnIforgIcnc+qlJivK4hJnOjfbMJoKzRZPsmRw
         a4nr2wzaExp7thMHB0l8eI7BUSNRLQtUtZODOkjYznXie29GASoTI1f0GDC8edyGKC2o
         gaEnBKm+dFGAQrxgN5NEthTVk3fhGHlD8nZ1GxtXZGTGO6iKuTOkAcvdUBP7O+5w2zvF
         j/4A==
X-Gm-Message-State: AOJu0Ywuf+oJ0QJcfRmJLeEJZphWOqWpakD1nSFCsH5gCV+thfeKp1/y
	x+1PvQ2P4TTqA3hPHCq/zqYvfLuE8210mQDm2OV/ewo5pMZUvx1yftuYEIDMSdMwJLp6Pb5kH1U
	405ZhCgUb9S6XLjSSgPUF7gtZuDuzss9KckfzjQ==
X-Gm-Gg: ASbGncuxQkETXe8rlgWu+NN7TOwaMs7WvM04r/NVdcCk8jYEqXuY/q73jEOx7H6/1gP
	rRTu4QZhY1PKJyvTx6B/R3VXzyPi+kWz4ueznY4gUJW0FIL8XxYSQ/K1HOZbr+TsA9KXgcQi308
	0NR1Kxeqt5fcBFDLIZq7LBfyLwdCo=
X-Google-Smtp-Source: AGHT+IGWcjvODchrsi2yQ8GtYmtznraSNAizuKFt6+gaIgfWeMuvAwS835IZK/WEJ/OdJJDZPbnpmJLLqtUcBMiua/E=
X-Received: by 2002:a05:6870:1d11:b0:2b7:bd7f:f4d6 with SMTP id
 586e51a60fabf-2c78051611amr7581228fac.37.1742813294943; Mon, 24 Mar 2025
 03:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742570590.git.bertrand.marquis@arm.com> <f3886649f23845932dd322eb45ad8f980e53ded1.1742570590.git.bertrand.marquis@arm.com>
In-Reply-To: <f3886649f23845932dd322eb45ad8f980e53ded1.1742570590.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 24 Mar 2025 11:48:02 +0100
X-Gm-Features: AQ5f1Jo_kegjotNITD8a8jD1Jq6b_UMVRU55mdcu-2Ilr4BG4zYFTpZ5NU2yvt0
Message-ID: <CAHUa44GPniTZxtaUU3WeL_oU+oGYoz0nTBA=1QaE0Py=+bZQ8A@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 24, 2025 at 10:15=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is OP-TEE running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or Optee could be non functional (if FF-A is

Prefer OP-TEE

> probed first) so it is not recommended to activate the configuration
> option for such systems.
>
> To make buffer full notification work between VMs when there is no
> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - fix typos in commit message
> - add spaces around <<
> - move notification id fix back into buffer full patch
> - fix | position in if
> Changes in v2:
> - replace ifdef with IS_ENABLED when possible
> ---
>  xen/arch/arm/tee/ffa.c       |  12 +++-
>  xen/arch/arm/tee/ffa_notif.c | 104 ++++++++++++++++-------------------
>  2 files changed, 59 insertions(+), 57 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index e41ab5f8ada6..0627625efe60 100644
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
> @@ -561,6 +562,15 @@ err_no_fw:
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
> index f6df2f15bb00..86bef6b3b2ab 100644
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
> +    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
> +                               bitmap_lo, bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> @@ -51,18 +47,14 @@ int ffa_handle_notification_unbind(struct cpu_user_re=
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
> +    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_lo,
> +                                bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> @@ -71,7 +63,7 @@ void ffa_handle_notification_info_get(struct cpu_user_r=
egs *regs)
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      bool notif_pending;
>
> -    if ( !notif_enabled )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>      {
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          return;
> @@ -108,7 +100,7 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>      uint32_t w6 =3D 0;
>      uint32_t w7 =3D 0;
>
> -    if ( !notif_enabled )
> +    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
>      {
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          return;
> @@ -120,7 +112,8 @@ void ffa_handle_notification_get(struct cpu_user_regs=
 *regs)
>          return;
>      }
>
> -    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                                        FFA_NOTIF_FLAG_BITMAP_SPM )) )
>      {
>          struct arm_smccc_1_2_regs arg =3D {
>              .a0 =3D FFA_NOTIFICATION_GET,
> @@ -177,15 +170,14 @@ int ffa_handle_notification_set(struct cpu_user_reg=
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
> +    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bit=
map_lo,
> +                               bitmap_hi);
> +
> +    return FFA_RET_NOT_SUPPORTED;
>  }
>
>  #ifdef CONFIG_FFA_VM_TO_VM
> @@ -371,7 +363,7 @@ void ffa_notif_init_interrupt(void)
>  {
>      int ret;
>
> -    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
>      {
>          /*
>           * An error here is unlikely since the primary CPU has already
> @@ -402,41 +394,41 @@ void ffa_notif_init(void)
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
> @@ -447,6 +439,6 @@ void ffa_notif_domain_destroy(struct domain *d)
>       * Call bitmap_destroy even if bitmap create failed as the SPMC will
>       * return a DENIED error that we will ignore.
>       */
> -    if ( notif_enabled )
> +    if ( fw_notif_enabled )
>          ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
>  }
> --
> 2.47.1
>

