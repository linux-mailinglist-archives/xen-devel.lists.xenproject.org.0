Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C1ABD565
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 12:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990627.1374567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHKRx-0004ID-1Y; Tue, 20 May 2025 10:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990627.1374567; Tue, 20 May 2025 10:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHKRw-0004Gl-V6; Tue, 20 May 2025 10:43:56 +0000
Received: by outflank-mailman (input) for mailman id 990627;
 Tue, 20 May 2025 10:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvNd=YE=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uHKRv-0004Gf-Ps
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 10:43:55 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50b554f7-3567-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 12:43:50 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2d4f8c42f49so2234393fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 03:43:50 -0700 (PDT)
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
X-Inumbo-ID: 50b554f7-3567-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747737829; x=1748342629; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uaftpOpgrsIuQy4iUAfyMgweupj/IjoBcEDbSzXkPo=;
        b=b+NyJiaMLJfXOJ9WzTXH3uwNnvL5kVkJfaKiHsazCIyDHdx//LznnKBOLB17aa4yU+
         gcI986bbXx98+qnSb2F70ZCflXKocAdzqAaHhAoUIbTIRvFOaA5fRxZJv0fyOEQPK8nj
         Jy62+91YzcgnlBbidl2CFs6reh0sOb1hJjM6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737829; x=1748342629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uaftpOpgrsIuQy4iUAfyMgweupj/IjoBcEDbSzXkPo=;
        b=FEQ+5zhxghZhiupg4PHbyEHEN0iR7Y9t/FS/PMf1zr2xIgOccoJiVnRwUWCWwbIx8H
         LlHtk14YGocoHNUFpAgp2PhCjPampbA1mFkcsYo4OvY8tc2HJoOfWjsaG0VmB3qrew8J
         1ZXHBnfAuHioFbaNQe5C/5ezYvk5BIj6WjSaKqHftEFldgwayHmbHCb5t3WBUhn/IwXA
         cO8B3zd5MEtuXJ0+e03oUIj+P4yyWxQw5M0ftMwD5prL0J84N/hDDqdVIH0R9lpdXYaM
         8fdg5zvm8im/i7xFEQGlWwZQzpw2WT+LkgfdsxdHvfULMhVlCFSbdXIER+dVVX24lG1E
         xr5A==
X-Gm-Message-State: AOJu0Ywqudxb+OFlGsNZjiGCL0YqCyjWY8L/IupZFu6qt++wiNISl0uv
	+bOwpdz2ol+t8zlSdHSR5xw/XfxwkQbU+UxnXn8xdLcHdEwpW6Lk35HFfKatkkylQkF0ulqSMt0
	h+RYSZfcPy2TtqKur7bFwl/xF77fR605wRXufMtv81g==
X-Gm-Gg: ASbGncvlUAgDw6xufCStuVUCXa8Zkpfcbpg8qdWu0b73AVzl8f0DoAaW9+UM/GQFwwp
	W4rsSbP8CY4up6uvi1btPVynWdYdkwLDfdTO//7xrA9HeXRAM8XTyo1loZrXz0rRASuECshjbv6
	kkb7XS0DepiMnbt/TsR3tToWnhF6ucrr6UG3vE0r6EkA==
X-Google-Smtp-Source: AGHT+IEwvPmgfvu29BWKNSBcnNDdzXnc3zNqQ435MZmgeN1kwzg3Isiw7XNtmmjK9lMkI11uPA3btHxq4X6dJFw+HZw=
X-Received: by 2002:a05:6870:ef84:b0:2d4:e101:13f1 with SMTP id
 586e51a60fabf-2e3c2a988d6mr9554270fac.13.1747737829425; Tue, 20 May 2025
 03:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250519135227.27386-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250519135227.27386-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 20 May 2025 11:43:38 +0100
X-Gm-Features: AX0GCFtXgJw3il85Z0HktJWEvteU044WjO75y82oTWFjESGgTNteCBCC34zUN-4
Message-ID: <CACHz=Zi33brKo6=w64qtDjb2ufSDmf-Db-XDFU3AFX0DRdDDuQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Give compile.h header guards
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 2:52=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/include/xen/compile.h.in | 3 +++
>  xen/tools/process-banner.sed | 5 +++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
> index 3151d1e7d1bf..9206341ba692 100644
> --- a/xen/include/xen/compile.h.in
> +++ b/xen/include/xen/compile.h.in
> @@ -1,3 +1,6 @@
> +#ifndef XEN_COMPILE_H
> +#define XEN_COMPILE_H
> +

Why not follow CODING_STYLE ?

OT: Maybe while on it, why not add SPDX comments too ?

>  #define XEN_COMPILE_DATE       "@@date@@"
>  #define XEN_COMPILE_TIME       "@@time@@"
>  #define XEN_COMPILE_BY         "@@whoami@@"
> diff --git a/xen/tools/process-banner.sed b/xen/tools/process-banner.sed
> index 56c76558bcd9..4cf3f9a1163a 100755
> --- a/xen/tools/process-banner.sed
> +++ b/xen/tools/process-banner.sed
> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
>
>  # Trailing \ on all but the final line.
>  $!s_$_ \\_
> +
> +# Append closing header guard
> +$a\
> +\
> +#endif /* XEN_COMPILE_H */
>
> base-commit: 6fc02ebdd053856221f37ba5306232ac1575332d
> prerequisite-patch-id: 7bc1c498ba2c9c4a4939a56a0006f820f47f2a66
> --
> 2.39.5
>
>
Frediano

