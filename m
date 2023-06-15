Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6D730CD9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 03:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549373.857859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9c7C-0003fk-Jc; Thu, 15 Jun 2023 01:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549373.857859; Thu, 15 Jun 2023 01:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9c7C-0003dm-Gs; Thu, 15 Jun 2023 01:49:34 +0000
Received: by outflank-mailman (input) for mailman id 549373;
 Thu, 15 Jun 2023 01:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9c7A-0003dg-FM
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 01:49:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd947d7b-0b1e-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 03:49:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C2CE60DD7;
 Thu, 15 Jun 2023 01:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1901BC433C8;
 Thu, 15 Jun 2023 01:49:26 +0000 (UTC)
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
X-Inumbo-ID: dd947d7b-0b1e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686793768;
	bh=jI5cnyjJrLSI2E6m/MaN6cUY12p07MiZKjsTOBy/8wo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qFAz+LAtFWjVwaOYqJsA1VVO3k5FutKVqR3CQplTqWKUm7pYSfUjfa7YW5yfHlM+X
	 ATF0UGtZKZOQ35sA5YsFy0tmqIoBvzbb635bnSOa9oPnXTIEnhoJkbVwRrwwD0WbCR
	 38Dcy81Ycw/7kuZDVafCnpmaPrY6cl8BOZ9a1sDMUed7dNqBtb+NDYW7LHwWNpi+Rx
	 R2J5FzSmct5kEwJxvGUCJGbqBxescTOF3rSVR6i4QtdIOdQZiZOqApbOvKQ2nKwfMV
	 0DDnEgHIguHHoBIZWTofwmysLUQNI0ukxBqfyu4JlYXQtJlSZ3oplQ5QxHAXmpuvdx
	 WO7Bjgw7rK2LQ==
Date: Wed, 14 Jun 2023 18:49:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/4] xen/arm: pl011: Use correct accessors
In-Reply-To: <20230607092727.19654-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306141849070.897208@ubuntu-linux-20-04-desktop>
References: <20230607092727.19654-1-michal.orzel@amd.com> <20230607092727.19654-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jun 2023, Michal Orzel wrote:
> At the moment, we use 32-bit only accessors (i.e. readl/writel) to match
> the SBSA v2.x requirement. This should not be the default case for normal
> PL011 where accesses shall be 8/16-bit (max register size is 16-bit).
> There are however implementations of this UART that can only handle 32-bit
> MMIO. This is advertised by dt property "reg-io-width" set to 4.
> 
> Introduce new struct pl011 member mmio32 and replace pl011_{read/write}
> macros with static inline helpers that use 32-bit or 16-bit accessors
> (largest-common not to end up using different ones depending on the actual
> register size) according to mmio32 value. By default this property is set
> to false, unless:
>  - reg-io-width is specified with value 4,
>  - SBSA UART is in use.
> 
> For now, no changes done for ACPI due to lack of testing possibilities
> (i.e. current behavior maintained resulting in 32-bit accesses).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/char/pl011.c | 53 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index 052a6512515c..403b1ac06551 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -41,6 +41,7 @@ static struct pl011 {
>      /* unsigned int timeout_ms; */
>      /* bool_t probing, intr_works; */
>      bool sbsa;  /* ARM SBSA generic interface */
> +    bool mmio32; /* 32-bit only MMIO */
>  } pl011_com = {0};
>  
>  /* These parity settings can be ORed directly into the LCR. */
> @@ -50,9 +51,30 @@ static struct pl011 {
>  #define PARITY_MARK  (PEN|SPS)
>  #define PARITY_SPACE (PEN|EPS|SPS)
>  
> -/* SBSA v2.x document requires, all reads/writes must be 32-bit accesses */
> -#define pl011_read(uart, off)           readl((uart)->regs + (off))
> -#define pl011_write(uart, off,val)      writel((val), (uart)->regs + (off))
> +/*
> + * By default, PL011 accesses shall be done using 8/16-bit accessors to
> + * support legacy devices that cannot cope with 32-bit. On the other hand,
> + * there are implementations of PL011 that can only handle 32-bit MMIO. Also,
> + * SBSA v2.x requires 32-bit accesses. Note that for default case, we use
> + * largest-common accessors (i.e. 16-bit) not to end up using different ones
> + * depending on the actual register size.
> + */
> +static inline void
> +pl011_write(struct pl011 *uart, unsigned int offset, unsigned int val)
> +{
> +    if ( uart->mmio32 )
> +        writel(val, uart->regs + offset);
> +    else
> +        writew(val, uart->regs + offset);
> +}
> +
> +static inline unsigned int pl011_read(struct pl011 *uart, unsigned int offset)
> +{
> +    if ( uart->mmio32 )
> +        return readl(uart->regs + offset);
> +
> +    return readw(uart->regs + offset);
> +}
>  
>  static unsigned int pl011_intr_status(struct pl011 *uart)
>  {
> @@ -222,7 +244,8 @@ static struct uart_driver __read_mostly pl011_driver = {
>      .vuart_info   = pl011_vuart,
>  };
>  
> -static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa)
> +static int __init
> +pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa, bool mmio32)
>  {
>      struct pl011 *uart;
>  
> @@ -233,6 +256,9 @@ static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa
>      uart->stop_bits = 1;
>      uart->sbsa      = sbsa;
>  
> +    /* Set 32-bit MMIO also for SBSA since v2.x requires it */
> +    uart->mmio32 = (mmio32 || sbsa);
> +
>      uart->regs = ioremap_nocache(addr, size);
>      if ( !uart->regs )
>      {
> @@ -259,6 +285,8 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>      const char *config = data;
>      int res;
>      paddr_t addr, size;
> +    uint32_t io_width;
> +    bool mmio32 = false;
>  
>      if ( strcmp(config, "") )
>      {
> @@ -280,7 +308,19 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>          return -EINVAL;
>      }
>  
> -    res = pl011_uart_init(res, addr, size, false);
> +    /* See linux Documentation/devicetree/bindings/serial/pl011.yaml */
> +    if ( dt_property_read_u32(dev, "reg-io-width", &io_width) )
> +    {
> +        if ( io_width == 4 )
> +            mmio32 = true;
> +        else if ( io_width != 1 )
> +        {
> +            printk("pl011: Unsupported reg-io-width (%"PRIu32")\n", io_width);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    res = pl011_uart_init(res, addr, size, false, mmio32);
>      if ( res < 0 )
>      {
>          printk("pl011: Unable to initialize\n");
> @@ -328,8 +368,9 @@ static int __init pl011_acpi_uart_init(const void *data)
>      /* trigger/polarity information is not available in spcr */
>      irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
>  
> +    /* TODO - mmio32 proper handling (for now set to true) */
>      res = pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
> -                          PAGE_SIZE, sbsa);
> +                          PAGE_SIZE, sbsa, true);
>      if ( res < 0 )
>      {
>          printk("pl011: Unable to initialize\n");
> -- 
> 2.25.1
> 

