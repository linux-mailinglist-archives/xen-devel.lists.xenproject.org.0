Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17386B1D0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686671.1068962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKxV-0004p5-D6; Wed, 28 Feb 2024 14:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686671.1068962; Wed, 28 Feb 2024 14:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKxV-0004nS-9p; Wed, 28 Feb 2024 14:30:57 +0000
Received: by outflank-mailman (input) for mailman id 686671;
 Wed, 28 Feb 2024 14:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Dg=KF=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rfKxU-0004IV-Rd
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:30:56 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa97262d-d645-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 15:30:54 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29996cc6382so3973408a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 06:30:54 -0800 (PST)
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
X-Inumbo-ID: fa97262d-d645-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709130653; x=1709735453; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0VlonLqhBdA+xA9i99/449MrxyCIN089k/qvTq0NHE=;
        b=IAPIqYVaaYnl5e4E7ffH7GVQFpvzMMfPaIwup1d6chqmGGCCJMTwwKN5A71/geDwXj
         646oBqL1ielIde77ivSxnBGd6rcM+MmM75z3r9RUsVLSo4Pej5YBpEpZeFpbq9ooGAUl
         BywV4JvU/8u3Hn8ObWtxq05tJ+Ut3dJCWP47A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709130653; x=1709735453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0VlonLqhBdA+xA9i99/449MrxyCIN089k/qvTq0NHE=;
        b=cy2zTao13s/TLvRhXGHDwSg0DCDi8SY/LYWkUQBcn2ERdMzCmpFpwpm6T5novMz7Mm
         N0vjJ/qzCbIQ0phsuvh54xmIxxWeoE3XqfcVgxdqfM4HQ1Lb/0By7MpyAWgNtEEdoQHi
         X3YGzdgB8a7Zy23aal8n3verI+cEpHxT6DhEFQVMBk6IHihV9F/BvH3/duSwrgQ0VOO5
         wUndz3umdTdhGy7OMBfGN65kzdPhpDtH+tHBbUFJdO0gxwqFrpBhYQxOFG2LGwDkwcIj
         DIY+AlMrzgNnqpW1j/GvrEosKZ4gaIkphsEcUKl3jO0ir63c+ARzUyIbBgvXsyI3SnDr
         TtIQ==
X-Gm-Message-State: AOJu0YzhLNvXt2pmrJYV6JNigw0nGhW1XlphF032HP0j0gk/QaKmCMZC
	Z4/8veZ5FH9291Up3gv0YZNf7pEkwdDy0u6AD/SGgAQJFlVn7N0MkSMKs/50h/Q+smeeKib+Q+f
	IX8y+/EOmZQADFJ9F7i2LtA75fxYY+Uwr1iL8
X-Google-Smtp-Source: AGHT+IEJNCr2dmwBrf8wBcx3mE+U/a/HOse1dc+CY8inY2XU3sKpglxxscJnJiJuklSL3Yvur0zcl1pkoPfcZLkTANU=
X-Received: by 2002:a17:90a:88c:b0:299:3f10:20ba with SMTP id
 v12-20020a17090a088c00b002993f1020bamr11035825pjc.27.1709130653320; Wed, 28
 Feb 2024 06:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20240227112528.4540-1-roger.pau@citrix.com> <20240227112528.4540-6-roger.pau@citrix.com>
In-Reply-To: <20240227112528.4540-6-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 28 Feb 2024 14:30:43 +0000
Message-ID: <CAG7k0EqQuqU5eyGRoZ2r4uwUuXWKZynN09ePmnVXH_32cWE_og@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xen/livepatch: group and document payload hooks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:25=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> Group the payload hooks between the pre/post handlers, and the apply/reve=
rt
> replacements.  Also attempt to comment the context in which the hooks are
> executed.
>
> No functional change.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.
> ---
>  xen/include/xen/livepatch_payload.h | 37 ++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepa=
tch_payload.h
> index b9cd4f209670..472d6a4a63c1 100644
> --- a/xen/include/xen/livepatch_payload.h
> +++ b/xen/include/xen/livepatch_payload.h
> @@ -82,6 +82,8 @@ struct payload {
>   * collision.  Since multiple hooks can be registered, the
>   * .livepatch.hook.load section is a table of functions that will be
>   * executed in series by the livepatch infrastructure at patch load time=
.
> + *
> + * Note the load hook is executed in quiesced context.
>   */
>  #define LIVEPATCH_LOAD_HOOK(_fn) \
>      livepatch_loadcall_t *__weak \
> @@ -96,14 +98,20 @@ struct payload {
>       livepatch_unloadcall_t *__weak \
>          const livepatch_unload_data_##_fn __section(".livepatch.hooks.un=
load") =3D _fn;
>
> +/*
> + * Pre/Post action hooks.
> + *
> + * This hooks are executed before or after the livepatch application. Pr=
e hooks
> + * can veto the application/revert of the livepatch.  They are not execu=
ted in
> + * quiesced context.  All of pre and post hooks are considered vetoing, =
and
> + * hence filling any of those will block the usage of the REPLACE action=
.
> + *
> + * Each of the hooks below can only be set once per livepatch payload.
> + */
>  #define LIVEPATCH_PREAPPLY_HOOK(_fn) \
>      livepatch_precall_t *__attribute__((weak, used)) \
>          const livepatch_preapply_data_##_fn __section(".livepatch.hooks.=
preapply") =3D _fn;
>
> -#define LIVEPATCH_APPLY_HOOK(_fn) \
> -    livepatch_actioncall_t *__attribute__((weak, used)) \
> -        const livepatch_apply_data_##_fn __section(".livepatch.hooks.app=
ly") =3D _fn;
> -
>  #define LIVEPATCH_POSTAPPLY_HOOK(_fn) \
>      livepatch_postcall_t *__attribute__((weak, used)) \
>          const livepatch_postapply_data_##_fn __section(".livepatch.hooks=
.postapply") =3D _fn;
> @@ -112,14 +120,27 @@ struct payload {
>      livepatch_precall_t *__attribute__((weak, used)) \
>          const livepatch_prerevert_data_##_fn __section(".livepatch.hooks=
.prerevert") =3D _fn;
>
> -#define LIVEPATCH_REVERT_HOOK(_fn) \
> -    livepatch_actioncall_t *__attribute__((weak, used)) \
> -        const livepatch_revert_data_##_fn __section(".livepatch.hooks.re=
vert") =3D _fn;
> -
>  #define LIVEPATCH_POSTREVERT_HOOK(_fn) \
>      livepatch_postcall_t *__attribute__((weak, used)) \
>          const livepatch_postrevert_data_##_fn __section(".livepatch.hook=
s.postrevert") =3D _fn;
>
> +/*
> + * Action replacement hooks.
> + *
> + * The following hooks replace the hypervisor implementation for the liv=
epatch
> + * application and revert routines.  When filling the hooks below the na=
tive
> + * apply and revert routines will not be executed, so the provided hooks=
 need
> + * to make sure the state of the payload after apply or revert is as exp=
ected
> + * by the livepatch logic.
> + */
> +#define LIVEPATCH_APPLY_HOOK(_fn) \
> +    livepatch_actioncall_t *__attribute__((weak, used)) \
> +        const livepatch_apply_data_##_fn __section(".livepatch.hooks.app=
ly") =3D _fn;
> +
> +#define LIVEPATCH_REVERT_HOOK(_fn) \
> +    livepatch_actioncall_t *__attribute__((weak, used)) \
> +        const livepatch_revert_data_##_fn __section(".livepatch.hooks.re=
vert") =3D _fn;
> +
>  #endif /* __XEN_LIVEPATCH_PAYLOAD_H__ */
>

LGTM, thanks.

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

