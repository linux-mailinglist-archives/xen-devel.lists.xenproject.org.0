Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E069293840C
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jul 2024 10:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761363.1171329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVSHz-0001Ct-Vr; Sun, 21 Jul 2024 08:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761363.1171329; Sun, 21 Jul 2024 08:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVSHz-0001A5-S0; Sun, 21 Jul 2024 08:51:31 +0000
Received: by outflank-mailman (input) for mailman id 761363;
 Sun, 21 Jul 2024 08:51:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVSHy-00019s-GL
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2024 08:51:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVSHy-00027z-9W; Sun, 21 Jul 2024 08:51:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVSHy-000669-3U; Sun, 21 Jul 2024 08:51:30 +0000
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
	bh=PI3Fdo00YqVhtnzAKj8Bn/b3XenRQhPTz/sGfiwaJxQ=; b=mjXfIDtuEDO8h55RjegyG6OFc8
	NdAnr+koKveoYZVQRiYQT8j81Z+0UErNydTJAhXLFKcELHtWJJlIQ2F1M/I77r/VUkZFal/nOqqrN
	dIxcrkLzNX76KfFK1bqtNg5NAKKVhQsuzs6yzkfdBTIjfxh0AOmJRlEns4o7HHOdLzAk=;
Message-ID: <15375179-1c94-43c3-a256-42a856905e21@xen.org>
Date: Sun, 21 Jul 2024 09:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 12/07/2024 17:22, Oleksii Kurochko wrote:
> Introduces arch_pmap_{un}map functions and select HAS_PMAP
> for CONFIG_RISCV.
> 
> Additionaly it was necessary to introduce functions:
>   - mfn_to_xen_entry
>   - mfn_to_pte
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>   - newly introduced patch
> ---
>   xen/arch/riscv/Kconfig            |  1 +
>   xen/arch/riscv/include/asm/page.h |  2 ++
>   xen/arch/riscv/include/asm/pmap.h | 28 ++++++++++++++++++++++++++++
>   xen/arch/riscv/mm.c               | 14 ++++++++++++++
>   4 files changed, 45 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/pmap.h
> 
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index 259eea8d3b..0112aa8778 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -3,6 +3,7 @@ config RISCV
>   	select FUNCTION_ALIGNMENT_16B
>   	select GENERIC_BUG_FRAME
>   	select HAS_DEVICE_TREE
> +	select HAS_PMAP
>   
>   config RISCV_64
>   	def_bool y
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index cbbf3656d1..339074d502 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -51,6 +51,8 @@ typedef struct {
>   #endif
>   } pte_t;
>   
> +pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
> +
>   static inline pte_t paddr_to_pte(paddr_t paddr,
>                                    unsigned int permissions)
>   {
> diff --git a/xen/arch/riscv/include/asm/pmap.h b/xen/arch/riscv/include/asm/pmap.h
> new file mode 100644
> index 0000000000..eb4c48515c
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/pmap.h
> @@ -0,0 +1,28 @@
> +#ifndef __ASM_PMAP_H__
> +#define __ASM_PMAP_H__
> +
> +#include <xen/bug.h>
> +#include <xen/mm.h>
> +
> +#include <asm/fixmap.h>
> +
> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    pte_t *entry = &xen_fixmap[slot];
> +    pte_t pte;
> +
> +    ASSERT(!pte_is_valid(*entry));
> +
> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> +    pte.pte |= PTE_LEAF_DEFAULT;
> +    write_pte(entry, pte);
> +}
> +
> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    pte_t pte = {};
> +
> +    write_pte(&xen_fixmap[slot], pte);
> +}
> +
> +#endif /* __ASM_PMAP_H__ */
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index d69a174b5d..445319af08 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -370,3 +370,17 @@ int map_pages_to_xen(unsigned long virt,
>       BUG_ON("unimplemented");
>       return -1;
>   }
> +
> +static inline pte_t mfn_to_pte(mfn_t mfn)
> +{
> +    unsigned long pte = mfn_x(mfn) << PTE_PPN_SHIFT;
> +    return (pte_t){ .pte = pte};
> +}
> +
> +inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
> +{
> +    /* there is no attr field in RISC-V's pte */
> +    (void) attr;

Surely you have a way to say indicate whether an entry is readable/writable?

> +
> +    return mfn_to_pte(mfn);
> +}

Cheers,

-- 
Julien Grall

