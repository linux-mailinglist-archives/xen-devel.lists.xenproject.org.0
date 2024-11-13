Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A816D9C71E2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 15:01:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835735.1251596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDvd-0001vU-UT; Wed, 13 Nov 2024 14:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835735.1251596; Wed, 13 Nov 2024 14:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDvd-0001tZ-RH; Wed, 13 Nov 2024 14:01:05 +0000
Received: by outflank-mailman (input) for mailman id 835735;
 Wed, 13 Nov 2024 14:01:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBDvc-0001tT-Ac
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 14:01:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBDvb-003H46-1j;
 Wed, 13 Nov 2024 14:01:03 +0000
Received: from [2a02:8012:3a1:0:2c06:4644:c8a3:2b5e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBDvb-00351H-1X;
 Wed, 13 Nov 2024 14:01:03 +0000
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
	bh=wd/Y+awqDcvOOp5XhmSlvSQU4bLSNwz/OAGtcupPKtg=; b=VkCrQ+/CLhiCFDtcqh//PElS9J
	fgWSe10I5vUFPCTkuDJnhHi4DwfY6uzupasqgJ6ZXF9hNbeZdcC2nXBOXX3vbUZTzGMBhHTBHaa4d
	DVtTO7ZeVA9XposHyLD4V/k7lgksMtR2kg/ZTkzouQitgSCnpbyhkq/VCsN7yUtnlxK8=;
Message-ID: <f0928350-0031-4f74-a61a-778e68a9f67b@xen.org>
Date: Wed, 13 Nov 2024 14:01:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241106134132.2185492-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 06/11/2024 13:41, Luca Fancellu wrote:
> There are some cases where the device tree exposes a memory range
> in both /memreserve/ and reserved-memory node, in this case the
> current code will stop Xen to boot since it will find that the
> latter range is clashing with the already recorded /memreserve/
> ranges.
> 
> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
> in the /memreserve/ part and even in this case this will prevent
> Xen to boot since it will see that the module memory range that
> it is going to add in 'add_boot_module' clashes with a /memreserve/
> range.
> 
> When Xen populate the data structure that tracks the memory ranges,
> it also adds a memory type described in 'enum membank_type', so
> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
> function to check for exact memory range match given a specific memory
> type; allowing reserved-memory node ranges and boot modules to have an
> exact match with ranges from /memreserve/.
> 
> While there, set a type for the memory recorded during ACPI boot.

I am a bit confused which you mention only ACPI boot. Isn't the path 
also used when booting using Device-Tree?

> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> I tested this patch adding the same range in a /memreserve/ entry and
> /reserved-memory node, and by letting u-boot pass a ramdisk.
> I've also tested that a configuration running static shared memory still works
> fine.
> ---
>   xen/arch/arm/efi/efi-boot.h       |  3 +-
>   xen/arch/arm/static-shmem.c       |  2 +-
>   xen/common/device-tree/bootfdt.c  |  9 +++++-
>   xen/common/device-tree/bootinfo.c | 48 ++++++++++++++++++++++++-------
>   xen/include/xen/bootfdt.h         |  9 +++++-
>   5 files changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 199f5260229d..d35c991c856f 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -167,13 +167,14 @@ static bool __init meminfo_add_bank(struct membanks *mem,
>       if ( mem->nr_banks >= mem->max_banks )
>           return false;
>   #ifdef CONFIG_ACPI
> -    if ( check_reserved_regions_overlap(start, size) )
> +    if ( check_reserved_regions_overlap(start, size, MEMBANK_NONE) )
>           return false;
>   #endif
>   
>       bank = &mem->bank[mem->nr_banks];
>       bank->start = start;
>       bank->size = size;
> +    bank->type = MEMBANK_DEFAULT;
>   
>       mem->nr_banks++;
>   
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index aa80756c3ca5..149ed4b0a5ba 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -696,7 +696,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>           if (i < mem->max_banks)
>           {
>               if ( (paddr != INVALID_PADDR) &&
> -                 check_reserved_regions_overlap(paddr, size) )
> +                 check_reserved_regions_overlap(paddr, size, MEMBANK_NONE) )
>                   return -EINVAL;
>   
>               /* Static shared memory shall be reserved from any other use. */
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 927f59c64b0d..fb3a6ab95a22 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -176,8 +176,15 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>       for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
>       {
>           device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        /*
> +         * Some valid device trees, such as those generated by OpenPOWER
> +         * skiboot firmware, expose all reserved memory regions in the
> +         * FDT memory reservation block AND in the reserved-memory node which
> +         * has already been parsed. Thus, any matching overlaps in the
> +         * reserved_mem banks should be ignored.
> +         */
>           if ( mem == bootinfo_get_reserved_mem() &&
> -             check_reserved_regions_overlap(start, size) )
> +             check_reserved_regions_overlap(start, size, MEMBANK_FDT_RESVMEM) )
>               return -EINVAL;
>           /* Some DT may describe empty bank, ignore them */
>           if ( !size )
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index f2e6a1145b7c..05038075e835 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -99,7 +99,8 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>    */
>   static bool __init meminfo_overlap_check(const struct membanks *mem,
>                                            paddr_t region_start,
> -                                         paddr_t region_size)
> +                                         paddr_t region_size,
> +                                         enum membank_type allow_match_type)

Looking at the callers, you only seem to pass MEMBANK_FDT_RESVMEM or 
MEMBANK_NONE. So I wonder whether it actually make sense to introduce 
MEMBANK_NONE. Wouldn't it be better to have a boolean indicating whether 
we are looking for FDT_RESVMEM?

>   {
>       paddr_t bank_start = INVALID_PADDR, bank_end = 0;
>       paddr_t region_end = region_start + region_size;
> @@ -113,12 +114,16 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>           if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
>                region_start >= bank_end )
>               continue;
> -        else
> -        {
> -            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
> -                   region_start, region_end, i, bank_start, bank_end);
> -            return true;
> -        }
> +
> +        if ( (allow_match_type != MEMBANK_NONE) &&
> +             (region_start == bank_start) && (region_end == bank_end) &&

Why is this only an exact match?

> +             (allow_match_type == mem->bank[i].type) )
> +            continue;
> +
> +        printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
> +                region_start, region_end, i, bank_start, bank_end);
> +        return true;
> +
>       }
>   
>       return false;
> @@ -169,9 +174,14 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>    * with the existing reserved memory regions defined in bootinfo.
>    * Return true if the input physical address range is overlapping with any
>    * existing reserved memory regions, otherwise false.
> + * The 'allow_match_type' parameter can be used to allow exact match of a
> + * region with another memory region already recorded, but it needs to be used
> + * only on memory regions that allows a type (reserved_mem, acpi). For all the
> + * other cases, passing 'MEMBANK_NONE' will disable the exact match.
>    */
>   bool __init check_reserved_regions_overlap(paddr_t region_start,
> -                                           paddr_t region_size)
> +                                           paddr_t region_size,
> +                                           enum membank_type allow_match_type)
>   {
>       const struct membanks *mem_banks[] = {
>           bootinfo_get_reserved_mem(),
> @@ -190,8 +200,21 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>        * shared memory banks (when static shared memory feature is enabled)
>        */
>       for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> -        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
> +    {
> +        enum membank_type type = allow_match_type;
> +
> +#ifdef CONFIG_STATIC_SHM
> +        /*
> +         * Static shared memory banks don't have a type, so for them disable
> +         * the exact match check.
> +         */

This feels a bit of a hack. Why can't we had a default type like you did 
in meminfo_add_bank()?

> +        if (mem_banks[i] == bootinfo_get_shmem())
> +            type = MEMBANK_NONE;
> +#endif
> +        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size,
> +                                   type) )
>               return true;
> +    }
>   
>       /* Check if input region is overlapping with bootmodules */
>       if ( bootmodules_overlap_check(&bootinfo.modules,
> @@ -216,7 +239,12 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>           return NULL;
>       }
>   
> -    if ( check_reserved_regions_overlap(start, size) )
> +    /*
> +     * u-boot adds boot module such as ramdisk to the /memreserve/, since these
> +     * ranges are saved in reserved_mem at this stage, allow an eventual exact
> +     * match with MEMBANK_FDT_RESVMEM banks.
> +     */
> +    if ( check_reserved_regions_overlap(start, size, MEMBANK_FDT_RESVMEM) )
>           return NULL;
>   
>       for ( i = 0 ; i < mods->nr_mods ; i++ )
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 16fa05f38f38..8f8a7ad882a4 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -23,6 +23,12 @@ typedef enum {
>   }  bootmodule_kind;
>   
>   enum membank_type {
> +    /*
> +     * The MEMBANK_NONE type is a special placeholder that should not be applied
> +     * to a memory bank, it is used as a special value in some function in order
> +     * to disable some feature.
> +     */
> +    MEMBANK_NONE = -1,
>       /*
>        * The MEMBANK_DEFAULT type refers to either reserved memory for the
>        * device/firmware (when the bank is in 'reserved_mem') or any RAM (when
> @@ -158,7 +164,8 @@ struct bootinfo {
>   extern struct bootinfo bootinfo;
>   
>   bool check_reserved_regions_overlap(paddr_t region_start,
> -                                    paddr_t region_size);
> +                                    paddr_t region_size,
> +                                    enum membank_type allow_match_type);
>   
>   struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                      paddr_t start, paddr_t size, bool domU);

Cheers,

-- 
Julien Grall


