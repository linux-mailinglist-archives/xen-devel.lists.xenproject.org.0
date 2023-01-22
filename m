Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A732C67731A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482549.748114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjJ3-0004Nm-EW; Sun, 22 Jan 2023 22:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482549.748114; Sun, 22 Jan 2023 22:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjJ3-0004Lg-Bj; Sun, 22 Jan 2023 22:59:21 +0000
Received: by outflank-mailman (input) for mailman id 482549;
 Sun, 22 Jan 2023 22:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjJ2-0004Jk-7P
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 22:59:20 +0000
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66011f1c-9aa8-11ed-91b6-6bf2151ebd3b;
 Sun, 22 Jan 2023 23:59:18 +0100 (CET)
Received: by mail-vs1-xe2f.google.com with SMTP id q125so11242835vsb.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 14:59:18 -0800 (PST)
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
X-Inumbo-ID: 66011f1c-9aa8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OHk0zLX5cDu2LCGUkMk+SDH1kuMpE+ZZ1Z0AKfRPhrg=;
        b=Wd5xEGnmdZFxXoBQJM9O3tvlpfO25Gcq3p5V8TZ2gDQBBoN3UqkbybxRzf46TCzKxV
         zFfcfqfK7Z6xRggkUK7PPnDkTc9oa8ZFtmKcQXnDCB6XScFi2ghz5lL92rHRCDdicqlk
         1J5cKnzzMqJS+NYLs5zY9iAx0B+3efjZIDHrkgGYW2KzQ76aCrNo+3WHlvFniZXeZ0sU
         OTG2O+CC0HuYTEd/mguNU4CTek4968cNaEQfn8YiEU1MoJHFUJ1l2OHeGJvSfNXd0ulJ
         zombBCo6YBGYYaZYWyjulSIcHvrIZfGJxhvvVe0Xf11/a3vR1Nsn5/Xn36TIHSNRCu79
         ThKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHk0zLX5cDu2LCGUkMk+SDH1kuMpE+ZZ1Z0AKfRPhrg=;
        b=pL0sXHTTHRvZpJpwNa1Fk6AKBXmmt/zedItDOpzvcpm+Re+CoPiNwCFD7+EHLI5S++
         viNwC62EaAbOvRHiVq/tRfleFezalKmUfggo9dBuUCB8bxBZdhrk8Vu8qR+liWToZL7I
         +I4lgU5Y0lP1+KYmbnNTNPH1qzHay0SqM0ZUPuGJ9T9JcZggzwj7B7HdimVQtusVC5T0
         4RpHbR1NR2R2qi/sxwVEgxdL5TzRwfMnqYix0IdrKtkNZDH8GxYiYH4xNTC72B2sG4Q5
         aQhtx6DV4kds84DZSXg5+AAmjjk+xCwDbsgiB1AuqnJxupDzvzVUPqRu4OpwUPgEHdKb
         DFkA==
X-Gm-Message-State: AFqh2kplLBVtQ0So4NYTyj634bYLFWrSpYG6JeegYfdKG96gEzXjrTjq
	0tdaYRFhJ3YmRwlUaF/D0w1QOzzoOd37rLGotUuxk/77lV0=
X-Google-Smtp-Source: AMrXdXtTM7Dy68/NH6DmREbp71/PMaPYtZqnawZv47RuImPn4WcWxgnuik0Dea0dxlPa326/aqUXjOxQMEmVAFPIg5Y=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr3168431vso.73.1674428357060; Sun, 22
 Jan 2023 14:59:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 08:58:51 +1000
Message-ID: <CAKmqyKO-12sczsNdVsAov_nxhSazPM0HruXRzq034UvyMqQgAg@mail.gmail.com>
Subject: Re: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/include/asm/asm.h | 54 ++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/asm.h
>
> diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
> new file mode 100644
> index 0000000000..6d426ecea7
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/asm.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only) */
> +/*
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_ASM_H
> +#define _ASM_RISCV_ASM_H
> +
> +#ifdef __ASSEMBLY__
> +#define __ASM_STR(x)   x
> +#else
> +#define __ASM_STR(x)   #x
> +#endif
> +
> +#if __riscv_xlen == 64
> +#define __REG_SEL(a, b)        __ASM_STR(a)
> +#elif __riscv_xlen == 32
> +#define __REG_SEL(a, b)        __ASM_STR(b)
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +#define REG_L          __REG_SEL(ld, lw)
> +#define REG_S          __REG_SEL(sd, sw)
> +
> +#if __SIZEOF_POINTER__ == 8
> +#ifdef __ASSEMBLY__
> +#define RISCV_PTR              .dword
> +#else
> +#define RISCV_PTR              ".dword"
> +#endif
> +#elif __SIZEOF_POINTER__ == 4
> +#ifdef __ASSEMBLY__
> +#define RISCV_PTR              .word
> +#else
> +#define RISCV_PTR              ".word"
> +#endif
> +#else
> +#error "Unexpected __SIZEOF_POINTER__"
> +#endif
> +
> +#if (__SIZEOF_INT__ == 4)
> +#define RISCV_INT              __ASM_STR(.word)
> +#else
> +#error "Unexpected __SIZEOF_INT__"
> +#endif
> +
> +#if (__SIZEOF_SHORT__ == 2)
> +#define RISCV_SHORT            __ASM_STR(.half)
> +#else
> +#error "Unexpected __SIZEOF_SHORT__"
> +#endif
> +
> +#endif /* _ASM_RISCV_ASM_H */
> --
> 2.39.0
>
>

