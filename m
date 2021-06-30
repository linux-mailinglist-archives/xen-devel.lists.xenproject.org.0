Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FA3B7B20
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 02:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148102.273579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyOQ3-0005qC-PE; Wed, 30 Jun 2021 00:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148102.273579; Wed, 30 Jun 2021 00:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyOQ3-0005oM-M9; Wed, 30 Jun 2021 00:49:35 +0000
Received: by outflank-mailman (input) for mailman id 148102;
 Wed, 30 Jun 2021 00:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZaJs=LY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lyOQ2-0005oG-5T
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 00:49:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f697942e-feb6-4786-a978-d05ff8c40066;
 Wed, 30 Jun 2021 00:49:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B6CC61D2A;
 Wed, 30 Jun 2021 00:49:32 +0000 (UTC)
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
X-Inumbo-ID: f697942e-feb6-4786-a978-d05ff8c40066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625014172;
	bh=eESDptVDqHkg/ybEAJw0VpjrApeyGOqpIjDuPfzboqQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e25hB2bOUkhg/ewBkh7aziZ08SO6nPshVwdYfrFozfqn0NIp3TOvwVMJGhOCcZzJn
	 pvAlEIRjNlmAZTOJqh4Ljh2k6iSunNAq+l4vBjjFW+q/MmniQArMlHiobgRdHP/H96
	 q3zpJZSjxG/p2BiEyfvtOgzQsD9A3Esw7knV9IFMung/82vZZOS8CMiXtEmnpgO6cv
	 s/g2kvMw2msxEUb/Zoowh2FQO9kk+4oJ/ml0jL2b2huAh1DdsGZ/FFgD3PrPwjHnAo
	 IJXhHP7zS+MSMgxNUsWT0xcDuAIwgTVmJAh1a3T1Ku5AkHlweWQbmiX4xfPe9WT8SK
	 qgO372X/XdUtw==
Date: Tue, 29 Jun 2021 17:49:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: bootfdt: Always sort memory banks
In-Reply-To: <1623699267-9475-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2106291747180.9437@sstabellini-ThinkPad-T480s>
References: <1623699267-9475-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Jun 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> At the moment, Xen expects the memory banks to be ordered.
> Unfortunately, there may be a case when updated by firmware
> device tree contains unordered banks. This means Xen will panic
> when setting xenheap mappings for the subsequent bank with start
> address being less than xenheap_mfn_start (start address of
> the first bank).
> 
> As there is no clear requirment regarding ordering in the device
> tree, update code to be able to deal with by sorting memory
> banks if we have more than one.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
>  xen/arch/arm/bootfdt.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index dcff512..3ef63b3 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -13,6 +13,7 @@
>  #include <xen/init.h>
>  #include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/sort.h>
>  #include <xsm/xsm.h>
>  #include <asm/setup.h>
>  
> @@ -395,6 +396,21 @@ static void __init early_print_info(void)
>      printk("\n");
>  }
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
>  /**
>   * boot_fdt_info - initialize bootinfo from a DTB
>   * @fdt: flattened device tree binary
> @@ -412,6 +428,12 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>      add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>  
>      device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
> +    if ( bootinfo.mem.nr_banks > 1 )
> +    {
> +        /* Some DT may describe unordered banks, sort them in ascending order */
> +        sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
> +             cmp_memory_node, NULL);
> +    }
>      early_print_info();
>  
>      return fdt_totalsize(fdt);
> -- 
> 2.7.4
> 

