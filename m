Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BD775E9C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581022.909521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTi3C-0006Id-Nt; Wed, 09 Aug 2023 12:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581022.909521; Wed, 09 Aug 2023 12:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTi3C-0006FD-Kg; Wed, 09 Aug 2023 12:12:30 +0000
Received: by outflank-mailman (input) for mailman id 581022;
 Wed, 09 Aug 2023 12:12:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTi3A-0006F1-WB
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:12:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTi3A-0007Wf-GB; Wed, 09 Aug 2023 12:12:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTi3A-0005h2-9U; Wed, 09 Aug 2023 12:12:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=klAsC5S3XnRoWUoZy1fqMQRxT5h82QeX36vv+wiklAA=; b=WtArLd9HxRe2oPCrqGdb6Xc7w2
	vbBoz7hFIH/tlddA4MShKrziOUp6Nci0DfPSZeoooW+ai0bbMV49ntHfszsXuONJcURRoK5MEUwAz
	1DjgDUqOSRd06Uhn0moSYyXdDF0Jc5ZsVPv9pNOsSAJh6jJ+ubIpgfpBRTcKDVeCGJMg=;
Message-ID: <e3bae060-a78c-44ad-a79f-3faf998279b0@xen.org>
Date: Wed, 9 Aug 2023 13:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230801034419.2047541-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 01/08/2023 04:44, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> We want to reuse head.S for MPU systems, but there are some
> code are implemented for MMU systems only. We will move such
> code to another MMU specific file. But before that we will
> do some indentations fix in this patch to make them be easier
> for reviewing:
> 1. Fix the indentations and incorrect style of code comments.
> 2. Fix the indentations for .text.header section.
> 3. Rename puts() to asm_puts() for global export
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

With one remark below:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> v4:
> - Rebase to pick the adr -> adr_l change in PRINT(_s).
> - Correct in-code comment for asm_puts() and add a note to
>    mention that asm_puts() should be only called from assembly.
> - Drop redundant puts (now asm_puts) under CONFIG_EARLY_PRINTK.
> v3:
> -  fix commit message
> -  Rename puts() to asm_puts() for global export
> v2:
> -  New patch.
> ---
>   xen/arch/arm/arm64/head.S | 46 ++++++++++++++++++++-------------------
>   1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 2af9f974d5..b29bffce5b 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -94,7 +94,7 @@
>   #define PRINT(_s)          \
>           mov   x3, lr ;     \
>           adr_l x0, 98f ;    \
> -        bl    puts    ;    \
> +        bl    asm_puts ;   \
>           mov   lr, x3 ;     \
>           RODATA_STR(98, _s)
>   
> @@ -136,21 +136,21 @@
>           add \xb, \xb, x20
>   .endm
>   
> -        .section .text.header, "ax", %progbits
> -        /*.aarch64*/
> +.section .text.header, "ax", %progbits
> +/*.aarch64*/
>   
> -        /*
> -         * Kernel startup entry point.
> -         * ---------------------------
> -         *
> -         * The requirements are:
> -         *   MMU = off, D-cache = off, I-cache = on or off,
> -         *   x0 = physical address to the FDT blob.
> -         *
> -         * This must be the very first address in the loaded image.
> -         * It should be linked at XEN_VIRT_START, and loaded at any
> -         * 4K-aligned address.
> -         */
> +/*
> + * Kernel startup entry point.
> + * ---------------------------
> + *
> + * The requirements are:
> + *   MMU = off, D-cache = off, I-cache = on or off,
> + *   x0 = physical address to the FDT blob.
> + *
> + * This must be the very first address in the loaded image.
> + * It should be linked at XEN_VIRT_START, and loaded at any
> + * 4K-aligned address.
> + */
>   
>   GLOBAL(start)
>           /*
> @@ -535,7 +535,7 @@ ENDPROC(cpu_init)
>    * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
>    * level table (i.e page granularity) is supported.
>    *
> - * ptbl:     table symbol where the entry will be created
> + * ptbl:    table symbol where the entry will be created
>    * virt:    virtual address
>    * phys:    physical address (should be page aligned)
>    * tmp1:    scratch register
> @@ -970,19 +970,22 @@ init_uart:
>           ret
>   ENDPROC(init_uart)
>   
> -/* Print early debug messages.
> +/*
> + * Print early debug messages.
> + * Note: This function is only supposed to be called from assembly.

I realize the wording is just a copy of what I wrote earlier on. But I 
would use 'must' as this is a stronger than 'is supposed to'.

This can be dealt on commit if there is nothing else to change.

Cheers,

-- 
Julien Grall

