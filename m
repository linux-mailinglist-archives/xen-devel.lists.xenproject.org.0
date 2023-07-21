Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269BA75D053
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 19:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567683.887050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtZk-0005lR-Q7; Fri, 21 Jul 2023 17:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567683.887050; Fri, 21 Jul 2023 17:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtZk-0005ip-N8; Fri, 21 Jul 2023 17:05:56 +0000
Received: by outflank-mailman (input) for mailman id 567683;
 Fri, 21 Jul 2023 17:05:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMtZi-0005ig-NK
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 17:05:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMtZh-0003OG-Lf; Fri, 21 Jul 2023 17:05:53 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMtZh-0006oj-DX; Fri, 21 Jul 2023 17:05:53 +0000
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
	bh=MjAeznATP3VrlhETPWNmDUS5qb+UQitxxgR3yd6/7vg=; b=Y63uFTa/o8+kUMi+LjMStIzdj3
	dqHjmpqCveW6mA+LwFOgR4nSB7YP8tkZrtkjasguKnZL7yhWlWDcKNYrbe9Vj9k57BHVQky97I3wD
	bYuUsWyqWDvg+nN3BtM7DUJHlCi/0ESMnrZyp2Ib0K6BWQ0VTn6/Gc4KrA57uCZuG7As=;
Message-ID: <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
Date: Fri, 21 Jul 2023 18:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230717160318.2113-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

On 17/07/2023 17:03, Alejandro Vallejo wrote:
> Regions must be occasionally validated for pdx compression validity. That
> is, whether any of the machine addresses spanning the region have a bit set
> in the pdx "hole" (which is expected to always contain zeroes). There are
> a few such tests through the code, and they all check for different things.
> 
> This patch replaces all such occurences with a call to a centralized

Typo: s/occurences/occurrences/

> function that checks a region for validity.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>   xen/arch/x86/x86_64/mm.c |  2 +-
>   xen/common/efi/boot.c    |  6 +++---
>   xen/common/pdx.c         | 13 +++++++++++--
>   xen/include/xen/pdx.h    |  9 +++++++++
>   4 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index 60db439af3..914e65c26c 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1168,7 +1168,7 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>       if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
>           return 0;
>   
> -    if ( (spfn | epfn) & pfn_hole_mask )
> +    if ( !pdx_is_region_compressible(spfn, epfn) )
>           return 0;
>   
>       /* Make sure the new range is not present now */
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 24169b7b50..b098a8c030 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -14,6 +14,7 @@
>   #include <xen/multiboot.h>
>   #include <xen/param.h>
>   #include <xen/pci_regs.h>
> +#include <xen/pdx.h>
>   #include <xen/pfn.h>
>   #if EFI_PAGE_SIZE != PAGE_SIZE
>   # error Cannot use xen/pfn.h here!
> @@ -1647,7 +1648,7 @@ static bool __init cf_check ram_range_valid(unsigned long smfn, unsigned long em
>   {
>       unsigned long sz = pfn_to_pdx(emfn - 1) / PDX_GROUP_COUNT + 1;
>   
> -    return !(smfn & pfn_hole_mask) &&
> +    return pdx_is_region_compressible(smfn, emfn) &&
>              find_next_bit(pdx_group_valid, sz,
>                            pfn_to_pdx(smfn) / PDX_GROUP_COUNT) < sz;
>   }
> @@ -1759,8 +1760,7 @@ void __init efi_init_memory(void)
>               prot |= _PAGE_NX;
>   
>           if ( pfn_to_pdx(emfn - 1) < (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
> -             !(smfn & pfn_hole_mask) &&
> -             !((smfn ^ (emfn - 1)) & ~pfn_pdx_bottom_mask) )
> +             pdx_is_region_compressible(smfn, emfn))
>           {
>               if ( (unsigned long)mfn_to_virt(emfn - 1) >= HYPERVISOR_VIRT_END )
>                   prot &= ~_PAGE_GLOBAL;
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index 99d4a90a50..72845e4bab 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -88,7 +88,7 @@ bool __mfn_valid(unsigned long mfn)
>   }
>   
>   /* Sets all bits from the most-significant 1-bit down to the LSB */
> -static uint64_t __init fill_mask(uint64_t mask)
> +static uint64_t fill_mask(uint64_t mask)
>   {
>       while (mask & (mask + 1))
>           mask |= mask + 1;
> @@ -96,6 +96,15 @@ static uint64_t __init fill_mask(uint64_t mask)
>       return mask;
>   }
>   
> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)

For newer interface, I would rather prefer if we use start + size. It is 
easier to reason (you don't have to wonder whether 'emfn' is inclusive 
or not) and avoid issue in the case you are trying to handle a region 
right at the end of the address space as emfn would be 0 in the 
non-inclusive case (not much a concern for MFNs as the last one should 
be invalid, but it makes harder to reason).

> +{
> +    uint64_t base = smfn << PAGE_SHIFT;

On Arm32, physical address are up to 40-bit. So you want to cast smfn to 
uint64_t before shifting. That said, it would be best to use 
pfn_to_paddr() and possibly switch to paddr_t for the type.

Note that I understand that the rest of the PDX code is using uint64_t. 
So I would be ok if you don't want to switch to paddr_t.

> +    uint64_t len = (emfn - smfn) << PAGE_SHIFT;

Same here.

> +
> +    return !(smfn & pfn_hole_mask) &&
> +           !(pdx_region_mask(base, len) & ~ma_va_bottom_mask);
> +}
> +
>   /* We don't want to compress the low MAX_ORDER bits of the addresses. */
>   uint64_t __init pdx_init_mask(uint64_t base_addr)
>   {
> @@ -103,7 +112,7 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
>                            (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
>   }
>   
> -uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
> +uint64_t pdx_region_mask(uint64_t base, uint64_t len)
>   {
>       /*
>        * We say a bit "moves" in a range if there exist 2 addresses in that
> diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> index f8ca0f5821..5378e664c2 100644
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -77,6 +77,15 @@ extern unsigned long pfn_top_mask, ma_top_mask;
>                            (sizeof(*frame_table) & -sizeof(*frame_table)))
>   extern unsigned long pdx_group_valid[];
>   
> +/**
> + * Validate a region's compatibility with the current compression runtime
> + *
> + * @param smfn Start mfn
> + * @param emfn End mfn (non-inclusive)
> + * @return True iff the region can be used with the current compression
> + */
> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn);
> +
>   /**
>    * Calculates a mask covering "moving" bits of all addresses of a region
>    *

Cheers,

-- 
Julien Grall

