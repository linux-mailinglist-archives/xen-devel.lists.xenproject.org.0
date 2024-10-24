Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEFF9ADD7D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 09:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824962.1239148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3s8Y-0001d8-PW; Thu, 24 Oct 2024 07:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824962.1239148; Thu, 24 Oct 2024 07:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3s8Y-0001ZF-M1; Thu, 24 Oct 2024 07:20:02 +0000
Received: by outflank-mailman (input) for mailman id 824962;
 Thu, 24 Oct 2024 07:20:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3s8X-0001R0-TV
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 07:20:01 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60ccddbc-91d8-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 09:20:00 +0200 (CEST)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-288dfdaf833so378417fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 00:20:00 -0700 (PDT)
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
X-Inumbo-ID: 60ccddbc-91d8-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729754399; x=1730359199; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnNNvsuppKcrMhRZk0Kb4Fps3uqPJtWHaa/AeNk8XTk=;
        b=FucSqbdJeooFyNrkPD8eNbUU3DcuJ4cDS5IwQJxs0f78IaF8VFF6pYKZmVpd0pKf/V
         +SctxCFDOOp7UHFK9L8lYTshs8l/PXHJWOpT1bBn+MDgMYCxY5gSTOdW1RMxIjMFK79c
         Z8LMiJiIr29ym/agxX+DbxvdsUruOK1RGIu5z6M1pmqGmGKR6RiOK4x0sPlp8E6p8fPz
         vsRphBkVc9ZM9D2mvRwgz+x7rG8KhSnQ3h53J/cefbZ6gspCvvzbmJ6mtX101WVRilvh
         cp7uYuuQxlcFfCeE6drGysLXQ+4SeUy69e1QVoNC+SljqGq9xHJ8sypyofAjjBUn6AGJ
         FzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729754399; x=1730359199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnNNvsuppKcrMhRZk0Kb4Fps3uqPJtWHaa/AeNk8XTk=;
        b=xJu1pJwb+5WmTjDTCn32K2aybCT0xeqeY9m1bG5vXFXvq9S/cNo3SdPOBV3mQncLTt
         2hgLrfYLBHnkshvLxQWeURftKVMxQXpsTpkO82B9AF9mA393h9iS9osz9JdV7iu91kO4
         h8Wefrs1sgoqO/lFwpUkwUkFMlFCm4J1nkFKVZqBVO/RfKcYoDtxH1TUDkdU5U6VJ1mF
         ITQco/fwOc2dtCDgLJbDFT8vpppxXyiF/HEcMUAkMnY0qWk7ar3mYLAeqiSXkw+qKm2r
         WFxzsKgcfab4cuuQjWi8byL8qryyNWHQc9Kj2h8vlUQX89D0vLhxmawUT8K9EnoDaK83
         yh1w==
X-Gm-Message-State: AOJu0YwOnDssQrPTsbmhFeNs/aeEndIiVSeh7Wfqk6UNhQAm+RdG0vo1
	uTwsFMQLCwEEX/ctk95Th3/moU8Eg4hiAd02SCAQ/GP8CPYJp9TFcpxuBpdtsl2T4OVoXU1UIKV
	I5mbkh9S+kKe4nm6aXIdPGpPt8ZJNOtis8sOFrA==
X-Google-Smtp-Source: AGHT+IEHU+wApZCOzY9rLjf+aXX4Dm0JrXCwL2ve4XknIwLyf6CZl5lA8Z/qkWvWXVlf9NAvqpYwNTfyWr+pNhAQyRY=
X-Received: by 2002:a05:6870:c154:b0:270:205a:4070 with SMTP id
 586e51a60fabf-28ced2988f8mr991967fac.14.1729754398877; Thu, 24 Oct 2024
 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <480245789e126e5ee0d6d21b5946cdf2efb873ea.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <480245789e126e5ee0d6d21b5946cdf2efb873ea.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 09:19:47 +0200
Message-ID: <CAHUa44HRA+1e8nZQ-Xq3kP9qhTh1Ytk_nLtRqNDUnkvrVcuWnQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] xen/arm: ffa: move message function into ffa_msg.c
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Move the direct message handling function in its own source file and
> rename it to have a ffa_ prefix.
> This is a preparation to add support for indirect messages which will
> go into this newly created source file.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/Makefile      |  1 +
>  xen/arch/arm/tee/ffa.c         | 69 +----------------------------
>  xen/arch/arm/tee/ffa_msg.c     | 80 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_private.h |  2 +
>  4 files changed, 84 insertions(+), 68 deletions(-)
>  create mode 100644 xen/arch/arm/tee/ffa_msg.c

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index 7c0f46f7f446..0848c833fec3 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -3,5 +3,6 @@ obj-$(CONFIG_FFA) +=3D ffa_shm.o
>  obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
>  obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
>  obj-$(CONFIG_FFA) +=3D ffa_notif.o
> +obj-$(CONFIG_FFA) +=3D ffa_msg.o
>  obj-y +=3D tee.o
>  obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 40ea5398fa21..72826b49d2aa 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -167,73 +167,6 @@ static void handle_version(struct cpu_user_regs *reg=
s)
>      ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
>  }
>
> -static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint3=
2_t fid)
> -{
> -    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> -    struct arm_smccc_1_2_regs resp =3D { };
> -    struct domain *d =3D current->domain;
> -    uint32_t src_dst;
> -    uint64_t mask;
> -
> -    if ( smccc_is_conv_64(fid) )
> -        mask =3D GENMASK_ULL(63, 0);
> -    else
> -        mask =3D GENMASK_ULL(31, 0);
> -
> -    if ( !ffa_fw_supports_fid(fid) )
> -    {
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> -        goto out;
> -    }
> -
> -    src_dst =3D get_user_reg(regs, 1);
> -    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> -    {
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
> -
> -    /* we do not support direct messages to VMs */
> -    if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
> -    {
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> -        goto out;
> -    }
> -
> -    arg.a1 =3D src_dst;
> -    arg.a2 =3D get_user_reg(regs, 2) & mask;
> -    arg.a3 =3D get_user_reg(regs, 3) & mask;
> -    arg.a4 =3D get_user_reg(regs, 4) & mask;
> -    arg.a5 =3D get_user_reg(regs, 5) & mask;
> -    arg.a6 =3D get_user_reg(regs, 6) & mask;
> -    arg.a7 =3D get_user_reg(regs, 7) & mask;
> -
> -    arm_smccc_1_2_smc(&arg, &resp);
> -    switch ( resp.a0 )
> -    {
> -    case FFA_ERROR:
> -    case FFA_SUCCESS_32:
> -    case FFA_SUCCESS_64:
> -    case FFA_MSG_SEND_DIRECT_RESP_32:
> -    case FFA_MSG_SEND_DIRECT_RESP_64:
> -        break;
> -    default:
> -        /* Bad fid, report back to the caller. */
> -        memset(&resp, 0, sizeof(resp));
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a1 =3D src_dst;
> -        resp.a2 =3D FFA_RET_ABORTED;
> -    }
> -
> -out:
> -    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 =
& mask,
> -                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
> -                 resp.a7 & mask);
> -}
> -
>  static void handle_features(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> @@ -351,7 +284,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>          break;
>      case FFA_MSG_SEND_DIRECT_REQ_32:
>      case FFA_MSG_SEND_DIRECT_REQ_64:
> -        handle_msg_send_direct_req(regs, fid);
> +        ffa_handle_msg_send_direct_req(regs, fid);
>          return true;
>      case FFA_MEM_SHARE_32:
>      case FFA_MEM_SHARE_64:
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> new file mode 100644
> index 000000000000..ae263e54890e
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    struct arm_smccc_1_2_regs resp =3D { };
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +
> +    if ( smccc_is_conv_64(fid) )
> +        mask =3D GENMASK_ULL(63, 0);
> +    else
> +        mask =3D GENMASK_ULL(31, 0);
> +
> +    if ( !ffa_fw_supports_fid(fid) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    src_dst =3D get_user_reg(regs, 1);
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* we do not support direct messages to VMs */
> +    if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    arg.a1 =3D src_dst;
> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +    case FFA_MSG_SEND_DIRECT_RESP_32:
> +    case FFA_MSG_SEND_DIRECT_RESP_64:
> +        break;
> +    default:
> +        /* Bad fid, report back to the caller. */
> +        memset(&resp, 0, sizeof(resp));
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a1 =3D src_dst;
> +        resp.a2 =3D FFA_RET_ABORTED;
> +    }
> +
> +out:
> +    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 =
& mask,
> +                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
> +                 resp.a7 & mask);
> +}
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 9adfe687c3c9..02162e0ee4c7 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -360,6 +360,8 @@ void ffa_handle_notification_info_get(struct cpu_user=
_regs *regs);
>  void ffa_handle_notification_get(struct cpu_user_regs *regs);
>  int ffa_handle_notification_set(struct cpu_user_regs *regs);
>
> +void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
> +
>  static inline uint16_t ffa_get_vm_id(const struct domain *d)
>  {
>      /* +1 since 0 is reserved for the hypervisor in FF-A */
> --
> 2.47.0
>

