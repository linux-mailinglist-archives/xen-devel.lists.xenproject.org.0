Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB22FFEEF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72588.130741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sPc-00010Q-LT; Fri, 22 Jan 2021 09:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72588.130741; Fri, 22 Jan 2021 09:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sPc-000101-HU; Fri, 22 Jan 2021 09:07:24 +0000
Received: by outflank-mailman (input) for mailman id 72588;
 Fri, 22 Jan 2021 09:07:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2sPb-0000zw-6F
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:07:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6761d3d-4168-4596-9f49-e31ef40de389;
 Fri, 22 Jan 2021 09:07:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 383CAABD6;
 Fri, 22 Jan 2021 09:07:21 +0000 (UTC)
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
X-Inumbo-ID: a6761d3d-4168-4596-9f49-e31ef40de389
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611306441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2/uPj0Sq7/TC6wNS5y1kiHpYiTkh4XQcx80YRKSXEY=;
	b=sf3kMhckwYBH+kTJ4SQSNlcPZstsUkMPUH//DyJxCBo9lxs2JeonLpf4zZhtaXTqfQmjeP
	wcXFL4Tw6Gdd36AwJt7JWgve28rZwrqDRYd+boaazYV5LL6cL+OrGflyEdcbw3sa+ywO6Y
	JIkv4HA4clz+rMjA0HfFaC+tkuIyAco=
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
 <16424ccd-372a-4090-e54e-b71689f33e4e@suse.com>
 <96e5720d-81ae-061e-d378-7cae6ad04415@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <558c9176-9804-41ec-6199-382f3d1aec02@suse.com>
Date: Fri, 22 Jan 2021 10:07:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <96e5720d-81ae-061e-d378-7cae6ad04415@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 19:47, Julien Grall wrote:
> On 21/01/2021 10:24, Jan Beulich wrote:
>> On 21.01.2021 10:56, Julien Grall wrote:
>>> On 21/01/2021 09:43, Jan Beulich wrote:
>>>> On 21.01.2021 10:30, Michal Orzel wrote:
>>>>> --- a/xen/include/asm-arm/early_printk.h
>>>>> +++ b/xen/include/asm-arm/early_printk.h
>>>>> @@ -10,6 +10,7 @@
>>>>>    #ifndef __ARM_EARLY_PRINTK_H__
>>>>>    #define __ARM_EARLY_PRINTK_H__
>>>>>    
>>>>> +#include <xen/page-size.h>
>>>>>    
>>>>>    #ifdef CONFIG_EARLY_PRINTK
>>>>
>>>> ... a respective Kconfig setting, i.e. it's not like I simply
>>>> failed to enable it.
>>>
>>> EARLY_PRINTK is defined in arch/arm/Kconfig.debug and is selected when
>>> you specify the UART to use.
>>>
>>> Assuming you are only build testing, you could add the following for
>>> testing EARLY_PRINTK:
>>>
>>> CONFIG_DEBUG=y
>>> CONFIG_EARLY_UART_CHOICE_8250=y
>>> CONFIG_EARLY_UART_8250=y
>>> CONFIG_EARLY_PRINTK=y
>>> CONFIG_EARLY_UART_BASE_ADDRESS=
>>> CONFIG_EARLY_UART_8250_REG_SHIFT=0
>>> CONFIG_EARLY_PRINTK_INC="debug-8250.inc"
>>
>> Ah yes, this works, thanks. The "optional" on the choice isn't
>> very helpful I suppose, because when going from an existing
>> .config one would neither find a setting presently turned off
>> in that .config, nor will there be a prompt.
> 
> Do you have a suggestion how the "choice" can appear in the .config?

Drop the "optional" attribute from it? Of course I ask without any
knowledge on why it may have been put there in the first place.

Jan

