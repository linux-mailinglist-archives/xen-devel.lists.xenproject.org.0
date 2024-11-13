Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C9C9C7165
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 14:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835716.1251576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDlk-0007Nx-Nf; Wed, 13 Nov 2024 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835716.1251576; Wed, 13 Nov 2024 13:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDlk-0007MQ-KV; Wed, 13 Nov 2024 13:50:52 +0000
Received: by outflank-mailman (input) for mailman id 835716;
 Wed, 13 Nov 2024 13:50:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBDlj-0007MK-OX
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 13:50:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBDli-003Gm5-2n;
 Wed, 13 Nov 2024 13:50:51 +0000
Received: from [2a02:8012:3a1:0:2c06:4644:c8a3:2b5e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBDli-0034Az-2n;
 Wed, 13 Nov 2024 13:50:50 +0000
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
	bh=IQAVUvrh2YQE0i+DiHpj2FU65Arjztm/S7Sd8vIbTcM=; b=yCm7dFfyang/J7x1qQsGXisd3f
	nN7svL9VwS78U3fxWYFIGLKBWByIKT3JCdLAYVz91E8Ja5YPcDbVrkfVcXYTtZE1APmj8u5Nib6WX
	j8UG6gD+IPCwPqQ6iJC0rRpZg716lgUPVv0EBS8QGpAVQAjdZojxSiGZaf6M7TLb7J28=;
Message-ID: <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
Date: Wed, 13 Nov 2024 13:50:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 06/11/2024 15:07, Michal Orzel wrote:
> 
> 
> On 06/11/2024 14:41, Luca Fancellu wrote:
>>
>>
>> There are some cases where the device tree exposes a memory range
>> in both /memreserve/ and reserved-memory node, in this case the
>> current code will stop Xen to boot since it will find that the
>> latter range is clashing with the already recorded /memreserve/
>> ranges.
>>
>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>> in the /memreserve/ part and even in this case this will prevent
>> Xen to boot since it will see that the module memory range that
>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>> range.
>>
>> When Xen populate the data structure that tracks the memory ranges,
>> it also adds a memory type described in 'enum membank_type', so
>> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
>> function to check for exact memory range match given a specific memory
>> type; allowing reserved-memory node ranges and boot modules to have an
>> exact match with ranges from /memreserve/.
>>
>> While there, set a type for the memory recorded during ACPI boot.
>>
>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> I tested this patch adding the same range in a /memreserve/ entry and
>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>> I've also tested that a configuration running static shared memory still works
>> fine.
>> ---
> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
> and the changes below look a bit too much for me, given that for boot modules we can only have
> /memreserve/ matching initrd.

How so? Is this an observation or part of a specification?

Cheers,


-- 
Julien Grall


