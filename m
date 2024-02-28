Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E786B2EC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686703.1069052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLg7-0001Fy-MA; Wed, 28 Feb 2024 15:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686703.1069052; Wed, 28 Feb 2024 15:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLg7-0001EI-IN; Wed, 28 Feb 2024 15:17:03 +0000
Received: by outflank-mailman (input) for mailman id 686703;
 Wed, 28 Feb 2024 15:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Dg=KF=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rfLg6-0000oJ-EZ
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:17:02 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1871f3-d64c-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 16:17:00 +0100 (CET)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so4923430a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:17:00 -0800 (PST)
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
X-Inumbo-ID: 6b1871f3-d64c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709133419; x=1709738219; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrT0N1SHcSGgmq3jhOcG8IZZuotgNdCyfC2K7dJOpNk=;
        b=nqxbq6G35+CdQI0xez/hR5+yRG+o9mdHXSJy4wicNbM5CELmHTv6NomsrH7G29UGgd
         DCl3qPIX1em3UYtZ2ZJ6VsNKEiaseOjING6mUNEGzHBTEZLz5+mK1IWi3k8NR4lrTdYa
         4Cpi682W9hnoe4Ec262tc4OnFHZg9/qilXdHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709133419; x=1709738219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrT0N1SHcSGgmq3jhOcG8IZZuotgNdCyfC2K7dJOpNk=;
        b=rc5+TgHfo7NhEh6yfVEgoS0lwEqD3O4lmzPuqqkcXl+dDitdS9ngqKb0W9KFdDd6BP
         xhag0ZMiUdK3FvkJ1F29UZJXmN0lN8aD/ty/rT0k0luPiVxxNcwFz1S0TJUD8bdp6UIR
         uXy2d2H6xmyagdtQrFTE6GjQBm2ESrK0K4OFySvGvGVKdFU4FwqRuZ2FChMtEXDEnPk0
         yE69rabjeZY1SHVQU8RVk/Ua62KGIN4j1+Ga4EgY1NQZb7xwkxngSXKUBfS99zIBn5F2
         rZP4/K+AYfa9kS0Lb/VW4wk0ZLa5O0c0A1VZvzyRZVqGJa4Wkx6Z/QHSQ3UFFh0qO7Y3
         0Ktw==
X-Gm-Message-State: AOJu0YwLgSyk8fXWk+A7MbgpeCcO3v3iAnesqEzZyDj5wWybTX+/LVpA
	O6HJ/RDOeakfuyT59/2ffMOagQvHVAnHn/f55yKpnxZNUMp65IJDSpOFl8VqRNbP9OvWS+NTcZ4
	e+bb21wSUdMC4jlvVg00xH0y+rWy1T/CodRCK
X-Google-Smtp-Source: AGHT+IFWwzl+hBfPN29ObMt6zGcgwWDtn6WAz+7As9vgfjg+YYO+YhyaefJ/G+eTUsAwRJ2/BgaUlTJAMX1U+fbMKUw=
X-Received: by 2002:a17:90a:eb12:b0:29a:c6fa:4223 with SMTP id
 j18-20020a17090aeb1200b0029ac6fa4223mr8198560pjz.43.1709133419060; Wed, 28
 Feb 2024 07:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20240227112528.4540-1-roger.pau@citrix.com> <20240227112528.4540-4-roger.pau@citrix.com>
In-Reply-To: <20240227112528.4540-4-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 28 Feb 2024 15:16:48 +0000
Message-ID: <CAG7k0ErUtQGJ0X9gxib9jH3hpksJ4X8R1Hy5+ANzYYB=Vo2+CQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] xen/livepatch: fix norevert test attempt to
 open-code revert
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:25=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> The purpose of the norevert test is to install a dummy handler that repla=
ces
> the internal Xen revert code, and then perform the revert in the post-rev=
ert
> hook.  For that purpose the usage of the previous common_livepatch_revert=
() is
> not enough, as that just reverts specific functions, but not the whole st=
ate of
> the payload.
>
> Remove both common_livepatch_{apply,revert}() and instead expose
> revert_payload{,_tail}() in order to perform the patch revert from the
> post-revert hook.
>
> Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state =
tracking marker')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Check return value of revert_payload().
> ---
>  xen/common/livepatch.c                        | 41 +++++++++++++++++--
>  xen/include/xen/livepatch.h                   | 32 ++-------------
>  .../livepatch/xen_action_hooks_norevert.c     | 22 +++-------
>  3 files changed, 46 insertions(+), 49 deletions(-)
>
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 14295bae8704..5a7d5b7be0ad 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1366,7 +1366,22 @@ static int apply_payload(struct payload *data)
>      ASSERT(!local_irq_is_enabled());
>
>      for ( i =3D 0; i < data->nfuncs; i++ )
> -        common_livepatch_apply(&data->funcs[i], &data->fstate[i]);
> +    {
> +        const struct livepatch_func *func =3D &data->funcs[i];
> +        struct livepatch_fstate *state =3D &data->fstate[i];
> +
> +        /* If the action has been already executed on this function, do =
nothing. */
> +        if ( state->applied =3D=3D LIVEPATCH_FUNC_APPLIED )
> +        {
> +            printk(XENLOG_WARNING LIVEPATCH
> +                   "%s: %s has been already applied before\n",
> +                   __func__, func->name);
> +            continue;
> +        }
> +
> +        arch_livepatch_apply(func, state);
> +        state->applied =3D LIVEPATCH_FUNC_APPLIED;
> +    }
>
>      arch_livepatch_revive();
>
> @@ -1382,7 +1397,7 @@ static inline void apply_payload_tail(struct payloa=
d *data)
>      data->state =3D LIVEPATCH_STATE_APPLIED;
>  }
>
> -static int revert_payload(struct payload *data)
> +int revert_payload(struct payload *data)
>  {
>      unsigned int i;
>      int rc;
> @@ -1397,7 +1412,25 @@ static int revert_payload(struct payload *data)
>      }
>
>      for ( i =3D 0; i < data->nfuncs; i++ )
> -        common_livepatch_revert(&data->funcs[i], &data->fstate[i]);
> +    {
> +        const struct livepatch_func *func =3D &data->funcs[i];
> +        struct livepatch_fstate *state =3D &data->fstate[i];
> +
> +        /*
> +         * If the apply action hasn't been executed on this function, do
> +         * nothing.
> +         */
> +        if ( !func->old_addr || state->applied =3D=3D LIVEPATCH_FUNC_NOT=
_APPLIED )
> +        {
> +            printk(XENLOG_WARNING LIVEPATCH
> +                   "%s: %s has not been applied before\n",
> +                   __func__, func->name);
> +            continue;
> +        }
> +
> +        arch_livepatch_revert(func, state);
> +        state->applied =3D LIVEPATCH_FUNC_NOT_APPLIED;
> +    }
>
>      /*
>       * Since we are running with IRQs disabled and the hooks may call co=
mmon
> @@ -1415,7 +1448,7 @@ static int revert_payload(struct payload *data)
>      return 0;
>  }
>
> -static inline void revert_payload_tail(struct payload *data)
> +void revert_payload_tail(struct payload *data)
>  {
>      list_del(&data->applied_list);
>
> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index ad0eae28bd0d..d074a5bebecc 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -138,35 +138,11 @@ void arch_livepatch_post_action(void);
>  void arch_livepatch_mask(void);
>  void arch_livepatch_unmask(void);
>
> -static inline void common_livepatch_apply(const struct livepatch_func *f=
unc,
> -                                          struct livepatch_fstate *state=
)
> -{
> -    /* If the action has been already executed on this function, do noth=
ing. */
> -    if ( state->applied =3D=3D LIVEPATCH_FUNC_APPLIED )
> -    {
> -        printk(XENLOG_WARNING LIVEPATCH "%s: %s has been already applied=
 before\n",
> -                __func__, func->name);
> -        return;
> -    }
> -
> -    arch_livepatch_apply(func, state);
> -    state->applied =3D LIVEPATCH_FUNC_APPLIED;
> -}
> +/* Only for testing purposes. */
> +struct payload;
> +int revert_payload(struct payload *data);
> +void revert_payload_tail(struct payload *data);
>
> -static inline void common_livepatch_revert(const struct livepatch_func *=
func,
> -                                           struct livepatch_fstate *stat=
e)
> -{
> -    /* If the apply action hasn't been executed on this function, do not=
hing. */
> -    if ( !func->old_addr || state->applied =3D=3D LIVEPATCH_FUNC_NOT_APP=
LIED )
> -    {
> -        printk(XENLOG_WARNING LIVEPATCH "%s: %s has not been applied bef=
ore\n",
> -                __func__, func->name);
> -        return;
> -    }
> -
> -    arch_livepatch_revert(func, state);
> -    state->applied =3D LIVEPATCH_FUNC_NOT_APPLIED;
> -}
>  #else
>
>  /*
> diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/li=
vepatch/xen_action_hooks_norevert.c
> index c17385519263..c5fbab174680 100644
> --- a/xen/test/livepatch/xen_action_hooks_norevert.c
> +++ b/xen/test/livepatch/xen_action_hooks_norevert.c
> @@ -96,26 +96,14 @@ static int revert_hook(livepatch_payload_t *payload)
>
>  static void post_revert_hook(livepatch_payload_t *payload)
>  {
> -    int i;
> +    unsigned long flags;
>
>      printk(KERN_DEBUG "%s: Hook starting.\n", __func__);
>
> -    for (i =3D 0; i < payload->nfuncs; i++)
> -    {
> -        const struct livepatch_func *func =3D &payload->funcs[i];
> -        struct livepatch_fstate *fstate =3D &payload->fstate[i];
> -
> -        BUG_ON(revert_cnt !=3D 1);
> -        BUG_ON(fstate->applied !=3D LIVEPATCH_FUNC_APPLIED);
> -
> -        /* Outside of quiesce zone: MAY TRIGGER HOST CRASH/UNDEFINED BEH=
AVIOR */
> -        arch_livepatch_quiesce();
> -        common_livepatch_revert(payload);
> -        arch_livepatch_revive();
> -        BUG_ON(fstate->applied =3D=3D LIVEPATCH_FUNC_APPLIED);
> -
> -        printk(KERN_DEBUG "%s: post reverted: %s\n", __func__, func->nam=
e);
> -    }
> +    local_irq_save(flags);
> +    BUG_ON(revert_payload(payload));
> +    revert_payload_tail(payload);
> +    local_irq_restore(flags);
>
>      printk(KERN_DEBUG "%s: Hook done.\n", __func__);
>  }
> --
> 2.44.0
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

