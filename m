Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD7CA2BA9
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 09:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177335.1501652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR4G2-0004zv-Ul; Thu, 04 Dec 2025 08:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177335.1501652; Thu, 04 Dec 2025 08:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR4G2-0004wo-QT; Thu, 04 Dec 2025 08:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1177335;
 Thu, 04 Dec 2025 08:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYDh=6K=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vR4G2-0004wh-4Y
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 08:00:10 +0000
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [2607:f8b0:4864:20::c34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d582bb3-d0e7-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 09:00:04 +0100 (CET)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6593155d8d6so409173eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 00:00:04 -0800 (PST)
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
X-Inumbo-ID: 3d582bb3-d0e7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764835203; x=1765440003; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEZT8oDY+g//HBWaISlgQDtla/8UQbqNj7CzYcbpSEw=;
        b=hd0PTrbmq2CzOgFnCVKc4kvX8IWuKOfPXdeCODJRRxfEqJ3+tkXxuETqiCf3Aal2S6
         H8CJmhfSIa3TjCh2+SygEbSAbYVrQJgT9UUGOgmWG5BPRYdVDKjQGpgjh3r96mN6DNGU
         y2vr4jWXA4N6gkrzIWv6CEmXmdn3JlnDboDHTohkQSnKLzSEKNuawDs8YY2a8ki44d4e
         BBH+c/DUzJaPzvJ8ApETIld5DBEnKZJ9l9ni9m0JESBbrYRO+P2iFeqvXPJjUJth7WGU
         RDB3fVRvtfAaWkG/YJBFZ2JPS2y86skBHYKHBdm63AilJx3NQrBt2NkK4Ww8BbYYA4jd
         vlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835203; x=1765440003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mEZT8oDY+g//HBWaISlgQDtla/8UQbqNj7CzYcbpSEw=;
        b=ZbV7lWmEL9+csxGZCgiobdrtxqsyHOFkDRXBo+HYUIBIqAr+ggv31UbLhzZHRRpV9N
         gjimAS2bukKd2j2AzZwD8V7NfRrlfmCiBzHmgxpruwIVfbpCcL5QTiYphO4pt+5DKVOr
         C8G2nBmwDao4caCuTA3vkNlIz4Agt1rzN8mlRN5hyrN2hx14xlgqLvH0zUAaW4/iA+Wv
         58hD4OkTrwXMr2moIju7LJ4x9LVYEh3sVCQqGbl54f5BfmR73g9J2yMBUPJznDauZ5ci
         e+9JAE4QC2oJIX+mB8p/6Rm0CUMm+pM8oQWUvveRPHlhOcRoo3ZWwRgUTz1TJVrzJ1jK
         wK1g==
X-Gm-Message-State: AOJu0YzxFuDDnUkN6uEPp+2cplxglQLB0bcHDbdm2Vtt/T6bc4Lika3v
	4qAHAsSZqqbn3o1GhAgcMU5t4yGS0fRGzU0UL3dynJPCgsRvdpaLMcgXrSUWbAauAWWf2vAjS6r
	SihXS/hLMI0185FUwnLNKMMK59+AU52TiCHgeeFGUVw==
X-Gm-Gg: ASbGncu/LycLPIXVNRJhWzxFBkpHye8JFbo0Hqq6N4XfOJkyD4KNjFm2RxVRjpRvUTN
	PObThXhRJEsZeZYanQl6U3yUeJapIJEvt3aZtn64cRxhnWjgy5jokiiDOaeMO3MJe8Lw9Y3hzA5
	a4jGfHQASyRRqvyir3DkKgJqoo0/+9ndxqncHZSrDg8vDr9I/yQUu7gy40OdntPUcFXJ3bAMnDr
	VU7T+9L4Ez2++oVe6ZzILR9bwyz0RMdM7bnT/mxMVSkHeSrt7kOq25oZuYu4qrydTnnEj52pkXF
	Twa8Eh5XJOSvRd3vwVn/eDGUbw==
X-Google-Smtp-Source: AGHT+IF6ruQ/S6Y9qXsuAdE2p8oILBkUN9zkuVftLDEKLAPHgtCiXNYZDfH3/Q69ArCm9nwou3vjgHTHDgoG0YIf9Cg=
X-Received: by 2002:a05:6820:4c15:b0:657:4e49:83b7 with SMTP id
 006d021491bc7-6597264c99fmr2361760eaf.1.1764835202227; Thu, 04 Dec 2025
 00:00:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <8ae9b12641301ecfafa7ddee3e60544d3fa45c40.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <8ae9b12641301ecfafa7ddee3e60544d3fa45c40.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 4 Dec 2025 08:59:50 +0100
X-Gm-Features: AWmQ_bkH_dF57ccRxbXOifrAVEBEur-7g512rf2OyonCHqjveaSE02L7p3BkAEM
Message-ID: <CAHUa44ERxthL+pfXnLVZqfOmqvK747owroouv6uqHfTw+=QCkw@mail.gmail.com>
Subject: Re: [PATCH 10/10] xen/arm: ffa: advertise FF-A v1.2
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:53=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Advertise RUN/YIELD/INTERRUPT via FFA_FEATURES now that the runtime
> helpers are in place, and expose the RX/TX MAP capacity field only once
> a guest has negotiated FF-A v1.2.
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
>  xen/arch/arm/tee/ffa.c         | 25 ++++++++++++++++++++-----
>  xen/arch/arm/tee/ffa_private.h | 28 +++++++++++++++++++---------
>  2 files changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 8b2f042287fc..c8fe97856d06 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -24,9 +24,6 @@
>   * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownersh=
ip
>   *   or access of a memory region
>   * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
> - * o FFA_MSG_YIELD
> - * o FFA_INTERRUPT - Used to report preemption
> - * o FFA_RUN
>   *
>   * Limitations in the implemented FF-A interfaces:
>   * o FFA_RXTX_MAP_*:
> @@ -68,7 +65,6 @@
>  #include <asm/event.h>
>  #include <asm/regs.h>
>  #include <asm/smccc.h>
> -#include <asm/tee/ffa.h>
>  #include <asm/tee/tee.h>
>
>  #include "ffa_private.h"
> @@ -262,6 +258,9 @@ static void handle_features(struct cpu_user_regs *reg=
s)
>      case FFA_MSG_SEND_DIRECT_REQ_32:
>      case FFA_MSG_SEND_DIRECT_REQ_64:
>      case FFA_MSG_SEND2:
> +    case FFA_RUN:
> +    case FFA_INTERRUPT:
> +    case FFA_MSG_YIELD:
>          ffa_set_regs_success(regs, 0, 0);
>          break;
>      case FFA_MSG_SEND_DIRECT_REQ2:
> @@ -290,7 +289,16 @@ static void handle_features(struct cpu_user_regs *re=
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
> +        if ( ctx->guest_vers < FFA_VERSION_1_2 )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_success(regs, FFA_MAX_RXTX_PAGE_COUNT << 16, 0)=
;
> +
>          break;
>      case FFA_FEATURE_NOTIF_PEND_INTR:
>          ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> @@ -323,6 +331,13 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>      if ( !ctx )
>          return false;
>
> +    if ( !is_64bit_domain(d) && smccc_is_conv_64(fid) )

You use ctx->is_64bit in ffa_set_regs() below, but here
is_64bit_domain(d). Which one do we prefer?

Cheers,
Jens

> +    {
> +        /* 32bit guests should only use 32bit convention calls */
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return true;
> +    }
> +
>      /* A version must be negotiated first */
>      if ( !ctx->guest_vers_negotiated )
>      {
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index a9a03c7c5d71..6afca2ea07ef 100644
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
> @@ -505,14 +505,24 @@ static inline void ffa_set_regs(struct cpu_user_reg=
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
> +    if ( ctx && ctx->guest_vers >=3D FFA_VERSION_1_2 && ctx->is_64bit )
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

