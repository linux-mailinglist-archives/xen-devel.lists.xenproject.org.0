Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BB680ED8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 14:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486987.754449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUBs-000161-JX; Mon, 30 Jan 2023 13:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486987.754449; Mon, 30 Jan 2023 13:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUBs-00013g-Gu; Mon, 30 Jan 2023 13:27:20 +0000
Received: by outflank-mailman (input) for mailman id 486987;
 Mon, 30 Jan 2023 13:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65dI=53=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMUBq-00013X-5E
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 13:27:18 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdf448d9-a0a1-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 14:27:13 +0100 (CET)
Received: by mail-vs1-xe2d.google.com with SMTP id a24so10334066vsl.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 05:27:14 -0800 (PST)
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
X-Inumbo-ID: cdf448d9-a0a1-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agbH+6v2SExuB14vIduPjdZUjlX1wZOZ1Bw5ItVJ5b4=;
        b=bIXKBUP02iceG1guIX5N4Wj/4r5rnFF3JBIhYD+ZnvGc4VXqwSIDlwiEJQcLnKW/6R
         G6YUSjC3YfDS7QghwnaQ5XPswd43a0nsu39Po19PxmJB/4ctJBFFdRqnLd+Fi+kfjsRv
         NGwov6e+Wi7jSDtUu5uVyIjxnDeVbxBVRVeaY3amNFfAaCbKipXPGlw4zCfpCzDYZxDQ
         Q2dR9pu7WHwYBYF3Z+PnmkKEIAymm4vnSdQGHPTHbFCWCM5To6WJKbd2MtCyh6hgyiPa
         EHsxoGdyitQ+/Z3iDmLpPlxq6FvxKmqm1tiMidl3BhwjFZo6BSLBzwviJM6yehh3uP8U
         STLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agbH+6v2SExuB14vIduPjdZUjlX1wZOZ1Bw5ItVJ5b4=;
        b=bPXmlc01QH2qqGLalM7rIl3u5IS/vyzKvrA7kMMwlAWM9kOZ57X9BAqGkkeE+8bZY3
         9cXcuyR+CNMg1ZVILXwwSwCpRux0tSMGtSFaI8dzDg3Dg0DaDUJ7T29SEngmByK7y9jl
         Tzokdh3vnFSIPQq9qOk5fzKaaKKG/9fryyzdwGGo3F0U/8x59RJZ2eRDQX6jmvBnD2EF
         6B5Nhq4ABjjGNB7f62Kgi4paIAVFTGxqkt5mWiHnXXKKgVPD75/esb61JwJ+qVIHQxKT
         SLjrGHIo+y5FcoGvD3YDDAhxoa5MrF6Fn1EOycS5ihev8Exo1BFV7oFWpfqdH7LbPXJ9
         S6Dg==
X-Gm-Message-State: AFqh2kqCaxMDgFVenXjHBPgSSl/p0RpOjY28ov0f8D0XuO8Mwh5fjzff
	cXp5ra71n2MO9GrvIkrw1ZyzWzl4JEYc10EOxaACopVcG3M=
X-Google-Smtp-Source: AMrXdXvbACkNYSaynJM2vpibMdSwJyV5GYDa4t1EYLKPOY1AdHeSeMFXzGmg6SRA+BMVxsKxbP09XYv/VecxRU59VN0=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr6615300vst.54.1675085233465; Mon, 30
 Jan 2023 05:27:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674818705.git.oleksii.kurochko@gmail.com> <b26d981f189adad8af4560fcc10360da02df97a9.1674818705.git.oleksii.kurochko@gmail.com>
In-Reply-To: <b26d981f189adad8af4560fcc10360da02df97a9.1674818705.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jan 2023 23:26:47 +1000
Message-ID: <CAKmqyKNjsxZPZDeZwbOaOAdS2F8H5U+imEdd1p9ro_J15gBw7g@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] xen/riscv: add <asm/csr.h> header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 28, 2023 at 12:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The following changes were made in comparison with <asm/csr.h> from
> Linux:
>   * remove all defines as they are defined in riscv_encoding.h
>   * leave only csr_* macros
>
> Origin: https://github.com/torvalds/linux.git 2475bf0250de
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>   - Minor refactoring mentioned in the commit message, switch tabs to
>     spaces and refactor things around __asm__ __volatile__.
>   - Update the commit message and add "Origin:" tag.
> ---
>  xen/arch/riscv/include/asm/csr.h | 84 ++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/csr.h
>
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> new file mode 100644
> index 0000000000..4275cf6515
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -0,0 +1,84 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_CSR_H
> +#define _ASM_RISCV_CSR_H
> +
> +#include <asm/asm.h>
> +#include <xen/const.h>
> +#include <asm/riscv_encoding.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#define csr_read(csr)                                           \
> +({                                                              \
> +    register unsigned long __v;                                 \
> +    __asm__ __volatile__ (  "csrr %0, " __ASM_STR(csr)          \
> +                            : "=r" (__v)                        \
> +                            : : "memory" );                     \
> +    __v;                                                        \
> +})
> +
> +#define csr_write(csr, val)                                     \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrw " __ASM_STR(csr) ", %0"       \
> +                            : /* no outputs */                  \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +})
> +
> +#define csr_swap(csr, val)                                      \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrrw %0, " __ASM_STR(csr) ", %1"  \
> +                            : "=r" (__v)                        \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +    __v;                                                        \
> +})
> +
> +#define csr_read_set(csr, val)                                  \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrrs %0, " __ASM_STR(csr) ", %1"  \
> +                            : "=r" (__v)                        \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +    __v;                                                        \
> +})
> +
> +#define csr_set(csr, val)                                       \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrs " __ASM_STR(csr) ", %0"       \
> +                            : /* no outputs */                  \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +})
> +
> +#define csr_read_clear(csr, val)                                \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrrc %0, " __ASM_STR(csr) ", %1"  \
> +                            : "=r" (__v)                        \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +    __v;                                                        \
> +})
> +
> +#define csr_clear(csr, val)                                     \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrc " __ASM_STR(csr) ", %0"       \
> +                            : /*no outputs */                   \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +})
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_CSR_H */
> --
> 2.39.0
>
>

