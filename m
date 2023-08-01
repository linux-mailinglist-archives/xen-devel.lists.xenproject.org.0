Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05AC76C09A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574574.899963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyFp-0005hf-SY; Tue, 01 Aug 2023 22:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574574.899963; Tue, 01 Aug 2023 22:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyFp-0005fq-Pc; Tue, 01 Aug 2023 22:54:13 +0000
Received: by outflank-mailman (input) for mailman id 574574;
 Tue, 01 Aug 2023 22:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUJK=DS=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQyFo-0005fU-5y
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:54:12 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ea000c-30be-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 00:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 623B582859F4;
 Tue,  1 Aug 2023 17:54:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Lm04u2qqgvGr; Tue,  1 Aug 2023 17:54:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 949408285A2B;
 Tue,  1 Aug 2023 17:54:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CkcdfIuHHHN4; Tue,  1 Aug 2023 17:54:04 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 2954682859F4;
 Tue,  1 Aug 2023 17:54:04 -0500 (CDT)
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
X-Inumbo-ID: 51ea000c-30be-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 949408285A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690930444; bh=3/X49LZtB0q8e21PzAIz8wSdVqrP+VUI0RFYwJYNlwA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=El/x5ogrVjI9rZ0iMhB49KFXlxeyiGpLKoDbGjBPuVqQTOioLljJx8vj2g9UVhCbi
	 BDhMupQdVgv6RvBTZKCrajGd6YgdSwO9/hvBPbQ9wnvPxPCXRftgM8F2MWPhdtuWef
	 8uhmRDO18s7uLiCWp66c7z0be/x3C3qBIKFHoW2k=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f83af545-eb06-5f19-cb89-fc24ef6d9a2f@raptorengineering.com>
Date: Tue, 1 Aug 2023 17:54:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] xen/ppc: Implement early serial console on PowerNV
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <3023ad320b42fa3787bb71a9cf83b34965668fe9.1690579561.git.sanastasio@raptorengineering.com>
 <41b33115-274c-7172-f100-85d6a4f1d538@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <41b33115-274c-7172-f100-85d6a4f1d538@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/23 6:19 AM, Jan Beulich wrote:
> On 28.07.2023 23:35, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/include/asm/asm-defns.h
>> +++ b/xen/arch/ppc/include/asm/asm-defns.h
>> @@ -23,6 +23,18 @@
>>      addis reg,%r2,name@toc@ha;                                               \
>>      addi  reg,reg,name@toc@l
> 
> Noticing only now, because of the issue ...
> 
>> +/*
>> + * Declare a global assembly function with a proper TOC setup prologue
>> + */
>> +#define _GLOBAL_TOC(name)                                                   \
>> +    .balign 4;                                                              \
>> +    .type name,@function;                                                   \
>> +    .globl name;                                                            \
>> +name:                                                                       \
>> +0:  addis %r2,%r12,(.TOC.-0b)@ha;                                           \
>> +    addi %r2,%r2,(.TOC.-0b)@l;                                              \
>> +    .localentry name,.-name
> 
> ... being widened - could we gain blanks after the commas? Down here
> (to match the code in context) another padding blank after "addi"
> would also be nice.

Sure, will do in v2.

>> --- a/xen/arch/ppc/opal.c
>> +++ b/xen/arch/ppc/opal.c
>> @@ -8,9 +8,28 @@
>>  #include <xen/init.h>
>>  #include <xen/lib.h>
>>  
>> -/* Global OPAL struct containing entrypoint and base */
>> +/* Global OPAL struct containing entrypoint and base used by opal-calls.S */
>>  struct opal opal;
>>  
>> +int64_t opal_console_write(int64_t term_number, uint64_t *length,
>> +                           uint8_t *buffer);
> 
> Would this perhaps better be void *, eliminating the need for casting
> in calls of this function?

I made it uint8_t to match the official OPAL API documentation (though I
now see I missed a `const`):
https://open-power.github.io/skiboot/doc/opal-api/opal-console-read-write-1-2.html#opal-console-write

In this case though, the type information of this parameter might not be
that important and changing it to void* to avoid the cast is fine with
me.

>> +int64_t opal_console_flush(int64_t term_number);
>> +int64_t opal_reinit_cpus(uint64_t flags);
>> +
>> +static void opal_putchar(char c)
> 
> Can't this be __init?

Unlike OpenFirmware, OPAL calls are expected to be used by the OS during
its entire lifecycle, not just during early boot, so the full
(non-early) serial console driver would likely want to use these
functions as well.

> 
>> +{
>> +    uint64_t len;
>> +    if (c == '\n')
> 
> Nit: Blank line please between declaration(s) and statement(s). (At
> least one more instance below.)

Will fix.

> Also please add the missing blanks in the if(), seeing that otherwise
> the file is aiming at being Xen style.

Ditto.

>> +    {
>> +        char buf = '\r';
>> +        len = cpu_to_be64(1);
>> +        opal_console_write(0, &len, (uint8_t *) &buf);
>> +    }
>> +    len = cpu_to_be64(1);
>> +    opal_console_write(0, &len, (uint8_t *) &c);
>> +    opal_console_flush(0);
>> +}
>> +
>>  void __init boot_opal_init(const void *fdt)
>>  {
>>      int opal_node;
>> @@ -45,4 +64,10 @@ void __init boot_opal_init(const void *fdt)
>>  
>>      opal.base = be64_to_cpu(*opal_base);
>>      opal.entry = be64_to_cpu(*opal_entry);
>> +
>> +    early_printk_init(opal_putchar);
>> +
>> +    /* Ask OPAL to set HID0 for Little Endian interrupts + Radix TLB support */
>> +    opal_reinit_cpus(OPAL_REINIT_CPUS_HILE_LE | OPAL_REINIT_CPUS_MMU_RADIX
>> +                     | OPAL_REINIT_CPUS_MMU_HASH);
> 
> Nit: operators on continued lines go at the end of the earlier line.

Will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/opal-calls.S
>> @@ -0,0 +1,82 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Adapted from Linux's arch/powerpc/boot/opal-calls.S
>> + *
>> + * Copyright (c) 2016 IBM Corporation.
>> + * Copyright Raptor Engineering, LLC
>> + */
>> +
>> +#include <asm/asm-defns.h>
>> +#include <asm/asm-offsets.h>
> 
> Would it make sense to have asm-defns.h include asm-offsets.h, like
> x86 and Arm do?

Sure, I'll make this change along with the formatting updates in
asm-defns.h

>> +#include <asm/opal-api.h>
>> +#include <asm/msr.h>
>> +
>> +    .text
> 
> Is any of this code still needed post-init?

Yes, see above.

>> +#define OPAL_CALL(name, token)  \
>> +    .globl name;                \
>> +name:                           \
>> +    li      %r0, token;         \
>> +    b       opal_call;
> 
> I think the trailing semicolon wants omitting.

Will fix.

> Jan

Thanks,
Shawn

