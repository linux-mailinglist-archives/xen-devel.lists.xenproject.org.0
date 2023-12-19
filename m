Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA81818FCE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 19:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657082.1025754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFeqj-0000fO-B4; Tue, 19 Dec 2023 18:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657082.1025754; Tue, 19 Dec 2023 18:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFeqj-0000cT-85; Tue, 19 Dec 2023 18:29:49 +0000
Received: by outflank-mailman (input) for mailman id 657082;
 Tue, 19 Dec 2023 18:29:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFeqi-0000cN-CU
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 18:29:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFeqg-0008Pb-Tn; Tue, 19 Dec 2023 18:29:46 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFeqg-0001dQ-O8; Tue, 19 Dec 2023 18:29:46 +0000
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
	bh=SPY4PwFThbClqhYOuZY7E7Am+IhOnNEU8YBVomMQ4Eg=; b=AzAWo5DFm9nstm5R4y2jy2ihIl
	Vs6KIN5Y/ZIFPa4rBfgV8XyZ/G1ZdJxr8wTC54Lc7AvF78eQv6DSqJuk/Ba3LD9xSQ/nc2mUrybdv
	9lcqXm8sK21BLNU1Owi7WnmZx089rj2biP2u7jdKBGL3SFQrYo5Z2fFqM+notXso8gxg=;
Message-ID: <5fc9ad7a-1281-46da-abff-0aa2d2beca14@xen.org>
Date: Tue, 19 Dec 2023 18:29:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
 <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/12/2023 17:03, Jan Beulich wrote:
> On 15.12.2023 03:43, Shawn Anastasio wrote:
>> Move Arm's bootfdt.c to xen/common so that it can be used by other
>> device tree architectures like PPC and RISCV. Only a minor change to
>> conditionalize a call to a function only available on EFI-supporting
>> targets was made to the code itself.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   xen/arch/arm/Makefile                          |  1 -
>>   xen/common/Makefile                            |  1 +
>>   xen/common/device-tree/Makefile                |  1 +
>>   xen/{arch/arm => common/device-tree}/bootfdt.c | 15 +++++++++------
>>   4 files changed, 11 insertions(+), 7 deletions(-)
>>   create mode 100644 xen/common/device-tree/Makefile
>>   rename xen/{arch/arm => common/device-tree}/bootfdt.c (98%)
> 
> I think this wants to come with an update to ./MAINTAINERS, such that
> the file doesn't change maintainership.
> 
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>>   {
>>       int rc = 0;
>>   
>> -    /*
>> -     * If Xen has been booted via UEFI, the memory banks are
>> -     * populated. So we should skip the parsing.
>> -     */
>> -    if ( !efi_enabled(EFI_BOOT) &&
>> -         device_tree_node_matches(fdt, node, "memory") )
>> +    if ( device_tree_node_matches(fdt, node, "memory") )
>> +#if defined(CONFIG_ARM_EFI)
>> +        /*
>> +         * If Xen has been booted via UEFI, the memory banks are
>> +         * populated. So we should skip the parsing.
>> +         */
>> +        if ( efi_enabled(EFI_BOOT) )
>> +            return rc;
>> +#endif
> 
> I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
> that maybe PPC and quite likely RISC-V are likely to also want to support
> EFI boot. But of course there may be something inherently Arm-specific
> here that I'm unaware of.

Right now, I can't think how this is Arm specific. If you are using 
UEFI, then you are expected to use the UEFI memory map rather than the 
content of the device-tree.

However, we don't have a CONFIG_EFI option. It would be nice to 
introduce one but I am not sure I would introduce it just for this #ifdef.

Cheers,

-- 
Julien Grall

