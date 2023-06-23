Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6F73AE4D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 03:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554201.865257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCVZA-0006qy-OS; Fri, 23 Jun 2023 01:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554201.865257; Fri, 23 Jun 2023 01:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCVZA-0006od-Lh; Fri, 23 Jun 2023 01:26:24 +0000
Received: by outflank-mailman (input) for mailman id 554201;
 Fri, 23 Jun 2023 01:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNVC=CL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qCVZ9-0006oX-8g
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 01:26:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f44ad213-1164-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 03:26:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 24FA38285473;
 Thu, 22 Jun 2023 20:26:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LJmduH8V5JKp; Thu, 22 Jun 2023 20:26:16 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7E15B82854A7;
 Thu, 22 Jun 2023 20:26:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Vp3M3rTHHKTq; Thu, 22 Jun 2023 20:26:16 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 15DC38285473;
 Thu, 22 Jun 2023 20:26:16 -0500 (CDT)
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
X-Inumbo-ID: f44ad213-1164-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7E15B82854A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687483576; bh=01QYuXXfM11/GjbhNhAQNgLOfnacAB/js5Sf+VluA1w=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=QUm1BiMsoCt0XwZqj/aBTtk0yonp7asAzeQfdl1vnjwYGNFcsvUbIvxPcfDKOyPsF
	 U2i+CGCoojxbd+n/zFD5WhJoabhNTz5x+wZoLMcso4ZhahQkX5OSeARA+RyUXNEUnJ
	 ncvx9j+bkTqQcZxaPfvnav7PiN22uDEnrctI69vA=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
Date: Thu, 22 Jun 2023 20:26:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
 <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/23 5:49 PM, Andrew Cooper wrote:
> On 22/06/2023 9:57 pm, Shawn Anastasio wrote:
>> Update ppc64/head.S to set up an initial boot stack, zero the .bss
>> section, and jump to C.
>>
>> Also refactor the endian fixup trampoline into its own macro, since it
>> will need to be used in multiple places, including every time we make a
>> call into firmware (see next commit).
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Thankyou for making this change - it definitely simplifies things.

No problem.

> I've done a bit of reading around, and it's rather sad that things prior
> to Power10 don't have PC-relative addressing.  So the LOAD_IMM64()'s do
> look necessary for the stack and bss.  I guess that means we can't be
> sensibly be position independent in head.S?

Prior to the introduction of pcrel loads/stores in P10, PIC is achieved
using a Table of Contents (TOC) whose base address is kept in r2 and can
be used as a relative base to address other symbols. I don't have -fPIC
enabled in this series yet (it's in the series I was hoping to submit
after this one), so for now I'm just loading the addresses as immediates
directly.

> Also, why store 0 onto the stack ?

On the ELFv2 ABI which we're using here, sp+0 is reserved for the "back
chain" pointer which is used to store the address of the caller's stack
frame and is used to support backtraces.

At the top of the stack, we need to make sure the first back chain
pointer is zero to ensure that anything walking the stack via these
pointers eventually terminates.

>> +
>> +    /* clear .bss */
>> +    LOAD_IMM64(%r14, __bss_start)
>> +    LOAD_IMM64(%r15, __bss_end)
>> +1:
>> +    std %r11, 0(%r14)
>> +    addi %r14, %r14, 8
>> +    cmpld %r14, %r15
>> +    blt 1b
> 
> This loop is correct, except for the corner case of this patch alone,
> where the BSS is empty and this will write one word out-of-bounds.
> 
> For RISC-V, we put a temporary "char bss_tmp;" in setup.c, and I suggest
> you do the same here, deleting it at a later point when there's real
> data in the bss.

Good catch. I actually introduce a .bss variable in patch 2 of this
series, so perhaps it would make the most sense for me to move this loop
to that patch?

Also it might make sense to have an assert in the linker script checking
that sizeof(.bss) > 0, though past early bring-up an empty .bss is
probably a pretty unlikely scenario...

>> +
>> +    /* call the C entrypoint */
>> +    LOAD_IMM64(%r12, start_xen)
>> +    mtctr %r12
>> +    bctrl
> 
> Why is this a LOAD_IMM64(), and not just:
> 
>     b start_xen
> 
> ?  From the same reading around, PPC64 seems to have +/- 32M addressing
> for branches, and the entire x86 hypervisor (.init included) is within 3M.

Good question. You're right that here it's entirely unnecessary. Once we
enable -fPIC, though, the calling convention for functions changes a bit
and necessitates that in certain scenarios r12 contains the entrypoint
of the function being called.

For reference, the reason this is needed is because each function
contains a prologue that calculates the base address of its
aforementioned TOC as a relative offset from its entrypoint, and for
that to work, the entrypoint needs to be contained in r12.

There is a short path that can be taken if the TOC pointer in r2 is
already set up and the calling function is in the same module as the
function being called (and thus they are known to share a TOC), but for
head.S simply taking the long path is an easy way to ensure the callee
has a valid TOC pointer.

In any case, its inclusion in this patch before -fPIC is enabled was an
oversight on my part and I'll change it to a `bl start_xen`.

>> +
>> +    /* should never return */
>> +    trap
>>  
>>      .size start, . - start
>>      .type start, %function
>> +
>> +    .section .init.data, "aw", @progbits
>> +
>> +    /* Early init stack */
>> +    .p2align 4
>> +cpu0_boot_stack_bottom:
>> +    .space STACK_SIZE
>> +cpu0_boot_stack:
>> +    .space STACK_FRAME_OVERHEAD
> 
> Why the extra space beyond the stack?

It's space for the aforementioned back chain pointer as well as a
few other things that callees are allowed to store in their caller's
stack frame. For example, routines are allowed to store the return
address from their caller at sp+16 (unlike x86, our "call" instruction
doesn't do that for you).

The ELFv2 specification contains a nice diagram of the stack frame on
page 31 (figure 2.18, section 2.2.2.1):
https://wiki.raptorcs.com/w/images/7/70/Leabi-20170510.pdf

> Also, I'd put cpu0_boot_stack in C, and just LOAD_IMM64(x,
> cpu0_boot_stack + STACK_SIZE)

Sure, I can do that.

>> diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
>> new file mode 100644
>> index 0000000000..4d1b72fa23
>> --- /dev/null
>> +++ b/xen/arch/ppc/setup.c
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/init.h>
>> +
>> +void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>> +                               unsigned long r5, unsigned long r6,
>> +                               unsigned long r7)
>> +{
>> +    for ( ;; )
>> +        /* Set current hardware thread to very low priority */
>> +        asm volatile("or %r31, %r31, %r31");
> 
> Is there something magic about the OR instruction, or something magic
> about %r31?

Using the OR instruction with all three operands equal is of course a
no-op, but when using certain registers it can have a separate magic
side effect.

`or r31,31,31` is one such form that sets the Program Priority Register
to "very low" priority. Of course here where we don't have SMP going
there's not much point in using this over the standard side effect-less
no-op (`or r0,r0,r0` or just `nop`).

For a table of these magic OR forms, you can see page 836 of the Power
ISA 3.0B:
https://wiki.raptorcs.com/w/images/c/cb/PowerISA_public.v3.0B.pdf

> ~Andrew

Thanks,
Shawn


