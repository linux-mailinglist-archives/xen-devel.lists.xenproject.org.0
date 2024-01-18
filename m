Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498C8310F4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 02:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668591.1040902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQHKT-0001g9-TN; Thu, 18 Jan 2024 01:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668591.1040902; Thu, 18 Jan 2024 01:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQHKT-0001d6-Qc; Thu, 18 Jan 2024 01:36:25 +0000
Received: by outflank-mailman (input) for mailman id 668591;
 Thu, 18 Jan 2024 01:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCV5=I4=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rQHKS-0001d0-F6
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 01:36:24 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa258bfd-b5a1-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 02:36:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0B4CA82855B4;
 Wed, 17 Jan 2024 19:36:18 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fmX8emFQppfv; Wed, 17 Jan 2024 19:36:15 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 805C6828673C;
 Wed, 17 Jan 2024 19:36:15 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id I0jRgqgVtSQK; Wed, 17 Jan 2024 19:36:15 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1E23D82855B4;
 Wed, 17 Jan 2024 19:36:15 -0600 (CST)
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
X-Inumbo-ID: fa258bfd-b5a1-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 805C6828673C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1705541775; bh=5mMoC6yhXF4FzkCxiwacYGagt/Ay54t/lBye6Jbgy30=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=A903x0++P235fBGi3nV2YC+jMl+or4fkZNG9rGAf7uY5r2GccCM3Sejs4NHzQkAvg
	 AccRItLySep+QtYiaVDJSYjzmVfBJnCqwhAkDm0BahmaRh1wIjWT3GtYa5f+8jL4fc
	 98Q1UoP6AYMTwkIJ+ECWMjjFjnYG+mTFp7/lmCCU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7ef844df-3337-40ac-8d31-adabd3c3a3d7@raptorengineering.com>
Date: Wed, 17 Jan 2024 19:36:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
 <0b9c3c86-2fa2-47f1-aa7f-4d833ff86430@xen.org>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <0b9c3c86-2fa2-47f1-aa7f-4d833ff86430@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 12/20/23 7:49 AM, Julien Grall wrote:
> Hi,
> 
> On 15/12/2023 02:44, Shawn Anastasio wrote:
>> diff --git a/xen/common/device-tree/bootfdt.c
>> b/xen/common/device-tree/bootfdt.c
>> index 796ac01c18..7ddfcc7e2a 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -543,12 +543,33 @@ size_t __init boot_fdt_info(const void *fdt,
>> paddr_t paddr)
>>       if ( ret < 0 )
>>           panic("No valid device tree\n");
>>   -    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>> -
>>       ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node,
>> NULL);
>>       if ( ret )
>>           panic("Early FDT parsing failed (%d)\n", ret);
>>   +    /*
>> +     * Add module for the FDT itself after the device tree has been
>> parsed. This
>> +     * is required on ppc64le where the device tree passed to Xen may
>> have been
>> +     * allocated by skiboot, in which case it will exist within a
>> reserved
>> +     * region and this call will fail. This is fine, however, since
>> either way
>> +     * the allocator will know not to step on the device tree.
>> +     */
>> +    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> 
> The consequence is BOOTMOD_FDT will not be added. AFAICT, Arm doesn't
> try to access BOOTMOD_FDT, but I think it would be worth to print message.
>

A message will already be printed by `meminfo_overlap_check` in setup.c
when this condition is hit, like this:

(XEN) Region: [0x0000003076e9b0, 0x00000030775215) overlapping with
bank[3]: [0x00000030600000, 0x00000031000000)

If you'd like me to add another more descriptive message here to let the
user know that BOOTMOD_FDT wasn't added I could do that, though.

>> +
>> +    /*
>> +     * Xen relocates itself at the ppc64 entrypoint, so we need to
>> manually mark
>> +     * the kernel module.
>> +     */
>> +    if ( IS_ENABLED(CONFIG_PPC64) ) {
>> +        paddr_t xen_start, xen_end;
>> +
>> +        xen_start = __pa(_start);
>> +        xen_end = PAGE_ALIGN(__pa(_end));
>> +        if ( !add_boot_module(BOOTMOD_XEN, xen_start, xen_end, false) )
>> +            panic("Xen overlaps reserved memory! %016lx - %016lx\n",
>> xen_start,
>> +                xen_end);
>> +    }
> 
> Can you explain why this is added here rather than in the caller of
> boot_fdt_info()? Either before or after?
> 
> If after, I guess it is because of early_print_info(). In which case, I
> would suggest to move off early_print_info() to caller on each
> architecture.
>

Right, it can't be after due to the early_print_info() call, but doing
it before actually works fine. Thank you for pointing that out -- I'll
change this in the next revision.

> Cheers,
>

Thanks,
Shawn

