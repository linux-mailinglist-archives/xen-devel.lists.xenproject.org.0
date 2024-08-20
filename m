Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38195819B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 11:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780228.1189857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKmA-0007Rq-7W; Tue, 20 Aug 2024 09:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780228.1189857; Tue, 20 Aug 2024 09:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKmA-0007Pb-40; Tue, 20 Aug 2024 09:03:38 +0000
Received: by outflank-mailman (input) for mailman id 780228;
 Tue, 20 Aug 2024 09:03:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sgKm9-0007PT-17
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 09:03:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sgKm6-000230-SN; Tue, 20 Aug 2024 09:03:34 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sgKm6-0001Bq-L7; Tue, 20 Aug 2024 09:03:34 +0000
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
	bh=h0cdcyxZ0OiBlsqHYQK0TYfwpiVF/3b+tnIDJwRpZYs=; b=mbxAdwiTMubw4duNhA7EH6o2ZS
	8BwBd7jwweBAlBSwqf/a6z0yYj/h7ouULunjQfk3QX3KN7dNROw5vLRgKVcf2MTMeQ1WzKCYeJS8i
	K40ArP5ZfcW5KLGH74Lce20AQfWLcWw9gNWgPksIdcDVUQY4IaEVTX1BnhBpuLTYowsc=;
Message-ID: <edb52fc6-fc69-4670-a1bd-e3e960a6e408@xen.org>
Date: Tue, 20 Aug 2024 10:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: char: omap-uart: provide a default clock
 frequency
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Amneesh Singh <a-singh21@ti.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20240820082202.326644-1-a-singh21@ti.com>
 <a75c4202-1d66-45d0-be57-f29cacb6237c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a75c4202-1d66-45d0-be57-f29cacb6237c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/08/2024 10:00, Michal Orzel wrote:
> On 20/08/2024 10:22, Amneesh Singh wrote:
>>
>>
>> Quite a few TI K3 devices do not have clock-frequency specified in their
>> respective UART nodes. However hard-coding the frequency is not a
>> solution as the function clock input can differ between SoCs. So, use a
>> default frequency of 48MHz if the device tree does not specify one.
> I'd mention that this is same as Linux
> 
>>
>> Signed-off-by: Amneesh Singh <a-singh21@ti.com>
>> ---
>>   xen/drivers/char/omap-uart.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>> ---
>> v1: https://lore.kernel.org/all/20240719113313.145587-1-a-singh21@ti.com/T/
>>
>> v1 -> v2
>> - Ditch adding a dtuart option
>> - Use a default value instead
>>
>> This default is the same one as found in the 8250_omap driver of the
>> linux tree. Already tested with Xen.
>>
>> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
>> index 1079198..9d3d39c 100644
>> --- a/xen/drivers/char/omap-uart.c
>> +++ b/xen/drivers/char/omap-uart.c
>> @@ -48,6 +48,9 @@
>>   /* System configuration register */
>>   #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
>>
>> +/* default clock frequency in hz */
>> +#define UART_OMAP_DEFAULT_CLK_SPEED 48000000
> I think this should have U suffix to please MISRA 7.2
> 
>> +
>>   #define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
>>   #define omap_write(uart, off, val) writel(val, \
>>                                             (uart)->regs + ((off) << REG_SHIFT))
>> @@ -322,8 +325,9 @@ static int __init omap_uart_init(struct dt_device_node *dev,
>>       res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
>>       if ( !res )
>>       {
>> -        printk("omap-uart: Unable to retrieve the clock frequency\n");
>> -        return -EINVAL;
>> +        printk("omap-uart: Unable to retrieve the clock frequency, "
>> +               "defaulting to %uHz\n", UART_OMAP_DEFAULT_CLK_SPEED);
> Even though there is a comma, printk messages should not really be split. In such cases it's fine
> to exceed 80 chars limit. Or do:

In general, we allow to exceed the limit only for the message. If there 
are arguments then ...

>          printk("omap-uart: Clock frequency not specified, defaulting to %uHz\n",
>                 UART_OMAP_DEFAULT_CLK_SPEED);

... this is the preferred approach. I can do the update on commit if an 
updated commit message is provided.

Cheers,

-- 
Julien Grall


