Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3367472C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481366.746201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeH3-0000Is-W1; Thu, 19 Jan 2023 23:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481366.746201; Thu, 19 Jan 2023 23:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeH3-0000G5-T0; Thu, 19 Jan 2023 23:24:49 +0000
Received: by outflank-mailman (input) for mailman id 481366;
 Thu, 19 Jan 2023 23:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIeH2-0000Fz-Nf
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:24:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a5649a-9850-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 00:24:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 97733CE25DE;
 Thu, 19 Jan 2023 23:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1198C433F0;
 Thu, 19 Jan 2023 23:24:38 +0000 (UTC)
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
X-Inumbo-ID: 75a5649a-9850-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674170679;
	bh=T71dO3QYmXldGt4FF+359WqjwCtGNMJPQNmVZVNQCsc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TElbiYhhEoScv2Y+nb8FGvDMUoGxEFTvMuH/To6I+Y0Yg5d77D8dqSmU1NeOi9ld1
	 SARF+9gx+dnJ/uO+ZSDfVXLZ8msR7Mofww2eIulpe/2osFUPIVvYlROHuDZ8ArbMVl
	 F3UvfuUA+0E/sBY5zCSDVDxZutjydB7oeDq2K2BU+VnWbUQaJTBy/pRpQbHQVvwXvb
	 MCxzWDOlOtCFlLjynQ9HIVcPEd7LjYT14fTt7BQw3goUREYTz+npAeQ7hqfsLP4PUL
	 SVrIV+Eo9tOprRb98dJ6bHuFzTcXNjjLbfFxRnLfiqoVjtxvonU28WxG5L8uVUZoUd
	 /IaWzz7/kiLdQ==
Date: Thu, 19 Jan 2023 15:24:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
In-Reply-To: <20230117174358.15344-6-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191522170.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-6-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> One should now be able to use 'paddr_t' to represent address and size.
> Consequently, one should use 'PRIpaddr' as a format specifier for paddr_t.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - 1. Rebased the patch.
> 
>  xen/arch/arm/domain_build.c        |  9 +++++----
>  xen/arch/arm/gic-v3.c              |  2 +-
>  xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>  xen/drivers/char/exynos4210-uart.c |  2 +-
>  xen/drivers/char/ns16550.c         |  8 ++++----
>  xen/drivers/char/omap-uart.c       |  2 +-
>  xen/drivers/char/pl011.c           |  4 ++--
>  xen/drivers/char/scif-uart.c       |  2 +-
>  xen/drivers/passthrough/arm/smmu.c |  6 +++---
>  9 files changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72b9afbb4c..cf8ae37a14 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1666,7 +1666,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>      dt_for_each_device_node( dt_host, np )
>      {
>          unsigned int naddr;
> -        u64 addr, size;
> +        paddr_t addr, size;
>  
>          naddr = dt_number_of_address(np);
>  
> @@ -2445,7 +2445,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>      unsigned int naddr;
>      unsigned int i;
>      int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
>      bool own_device = !dt_device_for_passthrough(dev);
>      /*
>       * We want to avoid mapping the MMIO in dom0 for the following cases:
> @@ -2941,9 +2941,10 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>          if ( res )
>          {
>              printk(XENLOG_ERR "Unable to permit to dom%d access to"
> -                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>                     kinfo->d->domain_id,
> -                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
> +                   (paddr_t) (mstart & PAGE_MASK),
> +                   (paddr_t) (PAGE_ALIGN(mstart + size) - 1));

Why do you need the casts here? mstart is already defined as paddr_t


>              return res;
>          }
>  
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bb59ea94cd..391dfa53d7 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1393,7 +1393,7 @@ static void __init gicv3_dt_init(void)
>  
>      for ( i = 0; i < gicv3.rdist_count; i++ )
>      {
> -        uint64_t rdist_base, rdist_size;
> +        paddr_t rdist_base, rdist_size;
>  
>          res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
>          if ( res )
> diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
> index 6560507092..f79fad9957 100644
> --- a/xen/arch/arm/platforms/exynos5.c
> +++ b/xen/arch/arm/platforms/exynos5.c
> @@ -42,8 +42,8 @@ static int exynos5_init_time(void)
>      void __iomem *mct;
>      int rc;
>      struct dt_device_node *node;
> -    u64 mct_base_addr;
> -    u64 size;
> +    paddr_t mct_base_addr;
> +    paddr_t size;
>  
>      node = dt_find_compatible_node(NULL, NULL, "samsung,exynos4210-mct");
>      if ( !node )
> @@ -59,7 +59,7 @@ static int exynos5_init_time(void)
>          return -ENXIO;
>      }
>  
> -    dprintk(XENLOG_INFO, "mct_base_addr: %016llx size: %016llx\n",
> +    dprintk(XENLOG_INFO, "mct_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
>              mct_base_addr, size);
>  
>      mct = ioremap_nocache(mct_base_addr, size);
> @@ -97,9 +97,9 @@ static int __init exynos5_smp_init(void)
>      struct dt_device_node *node;
>      void __iomem *sysram;
>      char *compatible;
> -    u64 sysram_addr;
> -    u64 size;
> -    u64 sysram_offset;
> +    paddr_t sysram_addr;
> +    paddr_t size;
> +    paddr_t sysram_offset;
>      int rc;
>  
>      node = dt_find_compatible_node(NULL, NULL, "samsung,secure-firmware");
> @@ -131,7 +131,7 @@ static int __init exynos5_smp_init(void)
>          dprintk(XENLOG_ERR, "Error in %s\n", compatible);
>          return -ENXIO;
>      }
> -    dprintk(XENLOG_INFO, "sysram_addr: %016llx size: %016llx offset: %016llx\n",
> +    dprintk(XENLOG_INFO,"sysram_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"offset: 0x%"PRIpaddr"\n",
>              sysram_addr, size, sysram_offset);
>  
>      sysram = ioremap_nocache(sysram_addr, size);
> @@ -189,7 +189,7 @@ static int exynos5_cpu_power_up(void __iomem *power, int cpu)
>      return 0;
>  }
>  
> -static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
> +static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
>  {
>      struct dt_device_node *node;
>      int rc;
> @@ -215,7 +215,7 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
>          return -ENXIO;
>      }
>  
> -    dprintk(XENLOG_DEBUG, "power_base_addr: %016llx size: %016llx\n",
> +    dprintk(XENLOG_DEBUG, "power_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
>              *power_base_addr, *size);
>  
>      return 0;
> @@ -223,8 +223,8 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
>  
>  static int exynos5_cpu_up(int cpu)
>  {
> -    u64 power_base_addr;
> -    u64 size;
> +    paddr_t power_base_addr;
> +    paddr_t size;
>      void __iomem *power;
>      int rc;
>  
> @@ -256,8 +256,8 @@ static int exynos5_cpu_up(int cpu)
>  
>  static void exynos5_reset(void)
>  {
> -    u64 power_base_addr;
> -    u64 size;
> +    paddr_t power_base_addr;
> +    paddr_t size;
>      void __iomem *pmu;
>      int rc;
>  
> diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
> index 43aaf02e18..32cc8c78b5 100644
> --- a/xen/drivers/char/exynos4210-uart.c
> +++ b/xen/drivers/char/exynos4210-uart.c
> @@ -303,7 +303,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
>      const char *config = data;
>      struct exynos4210_uart *uart;
>      int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
>  
>      if ( strcmp(config, "") )
>          printk("WARNING: UART configuration is not supported\n");
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 58d0ccd889..8ef895a2bb 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -42,8 +42,8 @@
>  
>  static struct ns16550 {
>      int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
> -    u64 io_base;   /* I/O port or memory-mapped I/O address. */
> -    u64 io_size;
> +    paddr_t io_base;   /* I/O port or memory-mapped I/O address. */
> +    paddr_t io_size;
>      int reg_shift; /* Bits to shift register offset by */
>      int reg_width; /* Size of access to use, the registers
>                      * themselves are still bytes */
> @@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst uart_config[] =
>  static int __init
>  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>  {
> -    u64 orig_base = uart->io_base;
> +    paddr_t orig_base = uart->io_base;
>      unsigned int b, d, f, nextf, i;
>  
>      /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
> @@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                      else
>                          size = len & PCI_BASE_ADDRESS_MEM_MASK;
>  
> -                    uart->io_base = ((u64)bar_64 << 32) |
> +                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
>                                      (bar & PCI_BASE_ADDRESS_MEM_MASK);
>                  }
>                  /* IO based */
> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
> index d6a5d59aa2..3b53e1909a 100644
> --- a/xen/drivers/char/omap-uart.c
> +++ b/xen/drivers/char/omap-uart.c
> @@ -324,7 +324,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
>      struct omap_uart *uart;
>      u32 clkspec;
>      int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
>  
>      if ( strcmp(config, "") )
>          printk("WARNING: UART configuration is not supported\n");
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index be67242bc0..256ec11e3f 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -222,7 +222,7 @@ static struct uart_driver __read_mostly pl011_driver = {
>      .vuart_info   = pl011_vuart,
>  };
>  
> -static int __init pl011_uart_init(int irq, u64 addr, u64 size, bool sbsa)
> +static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa)
>  {
>      struct pl011 *uart;
>  
> @@ -258,7 +258,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>  {
>      const char *config = data;
>      int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
>  
>      if ( strcmp(config, "") )
>      {
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 2fccafe340..b425881d06 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -311,7 +311,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
>      const char *config = data;
>      struct scif_uart *uart;
>      int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
>  
>      if ( strcmp(config, "") )
>          printk("WARNING: UART configuration is not supported\n");
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 0a514821b3..490d253d44 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -73,8 +73,8 @@
>  /* Xen: Helpers to get device MMIO and IRQs */
>  struct resource
>  {
> -	u64 addr;
> -	u64 size;
> +	paddr_t addr;
> +	paddr_t size;
>  	unsigned int type;
>  };
>  
> @@ -169,7 +169,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
>  	ptr = ioremap_nocache(res->addr, res->size);
>  	if (!ptr) {
>  		dev_err(dev,
> -			"ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
> +			"ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
>  			res->addr, res->size);
>  		return ERR_PTR(-ENOMEM);
>  	}
> -- 
> 2.17.1
> 

