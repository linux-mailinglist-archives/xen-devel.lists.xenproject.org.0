Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0CF7F3344
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637967.994164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TJA-0006qq-PJ; Tue, 21 Nov 2023 16:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637967.994164; Tue, 21 Nov 2023 16:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TJA-0006p7-MY; Tue, 21 Nov 2023 16:09:04 +0000
Received: by outflank-mailman (input) for mailman id 637967;
 Tue, 21 Nov 2023 16:09:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r5TJ9-0006nf-Py
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:09:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5TJ9-0005ih-El; Tue, 21 Nov 2023 16:09:03 +0000
Received: from [15.248.3.117] (helo=[10.24.67.37])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5TJ9-000293-8r; Tue, 21 Nov 2023 16:09:03 +0000
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
	bh=9ZXEIuSLPZsqgdgEWEiHJCdGLgjBe8uQCip13yaTszM=; b=yHqMb8AkUjNWcMenXlK/CR2/gc
	oApSUDhsoiwgTeLUhJscQwtyTylhhsE0Zu5XGisIEDGZOrp3O1cJuAtajEe1hejEEf+40GxP23H96
	2gU22Ps+vWEkoWVdGnT7jSaTLOCZkSaBCDDb0h40xqo/SXegn7nsUlZ4dwp2h9ebTOLE=;
Message-ID: <cbe5470e-2017-4c4f-bd32-987da72aaf44@xen.org>
Date: Tue, 21 Nov 2023 16:09:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231121094516.24714-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 21/11/2023 09:45, Michal Orzel wrote:
> At the moment, the 'hex' string is placed right after the 'putn'
> function in the .text section. This is because of the limited range
> (+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
> 'adr_l' instead (range extended to +/- 4GB) and move the string to
> .rodata.str. This way all the earlyprintk messages will be part of .rodata
> and the behavior will be consistent with what we already do on arm32.

This will be correct today, but I am actually thinking to move 'hex' to 
.rodata.idmap so it can be used while we are on the 1:1 mapping and/or 
temporary mapping.

So I would consider to drop this patch for now.

Cheers,

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/arm64/head.S | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 8dbd3300d89f..b6111399e766 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -498,7 +498,7 @@ ENDPROC(asm_puts)
>    * Clobbers x0-x3
>    */
>   putn:
> -        adr   x1, hex
> +        adr_l x1, hex
>           mov   x3, #16
>   1:
>           early_uart_ready x23, 2
> @@ -512,8 +512,7 @@ putn:
>           ret
>   ENDPROC(putn)
>   
> -hex:    .ascii "0123456789abcdef"
> -        .align 2
> +RODATA_STR(hex, "0123456789abcdef")
>   
>   #else  /* CONFIG_EARLY_PRINTK */
>   

[1] https://lore.kernel.org/20231101233011.83098-3-julien@xen.org

-- 
Julien Grall

