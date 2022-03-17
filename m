Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DA4DCFA3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 21:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291751.495429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUx1P-0001Un-Il; Thu, 17 Mar 2022 20:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291751.495429; Thu, 17 Mar 2022 20:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUx1P-0001Sy-EP; Thu, 17 Mar 2022 20:46:59 +0000
Received: by outflank-mailman (input) for mailman id 291751;
 Thu, 17 Mar 2022 20:46:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nUx1O-0001Ss-Dk
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 20:46:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUx1N-00033J-Pt; Thu, 17 Mar 2022 20:46:57 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUx1N-0004g5-Jz; Thu, 17 Mar 2022 20:46:57 +0000
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
	bh=oNfEjzpgMSayxkeCAtVzA/0cBEiIU4WQVf4zeEHNElQ=; b=xT2EGQdw+SnbwnyFqQD3zR7ZDz
	7X1HeS6pHThbLA9EXzbgx/gF1x2ABZoNyQPvpjTOdB9gtHTPGNm4tNzuVFuytcSa9aYvRpcd7mFvf
	YQhhCbrL7BmX8KbETAOm4m6qKK84ADZ/Fkd+nA4sXOe722fbKSlsFMuc8sURCm+jTPXw=;
Message-ID: <857610d4-32e6-6770-a954-f26aca8cf9b3@xen.org>
Date: Thu, 17 Mar 2022 20:46:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-3-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220309112048.17377-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/03/2022 11:20, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Xen is currently not fully compliant with the Arm because it will
> switch the TTBR with the MMU on.
> 
> In order to be compliant, we need to disable the MMU before
> switching the TTBR. The implication is the page-tables should
> contain an identity mapping of the code switching the TTBR.
> 
> If we don't rework the memory layout, we would need to find a
> virtual address that matches a physical address and doesn't clash
> with the static virtual regions. This can be a bit tricky.
> 
> On arm64, the memory layout  has plenty of unused space. In most of
> the case we expect Xen to be loaded in low memory.
> 
> The memory layout is reshuffled to keep the 0th slot free. Xen will now
> be loaded at (512GB + 2MB). This requires a slight tweak of the boot
> code as XEN_VIRT_START cannot be used as an immediate.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
>      TODO:
>          - I vaguely recall that one of the early platform we supported add
>            the memory starting in high memory (> 1TB). I need to check
>            whether the new layout will be fine.
>          - Update the documentation to reflect the new layout
> ---
>   xen/arch/arm/arm64/head.S         |  3 ++-
>   xen/arch/arm/include/asm/config.h | 20 ++++++++++++++------
>   xen/arch/arm/mm.c                 | 14 +++++++-------
>   3 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 66d862fc8137..878649280d73 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -594,7 +594,8 @@ create_page_tables:
>            * need an additional 1:1 mapping, the virtual mapping will
>            * suffice.
>            */
> -        cmp   x19, #XEN_VIRT_START
> +        ldr   x0, =XEN_VIRT_START
> +        cmp   x19, x0
>           bne   1f
>           ret
>   1:
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 5db28a8dbd56..b2f31a914103 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -107,8 +107,20 @@
>    *  Unused
>    */
>   
> +#ifdef CONFIG_ARM_32
> +
>   #define COMMON_VIRT_START       _AT(vaddr_t, 0)
>   
> +#else
> +
> +#define SLOT0_ENTRY_BITS  39
> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
> +
> +#define COMMON_VIRT_START       SLOT(1)

This should have been SLOT0(). I got it right in my tree but merge the 
change to the wrong patch :(.

Cheers,

-- 
Julien Grall

