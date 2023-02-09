Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33F68FC33
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 01:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492069.761470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvAI-0006ET-3m; Thu, 09 Feb 2023 00:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492069.761470; Thu, 09 Feb 2023 00:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvAI-0006Bs-05; Thu, 09 Feb 2023 00:51:54 +0000
Received: by outflank-mailman (input) for mailman id 492069;
 Thu, 09 Feb 2023 00:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pPvAG-0006Bm-1i
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 00:51:52 +0000
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [2607:f8b0:4864:20::92b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef9b2998-a813-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 01:51:50 +0100 (CET)
Received: by mail-ua1-x92b.google.com with SMTP id g12so103455uae.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 16:51:50 -0800 (PST)
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
X-Inumbo-ID: ef9b2998-a813-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7+TV0fkdU6X12b+A1wHLdsyQQ3x519TYuYkm7fw8epo=;
        b=F640WW24qGDF927dHX9hxDpuNvh6Jwjm1ZgmjdspD5c91LaDHUmbf+/ZcZ1feuXHn9
         xRZwoE/TOPybU04wVFLZKxmEEm+jGtstRRWpqNDAi5F1DLfM/nPY1IjHHspYYlu9MOrL
         1Bl1OlI6xC1SPXdo3i0XlifZA6t87KbE/MNxXWZbbHNaQ+x6OMFp2jtOlgV6vEL0Mh+I
         S7QiwUtKkgxSr+CbNNJzE57Am/EG790mXEFaJBntQ4ySNuHQ3fwM8xNyARVGj9XRe2ot
         oyZO16r3m2KrGu2Fg3lFkfIsat6X+1B70Mde5VyQTXpB3Emet8dPx9r5vKZtOet9gaQn
         A1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+TV0fkdU6X12b+A1wHLdsyQQ3x519TYuYkm7fw8epo=;
        b=p9SQPzXaAkKnpsrEBrPIcrK1Fz32m9GJyJO7jFBqP6Beq3ayLxCie9mLWUxWtgcAbt
         VgFDo1sNJ0V6GOpOXFN8lVPnkw5/VIMh3I8Hqc3C1S22yQAS+NgKdRl01mWa72QNRUZb
         GZ7b7wGmDoeArifYs1WSjxVsg/4YEF5vfn3YOwejdfxWUuAy8dt6E7BDYuv1xZ54FUtN
         g8Mmekrb2i11Dbn6mfr+wOfibMICvfBYIESd7WhZuiHfCMcSqZFcbLEA6gDH8GBvSJIb
         mAGn+7NM1GPfKVFLPxAPG3EX0/lMl+OCwLmPU0MetL08rVZUvhXY0LlOaz8ZT5IJ5GQp
         455g==
X-Gm-Message-State: AO0yUKX8F1ZCZt8Sa3abetCaEi1hd931Z0wIrW1S3QZqMEykBcDwD4tG
	EsWazuF+9I5heW2oXv4jWtZPNkG8eacwlRnOh28=
X-Google-Smtp-Source: AK7set9oXcpHFuYqPseZ3dfpPssveaEQDjouxGdGICfE76lTfgbxBUr9TeFv/b0p5Buf8TqO6rp+2EC3ofbwblbYOHw=
X-Received: by 2002:ab0:2401:0:b0:683:8d8f:2671 with SMTP id
 f1-20020ab02401000000b006838d8f2671mr2506358uan.24.1675903909094; Wed, 08 Feb
 2023 16:51:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <0c7192216497663865fa220c95301c357a846568.1675779308.git.oleksii.kurochko@gmail.com>
In-Reply-To: <0c7192216497663865fa220c95301c357a846568.1675779308.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:51:23 +1000
Message-ID: <CAKmqyKNgHRurgNV5WNx2Lr9kavP25+N9e6q08-LF5vd6cjRWxA@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] xen/riscv: add <asm/asm.h> header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>   - Nothing changed
> ---
> Changes in V2:
>   - Nothing changed
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

