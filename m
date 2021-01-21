Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3092FE6D6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 10:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71974.129304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WhZ-0003RS-Fo; Thu, 21 Jan 2021 09:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71974.129304; Thu, 21 Jan 2021 09:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WhZ-0003R3-Cb; Thu, 21 Jan 2021 09:56:29 +0000
Received: by outflank-mailman (input) for mailman id 71974;
 Thu, 21 Jan 2021 09:56:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2WhX-0003Qy-Hp
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:56:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2WhX-0005Qu-2F; Thu, 21 Jan 2021 09:56:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2WhW-0007tA-QD; Thu, 21 Jan 2021 09:56:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=V2kLioFOpJMU7SjXAbbjIWAOMWS4gwe2Vo/e4PXm1Ls=; b=vY2uQEp2iEGvudvx3XTWi11b3o
	BigpyYQGeKaVTudpUoWPSIQCZc0X6FvBLecfi+nwJI/Pi+BAEs2KDBMCk2Mw7TTLMKJbODVhk+JG3
	ce7dczqMgwqGhYWeCr70+tXgCEbOy6j5eXGp0lEXhqlWf1HH46hTQrvBzSfH5NjfBWx8=;
Subject: Re: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, xen-devel@lists.xenproject.org
References: <20210121093041.21537-1-michal.orzel@arm.com>
 <6f317514-110a-9c5c-8732-60c0a1f58d31@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <44567b70-9464-9a4a-5cc9-28505a512c99@xen.org>
Date: Thu, 21 Jan 2021 09:56:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6f317514-110a-9c5c-8732-60c0a1f58d31@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/01/2021 09:43, Jan Beulich wrote:
> On 21.01.2021 10:30, Michal Orzel wrote:
>> Fix compilation error when enabling early printk, introduced
>> by commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063:
>> ```
>> debug.S: Assembler messages:
>> debug.S:31: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
>> debug.S:38: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
>> ```
>>
>> The fix is to include header <xen/page-size.h> which now contains
>> definitions for page/size/mask etc.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> I'm sorry for the breakage, but I wonder how I should have noticed
> the issue. In all the Arm .config-s I'm routinely building I can't
> even see ...
> 
>> --- a/xen/include/asm-arm/early_printk.h
>> +++ b/xen/include/asm-arm/early_printk.h
>> @@ -10,6 +10,7 @@
>>   #ifndef __ARM_EARLY_PRINTK_H__
>>   #define __ARM_EARLY_PRINTK_H__
>>   
>> +#include <xen/page-size.h>
>>   
>>   #ifdef CONFIG_EARLY_PRINTK
> 
> ... a respective Kconfig setting, i.e. it's not like I simply
> failed to enable it.

EARLY_PRINTK is defined in arch/arm/Kconfig.debug and is selected when 
you specify the UART to use.

Assuming you are only build testing, you could add the following for 
testing EARLY_PRINTK:

CONFIG_DEBUG=y
CONFIG_EARLY_UART_CHOICE_8250=y
CONFIG_EARLY_UART_8250=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_UART_BASE_ADDRESS=
CONFIG_EARLY_UART_8250_REG_SHIFT=0
CONFIG_EARLY_PRINTK_INC="debug-8250.inc"

Cheers,

-- 
Julien Grall

