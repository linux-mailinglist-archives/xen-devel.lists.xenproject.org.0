Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A870C89FBED
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703402.1099061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua8n-00033M-01; Wed, 10 Apr 2024 15:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703402.1099061; Wed, 10 Apr 2024 15:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua8m-00031Z-T3; Wed, 10 Apr 2024 15:45:36 +0000
Received: by outflank-mailman (input) for mailman id 703402;
 Wed, 10 Apr 2024 15:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wd5r=LP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rua8l-00031T-Du
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:45:35 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd8f669-f751-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 17:45:32 +0200 (CEST)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-22a96054726so5641651fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 08:45:32 -0700 (PDT)
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
X-Inumbo-ID: 5cd8f669-f751-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712763931; x=1713368731; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+s7aQ6d+Mb/GWWV6PGQ9hc+apzFQuvLGgB+x4Pb+U=;
        b=NQecYgL8+9KB5mDxjgpnhrcE9a4UEaOQAIK7jtyhmkAfXPv1IuwminTfWe2kFhSA6m
         CEcxGz49ev/L7DOzEAiTbgJpw/tsTQigzGRsXQOgt8nmcVgLwZPGdjhW0JFKckNpb1lq
         lDDFuZXn0WZfKb8q7OF8vusyWdzSBud7ACCJ8btj+sRrkhcDKnHRZ8FvxBn664IgEMbX
         TFr/FccWACIaPLJhE0yhDSU24v7m/GMjPN2p2YDgJe4ayAt0EpVHK9UkRda+Gxi/dypA
         M8ncViozcCZIyb9QFPsuA1lk13qDeTS6tKBp48H0gmddCTv2Nv1OyS1XY23XR/mFGlEI
         j+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763931; x=1713368731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q+s7aQ6d+Mb/GWWV6PGQ9hc+apzFQuvLGgB+x4Pb+U=;
        b=wkpuJnB9gJ2PGY7bvrPESC5XHfXJzfIIDa1CsaYiLJ7a9fpKffs07j59gJJAZq2LSZ
         5GU1HxCb0Rb74jyf/W1skwVkc9AxOCV4kCibZ/kPmuUZOkuqonVWH/cgHZSE6HD3YBLZ
         6AVvdE4dmiOcBacIG6syVUSqxQ/ywelmDca3HZJ8SL+5oBqOy4dchr2NcqSXxhpLrWcT
         w4L/MK5RMyY03CvkMVz2FlieoJ05tvkmywO6SBODvXXcEU9A4wa9w4nlTbTlyu+/ORdv
         6iIos4WFqMnZNl1oU3Sxx5nXC01yoZvzUjFgpPxpGQcFvD6vln7y4g1SnPtjGSNM6hMa
         nVrg==
X-Gm-Message-State: AOJu0YzvcVFwL5u0ItgvHZpGyeHfmZg7BqcUTCUY/cKqaEt08zkUPMgM
	fCcFaRMdWopisXhi13JcLVhbqRwUSLkTPpz+sLFB0Fncf+A4keOq6BHOeePVQUd9oykF0uftzGM
	eaC+0v9mW8AKmR+gYxh0D++SJenOj15q0NiHMc5cf736rvIXg3RQ=
X-Google-Smtp-Source: AGHT+IGh4+ktIXLCtx9ugQAhHvavUg5iWn6KgjL0sHdGFiRfwdiQg+96xb3D6sv3L0jcy0WSATI81xKVyfMEYB0GQfQ=
X-Received: by 2002:a05:6870:9193:b0:22e:bace:ed96 with SMTP id
 b19-20020a056870919300b0022ebaceed96mr3018061oaf.15.1712763930911; Wed, 10
 Apr 2024 08:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240409153630.2026584-1-jens.wiklander@linaro.org> <20240409153630.2026584-6-jens.wiklander@linaro.org>
In-Reply-To: <20240409153630.2026584-6-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 10 Apr 2024 17:45:19 +0200
Message-ID: <CAHUa44EeCeX6nbY+FG_WUK6n-GMBFFYS9khpHF59fH8BSiW01Q@mail.gmail.com>
Subject: Re: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 5:36=E2=80=AFPM Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
>
> Add support for FF-A notifications, currently limited to an SP (Secure
> Partition) sending an asynchronous notification to a guest.
>
> Guests and Xen itself are made aware of pending notifications with an
> interrupt. The interrupt handler retrieves the notifications using the
> FF-A ABI and deliver them to their destinations.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/tee/Makefile      |   1 +
>  xen/arch/arm/tee/ffa.c         |  58 ++++++
>  xen/arch/arm/tee/ffa_notif.c   | 319 +++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_private.h |  71 ++++++++
>  4 files changed, 449 insertions(+)
>  create mode 100644 xen/arch/arm/tee/ffa_notif.c
>
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index f0112a2f922d..7c0f46f7f446 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) +=3D ffa.o
>  obj-$(CONFIG_FFA) +=3D ffa_shm.o
>  obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
>  obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
> +obj-$(CONFIG_FFA) +=3D ffa_notif.o
>  obj-y +=3D tee.o
>  obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5209612963e1..ce9757bfeed1 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -39,6 +39,9 @@
>   *   - at most 32 shared memory regions per guest
>   * o FFA_MSG_SEND_DIRECT_REQ:
>   *   - only supported from a VM to an SP
> + * o FFA_NOTIFICATION_*:
> + *   - only supports global notifications, that is, per vCPU notificatio=
ns
> + *     are not supported
>   *
>   * There are some large locked sections with ffa_tx_buffer_lock and
>   * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> @@ -194,6 +197,8 @@ out:
>
>  static void handle_features(struct cpu_user_regs *regs)
>  {
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t a1 =3D get_user_reg(regs, 1);
>      unsigned int n;
>
> @@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>          BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>          ffa_set_regs_success(regs, 0, 0);
>          break;
> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;

With the recently posted kernel patch
https://lore.kernel.org/all/20240410-ffa_npi_support-v1-3-1a5223391bd1@arm.=
com/
we need to decide which feature interrupt to return since the kernel
will only install a handle for the first it finds. Right now I propose
to to not report FFA_FEATURE_SCHEDULE_RECV_INTR. When the time comes
to use a secondary scheduler we'll need to report the SRI instead.

Cheers,
Jens

> +
> +    case FFA_NOTIFICATION_BIND:
> +    case FFA_NOTIFICATION_UNBIND:
> +    case FFA_NOTIFICATION_GET:
> +    case FFA_NOTIFICATION_SET:
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>      default:
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>          break;
> @@ -305,6 +334,30 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>                                                       get_user_reg(regs, =
1)),
>                                     get_user_reg(regs, 3));
>          break;
> +    case FFA_NOTIFICATION_BIND:
> +        e =3D ffa_handle_notification_bind(get_user_reg(regs, 1),
> +                                         get_user_reg(regs, 2),
> +                                         get_user_reg(regs, 3),
> +                                         get_user_reg(regs, 4));
> +        break;
> +    case FFA_NOTIFICATION_UNBIND:
> +        e =3D ffa_handle_notification_unbind(get_user_reg(regs, 1),
> +                                           get_user_reg(regs, 3),
> +                                           get_user_reg(regs, 4));
> +        break;
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        ffa_handle_notification_info_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_GET:
> +        ffa_handle_notification_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_SET:
> +        e =3D ffa_handle_notification_set(get_user_reg(regs, 1),
> +                                        get_user_reg(regs, 2),
> +                                        get_user_reg(regs, 3),
> +                                        get_user_reg(regs, 4));
> +        break;
>
>      default:
>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -348,6 +401,9 @@ static int ffa_domain_init(struct domain *d)
>      if ( !ffa_partinfo_domain_init(d) )
>          return -EIO;
>
> +    if ( !ffa_notif_domain_init(d) )
> +        return -ENOMEM;
> +
>      return 0;
>  }
>
> @@ -423,6 +479,7 @@ static int ffa_domain_teardown(struct domain *d)
>          return 0;
>
>      ffa_rxtx_domain_destroy(d);
> +    ffa_notif_domain_destroy(d);
>
>      ffa_domain_teardown_continue(ctx, true /* first_time */);
>
> @@ -502,6 +559,7 @@ static bool ffa_probe(void)
>      if ( !ffa_partinfo_init() )
>          goto err_rxtx_destroy;
>
> +    ffa_notif_init();
>      INIT_LIST_HEAD(&ffa_teardown_head);
>      init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> new file mode 100644
> index 000000000000..0173ee515362
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -0,0 +1,319 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/list.h>
> +#include <xen/spinlock.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +static bool __ro_after_init notif_enabled;
> +
> +int ffa_handle_notification_bind(uint32_t src_dst, uint32_t flags,
> +                                 uint32_t bitmap_lo, uint32_t bitmap_hi)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xffff) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( flags )    /* Only global notifications are supported */
> +        return FFA_RET_DENIED;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the sen=
der
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_hi,
> +                           bitmap_lo);
> +}
> +
> +int ffa_handle_notification_unbind(uint32_t src_dst, uint32_t bitmap_lo,
> +                                   uint32_t bitmap_hi)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xffff) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the
> +     * destination endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
hi,
> +                            bitmap_lo);
> +}
> +
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    bool pending_global;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    spin_lock(&ctx->notif.lock);
> +    pending_global =3D ctx->notif.secure_pending;
> +    ctx->notif.secure_pending =3D false;
> +    spin_unlock(&ctx->notif.lock);
> +
> +    if ( pending_global )
> +    {
> +        /* A pending global notification for the guest */
> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm=
_id(d),
> +                     0, 0, 0, 0);
> +    }
> +    else
> +    {
> +        /* Report an error if there where no pending global notification=
 */
> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
> +    }
> +}
> +
> +void ffa_handle_notification_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t recv =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t w2 =3D 0;
> +    uint32_t w3 =3D 0;
> +    uint32_t w4 =3D 0;
> +    uint32_t w5 =3D 0;
> +    uint32_t w6 =3D 0;
> +    uint32_t w7 =3D 0;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    if ( (recv & 0xffff) !=3D ffa_get_vm_id(d) )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> +        return;
> +    }
> +
> +    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    {
> +        struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_NOTIFICATION_GET,
> +            .a1 =3D recv,
> +            .a2 =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                            FFA_NOTIF_FLAG_BITMAP_SPM ),
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +        int32_t e;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        e =3D ffa_get_ret_code(&resp);
> +        if ( e )
> +        {
> +            ffa_set_regs_error(regs, e);
> +            return;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SP )
> +        {
> +            w2 =3D resp.a2;
> +            w3 =3D resp.a3;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
> +            w6 =3D resp.a6;
> +    }
> +
> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> +}
> +
> +int ffa_handle_notification_set(uint32_t src_dst, uint32_t flags,
> +                                uint32_t bitmap_lo, uint32_t bitmap_hi)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the sen=
der
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_=
lo,
> +                           bitmap_hi);
> +}
> +
> +static uint16_t get_id_from_resp(struct arm_smccc_1_2_regs *resp,
> +                                 unsigned int n)
> +{
> +    unsigned int ids_per_reg;
> +    unsigned int reg_idx;
> +    unsigned int reg_shift;
> +
> +    if ( smccc_is_conv_64(resp->a0) )
> +        ids_per_reg =3D 4;
> +    else
> +        ids_per_reg =3D 2;
> +
> +    reg_idx =3D n / ids_per_reg + 3;
> +    reg_shift =3D ( n % ids_per_reg ) * 16;
> +
> +    switch ( reg_idx )
> +    {
> +    case 3:
> +        return resp->a3 >> reg_shift;
> +    case 4:
> +        return resp->a4 >> reg_shift;
> +    case 5:
> +        return resp->a5 >> reg_shift;
> +    case 6:
> +        return resp->a6 >> reg_shift;
> +    case 7:
> +        return resp->a7 >> reg_shift;
> +    default:
> +        ASSERT(0); /* "Can't happen" */
> +        return 0;
> +    }
> +}
> +
> +static void notif_irq_handler(int irq, void *data)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int id_pos;
> +    unsigned int list_count;
> +    uint64_t ids_count;
> +    unsigned int n;
> +    int32_t res;
> +
> +    do {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        res =3D ffa_get_ret_code(&resp);
> +        if ( res )
> +        {
> +            if ( res !=3D FFA_RET_NO_DATA )
> +                printk(XENLOG_ERR "ffa: notification info get failed: er=
ror %d\n",
> +                       res);
> +            return;
> +        }
> +
> +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT ) =
&
> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> +
> +        id_pos =3D 0;
> +        for ( n =3D 0; n < list_count; n++ )
> +        {
> +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> +            struct domain *d;
> +
> +            d =3D ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_pos=
));
> +
> +            if ( d )
> +            {
> +                struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +                spin_lock(&ctx->notif.lock);
> +                ctx->notif.secure_pending =3D true;
> +                spin_unlock(&ctx->notif.lock);
> +
> +                /*
> +                 * Since we're only delivering global notification, alwa=
ys
> +                 * deliver to the first vCPU. It doesn't matter which we
> +                 * chose, as long as it's available.
> +                 */
> +                vgic_inject_irq(d, d->vcpu[0], FFA_NOTIF_PEND_INTR_ID, t=
rue);
> +
> +                put_domain(d);
> +            }
> +
> +            id_pos +=3D count;
> +        }
> +
> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +}
> +
> +static int32_t ffa_notification_bitmap_create(uint16_t vm_id,
> +                                              uint32_t vcpu_count)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_CREATE, vm_id, vcpu_c=
ount,
> +                           0, 0);
> +}
> +
> +static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0,=
 0);
> +}
> +
> +void ffa_notif_init(void)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_FEATURES,
> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int irq;
> +    int ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> +        return;
> +
> +    irq =3D resp.a2;
> +    if ( irq >=3D NR_GIC_SGI )
> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
> +    if ( ret )
> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> +               irq, ret);
> +    notif_enabled =3D !ret;
> +}
> +
> +bool ffa_notif_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t res;
> +
> +    if ( !notif_enabled )
> +        return true;
> +
> +    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpu=
s);
> +    if ( res )
> +        return false;
> +
> +    ctx->notif.enabled =3D true;
> +
> +    return true;
> +}
> +
> +void ffa_notif_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( ctx->notif.enabled )
> +    {
> +        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> +        ctx->notif.enabled =3D false;
> +    }
> +}
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 98236cbf14a3..26c2af164d38 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -25,6 +25,7 @@
>  #define FFA_RET_DENIED                  -6
>  #define FFA_RET_RETRY                   -7
>  #define FFA_RET_ABORTED                 -8
> +#define FFA_RET_NO_DATA                 -9
>
>  /* FFA_VERSION helpers */
>  #define FFA_VERSION_MAJOR_SHIFT         16U
> @@ -60,6 +61,8 @@
>   */
>  #define FFA_PAGE_SIZE                   SZ_4K
>
> +#define FFA_NOTIF_BITMAP_SIZE           64
> +
>  /*
>   * The number of pages used for each of the RX and TX buffers shared wit=
h
>   * the SPMC.
> @@ -97,6 +100,18 @@
>   */
>  #define FFA_MAX_SHM_COUNT               32
>
> +/*
> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
> + * unused, but that may change.
> + *
> + * SGI is the preferred delivery mechanism. SGIs 8-15 are normally not u=
sed
> + * by a guest as they in a non-virtualized system typically are assigned=
 to
> + * the secure world. Here we're free to use SGI 8-15 since they are virt=
ual
> + * and have nothing to do with the secure world.
> + */
> +#define FFA_NOTIF_PEND_INTR_ID      8
> +#define FFA_SCHEDULE_RECV_INTR_ID   9
> +
>  /*
>   * The time we wait until trying to tear down a domain again if it was
>   * blocked initially.
> @@ -175,6 +190,21 @@
>   */
>  #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>
> +/* Flags used in calls to FFA_NOTIFICATION_GET interface  */
> +#define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
> +#define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> +#define FFA_NOTIF_FLAG_BITMAP_SPM       BIT(2, U)
> +#define FFA_NOTIF_FLAG_BITMAP_HYP       BIT(3, U)
> +
> +#define FFA_NOTIF_INFO_GET_MORE_FLAG        BIT(0, U)
> +#define FFA_NOTIF_INFO_GET_ID_LIST_SHIFT    12
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
> +
> +/* Feature IDs used with FFA_FEATURES */
> +#define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
> +#define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
> +
>  /* Function IDs */
>  #define FFA_ERROR                       0x84000060U
>  #define FFA_SUCCESS_32                  0x84000061U
> @@ -213,6 +243,27 @@
>  #define FFA_MEM_FRAG_TX                 0x8400007BU
>  #define FFA_MSG_SEND                    0x8400006EU
>  #define FFA_MSG_POLL                    0x8400006AU
> +#define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
> +#define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
> +#define FFA_NOTIFICATION_BIND           0x8400007FU
> +#define FFA_NOTIFICATION_UNBIND         0x84000080U
> +#define FFA_NOTIFICATION_SET            0x84000081U
> +#define FFA_NOTIFICATION_GET            0x84000082U
> +#define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
> +#define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> +
> +struct ffa_ctx_notif {
> +    bool enabled;
> +
> +    /* Used to serialize access to the rest of this struct */
> +    spinlock_t lock;
> +
> +    /*
> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> +     * pending global notifications.
> +     */
> +    bool secure_pending;
> +};
>
>  struct ffa_ctx {
>      void *rx;
> @@ -228,6 +279,7 @@ struct ffa_ctx {
>      struct list_head shm_list;
>      /* Number of allocated shared memory object */
>      unsigned int shm_count;
> +    struct ffa_ctx_notif notif;
>      /*
>       * tx_lock is used to serialize access to tx
>       * rx_lock is used to serialize access to rx
> @@ -271,12 +323,31 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register=
_t tx_addr,
>  uint32_t ffa_handle_rxtx_unmap(void);
>  int32_t ffa_handle_rx_release(void);
>
> +void ffa_notif_init(void);
> +bool ffa_notif_domain_init(struct domain *d);
> +void ffa_notif_domain_destroy(struct domain *d);
> +
> +int ffa_handle_notification_bind(uint32_t src_dst, uint32_t flags,
> +                                 uint32_t bitmap_lo, uint32_t bitmap_hi)=
;
> +int ffa_handle_notification_unbind(uint32_t src_dst, uint32_t bitmap_lo,
> +                                   uint32_t bitmap_hi);
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
> +void ffa_handle_notification_get(struct cpu_user_regs *regs);
> +int ffa_handle_notification_set(uint32_t src_dst, uint32_t flags,
> +                                uint32_t bitmap_lo, uint32_t bitmap_hi);
> +
>  static inline uint16_t ffa_get_vm_id(const struct domain *d)
>  {
>      /* +1 since 0 is reserved for the hypervisor in FF-A */
>      return d->domain_id + 1;
>  }
>
> +static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
> +{
> +    /* -1 to match ffa_get_vm_id() */
> +    return get_domain_by_id(vm_id - 1);
> +}
> +
>  static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v=
0,
>                                  register_t v1, register_t v2, register_t=
 v3,
>                                  register_t v4, register_t v5, register_t=
 v6,
> --
> 2.34.1
>

