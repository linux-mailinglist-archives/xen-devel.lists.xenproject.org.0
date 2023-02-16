Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FD699FCD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 23:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496791.767674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSmol-0007jG-5l; Thu, 16 Feb 2023 22:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496791.767674; Thu, 16 Feb 2023 22:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSmol-0007h2-30; Thu, 16 Feb 2023 22:33:31 +0000
Received: by outflank-mailman (input) for mailman id 496791;
 Thu, 16 Feb 2023 22:33:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pSmok-0007gu-4G
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 22:33:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pSmoj-0000hW-Nz; Thu, 16 Feb 2023 22:33:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pSmoj-0007a8-IU; Thu, 16 Feb 2023 22:33:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=8KOqu+hsOPhy8ulYKnML01YNS9evV4nnF+ZF1pw+LSY=; b=1kLmKDZWgE88ZDNGbp0z2zRMB9
	V2Cgp100waCev2F0/y0aesjPiS5uaRi43dTmjhsXsw52OVn8j31et2zF36ggWHVgAcBa9RuwtxXIW
	RnWtz91qVXKxvoMNattxiE8pQcvcEn+htvoDxzboHiyKeZ8/0wuOZUFkESeOtl7zaxJM=;
Message-ID: <085d7520-8b13-ef9e-1c39-55c0062777df@xen.org>
Date: Thu, 16 Feb 2023 22:33:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, jgrall@amazon.com, stefano.stabellini@amd.com
References: <20230213124438.14836-1-ayan.kumar.halder@amd.com>
 <20230213124438.14836-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v6 2/2] xen/arm: domain_build: Use pfn start and end address
 for rangeset_{xxx}_range()
In-Reply-To: <20230213124438.14836-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

The title is a bit strange to read as a 'pfn' is not an address. So how 
about:

xen/arm: domain_build: Track unallocated pages using the frame number

On 13/02/2023 12:44, Ayan Kumar Halder wrote:
> rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
> arguments which are either 'uint64_t' or 'paddr_t'. However, the function
> accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
> ARM_32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
> 'unsigned long' when invoking rangeset_{xxx}_range().
> 
> However, it may seem there is a possibility of lose of data due to truncation.
> 
> In reality, 'start' and 'size' are always page aligned. And ARM_32 currently
> supports 40 bits as the width of physical address.
> So if the addresses are page aligned, the last 12 bits contain zeroes.
> Thus, we could instead pass page frame number which will contain 28 bits (40-12
> on Arm_32) and this can be represented using 'unsigned long'.
> 
> On Arm_64, this change will not induce any adverse side effect as the width of
> physical address is 48 bits. Thus, the width of 'pfn' (ie 48 - 12 = 36) can be

Technically, this will an MFN rather than PFN (Yes, I now the macro is 
called PFN_DOWN() but this is a generic name).

> represented using 'unsigned long' (which is 64 bits wide).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - v5 - NA (New patch introduced in v6).
> 
>   xen/arch/arm/domain_build.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a798e0b256..6a8c7206ae 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1566,7 +1566,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>       {
>           start = bootinfo.mem.bank[i].start;
>           end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
> -        res = rangeset_add_range(unalloc_mem, start, end - 1);
> +        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
> +                                 PFN_DOWN(end - 1));
>           if ( res )
>           {
>               printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1580,7 +1581,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>       {
>           start = assign_mem->bank[i].start;
>           end = assign_mem->bank[i].start + assign_mem->bank[i].size;
> -        res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
> +                                    PFN_DOWN(end - 1));
>           if ( res )
>           {
>               printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1595,7 +1597,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>           start = bootinfo.reserved_mem.bank[i].start;
>           end = bootinfo.reserved_mem.bank[i].start +
>               bootinfo.reserved_mem.bank[i].size;
> -        res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
> +                                    PFN_DOWN(end - 1));
>           if ( res )
>           {
>               printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1607,7 +1610,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>       /* Remove grant table region */
>       start = kinfo->gnttab_start;
>       end = kinfo->gnttab_start + kinfo->gnttab_size;
> -    res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +    res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end - 1));
>       if ( res )
>       {
>           printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1617,7 +1620,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>   
>       start = 0;
>       end = (1ULL << p2m_ipa_bits) - 1;
> -    res = rangeset_report_ranges(unalloc_mem, start, end,
> +    res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
>                                    add_ext_regions, ext_regions);


I believe you also need to modify add_ext_regions() because the existing 
code expect an address and we will now provide a frame number.

>       if ( res )
>           ext_regions->nr_banks = 0;
> @@ -1639,7 +1642,7 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>   
>       start = addr & PAGE_MASK;
>       end = PAGE_ALIGN(addr + len);
> -    res = rangeset_remove_range(mem_holes, start, end - 1);
> +    res = rangeset_remove_range(mem_holes, PFN_DOWN(start),PFN_DOWN(end - 1));

Coding style: missing space after ","

>       if ( res )
>       {
>           printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1677,7 +1680,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>       /* Start with maximum possible addressable physical memory range */
>       start = 0;
>       end = (1ULL << p2m_ipa_bits) - 1;
> -    res = rangeset_add_range(mem_holes, start, end);
> +    res = rangeset_add_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
>       if ( res )
>       {
>           printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1708,7 +1711,8 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>   
>               start = addr & PAGE_MASK;
>               end = PAGE_ALIGN(addr + size);
> -            res = rangeset_remove_range(mem_holes, start, end - 1);
> +            res = rangeset_remove_range(mem_holes, PFN_DOWN(start),
> +                                        PFN_DOWN(end - 1));
>               if ( res )
>               {
>                   printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
> @@ -1735,7 +1739,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>   
>       start = 0;
>       end = (1ULL << p2m_ipa_bits) - 1;
> -    res = rangeset_report_ranges(mem_holes, start, end,
> +    res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>                                    add_ext_regions,  ext_regions); >       if ( res )
>           ext_regions->nr_banks = 0;

Cheers,

-- 
Julien Grall

