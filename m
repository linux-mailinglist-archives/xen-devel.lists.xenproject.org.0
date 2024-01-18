Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0D8315A4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 10:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668649.1040993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOaA-000790-AI; Thu, 18 Jan 2024 09:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668649.1040993; Thu, 18 Jan 2024 09:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOaA-00076h-6o; Thu, 18 Jan 2024 09:21:06 +0000
Received: by outflank-mailman (input) for mailman id 668649;
 Thu, 18 Jan 2024 09:21:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQOa8-00074P-U5
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 09:21:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQOa8-000198-D1; Thu, 18 Jan 2024 09:21:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQOa8-0006Vb-81; Thu, 18 Jan 2024 09:21:04 +0000
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
	bh=GaLa3CzZpXpw3/z1OpelPIXDOdlfc8xqucQxj7oIYP0=; b=0YCtO3nzHp/AoeGm8qiBhtrt0L
	qEpnttuQrg4h5oBK7LcUwuAGQW2HelIp6T35k36EnQNzs48jEhf+lweyiVQFm7YxnrgyUizpjgMW2
	b0hd2vKnTM69V516Ben+8SyYz4gx/tzVTq9Xpbee9v2wpxQgnPDJbOXac9QhwfeAVU+c=;
Message-ID: <54c7f4e1-ef94-491d-ad83-8c205b28ccd1@xen.org>
Date: Thu, 18 Jan 2024 09:21:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
 <0b9c3c86-2fa2-47f1-aa7f-4d833ff86430@xen.org>
 <7ef844df-3337-40ac-8d31-adabd3c3a3d7@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7ef844df-3337-40ac-8d31-adabd3c3a3d7@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 18/01/2024 01:36, Shawn Anastasio wrote:
> Hi Julien,
> 
> On 12/20/23 7:49 AM, Julien Grall wrote:
>> Hi,
>>
>> On 15/12/2023 02:44, Shawn Anastasio wrote:
>>> diff --git a/xen/common/device-tree/bootfdt.c
>>> b/xen/common/device-tree/bootfdt.c
>>> index 796ac01c18..7ddfcc7e2a 100644
>>> --- a/xen/common/device-tree/bootfdt.c
>>> +++ b/xen/common/device-tree/bootfdt.c
>>> @@ -543,12 +543,33 @@ size_t __init boot_fdt_info(const void *fdt,
>>> paddr_t paddr)
>>>        if ( ret < 0 )
>>>            panic("No valid device tree\n");
>>>    -    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>> -
>>>        ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node,
>>> NULL);
>>>        if ( ret )
>>>            panic("Early FDT parsing failed (%d)\n", ret);
>>>    +    /*
>>> +     * Add module for the FDT itself after the device tree has been
>>> parsed. This
>>> +     * is required on ppc64le where the device tree passed to Xen may
>>> have been
>>> +     * allocated by skiboot, in which case it will exist within a
>>> reserved
>>> +     * region and this call will fail. This is fine, however, since
>>> either way
>>> +     * the allocator will know not to step on the device tree.
>>> +     */
>>> +    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>
>> The consequence is BOOTMOD_FDT will not be added. AFAICT, Arm doesn't
>> try to access BOOTMOD_FDT, but I think it would be worth to print message.
>>
> 
> A message will already be printed by `meminfo_overlap_check` in setup.c
> when this condition is hit, like this:
> 
> (XEN) Region: [0x0000003076e9b0, 0x00000030775215) overlapping with
> bank[3]: [0x00000030600000, 0x00000031000000)

This is somewhat non-descriptive. IOW it doesn't tell me that the 
overlap was with the FDT. But I guess this can be improved (this is not 
a request for you to send another patch).

Cheers,

-- 
Julien Grall

