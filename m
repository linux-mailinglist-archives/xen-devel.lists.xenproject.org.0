Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8875A33229
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886822.1296421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKx2-0004Mf-8X; Wed, 12 Feb 2025 22:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886822.1296421; Wed, 12 Feb 2025 22:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKx2-0004LD-4r; Wed, 12 Feb 2025 22:11:24 +0000
Received: by outflank-mailman (input) for mailman id 886822;
 Wed, 12 Feb 2025 22:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiKx0-0004L7-GC
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:11:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49370f9e-e98e-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 23:11:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FDF05C6273;
 Wed, 12 Feb 2025 22:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567A8C4CEDF;
 Wed, 12 Feb 2025 22:11:17 +0000 (UTC)
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
X-Inumbo-ID: 49370f9e-e98e-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739398278;
	bh=WRQjd3QSSVI4pjhCSfLOqy1+ebE7i3gmDlIzFyPcA/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M4UblbpnCWeLNgX5CvVmcPo1UJQsD0cXr9k0z9/8S28+jj4RlwNW0qzkp7vJo/QPB
	 6D5RyF8oHYN7ye/jXIZzUnSGW8EiAZILt+Ubo5u/ZtHUbgQqVV9cMXhU9NTrMtqmt1
	 ell4ug3yRmXfORW3ReyY1GAxjHpBAMUQwgmFl1urNHtOq/uNM507DYtR/EJBA5ZuBX
	 KVZ/wv4GPMx4vrEBDFo7oGgS1BSbqi3YFO2/rW1jnaW/kGKmyykikjWS3C+DV89o0i
	 hnItx73p1YuwmZVCHeHZfiulOiuj+jVWbmYguAXXmnIoHPDd2DkFJNrwt1AmA37TNF
	 1BWPFYbFmutVw==
Date: Wed, 12 Feb 2025 14:11:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <gragst.linux@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, Jason.Andryuk@amd.com
Subject: Re: [RFC PATCH] arm: dom0: allow static memory configuration
In-Reply-To: <20250212164724.2575624-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2502121407330.619090@ubuntu-linux-20-04-desktop>
References: <20250212164724.2575624-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, Grygorii Strashko wrote:
> The Arm Xen allocates memory to place Dom0 following the logic described in
> allocate_memory_11() function which is a bit complicated with major
> requirement to place Dom0 within the first 128MB of RAM and below 4G. But
> this doesn't guarantee it will be placed at the same physical base address
> even between two boots with different configuration (changing the Kernel
> image size or Initrd size may cause Dom0 base address to change).
> 
> In case of "thin Dom0" use case, when Dom0 implemented with RTOS like
> Zephyr, which doesn't use dynamic device-tree parsing, such behavior
> causes a lot of inconvenience as it is required to perform modification and
> recompiling of Zephyr image to adjust memory layout.
> 
> It also prevents from using Initrd with Zephyr, for example, as it's
> expected to be placed at known, fixed address in memory.
> 
> This RFC patch introduces the possibility to place Dom0 at fixed physical
> base address, by checking if "chosen" node contains property
> "xen,static-mem" and placs Dom0 exactly at the specified memory chunk.
> 
> The implementation follows the same approach as for the static, direct-mapped
> guest domain in case of dom0less boot.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

I fully support this idea and the addition of static memory support to
Dom0. However, I would suggest a different approach regarding the device
tree binding. Specifically, I would prefer to avoid introducing
additional top-level properties for Dom0 under /chosen.

Instead, we should create a domain node for Dom0 under /chosen, like we
do for other DomUs. Jason is currently working on adding a capability
properties to the Dom0less domain nodes, allowing us to specify whether
a domain is the hardware domain, the control domain, or both
(effectively making it Dom0). Once this is in place, we can use
static-mem for Dom0 in the same way as always.


> ---
>  docs/misc/arm/device-tree/booting.txt | 20 ++++++++++++++++++++
>  xen/arch/arm/domain_build.c           | 12 +++++++++---
>  xen/common/device-tree/bootfdt.c      | 14 ++++++++++++++
>  3 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 9c881baccc19..485dcb82de8c 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -448,6 +448,26 @@ device-tree:
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
>  
> +Dom0 Static Allocation
> +======================
> +
> +The Memory can be statically allocated to a Dom0 using the property
> +"xen,static-mem" defined under the "\chosen" node. This options allows to use
> +RTOS as the dom0 kernel, which support only static memory layout.
> +
> +Below is an DT example:
> +
> +    / {
> +        chosen {
> +            #address-cells = <0x1>;
> +            #size-cells = <0x1>;
> +            xen,static-mem = <0x50000000 0x8000000>;
> +            ...
> +    };
> +
> +This will reserve a 128MB region starting at the host physical address
> +0x50000000 to be exclusively used by Dom0.
> +
>  Static Event Channel
>  ====================
>  The event channel communication will be established statically between two
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7b47abade196..8ee280614813 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -31,6 +31,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/dom0less-build.h>
>  #include <asm/domain_build.h>
> +#include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  #include <xen/event.h>
>  
> @@ -2272,6 +2273,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>  static int __init construct_dom0(struct domain *d)
>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
> +    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
>      int rc;
>  
>      /* Sanity! */
> @@ -2305,10 +2307,14 @@ static int __init construct_dom0(struct domain *d)
>      d->arch.type = kinfo.type;
>  #endif
>      find_gnttab_region(d, &kinfo);
> -    if ( is_domain_direct_mapped(d) )
> -        allocate_memory_11(d, &kinfo);
> -    else
> +    if ( is_domain_direct_mapped(d) ) {
> +        if ( !dt_find_property(chosen, "xen,static-mem", NULL) )
> +            allocate_memory_11(d, &kinfo);
> +        else
> +            assign_static_memory_11(d, &kinfo, chosen);
> +    } else {
>          allocate_memory(d, &kinfo);
> +    }
>  
>      rc = process_shm_chosen(d, &kinfo);
>      if ( rc < 0 )
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 529c91e603ab..563a5436fac0 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -413,6 +413,20 @@ static int __init process_chosen_node(const void *fdt, int node,
>          using_static_heap = true;
>      }
>  
> +    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
> +    {
> +        int rc;
> +
> +        printk("Checking for static static-mem in /chosen\n");
> +
> +        rc = device_tree_get_meminfo(fdt, node, "xen,static-mem",
> +                                     address_cells, size_cells,
> +                                     bootinfo_get_reserved_mem(),
> +                                     MEMBANK_STATIC_DOMAIN);
> +        if ( rc )
> +            return rc;
> +    }
> +
>      printk("Checking for initrd in /chosen\n");
>  
>      prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
> -- 
> 2.34.1
> 

