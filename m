Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AB416A6B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 05:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194806.347119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbsu-0000Ee-Sc; Fri, 24 Sep 2021 03:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194806.347119; Fri, 24 Sep 2021 03:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbsu-0000CQ-OS; Fri, 24 Sep 2021 03:28:24 +0000
Received: by outflank-mailman (input) for mailman id 194806;
 Fri, 24 Sep 2021 03:28:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbst-0000CK-2S
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 03:28:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77f992c8-1ce7-11ec-baa2-12813bfff9fa;
 Fri, 24 Sep 2021 03:28:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DC6B61164;
 Fri, 24 Sep 2021 03:28:21 +0000 (UTC)
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
X-Inumbo-ID: 77f992c8-1ce7-11ec-baa2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632454101;
	bh=Sn/tzhQHKN7SLExWX1gi6S586dhysD4Nzf2jsLV9Un0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S0eS8354qu+tj5IttsByGX8x+GjgdsrrKhZym+iPDobwHaCMl1ecfEIcZhxSW20AM
	 BOmYSbdNab8oDsuBgtKyrgBWzChbkx+svxXsKOTIt5mnynr+eucn81RifPeGy9vL4L
	 JHV/5RraFAOfZRLtRSM4g+q/qKppeM5F73774GxmqPvpbbWg3ZCBb1BxSxHRY6eRLI
	 hnZbKuR93Mo4iRDo+2PO2HH3wA2C2pjd2Y12IQsmU7KlkLP5gqI5oWG+WdKutY93AK
	 uNuRZ2z+IKpNmbVOhgrE2c5DxNsoGg+b27nGctEksbSNCmULn1+2MYYFygC0JsQMw5
	 etiqiCJMxXLIQ==
Date: Thu, 23 Sep 2021 20:28:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 34/37] xen/arm: enable device tree based NUMA in system
 init
In-Reply-To: <20210923120236.3692135-35-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109232021270.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-35-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> In this patch, we can start to create NUMA system that is
> based on device tree.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa.c        | 55 ++++++++++++++++++++++++++++++++++++++
>  xen/arch/arm/setup.c       |  7 +++++
>  xen/include/asm-arm/numa.h |  6 +++++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 7f05299b76..d7a3d32d4b 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -18,8 +18,10 @@
>   *
>   */
>  #include <xen/init.h>
> +#include <xen/device_tree.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> +#include <xen/pfn.h>
>  
>  static uint8_t __read_mostly
>  node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> @@ -85,6 +87,59 @@ uint8_t __node_distance(nodeid_t from, nodeid_t to)
>  }
>  EXPORT_SYMBOL(__node_distance);
>  
> +void __init numa_init(bool acpi_off)
> +{
> +    uint32_t idx;
> +    paddr_t ram_start = ~0;

INVALID_PADDR


> +    paddr_t ram_size = 0;
> +    paddr_t ram_end = 0;
> +
> +    /* NUMA has been turned off through Xen parameters */
> +    if ( numa_off )
> +        goto mem_init;
> +
> +    /* Initialize NUMA from device tree when system is not ACPI booted */
> +    if ( acpi_off )
> +    {
> +        int ret = numa_device_tree_init(device_tree_flattened);
> +        if ( ret )
> +        {
> +            printk(XENLOG_WARNING
> +                   "Init NUMA from device tree failed, ret=%d\n", ret);

As I mentioned in other patches we need to distinguish between two
cases:

1) NUMA initialization failed because no NUMA information has been found
2) NUMA initialization failed because wrong/inconsistent NUMA info has
   been found

In case of 1), we print nothing. Maybe a single XENLOG_DEBUG message.
In case of 2), all the warnings are good to print.


In this case, if ret != 0 because of 2), then it is fine to print this
warning. But it looks like could be that ret is -EINVAL simply because a
CPU node doesn't have numa-node-id, which is a normal condition for
non-NUMA machines.


> +            numa_off = true;
> +        }
> +    }
> +    else
> +    {
> +        /* We don't support NUMA for ACPI boot currently */
> +        printk(XENLOG_WARNING
> +               "ACPI NUMA has not been supported yet, NUMA off!\n");
> +        numa_off = true;
> +    }
> +
> +mem_init:
> +    /*
> +     * Find the minimal and maximum address of RAM, NUMA will
> +     * build a memory to node mapping table for the whole range.
> +     */
> +    ram_start = bootinfo.mem.bank[0].start;
> +    ram_size  = bootinfo.mem.bank[0].size;
> +    ram_end   = ram_start + ram_size;
> +    for ( idx = 1 ; idx < bootinfo.mem.nr_banks; idx++ )
> +    {
> +        paddr_t bank_start = bootinfo.mem.bank[idx].start;
> +        paddr_t bank_size = bootinfo.mem.bank[idx].size;
> +        paddr_t bank_end = bank_start + bank_size;
> +
> +        ram_size  = ram_size + bank_size;
> +        ram_start = min(ram_start, bank_start);
> +        ram_end   = max(ram_end, bank_end);
> +    }
> +
> +    numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
> +    return;

No need for return


> +}
> +
>  uint32_t __init arch_meminfo_get_nr_bank(void)
>  {
>  	return bootinfo.mem.nr_banks;
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f0fbc95b5..6097850682 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -905,6 +905,13 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Parse the ACPI tables for possible boot-time configuration */
>      acpi_boot_table_init();
>  
> +    /*
> +     * Try to initialize NUMA system, if failed, the system will
> +     * fallback to uniform system which means system has only 1
> +     * NUMA node.
> +     */
> +    numa_init(acpi_disabled);
> +
>      end_boot_allocator();
>  
>      /*
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index f46e8e2935..5b03dde87f 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -24,6 +24,7 @@ typedef u8 nodeid_t;
>  
>  extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
>  extern int numa_device_tree_init(const void *fdt);
> +extern void numa_init(bool acpi_off);
>  
>  #else
>  
> @@ -47,6 +48,11 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +static inline void numa_init(bool acpi_off)
> +{
> +
> +}
> +
>  static inline void numa_add_cpu(int cpu)
>  {
>  
> -- 
> 2.25.1
> 

