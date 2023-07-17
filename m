Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA1756892
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564721.882366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQdv-0001TB-2t; Mon, 17 Jul 2023 16:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564721.882366; Mon, 17 Jul 2023 16:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQdu-0001QN-W1; Mon, 17 Jul 2023 16:00:10 +0000
Received: by outflank-mailman (input) for mailman id 564721;
 Mon, 17 Jul 2023 16:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuH4=DD=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qLQds-0001Q1-NT
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:00:08 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fea42a2c-24ba-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:00:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 37D2882866D1;
 Mon, 17 Jul 2023 11:00:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id v3nomEdnxO0X; Mon, 17 Jul 2023 11:00:03 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DBFAE8285AF8;
 Mon, 17 Jul 2023 11:00:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6RfTliW6wtWj; Mon, 17 Jul 2023 11:00:02 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 8283A8285AF0;
 Mon, 17 Jul 2023 11:00:02 -0500 (CDT)
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
X-Inumbo-ID: fea42a2c-24ba-11ee-b23a-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DBFAE8285AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689609602; bh=uTU8lD0bifweRhIffd7gxqa1k05FO2jioX6eJl/ozL8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=QCzWv1rRP6ySQK6tEtGzgjfhNUX/uAHiyyuBJjhtNYgPOE5dcNTWFEwLP+gyPYtH/
	 eveJf5pxv29d2hrNMIjBV5MKte6e38S2ThnOorZZ2q0tyH2G75LXbq5Nto0b4RLl+y
	 tTNnKC+LySIyrp4JxjeC2s4kcxr4OG/OW401A6rY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <dc64009d-53d5-6bd2-14ab-be2481523b0f@raptorengineering.com>
Date: Mon, 17 Jul 2023 11:00:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <8c79f498ffcb0837ff18640dbaf5b66f79186574.1688670018.git.sanastasio@raptorengineering.com>
 <7f6feb8b-29fe-7a7f-8965-20a12b4dfb25@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <7f6feb8b-29fe-7a7f-8965-20a12b4dfb25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/23 10:38 AM, Jan Beulich wrote:
> On 06.07.2023 21:04, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/include/asm/config.h
>> +++ b/xen/arch/ppc/include/asm/config.h
>> @@ -43,7 +43,7 @@
>>  
>>  #define SMP_CACHE_BYTES (1 << 6)
>>  
>> -#define STACK_ORDER 2
>> +#define STACK_ORDER 0
>>  #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
> 
> In which way is this related to the change at hand? Aren't you going to
> need to undo this rather sooner than later?

I noticed the stack order being too large when I moved the stack
declaration to .c per Andrew's recommendation for v2. Since we're using
64k pages, I don't see why the stack would need to be this big. A quick
look at ARM shows they have a stack order of 3, which would yield a
stack size of just 32k.

>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -1,30 +1,30 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>  
>> +#include <asm/asm-defns.h>
>> +
>>      .section .text.header, "ax", %progbits
>>  
>>  ENTRY(start)
>>      /*
>> -     * Depending on how we were booted, the CPU could be running in either
>> -     * Little Endian or Big Endian mode. The following trampoline from Linux
>> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
>> -     * endianness matches the assumption of the assembler (LE, in our case)
>> -     * or a branch to code that performs the endian switch in the other case.
>> +     * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
>>       */
>> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>> -    b . + 44          /* Skip trampoline if endian is good  */
>> -    .long 0xa600607d  /* mfmsr r11                          */
>> -    .long 0x01006b69  /* xori r11,r11,1                     */
>> -    .long 0x00004039  /* li r10,0                           */
>> -    .long 0x6401417d  /* mtmsrd r10,1                       */
>> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
>> -    .long 0xa602487d  /* mflr r10                           */
>> -    .long 0x14004a39  /* addi r10,r10,20                    */
>> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
>> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
>> -    .long 0x2400004c  /* rfid                               */
>> -
>> -    /* Now that the endianness is confirmed, continue */
>> -1:  b 1b
>> +    FIXUP_ENDIAN
>> +
>> +    /* set up the TOC pointer */
>> +    LOAD_IMM32(%r2, .TOC.)
>> +
>> +    /* set up the initial stack */
>> +    LOAD_IMM32(%r1, cpu0_boot_stack)
> 
> Wouldn't this (and perhaps also .TOC.) better be calculated in a
> PC-relative manner? Or is the plan to have Xen linked to an address
> below 4Gb?

As mentioned previously, I am planning to enable the PIC code model in
my next series in order to accommodate booting on the PowerNV firmware
type which has a different load address. That patch will change the
initial TOC load to a simulated PC-relative one (pre-POWER10 doesn't
have proper PC-relative loads/stores) and the rest to TOC-relative.

>> +    li %r11, 0
>> +    stdu %r11, -STACK_FRAME_OVERHEAD(%r1)
>> +
>> +    /* call the C entrypoint */
>> +    bl start_xen
>> +
>> +    /* should never return */
>> +    trap
>>  
>>      .size start, . - start
>>      .type start, %function
>> +
>> +    .section .init.data, "aw", @progbits
> 
> What's this good for when no data follows?

Good catch. With the stack no longer declared in head.S this is
unnecessary. Will remove in v3.

>> --- /dev/null
>> +++ b/xen/arch/ppc/setup.c
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/init.h>
>> +
>> +/* Xen stack for bringing up the first CPU. */
>> +unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
> 
> This yields the entire array as zero-initialized. At which point I
> don't see a need for the store in head.S.

Okay, fair enough. Given that the array is zero-initialized the stdu
could be replaced with an `addi %r1, %r1, -STACK_FRAME_OVERHEAD`, and
the load of zero to %r11 could be deferred to the second patch in this
series where it's used in the .bss clearing loop.

That said I don't really see the harm with keeping the standard
idiomatic `stdu` for the initial stack frame setup. Other than
performance, which isn't a concern here in early setup code.

>> +/* Macro to adjust thread priority for hardware multithreading */
>> +#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")
> 
> Nit: Style. Wants to be
> 
> #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )

Will fix in v3.

> Jan

Thanks,
Shawn

