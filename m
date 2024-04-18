Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01F8A9ECE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708486.1107440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTvY-00022E-S0; Thu, 18 Apr 2024 15:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708486.1107440; Thu, 18 Apr 2024 15:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTvY-0001zE-Oa; Thu, 18 Apr 2024 15:43:56 +0000
Received: by outflank-mailman (input) for mailman id 708486;
 Thu, 18 Apr 2024 15:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DNVj=LX=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rxTvW-0001xq-Qr
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:43:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7588358b-fd9a-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 17:43:53 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a53f131d9deso112535366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:43:53 -0700 (PDT)
Received: from [192.168.0.107] ([91.123.150.5])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b00a526a99ccecsm1047891ejd.42.2024.04.18.08.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 08:43:52 -0700 (PDT)
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
X-Inumbo-ID: 7588358b-fd9a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713455033; x=1714059833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWKoyaYHpVNzIRsVIBBnWTD1mZrFmJFCALnJCC3cCj4=;
        b=ZKECIkHXFEwPKdTcaLJa7Mk2FbZDeLDpMmygQ2yQF8epWoruEO1ELO/9eYBFCxuLOT
         0fLSTSF+wRIVvMs9TlrdTmB2o9ruV/un5MvpmsaPeM6/Q0Cn6lSfBfHNGQDbUpNvQaRX
         65Ql2//1faef6OTBPZrnecYWBdPsxxEQl8Tc7NV+BycomYu3DmJTN2fjAX3UvCW3BVPJ
         01Y3y1+xHXir1g75iUMsepOuQCiGh4OisU4ZR2fl3yfliHmfNyeR31UFqsX/9p9+Xue8
         KQ6ccBAW7qgcSZooJnuS902JAfVyWWR662SuZdLmhy8TvQxntircLIyhn7wU0KT3cYJ7
         eK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455033; x=1714059833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWKoyaYHpVNzIRsVIBBnWTD1mZrFmJFCALnJCC3cCj4=;
        b=ZA9m8ytIvi6jFuNvrRhTlEcQG+Xx59xPdrx7eYuIV6AeN2TU6pn9Hn3QK472/sLls+
         xKJlmt/8PhGZafTVITxFpwwptaobO4cKVpl+dMpFoSR8/E8tmpdn6RdUUyTh1CWGo850
         xGMP++emOYfmICxGpZxcN64pOa93nd0DV7ASqg5feRd+HgeQn1Djsa49JC70yhVmT5Dg
         BaMjvROsjf/i02cKuv9xIsOczqx168gb+qXqjYv1JfVfMSGeK8U3wrIir4DEwHCGmlqP
         NBXP64N2+4RTVNbc8oc+5HU3+Rixo1qvM2lcFot6DgjycC+77upMM4+xJN5BhJIUxO/v
         x9cw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+bi5fnTJCZDi5+IPEFhYwBkVeQshdW8d7cQbenMWgYOhXDsZDzFqAKJISEJVuC8wvxeteTG/L/1vyooolyJrYT2habkU9VPH68YWF0c=
X-Gm-Message-State: AOJu0YxgauYCbDRQEZj/pkv6c8Lo6fYafwMsR4HAbZ0vt7sGQWq216IR
	l8wjW92KgEX6OLCPe7ZJZxyI+4DggB81ZxLnvIBzWovxutMHf9ji
X-Google-Smtp-Source: AGHT+IFhdU6QoaTkJxqTiIw8s58+C0Ya54JYgXn5vMoSgszaePH3uB4KdotqKzb9bCGY74pq8KI8EQ==
X-Received: by 2002:a17:907:97cd:b0:a55:a04:6fbc with SMTP id js13-20020a17090797cd00b00a550a046fbcmr2388068ejc.23.1713455032642;
        Thu, 18 Apr 2024 08:43:52 -0700 (PDT)
Message-ID: <631c2da6-8ce1-46ea-b685-cfaff8efa508@gmail.com>
Date: Thu, 18 Apr 2024 18:43:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Add i.MX UART early printk support
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Peng Fan <peng.fan@nxp.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
 <20240402120557.1822253-2-olekstysh@gmail.com>
 <5151abab-93a9-4b3f-8d69-c45e3cfc663c@amd.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <5151abab-93a9-4b3f-8d69-c45e3cfc663c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.04.24 13:11, Michal Orzel wrote:
> Hi Oleksandr,

Hello Michal

sorry for the late response

> 
> On 02/04/2024 14:05, Oleksandr Tyshchenko wrote:
>>
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Tested on i.MX 8M Mini only, but I guess, it should be
>> suitable for other i.MX8M* SoCs (those UART device tree nodes
>> contain "fsl,imx6q-uart" compatible string).
> Please use imperative mood in commit msg.

ok


> I would mention also that you are adding
> macros that will be used by the runtime driver.


will do

> 
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> I selected the following configs for enabling early printk:
>>
>>   CONFIG_EARLY_UART_CHOICE_IMX_UART=y
>>   CONFIG_EARLY_UART_IMX_UART=y
>>   CONFIG_EARLY_PRINTK=y
>>   CONFIG_EARLY_UART_BASE_ADDRESS=0x30890000
>>   CONFIG_EARLY_PRINTK_INC="debug-imx-uart.inc"
>> ---
>> ---
>>   xen/arch/arm/Kconfig.debug            | 14 +++++
>>   xen/arch/arm/arm64/debug-imx-uart.inc | 38 ++++++++++++++
>>   xen/arch/arm/include/asm/imx-uart.h   | 76 +++++++++++++++++++++++++++
>>   3 files changed, 128 insertions(+)
>>   create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
>>   create mode 100644 xen/arch/arm/include/asm/imx-uart.h
>>
>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>> index eec860e88e..a15d08f214 100644
>> --- a/xen/arch/arm/Kconfig.debug
>> +++ b/xen/arch/arm/Kconfig.debug
>> @@ -68,6 +68,16 @@ choice
>>                          provide the parameters for the i.MX LPUART rather than
>>                          selecting one of the platform specific options below if
>>                          you know the parameters for the port.
>> +       config EARLY_UART_CHOICE_IMX_UART
>> +               select EARLY_UART_IMX_UART
>> +               depends on ARM_64
>> +               bool "Early printk via i.MX UART"
>> +               help
>> +                       Say Y here if you wish the early printk to direct their
> Do not take example from surrounding code. help text should be indented by 2 tabs and 2 spaces here.

ok

> 
>> +                       output to a i.MX UART. You can use this option to
>> +                       provide the parameters for the i.MX UART rather than
>> +                       selecting one of the platform specific options below if
>> +                       you know the parameters for the port.
>>          config EARLY_UART_CHOICE_MESON
>>                  select EARLY_UART_MESON
>>                  depends on ARM_64
>> @@ -199,6 +209,9 @@ config EARLY_UART_EXYNOS4210
>>   config EARLY_UART_IMX_LPUART
>>          select EARLY_PRINTK
>>          bool
>> +config EARLY_UART_IMX_UART
>> +       select EARLY_PRINTK
>> +       bool
>>   config EARLY_UART_MESON
>>          select EARLY_PRINTK
>>          bool
>> @@ -304,6 +317,7 @@ config EARLY_PRINTK_INC
>>          default "debug-cadence.inc" if EARLY_UART_CADENCE
>>          default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
>>          default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
>> +       default "debug-imx-uart.inc" if EARLY_UART_IMX_UART
>>          default "debug-meson.inc" if EARLY_UART_MESON
>>          default "debug-mvebu.inc" if EARLY_UART_MVEBU
>>          default "debug-pl011.inc" if EARLY_UART_PL011
>> diff --git a/xen/arch/arm/arm64/debug-imx-uart.inc b/xen/arch/arm/arm64/debug-imx-uart.inc
>> new file mode 100644
>> index 0000000000..27a68b1ed5
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/debug-imx-uart.inc
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * xen/arch/arm/arm64/debug-imx-uart.inc
>> + *
>> + * i.MX8M* specific debug code
>> + *
>> + * Copyright (C) 2024 EPAM Systems Inc.
>> + */
>> +
>> +#include <asm/imx-uart.h>
>> +
>> +/*
>> + * Wait UART to be ready to transmit
>> + * rb: register which contains the UART base address
>> + * rc: scratch register
>> + */
>> +.macro early_uart_ready xb, c
>> +1:
>> +        ldr   w\c, [\xb, #IMX21_UTS] /* <- Test register */
>> +        tst   w\c, #UTS_TXFULL       /* Check TxFIFO FULL bit */
>> +        bne   1b                     /* Wait for the UART to be ready */
>> +.endm
>> +
>> +/*
>> + * UART transmit character
>> + * rb: register which contains the UART base address
>> + * rt: register which contains the character to transmit
>> + */
>> +.macro early_uart_transmit xb, wt
>> +        str   \wt, [\xb, #URTX0] /* -> Transmitter Register */
>> +.endm
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
>> new file mode 100644
>> index 0000000000..413a81dd44
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/imx-uart.h
>> @@ -0,0 +1,76 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * xen/arch/arm/include/asm/imx-uart.h
>> + *
>> + * Common constant definition between early printk and the UART driver
>> + *
>> + * Copyright (C) 2024 EPAM Systems Inc.
>> + */
>> +
>> +#ifndef __ASM_ARM_IMX_UART_H__
>> +#define __ASM_ARM_IMX_UART_H__
>> +
>> +/* 32-bit register definition */
>> +#define URXD0        (0x00) /* Receiver Register */
> There is no need to surround these values

ok

> 
>> +#define URTX0        (0x40) /* Transmitter Register */
>> +#define UCR1         (0x80) /* Control Register 1 */
>> +#define UCR2         (0x84) /* Control Register 2 */
>> +#define UCR3         (0x88) /* Control Register 3 */
> 
>> +#define UCR4         (0x8c) /* Control Register 4 */
>> +#define UFCR         (0x90) /* FIFO Control Register */
>> +#define USR1         (0x94) /* Status Register 1 */
>> +#define USR2         (0x98) /* Status Register 2 */
>> +#define IMX21_UTS    (0xb4) /* Test Register */
>> +
>> +#define URXD_ERR        BIT(14, UL) /* Error detect */
>> +#define URXD_RX_DATA    GENMASK(7, 0) /* Received data mask */
>> +
>> +#define UCR1_TRDYEN      BIT(13, UL) /* Transmitter ready interrupt enable */
>> +#define UCR1_RRDYEN      BIT(9, UL) /* Receiver ready interrupt enable */
> NIT: please align comments within a block

ok

> 
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>


thanks

> 
> ~Michal

