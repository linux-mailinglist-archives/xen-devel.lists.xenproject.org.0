Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30904FB94C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302877.516716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrA2-0006Lp-Hq; Mon, 11 Apr 2022 10:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302877.516716; Mon, 11 Apr 2022 10:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrA2-0006Jj-Di; Mon, 11 Apr 2022 10:20:42 +0000
Received: by outflank-mailman (input) for mailman id 302877;
 Mon, 11 Apr 2022 10:20:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndrA1-0006Ja-0Z
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:20:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndr9x-0003VN-8U; Mon, 11 Apr 2022 10:20:37 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndr9x-0001vT-28; Mon, 11 Apr 2022 10:20:37 +0000
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
	bh=Fx8e/BCmEIGVcEn/oDxkMpqfG8K0VZr74epy7XlS7XA=; b=co5oRw9aE+iGuAIeyUBZZckMvc
	AkUvy0XkqcdVtSEHvcrvsOZ6ndtfY0sK8MICpBUyft0rDIP5g7Fti4qntZOmuF1lDkiZL/KTlK72J
	jfzumxL5AcgdpvxhLjiorRzmYHW7DMu5FR3S/28WhMYrgCkDwlt0mO9CZcV5XeUM88zs=;
Message-ID: <f0179c9c-e268-7858-2956-c3433a4e19cb@xen.org>
Date: Mon, 11 Apr 2022 11:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH V4 1/2] xen/arm: Add i.MX lpuart driver
To: Michal Orzel <michal.orzel@arm.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>, Henry Wang <Henry.Wang@arm.com>
References: <20220408140932.17968-1-peng.fan@oss.nxp.com>
 <20220408140932.17968-2-peng.fan@oss.nxp.com>
 <d164f7a7-a219-63ad-580d-ead86ea79103@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d164f7a7-a219-63ad-580d-ead86ea79103@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/04/2022 07:26, Michal Orzel wrote:
> On 08.04.2022 16:09, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> The i.MX LPUART Documentation:
>> https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
>> Chatper 13.6 Low Power Universal Asynchronous Receiver/
>> Transmitter (LPUART)
>>
>> Tested-by: Henry Wang <Henry.Wang@arm.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>   xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
>>   xen/drivers/char/Kconfig              |   7 +
>>   xen/drivers/char/Makefile             |   1 +
>>   xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
>>   4 files changed, 348 insertions(+)
>>   create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
>>   create mode 100644 xen/drivers/char/imx-lpuart.c
>>
>> diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
>> new file mode 100644
>> index 0000000000..26e2cf0249
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/imx-lpuart.h
>> @@ -0,0 +1,64 @@
>> +/*
>> + * xen/arch/arm/include/asm/imx-lpuart.h
>> + *
>> + * Common constant definition between early printk and the LPUART driver
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
>> +#ifndef __ASM_ARM_IMX_LPUART_H__
>> +#define __ASM_ARM_IMX_LPUART_H__
>> +
>> +/* 32-bit register definition */
>> +#define UARTBAUD          (0x10)
>> +#define UARTSTAT          (0x14)
>> +#define UARTCTRL          (0x18)
>> +#define UARTDATA          (0x1C)
>> +#define UARTMATCH         (0x20)
>> +#define UARTMODIR         (0x24)
>> +#define UARTFIFO          (0x28)
>> +#define UARTWATER         (0x2c)
>> +
>> +#define UARTSTAT_TDRE     BIT(23, UL)
>> +#define UARTSTAT_TC       BIT(22, UL)
>> +#define UARTSTAT_RDRF     BIT(21, UL)
>> +#define UARTSTAT_OR       BIT(19, UL)
>> +
>> +#define UARTBAUD_OSR_SHIFT (24)
>> +#define UARTBAUD_OSR_MASK (0x1f)
>> +#define UARTBAUD_SBR_MASK (0x1fff)
>> +#define UARTBAUD_BOTHEDGE (0x00020000)
>> +#define UARTBAUD_TDMAE    (0x00800000)
>> +#define UARTBAUD_RDMAE    (0x00200000)It seems like you missed my comment about alignment from the previous patch version.
> Please keep the same alignment of values within the same section.

I haven't yet reviewed this patch. But if this is the only comment, then 
I can update the alignment on commit.

Cheers,

-- 
Julien Grall

