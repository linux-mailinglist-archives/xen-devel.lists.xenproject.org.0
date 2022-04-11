Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288384FBAA1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 13:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302990.516934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrzI-0005eo-Kq; Mon, 11 Apr 2022 11:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302990.516934; Mon, 11 Apr 2022 11:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrzI-0005cG-HF; Mon, 11 Apr 2022 11:13:40 +0000
Received: by outflank-mailman (input) for mailman id 302990;
 Mon, 11 Apr 2022 11:13:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hqm=UV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ndrzH-0005c8-3m
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 11:13:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6eaa55d5-b988-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 13:13:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15633169E;
 Mon, 11 Apr 2022 04:13:36 -0700 (PDT)
Received: from [10.57.8.177] (unknown [10.57.8.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652643F5A1;
 Mon, 11 Apr 2022 04:13:33 -0700 (PDT)
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
X-Inumbo-ID: 6eaa55d5-b988-11ec-a405-831a346695d4
Message-ID: <bb60e700-c89e-60ba-74ee-6ad66b04988e@arm.com>
Date: Mon, 11 Apr 2022 13:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 1/2] xen/arm: Add i.MX lpuart driver
Content-Language: en-US
To: Julien Grall <julien@xen.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>, Henry Wang <Henry.Wang@arm.com>
References: <20220408140932.17968-1-peng.fan@oss.nxp.com>
 <20220408140932.17968-2-peng.fan@oss.nxp.com>
 <d164f7a7-a219-63ad-580d-ead86ea79103@arm.com>
 <f0179c9c-e268-7858-2956-c3433a4e19cb@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <f0179c9c-e268-7858-2956-c3433a4e19cb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Julien,

On 11.04.2022 12:20, Julien Grall wrote:
> Hi,
> 
> On 11/04/2022 07:26, Michal Orzel wrote:
>> On 08.04.2022 16:09, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> The i.MX LPUART Documentation:
>>> https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
>>> Chatper 13.6 Low Power Universal Asynchronous Receiver/
>>> Transmitter (LPUART)
>>>
>>> Tested-by: Henry Wang <Henry.Wang@arm.com>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>   xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
>>>   xen/drivers/char/Kconfig              |   7 +
>>>   xen/drivers/char/Makefile             |   1 +
>>>   xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
>>>   4 files changed, 348 insertions(+)
>>>   create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
>>>   create mode 100644 xen/drivers/char/imx-lpuart.c
>>>
>>> diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
>>> new file mode 100644
>>> index 0000000000..26e2cf0249
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/imx-lpuart.h
>>> @@ -0,0 +1,64 @@
>>> +/*
>>> + * xen/arch/arm/include/asm/imx-lpuart.h
>>> + *
>>> + * Common constant definition between early printk and the LPUART driver
>>> + *
>>> + * Peng Fan <peng.fan@nxp.com>
>>> + * Copyright 2022 NXP
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#ifndef __ASM_ARM_IMX_LPUART_H__
>>> +#define __ASM_ARM_IMX_LPUART_H__
>>> +
>>> +/* 32-bit register definition */
>>> +#define UARTBAUD          (0x10)
>>> +#define UARTSTAT          (0x14)
>>> +#define UARTCTRL          (0x18)
>>> +#define UARTDATA          (0x1C)
>>> +#define UARTMATCH         (0x20)
>>> +#define UARTMODIR         (0x24)
>>> +#define UARTFIFO          (0x28)
>>> +#define UARTWATER         (0x2c)
>>> +
>>> +#define UARTSTAT_TDRE     BIT(23, UL)
>>> +#define UARTSTAT_TC       BIT(22, UL)
>>> +#define UARTSTAT_RDRF     BIT(21, UL)
>>> +#define UARTSTAT_OR       BIT(19, UL)
>>> +
>>> +#define UARTBAUD_OSR_SHIFT (24)
>>> +#define UARTBAUD_OSR_MASK (0x1f)
>>> +#define UARTBAUD_SBR_MASK (0x1fff)
>>> +#define UARTBAUD_BOTHEDGE (0x00020000)
>>> +#define UARTBAUD_TDMAE    (0x00800000)
>>> +#define UARTBAUD_RDMAE    (0x00200000)It seems like you missed my comment about alignment from the previous patch version.
>> Please keep the same alignment of values within the same section.
> 
> I haven't yet reviewed this patch. But if this is the only comment, then I can update the alignment on commit.
> 
> Cheers,
> 

All my other findings have already been fixed by Peng. This is the last one as it was forgotten.
Patch 2/2 still has sth to be fixed so the alignment can be fixed in the same shot as well.

Cheers,
Michal

