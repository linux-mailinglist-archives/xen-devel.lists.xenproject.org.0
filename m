Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01333D760
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98370.186594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBbY-0006Dq-4O; Tue, 16 Mar 2021 15:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98370.186594; Tue, 16 Mar 2021 15:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBbY-0006DR-15; Tue, 16 Mar 2021 15:27:32 +0000
Received: by outflank-mailman (input) for mailman id 98370;
 Tue, 16 Mar 2021 15:27:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMBbW-0006DM-KT
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:27:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBbV-0005ix-0Y; Tue, 16 Mar 2021 15:27:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMBbU-0005MR-N4; Tue, 16 Mar 2021 15:27:28 +0000
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
	bh=2f+DffYtfP586Gt7KcILZOW7qRBjCxkX8gbjH0PBWPc=; b=TUhonIeLYssYje98Bq9pMC6+90
	Bef5IY/HAAZVc/fISttsRP5h9HcfiR+8Ik2fv4VwaG2NBXLdfFSvIFiSmA9EOGMxbcvlQjoJKw0GM
	ugBewRJvKnQX9cFmPGPEd8XAiBl8fC7wetkzD30araa9Tdd1Xa0Q9r9JayzrtIn0xjlM=;
Subject: Re: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210313160611.18665-1-julien@xen.org>
 <D7999820-4FE4-4338-A93E-8641AF29F56C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <119bdbc0-5400-87eb-e6ad-87b59ec4e07c@xen.org>
Date: Tue, 16 Mar 2021 15:27:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <D7999820-4FE4-4338-A93E-8641AF29F56C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/03/2021 13:32, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> Last year, Arm released a whitepaper about a new category of speculation.
>> (see [1] and [2]). In short, a processor may be able to speculate past
>> some of the unconditional control flow instructions (e.g eret, smc, br).
>>
>> In some of the cases, the registers will contain values controlled by
>> the guest. While there is no known gadget afterwards, we still want to
>> prevent any leakage in the future.
>>
>> The mitigation is planned in two parts:
>>    1) Arm provided patches for both GCC and LLVM to add speculation barrier
>>    and remove problematic code sequence.
>>    2) Inspection of assembly code and call to higher level (e.g smc in our case).
>>
>> I still haven't looked at 1) and how to mitigate properly Arm32 (see
>> patch #1) and SMC call. So this issue is not fully addressed.
>>
>> Note that the ERET instruction was already addressed as part of XSA-312.
> 
> On my tests, this serie is breaking the arm64 build:
> | aarch64-poky-linux-ld --sysroot=/home/bermar01/Development/xen-dev/build/profile-fvp-base.prj/tmp/work/fvp_base-poky-linux/xen/4.15+git1-r0/recipe-sysroot         -EL  --fix-cortex-a53-843419 --fix-cortex-a53-843419 -r -o built_in.o memcpy.o memcmp.o memmove.o memset.o memchr.o clear_page.o bitops.o find_next_bit.o strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o

I can't see any build failure with the following GCC:

42sh> aarch64-linux-gnu-gcc
aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AFAICT, there is also no compilation issue reported by gitlab:

https://gitlab.com/xen-project/patchew/xen/-/pipelines/269989894

What's the version of your compiler? Do you have steps to reproduce your 
setup?

> | arm64/head.S: Assembler messages:
> | arm64/head.S:305: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Boot CPU booting -\r\n")'

This is strange, the code should use RODATA_STR() but here it is in 
lower case. Can you check in your tree whether there some instance of 
the lower case version?

If not, this may just be GAS printing in lower cases.

> | arm64/head.S:331: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Ready -\r\n")'
> | arm64/head.S:365: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- CPU ")'
> | make[6]: Leaving directory '/home/bermar01/Development/xen-dev/build/profile-fvp-base.prj/tmp/work/fvp_base-poky-linux/xen/4.15+git1-r0/local-xen/xen/xen/arch/arm/arm64/lib'
> | arm64/head.S:367: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, " booting -\r\n")'
> | arm64/head.S:398: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Ready -\r\n")'
> | arm64/head.S:412: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Current EL ")'
> | arm64/head.S:415: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, " -\r\n")'
> | arm64/head.S:424: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Xen must be entered in NS EL2 mode -\r\n")'
> | arm64/head.S:425: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Please update the bootloader -\r\n")'
> | arm64/head.S:441: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Zero BSS -\r\n")'
> | arm64/head.S:459: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Initialize CPU -\r\n")'
> | arm64/head.S:654: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Unable to build boot page tables - virt and phys addresses clash. -\r\n")'
> | arm64/head.S:666: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Turning on paging -\r\n")'
> | arm64/head.S:800: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- Boot failed -\r\n")'
> | arm64/head.S:848: Error: unknown mnemonic `rodata_str' -- `rodata_str(98, "- UART enabled -\r\n")'
> | {standard input}: Error: local label `"98" (instance number 1 of a fb label)' is not defined
> | /home/bermar01/Development/xen-dev/build/profile-fvp-base.prj/tmp/work/fvp_base-poky-linux/xen/4.15+git1-r0/local-xen/xen/xen/Rules.mk:204: recipe for target 'arm64/head.o' failed
> 
> This was done adding your 2 patches on top of current staging.
> 
> Cheers
> Bertrand
> 
>>
>> Cheers,
>>
>> [1] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability
>> [2] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/downloads/straight-line-speculation
>>
>> Julien Grall (2):
>>   xen/arm: Include asm/asm-offsets.h and asm/macros.h on every assembly
>>     files
>>   xen/arm64: Place a speculation barrier following an ret instruction
>>
>> xen/arch/arm/Makefile                |  2 +-
>> xen/arch/arm/arm32/entry.S           |  2 +-
>> xen/arch/arm/arm32/head.S            |  1 -
>> xen/arch/arm/arm32/lib/lib1funcs.S   |  1 +
>> xen/arch/arm/arm32/proc-v7.S         |  1 -
>> xen/arch/arm/arm64/debug-cadence.inc |  1 -
>> xen/arch/arm/arm64/debug-pl011.inc   |  2 --
>> xen/arch/arm/arm64/entry.S           |  2 --
>> xen/arch/arm/arm64/head.S            |  2 --
>> xen/arch/arm/arm64/smc.S             |  3 ---
>> xen/include/asm-arm/arm64/macros.h   |  6 ++++++
>> xen/include/asm-arm/config.h         |  6 ++++++
>> xen/include/asm-arm/macros.h         | 18 +++++++++---------
>> 13 files changed, 24 insertions(+), 23 deletions(-)
>>
>> -- 
>> 2.17.1
>>
> 

-- 
Julien Grall

