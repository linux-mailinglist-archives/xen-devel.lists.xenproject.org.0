Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307296BD458
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 16:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510684.788830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpsO-0004jt-HV; Thu, 16 Mar 2023 15:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510684.788830; Thu, 16 Mar 2023 15:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpsO-0004hK-ET; Thu, 16 Mar 2023 15:50:48 +0000
Received: by outflank-mailman (input) for mailman id 510684;
 Thu, 16 Mar 2023 15:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbW7=7I=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pcpsN-0004hE-FZ
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 15:50:47 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f950fd2-c412-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 16:50:45 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so2042906pjb.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 08:50:45 -0700 (PDT)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a631103000000b00502ecb91940sm5341065pgl.55.2023.03.16.08.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 08:50:42 -0700 (PDT)
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
X-Inumbo-ID: 4f950fd2-c412-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678981843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb5qGTl6aSkFsxWcvkop6l4a/S7eBQjhAOxEjj4dDbs=;
        b=I2dAn9pe37LmtA7qMzHzvRwfZlz8tUxPA5wp8Dov/WryYu3Aa01ZvPesAPAOO6NrXs
         mV7lnZaDESsxyBR16K7qzlAwD7xwCmUo6Nvy+ZtfBQdr3NWjnMYmevEai7SSde0JIXuL
         aVjssjULt65ccY9TeLpgouaCULUaGgdmGX/PafPoo+UhchOdxq+C6Uno+XTqByagTdZ0
         rja9xnOMr50UvTJJO7zqNGwjxFvdLrw/SazkmjQkmdWrcGoiM+0ZzG3dlY5QqEu+fMP8
         cd6jEftudOhqFhtmgWQO/KO1v5A8vCY8c/apXcEf64wMit/gJmlymQIPL4vGm1Y/MVwA
         1qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678981843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zb5qGTl6aSkFsxWcvkop6l4a/S7eBQjhAOxEjj4dDbs=;
        b=HrvyIK+vonUsCdddNB3xBw15rI5kogYFSfHiSulwE5Pi7Nn//8wDksZ3H30io+Sg0d
         F+m2ryDcccqIkpUjj8s8wSoINuqD0J1QSbCevnteC5KLN9vUbUqJa3ilHGqUKKLJsrB9
         71BcNyKGdkxdVhbVg49MTgA1ySP/vPMmCgJW2s4y5QfrEbkZ+NA/yY/4x4Bv/RAuWpvP
         C/l+JvB0tZkDMPy6vf4NUwDMwnDg31iydScr6j7Pwr5DlrNzrlCdrOLI9+6Wb8TF0PzJ
         AdUR/oxMnX3fP+/Wwwjuday8qBNKBefNptygTqE3OcZsmsvgMenXLwMqrJVZ7dk+lq9O
         A86w==
X-Gm-Message-State: AO0yUKUi5Dm6TPaYwa06NnZc66GfagIalliBBK+o6JGnAq84X3J13C94
	2r2DEtivSgCuni4WbP+IeDg=
X-Google-Smtp-Source: AK7set+ygFijG98UokCphYKZ8xGszxZu25m0//Zdx4H4IfdFxfYURwpK349ao/TBRn7NkzsmTehiKA==
X-Received: by 2002:a05:6a20:1e46:b0:cd:9b0:b287 with SMTP id cy6-20020a056a201e4600b000cd09b0b287mr3462354pzb.24.1678981843448;
        Thu, 16 Mar 2023 08:50:43 -0700 (PDT)
Date: Thu, 9 Mar 2023 10:39:18 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: disable fpu
Message-ID: <ZAm3Vj7KtpkJOjRS@bullseye>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>

On Fri, Mar 03, 2023 at 12:24:22PM +0200, Oleksii Kurochko wrote:
> Disable FPU to detect illegal usage of floating point in kernel
> space.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/riscv64/head.S | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index ffd95f9f89..52fa41c778 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -6,6 +6,13 @@ ENTRY(start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> +        /*
> +         * Disable FPU to detect illegal usage of
> +         * floating point in kernel space
> +         */
> +        li      t0, SSTATUS_FS
> +        csrc    CSR_SSTATUS, t0
> +
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
> -- 
> 2.39.0
> 
> 

Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

