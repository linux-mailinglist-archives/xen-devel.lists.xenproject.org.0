Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06076BD46E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 16:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510689.788850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpxA-0005sz-C7; Thu, 16 Mar 2023 15:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510689.788850; Thu, 16 Mar 2023 15:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpxA-0005q4-8s; Thu, 16 Mar 2023 15:55:44 +0000
Received: by outflank-mailman (input) for mailman id 510689;
 Thu, 16 Mar 2023 15:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbW7=7I=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pcpx8-0005pt-IG
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 15:55:42 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffaee903-c412-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 16:55:40 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id ja10so2226505plb.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 08:55:40 -0700 (PDT)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa787c6000000b00625f5aaa1d9sm1505628pfo.83.2023.03.16.08.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 08:55:38 -0700 (PDT)
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
X-Inumbo-ID: ffaee903-c412-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678982139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKL34Xqt4xY7ZISRahgSxHiYWvle8IcTwtJOw2t/yO4=;
        b=JtntGSx33/xC4I/zU++edcwMqhx7v5w22QgHer9Q2srqPfWeOi2rNKGJsNcZ7bit5C
         o4SkvIxe3Gk5kdmitOzt37hEa6SpCAExtKleOS7aN3H5FdWS/YEkcAw2anC2jIxO+fKf
         rEhv5GKuKO6VW5r/ZCWUrObeOffm3nd23at1o4r5HrAznmjC48+YW3aHbUPaghY4/PKA
         O0FF7m9Yy+tAOO26C2b71cxLhEXIWyYz7N0z7ED24P3a9YbjBZSu+HwEpjGDJezOXi/Q
         Vq3gmTbu+BHeDFkgFtLyl5yBpjkRBru+G0uFXHw3vC0m+Laom9bAkYr5/o8NUiYpXCXU
         96ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678982139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKL34Xqt4xY7ZISRahgSxHiYWvle8IcTwtJOw2t/yO4=;
        b=fJYIiCb4TrbLJwkyjtGbIsw3IZH9esn6dDDdHyw9j+VXGtR23FXy75xy0j/Vdj13tY
         eWCHEvMdDSJweN7twT/7T0EUALXe4yNLjv/AhuGveRhFfgNkCQ+858I2r8HCwXPBYqVm
         Z0nWgf8v/l9OXbfypTakiKHsd2y4ltKyzM7oa45ixaNboEZ3SB3+vF8vN0tz4CRVpp1Z
         wEunv+DUVaeFBOU9Cp7KheIngPyvnfBpoktIg/b7zNQD3IL7ywZJ/EbAg2PjNd+y07Ha
         7CXUjvqnXSi6RyO88pJV+T+oBpfEkjSZU4n1dKO9w7v7Zuz8zSdhW5iIo19nPjqU8xoH
         yTJQ==
X-Gm-Message-State: AO0yUKXqsKcZdul1F1EXITLQHckCCH9hq3R7etZlla4liyr7qqRjCuRf
	dFoipK9CtutZPmt1XaUA2LBRnSHQyVGTYA==
X-Google-Smtp-Source: AK7set+z1BZpC/bQpMEMMxpK1gRiogFcBIckK81DyBrJxl1Ia56K3bGNKAUklueFWNaFzIFB2jq8yg==
X-Received: by 2002:a05:6a20:3d92:b0:cc:ca9:4fde with SMTP id s18-20020a056a203d9200b000cc0ca94fdemr5462998pzi.33.1678982138959;
        Thu, 16 Mar 2023 08:55:38 -0700 (PDT)
Date: Thu, 9 Mar 2023 10:44:38 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v3 2/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
Message-ID: <ZAm4lurJxfMeEmxt@bullseye>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <43aaa58fac47029b7d11f1d80d310786d7a078a6.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43aaa58fac47029b7d11f1d80d310786d7a078a6.1677838213.git.oleksii.kurochko@gmail.com>

On Fri, Mar 03, 2023 at 12:24:23PM +0200, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v2:
>  * Add the comment for start() function with the explanation what and
>    how OpenSBI pass to start() function.
>  * Clean up start() code related to read&save hart_id & dtb_base.  
> ---
> Changes since v1:
>  * read/save/pass of hart_id and  dtb_base passed by a bootloader
>    were moved to head.S. 
>  * Update start_xen() to recieve hard_id & dtb_base
> ---
>  xen/arch/riscv/riscv64/head.S | 5 +++++
>  xen/arch/riscv/setup.c        | 3 ++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 52fa41c778..adf5d6c74a 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -2,6 +2,11 @@
>  
>          .section .text.header, "ax", %progbits
>  
> +        /*
> +         * OpenSBI pass to start():
> +         *   a0 -> hart_id ( bootcpu_id )
> +         *   a1 -> dtb_base 
> +         */
>  ENTRY(start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 1c87899e8e..d9723fe1c0 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -7,7 +7,8 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> -void __init noreturn start_xen(void)
> +void __init noreturn start_xen(unsigned long bootcpu_id,
> +                               unsigned long dtb_base)
>  {
>      early_printk("Hello from C env\n");
>  
> -- 
> 2.39.0
> 
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@gmail.com>

