Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085B4FB96B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302890.516748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrCy-00083t-KU; Mon, 11 Apr 2022 10:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302890.516748; Mon, 11 Apr 2022 10:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrCy-00081g-Fs; Mon, 11 Apr 2022 10:23:44 +0000
Received: by outflank-mailman (input) for mailman id 302890;
 Mon, 11 Apr 2022 10:23:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndrCw-00080q-Qb
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:23:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrCt-0003af-2y; Mon, 11 Apr 2022 10:23:39 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrCs-0002GI-SS; Mon, 11 Apr 2022 10:23:39 +0000
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
	bh=WRbReHH2w9ECMqT3skvkpWAjllZtnyCzBY68JBN2Esk=; b=xIxV4Vv9EsOdUEjbpMg8qSWom+
	ZKD5wkctr6xIGWrVPC7GbdnCA6L2e2tgEhMBmN1kjoriAb4mqUPBXUQN9EnOtN2fHK9uT/WLODyDd
	lVutkSUqs0g4JJWPlJioXnjWSpptTtS3qsxVXxQ86vkPaviV8PadWnvBs/uqKyYq/WXk=;
Message-ID: <dea7a276-867a-df02-8584-0433fd5f3910@xen.org>
Date: Mon, 11 Apr 2022 11:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH V4 2/2] xen/arm: Add i.MX lpuart early printk support
To: Michal Orzel <michal.orzel@arm.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220408140932.17968-1-peng.fan@oss.nxp.com>
 <20220408140932.17968-3-peng.fan@oss.nxp.com>
 <62e62ea5-0286-7e34-efab-66f0e51afeda@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62e62ea5-0286-7e34-efab-66f0e51afeda@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/04/2022 07:24, Michal Orzel wrote:
> On 08.04.2022 16:09, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>   xen/arch/arm/Kconfig.debug              | 14 +++++++
>>   xen/arch/arm/arm64/debug-imx-lpuart.inc | 52 +++++++++++++++++++++++++
>>   2 files changed, 66 insertions(+)
>>   create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
>>
>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>> index 35ccd13273..842d768280 100644
>> --- a/xen/arch/arm/Kconfig.debug
>> +++ b/xen/arch/arm/Kconfig.debug
>> @@ -58,6 +58,16 @@ choice
>>   			This option is preferred over the platform specific
>>   			options; the platform specific options are deprecated
>>   			and will soon be removed.
>> +	config EARLY_UART_CHOICE_IMX_LPUART
>> +		select EARLY_UART_IMX_LPUART
>> +		depends on ARM_64
>> +		bool "Early printk via i.MX LPUART"
>> +		help
>> +			Say Y here if you wish the early printk to direct their
>> +			output to a i.MX LPUART. You can use this option to
>> +			provide the parameters for the i.MX LPUART rather than
>> +			selecting one of the platform specific options below if
>> +			you know the parameters for the port.
>>   	config EARLY_UART_CHOICE_MESON
>>   		select EARLY_UART_MESON
>>   		depends on ARM_64
>> @@ -186,6 +196,9 @@ config EARLY_UART_CADENCE
>>   config EARLY_UART_EXYNOS4210
>>   	select EARLY_PRINTK
>>   	bool
>> +config EARLY_UART_IMX_LPUART
>> +	select EARLY_PRINTK
>> +	bool
>>   config EARLY_UART_MESON
>>   	select EARLY_PRINTK
>>   	bool
>> @@ -283,6 +296,7 @@ config EARLY_PRINTK_INC
>>   	default "debug-8250.inc" if EARLY_UART_8250
>>   	default "debug-cadence.inc" if EARLY_UART_CADENCE
>>   	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
>> +	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
>>   	default "debug-meson.inc" if EARLY_UART_MESON
>>   	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>>   	default "debug-pl011.inc" if EARLY_UART_PL011
>> diff --git a/xen/arch/arm/arm64/debug-imx-lpuart.inc b/xen/arch/arm/arm64/debug-imx-lpuart.inc
>> new file mode 100644
>> index 0000000000..f68252da86
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
>> @@ -0,0 +1,52 @@
>> +/*
>> + * xen/arch/arm/arm64/debug-imx-lpuart.inc
>> + *
>> + * i.MX8QM specific debug code
>> + *
>> + * Peng Fan <peng.fan@nxp.com>
>> + * Copyright 2022 NXP
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <asm/imx-lpuart.h>
>> +
>> +.macro early_uart_init wb wc wd
>> +/* Already initialized in bootloader */
>> +.endm
>> +
> FWICS, early_uart_init call is protected with CONFIG_EARLY_UART_INIT that is set
> only for PL011 UART. So I think there is no need to implement this empty macro,
> unless we want to keep the same macros across the files no matter whether in use or not.
> I think you need to ask Julien.

The call to early_uart_init is indeed protected by #ifdef 
CONFIG_EARLY_UART_INIT. The goal was to avoid having all debug-*.inc to 
implement dummy helper.

So I would prefer if early_uart_init is not implemented for 
debug-imx-lpuart.inc.

Cheers,

-- 
Julien Grall

