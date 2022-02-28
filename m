Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7289E4C66E7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280321.478226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcyS-0004fE-6s; Mon, 28 Feb 2022 10:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280321.478226; Mon, 28 Feb 2022 10:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcyS-0004dA-3n; Mon, 28 Feb 2022 10:09:48 +0000
Received: by outflank-mailman (input) for mailman id 280321;
 Mon, 28 Feb 2022 10:09:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcyQ-0004d4-Sj
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:09:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcyQ-0002Ow-IF; Mon, 28 Feb 2022 10:09:46 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcyQ-0004iz-Cr; Mon, 28 Feb 2022 10:09:46 +0000
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
	bh=BZAt5OO8RmpSFn46WO+UDX0WJCszviouNDdSL0QGEP4=; b=RSYfs+kdEPaxMJ7/Ty+MFBYHhy
	VLzHcwKUNnaFAqQwZi3IlQCmNW6sIKjTR1x/fnMZUQHrhn8YSYXpsgKHroHsRiBRqHyxeAQn946Z0
	xZGIXPrY3TneEye6+SCtoF7hlzABBzkQKv8FeByXf7XO/GjDj/LVn0vZ3k+sOxtQbPIU=;
Message-ID: <60244b45-1b47-acc1-9658-fb260394adc7@xen.org>
Date: Mon, 28 Feb 2022 10:09:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm64: head: Mark the end of subroutines with ENDPROC
 (take two)
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228100826.61339-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220228100826.61339-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2022 10:08, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 13c03002c5df ("xen/arm64: head: Mark the end of subroutines
> with ENDPROC") intended to mark all the subroutines with ENDPROC.
> 
> Unfortunately, I missed fail(), switch_ttbr() and init_uart(). Add
> ENDPROC for the benefits of static analysis tools and the reader.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Hmmm... It looks like I sent this patch twice. Please ignore this 
version and instead review:

https://lore.kernel.org/xen-devel/20220228100805.60918-1-julien@xen.org/

> ---
>   xen/arch/arm/arm64/head.S | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 314b800b3f8e..66d862fc8137 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -800,6 +800,7 @@ ENDPROC(launch)
>   fail:   PRINT("- Boot failed -\r\n")
>   1:      wfe
>           b     1b
> +ENDPROC(fail)
>   
>   GLOBAL(_end_boot)
>   
> @@ -830,6 +831,7 @@ ENTRY(switch_ttbr)
>           isb
>   
>           ret
> +ENDPROC(switch_ttbr)
>   
>   #ifdef CONFIG_EARLY_PRINTK
>   /*
> @@ -847,6 +849,7 @@ init_uart:
>   #endif
>           PRINT("- UART enabled -\r\n")
>           ret
> +ENDPROC(init_uart)
>   
>   /* Print early debug messages.
>    * x0: Nul-terminated string to print.

-- 
Julien Grall

