Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17FAC066C
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993133.1376592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0qx-00026V-0P; Thu, 22 May 2025 08:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993133.1376592; Thu, 22 May 2025 08:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0qw-00024O-Ta; Thu, 22 May 2025 08:00:34 +0000
Received: by outflank-mailman (input) for mailman id 993133;
 Thu, 22 May 2025 08:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMjk=YG=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uI0qv-00024I-LK
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:00:33 +0000
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [2607:f8b0:4864:20::a33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4879ad9-36e2-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 10:00:31 +0200 (CEST)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so5002725e0c.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 01:00:31 -0700 (PDT)
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
X-Inumbo-ID: d4879ad9-36e2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747900830; x=1748505630; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0ANtDmhC85QqsrPkwAYqYXWbxfJ8i+/FZVdm/ElQk4=;
        b=PWCaKWgGgyAWgINbcXcbD8WGYzTsd8WPxHNRUiRdqAzfK9wfTVB9qGAuF9hU48Z4Kz
         kf2+LA4O7OQbaeOCYjaGpy51THzZUMlxRpMmaFtERzlRpyTMuOiNmNbxCmOxRm+97uxH
         fLtSgxf0V+wuo6HzTltUt5Kz+JezEP2Y7kkPabRX+VMsTkdmVAUYlRhJMP1fcKTtsham
         iPDoEvhz274zpWgtI8YfBqzolr9uh0mESVBGinu+vzwbkC9NJWhMvNNYvpcTa/JnhGuM
         vuv23lUPTfs1n6N4AGoV+muJ1kSfv+blSgsg598PdxHfP46ZlKGk9Amz9JSNpP98af16
         xVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900830; x=1748505630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0ANtDmhC85QqsrPkwAYqYXWbxfJ8i+/FZVdm/ElQk4=;
        b=NXEI/Fr2sxoBfDW8lSDjgWcoAXdaRMohn+xsqUmGHT3Cey7+9qVLdEYgMgivmBrAd9
         FOByDVZ5djd99OAaeGL81mTEFpovQjCkVWQzG0g57s4C+XiF78hmW2bZJHczDLkPG0zy
         LVZjOMIsnhcn5prMxbdHbnqsAo0Twfmz4w81IPEMLsQm+1W3uCs+bTUfT7IYk80Mwqym
         qo/An/1WlhEq44OMlJfEXv20eEh3fv75OwATy1cYK6ys90PQKcQEMEDfz8LVzYj5WgXS
         33SeOp9V8AtLphUYiBCkHjRO02G1A7WSVdDZ5KIQHBofOFsvzZ7wqOwcJFsH8QIb2TcW
         nzcw==
X-Gm-Message-State: AOJu0YxURTb9ctGDHOHKQErrV52LrRSf9F5bJw7xy/NO9jYEvdPtlyMU
	EFY6ECxYtGCzaSnsJ7Uro85ASLrkP5KL/z1z4z+1i71rUC5hTIot65Uo0PQOrU77/xL0ltQmYXE
	P1vgKHV3RMbUCb/8NMBg1iemU1J94Zj/bSEe052lBhCbhMi77jzMqN5s=
X-Gm-Gg: ASbGncvELOffe2xrrg3w/OK7mInPCmk4aZuJWfsbSQGVKvpQqYVfxP3m6vYL6feyQXg
	f8cZxmc6yD8JGbOyJZFxRudS47XKnFUVDFdaPfFwlehscUArr7lk+dLABR0Xe2yozkzqyyzCCKt
	AC5NTHqtM9ZlLxrmkrWmT9Sp/TNjVch9AN1aJ3y8wKqGI3
X-Google-Smtp-Source: AGHT+IGdj6Uo2f+U1JrZ1x5Zi+XcBtkVYej0WVySL9D9CZqytzref130/YnSAmWDWvGX0Z1IGq1RtoCB+l+8+1YeD6U=
X-Received: by 2002:a05:6808:8415:b0:401:e8a2:76f1 with SMTP id
 5614622812f47-404d863ceecmr14728485b6e.8.1747900819786; Thu, 22 May 2025
 01:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com> <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
In-Reply-To: <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 10:00:07 +0200
X-Gm-Features: AX0GCFtd0FL6s2QGaNY8INBsNUamZM5QZWklI6dV-jcth4u6_T7Jq_zO_G54X6U
Message-ID: <CAHUa44H5K+=eX_OhPMTCsNAeBb-XWMNout0UeLvSyJzYrnXRcg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is OP-TEE running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.
>
> To make buffer full notification work between VMs when there is no
> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v5:
> - init ctx list when there is no firmware
> - rework init a bit to prevent duplicates
> - Remove Jens R-b due to changes done
> Changes in v4:
> - Fix Optee to OP-TEE in commit message
> - Add Jens R-b
> Changes in v3:
> - fix typos in commit message
> - add spaces around <<
> - move notification id fix back into buffer full patch
> - fix | position in if
> Changes in v2:
> - replace ifdef with IS_ENABLED when possible
> ---
>  xen/arch/arm/tee/ffa.c       |  24 ++++++--
>  xen/arch/arm/tee/ffa_notif.c | 104 ++++++++++++++++-------------------
>  2 files changed, 67 insertions(+), 61 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index c1c4c0957091..b86c88cefa8c 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -342,8 +342,9 @@ static int ffa_domain_init(struct domain *d)
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
> @@ -579,11 +580,8 @@ static bool ffa_probe(void)
>          goto err_rxtx_destroy;
>
>      ffa_notif_init();
> -    INIT_LIST_HEAD(&ffa_teardown_head);
> -    INIT_LIST_HEAD(&ffa_ctx_head);
> -    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
>
> -    return true;
> +    goto exit;
>
>  err_rxtx_destroy:
>      ffa_rxtx_destroy();
> @@ -592,6 +590,22 @@ err_no_fw:
>      bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>      printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
>
> +exit:
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) || ffa_fw_version )
> +    {
> +        INIT_LIST_HEAD(&ffa_teardown_head);
> +        INIT_LIST_HEAD(&ffa_ctx_head);
> +        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NUL=
L, 0);
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        printk(XENLOG_INFO "ARM FF-A only available between VMs\n");

This should only be printed if ffa_fw_version =3D=3D 0

> +        return true;
> +    }
> +    else if ( ffa_fw_version )

The else isn't needed.

Cheers,
Jens

> +        return true;
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

