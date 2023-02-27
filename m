Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADA6A4875
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 18:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502850.774865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWhZF-0004oK-O7; Mon, 27 Feb 2023 17:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502850.774865; Mon, 27 Feb 2023 17:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWhZF-0004lj-L7; Mon, 27 Feb 2023 17:45:41 +0000
Received: by outflank-mailman (input) for mailman id 502850;
 Mon, 27 Feb 2023 17:45:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWhZE-0004ld-MY
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 17:45:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWhZD-0007Bw-Rp; Mon, 27 Feb 2023 17:45:39 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWhZD-0005tx-JL; Mon, 27 Feb 2023 17:45:39 +0000
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
	bh=ccwLrDinQxsJbM8K67Ij8jF2IqygExBdiA3E33b/zyA=; b=yxOGkmVckt6juhLN9GCGKIEQYW
	TMIBsuWNDw6HyQMJjLNLTi6SYl+lJA9IN9IsHvvM59kmrDT5raqO936OH6wBImO+N6UIUkdmWxX9v
	jsyMtpykZwWjYPY1Qwyv/0NAO4aE+zm78tz+hI8X67J8UeW/DglC8lYGdxw5OjFIAMyQ=;
Message-ID: <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
Date: Mon, 27 Feb 2023 17:45:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
 <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/02/2023 17:17, Oleksii wrote:
> On Sat, 2023-02-25 at 18:05 +0000, Julien Grall wrote:
>> Hi,
>>
>> On 24/02/2023 15:06, Oleksii Kurochko wrote:
>>> Calculate load and linker linker image addresses and
>>> setup initial pagetables.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>    xen/arch/riscv/setup.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>>> index b7cd438a1d..f69bc278bb 100644
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -1,9 +1,11 @@
>>>    #include <xen/bug.h>
>>>    #include <xen/compile.h>
>>>    #include <xen/init.h>
>>> +#include <xen/kernel.h>
>>>    
>>>    #include <asm/csr.h>
>>>    #include <asm/early_printk.h>
>>> +#include <asm/mm.h>
>>>    #include <asm/traps.h>
>>>    
>>>    /* Xen stack for bringing up the first CPU. */
>>> @@ -43,6 +45,11 @@ static void __init disable_fpu(void)
>>>    
>>>    void __init noreturn start_xen(void)
>>>    {
>>> +    unsigned long load_start    = (unsigned long)start;
>>> +    unsigned long load_end      = load_start + (unsigned
>>> long)(_end - _start);
>>
>> I am a bit puzzled, on top of load_addr() and linker_addr(), you
>> wrote
>> it can't use global variable/function. But here... you are using
>> them.
>> So how is this different?
> I don't use load_addr() and linker_addr() macros here.

I understand that. But my comment was related to:

/*
  * WARNING: load_addr() and linker_addr() are to be called only when 
the MMU is
  * disabled and only when executed by the primary CPU.  They cannot 
refer to
  * any global variable or functions.
  */

_start and _end are global variables. So why can you use them here but 
not there?

If you could use them in load_addr() then you could simplify a lot your 
logic.

>>
>>> +    unsigned long linker_start  = (unsigned long)_start;
>>> +    unsigned long linker_end    = (unsigned long)_end;
>>
>> I am a bit confused with how you define the start/end for both the
>> linker and load. In one you use _start and the other _end.
>>
>> Both are fixed at compile time, so I assume the values will be a
>> linked
>> address rather than the load address. So how is this meant to how?
>>
> _start, _end - it is label from linker script so I use them to define
> linker_start and linker_end addresses.
> 
> load_start is defined as an address of start() function from head.S and
> load_end is the load_start + the size  (_end - _start)

I think you misunderstood my comment. I understand what the variables 
are for. But I don't understand the computation because Xen could be 
loaded at a different address than the runtime address.

> 
>> Furthermore, I would expect linker_start and load_start to point to
>> the
>> same symbol (the only different is one store the virtual address
>> whereas
>> the other the physical address). But here you are technically using
>> two
>> different symbol. Can you explain why?
> It is used to make identity mapping for the range [load_addr, load_end]
> and [linker_addr, linker_end]. It was done so because in Bobby's
> patches in the linker script XEN_VIRT_START is defined as
> _AT(vaddr_t,0x00200000) but bootloader loads Xen at 0x80200000 and so
> in this case loadr_addr != linker_addr.
> But I have changed XEN_VIRT_START to 0x8020...00 so they are equal now.

So this will be broken as soon as this code will be tested on an 
hardware where there is no RAM at 0x8020...00. I would strongly 
recommend for you to test your code with XEN_VIRT_START != load address.

>>
>>> +
>>>        /*
>>>         * The following things are passed by bootloader:
>>>         *   a0 -> hart_id
>>> @@ -65,6 +72,10 @@ void __init noreturn start_xen(void)
>>>    
>>>        test_macros_from_bug_h();
>>>    
>>> +    setup_initial_pagetables(load_start, load_end, linker_start,
>>> linker_end);
>>
>> Shouldn't this happen earlier in start_xen()?
> It can. If to be honest I don't know if it should. I added at the end
> only because it was the last thing I worked on...

I think we should enable the MMU and switch to the runtime mapping as 
early as possible.

Cheers,

-- 
Julien Grall

