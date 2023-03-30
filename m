Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74856D0F86
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 21:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516856.801648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phyPQ-0006ty-NT; Thu, 30 Mar 2023 19:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516856.801648; Thu, 30 Mar 2023 19:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phyPQ-0006qk-Ko; Thu, 30 Mar 2023 19:58:08 +0000
Received: by outflank-mailman (input) for mailman id 516856;
 Thu, 30 Mar 2023 19:58:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phyPP-0006qe-0R
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 19:58:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phyPO-0008TG-I8; Thu, 30 Mar 2023 19:58:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phyPO-0007zV-AL; Thu, 30 Mar 2023 19:58:06 +0000
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
	bh=uXvFeM3VtiDCEvNzcZJ9/MCwemAXMFTH1Vw3Q1VPQk8=; b=z1ChguVbcNxca/Tx81rjgSmvax
	GDqC56yS9qerP1rOqXRUP5O68HFQMX05QkjBKXxoxpmROyiZvfpL2/nI6qB806FWEmXaA3ru92zlD
	t8CRiIo7Uy6RB4jFvw/QGpI25fZHQKEk+0GG3MHYf7gGXzz9bPmLl7DtQNi5a6Pjmm4U=;
Message-ID: <8e6aaf2e-0a62-125d-6e55-7638530a9a85@xen.org>
Date: Thu, 30 Mar 2023 20:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 01/11] xen/arm: Use the correct format specifier
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230321140357.24094-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
> while creating nodes in fdt, the address (if present in the node name)
> should be represented using 'PRIx64'. This is to be in conformance
> with the following rule present in https://elinux.org/Device_Tree_Linux
> 
> . node names
> "unit-address does not have leading zeros"
> 
> As 'PRIpaddr' introduces leading zeros, we cannot use it.
> 
> So, we have introduced a wrapper ie domain_fdt_begin_node() which will
> represent physical address using 'PRIx64'.
> 
> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
> address.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Julien Grall <jgrall@amazon.com>

I have committed this patch.

Cheers,

> ---
> 
> Changes from -
> 
> v3 - 1. Extracted the patch from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00655.html
> and added to this series.
> 2. No changes done.
> 
>   xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
>   xen/arch/arm/gic-v2.c       |  6 ++--
>   xen/arch/arm/mm.c           |  2 +-
>   3 files changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9707eb7b1b..15fa88e977 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1288,6 +1288,39 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>       return res;
>   }
>   
> +/*
> + * Wrapper to convert physical address from paddr_t to uint64_t and
> + * invoke fdt_begin_node(). This is required as the physical address
> + * provided as part of node name should not contain any leading
> + * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
> + * unit (which contains the physical address) with name to generate a
> + * node name.
> + */
> +static int __init domain_fdt_begin_node(void *fdt, const char *name,
> +                                        uint64_t unit)
> +{
> +    /*
> +     * The size of the buffer to hold the longest possible string (i.e.
> +     * interrupt-controller@ + a 64-bit number + \0).
> +     */
> +    char buf[38];
> +    int ret;
> +
> +    /* ePAPR 3.4 */
> +    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
> +
> +    if ( ret >= sizeof(buf) )
> +    {
> +        printk(XENLOG_ERR
> +               "Insufficient buffer. Minimum size required is %d\n",
> +               (ret + 1));
> +
> +        return -FDT_ERR_TRUNCATED;
> +    }
> +
> +    return fdt_begin_node(fdt, buf);
> +}
> +
>   static int __init make_memory_node(const struct domain *d,
>                                      void *fdt,
>                                      int addrcells, int sizecells,
> @@ -1296,8 +1329,6 @@ static int __init make_memory_node(const struct domain *d,
>       unsigned int i;
>       int res, reg_size = addrcells + sizecells;
>       int nr_cells = 0;
> -    /* Placeholder for memory@ + a 64-bit number + \0 */
> -    char buf[24];
>       __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
>       __be32 *cells;
>   
> @@ -1314,9 +1345,7 @@ static int __init make_memory_node(const struct domain *d,
>   
>       dt_dprintk("Create memory node\n");
>   
> -    /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
>       if ( res )
>           return res;
>   
> @@ -1375,16 +1404,13 @@ static int __init make_shm_memory_node(const struct domain *d,
>       {
>           uint64_t start = mem->bank[i].start;
>           uint64_t size = mem->bank[i].size;
> -        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> -        char buf[27];
>           const char compat[] = "xen,shared-memory-v1";
>           /* Worst case addrcells + sizecells */
>           __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>           __be32 *cells;
>           unsigned int len = (addrcells + sizecells) * sizeof(__be32);
>   
> -        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
> -        res = fdt_begin_node(fdt, buf);
> +        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
>           if ( res )
>               return res;
>   
> @@ -2716,12 +2742,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
>       const struct domain *d = kinfo->d;
> -    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
> -    char buf[38];
>   
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> -             vgic_dist_base(&d->arch.vgic));
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "interrupt-controller",
> +                                vgic_dist_base(&d->arch.vgic));
>       if ( res )
>           return res;
>   
> @@ -2771,14 +2794,10 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 *reg, *cells;
>       const struct domain *d = kinfo->d;
> -    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
> -    char buf[38];
>       unsigned int i, len = 0;
>   
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> -             vgic_dist_base(&d->arch.vgic));
> -
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "interrupt-controller",
> +                                vgic_dist_base(&d->arch.vgic));
>       if ( res )
>           return res;
>   
> @@ -2858,11 +2877,8 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>       __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>       __be32 *cells;
>       struct domain *d = kinfo->d;
> -    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
> -    char buf[27];
>   
> -    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
>       if ( res )
>           return res;
>   
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 61802839cb..5d4d298b86 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1049,7 +1049,7 @@ static void __init gicv2_dt_init(void)
>       if ( csize < SZ_8K )
>       {
>           printk(XENLOG_WARNING "GICv2: WARNING: "
> -               "The GICC size is too small: %#"PRIx64" expected %#x\n",
> +               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
>                  csize, SZ_8K);
>           if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
>           {
> @@ -1280,11 +1280,11 @@ static int __init gicv2_init(void)
>           gicv2.map_cbase += aliased_offset;
>   
>           printk(XENLOG_WARNING
> -               "GICv2: Adjusting CPU interface base to %#"PRIx64"\n",
> +               "GICv2: Adjusting CPU interface base to %#"PRIpaddr"\n",
>                  cbase + aliased_offset);
>       } else if ( csize == SZ_128K )
>           printk(XENLOG_WARNING
> -               "GICv2: GICC size=%#"PRIx64" but not aliased\n",
> +               "GICv2: GICC size=%#"PRIpaddr" but not aliased\n",
>                  csize);
>   
>       gicv2.map_hbase = ioremap_nocache(hbase, PAGE_SIZE);
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f758cad545..b99806af99 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -263,7 +263,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>   
>           pte = mapping[offsets[level]];
>   
> -        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
> +        printk("%s[0x%03x] = 0x%"PRIx64"\n",
>                  level_strs[level], offsets[level], pte.bits);
>   
>           if ( level == 3 || !pte.walk.valid || !pte.walk.table )

-- 
Julien Grall

