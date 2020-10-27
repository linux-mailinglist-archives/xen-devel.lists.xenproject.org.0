Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BA29CCB2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 00:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13171.33757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYS5-0005kj-RG; Tue, 27 Oct 2020 23:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13171.33757; Tue, 27 Oct 2020 23:32:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYS5-0005kK-Nu; Tue, 27 Oct 2020 23:32:29 +0000
Received: by outflank-mailman (input) for mailman id 13171;
 Tue, 27 Oct 2020 23:32:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXYS4-0005kF-1w
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 23:32:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa1f5950-341c-46d5-b464-d499d84a232c;
 Tue, 27 Oct 2020 23:32:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ED6520747;
 Tue, 27 Oct 2020 23:32:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXYS4-0005kF-1w
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 23:32:28 +0000
X-Inumbo-ID: fa1f5950-341c-46d5-b464-d499d84a232c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fa1f5950-341c-46d5-b464-d499d84a232c;
	Tue, 27 Oct 2020 23:32:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3ED6520747;
	Tue, 27 Oct 2020 23:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603841546;
	bh=qtb3dL32MVZs65s3PVnJxFbnlJZc/NeI8cYzE9m4lzM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sliiHvdbnq0sWM9OagtFdWu8tsuwhwLB2cz/qmpmVR3ZjBwHGU7hhPHBqvUDGxr0+
	 YfgSA/LAYbXbCY/KxBHmUkA5QrhPeRXdU44gMPaT4l71rbbKFFAjJz9aq5NM30gY6m
	 4JBZhiLMhx35Hjuu/Mx6QYcZQ1sge8vobnHbj6RQ=
Date: Tue, 27 Oct 2020 16:32:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
In-Reply-To: <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
References: <cover.1603731279.git.rahul.singh@arm.com> <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Rahul Singh wrote:
> ARM platforms does not support ns16550 PCI support. When CONFIG_HAS_PCI
                ^ do

> is enabled for ARM a compilation error is observed.
> 
> Fixed compilation error after introducing new kconfig option
> CONFIG_HAS_NS16550_PCI for x86 platforms to support ns16550 PCI.
>
> No functional change.

Written like that it would seem that ARM platforms do not support
NS16550 on the PCI bus, but actually, it would be theoretically possible
to have an NS16550 card slotted in a PCI bus on ARM, right?

The problem is the current limitation in terms of Xen internal
plumbings, such as lack of MSI support. Is that correct?

If so, I'd update the commit message to reflect the situation a bit
better.


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/drivers/char/Kconfig   |  7 +++++++
>  xen/drivers/char/ns16550.c | 32 ++++++++++++++++----------------
>  2 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index b572305657..8887e86afe 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -4,6 +4,13 @@ config HAS_NS16550
>  	help
>  	  This selects the 16550-series UART support. For most systems, say Y.
>  
> +config HAS_NS16550_PCI
> +	bool "NS16550 UART PCI support" if X86
> +	default y
> +	depends on X86 && HAS_NS16550 && HAS_PCI
> +	help
> +	  This selects the 16550-series UART PCI support. For most systems, say Y.

I think that this should be a silent option:
if HAS_NS16550 && HAS_PCI && X86 -> automatically enable
otherwise -> automatically disable

No need to show it to the user.

The rest of course is fine.


>  config HAS_CADENCE_UART
>  	bool "Xilinx Cadence UART driver"
>  	default y
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index d8b52eb813..bd1c2af956 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -16,7 +16,7 @@
>  #include <xen/timer.h>
>  #include <xen/serial.h>
>  #include <xen/iocap.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>  #include <xen/pci.h>
>  #include <xen/pci_regs.h>
>  #include <xen/pci_ids.h>
> @@ -54,7 +54,7 @@ enum serial_param_type {
>      reg_shift,
>      reg_width,
>      stop_bits,
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      bridge_bdf,
>      device,
>      port_bdf,
> @@ -83,7 +83,7 @@ static struct ns16550 {
>      unsigned int timeout_ms;
>      bool_t intr_works;
>      bool_t dw_usr_bsy;
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      /* PCI card parameters. */
>      bool_t pb_bdf_enable;   /* if =1, pb-bdf effective, port behind bridge */
>      bool_t ps_bdf_enable;   /* if =1, ps_bdf effective, port on pci card */
> @@ -117,14 +117,14 @@ static const struct serial_param_var __initconst sp_vars[] = {
>      {"reg-shift", reg_shift},
>      {"reg-width", reg_width},
>      {"stop-bits", stop_bits},
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      {"bridge", bridge_bdf},
>      {"dev", device},
>      {"port", port_bdf},
>  #endif
>  };
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>  struct ns16550_config {
>      u16 vendor_id;
>      u16 dev_id;
> @@ -620,7 +620,7 @@ static int ns16550_getc(struct serial_port *port, char *pc)
>  
>  static void pci_serial_early_init(struct ns16550 *uart)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
>          return;
>  
> @@ -719,7 +719,7 @@ static void __init ns16550_init_preirq(struct serial_port *port)
>  
>  static void __init ns16550_init_irq(struct serial_port *port)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      struct ns16550 *uart = port->uart;
>  
>      if ( uart->msi )
> @@ -761,7 +761,7 @@ static void __init ns16550_init_postirq(struct serial_port *port)
>      uart->timeout_ms = max_t(
>          unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      if ( uart->bar || uart->ps_bdf_enable )
>      {
>          if ( uart->param && uart->param->mmio &&
> @@ -841,7 +841,7 @@ static void ns16550_suspend(struct serial_port *port)
>  
>      stop_timer(&uart->timer);
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      if ( uart->bar )
>         uart->cr = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>                                    uart->ps_bdf[2]), PCI_COMMAND);
> @@ -850,7 +850,7 @@ static void ns16550_suspend(struct serial_port *port)
>  
>  static void _ns16550_resume(struct serial_port *port)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      struct ns16550 *uart = port->uart;
>  
>      if ( uart->bar )
> @@ -1013,7 +1013,7 @@ static int __init check_existence(struct ns16550 *uart)
>      return 1; /* Everything is MMIO */
>  #endif
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      pci_serial_early_init(uart);
>  #endif
>  
> @@ -1044,7 +1044,7 @@ static int __init check_existence(struct ns16550 *uart)
>      return (status == 0x90);
>  }
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>  static int __init
>  pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>  {
> @@ -1305,7 +1305,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>  
>      if ( *conf == ',' && *++conf != ',' )
>      {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>          if ( strncmp(conf, "pci", 3) == 0 )
>          {
>              if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
> @@ -1327,7 +1327,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>  
>      if ( *conf == ',' && *++conf != ',' )
>      {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>          if ( strncmp(conf, "msi", 3) == 0 )
>          {
>              conf += 3;
> @@ -1339,7 +1339,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>              uart->irq = simple_strtol(conf, &conf, 10);
>      }
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>      if ( *conf == ',' && *++conf != ',' )
>      {
>          conf = parse_pci(conf, NULL, &uart->ps_bdf[0],
> @@ -1419,7 +1419,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>              uart->reg_width = simple_strtoul(param_value, NULL, 0);
>              break;
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>          case bridge_bdf:
>              if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
>                              &uart->ps_bdf[1], &uart->ps_bdf[2]) )
> -- 
> 2.17.1
> 

