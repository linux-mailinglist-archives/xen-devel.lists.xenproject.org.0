Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F68A23EC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 04:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704295.1100616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv72X-0006U3-Sd; Fri, 12 Apr 2024 02:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704295.1100616; Fri, 12 Apr 2024 02:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv72X-0006SW-Pv; Fri, 12 Apr 2024 02:53:21 +0000
Received: by outflank-mailman (input) for mailman id 704295;
 Fri, 12 Apr 2024 02:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv72W-0006SQ-1C
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 02:53:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d03528ff-f877-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 04:53:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CBC7582856C2;
 Thu, 11 Apr 2024 21:53:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lTrs2UCdtpJ6; Thu, 11 Apr 2024 21:53:16 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 04E988285AAE;
 Thu, 11 Apr 2024 21:53:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DpyryjoNfMzQ; Thu, 11 Apr 2024 21:53:15 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E4B4B82856C2;
 Thu, 11 Apr 2024 21:53:14 -0500 (CDT)
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
X-Inumbo-ID: d03528ff-f877-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 04E988285AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712890396; bh=HX522MYS2uk1bO/+/S1Ipd2zJAJqzty/Pj/COJQYLO0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Wi+LxsnqZaCYBWcoTXZEZaoM4KgvU+ApoAORO9Q+gQN99Yz9hfCZ6MTJWi2KF9ykR
	 KJu9CDMTY+F41oy13UJqcEaAsdnhwihAaZ2Q8UskMOh3bnXv2rgaaroZ7mbB9WEx4S
	 qQorhrm3YGv9IDHf2dt1l+JEn8g3bbKF5UbvpJ0c=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c7de32e6-67d5-4bb8-9cc8-68753c657fc7@raptorengineering.com>
Date: Thu, 11 Apr 2024 21:53:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/common: Move Arm's bootfdt.c to common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <908ea2d9bccf0b3455119cfd9af0597aee005fe8.1710443965.git.sanastasio@raptorengineering.com>
 <6069d3de-b298-46e6-a64b-895df3ea037b@xen.org>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6069d3de-b298-46e6-a64b-895df3ea037b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 3/21/24 12:50 PM, Julien Grall wrote:
> Hi Shawn,
> 
> On 14/03/2024 22:15, Shawn Anastasio wrote:
>> Move Arm's bootfdt.c to xen/common so that it can be used by other
>> device tree architectures like PPC and RISCV.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Acked-by: Julien Grall <julien@xen.org>
>> ---
>> Changes in v2:
>>    - Drop #if defined(CONFIG_ARM_EFI) now that efi_enabled is stubbed
>>
>>   MAINTAINERS                                    | 1 +
>>   xen/arch/arm/Makefile                          | 1 -
>>   xen/common/device-tree/Makefile                | 1 +
>>   xen/{arch/arm => common/device-tree}/bootfdt.c | 0
>>   4 files changed, 2 insertions(+), 1 deletion(-)
>>   rename xen/{arch/arm => common/device-tree}/bootfdt.c (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e85fbe6737..20fdec9ffa 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -251,6 +251,7 @@ S:    Supported
>>   L:    xen-devel@lists.xenproject.org
>>   F:    docs/misc/arm/
>>   F:    xen/arch/arm/
>> +F:    xen/common/device-tree/bootfdt.c
>>   F:    xen/drivers/char/arm-uart.c
>>   F:    xen/drivers/char/cadence-uart.c
>>   F:    xen/drivers/char/exynos4210-uart.c
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7b1350e2ef..9e1548378c 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
>>   obj-$(CONFIG_HAS_VPCI) += vpci.o
>>
>>   obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>> -obj-y += bootfdt.init.o
>>   obj-y += cpuerrata.o
>>   obj-y += cpufeature.o
>>   obj-y += decode.o
>> diff --git a/xen/common/device-tree/Makefile
>> b/xen/common/device-tree/Makefile
>> index c97b2bd88c..fa5beafd65 100644
>> --- a/xen/common/device-tree/Makefile
>> +++ b/xen/common/device-tree/Makefile
>> @@ -1 +1,2 @@
>> +obj-y += bootfdt.init.o
>>   obj-y += bootinfo.o
> 
> Looking at the names, it is not entirely clear what would be the
> differences between bootfdt and bootinfo. Should they just be one file?
> 

With the current split I've chosen, all functions pertaining to managing
the `struct bootinfo` data structure are contained within bootinfo.c and
all functions responsible for parsing the FDT on boot are in bootfdt.c.

This separation exists currently in the ARM tree, but the bootinfo
functions are contained in setup.c rather than a separate self-contained
bootinfo.c.

If you feel strongly that we would be better off with everything in a
single file, I'm not necessarily opposed to that, but I do think that
this split at least makes sense.

>> diff --git a/xen/arch/arm/bootfdt.c b/xen/common/device-tree/bootfdt.c
>> similarity index 100%
>> rename from xen/arch/arm/bootfdt.c
>> rename to xen/common/device-tree/bootfdt.c
>> -- 
>> 2.30.2
>>
> 
> Cheers,

Thanks,
Shawn

