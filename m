Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6B3BC820
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150903.278959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gp8-0007Ed-Tl; Tue, 06 Jul 2021 08:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150903.278959; Tue, 06 Jul 2021 08:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gp8-0007CX-PK; Tue, 06 Jul 2021 08:52:58 +0000
Received: by outflank-mailman (input) for mailman id 150903;
 Tue, 06 Jul 2021 08:52:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0gp7-0007CK-56
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:52:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gp6-000583-92; Tue, 06 Jul 2021 08:52:56 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gp6-0005EP-36; Tue, 06 Jul 2021 08:52:56 +0000
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
	bh=FYnvd6uqx0mlO7XrKC5zYnJuW7ylA9ieaveq1ZstUK0=; b=08iqHiq8Jg6PTF50eR3nzZmt3y
	qvQwvWrV+itJ1p9QpGOTEiVwMtVvdgs1fQZPwmNp4tBwZb+QhEpDmLF6zZf8c1Y0DTIMD+2ewssk3
	x9j2rx78YgjwXVvCS4Qc9c+RnZBDFWRuDEQ3hrt8p9WJknbFhdCOOCWnFkSXOL1YYOr4=;
Subject: Re: [PATCH V2] xen/arm: bootfdt: Always sort memory banks
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1625507331-17934-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5efd21da-bd26-64bd-4a79-67a955addbd1@xen.org>
Date: Tue, 6 Jul 2021 09:52:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625507331-17934-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/07/2021 18:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> At the moment, Xen on Arm64 expects the memory banks to be ordered.
> Unfortunately, there may be a case when updated by firmware
> device tree contains unordered banks. This means Xen will panic
> when setting xenheap mappings for the subsequent bank with start
> address being less than xenheap_mfn_start (start address of
> the first bank).
> 
> As there is no clear requirement regarding ordering in the device
> tree, update code to be able to deal with by sorting memory
> banks. There is only one heap region on Arm32, so the sorting
> is fine to be done in the common code.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> ---
>     V2:
>     - add Stefano's R-b
>     - clarify patch description
>     - clarify comment in code
>     - drop "if (bootinfo.mem.nr_banks > 1)" check
> ---
>   xen/arch/arm/bootfdt.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index dcff512..476e32e 100644
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
> @@ -412,6 +428,15 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>       add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>   
>       device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
> +
> +    /*
> +     * On Arm64 setup_xenheap_mappings() expects to be called with the lowest
> +     * bank in memory first. There is no requirement that the DT will provide
> +     * the banks sorted in ascending order. So sort them through.
> +     */
> +    sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
> +         cmp_memory_node, NULL);
> +
>       early_print_info();
>   
>       return fdt_totalsize(fdt);
> 

-- 
Julien Grall

