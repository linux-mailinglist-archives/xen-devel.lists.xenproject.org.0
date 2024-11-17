Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02869D04E7
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2024 18:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839001.1254807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjLq-00059k-SX; Sun, 17 Nov 2024 17:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839001.1254807; Sun, 17 Nov 2024 17:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCjLq-00057i-Py; Sun, 17 Nov 2024 17:46:22 +0000
Received: by outflank-mailman (input) for mailman id 839001;
 Sun, 17 Nov 2024 17:46:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCjLo-00057a-Vi
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2024 17:46:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjLo-009jOw-16;
 Sun, 17 Nov 2024 17:46:20 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCjLo-009VXh-16;
 Sun, 17 Nov 2024 17:46:20 +0000
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
	bh=HxHel5mrBc81e+58U8A+t9kgXtw76FWKgsI0PpPVX10=; b=MZN4HZjiZ4UdFM+3Kc2kZjcLVP
	/u2F+IsaSHbxPP5MAxP+Kn9eQdXLsjJAquN6LNKQRRJTjWRMMTgEvDZJcxSuW1rieuKTDG3A7z4jC
	aK/Q2KYl/o+MnyXzfRg3Q6BKD0ds1J4EjGNIexMUgoM//nDIpyf4TPb5LrUrQA+pDR8k=;
Message-ID: <e14ff136-f74c-43b6-aa7d-1c88f56f805d@xen.org>
Date: Sun, 17 Nov 2024 17:46:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm/setup: Move MMU specific extern declarations to
 mmu/mm.h
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241115105036.218418-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 15/11/2024 10:50, Luca Fancellu wrote:
> Move some extern declarations related to MMU structures and define
> from asm/setup.h to asm/mm.h, in order to increase encapsulation and

You are moving them to asm/mmu/mm.h. But I think I would prefer if they 
are moved to asm/mmu/setup.h because boot_* are not supposed to be used 
outside of boot. So it is clearer if they are still defined in a setup.h.

> allow the MPU part to build, since it has no clue about them.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/mmu/mm.h | 11 +++++++++++
>   xen/arch/arm/include/asm/setup.h  | 11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index c5e03a66bf9e..69b72d671012 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -12,6 +12,17 @@ extern vaddr_t directmap_virt_start;
>   extern unsigned long directmap_base_pdx;
>   #endif
>   
> +extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
> +
> +#ifdef CONFIG_ARM_64
> +extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
> +extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
> +#endif
> +extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
> +extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
> +extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
> +extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
> +
>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 64c227d171fc..3f5c6cf9a08b 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -65,17 +65,6 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
>   int map_range_to_domain(const struct dt_device_node *dev,
>                           uint64_t addr, uint64_t len, void *data);
>   
> -extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
> -
> -#ifdef CONFIG_ARM_64
> -extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
> -extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
> -#endif
> -extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
> -extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
> -extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
> -extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
> -
>   /* Find where Xen will be residing at runtime and return a PT entry */
>   lpae_t pte_of_xenaddr(vaddr_t va);

Shouldn't we move this function as well?

Cheers,

-- 
Julien Grall

