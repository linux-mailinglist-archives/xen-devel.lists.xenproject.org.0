Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCB7F1488
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 14:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636734.992458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54WC-0000lp-KS; Mon, 20 Nov 2023 13:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636734.992458; Mon, 20 Nov 2023 13:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54WC-0000jd-Hm; Mon, 20 Nov 2023 13:40:52 +0000
Received: by outflank-mailman (input) for mailman id 636734;
 Mon, 20 Nov 2023 13:40:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r54WB-0000jX-Ed
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 13:40:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r54WB-0007FK-4N; Mon, 20 Nov 2023 13:40:51 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r54WA-0005wl-U0; Mon, 20 Nov 2023 13:40:51 +0000
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
	bh=fdiO6u+f4YhNyeh3xZST0v7gsfOw52wcr+rY69Hdc6o=; b=H9XQS1oBhBd5GNHh6VvZ2VGnFt
	NoltxatCQmvX+pIkOhdgKsEFz5YEUN+nsTXTfFaZZWxWrH2hbB+BLIudDKw2Ew5ch8lV+y+oq8uvu
	Av1ilCzhbY64KnnqT5H5Ep1grB5JSxRYxdrVAQLtV01zomt1t9ClQ18kCCY8HWQ5+vYg=;
Message-ID: <0c32e2eb-7ffe-486c-a11c-477c3cff5cba@xen.org>
Date: Mon, 20 Nov 2023 13:40:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-4-luca.fancellu@arm.com>
 <98980da0-2940-43d2-a6c1-e064f4921e74@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <98980da0-2940-43d2-a6c1-e064f4921e74@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2023 07:34, Michal Orzel wrote:
> Hi Luca,
> 
> On 14/11/2023 10:03, Luca Fancellu wrote:
>>
>>
>> Currently the dom0less feature code is mostly inside domain_build.c
>> and setup.c, it is a feature that may not be useful to everyone so
>> put the code in a different compilation module in order to make it
>> easier to disable the feature in the future.
>>
>> Move gic_interrupt_t in domain_build.h to use it with the function
>> declaration, move its comment above the declaration.
>>
>> The following functions are now visible externally from domain_build
>> because they are used also from the dom0less-build module:
>>   - get_allocation_size
>>   - set_interrupt
>>   - domain_fdt_begin_node
>>   - make_memory_node
>>   - make_resv_memory_node
>>   - make_hypervisor_node
>>   - make_psci_node
>>   - make_cpus_node
>>   - make_timer_node
>>   - handle_device_interrupts
>>   - construct_domain
>>   - process_shm
>>   - allocate_bank_memory
>>
>> The functions allocate_static_memory and assign_static_memory_11
>> are now externally visible, so put their declarations into
>> domain_build.h and move the #else and stub definition in the header
>> as well.
>>
>> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
>> externally visible.
>>
>> The function allocate_bank_memory is used only by dom0less code
>> at the moment, but it's been decided to leave it in domain_build.c
>> in case that in the future the dom0 code can use it.
>>
>> Where spotted, fix code style issues.
>>
>> No functional change is intended.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> with one remark...
> 
>> ---
>> Changes from v4:
>>   - fixed name in inclusion macro __ASM_* instead of __ARM_*, fixed
>>     emacs local variable 'end:', style fix (Michal)
>> Changes from v3:
>>   - remove header in dom0less-build.c (Michal)
>> Changes from v2:
>>   - move allocate_bank_memory back in domain_build.c, remove header
>>     from dom0less-build.c.
>> ---
>>   xen/arch/arm/Makefile                     |    1 +
>>   xen/arch/arm/dom0less-build.c             | 1018 +++++++++++++++++
>>   xen/arch/arm/domain_build.c               | 1265 +++------------------
>>   xen/arch/arm/include/asm/dom0less-build.h |   20 +
>>   xen/arch/arm/include/asm/domain_build.h   |   60 +
>>   xen/arch/arm/include/asm/setup.h          |    1 -
>>   xen/arch/arm/setup.c                      |   33 +-
>>   7 files changed, 1240 insertions(+), 1158 deletions(-)
>>   create mode 100644 xen/arch/arm/dom0less-build.c
>>   create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>
> 
> [...]
>> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
>> new file mode 100644
>> index 000000000000..81446cbd8bf3
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/dom0less-build.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_DOM0LESS_BUILD_H_
>> +#define __ASM_DOM0LESS_BUILD_H_
>> +
>> +#include <asm/kernel.h>
> No need for this include, especially if you are removing it in the subsequent patch.

Are you suggesting that this patch builds without including asm/kernel.h?

> This could be done on commit (+ there is a conflcit between your series and Henry's mmu/mpu split)

While I am in general happy to handle some changes on commit, I don't 
want to solve conflict between series.

One will have to rebase on top of the others. I suggest that this is 
just rebased on top of Henry, purely because I will likely commit it 
today or tomorrow.

Cheers,

-- 
Julien Grall

