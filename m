Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8073A585
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553724.864454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMo8-0000k8-Ly; Thu, 22 Jun 2023 16:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553724.864454; Thu, 22 Jun 2023 16:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMo8-0000he-Im; Thu, 22 Jun 2023 16:05:16 +0000
Received: by outflank-mailman (input) for mailman id 553724;
 Thu, 22 Jun 2023 16:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yL9z=CK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qCMo8-0000hY-1W
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:05:16 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916f8ccc-1116-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:05:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AC8EC828552E;
 Thu, 22 Jun 2023 11:05:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id q9yVwMfCks6C; Thu, 22 Jun 2023 11:05:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 42D0C8285751;
 Thu, 22 Jun 2023 11:05:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cf-crATz7kH1; Thu, 22 Jun 2023 11:05:10 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id EA9DB828552E;
 Thu, 22 Jun 2023 11:05:09 -0500 (CDT)
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
X-Inumbo-ID: 916f8ccc-1116-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 42D0C8285751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687449910; bh=y8fHnyXVhK5WLo7IkJM4zekAT6n7lZH3WpFF9TDoJ7w=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=dgegjay8EC4U+xWHu4NeR4mIKHTxvvDX3e2RVmIp5+gxMu71iDD7RSNIVrFJ2P4CY
	 2WZIo6GK2OqixKVJUCqudI7OVpvzpCPJNNLrMz20Bv/iQt8ijZFi3eR0S8IQCQ5rge
	 Mo+fNSFbtdEp8XxyGRSDrqsNiXyj6djqCu91OPLQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <eb810a53-ee10-d8a1-b983-ee8dcf02f07a@raptorengineering.com>
Date: Thu, 22 Jun 2023 11:05:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <4fc1fcee-e210-fe16-f762-3f23700d51b9@xen.org>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <4fc1fcee-e210-fe16-f762-3f23700d51b9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/23 3:48 PM, Julien Grall wrote:
> Hi Shawn,
> 
> Below some remark about the coding style. I will try to spot all of them
> so please go through your code and check if my comments applies in other
> places.

Thank you for the detailed comments. I had a couple of follow-up
questions for you.

> On 21/06/2023 17:59, Shawn Anastasio wrote:
>> diff --git a/xen/arch/ppc/boot-of.c b/xen/arch/ppc/boot-of.c
>> new file mode 100644
>> index 0000000000..1ceeaf1250
>> --- /dev/null
>> +++ b/xen/arch/ppc/boot-of.c
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 
>> 02110-1301, USA.
> 
> As you already have the SPDX license, the full license should be dropped.

To clarify, you're suggesting that I remove the license text but keep
the copyright lines below? I wouldn't feel comfortable removing the
latter since this is derived from code that wasn't written by me.

>> + *
>> + * Copyright IBM Corp. 2005, 2006, 2007
>> + * Copyright Raptor Engineering, LLC
>> + *
>> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
>> + *          Hollis Blanchard <hollisb@us.ibm.com>
>> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
>> + */

>> +extern int enter_of(struct of_service *args, unsigned long entry);
> 
> Here you add 'extern' but ...
> 
>> +
>> +void boot_of_init(unsigned long);
> 
> not here. In Xen, we tend to not add 'extern' for prototypes. Also,
> please name the parameter as this makes clear what the value is. This
> would also make MISRA happy (IIRC this would rule 8.2).

I used extern to mark the `enter_of` since it's an assembly function
rather than a C one, but if this isn't a convention used in the Xen
codebase I can drop it.

>> diff --git a/xen/arch/ppc/include/asm/bug.h
>> b/xen/arch/ppc/include/asm/bug.h
>> new file mode 100644
>> index 0000000000..a23ab1fa74
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/bug.h
>> @@ -0,0 +1,6 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef _ASM_PPC_BUG_H
>> +#define _ASM_PPC_BUG_H
>> +
>> +#endif /* _ASM_PPC_BUG_H */
> 
> Can you clarify why you do need this empty header?

Some empty headers were necessary to include <xen/lib.h> which in turn
includes various asm/ headers. I have since dropped many of these
headers following Andrew's earlier comments, though, and they won't be
present in v2.

>> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
>> index 2fcefb40d8..589c72e382 100644
>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -1,30 +1,34 @@
>>   /* SPDX-License-Identifier: GPL-2.0-or-later */
>>   +#include <asm/processor.h>
>> +
>>       .section .text.header, "ax", %progbits
>>     ENTRY(start)
>> -    /*
>> -     * Depending on how we were booted, the CPU could be running in
>> either
>> -     * Little Endian or Big Endian mode. The following trampoline
>> from Linux
>> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
>> -     * endianness matches the assumption of the assembler (LE, in our
>> case)
>> -     * or a branch to code that performs the endian switch in the
>> other case.
>> -     */
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
> 
> This seems to be refactoring. It would be best if this is done in a
> separate patch as this is easier to review.

Following Andrew's suggestion earlier, I've split this patch into two
with the first one only doing the bare minimum to get an infinite loop
going in C rather than assembly. That first patch still includes the
refactoring of this trampoline into a macro, but the overall patch size
is much smaller. Do you think that would be fine to review, or would you
like a third commit for only this trampoline's refactoring?

> Cheers,

Thanks,
Shawn

