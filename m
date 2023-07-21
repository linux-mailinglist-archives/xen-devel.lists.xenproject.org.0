Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2675CD8E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 18:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567644.886950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsjR-0003RZ-Ai; Fri, 21 Jul 2023 16:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567644.886950; Fri, 21 Jul 2023 16:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMsjR-0003P0-7X; Fri, 21 Jul 2023 16:11:53 +0000
Received: by outflank-mailman (input) for mailman id 567644;
 Fri, 21 Jul 2023 16:11:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMsjP-0003Os-Gm
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 16:11:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMsjN-00024m-L5; Fri, 21 Jul 2023 16:11:49 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMsjN-0007bD-CP; Fri, 21 Jul 2023 16:11:49 +0000
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
	bh=NPrVvjH8UIj7XB0Jr4QlNUCjgndIdetd4JX273Kjdz4=; b=AwdGhAZUQhTwxNXdPXPD/MwudX
	19lmDuY4ZzhGqIuHkAJIdikpocG8DGnbe/BFalUQknf7xEh6uWR3k1o4G9m9XvyG54GlIOvLG0UMt
	1pjNQGx2RcY48ZVOWYO9YGQm/bWAk+aonZsMwZYbJXpuBF6G9hKtDfLueLomcxULK5B0=;
Message-ID: <7dc614f1-c215-f106-38b8-22c0600b0f73@xen.org>
Date: Fri, 21 Jul 2023 17:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] mm: Factor out the pdx compression logic in ma/va
 converters
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-6-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230717160318.2113-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

On 17/07/2023 17:03, Alejandro Vallejo wrote:
> This patch factors out the pdx compression logic hardcoded in both ports
> for the maddr<->vaddr conversion functions.
> 
> Touches both x86 and arm ports.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>   xen/arch/arm/include/asm/mm.h          |  3 +--
>   xen/arch/x86/include/asm/x86_64/page.h | 28 +++++++++++---------------
>   xen/include/xen/pdx.h                  | 25 +++++++++++++++++++++++
>   3 files changed, 38 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 1a83f41879..78cb23858a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -320,8 +320,7 @@ static inline void *maddr_to_virt(paddr_t ma)
>              (DIRECTMAP_SIZE >> PAGE_SHIFT));
>       return (void *)(XENHEAP_VIRT_START -
>                       (directmap_base_pdx << PAGE_SHIFT) +
> -                    ((ma & ma_va_bottom_mask) |
> -                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
> +                    maddr_to_directmapoff(ma));
>   }
>   #endif
>   
> diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
> index 53faa7875b..b589c93e77 100644
> --- a/xen/arch/x86/include/asm/x86_64/page.h
> +++ b/xen/arch/x86/include/asm/x86_64/page.h
> @@ -36,26 +36,22 @@ static inline unsigned long __virt_to_maddr(unsigned long va)
>   {
>       ASSERT(va < DIRECTMAP_VIRT_END);
>       if ( va >= DIRECTMAP_VIRT_START )
> -        va -= DIRECTMAP_VIRT_START;
> -    else
> -    {
> -        BUILD_BUG_ON(XEN_VIRT_END - XEN_VIRT_START != GB(1));
> -        /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
> -        ASSERT(((long)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) ==
> -               ((long)XEN_VIRT_START >> (PAGE_ORDER_1G + PAGE_SHIFT)));
> -
> -        va += xen_phys_start - XEN_VIRT_START;
> -    }
> -    return (va & ma_va_bottom_mask) |
> -           ((va << pfn_pdx_hole_shift) & ma_top_mask);
> +        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
> +
> +    BUILD_BUG_ON(XEN_VIRT_END - XEN_VIRT_START != GB(1));
> +    /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
> +    ASSERT(((long)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) ==
> +           ((long)XEN_VIRT_START >> (PAGE_ORDER_1G + PAGE_SHIFT)));
> +
> +    return xen_phys_start + va - XEN_VIRT_START;
>   }
>   
>   static inline void *__maddr_to_virt(unsigned long ma)
>   {
> -    ASSERT(pfn_to_pdx(ma >> PAGE_SHIFT) < (DIRECTMAP_SIZE >> PAGE_SHIFT));
> -    return (void *)(DIRECTMAP_VIRT_START +
> -                    ((ma & ma_va_bottom_mask) |
> -                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
> +    /* Offset in the direct map, accounting for pdx compression */
> +    size_t va_offset = maddr_to_directmapoff(ma);
> +    ASSERT(va_offset < DIRECTMAP_SIZE);
> +    return (void *)(DIRECTMAP_VIRT_START + va_offset);
>   }
>   
>   /* read access (should only be used for debug printk's) */
> diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> index 67ae20e89c..f8ca0f5821 100644
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -158,6 +158,31 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
>   #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>   #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>   
> +/**
> + * Computes the offset into the direct map of an maddr
> + *
> + * @param ma Machine address
> + * @return Offset on the direct map where that
> + *         machine address can be accessed
> + */
> +static inline unsigned long maddr_to_directmapoff(uint64_t ma)
> +{
> +    return ((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
> +           (ma & ma_va_bottom_mask);

NIT: I got a bit confused because your re-order the two operations. I 
guess this was done because it is nicer to read.

Anyway, I have confirmed the logic is still the same (just different 
ordering).

> +}
> +
> +/**
> + * Computes a machine address given a direct map offset
> + *
> + * @param offset Offset into the direct map
> + * @return Corresponding machine address of that virtual location
> + */
> +static inline uint64_t directmapoff_to_maddr(unsigned long offset)
> +{
> +    return ((offset << pfn_pdx_hole_shift) & ma_top_mask) |

'unsigned long' may be 32-bit. So I think you want to cast offset to 
uint64_t.

Cheers,

-- 
Julien Grall

