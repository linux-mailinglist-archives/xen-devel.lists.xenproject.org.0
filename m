Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79E4D8DA3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 20:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290445.492570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqqg-0006pv-AW; Mon, 14 Mar 2022 19:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290445.492570; Mon, 14 Mar 2022 19:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqqg-0006n8-72; Mon, 14 Mar 2022 19:59:22 +0000
Received: by outflank-mailman (input) for mailman id 290445;
 Mon, 14 Mar 2022 19:59:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTqqd-0006n2-UT
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 19:59:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqqc-0003nJ-PZ; Mon, 14 Mar 2022 19:59:18 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqqc-0007g6-IS; Mon, 14 Mar 2022 19:59:18 +0000
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
	bh=TCx7fjvhguwkk+Gvjd1ppgqZnz4Y5FhQ+r0yB8QX7ac=; b=IfC/oC3Z5StuHbDJ0fx2H6UWtV
	HoEfkkiGbUzV8f8CIYFqEkbfmG5elyp2PMenLEildzoDTCXWA3DUStgxT7tTRvmW9QEOiuEj/gTtA
	T3TYzhWY6TPwaA4J1Oubn81uBC4D1QRhK6KQOoH2/OIFXYWYONrymrnyQOBNinELXTBs=;
Message-ID: <615a8ef4-57f5-7499-eba9-10c025c9e062@xen.org>
Date: Mon, 14 Mar 2022 19:59:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 26/36] xen/arm: add argument to remove_early_mappings
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-27-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-27-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Upcoming patches will need to remove temporary mappings created during
> Xen coloring process. The function remove_early_mappings does what we
> need but it is case-specific. Parametrize the function to avoid code
> replication.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Acked-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/include/asm/mm.h | 2 +-
>   xen/arch/arm/mm.c             | 8 ++++----
>   xen/arch/arm/setup.c          | 3 ++-
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 9ac1767595..041ec4ee70 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -184,7 +184,7 @@ extern void setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr);
>   /* Map FDT in boot pagetable */
>   extern void *early_fdt_map(paddr_t fdt_paddr);
>   /* Remove early mappings */
> -extern void remove_early_mappings(void);
> +extern void remove_early_mappings(unsigned long va, unsigned long size);
>   /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
>    * new page table */
>   extern int init_secondary_pagetables(int cpu);
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index fd7a313d88..d69f18b5d2 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -597,13 +597,13 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>       return fdt_virt;
>   }
>   
> -void __init remove_early_mappings(void)
> +void __init remove_early_mappings(unsigned long va, unsigned long size)
>   {
>       lpae_t pte = {0};
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
> +    write_pte(xen_second + second_table_offset(va), pte);
> +    write_pte(xen_second + second_table_offset(va + size),
>                 pte);

The original goal of this code was to remove 2 entries. Each entry 
covering 2MB.

Anyone calling with size == 2MB will expect a single mapping to be 
removed. But 4MB worth of memory will be removed.

Effectively, remove_early_mappings() is not generic enough to be 
parametrized. I also don't think this function should be parametrized.
The goal is to remove any mappings that was created during early boot.

I will have a look at how you use it before making any suggestions.

Cheers,

-- 
Julien Grall

