Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E194886039
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 19:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696575.1087626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMl2-00067B-E4; Thu, 21 Mar 2024 18:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696575.1087626; Thu, 21 Mar 2024 18:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMl2-000647-As; Thu, 21 Mar 2024 18:03:16 +0000
Received: by outflank-mailman (input) for mailman id 696575;
 Thu, 21 Mar 2024 18:03:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnMl0-000641-Vr
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 18:03:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMl0-0007N0-As; Thu, 21 Mar 2024 18:03:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMl0-0000J2-3g; Thu, 21 Mar 2024 18:03:14 +0000
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
	bh=lNNGrCXeJaRUT19jrx8oQBBUBWHZ6cVfX+QhAvyBrB0=; b=ECTqHKzcnQquQj5LXv+ike60hf
	5qrqNpEUc2aTdbfUj8lF/1dH2K6G3bwmdb8QQgxoS43bLKZVKuL4tWhs1KUtTG2WwMk818CObpTcb
	9FR4KupxfpXEOIvKQNtOSvukEWFVsZPFj5187WjG+Icqs5uupCt9gQY5X3IleZQfeD0Y=;
Message-ID: <34e40b31-632a-46a5-94ad-768fe928d410@xen.org>
Date: Thu, 21 Mar 2024 18:03:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <adebcaa145af5e3de7fba07dc84b0993866e98ac.1710443965.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <adebcaa145af5e3de7fba07dc84b0993866e98ac.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 14/03/2024 22:15, Shawn Anastasio wrote:
> Enable usage of bootfdt for populating the boot info struct from the
> firmware-provided device tree.  Also enable the Xen boot page allocator.
> 
> Includes minor changes to bootfdt.c's boot_fdt_info() to tolerate the
> scenario in which the FDT overlaps a reserved memory region, as is the
> case on PPC when booted directly from skiboot.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>   xen/arch/ppc/include/asm/setup.h |  5 +++++
>   xen/arch/ppc/setup.c             | 21 ++++++++++++++++++++-
>   xen/common/device-tree/bootfdt.c | 11 +++++++++--
>   3 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
> index 1b2d29c5b6..fe27f61fc3 100644
> --- a/xen/arch/ppc/include/asm/setup.h
> +++ b/xen/arch/ppc/include/asm/setup.h
> @@ -115,4 +115,9 @@ const char *boot_module_kind_as_string(bootmodule_kind kind);
>   struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
>   void populate_boot_allocator(void);
>   
> +/*
> + * bootfdt.c
> + */
> +size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> +
This function is common. So the prototype doesn't belong to a per-arch 
header.

>   #endif /* __ASM_PPC_SETUP_H__ */
> diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
> index 101bdd8bb6..946167a56f 100644
> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -1,12 +1,14 @@
>   /* SPDX-License-Identifier: GPL-2.0-or-later */
>   #include <xen/init.h>
>   #include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>

None of the code below doesn't seem to use libfdt.h directly. So why do 
you need it?

>   #include <xen/mm.h>
>   #include <public/version.h>
>   #include <asm/boot.h>
>   #include <asm/early_printk.h>
>   #include <asm/mm.h>
>   #include <asm/processor.h>
> +#include <asm/setup.h>
>   
>   /* Xen stack for bringing up the first CPU. */
>   unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
> @@ -24,6 +26,9 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>                                  unsigned long r5, unsigned long r6,
>                                  unsigned long r7)
>   {
> +    void *boot_fdt;
boot_fdt is not meant to be modified. So this should be const.

> +    struct bootmodule *xen_bootmodule;

Same here I guess.

> +
>       if ( r5 )
>       {
>           /* Unsupported OpenFirmware boot protocol */
> @@ -32,11 +37,25 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>       else
>       {
>           /* kexec boot protocol */
> -        boot_opal_init((void *)r3);
> +        boot_fdt = (void *)r3;
> +        boot_opal_init(boot_fdt);
>       }
>   
>       setup_exceptions();
>   
> +    device_tree_flattened = boot_fdt;
> +    boot_fdt_info(boot_fdt, r3);
> +
> +    /*
> +     * Xen relocates itself at the ppc64 entrypoint, so we need to manually mark
> +     * the kernel module.
> +     */
> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN, __pa(_start),
> +                                     PAGE_ALIGN(__pa(_end)), false);
> +    BUG_ON(!xen_bootmodule);
> +
> +    populate_boot_allocator();
> +
>       setup_initial_pagetables();
>   
>       early_printk("Hello, ppc64le!\n");
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 35dbdf3384..1985648b31 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -543,12 +543,19 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>       if ( ret < 0 )
>           panic("No valid device tree\n");
>   
> -    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> -
>       ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>       if ( ret )
>           panic("Early FDT parsing failed (%d)\n", ret);
>   
> +    /*
> +     * Add module for the FDT itself after the device tree has been parsed. This
> +     * is required on ppc64le where the device tree passed to Xen may have been
> +     * allocated by skiboot, in which case it will exist within a reserved
> +     * region and this call will fail. This is fine, however, since either way
> +     * the allocator will know not to step on the device tree.
> +     */
> +    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);

I am still a little bit concerned with this change. If there is an 
overlap, then BOOTMOD_FDT will not be created yet Xen will continue. I 
think this needs to be explained in the commit message and in the code 
(maybe on top of BOOTMOD_FDT which should be common). So it will be 
clearer that we cannot rely on BOOTMOD_FDT.

Also, there was some recent discussion for MISRA to check all return or 
use (void) + a comment to explain this is ignored. I think you have part 
of the explanation (see above for the second part), but I would also add 
(void) to make clear this was on purpose.

Cheers,

-- 
Julien Grall

