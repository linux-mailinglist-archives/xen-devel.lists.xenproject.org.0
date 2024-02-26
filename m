Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C05866DDA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685359.1065927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reX3b-0000ms-ME; Mon, 26 Feb 2024 09:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685359.1065927; Mon, 26 Feb 2024 09:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reX3b-0000k5-J9; Mon, 26 Feb 2024 09:13:55 +0000
Received: by outflank-mailman (input) for mailman id 685359;
 Mon, 26 Feb 2024 09:13:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1reX3Z-0000jz-UU
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:13:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1reX3Y-00087u-QB; Mon, 26 Feb 2024 09:13:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1reX3Y-0007rm-Ff; Mon, 26 Feb 2024 09:13:52 +0000
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
	bh=mBCccafeyLjXPKhV1rhlIp1nob8ZVADQEsxcj9gJQxY=; b=y0WPR6xzV+FnF46w89y9Qy+pbZ
	a99+tdYWDLvX0/gySOit11OxZJgI79EL+ORTAbWqvL6OflFxJSRAQudalYRAiN8yfnY4U7DQDxZvm
	eIyxmx5PZ2+KpFQBibmdJfxB5sNEGPNjN/3YJhmlCQxeucqqiSsJtg0Ye2j/ie6JGcVo=;
Message-ID: <d1518124-483c-4409-9b36-6a3392378911@xen.org>
Date: Mon, 26 Feb 2024 09:13:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240226011935.169462-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

Welcome back!

On 26/02/2024 01:19, Henry Wang wrote:
> An error message can seen from the init-dom0less application on
> direct-mapped 1:1 domains:
> ```
> Allocating magic pages
> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> Error on alloc magic pages
> ```
> 
> This is because populate_physmap() automatically assumes gfn == mfn
> for direct mapped domains. This cannot be true for the magic pages
> that are allocated later for Dom0less DomUs from the init-dom0less
> helper application executed in Dom0.
> 
> Force populate_physmap to take the "normal" memory allocation route for
> the magic pages even for 1:1 Dom0less DomUs. This should work as long
> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
> guest address as the magic pages:
> - gfn 0x39000 address 0x39000000
> - gfn 0x39001 address 0x39001000
> - gfn 0x39002 address 0x39002000
> - gfn 0x39003 address 0x39003000

This is very fragile. You are making the assumption that the magic pages 
are not clashing with any RAM region. The layout defined in arch-arm.h 
has been designed for guest where Xen is in full control of the layout. 
This is not the case for directmapped domain. I don't think it is 
correct to try to re-use part of the layout.

If you want to use 1:1 dom0less with xenstore & co, then you should find 
a different place in memory for the magic pages (TDB how to find that 
area). You will still have the problem of the 1:1 allocation, but I 
think this could be solved bty adding a flag to force a non-1:1 allocation.

> Create helper is_magic_gpfn() for Arm to assist this and stub helpers
> for non-Arm architectures to avoid #ifdef. Move the definition of the
> magic pages on Arm to a more common place.
> 
> Note that the init-dom0less application of the diffenent Xen version

s/diffenent/different/

> may allocate all or part of four magic pages for each DomU.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>   tools/libs/guest/xg_dom_arm.c   |  6 ------
>   xen/arch/arm/include/asm/mm.h   | 13 +++++++++++++
>   xen/arch/ppc/include/asm/mm.h   |  5 +++++
>   xen/arch/riscv/include/asm/mm.h |  6 ++++++
>   xen/arch/x86/include/asm/mm.h   |  5 +++++
>   xen/common/memory.c             |  2 +-
>   xen/include/public/arch-arm.h   |  6 ++++++
>   7 files changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 2fd8ee7ad4..8c579d7576 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -25,12 +25,6 @@
>   
>   #include "xg_private.h"
>   
> -#define NR_MAGIC_PAGES 4
> -#define CONSOLE_PFN_OFFSET 0
> -#define XENSTORE_PFN_OFFSET 1
> -#define MEMACCESS_PFN_OFFSET 2
> -#define VUART_PFN_OFFSET 3
> -
>   #define LPAE_SHIFT 9
>   
>   #define PFN_4K_SHIFT  (0)
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index cbcf3bf147..17149b4635 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -428,6 +428,19 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>   }
>   
> +#define MAGIC_PAGE_N_GPFN(n)     ((GUEST_MAGIC_BASE >> PAGE_SHIFT) + n)
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    unsigned int i;
> +    for ( i = 0; i < NR_MAGIC_PAGES; i++ )
> +    {
> +        if ( gpfn == MAGIC_PAGE_N_GPFN(i) )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>   #endif /*  __ARCH_ARM_MM__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
> index a433936076..8ad81d9552 100644
> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -256,4 +256,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>       return true;
>   }
>   
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    return false;
> +}
> +
>   #endif /* _ASM_PPC_MM_H */
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 07c7a0abba..a376a77e29 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,6 +3,7 @@
>   #ifndef _ASM_RISCV_MM_H
>   #define _ASM_RISCV_MM_H
>   
> +#include <public/xen.h>
>   #include <asm/page-bits.h>
>   
>   #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
> @@ -20,4 +21,9 @@ unsigned long calc_phys_offset(void);
>   
>   void turn_on_mmu(unsigned long ra);
>   
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    return false;
> +}
> +
>   #endif /* _ASM_RISCV_MM_H */
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 7d26d9cd2f..f385f36d78 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -628,4 +628,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>       return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>   }
>   
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    return false;
> +}
> +
>   #endif /* __ASM_X86_MM_H__ */
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index b3b05c2ec0..ab4bad79e2 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>           }
>           else
>           {
> -            if ( is_domain_direct_mapped(d) )
> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )

This path will also be reached by dom0. Effectively, this will prevent 
dom0 to allocate the memory 1:1 for the magic GPFN (which is guest 
specific).

Also, why are you only checking the first GFN? What if the caller pass 
an overlapped region?

>               {
>                   mfn = _mfn(gpfn);
>   
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index a25e87dbda..58aa6ff05b 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>   
> +#define NR_MAGIC_PAGES 4
> +#define CONSOLE_PFN_OFFSET 0
> +#define XENSTORE_PFN_OFFSET 1
> +#define MEMACCESS_PFN_OFFSET 2
> +#define VUART_PFN_OFFSET 3

Regardless of what I wrote above, it is not clear to me why you need to 
move these macros in public header. Just above, we are defining the 
magic region (see GUEST_MAGIC_BASE and GUEST_MAGIC_SIZE). This should be 
sufficient to detect whether a GFN belongs to the magic region.

Cheers,

-- 
Julien Grall

