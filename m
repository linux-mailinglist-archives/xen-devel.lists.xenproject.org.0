Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02ACB0651
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181865.1504846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzaX-0000j6-3A; Tue, 09 Dec 2025 15:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181865.1504846; Tue, 09 Dec 2025 15:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzaX-0000hP-09; Tue, 09 Dec 2025 15:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1181865;
 Tue, 09 Dec 2025 15:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSzaV-0000hJ-HN
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:25:15 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41d0778a-d513-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:25:14 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-450b3f60c31so2591465b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 07:25:14 -0800 (PST)
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
X-Inumbo-ID: 41d0778a-d513-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765293913; x=1765898713; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px9k85v8oJRTGCidCYR/pxO2mba+FuoRZ1VGFVhqnjs=;
        b=wxYmzTGyTevA/LFi1sovdYxqnDXQ7QrO6iHhBkJpKIYRrAM1QtFwLFEr7vAUALUSUD
         4BIpcUZDjJ21fKLO+IEUKKpuUQHk9rMLObxOXTMrYtqCjZlumTz0aYnkBHGgZVxF6nFk
         R6l3FHBl8RO+pAjuYIdYaBCcCKeVqGYJ4Od8/c6E8BBEHtDZpN7TbfNmhTQqhv9jltIg
         12oS2pbC4/VWLkEjaprAD0s0yzyhNnvsj2iIG/rR7xP817fruKQJa5/6kmvPlGhWhD6q
         4khjT4/kabM2ZA1HsowL3mHGdHY3go/8BnyWSZcHTCUK7Gj1lJ30hEJNlqAasG2+Iv6Y
         DJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293913; x=1765898713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=px9k85v8oJRTGCidCYR/pxO2mba+FuoRZ1VGFVhqnjs=;
        b=fOAIRgYjIzjZFRgqmdrFo9sqdsF7QLdH428RiFge9fRyc04xNtjRxaYvUZAke/kMZW
         jCHF7EzI47ofSy34T721zp4V75heWIXsr8Ze7q6+7YyvBnL5TyTJGAh85akowizx5b8M
         1U8iBqirrgieaDzLePPWtYidkEuUCIMNuu2nszR/uzMNBxRZd+ggi+L5tC+Vkl9yphdM
         norXq0gGGeDe2s52dlz1xbldUObKMQMHwm2yNPi2uVzzirm4MRhM9Mf2EnsJmfe6q5YF
         vwlqK6ok11qFSenQN9VNMn0Md0JTPdl3givnv60mNC21+of0wo+IyHgZV+CWXenof66j
         +9Yw==
X-Gm-Message-State: AOJu0YyJkc7RgJnbM+3JYQhX7iP6eJJPIgUdGMLRlZ1U0dFyUIGwKWjN
	W6aYbVraP9LTmaRLSaIZ7ZBnnSPh9Cfx88CHNvMlcFx0V45gKWF/gkII7X/VaiULWbNw7OgbiIO
	EOrRsahgaUKXxUFlDpmzj7B5V+j/6lMN+9a6vhWhDZw==
X-Gm-Gg: ASbGncvYW+Ul6gGJA78/GJ2lNNimJ+HkeJbMmlDc1nqNpi6MuHRAq5zqMNsqZB6DK3w
	Yrplwg0XIbpZUrWEniA/aGnNjxRcdo3YsbGjV0LKxIj44RinZ0T6+s7ZWCk4DeZRfG5XauQdF/g
	tKyKvRGIbvhKC1gOky8LEhRdI0mte0XnUJBRunIukFMmSp4QGOAIwes/YR8J0pvDh3ZYX0HMSJ5
	9uaDLOR3k5CVfHSE+w1cQOjcZBreJIJoS90JDjz9zGcVRaWWD4Bmnrf005N7c2kQrN5XqCyf6K6
	1bAgiDeVJwTSQFtfzYTylxh9G4c3UM0XvB/4QajYWAlMLJF6AXIG38saEUZUpg==
X-Google-Smtp-Source: AGHT+IHlzgzyYPqo7sOs2PJmW1GMZ+FSO4vkkNGOiTT6Dgdxy2ffgddUtkkpa6WmfdMHRuGqpd5fr7ytaKzBvYoj/yE=
X-Received: by 2002:a05:6808:1507:b0:450:4a53:54d4 with SMTP id
 5614622812f47-4539df814admr4951024b6e.25.1765293912760; Tue, 09 Dec 2025
 07:25:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <8412f616340976de6aa5f7da585cdc3dfd919732.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <8412f616340976de6aa5f7da585cdc3dfd919732.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 16:25:01 +0100
X-Gm-Features: AQt7F2qmmqcj0G2BeaIRMJETyQttFjPk0jUpMMHtyc--gR_zFjo-RFHa3_Qb5GE
Message-ID: <CAHUa44HqFfA=NzXYwRDnDoV9m2FVDh5PS5tTS+9dyL7uQLUEtg@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] xen/arm: ffa: advertise FF-A v1.2
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Expose the RX/TX MAP capacity field only once a guest has
> negotiated FF-A v1.2.
>
> While there, drop the stale <asm/tee/ffa.h> include.
>
> To comply with the wider v1.2 register ABI, zero registers x8=E2=80=93x17=
 when
> responding to a v1.2 VM. The dispatcher also rejects SMCCC64 calls from
> AArch32 guests.
>
> Finally, bump Xen's FF-A version to 1.2.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - Remove advertising of YIELD/INTERRUPT/RUN which has now moved to patch
>   adding FFA_RUN support and adapt commit message
> - Use ACCESS_ONCE to read guest_vers
> - Use is_64bit_domain instead of ctx->is_64bit
> ---
>  xen/arch/arm/tee/ffa.c         | 19 +++++++++++++++++--
>  xen/arch/arm/tee/ffa_private.h | 29 ++++++++++++++++++++---------
>  2 files changed, 37 insertions(+), 11 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 2c6443a7f6a4..ed18e76080d0 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -65,7 +65,6 @@
>  #include <asm/event.h>
>  #include <asm/regs.h>
>  #include <asm/smccc.h>
> -#include <asm/tee/ffa.h>
>  #include <asm/tee/tee.h>
>
>  #include "ffa_private.h"
> @@ -296,7 +295,16 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>           * differs from FFA_PAGE_SIZE (SZ_4K).
>           */
>          BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
> -        ffa_set_regs_success(regs, 0, 0);
> +
> +        /*
> +         * From FFA v1.2, we can give the maximum number of pages we sup=
port
> +         * for the RX/TX buffers.
> +         */
> +        if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_success(regs, FFA_MAX_RXTX_PAGE_COUNT << 16, 0)=
;
> +
>          break;
>      case FFA_FEATURE_NOTIF_PEND_INTR:
>          ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> @@ -329,6 +337,13 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>      if ( !ctx )
>          return false;
>
> +    if ( !is_64bit_domain(d) && smccc_is_conv_64(fid) )
> +    {
> +        /* 32bit guests should only use 32bit convention calls */
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return true;
> +    }
> +
>      /* A version must be negotiated first */
>      if ( !ACCESS_ONCE(ctx->guest_vers) )
>      {
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 030e6724743c..1b5aebd6ef6b 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -53,7 +53,7 @@
>   * that particular guest or SP.
>   */
>  #define FFA_MY_VERSION_MAJOR    1U
> -#define FFA_MY_VERSION_MINOR    1U
> +#define FFA_MY_VERSION_MINOR    2U
>  #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                   FFA_MY_VERSION_MINOR)
>
> @@ -518,14 +518,25 @@ static inline void ffa_set_regs(struct cpu_user_reg=
s *regs, register_t v0,
>                                  register_t v4, register_t v5, register_t=
 v6,
>                                  register_t v7)
>  {
> -        set_user_reg(regs, 0, v0);
> -        set_user_reg(regs, 1, v1);
> -        set_user_reg(regs, 2, v2);
> -        set_user_reg(regs, 3, v3);
> -        set_user_reg(regs, 4, v4);
> -        set_user_reg(regs, 5, v5);
> -        set_user_reg(regs, 6, v6);
> -        set_user_reg(regs, 7, v7);
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int i;
> +
> +    set_user_reg(regs, 0, v0);
> +    set_user_reg(regs, 1, v1);
> +    set_user_reg(regs, 2, v2);
> +    set_user_reg(regs, 3, v3);
> +    set_user_reg(regs, 4, v4);
> +    set_user_reg(regs, 5, v5);
> +    set_user_reg(regs, 6, v6);
> +    set_user_reg(regs, 7, v7);
> +
> +    if ( ctx && ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 &&
> +         is_64bit_domain(d) )
> +    {
> +        for (i =3D 8; i <=3D 17; i++)
> +            set_user_reg(regs, i, 0);
> +    }
>  }
>
>  static inline void ffa_set_regs_error(struct cpu_user_regs *regs,
> --
> 2.51.2
>

