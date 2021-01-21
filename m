Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795212FE6C0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 10:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71967.129292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WdV-0003DW-VE; Thu, 21 Jan 2021 09:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71967.129292; Thu, 21 Jan 2021 09:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WdV-0003D7-Rc; Thu, 21 Jan 2021 09:52:17 +0000
Received: by outflank-mailman (input) for mailman id 71967;
 Thu, 21 Jan 2021 09:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5uv=GY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1l2WdU-0003Cz-FJ
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:52:16 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 87b05e58-bb1d-4d2a-8d26-a72d13a23f22;
 Thu, 21 Jan 2021 09:52:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F242114FF;
 Thu, 21 Jan 2021 01:52:14 -0800 (PST)
Received: from [10.57.6.162] (unknown [10.57.6.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7545E3F85F;
 Thu, 21 Jan 2021 01:52:13 -0800 (PST)
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
X-Inumbo-ID: 87b05e58-bb1d-4d2a-8d26-a72d13a23f22
Subject: Re: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com, wei.chen@arm.com, xen-devel@lists.xenproject.org
References: <20210121093041.21537-1-michal.orzel@arm.com>
 <6f317514-110a-9c5c-8732-60c0a1f58d31@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <e50fe7a0-f30e-d059-3a5a-730b039f4606@arm.com>
Date: Thu, 21 Jan 2021 10:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6f317514-110a-9c5c-8732-60c0a1f58d31@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21.01.2021 10:43, Jan Beulich wrote:
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
This is not your fault. Nowadays it is becoming harder and harder to try all the possible combinations.
>> --- a/xen/include/asm-arm/early_printk.h
>> +++ b/xen/include/asm-arm/early_printk.h
>> @@ -10,6 +10,7 @@
>>  #ifndef __ARM_EARLY_PRINTK_H__
>>  #define __ARM_EARLY_PRINTK_H__
>>  
>> +#include <xen/page-size.h>
>>  
>>  #ifdef CONFIG_EARLY_PRINTK
> 
> ... a respective Kconfig setting, i.e. it's not like I simply
> failed to enable it.
> 
> Jan
> 

Cheers,
Michal

