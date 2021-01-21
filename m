Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244DB2FE779
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 11:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71986.129340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2X8q-0006iS-8M; Thu, 21 Jan 2021 10:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71986.129340; Thu, 21 Jan 2021 10:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2X8q-0006i3-5G; Thu, 21 Jan 2021 10:24:40 +0000
Received: by outflank-mailman (input) for mailman id 71986;
 Thu, 21 Jan 2021 10:24:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2X8o-0006hx-I7
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 10:24:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d6c82d-e383-4bf1-af02-116c8f871fd0;
 Thu, 21 Jan 2021 10:24:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB6F0ACF5;
 Thu, 21 Jan 2021 10:24:36 +0000 (UTC)
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
X-Inumbo-ID: b4d6c82d-e383-4bf1-af02-116c8f871fd0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611224677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vu+iXfsuWKpVAUEz5mWFjx3DNsgyjuuXsQyj+exaVz0=;
	b=lvEHJk4mBZNIDqXLaE0d+2aFZZUQhNt/gI1Bcnud1+Q+RwlZSSq4GbEEYxHQh/Xw1e6YPU
	6qV4Ivro1d6UkDs1Fx3i7VT7+v+lE+V9rdqzdAJoCmiOTZrf3yVOz+GV7lJqOZYnQ3/Ebh
	cG3SNuL682SOiZf2PR1CJFtRQQ+lgqE=
Subject: Re: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@arm.com>
References: <20210121093041.21537-1-michal.orzel@arm.com>
 <6f317514-110a-9c5c-8732-60c0a1f58d31@suse.com>
 <44567b70-9464-9a4a-5cc9-28505a512c99@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16424ccd-372a-4090-e54e-b71689f33e4e@suse.com>
Date: Thu, 21 Jan 2021 11:24:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <44567b70-9464-9a4a-5cc9-28505a512c99@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 10:56, Julien Grall wrote:
> Hi Jan,
> 
> On 21/01/2021 09:43, Jan Beulich wrote:
>> On 21.01.2021 10:30, Michal Orzel wrote:
>>> Fix compilation error when enabling early printk, introduced
>>> by commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063:
>>> ```
>>> debug.S: Assembler messages:
>>> debug.S:31: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
>>> debug.S:38: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
>>> ```
>>>
>>> The fix is to include header <xen/page-size.h> which now contains
>>> definitions for page/size/mask etc.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>
>> I'm sorry for the breakage, but I wonder how I should have noticed
>> the issue. In all the Arm .config-s I'm routinely building I can't
>> even see ...
>>
>>> --- a/xen/include/asm-arm/early_printk.h
>>> +++ b/xen/include/asm-arm/early_printk.h
>>> @@ -10,6 +10,7 @@
>>>   #ifndef __ARM_EARLY_PRINTK_H__
>>>   #define __ARM_EARLY_PRINTK_H__
>>>   
>>> +#include <xen/page-size.h>
>>>   
>>>   #ifdef CONFIG_EARLY_PRINTK
>>
>> ... a respective Kconfig setting, i.e. it's not like I simply
>> failed to enable it.
> 
> EARLY_PRINTK is defined in arch/arm/Kconfig.debug and is selected when 
> you specify the UART to use.
> 
> Assuming you are only build testing, you could add the following for 
> testing EARLY_PRINTK:
> 
> CONFIG_DEBUG=y
> CONFIG_EARLY_UART_CHOICE_8250=y
> CONFIG_EARLY_UART_8250=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_EARLY_UART_BASE_ADDRESS=
> CONFIG_EARLY_UART_8250_REG_SHIFT=0
> CONFIG_EARLY_PRINTK_INC="debug-8250.inc"

Ah yes, this works, thanks. The "optional" on the choice isn't
very helpful I suppose, because when going from an existing
.config one would neither find a setting presently turned off
in that .config, nor will there be a prompt.

I suppose any page-aligned base address is fine to use for my
build-testing-only purposes?

Jan

