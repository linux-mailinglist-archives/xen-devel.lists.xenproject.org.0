Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8058B1289
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 20:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711625.1111735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzhYd-0007d3-Qr; Wed, 24 Apr 2024 18:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711625.1111735; Wed, 24 Apr 2024 18:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzhYd-0007bD-O1; Wed, 24 Apr 2024 18:41:27 +0000
Received: by outflank-mailman (input) for mailman id 711625;
 Wed, 24 Apr 2024 18:41:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rzhYb-0007b6-Ri
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 18:41:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzhYb-0008O9-Br; Wed, 24 Apr 2024 18:41:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzhYb-0002lJ-5C; Wed, 24 Apr 2024 18:41:25 +0000
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
	bh=jR1onqnm5csBjL16q9moFWdQYXT1dM7M5XH8iFO/IVA=; b=JodfK3Qbv5rm7C/P09++upi1eF
	1JfOb4SJ66FuDQlxerVNPGsnRpj+I9hcnHT/xR1Qq6dMUJTXXK6bLMTid9Gm5uEQaJ3BPTt7eEF5Q
	MFVYYy34x0UdjGWAmq8kjHKbIljd26AXsOq4+vWO5ZBmmOnm8rzcIkB7euN5LFcRr0wI=;
Message-ID: <0cd870be-712e-4fee-a18f-cb651341edaf@xen.org>
Date: Wed, 24 Apr 2024 19:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <46e6d4ddd74b9ecc4937d1086efe06eb39c499dd.1712893887.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <46e6d4ddd74b9ecc4937d1086efe06eb39c499dd.1712893887.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 12/04/2024 04:55, Shawn Anastasio wrote:
> Enable usage of bootfdt for populating the boot info struct from the
> firmware-provided device tree.  Also enable the Xen boot page allocator.
> 
> Additionally, modify bootfdt.c's boot_fdt_info() to tolerate the
> scenario in which the FDT overlaps a reserved memory region, as is the
> case on PPC when booted directly from skiboot. Since this means that Xen
> can now boot without a BOOTMOD_FDT present in bootinfo, clarify this
> fact in a comment above BOOTMOD_FDT's definition.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> Changes in v4:
>    - drop unnecessary libfdt.h include in setup.c
>    - make boot_fdt and xen_bootmodule const
>    - more clearly document that BOOTMOD_FDT is now optional
>    - add explicit (void) cast to BOOTMOD_FDT creation
> 
>   xen/arch/ppc/setup.c             | 22 +++++++++++++++++++++-
>   xen/common/device-tree/bootfdt.c | 11 +++++++++--
>   xen/include/xen/bootfdt.h        |  7 +++++++
>   3 files changed, 37 insertions(+), 3 deletions(-)

The changes look overall good. I have a few remark belows. But you can 
have my acked-by with or without the NIT addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
> index 101bdd8bb6..47e997969f 100644
> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -1,12 +1,15 @@
>   /* SPDX-License-Identifier: GPL-2.0-or-later */
>   #include <xen/init.h>
>   #include <xen/lib.h>
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>

We are tryying to keep the header order alphabetically. It looks like 
the existing code is respecting that. So can this be done for the two 
new headers?

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
> @@ -24,6 +27,9 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>                                  unsigned long r5, unsigned long r6,
>                                  unsigned long r7)
>   {
> +    const void *boot_fdt;
> +    const struct bootmodule *xen_bootmodule;
> +
>       if ( r5 )
>       {
>           /* Unsupported OpenFirmware boot protocol */
> @@ -32,11 +38,25 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>       else
>       {
>           /* kexec boot protocol */
> -        boot_opal_init((void *)r3);
> +        boot_fdt = (void *)r3;

NIT: Sorry I should have noticed it earlier. boot_fdt is only used to ..

> +        boot_opal_init(boot_fdt);
>       }
> 
>       setup_exceptions();
> 
> +    device_tree_flattened = boot_fdt;

... set device_tree_flattened and ...

> +    boot_fdt_info(boot_fdt, r3);


... used here. Is there any plan to have device_tree_flattened != 
boot_fdt? If not, then I would suggest to simply drop boot_fdt.

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
> index f01a5b5d76..76d0f72ef9 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -542,12 +542,19 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
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
> +    (void)add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> +
>       /*
>        * On Arm64 setup_directmap_mappings() expects to be called with the lowest
>        * bank in memory first. There is no requirement that the DT will provide
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 577618da16..ea3ad96bb9 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -13,7 +13,14 @@
> 
>   typedef enum {
>       BOOTMOD_XEN,
> +
> +    /*
> +     * The BOOTMOD_FDT type will only be present when the firmware-provided FDT
> +     * blob exists outside of a reserved memory region which is platform-
> +     * dependent and may not be relied upon.
> +     */
>       BOOTMOD_FDT,
> +
>       BOOTMOD_KERNEL,
>       BOOTMOD_RAMDISK,
>       BOOTMOD_XSM,
> --
> 2.30.2
> 

Cheers,

-- 
Julien Grall

