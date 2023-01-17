Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09527670D1E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479976.744098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvEZ-00063S-Py; Tue, 17 Jan 2023 23:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479976.744098; Tue, 17 Jan 2023 23:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvEZ-00060f-N8; Tue, 17 Jan 2023 23:19:15 +0000
Received: by outflank-mailman (input) for mailman id 479976;
 Tue, 17 Jan 2023 23:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jq1=5O=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pHvEY-00060Z-09
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:19:14 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e283b4-96bd-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 00:19:12 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id b17so27610766pld.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 15:19:12 -0800 (PST)
Received: from localhost (ec2-13-57-97-131.us-west-1.compute.amazonaws.com.
 [13.57.97.131]) by smtp.gmail.com with ESMTPSA id
 17-20020a630211000000b0049f77341db3sm18049594pgc.42.2023.01.17.15.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:19:10 -0800 (PST)
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
X-Inumbo-ID: 59e283b4-96bd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7+tOmcqmrckRY4QYVvr7mpyl5qyA1jmpxRjK+JFMSE=;
        b=RfF50XXsNyG3J4oHe2FuELLjhnTz4qNlFBx5RtBf/mdMm4ZVDflbyFSA1iEqESX4aN
         yWZs/18wzDzJlszl5SfctuAePN7cXu0thfw33YHWPFQXpypWEz0qwRbMwdlBYb/VIhjE
         lLHofdy8H16CY2OxxThydElkZCgiFjn+XKXdj97Ph5ZbfO4PL18hXI9+kE2aVc92kKrc
         TwOfC3BR0ctNsXqthMTEaR6Dm93JJZyWJGU/vbsTyjbf9IErLrO1uBcuk6hB0MraKRz4
         Npfnu19q9CjpiMLLOIbr1OUqrhh2eFkG8iJ374D95qJI5pWWIJ7NC31FZl16jSwU7jto
         DZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7+tOmcqmrckRY4QYVvr7mpyl5qyA1jmpxRjK+JFMSE=;
        b=SNjB7Nn1oJ9AYUdb6Qs9DIJCCp4nivaFkd6el+jiQH0pXimEmr+fPiSuTxvQoTpMNU
         +dGu5gYO0YBCvlDgRSUm2Fbo77Xuvl6AgU+4/AH/o64yuL51h9OEc0wNg4qlX1vpKix2
         er2SdRZw0/yLBSpDSoKv0at07nLIHeI5ycB9usF9d7vceI2qXSdaRRlpAlcgyegGvhla
         D987wmUCLzPOzaCYfBy3FYx0II7ZMoKIycSiEr5348VRFj1WSZ7Zxtuaj9akuGJAbaTM
         ZBEYmn2i64egXNszSSrR2b/TXfLGHLv0dqFdH0j1wHphxeuxfOTh34Gn0upWJu6gZO+I
         2sWA==
X-Gm-Message-State: AFqh2kqmW7WZmfIsIoMLo5wK0OvMlTZboDB7G07cnNPS2rq7pYyIUDcv
	5q1oVnjz9GVcGt1wrmt7UrI=
X-Google-Smtp-Source: AMrXdXvIjeiNTjYbRqS4p4SffP+X7Wfpn6eztztcvcUEB/KQB4Vv2v3jy0yTtzMPf/Z/nm08aNsiQw==
X-Received: by 2002:a05:6a20:7528:b0:b0:3329:c395 with SMTP id r40-20020a056a20752800b000b03329c395mr25126574pzd.30.1673997551195;
        Tue, 17 Jan 2023 15:19:11 -0800 (PST)
Date: Tue, 17 Jan 2023 23:19:09 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v4 2/4] xen/riscv: introduce sbi call to putchar to
 console
Message-ID: <Y8cs7UVt1FH44k7I@bullseye>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>

On Mon, Jan 16, 2023 at 04:39:30PM +0200, Oleksii Kurochko wrote:
> From: Bobby Eshleman <bobby.eshleman@gmail.com>
> 
> Originally SBI implementation for Xen was introduced by
> Bobby Eshleman <bobby.eshleman@gmail.com> but it was removed
> all the stuff for simplicity  except SBI call for putting
> character to console.
> 
> The patch introduces sbi_putchar() SBI call which is necessary
> to implement initial early_printk.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>     - Nothing changed
> ---
> Changes in V3:
>     - update copyright's year
>     - rename definition of __CPU_SBI_H__ to __ASM_RISCV_SBI_H__
>     - fix identations
>     - change an author of the commit
> ---
> Changes in V2:
>     - add an explanatory comment about sbi_console_putchar() function.
>     - order the files alphabetically in Makefile
> ---
>  xen/arch/riscv/Makefile          |  1 +
>  xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>  xen/arch/riscv/sbi.c             | 45 ++++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/sbi.h
>  create mode 100644 xen/arch/riscv/sbi.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 5a67a3f493..fd916e1004 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_RISCV_64) += riscv64/
> +obj-y += sbi.o
>  obj-y += setup.o
>  
>  $(TARGET): $(TARGET)-syms
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> new file mode 100644
> index 0000000000..0e6820a4ed
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> +/*
> + * Copyright (c) 2021-2023 Vates SAS.
> + *
> + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Taken/modified from Xvisor project with the following copyright:
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef __ASM_RISCV_SBI_H__
> +#define __ASM_RISCV_SBI_H__
> +
> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
> +
> +struct sbiret {
> +    long error;
> +    long value;
> +};
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> +                        unsigned long arg0, unsigned long arg1,
> +                        unsigned long arg2, unsigned long arg3,
> +                        unsigned long arg4, unsigned long arg5);
> +
> +/**
> + * Writes given character to the console device.
> + *
> + * @param ch The data to be written to the console.
> + */
> +void sbi_console_putchar(int ch);
> +
> +#endif /* __ASM_RISCV_SBI_H__ */
> diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
> new file mode 100644
> index 0000000000..dc0eb44bc6
> --- /dev/null
> +++ b/xen/arch/riscv/sbi.c
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Taken and modified from the xvisor project with the copyright Copyright (c)
> + * 2019 Western Digital Corporation or its affiliates and author Anup Patel
> + * (anup.patel@wdc.com).
> + *
> + * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + * Copyright (c) 2021-2023 Vates SAS.
> + */
> +
> +#include <xen/errno.h>
> +#include <asm/sbi.h>
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
> +                        unsigned long arg0, unsigned long arg1,
> +                        unsigned long arg2, unsigned long arg3,
> +                        unsigned long arg4, unsigned long arg5)
> +{
> +    struct sbiret ret;
> +
> +    register unsigned long a0 asm ("a0") = arg0;
> +    register unsigned long a1 asm ("a1") = arg1;
> +    register unsigned long a2 asm ("a2") = arg2;
> +    register unsigned long a3 asm ("a3") = arg3;
> +    register unsigned long a4 asm ("a4") = arg4;
> +    register unsigned long a5 asm ("a5") = arg5;
> +    register unsigned long a6 asm ("a6") = fid;
> +    register unsigned long a7 asm ("a7") = ext;
> +
> +    asm volatile ("ecall"
> +              : "+r" (a0), "+r" (a1)
> +              : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
> +              : "memory");
> +    ret.error = a0;
> +    ret.value = a1;
> +
> +    return ret;
> +}
> +
> +void sbi_console_putchar(int ch)
> +{
> +    sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
> +}
> -- 
> 2.39.0
> 
> 

Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>

