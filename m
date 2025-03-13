Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28CA5EF75
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911667.1318070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tselh-0005vR-0x; Thu, 13 Mar 2025 09:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911667.1318070; Thu, 13 Mar 2025 09:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tselg-0005t7-Ue; Thu, 13 Mar 2025 09:22:20 +0000
Received: by outflank-mailman (input) for mailman id 911667;
 Thu, 13 Mar 2025 09:22:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tsele-0005t1-NI
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:22:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tsele-000f3i-14;
 Thu, 13 Mar 2025 09:22:18 +0000
Received: from [2a02:8012:3a1:0:f06b:e0c6:4c54:6a31]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tseld-008S1h-32;
 Thu, 13 Mar 2025 09:22:18 +0000
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
	bh=jEvASP4PbwIRCknRX2cyVtXVghEJuTxjwd8KsTxMuzw=; b=dpCs3DDUPD0tZIGreeq/ngHHVw
	aido8TaqbpgsmyJ6mrYvKbsiHwi0sf1tISTUE2zrWysdVJzjhQ16f8Rd7bKux8zHyCCYKRMr06xe4
	q0/8tgCl2MrRg3yZ68AeQkx7eRI5aDBWxrWhYgdQ9HyRVNAxDwzUZdblf6dU0maHRFds=;
Message-ID: <df0ad31e-1842-41fa-9112-9e3892bfdf65@xen.org>
Date: Thu, 13 Mar 2025 09:22:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] arm/mpu: Introduce frame_table, virt_to_page,
 maddr_to_virt
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250312135258.1815706-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/03/2025 13:52, Luca Fancellu wrote:
> Introduce variables and functions used in the common Arm code by
> MPU memory management subsystem, provide struct page_info and
> the MPU implementation for helpers and macros used in the common
> arm code.
> 
> Moving virt_to_page helper to mmu/mpu part is not easy as it needs
> visibility of 'struct page_info', so protect it with CONFIG_MMU
> and provide the MPU variant in the #else branch.

Have you considered including "asm/{mmu,mpu}/mm.h" **after** struct 
page_info is declared?
> 
> Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
> pdx.c.


Maybe clarify in the commit message that the frametable will be setup at 
a later stage?

> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/mm.h         | 18 ++++++++++++++++++
>   xen/arch/arm/include/asm/mpu/layout.h |  3 +++
>   xen/arch/arm/include/asm/mpu/mm.h     |  3 +++
>   xen/arch/arm/mpu/mm.c                 |  4 ++++
>   4 files changed, 28 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index e7767cdab493..c96d33aceaf0 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -341,6 +341,8 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
>   #define virt_to_mfn(va)     __virt_to_mfn(va)
>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>   
> +#ifdef CONFIG_MMU
> +
>   /* Convert between Xen-heap virtual addresses and page-info structures. */
>   static inline struct page_info *virt_to_page(const void *v)
>   {
> @@ -355,6 +357,22 @@ static inline struct page_info *virt_to_page(const void *v)
>       return frame_table + pdx - frametable_base_pdx;
>   }
>   
> +#else /* !CONFIG_MMU */
> +
> +/* Convert between virtual address to page-info structure. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    unsigned long pdx;
> +
> +    pdx = paddr_to_pdx(virt_to_maddr(v));
> +    ASSERT(pdx >= frametable_base_pdx);
> +    ASSERT(pdx < frametable_pdx_end);
> +
> +    return frame_table + pdx - frametable_base_pdx;
> +}
> +
> +#endif /* CONFIG_MMU */
> +
>   static inline void *page_to_virt(const struct page_info *pg)
>   {
>       return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
> index 248e55f8882d..c46b634c9c15 100644
> --- a/xen/arch/arm/include/asm/mpu/layout.h
> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -3,6 +3,9 @@
>   #ifndef __ARM_MPU_LAYOUT_H__
>   #define __ARM_MPU_LAYOUT_H__
>   
> +#define FRAMETABLE_SIZE   GB(32)

I guess you copied the value for the MMU code for arm64. But is this 
value still sensible for MPU? What about arm32?

In any case, some documentation would be useful.

> +#define FRAMETABLE_NR     (FRAMETABLE_SIZE / sizeof(*frame_table))
> +
>   #define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 57f1e558fd44..2219c9979548 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -5,6 +5,9 @@
>   
>   #include <xen/macros.h>
>   
> +extern struct page_info *frame_table;
> +extern unsigned long frametable_pdx_end;
> +
>   #define virt_to_maddr(va) ({  \
>       (paddr_t)va;              \
>   })
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index a11e017d8a96..4036dd62eeeb 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -3,6 +3,10 @@
>   #include <xen/lib.h>
>   #include <xen/init.h>
>   #include <xen/sizes.h>
> +#include <xen/mm.h>
> +
> +struct page_info *frame_table;
> +unsigned long __read_mostly frametable_pdx_end;
>   
>   static void __init __maybe_unused build_assertions(void)
>   {

Cheers,

-- 
Julien Grall


