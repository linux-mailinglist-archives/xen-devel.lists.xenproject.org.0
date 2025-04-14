Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2FA87FDE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949983.1346416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IRa-0000pJ-3V; Mon, 14 Apr 2025 11:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949983.1346416; Mon, 14 Apr 2025 11:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IRa-0000mS-0W; Mon, 14 Apr 2025 11:57:42 +0000
Received: by outflank-mailman (input) for mailman id 949983;
 Mon, 14 Apr 2025 11:57:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4IRY-0000m6-M2
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:57:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4IRY-00EpXY-0x;
 Mon, 14 Apr 2025 11:57:40 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4IRX-00DGdS-2e;
 Mon, 14 Apr 2025 11:57:40 +0000
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
	bh=VWXJh8tyxh2o3qgGrn+0nILB7QDtbSeXHz0k95U6BQA=; b=jkqFc/QLICsqF7bBS6NfvFPSS+
	grsZ1wm8U8nbRKr5zxF2AaJmcWibBuV6McLMNe4jPxi5ClYKozRu62E0FbI9oVrhZIeUVBGl7ll/F
	ggkiu9P0hsdiOBcw8FZHOHuoXONHU691LoEnGlEpANoyOVVvBk0CApt3PLUBsytQkSjE=;
Message-ID: <4f95b625-3013-4750-a5c9-67d346ee8c3b@xen.org>
Date: Mon, 14 Apr 2025 20:57:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm/mpu: Implement early_fdt_map support in MPU
 systems
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-7-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250411145655.140667-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/04/2025 23:56, Luca Fancellu wrote:
> Implement early_fdt_map() function, that is responsible to map the
> device tree blob in the early stages of the boot process, since at
> this stage the MPU C data structure are not yet initialised, it is
> using low level APIs to write into the MPU registers at a fixed
> MPU region number.
> 
> The MPU memory management is designed to work on pages of PAGE_SIZE
> in order to reuse helpers and macros already available on the Xen
> memory management system.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/mpu/setup.c | 54 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index b4da77003f47..5969065250d4 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -1,17 +1,67 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <xen/bootfdt.h>
>   #include <xen/bug.h>
>   #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>   #include <xen/mm.h>
> +#include <xen/pfn.h>
>   #include <xen/types.h>
> +#include <asm/mpu.h>
> +#include <asm/page.h>
>   #include <asm/setup.h>
>   
> +/* Needs to be kept in sync with the regions programmed in arm64/mpu/head.S */

This is common code. So you will need to keep in sync for both 32-bit 
and 64-bit. That said, someone modifying head.S will not necessarily 
remember that this needs to be kept in sync. Such comment would be more 
effective in head.S just after the last section.

However, the number of regions mapped can change. So I am not sure why 
we are...

> +#define EARLY_FDT_MAP_REGION_NUMBER 6

... hardcoding to 6 rather than using the next available region.

> +
>   void __init setup_pagetables(void) {}
>   
>   void * __init early_fdt_map(paddr_t fdt_paddr)
>   {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    /* Map at least a page containing the DTB address, exclusive range */
> +    paddr_t base_paddr = round_pgdown(fdt_paddr);

NIT:  IIRC, the minimum for the MPU is 64-byte. So is there any reason 
we are enforcing a bigger alignment?

> +    paddr_t end_paddr = round_pgup(fdt_paddr + sizeof(struct fdt_header));
> +    unsigned int flags = PAGE_HYPERVISOR_RO;
> +    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
> +    pr_t fdt_region;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /* Map the device tree blob header  */
> +    fdt_region = pr_of_xenaddr(base_paddr, end_paddr, PAGE_AI_MASK(flags));
> +    fdt_region.prbar.reg.ap = PAGE_AP_MASK(flags);
> +    fdt_region.prbar.reg.xn = PAGE_XN_MASK(flags);
> +
> +    write_protection_region(&fdt_region, EARLY_FDT_MAP_REGION_NUMBER);
> +    context_sync_mpu();
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    end_paddr = round_pgup(fdt_paddr + fdt_totalsize(fdt_virt));
> +
> +    /*
> +     * If the mapped range is not enough, map the rest of the DTB, pr_get_limit
> +     * returns an inclusive address of the range, hence the increment.
> +     */
> +    if ( end_paddr > (pr_get_limit(&fdt_region) + 1) )
> +    {
> +        pr_set_limit(&fdt_region, end_paddr);
> +
> +        write_protection_region(&fdt_region, EARLY_FDT_MAP_REGION_NUMBER);
> +        context_sync_mpu();
> +    }
> +
> +    return fdt_virt;
>   }
>   
>   /*

Cheers,

-- 
Julien Grall


