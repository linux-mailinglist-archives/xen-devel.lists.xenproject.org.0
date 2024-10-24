Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00AD9ADDE8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 09:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824973.1239159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3sT6-0005Cd-Gx; Thu, 24 Oct 2024 07:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824973.1239159; Thu, 24 Oct 2024 07:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3sT6-0005AZ-Dt; Thu, 24 Oct 2024 07:41:16 +0000
Received: by outflank-mailman (input) for mailman id 824973;
 Thu, 24 Oct 2024 07:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3sT5-0005AT-BJ
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 07:41:15 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5822b2d8-91db-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 09:41:14 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ebc05007daso316952eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 00:41:14 -0700 (PDT)
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
X-Inumbo-ID: 5822b2d8-91db-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729755673; x=1730360473; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTrkY3A15zDXnu3stRPPm+suRoYJsAdR2j9uXgLP8SM=;
        b=Gq0asSfslfV5fAUvM5s/Nz6Vqt5rbFqbm6V0hiJ1c0pxg8Ozf7mui9ptJNAGv33N5x
         rHzp5PZ9Usa289VFb7iWVzoQY+7Vhv/tmW6x/o92M8qc5nXiHCC4VzSZy0vYpzHzCWFI
         8x/Is9Za5JzqT290jWQLTBUCiY1rnkItBg5jXPH1lreyHcX5coqge2SBIvo0qWMjH2++
         kfanyY6op/ZPhdUmfSCs1d2khXWAL0255Z7ljZs4Rrp3JsTcfUwNuYkXSikjjU8cQRfo
         4OK+LT++TzzGXOcTqpwwWipRmLu8DNb/yhw3SoQ03ZbnU7qengcuLGomnpNO8RE0mFlb
         Z6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729755673; x=1730360473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTrkY3A15zDXnu3stRPPm+suRoYJsAdR2j9uXgLP8SM=;
        b=e3JCx93bZENh+7pTi6mups9NwsIruvuHoaUEw/rkolNutkTRRyJYzIzeyQmo4boipj
         UD4+xF5gLTr4LQ/jLZTk2QVVTlYhjKOM3uSsQOsQuNdfgMZo80R5piCRHyBQLgXYmE6s
         2T4jJyd6B7ZXmjL4yL/vGiOh5b85IYfUzClpPVC9QMn1bIsWcG0Dn+5pF0JKXQdWKKzr
         D9AHLc0/B0JKre8frjThhVH8JNujsmhT+4g/UojeG+VFctUv3OaSBFiM5KloFCcvZmMo
         OhuzhCbw4Ag9xEnLkHPXpUikCkBLxrmpQZvsoeYKIyY4ynaInsUKa5uX1RUjzeLhNuSx
         a+Sg==
X-Gm-Message-State: AOJu0YykwgJwTf1TAbI3994oyx7Xy/wsl7GJ1JqpiB4mYHvHDBLr4aLR
	1TXsQg4kiUCfO1hTvGN7DVo139XzSNq40LlfB1skg5hMKe4yEvDwu3+j6lP/eHU4BUFdu+5zTef
	WpEHACA+uoVycils9OIaFWV3IbPwVXtmyCw8jTQ==
X-Google-Smtp-Source: AGHT+IGa6Xphtw1uI64xvNs2v9me+rPJrbVI88BSSpQi30bXD048FR2jf0evEU2AXosVCU8V5gYGQrXZ2XWTUKgJCjE=
X-Received: by 2002:a05:6870:9f14:b0:27b:2e84:fedc with SMTP id
 586e51a60fabf-28ccb4f6e4dmr5944318fac.21.1729755672745; Thu, 24 Oct 2024
 00:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com> <b23ad93b876267fb48a5a398e394e60fdf52d33d.1729066788.git.bertrand.marquis@arm.com>
In-Reply-To: <b23ad93b876267fb48a5a398e394e60fdf52d33d.1729066788.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 09:41:01 +0200
Message-ID: <CAHUa44ESfSimrf6coDmurQSfuCQyytsi2gJh_kePer2p3zotug@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] xen/arm: ffa: Remove per VM notif_enabled
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
> Remove the per VM flag to store if notifications are enabled or not as
> the only case where they are not, if notifications are enabled globally,
> will make the VM creation fail.
> Also use the opportunity to always give the notifications interrupts IDs
> to VM. If the firmware does not support notifications, there won't be
> any generated and setting one will give back a NOT_SUPPORTED.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/ffa.c         | 17 +++--------------
>  xen/arch/arm/tee/ffa_notif.c   | 10 +---------
>  xen/arch/arm/tee/ffa_private.h |  2 --
>  3 files changed, 4 insertions(+), 25 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 72826b49d2aa..3a9525aa4598 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -169,8 +169,6 @@ static void handle_version(struct cpu_user_regs *regs=
)
>
>  static void handle_features(struct cpu_user_regs *regs)
>  {
> -    struct domain *d =3D current->domain;
> -    struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t a1 =3D get_user_reg(regs, 1);
>      unsigned int n;
>
> @@ -218,16 +216,10 @@ static void handle_features(struct cpu_user_regs *r=
egs)
>          ffa_set_regs_success(regs, 0, 0);
>          break;
>      case FFA_FEATURE_NOTIF_PEND_INTR:
> -        if ( ctx->notif.enabled )
> -            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> -        else
> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
>          break;
>      case FFA_FEATURE_SCHEDULE_RECV_INTR:
> -        if ( ctx->notif.enabled )
> -            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, =
0);
> -        else
> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
>          break;
>
>      case FFA_NOTIFICATION_BIND:
> @@ -236,10 +228,7 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>      case FFA_NOTIFICATION_SET:
>      case FFA_NOTIFICATION_INFO_GET_32:
>      case FFA_NOTIFICATION_INFO_GET_64:
> -        if ( ctx->notif.enabled )
> -            ffa_set_regs_success(regs, 0, 0);
> -        else
> -            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        ffa_set_regs_success(regs, 0, 0);
>          break;
>      default:
>          ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 4b3e46318f4b..3c6418e62e2b 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -405,7 +405,6 @@ void ffa_notif_init(void)
>
>  int ffa_notif_domain_init(struct domain *d)
>  {
> -    struct ffa_ctx *ctx =3D d->arch.tee;
>      int32_t res;
>
>      if ( !notif_enabled )
> @@ -415,18 +414,11 @@ int ffa_notif_domain_init(struct domain *d)
>      if ( res )
>          return -ENOMEM;
>
> -    ctx->notif.enabled =3D true;
> -
>      return 0;
>  }
>
>  void ffa_notif_domain_destroy(struct domain *d)
>  {
> -    struct ffa_ctx *ctx =3D d->arch.tee;
> -
> -    if ( ctx->notif.enabled )
> -    {
> +    if ( notif_enabled )
>          ffa_notification_bitmap_destroy(ffa_get_vm_id(d));

This call may now be done even if there hasn't been a successful call
to ffa_notification_bitmap_create().
A comment mentioning this and that it's harmless (if we can be sure it
is) would be nice.

Cheers,
Jens

> -        ctx->notif.enabled =3D false;
> -    }
>  }
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 02162e0ee4c7..973ee55be09b 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -281,8 +281,6 @@ struct ffa_mem_region {
>  };
>
>  struct ffa_ctx_notif {
> -    bool enabled;
> -
>      /*
>       * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
>       * pending global notifications.
> --
> 2.47.0
>

