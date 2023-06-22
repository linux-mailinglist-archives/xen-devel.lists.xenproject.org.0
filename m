Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F573A649
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553849.864653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCNP1-0007XA-GQ; Thu, 22 Jun 2023 16:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553849.864653; Thu, 22 Jun 2023 16:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCNP1-0007Uy-Dh; Thu, 22 Jun 2023 16:43:23 +0000
Received: by outflank-mailman (input) for mailman id 553849;
 Thu, 22 Jun 2023 16:43:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qCNP0-0007Uq-0Y
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:43:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCNOz-0005mn-GP; Thu, 22 Jun 2023 16:43:21 +0000
Received: from [54.239.6.188] (helo=[192.168.27.222])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCNOz-0007l3-Ae; Thu, 22 Jun 2023 16:43:21 +0000
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
	bh=Ds+RxaLq3C0aj4REQfgLTjzxULMaSYxz5NwTspFdv8k=; b=Qfuik5sq2S/wApuhk2wqP8w6ox
	yLAf2O4AYJP9uamcGa9h6+CUVdLYkyiJpYChd5Z5MK0s/36BF/Q1TAD7hD+GOQPAZGsgYDROcodLp
	PruVGK3z4fG79wdIj45Zg72mB5Y30j1DXo/ARkftrwuqJN8VvbSMzzw2DSK8+M2QpcMo=;
Message-ID: <e4f061df-2479-3441-a811-5379ea5ae52b@xen.org>
Date: Thu, 22 Jun 2023 17:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <4fc1fcee-e210-fe16-f762-3f23700d51b9@xen.org>
 <eb810a53-ee10-d8a1-b983-ee8dcf02f07a@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eb810a53-ee10-d8a1-b983-ee8dcf02f07a@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/06/2023 17:05, Shawn Anastasio wrote:
> On 6/21/23 3:48 PM, Julien Grall wrote:
>> On 21/06/2023 17:59, Shawn Anastasio wrote:
>>> diff --git a/xen/arch/ppc/boot-of.c b/xen/arch/ppc/boot-of.c
>>> new file mode 100644
>>> index 0000000000..1ceeaf1250
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/boot-of.c
>>> @@ -0,0 +1,116 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program; if not, write to the Free Software
>>> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
>>> 02110-1301, USA.
>>
>> As you already have the SPDX license, the full license should be dropped.
> 
> To clarify, you're suggesting that I remove the license text but keep
> the copyright lines below? I wouldn't feel comfortable removing the
> latter since this is derived from code that wasn't written by me.

I am only suggesting to remove the license text. The copyright are fine 
to keep.

Note that in Xen, we don't tend to add them for new file (I guess this 
is not the case here) and instead rely on signed-off/author in the 
commit message.

> 
>>> + *
>>> + * Copyright IBM Corp. 2005, 2006, 2007
>>> + * Copyright Raptor Engineering, LLC
>>> + *
>>> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
>>> + *          Hollis Blanchard <hollisb@us.ibm.com>
>>> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
>>> + */
> 
>>> +extern int enter_of(struct of_service *args, unsigned long entry);
>>
>> Here you add 'extern' but ...
>>
>>> +
>>> +void boot_of_init(unsigned long);
>>
>> not here. In Xen, we tend to not add 'extern' for prototypes. Also,
>> please name the parameter as this makes clear what the value is. This
>> would also make MISRA happy (IIRC this would rule 8.2).
> 
> I used extern to mark the `enter_of` since it's an assembly function
> rather than a C one, but if this isn't a convention used in the Xen
> codebase I can drop it.

I am not aware of such convention in Xen. But if you want to distinguish 
assembly vs C function, then I think it would be better to add asm_ in 
the name so it is clearer.

> 
>>> diff --git a/xen/arch/ppc/include/asm/bug.h
>>> b/xen/arch/ppc/include/asm/bug.h
>>> new file mode 100644
>>> index 0000000000..a23ab1fa74
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/include/asm/bug.h
>>> @@ -0,0 +1,6 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef _ASM_PPC_BUG_H
>>> +#define _ASM_PPC_BUG_H
>>> +
>>> +#endif /* _ASM_PPC_BUG_H */
>>
>> Can you clarify why you do need this empty header?
> 
> Some empty headers were necessary to include <xen/lib.h> which in turn
> includes various asm/ headers. I have since dropped many of these
> headers following Andrew's earlier comments, though, and they won't be
> present in v2.
> 
>>> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
>>> index 2fcefb40d8..589c72e382 100644
>>> --- a/xen/arch/ppc/ppc64/head.S
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -1,30 +1,34 @@
>>>    /* SPDX-License-Identifier: GPL-2.0-or-later */
>>>    +#include <asm/processor.h>
>>> +
>>>        .section .text.header, "ax", %progbits
>>>      ENTRY(start)
>>> -    /*
>>> -     * Depending on how we were booted, the CPU could be running in
>>> either
>>> -     * Little Endian or Big Endian mode. The following trampoline
>>> from Linux
>>> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
>>> -     * endianness matches the assumption of the assembler (LE, in our
>>> case)
>>> -     * or a branch to code that performs the endian switch in the
>>> other case.
>>> -     */
>>> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>>> -    b . + 44          /* Skip trampoline if endian is good  */
>>> -    .long 0xa600607d  /* mfmsr r11                          */
>>> -    .long 0x01006b69  /* xori r11,r11,1                     */
>>> -    .long 0x00004039  /* li r10,0                           */
>>> -    .long 0x6401417d  /* mtmsrd r10,1                       */
>>> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
>>> -    .long 0xa602487d  /* mflr r10                           */
>>> -    .long 0x14004a39  /* addi r10,r10,20                    */
>>> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
>>> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
>>> -    .long 0x2400004c  /* rfid                               */
>>
>> This seems to be refactoring. It would be best if this is done in a
>> separate patch as this is easier to review.
> 
> Following Andrew's suggestion earlier, I've split this patch into two
> with the first one only doing the bare minimum to get an infinite loop
> going in C rather than assembly. That first patch still includes the
> refactoring of this trampoline into a macro, but the overall patch size
> is much smaller. Do you think that would be fine to review, or would you
> like a third commit for only this trampoline's refactoring?

In general we tend to split code movement/refactoring from new code. 
This helps during reviews. Not sure how small will be your patch. If it 
is only a few dozen of lines, then it should be fine :).

Cheers,

-- 
Julien Grall

