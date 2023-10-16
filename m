Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E237CB2E6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 20:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617926.961048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsSav-0004gg-MV; Mon, 16 Oct 2023 18:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617926.961048; Mon, 16 Oct 2023 18:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsSav-0004dm-Jd; Mon, 16 Oct 2023 18:45:37 +0000
Received: by outflank-mailman (input) for mailman id 617926;
 Mon, 16 Oct 2023 18:45:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsSau-0004dg-Cr
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 18:45:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsSat-0002wp-Sm; Mon, 16 Oct 2023 18:45:35 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.9.197]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsSat-0001AU-Jo; Mon, 16 Oct 2023 18:45:35 +0000
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
	bh=PerKuqqMsYtLC9DEC65YCmYu5wpPJO3Hz5WZMBwWN50=; b=gQBMbV0/ZqU+pft68dIvOgxNE2
	JWaSOoYhTTUD5igIAosrXTG1qlhMBzuamtGSL7FNLlgj93SyzrpQwZUnDUCdes/mt06M24gPGIBNS
	gqBBQPImOYaPiq7gexja0L7yQwvY2EXhNa5Oh0P8zJl1v7AuN9tSOku4kmUQo/NAhdw8=;
Message-ID: <bb9f1242-adfb-484d-b9fc-57b9e12b78c7@xen.org>
Date: Mon, 16 Oct 2023 19:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v1 3/4] xen/arm32: Split and move MMU-specific head.S to
 mmu/head.S
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, wei.chen@arm.com,
 penny.zheng@arm.com, henry.wang@arm.com
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
 <20230911135942.791206-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230911135942.791206-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2023 14:59, Ayan Kumar Halder wrote:
> This is based on
> "[PATCH v6 03/13] xen/arm64: Split and move MMU-specific head.S to mmu/head.S"
> 
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg151920.html

Same remark as patch #1. Please provide a proper commit message.

[...]

> diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
> index a4e20aa520..64fbe4876a 100644
> --- a/xen/arch/arm/include/asm/arm32/macros.h
> +++ b/xen/arch/arm/include/asm/arm32/macros.h
> @@ -1,8 +1,70 @@
>   #ifndef __ASM_ARM_ARM32_MACROS_H
>   #define __ASM_ARM_ARM32_MACROS_H
>   
> +/* Offset between the early boot xen mapping and the runtime xen mapping */
> +#define XEN_TEMPORARY_OFFSET      (TEMPORARY_XEN_VIRT_START - XEN_VIRT_START)
> +
>       .macro ret
>           mov     pc, lr
>       .endm
>   
> +/*
> + * Move an immediate constant into a 32-bit register using movw/movt
> + * instructions.
> + */
> +.macro mov_w reg, word
> +        movw  \reg, #:lower16:\word
> +        movt  \reg, #:upper16:\word
> +.endm
> +
> +/*
> + * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
> + * within the range +/- 4GB of the PC.
> + *
> + * @dst: destination register
> + * @sym: name of the symbol
> + */
> +.macro adr_l, dst, sym
> +        mov_w \dst, \sym - .Lpc\@
> +        .set  .Lpc\@, .+ 8          /* PC bias */
> +        add   \dst, \dst, pc
> +.endm
> +
> +.macro load_paddr rb, sym
> +        mov_w \rb, \sym
> +        add   \rb, \rb, r10
> +.endm

I see that we are still using load_paddr in arm64/head.S. But I don't 
think it makes entirely sense as r10 (x20) would always be 0 for the MPU.

In fact all the use in arm{32, 64}/head.S after this patch could be 
easily replaced with adr_l because they are called when the MMU is off 
so the return address will be a physical address.

So can you add a prequisite patch for arm32 to replace the remaining 
some of the load_paddr? With that, load_paddr can be moved in mmu/head.S.

I will take care of the arm64 part.

Cheers,

-- 
Julien Grall

