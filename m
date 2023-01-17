Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB204670DF0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480008.744155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvej-0003EU-2M; Tue, 17 Jan 2023 23:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480008.744155; Tue, 17 Jan 2023 23:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvei-0003Bk-Ud; Tue, 17 Jan 2023 23:46:16 +0000
Received: by outflank-mailman (input) for mailman id 480008;
 Tue, 17 Jan 2023 23:46:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHveh-0003Be-Be
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:46:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHveg-0007RG-S2; Tue, 17 Jan 2023 23:46:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHveg-00047M-NV; Tue, 17 Jan 2023 23:46:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=4/t/YTEFLF1NRZaHXm6APHNRymjxIA+orZM+fLdbCog=; b=FVlWJz2Xgz78LMG/5anDFqnOIj
	XekJLrOVhpqs5RnoEhxvaEvUhwTHcoWVDsU/uJyKdvHXPeunq3HEQpFEfEUjUbJs0nK6X1SuZ+/Lo
	+G23pq66OjX+BSlEfOsVLgzu3yCbBIbf8iRwBNDuRqpkRCUOGBS6pIdbRf9ebkCxqWfY=;
Message-ID: <4b817b65-f558-b4df-c7fd-242a04e59a59@xen.org>
Date: Tue, 17 Jan 2023 23:46:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-8-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map
 sections
In-Reply-To: <20230113052914.3845596-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Only the first 4KB of Xen image will be mapped as identity
> (PA == VA). At the moment, Xen guarantees this by having
> everything that needs to be used in the identity mapping
> in head.S before _end_boot and checking at link time if this
> fits in 4KB.
> 
> In previous patch, we have moved the MMU code outside of
> head.S. Although we have added .text.header to the new file
> to guarantee all identity map code still in the first 4KB.
> However, the order of these two files on this 4KB depends
> on the build tools. Currently, we use the build tools to
> process the order of objs in the Makefile to ensure that
> head.S must be at the top. But if you change to another build
> tools, it may not be the same result.

Right, so this is fixing a bug you introduced in the previous patch. We 
should really avoid introducing (latent) regression in a series. So 
please re-order the patches.

> 
> In this patch we introduce .text.idmap to head_mmu.S, and
> add this section after .text.header. to ensure code of
> head_mmu.S after the code of header.S.
> 
> After this, we will still include some code that does not
> belong to identity map before _end_boot. Because we have
> moved _end_boot to head_mmu.S. 

I dislike this approach because you are expecting that only head_mmu.S 
will be part of .text.idmap. If it is not, everything could blow up again.

That said, if you look at staging, you will notice that now _end_boot is 
defined in the linker script to avoid any issue.

> That means all code in head.S
> will be included before _end_boot. In this patch, we also
> added .text flag in the place of original _end_boot in head.S.
> All the code after .text in head.S will not be included in
> identity map section.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v1 -> v2:
> 1. New patch.
> ---
>   xen/arch/arm/arm64/head.S     | 6 ++++++
>   xen/arch/arm/arm64/head_mmu.S | 2 +-
>   xen/arch/arm/xen.lds.S        | 1 +
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5cfa47279b..782bd1f94c 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -466,6 +466,12 @@ fail:   PRINT("- Boot failed -\r\n")
>           b     1b
>   ENDPROC(fail)
>   
> +/*
> + * For the code that do not need in indentity map section,
> + * we put them back to normal .text section
> + */
> +.section .text, "ax", %progbits
> +

I would argue that puts wants to be part of the idmap.

>   #ifdef CONFIG_EARLY_PRINTK
>   /*
>    * Initialize the UART. Should only be called on the boot CPU.
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index e2c8f07140..6ff13c751c 100644
> --- a/xen/arch/arm/arm64/head_mmu.S
> +++ b/xen/arch/arm/arm64/head_mmu.S
> @@ -105,7 +105,7 @@
>           str   \tmp2, [\tmp3, \tmp1, lsl #3]
>   .endm
>   
> -.section .text.header, "ax", %progbits
> +.section .text.idmap, "ax", %progbits
>   /*.aarch64*/
>   
>   /*
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 92c2984052..bc45ea2c65 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -33,6 +33,7 @@ SECTIONS
>     .text : {
>           _stext = .;            /* Text section */
>          *(.text.header)
> +       *(.text.idmap)
>   
>          *(.text.cold)
>          *(.text.unlikely .text.*_unlikely .text.unlikely.*)

Cheers,

-- 
Julien Grall

