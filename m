Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F19E6868
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 09:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849909.1264404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTJH-0003af-Ky; Fri, 06 Dec 2024 08:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849909.1264404; Fri, 06 Dec 2024 08:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJTJH-0003YK-IK; Fri, 06 Dec 2024 08:03:35 +0000
Received: by outflank-mailman (input) for mailman id 849909;
 Fri, 06 Dec 2024 08:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQh0=S7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tJTJG-0003YE-6G
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 08:03:34 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9230b1c9-b3a8-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 09:03:26 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-29e579b9e9aso1206089fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2024 00:03:32 -0800 (PST)
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
X-Inumbo-ID: 9230b1c9-b3a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733472211; x=1734077011; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9WuLxGnWqMHLUGy8xvZb0nPWni3GmQT6rbbqKA64U4=;
        b=um4u6IW8ByoP7nQL7M/Q5ouK7EqHFVUdEFPCN5q807RKOSzmssMqOFKktDQy6GBQEa
         6PoQheYZb8Fcdjsrrr3jghKoGNnHexwHiOedWjzxbObiI9RQ9VqvcIJDL6+HAz9p4cRQ
         GpsJtXlyw22wzlxsZ2gPNg37dhdpeli3uXiA2xy9Nd1SNHS24wYRiZuqV4q5AXAopm82
         aZMOq+WCabO65KoN3pJPcyfjYOqP8KT9fofodRYM44K6yP9Hyl+u2tSP+0JhmsxelDmQ
         u7vGD4u76hsKMwvk5Xz0zUpL7GUDnCjQP/ofTbc000hRjKT7kdCDvrAsIx4Z6FUcspg+
         Jiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733472211; x=1734077011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9WuLxGnWqMHLUGy8xvZb0nPWni3GmQT6rbbqKA64U4=;
        b=djicUkPrzvbUYBzyZ2ncf9INLpyDTYq7JNG+JaNklS+dq2ctIJEDrabXgILahuTm1U
         BpZJXyhl8f4hcNp5a5ogsni7I3f7VCdkT7HjCNuC8jIUera4i7j0IQtVES1/i8p12OvS
         Ppzmy2HalsW4vjrAPpRuCYhUfdoOA1UXzbeNxEXcfAVMtNkcoh2wnNX0KrFr3rW9GaPf
         iNRX9tf0rzDu8/tt+7sUtAiBc/el7qeo0gynJlzdV5Afhr4BLHzD2WQWPQ+kEdE5SMLy
         tBX/99TtAy+jULAyP6JxxFGc8SPocPMl4uaPBpW/FgB0X4U57/dLhkv5fFPSlPg3wuid
         LaVg==
X-Gm-Message-State: AOJu0YwUD2Zw0rG6okNLvNHsI3yvaC4DgZY/e5NzMajh0pAeQXLsE/3n
	PC2a0na1hf1rabKjG1NDePSJKeTRRxRyi50Ba0sFMpo0X1G97nJz5u2qk3cs/86iaT4JTqjUZ1z
	68PbkYu0B47XRWk0cqp6Fp0mG3I4mrP8TJ3j48A==
X-Gm-Gg: ASbGncv8hTfDEBP9Okc2rX2EGTDwsbkO6fDPd80agvi9gFyz3DpRP+N6q8ijdocQF+y
	5AloN0EHEhTUl83qV3YQKFSsLw55Riy4=
X-Google-Smtp-Source: AGHT+IEgHiObddcPtWJDCxFRQKMn4ZhJ25QMJAGBycxoGu2L94bXA4h7XwT+vwq4XzbGk+lUkklJCItE1LvtnXjx4vA=
X-Received: by 2002:a05:6870:e97:b0:29e:5897:e9ed with SMTP id
 586e51a60fabf-29f7355f123mr2193325fac.35.1733472210972; Fri, 06 Dec 2024
 00:03:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732702210.git.bertrand.marquis@arm.com> <8e7cf913eeba955f8ed6bced1cafdf264dcb4318.1732702210.git.bertrand.marquis@arm.com>
In-Reply-To: <8e7cf913eeba955f8ed6bced1cafdf264dcb4318.1732702210.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 6 Dec 2024 09:03:19 +0100
Message-ID: <CAHUa44GkZh5YC6wD2ac5w9Sk63EsQjryfaH5faHjwKZKF_H80g@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] xen/arm: ffa: Remove per VM notif_enabled
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Nov 27, 2024 at 5:08=E2=80=AFPM Bertrand Marquis
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
> Changes in v3:
> - Add a comment explaining why it is ok to call bitmap destroy even if
>   bitmap create failed.
> Changes in v2:
> - rebase
> ---
>  xen/arch/arm/tee/ffa.c         | 17 +++--------------
>  xen/arch/arm/tee/ffa_notif.c   | 14 +++++---------
>  xen/arch/arm/tee/ffa_private.h |  2 --
>  3 files changed, 8 insertions(+), 25 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 8488fe6af9c0..04d2403415fe 100644
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
> index 4b3e46318f4b..21b9e78f6399 100644
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
> @@ -415,18 +414,15 @@ int ffa_notif_domain_init(struct domain *d)
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
> +    /*
> +     * Call bitmap_destroy even if bitmap create failed as the SPMC will
> +     * return a DENIED error that we will ignore.
> +     */
> +    if ( notif_enabled )
>          ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
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

