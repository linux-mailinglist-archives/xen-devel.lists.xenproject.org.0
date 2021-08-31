Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9935B3FC093
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 03:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175417.319600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsv6-0001E4-Md; Tue, 31 Aug 2021 01:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175417.319600; Tue, 31 Aug 2021 01:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsv6-0001Br-I8; Tue, 31 Aug 2021 01:50:36 +0000
Received: by outflank-mailman (input) for mailman id 175417;
 Tue, 31 Aug 2021 01:50:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKsv4-0001Bl-UY
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 01:50:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3c4101c-4f87-4137-a061-3209b7006f58;
 Tue, 31 Aug 2021 01:50:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D03E560232;
 Tue, 31 Aug 2021 01:50:32 +0000 (UTC)
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
X-Inumbo-ID: b3c4101c-4f87-4137-a061-3209b7006f58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630374633;
	bh=fwAYCYhhlMGWtPB+4CoWte3RqbpW+k64wLUbbGR6GDM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oXtFje7wo6lMjm7sJDtrmO3YnMGDwBurY74XD6NmXFEX71CGL3ZGNQtEv6lOau+8q
	 0M6E/DUJtuMueguNRB7h+ZrgFWpmxBdWBz8KVDsrOXIwQvSDJOMPOEVN7Mgk1haHIt
	 wpf9DOAx5vLDc2xs+pNFj7UFSTn9KSW3frty50IYYYaS6kWq0nZdnFx20Xgr+6aB7W
	 sb/I3EjPgEzTSQnkwI012KLcv0n5NrYTnr8f+Rrxa4t+RlDQN6LYWhK+k6NYBITtyJ
	 ywK5Sxtbwt3E5aZQ8jAVIcuDPibfvpxePi+6jy6B0N4B+YQxaSD8c7c9tTjVw+cwFa
	 PApjOQUxZbOFw==
Date: Mon, 30 Aug 2021 18:50:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
In-Reply-To: <20210811102423.28908-39-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301848140.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-39-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> Everything is ready, we can remove the fake NUMA node and
> depends on device tree to create NUMA system.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa.c        | 45 ++++++++++++++++++++++----------------
>  xen/include/asm-arm/numa.h |  7 ------
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 2a18c97470..3b04220e60 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -18,6 +18,7 @@
>   *
>   */
>  #include <xen/init.h>
> +#include <xen/device_tree.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
>  #include <xen/pfn.h>
> @@ -83,28 +84,34 @@ void __init numa_init(bool acpi_off)
>      paddr_t ram_size = 0;
>      paddr_t ram_end = 0;
>  
> -    printk(XENLOG_WARNING
> -        "NUMA has not been supported yet, NUMA off!\n");
> -    /* Arm NUMA has not been implemented until this patch */
> -    numa_off = true;
> +    /* NUMA has been turned off through Xen parameters */
> +    if ( numa_off )
> +        goto mem_init;
>  
> -    /*
> -     * Set all cpu_to_node mapping to 0, this will make cpu_to_node
> -     * function return 0 as previous fake cpu_to_node API.
> -     */
> -    for ( idx = 0; idx < NR_CPUS; idx++ )
> -        cpu_to_node[idx] = 0;
> -
> -    /*
> -     * Make node_to_cpumask, node_spanned_pages and node_start_pfn
> -     * return as previous fake APIs.
> -     */
> -    for ( idx = 0; idx < MAX_NUMNODES; idx++ ) {
> -        node_to_cpumask[idx] = cpu_online_map;
> -        node_spanned_pages(idx) = (max_page - mfn_x(first_valid_mfn));
> -        node_start_pfn(idx) = (mfn_x(first_valid_mfn));
> +    /* Initialize NUMA from device tree when system is not ACPI booted */
> +    if ( acpi_off )
> +    {
> +#ifdef CONFIG_DEVICE_TREE_NUMA
> +        int ret = numa_device_tree_init(device_tree_flattened);
> +        if ( !ret )
> +            goto mem_init;
> +        printk(XENLOG_WARNING
> +               "Init NUMA from device tree failed, ret=%d\n", ret);
> +#else
> +        printk(XENLOG_WARNING
> +               "CONFIG_DEVICE_TREE_NUMA is not set, NUMA off!\n");

I don't think we want to see this warning every time at boot when
CONFIG_DEVICE_TREE_NUMA is off. I'd set it to XENLOG_DEBUG or remove it.

Also given that we have many stub functions in
xen/include/asm-arm/numa.h already, maybe we could also have a stub
function for numa_device_tree_init so that we won'd need an #ifdef
CONFIG_DEVICE_TREE_NUMA here.


> +#endif
> +        numa_off = true;
> +    }
> +    else
> +    {
> +        /* We don't support NUMA for ACPI boot currently */
> +        printk(XENLOG_WARNING
> +               "ACPI NUMA has not been supported yet, NUMA off!\n");
> +        numa_off = true;
>      }
>  
> +mem_init:
>      /*
>       * Find the minimal and maximum address of RAM, NUMA will
>       * build a memory to node mapping table for the whole range.
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index a3982a94b6..425eb9aede 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -30,13 +30,6 @@ extern int numa_device_tree_init(const void *fdt);
>  extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
>  extern void arch_numa_init_failed_fallback(void);
>  
> -/*
> - * Temporary for fake NUMA node, when CPU, memory and distance
> - * matrix will be read from DTB or ACPI SRAT. The following
> - * symbols will be removed.
> - */
> -extern mfn_t first_valid_mfn;
> -
>  #else
>  
>  /* Fake one node for now. See also node_online_map. */
> -- 
> 2.25.1
> 

