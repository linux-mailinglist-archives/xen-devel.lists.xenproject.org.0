Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D88A95B308
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 12:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781728.1191221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5CX-0007Kw-HG; Thu, 22 Aug 2024 10:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781728.1191221; Thu, 22 Aug 2024 10:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5CX-0007Iw-EA; Thu, 22 Aug 2024 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 781728;
 Thu, 22 Aug 2024 10:37:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sh5CV-0007Ik-Ez
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 10:37:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh5CT-0002MP-Sl; Thu, 22 Aug 2024 10:37:53 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh5CT-0003ti-Nq; Thu, 22 Aug 2024 10:37:53 +0000
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
	bh=oB+TY2qy4gaBrJVpY0QdAN0PNrYv98MZO8tRpIJFfrg=; b=GSxFbRwp3ZyJkZbeq/UT1HPHqs
	/94PN7svn2RcAJi4K63Az885tt9CuMnih2w2Zo+B8d3RZuhLhRWlIcSBqGGM8Q6YrgwrL7pDNCSur
	shXLOKlurfONV7ooV2vnRjoQXuGFSJichuXdPq3gzeqNxezYPUFlbVfVlYRDQt7z1Lnc=;
Message-ID: <8aba515f-4f14-4a5f-bd15-4a20717978ac@xen.org>
Date: Thu, 22 Aug 2024 11:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v2] drivers: char: omap-uart: provide a
 default clock frequency
Content-Language: en-GB
To: Amneesh Singh <a-singh21@ti.com>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <20240820082202.326644-1-a-singh21@ti.com>
 <a75c4202-1d66-45d0-be57-f29cacb6237c@amd.com>
 <edb52fc6-fc69-4670-a1bd-e3e960a6e408@xen.org>
 <qu7setyrwkh7clo7dxb5iolx2mwcpkd4n45gjthxravmw3gyeo@ged7k7khka54>
From: Julien Grall <julien@xen.org>
In-Reply-To: <qu7setyrwkh7clo7dxb5iolx2mwcpkd4n45gjthxravmw3gyeo@ged7k7khka54>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/08/2024 06:35, Amneesh Singh wrote:
> Hello,

Hi Amneesh,

> On 10:03-20240820, Julien Grall wrote:
>> Hi,
>>
>> On 20/08/2024 10:00, Michal Orzel wrote:
>>> On 20/08/2024 10:22, Amneesh Singh wrote:
>>>>
>>>>
>>>> Quite a few TI K3 devices do not have clock-frequency specified in their
>>>> respective UART nodes. However hard-coding the frequency is not a
>>>> solution as the function clock input can differ between SoCs. So, use a
>>>> default frequency of 48MHz if the device tree does not specify one.
>>> I'd mention that this is same as Linux
>>>
>>>>
>>>> Signed-off-by: Amneesh Singh <a-singh21@ti.com>
>>>> ---
>>>>    xen/drivers/char/omap-uart.c | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>> ---
>>>> v1: https://lore.kernel.org/all/20240719113313.145587-1-a-singh21@ti.com/T/
>>>>
>>>> v1 -> v2
>>>> - Ditch adding a dtuart option
>>>> - Use a default value instead
>>>>
>>>> This default is the same one as found in the 8250_omap driver of the
>>>> linux tree. Already tested with Xen.
>>>>
>>>> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
>>>> index 1079198..9d3d39c 100644
>>>> --- a/xen/drivers/char/omap-uart.c
>>>> +++ b/xen/drivers/char/omap-uart.c
>>>> @@ -48,6 +48,9 @@
>>>>    /* System configuration register */
>>>>    #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
>>>>
>>>> +/* default clock frequency in hz */
>>>> +#define UART_OMAP_DEFAULT_CLK_SPEED 48000000
>>> I think this should have U suffix to please MISRA 7.2
> 
> Can I count on you to add this unsigned suffix as well? Thanks.
> 
>>>
>>>> +
>>>>    #define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
>>>>    #define omap_write(uart, off, val) writel(val, \
>>>>                                              (uart)->regs + ((off) << REG_SHIFT))
>>>> @@ -322,8 +325,9 @@ static int __init omap_uart_init(struct dt_device_node *dev,
>>>>        res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
>>>>        if ( !res )
>>>>        {
>>>> -        printk("omap-uart: Unable to retrieve the clock frequency\n");
>>>> -        return -EINVAL;
>>>> +        printk("omap-uart: Unable to retrieve the clock frequency, "
>>>> +               "defaulting to %uHz\n", UART_OMAP_DEFAULT_CLK_SPEED);
>>> Even though there is a comma, printk messages should not really be split. In such cases it's fine
>>> to exceed 80 chars limit. Or do:
>>
>> In general, we allow to exceed the limit only for the message. If there
>> are arguments then ...
>>
>>>           printk("omap-uart: Clock frequency not specified, defaulting to %uHz\n",
>>>                  UART_OMAP_DEFAULT_CLK_SPEED);
>>
>> ... this is the preferred approach. I can do the update on commit if an
>> updated commit message is provided.
> 
> Please do, thanks. You can use this as the commit message:
> 
> [quote]
> 
> Quite a few TI K3 devices do not have clock-frequency specified in their
> respective UART nodes. However hard-coding the frequency is not a
> solution as the function clock input can differ between SoCs. So, use a
> default frequency of 48MHz, which is the same as the linux default (see
> 8250_omap.c), if the device tree does not specify it.
> 
> [/quote]

Thanks for the updated commit message. I have updated it while commiting 
the patch.

Cheers,

-- 
Julien Grall


