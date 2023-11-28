Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1B7FC30F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 19:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643423.1003622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r82mG-0005Ox-TG; Tue, 28 Nov 2023 18:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643423.1003622; Tue, 28 Nov 2023 18:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r82mG-0005MT-QE; Tue, 28 Nov 2023 18:25:44 +0000
Received: by outflank-mailman (input) for mailman id 643423;
 Tue, 28 Nov 2023 18:25:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r82mF-0005M4-J3
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 18:25:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r82mF-0006oH-0h; Tue, 28 Nov 2023 18:25:43 +0000
Received: from static-css-csq-252138.business.bouyguestelecom.com
 ([176.175.252.138] helo=[172.20.7.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r82mE-00074m-Rg; Tue, 28 Nov 2023 18:25:42 +0000
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
	bh=xrv/ZrJ7SRugKYcAoEqXVw0goAHEJnGSYW2gpurKCr8=; b=dDfkvzdz3dpPn1gFJwhq18E5a5
	6JYu+kwHL8vF2v2DST2MP3b2CSXjqkFRVkS58lQZpz2JUjEsj9q98unqxBdH15hlSRCptk4c3lP73
	lSPLbmIt8vARZpcnFvXZqVGmWarBDUkN0eDIuIVutEo8ojEJ5Bo2pPiyrab8VqFEhH3s=;
Message-ID: <2aba3981-b479-4939-a51b-8c142ebd6ed7@xen.org>
Date: Tue, 28 Nov 2023 19:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm/dom0less: put dom0less feature code in a
 separate module
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <20231124094841.1475381-4-luca.fancellu@arm.com>
 <b3581594-1559-4dcb-812b-8ab18f2e5633@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <b3581594-1559-4dcb-812b-8ab18f2e5633@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/11/2023 12:01, Michal Orzel wrote:
> On 24/11/2023 10:48, Luca Fancellu wrote:
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
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes from v5:
>>   - remove unneeded include (Michal)
> Including asm/kernel.h was indeed not required. However, I'm thinking that if we want the header
> to be self-contained and given that ...
> 
> [...]
> 
>> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
>> new file mode 100644
>> index 000000000000..c5625925d940
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/dom0less-build.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_DOM0LESS_BUILD_H_
>> +#define __ASM_DOM0LESS_BUILD_H_
>> +
>> +void create_domUs(void);
>> +bool is_dom0less_mode(void);
> here we use bool, I think we should include <xen/stdbool.h>

I have done the change on commit. However, this introduced a clash in 
the next patch.

I have done it this time because it is minor.

Cheers,

-- 
Julien Grall

