Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F048259F4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 19:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662302.1032382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLooG-00053X-10; Fri, 05 Jan 2024 18:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662302.1032382; Fri, 05 Jan 2024 18:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLooF-00051q-Tl; Fri, 05 Jan 2024 18:20:43 +0000
Received: by outflank-mailman (input) for mailman id 662302;
 Fri, 05 Jan 2024 18:20:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLooE-00051k-Fz
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 18:20:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLooD-0004YC-N1; Fri, 05 Jan 2024 18:20:41 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLooD-0001Fv-Es; Fri, 05 Jan 2024 18:20:41 +0000
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
	bh=FhyHWogUoR6wJurez7rt/RUmtOGEyj7hn5JTYfeJkxA=; b=X5TL5nl93d7zHAUWB0QJt2KwrW
	V17MUOpedRYEM0w3zTkcBP3ACaV9LGfqhH4o0fYMJeW6PeKXhr5NmVbmIqywPe4KWoMq2kaBDPMx4
	7LNxpYePdg14fIg4cUDnjmye+vBtzNvXHIIAj4zMuig+uZzPf6Rr5Cy4j0oeUTWknHpk=;
Message-ID: <05b6e12c-059d-47e7-8859-a291080c4dd4@xen.org>
Date: Fri, 5 Jan 2024 18:20:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] Revert "xen/arm: Remove unused
 BOOT_RELOC_VIRT_START"
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-12-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-12-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This reverts commit 0c18fb76323bfb13615b6f13c98767face2d8097 (not clean).
> 
> This is not a clean revert since the rework of the memory layout, but it is
> sufficiently similar to a clean one.
> The only difference is that the BOOT_RELOC_VIRT_START must match the new
> layout.
> 
> Cache coloring support for Xen needs to relocate Xen code and data in a new
> colored physical space. The BOOT_RELOC_VIRT_START will be used as the virtual
> base address for a temporary mapping to this new space.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/include/asm/mmu/layout.h | 2 ++
>   xen/arch/arm/mmu/setup.c              | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
> index eac7eef885..30031f74d9 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -74,6 +74,8 @@
>   #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
>   #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
>   
> +#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)

This new addition wants to be documented in the layout comment in a few 
lines above. Also, the area you are using is 2MB whereas Xen can now be 
up to 8MB.

Secondly, you want to add a BOOTRELOC_VIRT_SIZE with a check in 
build_assertions() making sure that this is at least as big as 
XEN_VIRT_SIZE.

Overall, I am not sure this is really a revert at this point. The idea 
is the same, but you are defining BOOT_FDT_VIRT_START differently.

To me it feels like it belong to the first patch where you will use it. 
And that would be ok to mention in the commit message that the idea was 
borrowed from a previously reverted commit.

> +
>   #ifdef CONFIG_LIVEPATCH
>   #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
>   #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index d5264e51bc..37b6d230ad 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -69,6 +69,7 @@ static void __init __maybe_unused build_assertions(void)
>       /* 2MB aligned regions */
>       BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
>       BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> +    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
>       /* 1GB aligned regions */
>   #ifdef CONFIG_ARM_32
>       BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);

-- 
Julien Grall

