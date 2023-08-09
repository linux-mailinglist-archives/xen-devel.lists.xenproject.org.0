Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DE775AF4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580968.909470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTh7U-0005We-37; Wed, 09 Aug 2023 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580968.909470; Wed, 09 Aug 2023 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTh7U-0005UF-0N; Wed, 09 Aug 2023 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 580968;
 Wed, 09 Aug 2023 11:12:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTh7S-0005U9-9S
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:12:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTh7R-0006Cc-0p; Wed, 09 Aug 2023 11:12:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTh7Q-0003DF-PG; Wed, 09 Aug 2023 11:12:48 +0000
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
	bh=CrMdiQMaLptKwzaFPdJHhC2cjSee0EqW3qV3Mp3fBNk=; b=xTXIWhYiPuLPakdF4isNEislVp
	GxF8S5N5ud2kcHkwSerPp8WLk4mqf7RGP7S4o2dNf6meiLTCSdrVGdo7RiOG4TGbbad9Dra0ZqoHj
	daZevUnTFe74B0pGerld0Sy/RgEmNtq3kEb/tTLB6LrO/FwjaPNeP30DHsHKCHcS3sjo=;
Message-ID: <adcd1cb7-76e3-43b7-8c5d-0e5759f8a6e7@xen.org>
Date: Wed, 9 Aug 2023 12:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] move max_page and total_pages to common code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <f1653f8f-a2e3-5c91-0401-b5ab14415c86@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f1653f8f-a2e3-5c91-0401-b5ab14415c86@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/08/2023 11:47, Jan Beulich wrote:
> Common code references both, so the variables shouldn't need declaring
> and defining by every arch. While moving the definitions, add
> __read_mostly (__ro_after_init would only be appropriate when
> !mem_hotplug).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -198,9 +198,6 @@ extern unsigned long directmap_base_pdx;
>   /* PDX of the first page in the frame table. */
>   extern unsigned long frametable_base_pdx;
>   
> -extern unsigned long max_page;
> -extern unsigned long total_pages;
> -
>   #define PDX_GROUP_SHIFT SECOND_SHIFT
>   
>   /* Boot-time pagetable setup */
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -134,9 +134,6 @@ unsigned long directmap_base_pdx __read_
>   unsigned long frametable_base_pdx __read_mostly;
>   unsigned long frametable_virt_end __read_mostly;
>   
> -unsigned long max_page;
> -unsigned long total_pages;
> -
>   extern char __init_begin[], __init_end[];
>   
>   /* Checking VA memory layout alignment. */
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -337,8 +337,6 @@ struct page_info
>   #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
>   
>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> -extern unsigned long max_page;
> -extern unsigned long total_pages;
>   void init_frametable(void);
>   
>   #define PDX_GROUP_SHIFT L2_PAGETABLE_SHIFT
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -146,10 +146,6 @@ l1_pgentry_t __section(".bss.page_aligne
>   l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>       l1_fixmap_x[L1_PAGETABLE_ENTRIES];
>   
> -/* Frame table size in pages. */
> -unsigned long max_page;
> -unsigned long total_pages;
> -
>   bool __read_mostly machine_to_phys_mapping_valid;
>   
>   struct rangeset *__read_mostly mmio_ro_ranges;
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -162,6 +162,8 @@
>   #define PGT_TYPE_INFO_INITIALIZER 0
>   #endif
>   
> +unsigned long __read_mostly max_page;
> +unsigned long __read_mostly total_pages;
>   paddr_t __ro_after_init mem_hotplug;
>   
>   /*
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -159,6 +159,8 @@ int assign_page(
>   /* Dump info to serial console */
>   void arch_dump_shared_mem_info(void);
>   
> +extern unsigned long max_page;
> +extern unsigned long total_pages;
>   extern paddr_t mem_hotplug;
>   
>   /*

-- 
Julien Grall

