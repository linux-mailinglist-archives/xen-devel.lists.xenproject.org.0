Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5B4674744
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481379.746220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeRp-0002OK-9l; Thu, 19 Jan 2023 23:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481379.746220; Thu, 19 Jan 2023 23:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeRp-0002MS-6r; Thu, 19 Jan 2023 23:35:57 +0000
Received: by outflank-mailman (input) for mailman id 481379;
 Thu, 19 Jan 2023 23:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIeRn-0002MG-IG
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:35:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03553717-9852-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 00:35:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80C4B61D85;
 Thu, 19 Jan 2023 23:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EDAC433D2;
 Thu, 19 Jan 2023 23:35:50 +0000 (UTC)
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
X-Inumbo-ID: 03553717-9852-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674171351;
	bh=TsNVolKRuy8Hi9OxldYWDYLnc45k78L+TGGkkq5iH/E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V7H3foDGph1LpvXPPd5SNbEq75qgrpgbEOQEecsa2SRmS7Nf58gPU3KvdiXPx0Pw5
	 5uJdvUleYM/n8xqsgDcgjad+fA6/GJKrzhRXHi3+O0ZFeAO9KyTW06F+5fKzVb8lAK
	 VqvINCt2o6s9JXf2HnJ1cZe3tjmHb9BNuRjgYtdzMQu/4pDbLzxeF0KEK80E78ffjy
	 3xe1WZ5cmjKXVEdp6pWFG40xN/ulvkqLKe0NmIvJzufaZ+UPO2P2VrBBtKBgq6R+dr
	 zhAo2yGpSCRbr0kpB3CyomliKdE8w3bEXieBsq6Pz3mPiLWDfR4DtgbI6CYQJq1idD
	 ERwLcs0m+oN3w==
Date: Thu, 19 Jan 2023 15:35:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 06/11] xen/arm: Introduce a wrapper for dt_device_get_address()
 to handle paddr_t
In-Reply-To: <20230117174358.15344-7-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191531160.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-7-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> dt_device_get_address() can accept u64 only for address and size. The
> various callers will use 'paddr_t' datatype for address and size.
> 'paddr_t' is currently defined as u64, but we may support u32 as well.
> Thus, we need an appropriate wrapper which can handle this type
> conversion.
> 
> The callers will now invoke dt_device_get_paddr(). This inturn invokes
> dt_device_get_address() with u64 address/size. And then it typecasts
> the u64 address/size to paddr_t address/size.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - 1. New patch introduced.
> 
>  xen/arch/arm/domain_build.c            |  5 +++--
>  xen/arch/arm/gic-v2.c                  | 11 ++++++-----
>  xen/arch/arm/gic-v3.c                  |  9 +++++----
>  xen/arch/arm/include/asm/device_tree.h | 19 +++++++++++++++++++
>  xen/arch/arm/platforms/exynos5.c       |  7 ++++---
>  xen/arch/arm/platforms/sunxi.c         |  3 ++-
>  xen/drivers/char/exynos4210-uart.c     |  3 ++-
>  xen/drivers/char/ns16550.c             |  3 ++-
>  xen/drivers/char/omap-uart.c           |  3 ++-
>  xen/drivers/char/pl011.c               |  3 ++-
>  xen/drivers/char/scif-uart.c           |  3 ++-
>  xen/drivers/passthrough/arm/smmu.c     |  3 ++-
>  12 files changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index cf8ae37a14..21199b624b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -7,6 +7,7 @@
>  #include <xen/domain_page.h>
>  #include <xen/sched.h>
>  #include <xen/sizes.h>
> +#include <asm/device_tree.h>
>  #include <asm/irq.h>
>  #include <asm/regs.h>
>  #include <xen/errno.h>
> @@ -1672,7 +1673,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>  
>          for ( i = 0; i < naddr; i++ )
>          {
> -            res = dt_device_get_address(np, i, &addr, &size);
> +            res = dt_device_get_paddr(np, i, &addr, &size);
>              if ( res )
>              {
>                  printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> @@ -2500,7 +2501,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>      /* Give permission and map MMIOs */
>      for ( i = 0; i < naddr; i++ )
>      {
> -        res = dt_device_get_address(dev, i, &addr, &size);
> +        res = dt_device_get_paddr(dev, i, &addr, &size);
>          if ( res )
>          {
>              printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 5d4d298b86..5230c4ebaf 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -24,6 +24,7 @@
>  #include <xen/acpi.h>
>  #include <acpi/actables.h>
>  #include <asm/p2m.h>
> +#include <asm/device_tree.h>
>  #include <asm/domain.h>
>  #include <asm/platform.h>
>  #include <asm/device.h>
> @@ -993,7 +994,7 @@ static void gicv2_extension_dt_init(const struct dt_device_node *node)
>              continue;
>  
>          /* Get register frame resource from DT. */
> -        if ( dt_device_get_address(v2m, 0, &addr, &size) )
> +        if ( dt_device_get_paddr(v2m, 0, &addr, &size) )
>              panic("GICv2: Cannot find a valid v2m frame address\n");
>  
>          /*
> @@ -1018,19 +1019,19 @@ static void __init gicv2_dt_init(void)
>      paddr_t vsize;
>      const struct dt_device_node *node = gicv2_info.node;
>  
> -    res = dt_device_get_address(node, 0, &dbase, NULL);
> +    res = dt_device_get_paddr(node, 0, &dbase, NULL);
>      if ( res )
>          panic("GICv2: Cannot find a valid address for the distributor\n");
>  
> -    res = dt_device_get_address(node, 1, &cbase, &csize);
> +    res = dt_device_get_paddr(node, 1, &cbase, &csize);
>      if ( res )
>          panic("GICv2: Cannot find a valid address for the CPU\n");
>  
> -    res = dt_device_get_address(node, 2, &hbase, NULL);
> +    res = dt_device_get_paddr(node, 2, &hbase, NULL);
>      if ( res )
>          panic("GICv2: Cannot find a valid address for the hypervisor\n");
>  
> -    res = dt_device_get_address(node, 3, &vbase, &vsize);
> +    res = dt_device_get_paddr(node, 3, &vbase, &vsize);
>      if ( res )
>          panic("GICv2: Cannot find a valid address for the virtual CPU\n");
>  
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 391dfa53d7..58d2eb0690 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -29,6 +29,7 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/device.h>
> +#include <asm/device_tree.h>
>  #include <asm/gic.h>
>  #include <asm/gic_v3_defs.h>
>  #include <asm/gic_v3_its.h>
> @@ -1377,7 +1378,7 @@ static void __init gicv3_dt_init(void)
>      int res, i;
>      const struct dt_device_node *node = gicv3_info.node;
>  
> -    res = dt_device_get_address(node, 0, &dbase, NULL);
> +    res = dt_device_get_paddr(node, 0, &dbase, NULL);
>      if ( res )
>          panic("GICv3: Cannot find a valid distributor address\n");
>  
> @@ -1395,7 +1396,7 @@ static void __init gicv3_dt_init(void)
>      {
>          paddr_t rdist_base, rdist_size;
>  
> -        res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
> +        res = dt_device_get_paddr(node, 1 + i, &rdist_base, &rdist_size);
>          if ( res )
>              panic("GICv3: No rdist base found for region %d\n", i);
>  
> @@ -1417,10 +1418,10 @@ static void __init gicv3_dt_init(void)
>       * For GICv3 supporting GICv2, GICC and GICV base address will be
>       * provided.
>       */
> -    res = dt_device_get_address(node, 1 + gicv3.rdist_count,
> +    res = dt_device_get_paddr(node, 1 + gicv3.rdist_count,
>                                  &cbase, &csize);
>      if ( !res )
> -        dt_device_get_address(node, 1 + gicv3.rdist_count + 2,
> +        dt_device_get_paddr(node, 1 + gicv3.rdist_count + 2,
>                                &vbase, &vsize);
>  }
>  
> diff --git a/xen/arch/arm/include/asm/device_tree.h b/xen/arch/arm/include/asm/device_tree.h
> index 51e0f0ae20..7f58f1f278 100644
> --- a/xen/arch/arm/include/asm/device_tree.h
> +++ b/xen/arch/arm/include/asm/device_tree.h
> @@ -11,6 +11,7 @@
>  #ifndef __ARCH_ARM_DEVICE_TREE__
>  #define __ARCH_ARM_DEVICE_TREE__
>  
> +#include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  
>  inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
> @@ -29,6 +30,24 @@ inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
>      return ret;
>  }
>  
> +inline int dt_device_get_paddr(const struct dt_device_node *dev,
> +                               unsigned int index, paddr_t *addr,
> +                               paddr_t *size)
> +{
> +    u64 dt_addr, dt_size;
> +    int ret;
> +
> +    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
> +
> +    if ( addr )
> +        *addr = dt_addr;
> +
> +    if ( size )
> +        *size = dt_size;

I think we should check for truncation (top 32-bit != 0) and return an
error in that case.


> +    return ret;
> +}
> +
>  #endif /* __ARCH_ARM_DEVICE_TREE__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
> index f79fad9957..55b6ac1e7e 100644
> --- a/xen/arch/arm/platforms/exynos5.c
> +++ b/xen/arch/arm/platforms/exynos5.c
> @@ -22,6 +22,7 @@
>  #include <xen/mm.h>
>  #include <xen/vmap.h>
>  #include <xen/delay.h>
> +#include <asm/device_tree.h>
>  #include <asm/platforms/exynos5.h>
>  #include <asm/platform.h>
>  #include <asm/io.h>
> @@ -52,7 +53,7 @@ static int exynos5_init_time(void)
>          return -ENXIO;
>      }
>  
> -    rc = dt_device_get_address(node, 0, &mct_base_addr, &size);
> +    rc = dt_device_get_paddr(node, 0, &mct_base_addr, &size);
>      if ( rc )
>      {
>          dprintk(XENLOG_ERR, "Error in \"samsung,exynos4210-mct\"\n");
> @@ -125,7 +126,7 @@ static int __init exynos5_smp_init(void)
>          return -ENXIO;
>      }
>  
> -    rc = dt_device_get_address(node, 0, &sysram_addr, &size);
> +    rc = dt_device_get_paddr(node, 0, &sysram_addr, &size);
>      if ( rc )
>      {
>          dprintk(XENLOG_ERR, "Error in %s\n", compatible);
> @@ -208,7 +209,7 @@ static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
>          return -ENXIO;
>      }
>  
> -    rc = dt_device_get_address(node, 0, power_base_addr, size);
> +    rc = dt_device_get_paddr(node, 0, power_base_addr, size);
>      if ( rc )
>      {
>          dprintk(XENLOG_ERR, "Error in \"samsung,exynos5XXX-pmu\"\n");
> diff --git a/xen/arch/arm/platforms/sunxi.c b/xen/arch/arm/platforms/sunxi.c
> index e8e4d88bef..ce47f97507 100644
> --- a/xen/arch/arm/platforms/sunxi.c
> +++ b/xen/arch/arm/platforms/sunxi.c
> @@ -18,6 +18,7 @@
>  
>  #include <xen/mm.h>
>  #include <xen/vmap.h>
> +#include <asm/device_tree.h>
>  #include <asm/platform.h>
>  #include <asm/io.h>
>  
> @@ -50,7 +51,7 @@ static void __iomem *sunxi_map_watchdog(bool *new_wdt)
>          return NULL;
>      }
>  
> -    ret = dt_device_get_address(node, 0, &wdt_start, &wdt_len);
> +    ret = dt_device_get_paddr(node, 0, &wdt_start, &wdt_len);
>      if ( ret )
>      {
>          dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
> diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
> index 32cc8c78b5..6d2008c44f 100644
> --- a/xen/drivers/char/exynos4210-uart.c
> +++ b/xen/drivers/char/exynos4210-uart.c
> @@ -24,6 +24,7 @@
>  #include <xen/irq.h>
>  #include <xen/mm.h>
>  #include <asm/device.h>
> +#include <asm/device_tree.h>
>  #include <asm/exynos4210-uart.h>
>  #include <asm/io.h>
>  
> @@ -316,7 +317,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
>      uart->parity    = PARITY_NONE;
>      uart->stop_bits = 1;
>  
> -    res = dt_device_get_address(dev, 0, &addr, &size);
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
>      if ( res )
>      {
>          printk("exynos4210: Unable to retrieve the base"
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 8ef895a2bb..7226f3c2f7 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -35,6 +35,7 @@
>  #include <asm/io.h>
>  #ifdef CONFIG_HAS_DEVICE_TREE
>  #include <asm/device.h>
> +#include <asm/device_tree.h>
>  #endif
>  #ifdef CONFIG_X86
>  #include <asm/fixmap.h>
> @@ -1757,7 +1758,7 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>      uart->parity    = UART_PARITY_NONE;
>      uart->stop_bits = 1;
>  
> -    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
> +    res = dt_device_get_paddr(dev, 0, &uart->io_base, &uart->io_size);
>      if ( res )
>          return res;
>  
> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
> index 3b53e1909a..06200bc9f1 100644
> --- a/xen/drivers/char/omap-uart.c
> +++ b/xen/drivers/char/omap-uart.c
> @@ -15,6 +15,7 @@
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  #include <xen/device_tree.h>
> +#include <asm/device_tree.h>
>  #include <asm/device.h>
>  #include <xen/errno.h>
>  #include <xen/mm.h>
> @@ -344,7 +345,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
>      uart->parity = UART_PARITY_NONE;
>      uart->stop_bits = 1;
>  
> -    res = dt_device_get_address(dev, 0, &addr, &size);
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
>      if ( res )
>      {
>          printk("omap-uart: Unable to retrieve the base"
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index 256ec11e3f..b4c1d9d592 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -26,6 +26,7 @@
>  #include <asm/device.h>
>  #include <xen/mm.h>
>  #include <xen/vmap.h>
> +#include <asm/device_tree.h>
>  #include <asm/pl011-uart.h>
>  #include <asm/io.h>
>  
> @@ -265,7 +266,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>          printk("WARNING: UART configuration is not supported\n");
>      }
>  
> -    res = dt_device_get_address(dev, 0, &addr, &size);
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
>      if ( res )
>      {
>          printk("pl011: Unable to retrieve the base"
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index b425881d06..af14388f70 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -26,6 +26,7 @@
>  #include <xen/mm.h>
>  #include <xen/delay.h>
>  #include <asm/device.h>
> +#include <asm/device_tree.h>
>  #include <asm/scif-uart.h>
>  #include <asm/io.h>
>  
> @@ -318,7 +319,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
>  
>      uart = &scif_com;
>  
> -    res = dt_device_get_address(dev, 0, &addr, &size);
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
>      if ( res )
>      {
>          printk("scif-uart: Unable to retrieve the base"
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 490d253d44..0c89cb644e 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -51,6 +51,7 @@
>  #include <xen/sizes.h>
>  #include <asm/atomic.h>
>  #include <asm/device.h>
> +#include <asm/device_tree.h>
>  #include <asm/io.h>
>  #include <asm/iommu_fwspec.h>
>  #include <asm/platform.h>
> @@ -101,7 +102,7 @@ static struct resource *platform_get_resource(struct platform_device *pdev,
>  
>  	switch (type) {
>  	case IORESOURCE_MEM:
> -		ret = dt_device_get_address(pdev, num, &res.addr, &res.size);
> +		ret = dt_device_get_paddr(pdev, num, &res.addr, &res.size);
>  
>  		return ((ret) ? NULL : &res);
>  
> -- 
> 2.17.1
> 

