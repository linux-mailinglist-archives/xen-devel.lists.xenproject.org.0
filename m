Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D96B914B11
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746573.1153666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLj9i-0004lQ-TF; Mon, 24 Jun 2024 12:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746573.1153666; Mon, 24 Jun 2024 12:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLj9i-0004kQ-PV; Mon, 24 Jun 2024 12:50:46 +0000
Received: by outflank-mailman (input) for mailman id 746573;
 Mon, 24 Jun 2024 12:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLj9h-0004kK-8Y
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:50:45 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e44b88a-3228-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:50:43 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so15109171fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:50:43 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3048b93asm4793507a12.56.2024.06.24.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 05:50:42 -0700 (PDT)
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
X-Inumbo-ID: 5e44b88a-3228-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719233443; x=1719838243; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p6sFDusjuqBGQtOdAHYp5nC/fCld9tLxhD7a+hiN5Sw=;
        b=dCp+0ZWrVguZkFpFLGI9VnlREfGvsH6eh33LkCBlNHzra5KUEmEcZDl74Sy7ydPHpM
         DbrSSqoN5rJ2DPGE9paRn2nAcY1GV60/p0LkN0wKe5pgLc47BC+rbOWjeQ3Wb+siCnVx
         EQ6QrMMuo33zlLd6JT6FuLi8uqAlN+8uzNvis0fS9Unc4NU3/qG+g3NOhgrhM6ahj5d+
         dGOqG+IkRzLhOEZUWEp16wZzG9e9WvKe3hMMXSg2jEDaoLJb9wdNKQ991mYsycmZfE8k
         8ZtAfQ4tIjituYkHrLGtAYaSS4Zogxh2e2RFYgzkUXwHu7T+hQXcf6JSo5TLu27mSWrl
         kraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233443; x=1719838243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6sFDusjuqBGQtOdAHYp5nC/fCld9tLxhD7a+hiN5Sw=;
        b=twhPRHQlJRAfhmmEzjngULB+awOu9661eofcngyamLiAe32+QYZMnvH0NUPjdO2oQu
         N095J4uXxd3oTEvkFqNwYqcp1/J6ITPEU+BFjofyZuRDdgc2YSdiHmxX7k6aiwynfO7E
         rBD8ARI3niMDSE0F1QLhjzEEjswO85yxH2W0qFnGT1vtSQIZLvC/DkjJodJ8sC6sPL38
         BP9iZK41ioF1g3OR5BOvXFqJyL6fXXMYaWu2lusL822TcuJq4rpHWJF4mCJY7c6Ysady
         wBeQjxOjKFxLtmSasjig5+mKfFf1lz7KepB+p8b26p1B7wYGLU0p1XWPj/o0/KFblUwy
         mb6g==
X-Forwarded-Encrypted: i=1; AJvYcCUkD81RqHj/6ksMMfwhRJbY1C/UD1WNc12+o0EXdUVGhlPmNnv83qshwVPr+7KtMI3vghwdri8DZ0vFsVeai9AMLf1rL0+S7iOjibLw2DI=
X-Gm-Message-State: AOJu0YzmaTNPuLNRTzMz9GslJyVzhza48OsW4M7/7xxfYCpBI8YQRZcV
	hEXm8MYOh/inJbycyeBeA1NyudzVH6gC45W5h7BLP7DbYElRcmsM
X-Google-Smtp-Source: AGHT+IEXF9iulpLg8Vo5qz5r6vU5CxLPgnPzAlpvQQLDHVFcDX8WYw+GYEasaVdiup6aU7DYu4u6hQ==
X-Received: by 2002:a2e:a98e:0:b0:2ec:5d83:32cf with SMTP id 38308e7fff4ca-2ec5d83332fmr36960081fa.34.1719233442522;
        Mon, 24 Jun 2024 05:50:42 -0700 (PDT)
Message-ID: <2bd871f45ec63f29ee6c7637799c73bab1ca5b3c.camel@gmail.com>
Subject: Re: [PATCH 1/3] xen/riscv: Drop legacy __ro_after_init definition
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Date: Mon, 24 Jun 2024 14:50:41 +0200
In-Reply-To: <20240621201928.319293-2-andrew.cooper3@citrix.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
	 <20240621201928.319293-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 21:19 +0100, Andrew Cooper wrote:
> Hide the legacy __ro_after_init definition in xen/cache.h for RISC-V,
> to avoid
> its use creeping in.=C2=A0 Only mm.c needs adjusting as a consequence
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342686294
> ---
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/xen/cache.h | 2 ++
> =C2=A02 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 053f043a3d2a..3ebaf6da01cc 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,11 +1,11 @@
> =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> -#include <xen/cache.h>
> =C2=A0#include <xen/compiler.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/macros.h>
> =C2=A0#include <xen/pfn.h>
> +#include <xen/sections.h>
> =C2=A0
> =C2=A0#include <asm/early_printk.h>
> =C2=A0#include <asm/csr.h>
> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> index 55456823c543..82a3ba38e3e7 100644
> --- a/xen/include/xen/cache.h
> +++ b/xen/include/xen/cache.h
> @@ -15,7 +15,9 @@
> =C2=A0#define __cacheline_aligned
> __attribute__((__aligned__(SMP_CACHE_BYTES)))
> =C2=A0#endif
> =C2=A0
> +#if defined(CONFIG_ARM) || defined(CONFIG_X86) ||
> defined(CONFIG_PPC64)
> =C2=A0/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __ro_after_init __section(".data.ro_after_init")
> +#endif
> =C2=A0
> =C2=A0#endif /* __LINUX_CACHE_H */


