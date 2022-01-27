Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6A49D7A5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 02:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261139.451831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCu0y-000202-WF; Thu, 27 Jan 2022 01:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261139.451831; Thu, 27 Jan 2022 01:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCu0y-0001x8-SL; Thu, 27 Jan 2022 01:55:56 +0000
Received: by outflank-mailman (input) for mailman id 261139;
 Thu, 27 Jan 2022 01:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCu0w-0001x2-Px
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 01:55:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4144d13c-7f14-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 02:55:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8373CB81CB2;
 Thu, 27 Jan 2022 01:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D2DC340E7;
 Thu, 27 Jan 2022 01:55:48 +0000 (UTC)
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
X-Inumbo-ID: 4144d13c-7f14-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643248549;
	bh=4qGFDoTNv1QpwiReO0CdH6B8nDvgBy+45Vsi6KOvr64=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fOTyMzPwqdZwWRYAK3fILJZJTZn+H0ziBb57m++yC9XH6EfywOCp8pH3NsBjtIziX
	 tg3Gr/CnTqQ0xqKeWX51VPwgihZRvOYmzJiJCXfp2QcU3s8pzw0VGSP2wItiGtsKdv
	 01hZ7X+lrwmM4wAMoWcLTsYp5robk3KYOEJZXKJThGjkEe7bh0Nsrz2wYVG31QCh2U
	 ZbgaQ7RrhgO7MiMk+A2auW+6ME96cxEyCIKzxnflWE+YIhintJaMLsPgY65yCHopDc
	 5np+A1u4fEz5mmlrBsmY6tvHleNa3/kX3sTTlfTYqMX/p1jqA+FeDgaRrmm4pffCRD
	 N1Ty9Y9jg4nEg==
Date: Wed, 26 Jan 2022 17:55:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen: Replace arch_mfn_in_directmap() with
 arch_mfns_in_directmap()
In-Reply-To: <20220126155919.36706-1-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201261755370.27308@ubuntu-linux-20-04-desktop>
References: <20220126155919.36706-1-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jan 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The name of arch_mfn_in_directmap() suggests that it will check against
> that the passed MFN should be in the directmap.
> 
> However, the current callers are passing the next MFN and the
> implementation will return true for up to one MFN past the directmap.
> 
> It would be more meaningful to test the exact MFN rather than the
> next one.
> 
> That said, the current expectation is the memory will be direct-mapped
> from 0 up to a given MFN. This may not be a valid assumption on all
> the architectures.
> 
> For instance, on Arm32 only the xenheap that will be direct-mapped.
> This may not be allocated a the beginning of the RAM.
> 
> So take the opportunity to rework the parameters and pass the
> number of pages we want to check. This also requires to rename
> the helper to better match the implementation.
> 
> Note that the implementation of the helper on arm32 is left as-is
> for now.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ----
> 
> Changes in v2:
>     - Pass a region instead the last MFN.
>     - Rename the helper to arch_mfns_in_directmap()
>     - This was https://lore.kernel.org/xen-devel/20211216152220.3317-1-julien@xen.org/
> 
> Looking at the history, it looks like the check in init_node_heap()
> was <= and it was simply moved to a new helper without any adjustment
> as part of c6fdc9696a "boot allocator: use arch helper for virt_to_mfn
> on DIRECTMAP_VIRT region".
> ---
>  xen/arch/arm/include/asm/arm32/mm.h | 2 +-
>  xen/arch/arm/include/asm/arm64/mm.h | 2 +-
>  xen/arch/x86/include/asm/mm.h       | 6 +++---
>  xen/common/page_alloc.c             | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
> index 68612499bf6c..6b039d9ceaa2 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -5,7 +5,7 @@
>   * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
>   * For convenience always return false.
>   */
> -static inline bool arch_mfn_in_directmap(unsigned long mfn)
> +static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
>      return false;
>  }
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
> index d0a3be7e15a4..aa2adac63189 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -5,7 +5,7 @@
>   * On ARM64, all the RAM is currently direct mapped in Xen.
>   * Hence return always true.
>   */
> -static inline bool arch_mfn_in_directmap(unsigned long mfn)
> +static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
>      return true;
>  }
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 5dbcee869624..9b9de4c6bef7 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -635,13 +635,13 @@ void write_32bit_pse_identmap(uint32_t *l2);
>  
>  /*
>   * x86 maps part of physical memory via the directmap region.
> - * Return whether the input MFN falls in that range.
> + * Return whether the range of MFN falls in the directmap region.
>   */
> -static inline bool arch_mfn_in_directmap(unsigned long mfn)
> +static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  {
>      unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>  
> -    return mfn <= (virt_to_mfn(eva - 1) + 1);
> +    return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>  }
>  
>  #endif /* __ASM_X86_MM_H__ */
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 38eea879c04a..f8749b0787a6 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -588,7 +588,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>          needed = 0;
>      }
>      else if ( *use_tail && nr >= needed &&
> -              arch_mfn_in_directmap(mfn + nr) &&
> +              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
>                (!xenheap_bits ||
>                 !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> @@ -597,7 +597,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>                        PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>      }
>      else if ( nr >= needed &&
> -              arch_mfn_in_directmap(mfn + needed) &&
> +              arch_mfns_in_directmap(mfn, needed) &&
>                (!xenheap_bits ||
>                 !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -- 
> 2.32.0
> 

