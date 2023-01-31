Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42613682109
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 01:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487296.754907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMeqR-0002Tu-Ci; Tue, 31 Jan 2023 00:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487296.754907; Tue, 31 Jan 2023 00:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMeqR-0002S6-9X; Tue, 31 Jan 2023 00:49:55 +0000
Received: by outflank-mailman (input) for mailman id 487296;
 Tue, 31 Jan 2023 00:49:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMeqP-0001Qz-DX
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 00:49:53 +0000
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b429fbb-a101-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 01:49:51 +0100 (CET)
Received: by mail-vk1-xa30.google.com with SMTP id l20so6626283vkm.11
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 16:49:51 -0800 (PST)
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
X-Inumbo-ID: 2b429fbb-a101-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PELe0C7W8pESvdkoWYjveyfeaJy0mj9fdSjjtua1pX4=;
        b=DzIGKZugqcW4K4Czi1TskR59zyooLT5XsWRNp7uNNOUfal7mCgX61bA8Ezp9xfEM6t
         h+HQM9ADbvrbMH0f+qltjGVB+ed8h6nKceoZwwkRmCodsP0zdwz8MCb8dYUevIf+mq3U
         Vei2scVbEoeZzSTOf9l803QAjxt7bmnw/9+wsmrphmoEO/MqeLInfgDt1HtJ3z0awrR4
         Z4SDsyjISE+6PqHE84ZU272TgqNYc/cbQAgOOVkm5WZt9aQQUqOFkQtuBT8AaMuWhXSI
         RJ3YdcbEXynYfdRvZ51DP7//QGbNvh2o6PTtzakAbYLED9/borgWmDh3YJN7vGjY7rVy
         GR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PELe0C7W8pESvdkoWYjveyfeaJy0mj9fdSjjtua1pX4=;
        b=AVoxPLkDn4pbhTPLkvTsbaP7jCoMxOkXRW+yo1aFJDRUb2Io1/QXFuZ9AJKZZOBzSR
         n3g+qmHc4kg8XoLFH4GqWlyDgIYVoq9ErrePIgZjDAeYhrUZWMeaYpBAJmj1S2wI9wCw
         JTfG6Otgd/1ewcVp4znPzb6WDm/TUasxXercc1QT58HKnluT3YqKQIYGz4RzLk0KlwuR
         BAQmCLggnNy9/spqQjUPwJHqbaiSWjXGQSZ6kpHoQ4gbUVn1j04hnm8usP/HBX/zOMca
         De9CRmypZIwbvwB+fjyJMwiE0vjApDS+HAaY1+QqEVi5UgiLUvuWRuMNkPB7t45KY0jS
         gXrw==
X-Gm-Message-State: AO0yUKWRBxFH+tlzZUSH+HZwhd/ufe7BO/h7olXPR2F7wFqILIQ+yPHY
	1c7Y4ldpUziuLFtb5yEE58JhIjQL1CDZlDXYiZc=
X-Google-Smtp-Source: AK7set8ut3MFmooQ/16CmmO6+L6quSLvLobLcHFVGnpbvybRrbnk5MC320w/qSFM3Hnkpnr4mtt43BofShFsWMYoDJ0=
X-Received: by 2002:a1f:1c0b:0:b0:3ea:3dee:4545 with SMTP id
 c11-20020a1f1c0b000000b003ea3dee4545mr801979vkc.26.1675126190656; Mon, 30 Jan
 2023 16:49:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674818705.git.oleksii.kurochko@gmail.com> <9a098db8e3fef97df987b2a7330333b51a21cb8c.1674818705.git.oleksii.kurochko@gmail.com>
In-Reply-To: <9a098db8e3fef97df987b2a7330333b51a21cb8c.1674818705.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 10:49:24 +1000
Message-ID: <CAKmqyKO9VWtUza7EdgWDKq2BDEz9=+zmWrJwMcrakDTJ_APbjQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] xen/riscv: add <asm/asm.h> header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 27, 2023 at 11:59 PM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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

