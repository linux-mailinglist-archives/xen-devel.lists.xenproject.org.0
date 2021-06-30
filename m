Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A23B7F74
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 10:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148155.273724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyW13-0005sh-TG; Wed, 30 Jun 2021 08:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148155.273724; Wed, 30 Jun 2021 08:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyW13-0005qs-Pk; Wed, 30 Jun 2021 08:56:17 +0000
Received: by outflank-mailman (input) for mailman id 148155;
 Wed, 30 Jun 2021 08:56:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyW12-0005qm-Hz
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 08:56:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyW11-0001UY-IP; Wed, 30 Jun 2021 08:56:15 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyW11-00077d-CB; Wed, 30 Jun 2021 08:56:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lGhntIi5d+bmdzCK2WNo2xd11yeTsL100l83DZuVED8=; b=UB1JcPx7lcEhm5tdtUAGExPzHz
	tSX5TjE8r/UHHxo7y3fJag/Pk36j+OoG2wwaWy9Imt7KYQZuYMZ0Q9nTn3xhTHSkn61ZT23I1FTTW
	vZavP0tcmPQHurW/INQS0jjr2STst7z0NjyHYEOOO4FBZRLNecxKmLnWDyf9j1HrWpOg=;
Subject: Re: [PATCH] xen/arm: bootfdt: Always sort memory banks
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1623699267-9475-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <47cbf077-8681-7ac4-04e2-f31e1fa4c04f@xen.org>
Date: Wed, 30 Jun 2021 09:56:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623699267-9475-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 14/06/2021 20:34, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> At the moment, Xen expects the memory banks to be ordered.
> Unfortunately, there may be a case when updated by firmware
> device tree contains unordered banks. This means Xen will panic
> when setting xenheap mappings for the subsequent bank with start
> address being less than xenheap_mfn_start (start address of
> the first bank).

Please clarify in the commit message that the behavior you are 
describing is for arm64. For arm32, there is only one heap region.

That said, I think the sorting is fine to be done in common code.

> 
> As there is no clear requirment regarding ordering in the device

s/requirment/requirement/

> tree, update code to be able to deal with by sorting memory
> banks if we have more than one.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> 
> The proposed commit fixes the booting Xen on R-Car M3-W+ SoC:
> 
> Starting kernel ...
> - UART enabled -
> - Boot CPU booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Zero BSS -
> - Ready -
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000084000040-0000000085dbc32a
> (XEN) RAM: 0000000480000000 - 00000004ffffffff
> (XEN) RAM: 0000000048000000 - 00000000bfffffff
> (XEN) RAM: 0000000600000000 - 00000006ffffffff
> 
> ...
> 
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) cannot add xenheap mapping at 48000 below heap start 480000
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> ---
>   xen/arch/arm/bootfdt.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index dcff512..3ef63b3 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -13,6 +13,7 @@
>   #include <xen/init.h>
>   #include <xen/device_tree.h>
>   #include <xen/libfdt/libfdt.h>
> +#include <xen/sort.h>
>   #include <xsm/xsm.h>
>   #include <asm/setup.h>
>   
> @@ -395,6 +396,21 @@ static void __init early_print_info(void)
>       printk("\n");
>   }
>   
> +/* This function assumes that memory regions are not overlapped */
> +static int __init cmp_memory_node(const void *key, const void *elem)
> +{
> +    const struct membank *handler0 = key;
> +    const struct membank *handler1 = elem;
> +
> +    if ( handler0->start < handler1->start )
> +        return -1;
> +
> +    if ( handler0->start >= (handler1->start + handler1->size) )
> +        return 1;
> +
> +    return 0;
> +}
> +
>   /**
>    * boot_fdt_info - initialize bootinfo from a DTB
>    * @fdt: flattened device tree binary
> @@ -412,6 +428,12 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>       add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>   
>       device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
> +    if ( bootinfo.mem.nr_banks > 1 )

NIT: sort() is already be able to deal with one element array. So this 
checks looks a bit pointless.

> +    {
> +        /* Some DT may describe unordered banks, sort them in ascending order */

It would be good to explain in the comment *why* this is necessary. Some 
along the line:

On Arm64, setup_xenheap_pages() expects to be called with the lowest 
bank in memory first. There is no requirement that the DT will provide 
the banks sorted in ascending order. So sort them through.

> +        sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
> +             cmp_memory_node, NULL);
> +    }
>       early_print_info();
>   
>       return fdt_totalsize(fdt);
> 

Cheers,

-- 
Julien Grall

