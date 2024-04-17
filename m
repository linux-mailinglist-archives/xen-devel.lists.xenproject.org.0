Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6348A8E5D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 23:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707782.1106035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxDIu-0008Mr-Ea; Wed, 17 Apr 2024 21:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707782.1106035; Wed, 17 Apr 2024 21:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxDIu-0008KU-Bv; Wed, 17 Apr 2024 21:58:56 +0000
Received: by outflank-mailman (input) for mailman id 707782;
 Wed, 17 Apr 2024 21:58:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rxDIt-0008KO-GC
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 21:58:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxDIs-0007JP-9j; Wed, 17 Apr 2024 21:58:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxDIs-00006N-3c; Wed, 17 Apr 2024 21:58:54 +0000
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
	bh=II5tclPltclzsE8LMFxvJjn+8s1w53uZOckUeKFXjoc=; b=LrrkKTdnbTbrC1mBcnRRdPiiTB
	tgypHjMuQp+cu0Mar61Hw72NIIKlikAraeolrdY70ujRAgGiOr+wfFPrPyU8GXWi1mPoA5qkjaMiu
	qM5tM/yp70QHzUExOGyswzzZBUKW3BJ4FyCVBxbwy099LM8keUg/D2DRVwbv+PBEv17c=;
Message-ID: <5b9f9b19-282a-4005-a506-6b3df7363a89@xen.org>
Date: Wed, 17 Apr 2024 22:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/03/2024 00:08, Volodymyr Babchuk wrote:
> Generic Interface (GENI) is a newer interface for low speed interfaces
> like UART, I2C or SPI. This patch adds the simple driver for the UART
> instance of GENI. Code is based on similar drivers in U-Boot and Linux
> kernel.

If this is based on Linux/U-boot, then I assume you read the code and 
possibly copy/paste some of it. Therefore...

> 
> This driver implements only simple synchronous mode, because although
> GENI supports FIFO mode, it needs to know number of
> characters **before** starting TX transaction. This is a stark
> contrast when compared to other UART peripherals, which allow adding
> characters to a FIFO while TX operation is running.
> 
> The patch adds both normal UART driver and earlyprintk version.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/Kconfig.debug           |  19 +-
>   xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
>   xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>   xen/drivers/char/Kconfig             |   8 +
>   xen/drivers/char/Makefile            |   1 +
>   xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>   6 files changed, 439 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>   create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>   create mode 100644 xen/drivers/char/qcom-uart.c
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index eec860e88e..f6ab0bb30e 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -119,6 +119,19 @@ choice
>   			selecting one of the platform specific options below if
>   			you know the parameters for the port.
>   
> +			This option is preferred over the platform specific
> +			options; the platform specific options are deprecated
> +			and will soon be removed.
> +	config EARLY_UART_CHOICE_QCOM
> +		select EARLY_UART_QCOM
> +		bool "Early printk via Qualcomm debug UART"
> +		help
> +			Say Y here if you wish the early printk to direct their
> +			output to a Qualcomm debug UART. You can use this option to
> +			provide the parameters for the debug UART rather than
> +			selecting one of the platform specific options below if
> +			you know the parameters for the port.
> +
>   			This option is preferred over the platform specific
>   			options; the platform specific options are deprecated
>   			and will soon be removed.
> @@ -211,6 +224,9 @@ config EARLY_UART_PL011
>   config EARLY_UART_SCIF
>   	select EARLY_PRINTK
>   	bool
> +config EARLY_UART_QCOM
> +	select EARLY_PRINTK
> +	bool
>   
>   config EARLY_PRINTK
>   	bool
> @@ -261,7 +277,7 @@ config EARLY_UART_PL011_MMIO32
>   	  will be done using 32-bit only accessors.
>   
>   config EARLY_UART_INIT
> -	depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
> +	depends on (EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0) || EARLY_UART_QCOM
>   	def_bool y
>   
>   config EARLY_UART_8250_REG_SHIFT
> @@ -308,3 +324,4 @@ config EARLY_PRINTK_INC
>   	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>   	default "debug-pl011.inc" if EARLY_UART_PL011
>   	default "debug-scif.inc" if EARLY_UART_SCIF
> +	default "debug-qcom.inc" if EARLY_UART_QCOM
> diff --git a/xen/arch/arm/arm64/debug-qcom.inc b/xen/arch/arm/arm64/debug-qcom.inc
> new file mode 100644
> index 0000000000..130d08d6e9
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-qcom.inc
> @@ -0,0 +1,76 @@
> +/*
> + * xen/arch/arm/arm64/debug-qcom.inc
> + *
> + * Qualcomm debug UART specific debug code
> + *
> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> + * Copyright (C) 2024, EPAM Systems.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

... I don't think you can use GPLv2+ license here. It has to be the same 
as Linux/U-boot.

Also, as there is no public manual, can you provide some pointer to the 
code from both repo (including version)? This would help the reviewer to 
confirm you code.

Cheers,

-- 
Julien Grall

