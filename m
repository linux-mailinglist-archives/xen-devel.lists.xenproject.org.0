Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04258786CAA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 12:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589902.921968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7RH-0005vC-Ce; Thu, 24 Aug 2023 10:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589902.921968; Thu, 24 Aug 2023 10:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7RH-0005tW-9r; Thu, 24 Aug 2023 10:19:43 +0000
Received: by outflank-mailman (input) for mailman id 589902;
 Thu, 24 Aug 2023 10:19:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ7RF-0005tA-W4
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 10:19:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ7RF-0001Vp-DS; Thu, 24 Aug 2023 10:19:41 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ7RF-0001nt-0p; Thu, 24 Aug 2023 10:19:41 +0000
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
	bh=4tio7x7gjKyKmzA8ydq+PPVyZdbnTYhDHdqXEqJbErI=; b=I6O7azqUh3pUhVmijHo/gdN8sF
	pGzsUxx+IHkDG/boSBKUNgjavfLzwFLZq6GRpXVmI7bEpf5gJLOhpl4cRNu2/1T00K3YPDsu2yPw6
	p4NY9jI58zdXpeQrimEUkkcKrsqPFh2ZSvdZQPk2B10IStASEO4d2TinhOEcjgtqELL0=;
Message-ID: <33e90d86-973f-4a32-941f-140db9aaa90c@xen.org>
Date: Thu, 24 Aug 2023 11:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen/arm: mm: Use generic variable/function names
 for extendability
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-10-Henry.Wang@arm.com>
 <c039015f-43d4-491f-b44c-8ece186e08e4@xen.org>
 <FBF340E4-5927-48E0-A23B-7D2F8DC8C33C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FBF340E4-5927-48E0-A23B-7D2F8DC8C33C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 24/08/2023 10:46, Henry Wang wrote:
>> On Aug 22, 2023, at 02:32, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 14/08/2023 05:25, Henry Wang wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>> As preparation for MPU support, which will use some variables/functions
>>> for both MMU and MPU system, We rename the affected variable/function
>>> to more generic names:
>>> - init_ttbr -> init_mm,
>>
>> You moved init_ttbr to mm/mmu.c. So why does this need to be renamed?
>>
>> And if you really planned to use it for the MPU code. Then init_ttbr should not have been moved.
> 
> You are correct. I think we need to use the “init_mm” for MPU SMP support,
> so I would not move this variable in v6.

Your branch mpu_v5 doesn't seem to contain any use. But I would expect 
that the common is never going to use the variable. Also, at the moment 
it is 64-bit but I don't see why it would be necessary to be bigger than 
32-bit on 32-bit.

So I think it would be preferable if init_ttbr is move in mm/mmu.c. You
can then introduce an MPU specific variable.

In general, only variables that will be used by common code should be 
defined in common. All the rest should be defined in their specific 
directory.

>>> - mmu_init_secondary_cpu() -> mm_init_secondary_cpu()
>>> - init_secondary_pagetables() -> init_secondary_mm()
>>
>> The original naming were not great but the new one are a lot more confusing as they seem to just be a reshuffle of word.
>>
>> mm_init_secondary_cpu() is only setting the WxN bit. For the MMU, I think it can be done much earlier. Do you have anything to add in it? If not, then I would consider to get rid of it.
> 
> I’ve got rid of mmu_init_secondary_cpu() function in my local v6 as it is now
> folded to the assembly code.
> 
>>
>> For init_secondary_mm(), I would renamed it to prepare_secondary_mm().
> 
> Sure, thanks for the name suggestion.
> 
>>
>>>   -void update_identity_mapping(bool enable)
>>> +static void update_identity_mapping(bool enable)
>>
>> Why not simply renaming this function to update_mm_mapping()? But...
>>
>>>   {
>>>       paddr_t id_addr = virt_to_maddr(_start);
>>>       int rc;
>>> @@ -120,6 +120,11 @@ void update_identity_mapping(bool enable)
>>>       BUG_ON(rc);
>>>   }
>>>   +void update_mm_mapping(bool enable)
>>
>> ... the new name it quite confusing. What is the mapping it is referring to?
> 
> So I checked the MPU SMP support code and now I think I understand the reason
> why update_mm_mapping() was introduced:
> 
> In the future we eventually need to support SMP for MMU systems, which means
> we need to call arch_cpu_up() and arch_cpu_up_finish(). These two functions call
> update_identity_mapping(). Since we believe "identity mapping" is a MMU concept,
> we changed this to generic name "mm mapping” as arch_cpu_up() and
> arch_cpu_up_finish() is a shared path between MMU and MPU.

The function is today called "update_identity_mapping()" because this is 
what the implementation does on arm64. But the goal of this function is 
to make sure that any mapping necessary for bring-up secondary CPUs are 
present.

So if you don't need similar work for the MPU then I would go with...

> 
> But I think MPU won’t use update_mm_mapping() function at all, so I wonder do
> you prefer creating an empty stub update_identity_mapping() for MPU? Or use #ifdef
> as suggested in your previous email...


... #ifdef. I have some preliminary work where the call to 
update_identity_mapping() may end up to be moved somewhere else as the 
page-tables would not be shared between pCPU anymore. So the logic will 
not some rework (see [1]).

Cheers,


[1] https://lore.kernel.org/all/20221216114853.8227-21-julien@xen.org/

-- 
Julien Grall

