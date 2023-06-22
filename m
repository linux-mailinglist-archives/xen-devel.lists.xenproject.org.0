Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA35739558
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 04:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553239.863683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC9pX-00016W-G1; Thu, 22 Jun 2023 02:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553239.863683; Thu, 22 Jun 2023 02:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC9pX-00014u-9M; Thu, 22 Jun 2023 02:13:51 +0000
Received: by outflank-mailman (input) for mailman id 553239;
 Thu, 22 Jun 2023 02:13:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kw6x=CK=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qC9pW-00014o-1g
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 02:13:50 +0000
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [2607:f8b0:4864:20::e35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad08e37-10a2-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 04:13:46 +0200 (CEST)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-440ad8ea514so1590916137.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 19:13:46 -0700 (PDT)
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
X-Inumbo-ID: 6ad08e37-10a2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687400025; x=1689992025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMDjXjBvJ2Cwx0ymg0Rne9bNBgZ/WY4jhpp9jUf7EPM=;
        b=idr0vYcZWdVbQerOrWz3eQ6ClUowFTKX7IoYADhLJS2ptxpP7OAC+lB3DpLpFrlMZg
         9llVhtKZodR4q4S9LvU8kJRzPZ807ejhiGmSzNVAnPtpzyWYMFJC0pTK15wMzGNk2lGW
         DAely5Qt6ekhYGm3wmB4H5e0+CgRHfgLU+HoWGCwoJkij1PVBoVDIR2tXxujKhq6b47H
         XsMPSd4STxx48uPXQ9hw9/1OFpAOGqE5oIYvclFYq0Y8TMYgnHuuM1SuWQqV6Wx0tn2d
         3JtSB9oT5eVdU093denNVJsc4z2V+RQO8BRiowhMfeExIoYtKBeytPQam6v3j61i/r7o
         oMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687400025; x=1689992025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMDjXjBvJ2Cwx0ymg0Rne9bNBgZ/WY4jhpp9jUf7EPM=;
        b=asIAEkwV+WA9+Klst5tfx1Zs/bg4TACOaFBJc3hvEM45ZOHFfXkKRyigXjtZmooceV
         80mAmNIvP9xlEXGyGI+NMYyb7bjkzmnYOUxCBoplmNUp/4WNrV09U1zxDzfHhqaoi5gO
         9cFF3DQayn8K54d+UWIPGevE4NNffUUFvF4Qs9K/3rJBGun6615uoFDMZKM5izFW2KHd
         OLXsDXXnnTR5AMtpp5IcdWiT+R8k9IRUtVRVh4fOPSa8fWxfIZoa5+ARk5Ku1/fMrN1W
         XxjIMH7IQST8s3nxtcgWYPGNHVjuk/eA6k/uES5p8CVzgnMdO2Go1TYU+ds8h4RF3Igv
         pbdw==
X-Gm-Message-State: AC+VfDzKy8XTWnoDHEk+Sty8Kpd1XXZzadAFQSzGUYfyUt9ZAkaRyZZd
	wfbJ3IpxM2tQnG10cvs85ejhgX0hQa3fdhPPSpw=
X-Google-Smtp-Source: ACHHUZ5RcPm6Oa0BEp/kcOeBVqr5R5l7uIRs5S8MJWL7xVhH5bhytikBFCJnVoO+TzRsWFCs1JpEgjlwKpdfoSEd8vs=
X-Received: by 2002:a67:ce91:0:b0:43b:2682:a4a3 with SMTP id
 c17-20020a67ce91000000b0043b2682a4a3mr8276168vse.23.1687400025196; Wed, 21
 Jun 2023 19:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687178053.git.oleksii.kurochko@gmail.com> <19dfd66d1a446bf1f5cdccd74b7a64f56baa8f5c.1687178053.git.oleksii.kurochko@gmail.com>
In-Reply-To: <19dfd66d1a446bf1f5cdccd74b7a64f56baa8f5c.1687178053.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:13:19 +1000
Message-ID: <CAKmqyKOp_pc516rvQQxRac5YzwMzsBgfcLOvKh=cw-zceV=tbg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] xen/riscv: add SPDX tags
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 11:35=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>   - change SPDX tags from GPL-2.0-or-later to GPL-2.0-only.
>   - add Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>.
> ---
>  xen/arch/riscv/include/asm/current.h      | 2 ++
>  xen/arch/riscv/include/asm/early_printk.h | 2 ++
>  xen/arch/riscv/include/asm/mm.h           | 2 ++
>  xen/arch/riscv/include/asm/page-bits.h    | 2 ++
>  xen/arch/riscv/include/asm/page.h         | 2 ++
>  xen/arch/riscv/include/asm/traps.h        | 2 ++
>  xen/arch/riscv/include/asm/types.h        | 2 ++
>  xen/arch/riscv/mm.c                       | 2 ++
>  xen/arch/riscv/setup.c                    | 2 ++
>  9 files changed, 18 insertions(+)
>
> diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/includ=
e/asm/current.h
> index d87e6717e0..d84f15dc50 100644
> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __ASM_CURRENT_H
>  #define __ASM_CURRENT_H
>
> diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/i=
nclude/asm/early_printk.h
> index 05106e160d..85e60df33a 100644
> --- a/xen/arch/riscv/include/asm/early_printk.h
> +++ b/xen/arch/riscv/include/asm/early_printk.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __EARLY_PRINTK_H__
>  #define __EARLY_PRINTK_H__
>
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm=
/mm.h
> index 500fdc9c5a..3f694a43ef 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef _ASM_RISCV_MM_H
>  #define _ASM_RISCV_MM_H
>
> diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/incl=
ude/asm/page-bits.h
> index 4a3e33589a..8f1f474371 100644
> --- a/xen/arch/riscv/include/asm/page-bits.h
> +++ b/xen/arch/riscv/include/asm/page-bits.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __RISCV_PAGE_BITS_H__
>  #define __RISCV_PAGE_BITS_H__
>
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/a=
sm/page.h
> index 22b36e03a4..95074e29b3 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef _ASM_RISCV_PAGE_H
>  #define _ASM_RISCV_PAGE_H
>
> diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/=
asm/traps.h
> index f3fb6b25d1..3fef318478 100644
> --- a/xen/arch/riscv/include/asm/traps.h
> +++ b/xen/arch/riscv/include/asm/traps.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __ASM_TRAPS_H__
>  #define __ASM_TRAPS_H__
>
> diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/=
asm/types.h
> index 0c0ce78c8f..c2cdfd9caa 100644
> --- a/xen/arch/riscv/include/asm/types.h
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __RISCV_TYPES_H__
>  #define __RISCV_TYPES_H__
>
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 2693b817c5..663048c783 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #include <xen/cache.h>
>  #include <xen/compiler.h>
>  #include <xen/init.h>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index c4ef0b3165..6593f601c1 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #include <xen/compile.h>
>  #include <xen/init.h>
>
> --
> 2.40.1
>
>

