Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9BB2C19CE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 01:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35277.66723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khLvb-0002ha-OE; Tue, 24 Nov 2020 00:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35277.66723; Tue, 24 Nov 2020 00:11:27 +0000
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
	id 1khLvb-0002hE-Ko; Tue, 24 Nov 2020 00:11:27 +0000
Received: by outflank-mailman (input) for mailman id 35277;
 Tue, 24 Nov 2020 00:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khLva-0002h3-Bg
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:11:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 356b6fb5-cdb7-4e30-9c1e-bb3d8825ff54;
 Tue, 24 Nov 2020 00:11:25 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E9D620729;
 Tue, 24 Nov 2020 00:11:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PpH5=E6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khLva-0002h3-Bg
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:11:26 +0000
X-Inumbo-ID: 356b6fb5-cdb7-4e30-9c1e-bb3d8825ff54
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 356b6fb5-cdb7-4e30-9c1e-bb3d8825ff54;
	Tue, 24 Nov 2020 00:11:25 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2E9D620729;
	Tue, 24 Nov 2020 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606176684;
	bh=/HuuCVOyJQhQ+dppQE7kCCPgDIgGdcU1N2XEH7loqTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K8xNpn9aqFKuFo1wK23p5plJ5EY6s6UyTxdAodPw8P3USYoUF4WORAXv+NvG3onx7
	 8ZwaSPGYcxwqa4Rz/xjQWHIWxCKZBfRpcAc6gJcxN71PdJ7ZzsIK2l47U8ONRXuiyB
	 47wx58jrTCS0BDfH17fiipguKlxsDPu/1AnPU7bo=
Date: Mon, 23 Nov 2020 16:11:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 2/3] ns16550: "com<N>=" command line options are
 x86-specific
In-Reply-To: <bfa07fc2-9151-402f-3b73-dedf8280cb66@suse.com>
Message-ID: <alpine.DEB.2.21.2011231608120.7979@sstabellini-ThinkPad-T480s>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com> <bfa07fc2-9151-402f-3b73-dedf8280cb66@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2020, Jan Beulich wrote:
> Pure code motion (plus the addition of "#ifdef CONFIG_X86); no
> functional change intended.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Great cleanup

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2: Re-base over new earlier patch.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -318,8 +318,8 @@ Interrupts.  Specifying zero disables CM
>  Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
>  ACPI indicating none to be there.
>  
> -### com1
> -### com2
> +### com1 (x86)
> +### com2 (x86)
>  > `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
>  
>  Both option `com1` and `com2` follow the same format.
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -31,38 +31,6 @@
>  #include <asm/fixmap.h>
>  #endif
>  
> -/*
> - * Configure serial port with a string:
> - *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-bdf>]]]]].
> - * The tail of the string can be omitted if platform defaults are sufficient.
> - * If the baud rate is pre-configured, perhaps by a bootloader, then 'auto'
> - * can be specified in place of a numeric baud rate. Polled mode is specified
> - * by requesting irq 0.
> - */
> -static char __initdata opt_com1[128] = "";
> -static char __initdata opt_com2[128] = "";
> -string_param("com1", opt_com1);
> -string_param("com2", opt_com2);
> -
> -enum serial_param_type {
> -    baud,
> -    clock_hz,
> -    data_bits,
> -    io_base,
> -    irq,
> -    parity,
> -    reg_shift,
> -    reg_width,
> -    stop_bits,
> -#ifdef CONFIG_HAS_PCI
> -    bridge_bdf,
> -    device,
> -    port_bdf,
> -#endif
> -    /* List all parameters before this line. */
> -    num_serial_params
> -};
> -
>  static struct ns16550 {
>      int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
>      u64 io_base;   /* I/O port or memory-mapped I/O address. */
> @@ -98,32 +66,6 @@ static struct ns16550 {
>  #endif
>  } ns16550_com[2] = { { 0 } };
>  
> -struct serial_param_var {
> -    char name[12];
> -    enum serial_param_type type;
> -};
> -
> -/*
> - * Enum struct keeping a table of all accepted parameter names for parsing
> - * com_console_options for serial port com1 and com2.
> - */
> -static const struct serial_param_var __initconst sp_vars[] = {
> -    {"baud", baud},
> -    {"clock-hz", clock_hz},
> -    {"data-bits", data_bits},
> -    {"io-base", io_base},
> -    {"irq", irq},
> -    {"parity", parity},
> -    {"reg-shift", reg_shift},
> -    {"reg-width", reg_width},
> -    {"stop-bits", stop_bits},
> -#ifdef CONFIG_HAS_PCI
> -    {"bridge", bridge_bdf},
> -    {"dev", device},
> -    {"port", port_bdf},
> -#endif
> -};
> -
>  #ifdef CONFIG_HAS_PCI
>  struct ns16550_config {
>      u16 vendor_id;
> @@ -674,6 +616,19 @@ static struct uart_driver __read_mostly
>  #endif
>  };
>  
> +static void ns16550_init_common(struct ns16550 *uart)
> +{
> +    uart->clock_hz  = UART_CLOCK_HZ;
> +
> +    /* Default is no transmit FIFO. */
> +    uart->fifo_size = 1;
> +
> +    /* Default lsr_mask = UART_LSR_THRE */
> +    uart->lsr_mask  = UART_LSR_THRE;
> +}
> +
> +#ifdef CONFIG_X86
> +
>  static int __init parse_parity_char(int c)
>  {
>      switch ( c )
> @@ -1217,6 +1172,64 @@ pci_uart_config(struct ns16550 *uart, bo
>  #endif /* CONFIG_HAS_PCI */
>  
>  /*
> + * Configure serial port with a string:
> + *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-bdf>]]]]].
> + * The tail of the string can be omitted if platform defaults are sufficient.
> + * If the baud rate is pre-configured, perhaps by a bootloader, then 'auto'
> + * can be specified in place of a numeric baud rate. Polled mode is specified
> + * by requesting irq 0.
> + */
> +static char __initdata opt_com1[128] = "";
> +static char __initdata opt_com2[128] = "";
> +string_param("com1", opt_com1);
> +string_param("com2", opt_com2);
> +
> +enum serial_param_type {
> +    baud,
> +    clock_hz,
> +    data_bits,
> +    io_base,
> +    irq,
> +    parity,
> +    reg_shift,
> +    reg_width,
> +    stop_bits,
> +#ifdef CONFIG_HAS_PCI
> +    bridge_bdf,
> +    device,
> +    port_bdf,
> +#endif
> +    /* List all parameters before this line. */
> +    num_serial_params
> +};
> +
> +struct serial_param_var {
> +    char name[12];
> +    enum serial_param_type type;
> +};
> +
> +/*
> + * Enum struct keeping a table of all accepted parameter names for parsing
> + * com_console_options for serial port com1 and com2.
> + */
> +static const struct serial_param_var __initconst sp_vars[] = {
> +    {"baud", baud},
> +    {"clock-hz", clock_hz},
> +    {"data-bits", data_bits},
> +    {"io-base", io_base},
> +    {"irq", irq},
> +    {"parity", parity},
> +    {"reg-shift", reg_shift},
> +    {"reg-width", reg_width},
> +    {"stop-bits", stop_bits},
> +#ifdef CONFIG_HAS_PCI
> +    {"bridge", bridge_bdf},
> +    {"dev", device},
> +    {"port", port_bdf},
> +#endif
> +};
> +
> +/*
>   * Used to parse name value pairs and return which value it is along with
>   * pointer for the extracted value.
>   */
> @@ -1504,17 +1517,6 @@ static void __init ns16550_parse_port_co
>      serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
>  }
>  
> -static void ns16550_init_common(struct ns16550 *uart)
> -{
> -    uart->clock_hz  = UART_CLOCK_HZ;
> -
> -    /* Default is no transmit FIFO. */
> -    uart->fifo_size = 1;
> -
> -    /* Default lsr_mask = UART_LSR_THRE */
> -    uart->lsr_mask  = UART_LSR_THRE;
> -}
> -
>  void __init ns16550_init(int index, struct ns16550_defaults *defaults)
>  {
>      struct ns16550 *uart;
> @@ -1541,6 +1543,8 @@ void __init ns16550_init(int index, stru
>      ns16550_parse_port_config(uart, (index == 0) ? opt_com1 : opt_com2);
>  }
>  
> +#endif /* CONFIG_X86 */
> +
>  #ifdef CONFIG_HAS_DEVICE_TREE
>  static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>                                         const void *data)
> 

