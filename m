Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57C6BD48E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 16:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510694.788870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcq0u-00075w-AX; Thu, 16 Mar 2023 15:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510694.788870; Thu, 16 Mar 2023 15:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcq0u-00073B-5x; Thu, 16 Mar 2023 15:59:36 +0000
Received: by outflank-mailman (input) for mailman id 510694;
 Thu, 16 Mar 2023 15:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbW7=7I=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pcq0s-0006jS-TL
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 15:59:35 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a097c8e-c413-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 16:59:33 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id c18so2213842ple.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 08:59:33 -0700 (PDT)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 ku13-20020a170903288d00b0019acd3151d0sm5802066plb.114.2023.03.16.08.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 08:59:30 -0700 (PDT)
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
X-Inumbo-ID: 8a097c8e-c413-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678982371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bqDfKicuI+A2UUV1jagP4jhJiEUzL1WG0Bvj6Fidetc=;
        b=fUS1ngSX+r0K3xEn0kEQSOUWksLvFbSwJcPA/gPJn71v+fpmscoWZ0fdmktOeBL1Rk
         M6Vbi3BaJb7pmskAwg8PFjRNsDnDo1jiUePOSijAnt7HiYEmBd51JSwTEENmLXmNHSPX
         BxnZHFPSMwoTs4cl6/wHdfXx/IabT4FGDGHuSExfvm1lnSztplMIoO27FWgNwVAFKIl8
         QVgHkrZe/J9xKis6w4snu6THU2csVse5LprdDDEQ0fBQzjOwqeWT+h1iFeqN7wbYzwwY
         dXXRVl8kc9YuCvXzEDEQrP2tXncvvDbgTZHE6oOzHySlHHQS8fGXL7WVeYdf4J15GH5T
         KyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678982371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqDfKicuI+A2UUV1jagP4jhJiEUzL1WG0Bvj6Fidetc=;
        b=t9s7cIzfhB+B5e2OBzy0kBB4TVhhSxqgAC5kiPtIELF1EA5HSKq9cTj8zqrLT/6F1G
         WwEh7NXJfpV/aSkBtbUv6QoHOW+Vlj2IG4H0tCFh4iQHsh07IHQG83ebPwh2pLvs1LZN
         T4DKL2/zrZu/5/h9q6jk348v561dBaKiUQ0TMtZx9/bCw9LbLcDpgFDCmDx3Im6z7k1Y
         A1n37+iBvyMC7VpBKg4PwWCkzwguzaSQfbQ09mN8BPwTzXPeEFwlq38MuXYEeKI4iI9J
         btYyf1jeCFf8kFcyhes0u/JcJFpbwFMfofcX7lM9aOnUyglWTHaaXswNrl5GJc1P47Ng
         6JvA==
X-Gm-Message-State: AO0yUKXrwUh5FkDw/gL1sH8wWZLFZRul/IjPeTXXQfszTCsQkM8rcArx
	nSL8viRbAIJu7IoRRakedsg=
X-Google-Smtp-Source: AK7set9cpybDcgMX7QVM1DdxpbvCqk1GbN+kKRcWFdt66O1/C09ZcTWDmS0W+t10chwH+x79SVtM7A==
X-Received: by 2002:a17:902:f28d:b0:1a0:53b8:907f with SMTP id k13-20020a170902f28d00b001a053b8907fmr2901287plc.17.1678982371012;
        Thu, 16 Mar 2023 08:59:31 -0700 (PDT)
Date: Thu, 9 Mar 2023 10:48:50 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: initialize .bss section
Message-ID: <ZAm5kkOnOi8LiyLj@bullseye>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>

On Fri, Mar 03, 2023 at 12:24:24PM +0200, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/riscv64/head.S | 9 +++++++++
>  xen/arch/riscv/setup.c        | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index adf5d6c74a..8887f0cbd4 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,3 +1,4 @@
> +#include <asm/asm.h>
>  #include <asm/riscv_encoding.h>
>  
>          .section .text.header, "ax", %progbits
> @@ -18,6 +19,14 @@ ENTRY(start)
>          li      t0, SSTATUS_FS
>          csrc    CSR_SSTATUS, t0
>  
> +        /* Clear the BSS */
> +        la      t3, __bss_start
> +        la      t4, __bss_end
> +.L_clear_bss:
> +        REG_S   zero, (t3)
> +        add     t3, t3, __SIZEOF_POINTER__
> +        bltu    t3, t4, .L_clear_bss
> +
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index d9723fe1c0..929565720b 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -7,6 +7,14 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> +/*  
> + * To be sure that .bss isn't zero. It will simplify code of
> + * .bss initialization.
> + * TODO:
> + *   To be deleted when the first real .bss user appears
> + */
> +int dummy_bss __attribute__((unused));
> +
>  void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 unsigned long dtb_base)
>  {
> -- 
> 2.39.0
> 
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@gmail.com>

