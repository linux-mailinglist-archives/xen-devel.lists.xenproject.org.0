Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5B6C4A13
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513389.794290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexMd-0004Oa-Iq; Wed, 22 Mar 2023 12:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513389.794290; Wed, 22 Mar 2023 12:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexMd-0004ME-G6; Wed, 22 Mar 2023 12:14:47 +0000
Received: by outflank-mailman (input) for mailman id 513389;
 Wed, 22 Mar 2023 12:14:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pexMc-0004M8-K9
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:14:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pexMc-0004Tj-2u; Wed, 22 Mar 2023 12:14:46 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pexMb-0005GC-Sg; Wed, 22 Mar 2023 12:14:46 +0000
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
	bh=WhP23oe7p1Ch1N0CUJmu0YVJI/ua8v0jij5yzdcx3Qc=; b=qxwL0cOqKI5+iIXStPojsyDJM0
	9IrfFW5ENvSA9XGfPPmXBIHkBDKmkcw4/yTyVUGbdUOq9TpgadSo62Yu7npUqhYfgn2GIbGh+1gcl
	wNy8A5Uk1uHPMDbLZa4faw88U2b0Lb/pHlIVha8HwLw/Mz/ynCKSvVnRS15zXPibEqVo=;
Message-ID: <fb5632f9-d749-4396-930e-9f2a601720d8@xen.org>
Date: Wed, 22 Mar 2023 12:14:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce trap_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
 <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
 <520d64f0b6cd283416aa4fb7b9baa5f83454c4a8.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <520d64f0b6cd283416aa4fb7b9baa5f83454c4a8.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/03/2023 11:33, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> 
> On Tue, 2023-03-21 at 17:42 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 16/03/2023 14:39, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>> Changes in V5:
>>>     - Nothing changed
>>> ---
>>> Changes in V4:
>>>     - Nothing changed
>>> ---
>>> Changes in V3:
>>>     - Nothing changed
>>> ---
>>> Changes in V2:
>>>     - Rename setup_trap_handler() to trap_init().
>>>     - Add Reviewed-by to the commit message.
>>> ---
>>>    xen/arch/riscv/include/asm/traps.h | 1 +
>>>    xen/arch/riscv/setup.c             | 5 +++++
>>>    xen/arch/riscv/traps.c             | 7 +++++++
>>>    3 files changed, 13 insertions(+)
>>>
>>> diff --git a/xen/arch/riscv/include/asm/traps.h
>>> b/xen/arch/riscv/include/asm/traps.h
>>> index f3fb6b25d1..f1879294ef 100644
>>> --- a/xen/arch/riscv/include/asm/traps.h
>>> +++ b/xen/arch/riscv/include/asm/traps.h
>>> @@ -7,6 +7,7 @@
>>>    
>>>    void do_trap(struct cpu_user_regs *cpu_regs);
>>>    void handle_trap(void);
>>> +void trap_init(void);
>>>    
>>>    #endif /* __ASSEMBLY__ */
>>>    
>>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>>> index 36556eb779..b44d105b5f 100644
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -3,7 +3,9 @@
>>>    #include <xen/kernel.h>
>>>    
>>>    #include <asm/boot-info.h>
>>> +#include <asm/csr.h>
>>>    #include <asm/early_printk.h>
>>> +#include <asm/traps.h>
>>>    
>>>    /* Xen stack for bringing up the first CPU. */
>>>    unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>>> @@ -32,7 +34,10 @@ void __init noreturn start_xen(unsigned long
>>> bootcpu_id,
>>>    
>>>        fill_boot_info();
>>>    
>>> +    trap_init();
>>> +
>>>        early_printk("All set up\n");
>>> +
>>>        for ( ;; )
>>>            asm volatile ("wfi");
>>>    
>>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>>> index 8a1529e0c5..581f34efbc 100644
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -13,6 +13,13 @@
>>>    #include <asm/processor.h>
>>>    #include <asm/traps.h>
>>>    
>>> +void trap_init(void)
>>> +{
>>> +    unsigned long addr = (unsigned long)&handle_trap;
>>
>> It is not super clear to me whether this is going to store the
>> virtual
>> or physical address.
> Actually it is going to store both the virtual and physical address.
> Depending on if MMU is enabled or not.

I think some comment in the code would be really good because this is...

>>
>> Depending on the answer, the next would be whether the value would
>> still
>> be valid after the MMU is turned on?
> It would still be valid because for addr will be generated PC-relative
> address.

... not clear to me what would guarantee that Xen is compiled with 
-noPIE. Is the cmodel?

A suggestion for the top of the function:

"Initialize the trap handling. This is called twice (before and after 
the MMU)."

And for on top of 'addr', I would add:

"When the MMU is off, this will be a physical address otherwise it would 
be a virtual address. This is guarantee because [fill the blank]".

Cheers,

-- 
Julien Grall

