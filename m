Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D567736D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482567.748138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjia-0008Tj-U4; Sun, 22 Jan 2023 23:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482567.748138; Sun, 22 Jan 2023 23:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjia-0008R4-Ql; Sun, 22 Jan 2023 23:25:44 +0000
Received: by outflank-mailman (input) for mailman id 482567;
 Sun, 22 Jan 2023 23:25:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjiZ-0007r1-E7
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 23:25:43 +0000
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [2607:f8b0:4864:20::a2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 159eb004-9aac-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 00:25:41 +0100 (CET)
Received: by mail-vk1-xa2e.google.com with SMTP id q21so5202335vka.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 15:25:41 -0800 (PST)
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
X-Inumbo-ID: 159eb004-9aac-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQCMO+h9luRtEvxhZm1NWv7DavsDk1AG0uqhUeOSCyE=;
        b=F0Z2jq8wesOUoitKdR7/eXt5olmvuLKT1uNszZWMhRZKYf85rw2D2CwMld1JLTjw41
         esnk9W/aOrJr6+evdlamNZqzFjS+ugrynP7hT7CQaOzlJJzzd1ROemtYZTcaMq2od0wW
         x1AmdFAD6sMWSxjek33zcYsCVyG9JaIa/NFuThzIv+7N8uJBjmx/ydw8lpO9XApeq6/l
         ao6pOXB5RKPewI5TXAc5xd/B7b06qWzBCWFL7QM6J90M3DI83eReVFcEBBwC8aIjEIu/
         xpEnTaXulVizG3oKLPttDC3WCmL0npOd/OTvGCEGW2q1C6WKxNw34rE0qetvzHpn6ONR
         z6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQCMO+h9luRtEvxhZm1NWv7DavsDk1AG0uqhUeOSCyE=;
        b=7HudZnGASvzqPgKi2Wyw8GCbvoqczs4j96iqald/db/TOWbAvB+14SiN/Z7jedHq8b
         tXDc6OpeUZnzD5jZRvKUYHc9o8C3fGvZnu1c4+XfV+wyWx4HZzpHThLdz5gYgSKNmRjC
         IaIUXQaVgsjzHd4F0P2lFeC27MhaMwzygl6t+tH0HdB12fgE4tnbkqlpxl+nXsncLpZW
         ffToNNZGqGNXWBYQhvXvkzgEAcNKpPHO9vdXQms8cwkOmzTGMN6YFQIV2qKhLiK+myIO
         9/WjYhftXOZRVgjYexrAupgfXTthW+WhIrlgavCbIsScDdUIYIrWXoRMMZyTkIHn/Rzl
         Mw9w==
X-Gm-Message-State: AFqh2kqhpFb0o9iVO97l2S6Go3ugjldurTEa/dYKzvW3SDAMifsXKrZN
	oI3+IvETdK5zp2RPcANV0XHHUP5WcJ9CAVdM/BQ=
X-Google-Smtp-Source: AMrXdXvw7/nT3eTQLnlD9QzDkEy4SMgY05ijXH7o2bg3rjvO2TtRYIrQYp9Bqu/gzBifGAQCwJbsksSQVHK2WUITTGY=
X-Received: by 2002:a1f:2c0c:0:b0:3e1:7e08:a117 with SMTP id
 s12-20020a1f2c0c000000b003e17e08a117mr2961220vks.34.1674429940147; Sun, 22
 Jan 2023 15:25:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:25:14 +1000
Message-ID: <CAKmqyKOmAg9D0r-k6Z3VoVSTynY58z0GUb+oCrkzi_Q9HZju_w@mail.gmail.com>
Subject: Re: [PATCH v1 04/14] xen/riscv: add <asm/csr.h> header
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
>  xen/arch/riscv/include/asm/csr.h | 82 ++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/csr.h
>
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> new file mode 100644
> index 0000000000..1a879c6c4d
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -0,0 +1,82 @@
> +/*
> + * Take from Linux.
> + *
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
> +#define csr_read(csr)                                          \
> +({                                                             \
> +       register unsigned long __v;                             \
> +       __asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)        \
> +                             : "=r" (__v) :                    \
> +                             : "memory");                      \
> +       __v;                                                    \
> +})
> +
> +#define csr_write(csr, val)                                    \
> +({                                                             \
> +       unsigned long __v = (unsigned long)(val);               \
> +       __asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"     \
> +                             : : "rK" (__v)                    \
> +                             : "memory");                      \
> +})
> +
> +/*
> +#define csr_swap(csr, val)                                     \
> +({                                                             \
> +       unsigned long __v = (unsigned long)(val);               \
> +       __asm__ __volatile__ ("csrrw %0, " __ASM_STR(csr) ", %1"\
> +                             : "=r" (__v) : "rK" (__v)         \
> +                             : "memory");                      \
> +       __v;                                                    \
> +})
> +
> +#define csr_read_set(csr, val)                                 \
> +({                                                             \
> +       unsigned long __v = (unsigned long)(val);               \
> +       __asm__ __volatile__ ("csrrs %0, " __ASM_STR(csr) ", %1"\
> +                             : "=r" (__v) : "rK" (__v)         \
> +                             : "memory");                      \
> +       __v;                                                    \
> +})
> +
> +#define csr_set(csr, val)                                      \
> +({                                                             \
> +       unsigned long __v = (unsigned long)(val);               \
> +       __asm__ __volatile__ ("csrs " __ASM_STR(csr) ", %0"     \
> +                             : : "rK" (__v)                    \
> +                             : "memory");                      \
> +})
> +
> +#define csr_read_clear(csr, val)                               \
> +({                                                             \
> +       unsigned long __v = (unsigned long)(val);               \
> +       __asm__ __volatile__ ("csrrc %0, " __ASM_STR(csr) ", %1"\
> +                             : "=r" (__v) : "rK" (__v)         \
> +                             : "memory");                      \
> +       __v;                                                    \
> +})
> +
> +#define csr_clear(csr, val)                                    \
> +({                                                             \
> +       unsigned long __v = (unsigned long)(val);               \
> +       __asm__ __volatile__ ("csrc " __ASM_STR(csr) ", %0"     \
> +                             : : "rK" (__v)                    \
> +                             : "memory");                      \
> +})
> +*/
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_CSR_H */
> --
> 2.39.0
>
>

