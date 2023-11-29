Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADC7FD436
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 11:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643796.1004296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Hs8-0004J3-Ko; Wed, 29 Nov 2023 10:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643796.1004296; Wed, 29 Nov 2023 10:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Hs8-0004GY-I3; Wed, 29 Nov 2023 10:32:48 +0000
Received: by outflank-mailman (input) for mailman id 643796;
 Wed, 29 Nov 2023 10:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZTC=HK=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1r8Hs6-0004GQ-Td
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 10:32:46 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1845359-8ea2-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 11:32:44 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b54261534so2709585e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 02:32:44 -0800 (PST)
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
X-Inumbo-ID: a1845359-8ea2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701253963; x=1701858763; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuILcJ59J6n6wEAS/aJ/DfbeIn79CyLEtUWJQWBrpAI=;
        b=D37nmPWR5uqpFU6Def2tvkYG9lB/8QNSyCDqBTUcs6TYdb1VfjkZUpGejE36Umraye
         Tqx2V3JRyt/hSXqX+rMCX3yTl8FBGgfuyz3hXUQqG8zYKnF7JojoZwrCRrzD/c1Urtmd
         j+i4+51TrQ6w5ILCabwl5EiP4T5DpnKn8HL/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701253963; x=1701858763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuILcJ59J6n6wEAS/aJ/DfbeIn79CyLEtUWJQWBrpAI=;
        b=hAyj0Yp9Ku4SwQOMiAAf1zqH14Dsvp1R05UlNf78tzF5vTLQf9bgsQQ2gOef9uJDZi
         TdNWyL5kpgXEwPWyR7Alsvcb3nA0HMemTL5YpkpdpTc3HNswHbfUiADxAqCa/PTnFamF
         3fiRcP4od0J2iSS+veXZ9TyonM2dwIwW0iobpimP1MvzD3ABHkgLpcf+A4lNnNeXXCyy
         E5A54xzZyqb9gUBxjgaUyNSVqcAeZOHCIGovZgtHi6lHxfsZ9wxFhQBCOSzh+oz5ol6+
         OP+ICSBrl+s4KtcnRhma7hxF0ZyPHlIvSUTPrDVwQQ2vAy6ZH687sGUHlzjWSjc68d7a
         d3Eg==
X-Gm-Message-State: AOJu0Yz9v1mk52GI0cQuWDn1yf6TAiT9MDD7MCdLGn726Xuq2CGwToIY
	GHkZvAu4ZW6xZQi58DMOoLObu8mu/ABaiUqiHz4I9RfFOSXHtBo=
X-Google-Smtp-Source: AGHT+IF2iEVt6cyNRQ4Ctw+VMTGhpWul/ekv2OvqUFZETA/YEFIatFfB6JFmAiywtfFSEmMFTMMB5OeGpNN0joTPcR8=
X-Received: by 2002:a05:600c:4fcc:b0:40b:338b:5f38 with SMTP id
 o12-20020a05600c4fcc00b0040b338b5f38mr12486000wmq.8.1701253963521; Wed, 29
 Nov 2023 02:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20231128174131.38642-1-roger.pau@citrix.com>
In-Reply-To: <20231128174131.38642-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 29 Nov 2023 10:32:32 +0000
Message-ID: <CAG7k0EqEjbL2LFoB4gn+VNQu_QEDVR8oaCjwdPp++B=Q3jA7CA@mail.gmail.com>
Subject: Re: [PATCH] xen/livepatch: fix livepatch tests
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 5:41=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> The current set of in-tree livepatch tests in xen/test/livepatch started
> failing after the constify of the payload funcs array, and the movement o=
f the
> status data into a separate array.
>
> Fix the tests so they respect the constness of the funcs array and also m=
ake
> use of the new location of the per-func state data.
>
> Fixes: 82182ad7b46e ('livepatch: do not use .livepatch.funcs section to s=
tore internal state')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> I will see about getting those tests build in gitlab, in the meantime we =
should
> take this fix in order to unblock osstest.
> ---
>  xen/test/livepatch/xen_action_hooks.c         | 12 +++++-----
>  xen/test/livepatch/xen_action_hooks_marker.c  | 20 ++++++++++-------
>  xen/test/livepatch/xen_action_hooks_noapply.c | 22 +++++++++++--------
>  xen/test/livepatch/xen_action_hooks_nofunc.c  |  6 ++---
>  .../livepatch/xen_action_hooks_norevert.c     | 22 +++++++++++--------
>  xen/test/livepatch/xen_prepost_hooks.c        |  8 +++----
>  xen/test/livepatch/xen_prepost_hooks_fail.c   |  2 +-
>  7 files changed, 53 insertions(+), 39 deletions(-)
>
snip
> diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/li=
vepatch/xen_action_hooks_norevert.c
> index ef77e720713e..1c4873f55640 100644
> --- a/xen/test/livepatch/xen_action_hooks_norevert.c
> +++ b/xen/test/livepatch/xen_action_hooks_norevert.c
> @@ -25,9 +25,10 @@ static int pre_apply_hook(livepatch_payload_t *payload=
)
>
>      for (i =3D 0; i < payload->nfuncs; i++)
>      {
> -        struct livepatch_func *func =3D &payload->funcs[i];
> +        const struct livepatch_func *func =3D &payload->funcs[i];
> +        struct livepatch_fstate *fstate =3D &payload->fstate[i];
>
> -        BUG_ON(func->applied =3D=3D LIVEPATCH_FUNC_APPLIED);
> +        BUG_ON(fstate->applied =3D=3D LIVEPATCH_FUNC_APPLIED);
>          printk(KERN_DEBUG "%s: pre applied: %s\n", __func__, func->name)=
;
>      }
>
> @@ -44,9 +45,10 @@ static void post_apply_hook(livepatch_payload_t *paylo=
ad)
>
>      for (i =3D 0; i < payload->nfuncs; i++)
>      {
> -        struct livepatch_func *func =3D &payload->funcs[i];
> +        const struct livepatch_func *func =3D &payload->funcs[i];
> +        struct livepatch_fstate *fstate =3D &payload->fstate[i];
>
> -        BUG_ON(func->applied !=3D LIVEPATCH_FUNC_APPLIED);
> +        BUG_ON(fstate->applied !=3D LIVEPATCH_FUNC_APPLIED);
>          printk(KERN_DEBUG "%s: post applied: %s\n", __func__, func->name=
);
>      }
>
> @@ -62,8 +64,9 @@ static int pre_revert_hook(livepatch_payload_t *payload=
)
>      for (i =3D 0; i < payload->nfuncs; i++)
>      {
>          struct livepatch_func *func =3D &payload->funcs[i];

const here too?

With that fixed...
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

