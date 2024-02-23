Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7585860EF4
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684736.1064805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSW5-0006mx-1I; Fri, 23 Feb 2024 10:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684736.1064805; Fri, 23 Feb 2024 10:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSW4-0006k5-Ug; Fri, 23 Feb 2024 10:10:52 +0000
Received: by outflank-mailman (input) for mailman id 684736;
 Fri, 23 Feb 2024 10:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8H=KA=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rdSW3-0006jz-Qw
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:10:51 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d15ef228-d233-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 11:10:49 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4128cfb6c1aso4164095e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:10:49 -0800 (PST)
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
X-Inumbo-ID: d15ef228-d233-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708683049; x=1709287849; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbvQLKnWegIgTosnvez+76k27dwEsKDLBPZ1TSP0Xkk=;
        b=YGtlVgvME6ogoiH7M8i+O3z2ZotNfzy5sgMEa7kuEq47JFMYDrA52BSBkTw45Lytn1
         WrF5PuMm3TL5bT2duxI5AIkCfc+mbq0EcJopDZxtbjmrCAeZN7+4OEiwQNYxeiSzA2kU
         6lyGOzPTOti97pO8OgXysdCplqsqTQFt+q1U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683049; x=1709287849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbvQLKnWegIgTosnvez+76k27dwEsKDLBPZ1TSP0Xkk=;
        b=wfsM5VFTlIqUdIrG3BjQakdUJQnM7NTgu4EHuV6V965nAe1ExQVSJTnY5N46ypErsI
         XITHNkKc6sEsWaYYzvF3GBrDNRN7zYQVBtjnko8bT1Xsew5ppYVHVnbH2Pt7v5p0M7SY
         VloU5QOSyIbaIKbm6PE4nwk8dDA7MreSkF6thkmUJ4TjSCSE4q2uXJE6po1NdslzmIsB
         RKtnfkF8LaaVbUC0Rral4rZk8OQce4xoBjj/nu0X6AWdZalIaqG9e8ykbwueXgVKC7YZ
         jLYRo5dTCL5b8EpS8cWM4yZc0rL2KpZQb+5artVEs+jl0EIrP6zw/92HGFvMVqPW88Ek
         GRCw==
X-Gm-Message-State: AOJu0YwAXTJf/VJFA8sr1KkWllADuGYVCz3EyHvmN+ULEHguG5M0gMQ2
	QSsbndkDtZEvyoGw4ojbf+c43Ok2/R4BLg/B8rmxb8a6kT2LZn2Re9yDnh5nH5txTMBfGOreK3o
	RL+2PP/7I6TpcoSo8L0rx1jnyATY2oeL+rKtK
X-Google-Smtp-Source: AGHT+IELAouiUrZFKYG9zCBlrgQFNjkhEIqm9WixiX6M2uRhrK/FNBRBcXLTalHBN8JSkIVODogNUt8alvm1TI2GpiY=
X-Received: by 2002:a05:600c:1c09:b0:412:9739:717a with SMTP id
 j9-20020a05600c1c0900b004129739717amr218801wms.12.1708683049017; Fri, 23 Feb
 2024 02:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20231130142944.46322-1-roger.pau@citrix.com> <20231130142944.46322-4-roger.pau@citrix.com>
In-Reply-To: <20231130142944.46322-4-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 23 Feb 2024 10:10:38 +0000
Message-ID: <CAG7k0ErX0yydgTyZQM=CU+7ZgWnrvqJGXRGmUtM8=O9_UH=12A@mail.gmail.com>
Subject: Re: [PATCH 3/5] xen/livepatch: fix norevert test attempt to open-code revert
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 2:30=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
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
>  xen/common/livepatch.c                        | 41 +++++++++++++++++--
>  xen/include/xen/livepatch.h                   | 32 ++-------------
>  .../livepatch/xen_action_hooks_norevert.c     | 22 +++-------
>  3 files changed, 46 insertions(+), 49 deletions(-)
>
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 4e775be66571..d81f3d11d655 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1367,7 +1367,22 @@ static int apply_payload(struct payload *data)
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
> @@ -1383,7 +1398,7 @@ static inline void apply_payload_tail(struct payloa=
d *data)
>      data->state =3D LIVEPATCH_STATE_APPLIED;
>  }
>
> -static int revert_payload(struct payload *data)
> +int revert_payload(struct payload *data)
>  {
>      unsigned int i;
>      int rc;
> @@ -1398,7 +1413,25 @@ static int revert_payload(struct payload *data)
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
> @@ -1416,7 +1449,7 @@ static int revert_payload(struct payload *data)
>      return 0;
>  }
>
> -static inline void revert_payload_tail(struct payload *data)
> +void revert_payload_tail(struct payload *data)
>  {
>      list_del(&data->applied_list);
>
> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index df339a134e40..9da8b6939878 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -136,35 +136,11 @@ void arch_livepatch_post_action(void);
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
> index 3e21ade6abfc..074f8e1d56ce 100644
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
> +    revert_payload(payload);

Should this check or assert the return value of revert_payload()?

Ross

> +    revert_payload_tail(payload);
> +    local_irq_restore(flags);
>
>      printk(KERN_DEBUG "%s: Hook done.\n", __func__);
>  }
> --
> 2.43.0
>

