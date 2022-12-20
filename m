Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AC66052F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 18:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472815.733190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDq43-0003MT-5W; Fri, 06 Jan 2023 16:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472815.733190; Fri, 06 Jan 2023 16:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDq43-0003KO-2p; Fri, 06 Jan 2023 16:59:31 +0000
Received: by outflank-mailman (input) for mailman id 472815;
 Fri, 06 Jan 2023 16:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnAh=5D=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pDq42-0003KI-73
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 16:59:30 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a40c5c8-8de3-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 17:59:27 +0100 (CET)
Received: by mail-pg1-x536.google.com with SMTP id v3so1536321pgh.4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 08:59:27 -0800 (PST)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 5-20020a621505000000b005772d55df03sm1366021pfv.35.2023.01.06.08.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 08:59:25 -0800 (PST)
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
X-Inumbo-ID: 7a40c5c8-8de3-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw2fjJMCegprkjtpBWjKKtwQO+Lc1SNHRh05H+6IcWk=;
        b=oy42dzreI1K2/czGG5RMStkjz3WM5r9ObUmxjgHNSRhFJi5T7LftO2BOVka5gAfwk4
         Id7aK311Fes10tyYVopdlU6zcsUtkC+I2UA723sjEoEnGfDA+6I2KeXPEGlQDQ4PrTJp
         Or7tv36dEbF+ikv0Yv9FKjo7zEKQK0duRVhVDqJFZzCwkQIUxeovv9LiNxKvkwQpJyEB
         NlbeQKJ06CkRp4sbLdU4xCRibVD4iq54UaEM9ZchxAQ9pmiuOOF/Fp4kLMbvaydCcMhV
         NcV+rKKF32N30iOo9VIlzfT1QnHbAVFvl8mvf7EHVikqRWlHn9+aQ1iyo7rj7Q3qSAuv
         QRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw2fjJMCegprkjtpBWjKKtwQO+Lc1SNHRh05H+6IcWk=;
        b=PzmB2xhripFXcFWhEGRKbWUz3knQaw1bXpONLyJsIZgr7gO5bJLs64pm8YzjyJfn7M
         uf0tHG0Vvx/Rexy2FMySfSKVIJiMEbEiwx5iMhXNRj66lqBBG7Fgr8mVlOkeO0v1v8H8
         25WFPWO3qup8dFHc3BlCKPQZycnBf+ZukOQqfSj6gPCvQ5oa9lsyeFC8Wh708uTNb8mW
         fvaQijkrr6M+GXQ1LnOgPuL/rzERFkl3/BqBFIbmwVHDlEeWbugbkAetXV9C26QkUt/4
         +MRvnfh7XpsjiYsPaIsckGvaUbQa4lqaj+U+Z+ASkhebrKcasUukTo9/TR8E5/E44vTe
         f78A==
X-Gm-Message-State: AFqh2kpjzypgMMNj02yp7rhEgA80MYyTc9dM/ZkP/JMfZ2jcZdlhgFHM
	QYYP6UWaVST6fJiunQpiess=
X-Google-Smtp-Source: AMrXdXtOGTNbjH3A3XUDHxWC8R10zSMyAYt2FDPQRFBwCu6VlK9Tb4xRLCIxxecja0y+hqDRmg2czw==
X-Received: by 2002:a62:1c95:0:b0:583:3adc:baed with SMTP id c143-20020a621c95000000b005833adcbaedmr4356405pfc.8.1673024365828;
        Fri, 06 Jan 2023 08:59:25 -0800 (PST)
Date: Tue, 20 Dec 2022 06:23:07 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Message-ID: <Y6FUy/F0mbrvRP3e@bullseye>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>

On Fri, Jan 06, 2023 at 03:14:25PM +0200, Oleksii Kurochko wrote:
> The patch introduce sbi_putchar() SBI call which is necessary
> to implement initial early_printk
> 

I think that it might be wise to start off with an alternative to
sbi_putchar() since it is already planned for deprecation. I realize
that this will require rework, but it is almost guaranteed that
early_printk() will break on future SBI implementations if using this
SBI call. IIRC, Xen/ARM's early printk looked like a reasonable analogy
for how it could work on RISC-V, IMHO.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/Makefile          |  1 +
>  xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>  xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/sbi.h
>  create mode 100644 xen/arch/riscv/sbi.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 5a67a3f493..60db415654 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += setup.o
> +obj-y += sbi.o
>  
>  $(TARGET): $(TARGET)-syms
>  	$(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> new file mode 100644
> index 0000000000..34b53f8eaf
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> +/*
> + * Copyright (c) 2021 Vates SAS.
> + *
> + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Taken/modified from Xvisor project with the following copyright:
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef __CPU_SBI_H__
> +#define __CPU_SBI_H__
> +
> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
> +
> +struct sbiret {
> +    long error;
> +    long value;
> +};
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
> +        unsigned long arg1, unsigned long arg2,
> +        unsigned long arg3, unsigned long arg4,
> +        unsigned long arg5);
> +
> +/**
> + * Writes given character to the console device.
> + *
> + * @param ch The data to be written to the console.
> + */
> +void sbi_console_putchar(int ch);
> +
> +#endif // __CPU_SBI_H__
> diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
> new file mode 100644
> index 0000000000..67cf5dd982
> --- /dev/null
> +++ b/xen/arch/riscv/sbi.c
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Taken and modified from the xvisor project with the copyright Copyright (c)
> + * 2019 Western Digital Corporation or its affiliates and author Anup Patel
> + * (anup.patel@wdc.com).
> + *
> + * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + * Copyright (c) 2021 Vates SAS.
> + */
> +
> +#include <xen/errno.h>
> +#include <asm/sbi.h>
> +
> +struct sbiret sbi_ecall(unsigned long ext, unsigned long fid, unsigned long arg0,
> +            unsigned long arg1, unsigned long arg2,
> +            unsigned long arg3, unsigned long arg4,
> +            unsigned long arg5)
> +{
> +    struct sbiret ret;
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
> 2.38.1
> 
> 

