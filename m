Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37B9CFDD7
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838660.1254627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFll-0006v3-EI; Sat, 16 Nov 2024 10:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838660.1254627; Sat, 16 Nov 2024 10:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCFll-0006sP-B3; Sat, 16 Nov 2024 10:11:09 +0000
Received: by outflank-mailman (input) for mailman id 838660;
 Sat, 16 Nov 2024 10:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCFlj-0006pw-3t
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:11:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCFli-007zdX-1R;
 Sat, 16 Nov 2024 10:11:06 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCFli-007ukQ-1P;
 Sat, 16 Nov 2024 10:11:06 +0000
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
	bh=dFlqahF601Q3GKL30RzB6iLL/3eEwxGitLmm14QHg9w=; b=Rd+eiONqv862ns5qpeodzGiVrx
	3MplGl5FxOsFuFnFYSrabpMDXbEFGQkd/C+DVL358ASQt5LGGjGh8j1tIAHLjFR5AMlKrWgrDCIfC
	1UPyWA0PrAN+pwqQqw1CrWKn5LkWcDky7XmOQWdrlmwWaJ4Hxtg5ZHw214klv/UO9udY=;
Message-ID: <804b2455-27f8-4017-a771-9c76d829d164@xen.org>
Date: Sat, 16 Nov 2024 10:11:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drivers/char: rename arm-uart.c to uart-init.c
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b2eed7fed17c9e9a3a9414e6d97360a7deeb2acb.1731671392.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b2eed7fed17c9e9a3a9414e6d97360a7deeb2acb.1731671392.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 15/11/2024 12:48, Oleksii Kurochko wrote:
> Rename the file containing uart_init() to enable reuse across other
> architectures that utilize device trees or SPCR tables to locate UART
> information.
> After locating UART data, {acpi}_device_init() is called to initialize
> the UART.
> 
> arm_uart_init() is renamed to uart_init() to be reused by other
> architectures.
> 
> A new configuration option, CONFIG_UART_INIT, is introduced, currently
> available only for Arm. Enabling CONFIG_UART_INIT on additional
> architectures will require additional functionality, such as device tree
> mapping and unflattening, etc.
> 
> The MAINTAINERS file is updated to alphabetically sort files in the
> "ARM (W/ VIRTUALIZATION EXTENSIONS) ARCHITECTURE" section following
> the renaming of arm-uart.c.
> 
> Add `select UART_INIT` for CONFIG_ARM to be sure that randconfig won't
> disable UART_INIT.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>   - Drop blank line in xen/drivers/char/Kconfig.
>   - Rebase on top of the latest staging.
> ---
> Changes in v2:
>   - Rename arm-uart.c to uart-init.c instead of moving only dt_uart_init() to
>     separate file.
>   - Introduce new CONFIG_UART_INIT.
>   - Rename arm_uart_init() to uart_init().
>   - Add 'select UART_INIT' for CONFIG_ARM to be sure that randconfig won't
>     disable UART_INIT.
>   - Update the commit message.
> ---
>   MAINTAINERS                  |   2 +-
>   xen/arch/arm/Kconfig         |   1 +
>   xen/arch/arm/setup.c         |   2 +-
>   xen/drivers/char/Kconfig     |  10 +++
>   xen/drivers/char/Makefile    |   2 +-
>   xen/drivers/char/arm-uart.c  | 145 -----------------------------------
>   xen/drivers/char/uart-init.c | 145 +++++++++++++++++++++++++++++++++++
>   xen/include/xen/serial.h     |   2 +-
>   8 files changed, 160 insertions(+), 149 deletions(-)
>   delete mode 100644 xen/drivers/char/arm-uart.c
>   create mode 100644 xen/drivers/char/uart-init.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17fc5f9eec..a237080074 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -245,7 +245,6 @@ S:	Supported
>   L:	xen-devel@lists.xenproject.org
>   F:	docs/misc/arm/
>   F:	xen/arch/arm/
> -F:	xen/drivers/char/arm-uart.c
>   F:	xen/drivers/char/cadence-uart.c
>   F:	xen/drivers/char/exynos4210-uart.c
>   F:	xen/drivers/char/imx-lpuart.c
> @@ -254,6 +253,7 @@ F:	xen/drivers/char/mvebu-uart.c
>   F:	xen/drivers/char/omap-uart.c
>   F:	xen/drivers/char/pl011.c
>   F:	xen/drivers/char/scif-uart.c
> +F:	xen/drivers/char/uart-init.c

(No action needed)

I think that's fine for now. At some point we will need to consider a 
place where this can be maintained by other arch maintainers because 
this is not Arm specific anymore. The only place I can think of is THE REST.

>   F:	xen/drivers/passthrough/arm/
>   F:	xen/include/public/arch-arm/
>   F:	xen/include/public/arch-arm.h
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 15b2e4a227..e068497361 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM
>   	select HAS_PASSTHROUGH
>   	select HAS_UBSAN
>   	select IOMMU_FORCE_PT_SHARE
> +	select UART_INIT
>   
>   config ARCH_DEFCONFIG
>   	string
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 71ebaa77ca..2e27af4560 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -361,7 +361,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>   
>       gic_preinit();
>   
> -    arm_uart_init();
> +    uart_init();
>       console_init_preirq();
>       console_init_ring();
>   
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index e175d07c02..49a06a7859 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -93,6 +93,16 @@ config SERIAL_TX_BUFSIZE
>   
>   	  Default value is 32768 (32KiB).
>   
> +config UART_INIT

NIT Naming: I would consider to add GENERIC in the same. This makes 
clearer why x86 doesn't select because they would have their own 
implementation.

> +	bool "UART initialization for DT and ACPI"

Why do we provide a prompt for UART_INIT? This is not something I would 
expect the user to be able to disable.

> +	depends on ARM
> +	default y
> +	help
> +	  Provides a generic method for locating UART device tree node when
> +	  device tree is used, or for finding UART information in SPCR
> +	  table when using ACPI. Once UART information is located,
> +	  {acpi}_device_init() is called for UART-specific initialization.

The last sentence contains too much implementation details. Kconfig is 
meant for admin to know what they need to select. I think it should be 
dropped. That said, if you don't provide any problem, then this Kconfig 
would just be:

config UART_INIT

And this is selected by arch.

> +
>   config XHCI
>   	bool "XHCI DbC UART driver"
>   	depends on X86

[...]

> diff --git a/xen/drivers/char/uart-init.c b/xen/drivers/char/uart-init.c
> new file mode 100644
> index 0000000000..7f3b385308
> --- /dev/null
> +++ b/xen/drivers/char/uart-init.c
> @@ -0,0 +1,145 @@
> +/*
> + * xen/drivers/char/arm-uart.c
> + *
> + * Generic uart retrieved via the device tree or ACPI
> + *
> + * Julien Grall <julien.grall@linaro.org>
> + * Copyright (c) 2013 Linaro Limited.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

NIT: As you are updating the file, would you be able to convert the 
license to SPDX. For this one, this will need to be:

/* SPDX-License-Identifier: GPL-2.0-or-later */

Cheers,

-- 
Julien Grall

