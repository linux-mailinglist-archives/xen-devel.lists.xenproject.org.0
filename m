Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6E89FBF4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703407.1099071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruaBD-0003cO-DU; Wed, 10 Apr 2024 15:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703407.1099071; Wed, 10 Apr 2024 15:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruaBD-0003ZI-AD; Wed, 10 Apr 2024 15:48:07 +0000
Received: by outflank-mailman (input) for mailman id 703407;
 Wed, 10 Apr 2024 15:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wd5r=LP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruaBB-0003ZC-RF
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:48:06 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b75cc74f-f751-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 17:48:04 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-221e76cad07so4295468fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 08:48:04 -0700 (PDT)
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
X-Inumbo-ID: b75cc74f-f751-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712764083; x=1713368883; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpLpUpj5p8kB7JADxI3npWjIi4LjnitfPxAhFTSOkhA=;
        b=Vm9VU5NYO5XmZ57WwUnxjhCe+SL0GraQ8KSPdh4jgSWARXkhBjLN33qsGts4NZDiIV
         svtmMZ4dH/rY1J/XeWPJ7v7oJ+VJCDERMwDR1iMOSyUrGT2Lqc/W7t+4muQZRPae+NFg
         XCB1FjBwleEBA2BrGHCnvCnq1VBRPmHOIkx3NliH0ZQHHDtEZrO6bTvZCRX8mbYxQMuk
         HXQbg27nLnQCWbuS4ZgMXT3+gu8msoKf/CQZmfHLLE8gB/vmEk7QOUZNQ8DXiFcVbYuq
         avaDeqaAkuwZ9YYSxkM359qWf9BL+04Y2VEeIA1qwXl9NhdKgzG6T1Kqj4f4f9mBHBz8
         0isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764083; x=1713368883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpLpUpj5p8kB7JADxI3npWjIi4LjnitfPxAhFTSOkhA=;
        b=qANP0Q0U76Pt9rQc67ubG16Cd8joXrVuDdCkUKrZIeSJgxCEzFo8VWR1XVeajnUk1I
         w1oxrIXwDZnKmPte9qhp5wLoV9kOvMZjmSXO/wfvtd4bTOrMVgNBhLE2XSK5+YhB/45/
         C7QKJb8zm6QToAmOObfYDzRWy9PNPkZTSPO1AUC/f75g+Gqy7Mwf5OzgXtLR3u1L0ZA2
         YF/c4CROFdWW17KYBYxNxXbfI1lcqB0o+L4S373oSWobGPR5cHXItxYEj9TG/aHvFR3F
         76r3IWcVM03FIe2gdaBoUrgV+2Ft7CqbNgEXR4/vI3IOOI0fRIOdjDq1nA0F3GKnS05o
         WMAA==
X-Gm-Message-State: AOJu0YznyZ2GvtKXGxlFYJwkcVs3WmlLkEqXHPKDNaYSZcDiGnvXKrbs
	lYGldTuYtyds1VPZHlsdjtiYlN29xgBw69ssm+sdiU2kaSoAWkuMJke9KUwGYmhrBAqgQxDT/52
	JoBwE97sTTOEhkRRFnvN6NYRoayT4a+abgFlQyBGx/rK+jxn3
X-Google-Smtp-Source: AGHT+IHY9Yb3GtPBjgEt5EUiRC2djAO18cF2o989IARZFSHr1CkJZ+XLNmEKCfIqwfKuzqO8F2krZ1/7upjsm2PU2tM=
X-Received: by 2002:a05:6871:418e:b0:22a:51f6:b059 with SMTP id
 lc14-20020a056871418e00b0022a51f6b059mr25320oab.3.1712764082962; Wed, 10 Apr
 2024 08:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
 <20240409153630.2026584-6-jens.wiklander@linaro.org> <C9733F1F-E308-46D3-AC84-D4651B4D6723@arm.com>
 <CAHUa44H3=QsEkJ6RrBRS30ccaCbg3GQTYeVF+WpnvDk8qnzw=w@mail.gmail.com> <F27906D5-80F4-4542-99B7-1666B7A3AD95@arm.com>
In-Reply-To: <F27906D5-80F4-4542-99B7-1666B7A3AD95@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 10 Apr 2024 17:47:51 +0200
Message-ID: <CAHUa44Gqtvu-eKSAR+5iW2YBb-7D3Ga0yxU7fEvLk=cOg2-txw@mail.gmail.com>
Subject: Re: [XEN PATCH v1 5/5] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Apr 10, 2024 at 5:41=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 10 Apr 2024, at 16:27, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > On Wed, Apr 10, 2024 at 9:49=E2=80=AFAM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 9 Apr 2024, at 17:36, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
> >>>
> >>> Add support for FF-A notifications, currently limited to an SP (Secur=
e
> >>> Partition) sending an asynchronous notification to a guest.
> >>>
> >>> Guests and Xen itself are made aware of pending notifications with an
> >>> interrupt. The interrupt handler retrieves the notifications using th=
e
> >>> FF-A ABI and deliver them to their destinations.
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/Makefile      |   1 +
> >>> xen/arch/arm/tee/ffa.c         |  58 ++++++
> >>> xen/arch/arm/tee/ffa_notif.c   | 319 ++++++++++++++++++++++++++++++++=
+
> >>> xen/arch/arm/tee/ffa_private.h |  71 ++++++++
> >>> 4 files changed, 449 insertions(+)
> >>> create mode 100644 xen/arch/arm/tee/ffa_notif.c
> >>>
> >>> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> >>> index f0112a2f922d..7c0f46f7f446 100644
> >>> --- a/xen/arch/arm/tee/Makefile
> >>> +++ b/xen/arch/arm/tee/Makefile
> >>> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) +=3D ffa.o
> >>> obj-$(CONFIG_FFA) +=3D ffa_shm.o
> >>> obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
> >>> obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
> >>> +obj-$(CONFIG_FFA) +=3D ffa_notif.o
> >>> obj-y +=3D tee.o
> >>> obj-$(CONFIG_OPTEE) +=3D optee.o
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index 5209612963e1..ce9757bfeed1 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -39,6 +39,9 @@
> >>> *   - at most 32 shared memory regions per guest
> >>> * o FFA_MSG_SEND_DIRECT_REQ:
> >>> *   - only supported from a VM to an SP
> >>> + * o FFA_NOTIFICATION_*:
> >>> + *   - only supports global notifications, that is, per vCPU notific=
ations
> >>> + *     are not supported
> >>> *
> >>> * There are some large locked sections with ffa_tx_buffer_lock and
> >>> * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> >>> @@ -194,6 +197,8 @@ out:
> >>>
> >>> static void handle_features(struct cpu_user_regs *regs)
> >>> {
> >>> +    struct domain *d =3D current->domain;
> >>> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >>>    uint32_t a1 =3D get_user_reg(regs, 1);
> >>>    unsigned int n;
> >>>
> >>> @@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs=
 *regs)
> >>>        BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> >>>        ffa_set_regs_success(regs, 0, 0);
> >>>        break;
> >>> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> >>> +        if ( ctx->notif.enabled )
> >>> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> >>> +        else
> >>> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>> +        break;
> >>> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> >>> +        if ( ctx->notif.enabled )
> >>> +            ffa_set_regs_success(regs, FFA_NOTIF_PEND_INTR_ID, 0);
> >>
> >> This should return the RECV_INTR, not the PEND one.
> >
> > Thanks, I'll fix it.
> >
> >>
> >>> +        else
> >>> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>> +        break;
> >>> +
> >>> +    case FFA_NOTIFICATION_BIND:
> >>> +    case FFA_NOTIFICATION_UNBIND:
> >>> +    case FFA_NOTIFICATION_GET:
> >>> +    case FFA_NOTIFICATION_SET:
> >>> +    case FFA_NOTIFICATION_INFO_GET_32:
> >>> +    case FFA_NOTIFICATION_INFO_GET_64:
> >>> +        if ( ctx->notif.enabled )
> >>> +            ffa_set_regs_success(regs, 0, 0);
> >>> +        else
> >>> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>> +        break;
> >>>    default:
> >>>        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>>        break;
> >>> @@ -305,6 +334,30 @@ static bool ffa_handle_call(struct cpu_user_regs=
 *regs)
> >>>                                                     get_user_reg(regs=
, 1)),
> >>>                                   get_user_reg(regs, 3));
> >>>        break;
> >>> +    case FFA_NOTIFICATION_BIND:
> >>> +        e =3D ffa_handle_notification_bind(get_user_reg(regs, 1),
> >>> +                                         get_user_reg(regs, 2),
> >>> +                                         get_user_reg(regs, 3),
> >>> +                                         get_user_reg(regs, 4));
> >>
> >> I would suggest to pass regs and handle the get_user_regs in the funct=
ion.
> >
> > OK
> >
> >>
> >>> +        break;
> >>> +    case FFA_NOTIFICATION_UNBIND:
> >>> +        e =3D ffa_handle_notification_unbind(get_user_reg(regs, 1),
> >>> +                                           get_user_reg(regs, 3),
> >>> +                                           get_user_reg(regs, 4));
> >>
> >> same here
> >
> > OK
> >
> >>
> >>> +        break;
> >>> +    case FFA_NOTIFICATION_INFO_GET_32:
> >>> +    case FFA_NOTIFICATION_INFO_GET_64:
> >>> +        ffa_handle_notification_info_get(regs);
> >>> +        return true;
> >>> +    case FFA_NOTIFICATION_GET:
> >>> +        ffa_handle_notification_get(regs);
> >>> +        return true;
> >>> +    case FFA_NOTIFICATION_SET:
> >>> +        e =3D ffa_handle_notification_set(get_user_reg(regs, 1),
> >>> +                                        get_user_reg(regs, 2),
> >>> +                                        get_user_reg(regs, 3),
> >>> +                                        get_user_reg(regs, 4));
> >>
> >> same here
> >
> > OK
> >
> >>
> >>> +        break;
> >>>
> >>>    default:
> >>>        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> >>> @@ -348,6 +401,9 @@ static int ffa_domain_init(struct domain *d)
> >>>    if ( !ffa_partinfo_domain_init(d) )
> >>>        return -EIO;
> >>>
> >>> +    if ( !ffa_notif_domain_init(d) )
> >>> +        return -ENOMEM;
> >>
> >> Having this function deciding on the return code is a bit weird.
> >> I would suggest to have ffa_notif_domain_init returning an int
> >> and deciding on the error code and this one just returning the
> >> error if !=3D0.
> >>
> >> If possible the same principle should be applied for the partinfo.
> >
> > OK, I'll fix it.
> >
> >>
> >>> +
> >>>    return 0;
> >>> }
> >>>
> >>> @@ -423,6 +479,7 @@ static int ffa_domain_teardown(struct domain *d)
> >>>        return 0;
> >>>
> >>>    ffa_rxtx_domain_destroy(d);
> >>> +    ffa_notif_domain_destroy(d);
> >>>
> >>>    ffa_domain_teardown_continue(ctx, true /* first_time */);
> >>>
> >>> @@ -502,6 +559,7 @@ static bool ffa_probe(void)
> >>>    if ( !ffa_partinfo_init() )
> >>>        goto err_rxtx_destroy;
> >>>
> >>> +    ffa_notif_init();
> >>>    INIT_LIST_HEAD(&ffa_teardown_head);
> >>>    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL,=
 0);
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_noti=
f.c
> >>> new file mode 100644
> >>> index 000000000000..0173ee515362
> >>> --- /dev/null
> >>> +++ b/xen/arch/arm/tee/ffa_notif.c
> >>> @@ -0,0 +1,319 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * Copyright (C) 2024  Linaro Limited
> >>> + */
> >>> +
> >>> +#include <xen/const.h>
> >>> +#include <xen/list.h>
> >>> +#include <xen/spinlock.h>
> >>> +#include <xen/types.h>
> >>> +
> >>> +#include <asm/smccc.h>
> >>> +#include <asm/regs.h>
> >>> +
> >>> +#include "ffa_private.h"
> >>> +
> >>> +static bool __ro_after_init notif_enabled;
> >>> +
> >>> +int ffa_handle_notification_bind(uint32_t src_dst, uint32_t flags,
> >>> +                                 uint32_t bitmap_lo, uint32_t bitmap=
_hi)
> >>> +{
> >>> +    struct domain *d =3D current->domain;
> >>> +
> >>> +    if ( !notif_enabled )
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>> +
> >>> +    if ( (src_dst & 0xffff) !=3D ffa_get_vm_id(d) )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>
> >> s/0xffff/0xFFFFU/
> >
> > OK
> >
> >>
> >>> +
> >>> +    if ( flags )    /* Only global notifications are supported */
> >>> +        return FFA_RET_DENIED;
> >>> +
> >>> +    /*
> >>> +     * We only support notifications from SP so no need to check the=
 sender
> >>> +     * endpoint ID, the SPMC will take care of that for us.
> >>> +     */
> >>> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bi=
tmap_hi,
> >>> +                           bitmap_lo);
> >>> +}
> >>> +
> >>> +int ffa_handle_notification_unbind(uint32_t src_dst, uint32_t bitmap=
_lo,
> >>> +                                   uint32_t bitmap_hi)
> >>> +{
> >>> +    struct domain *d =3D current->domain;
> >>> +
> >>> +    if ( !notif_enabled )
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>> +
> >>> +    if ( (src_dst & 0xffff) !=3D ffa_get_vm_id(d) )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>
> >> s/0xffff/0xFFFFU/
> >
> > OK
> >
> >>
> >>> +
> >>> +    /*
> >>> +     * We only support notifications from SP so no need to check the
> >>> +     * destination endpoint ID, the SPMC will take care of that for =
us.
> >>> +     */
> >>> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_hi,
> >>> +                            bitmap_lo);
> >>> +}
> >>> +
> >>> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> >>> +{
> >>> +    struct domain *d =3D current->domain;
> >>> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >>> +    bool pending_global;
> >>> +
> >>> +    if ( !notif_enabled )
> >>> +    {
> >>> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    spin_lock(&ctx->notif.lock);
> >>> +    pending_global =3D ctx->notif.secure_pending;
> >>> +    ctx->notif.secure_pending =3D false;
> >>> +    spin_unlock(&ctx->notif.lock);
> >>> +
> >>> +    if ( pending_global )
> >>> +    {
> >>> +        /* A pending global notification for the guest */
> >>> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> >>> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_ge=
t_vm_id(d),
> >>> +                     0, 0, 0, 0);
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        /* Report an error if there where no pending global notifica=
tion */
> >>> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
> >>> +    }
> >>> +}
> >>> +
> >>> +void ffa_handle_notification_get(struct cpu_user_regs *regs)
> >>> +{
> >>> +    struct domain *d =3D current->domain;
> >>> +    uint32_t recv =3D get_user_reg(regs, 1);
> >>> +    uint32_t flags =3D get_user_reg(regs, 2);
> >>> +    uint32_t w2 =3D 0;
> >>> +    uint32_t w3 =3D 0;
> >>> +    uint32_t w4 =3D 0;
> >>> +    uint32_t w5 =3D 0;
> >>> +    uint32_t w6 =3D 0;
> >>> +    uint32_t w7 =3D 0;
> >>> +
> >>> +    if ( !notif_enabled )
> >>> +    {
> >>> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    if ( (recv & 0xffff) !=3D ffa_get_vm_id(d) )
> >> s/0xffff/0xFFFFU/
> >
> > OK
> >
> >>
> >>> +    {
> >>> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_=
SPM ) )
> >>> +    {
> >>> +        struct arm_smccc_1_2_regs arg =3D {
> >>> +            .a0 =3D FFA_NOTIFICATION_GET,
> >>> +            .a1 =3D recv,
> >>> +            .a2 =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> >>> +                            FFA_NOTIF_FLAG_BITMAP_SPM ),
> >>> +        };
> >>> +        struct arm_smccc_1_2_regs resp;
> >>> +        int32_t e;
> >>> +
> >>> +        arm_smccc_1_2_smc(&arg, &resp);
> >>> +        e =3D ffa_get_ret_code(&resp);
> >>> +        if ( e )
> >>> +        {
> >>> +            ffa_set_regs_error(regs, e);
> >>> +            return;
> >>> +        }
> >>> +
> >>> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SP )
> >>> +        {
> >>> +            w2 =3D resp.a2;
> >>> +            w3 =3D resp.a3;
> >>> +        }
> >>> +
> >>> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
> >>> +            w6 =3D resp.a6;
> >>> +    }
> >>> +
> >>> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> >>> +}
> >>> +
> >>> +int ffa_handle_notification_set(uint32_t src_dst, uint32_t flags,
> >>> +                                uint32_t bitmap_lo, uint32_t bitmap_=
hi)
> >>> +{
> >>> +    struct domain *d =3D current->domain;
> >>> +
> >>> +    if ( !notif_enabled )
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>> +
> >>> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>
> >> This needs some checking as i would have used the lowest bits here
> >> for the source and not the highest. The spec is using the same descrip=
tion
> >> for all ABIs so I am wondering if you are not using the destination in=
stead of
> >> the source here.
> >
> > This is a bit tricky because not all ABI functions define Sender and
> > Receiver in the same way. For FFA_NOTIFICATION_BIND it's the Sender
> > and Receiver of the notification, while for instance,
> > FFA_MSG_SEND_DIRECT_REQ defines it as the Sender and Receiver of the
> > message.
> >
> > When the Hypervisor invokes FFA_NOTIFICATION_SET it's the Sender and
> > Receiver of the notification, that is, the guest is the same as the
> > sender of the notification. So the guest ID should go into BIT[31:16],
> > and the receiver of the notification in BIT[15:0].
> >
> > When the guest invokes FFA_NOTIFICATION_SET the Hypervisor is
> > requested to signal notifications to the Sender endpoint BIT[31:16].
> > What's expected in BIT[15:0] isn't mentioned so I assume the
> > Hypervisor should ignore it since it already knows the guest ID.
> >
> > Following that analysis, we should replace the if statement above with:
> > src_dst =3D ((uint32_t)ffa_get_vm_id(d) << 16) | (src_dst >> 16)
> >
> > But I'm not certain I've understood the specification correctly, in
> > particular the part where the guest invokes FFA_NOTIFICATION_SET.
> >
> > What's your take on this?
> >
> > I don't use this function in my tests so it's perhaps better to wait
> > with the implementation of this function until it's used.
>
> I discussed this internally and in fact we have a typo in the
>  NOTIFICATION_SET description that we have to fix (first bullet of
>  description should say receiver and not sender)
>
> So the implementation should check the lowest bits to be the caller ID
> for all calls except notification_set where it should check the highest b=
its.
>
> In notification_set the lowest bits are encoding the ID of the endpoint t=
o
> which a notification must be generated.
>
> Tell me if this is clearing it up :-)

Thanks for looking into this. It's clear now. I'll update the code
accordingly in the next version.

Cheers,
Jens

>
> Cheers
> Bertrand
>

