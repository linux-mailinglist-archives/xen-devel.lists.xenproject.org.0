Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EA9849EC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803208.1213721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8eV-00030R-ON; Tue, 24 Sep 2024 16:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803208.1213721; Tue, 24 Sep 2024 16:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8eV-0002yT-Lb; Tue, 24 Sep 2024 16:44:39 +0000
Received: by outflank-mailman (input) for mailman id 803208;
 Tue, 24 Sep 2024 16:44:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st8eU-0002y9-HU
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:44:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8eU-0004HL-0o; Tue, 24 Sep 2024 16:44:38 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8eT-0000Bh-RJ; Tue, 24 Sep 2024 16:44:37 +0000
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
	bh=AIWnoC/X9IluKnd1tSuWpdBfXBneeQfay/9ZuYwLFqY=; b=zoMRiP9XQF0CHDiBL/2RbJLaH/
	MrIpWRVBws79JYBojmILetr7+OTxDUbD3F6T+rQ5i92I8eb6N8CvdA9alDUQloJG9ayygaMTbrhq5
	1snLcLkyIKWQL1YxQulWucFXcDRZVjPTUylA24aeY+FOdTayNvWpPdLRygsDJnihrw8M=;
Message-ID: <547f669a-9b13-47a1-aaed-07a46b096d42@xen.org>
Date: Tue, 24 Sep 2024 17:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-3-ayan.kumar.halder@amd.com>
 <e1930816-14ff-489e-99c1-8e832655d4af@xen.org>
 <ed17bac3-6505-4824-bffb-6436e0a9e3cc@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ed17bac3-6505-4824-bffb-6436e0a9e3cc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/09/2024 12:22, Ayan Kumar Halder wrote:
> 
> On 19/09/2024 13:42, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> On Armv8-A, Xen has a fixed virtual start address (link address too) 
>>> for all
>>> Armv8-A platforms. In an MMU based system, Xen can map its loaded 
>>> address to
>>> this virtual start address. So, on Armv8-A platforms, the Xen start 
>>> address does
>>> not need to be configurable. But on Armv8-R platforms, there is no 
>>> MMU to map
>>> loaded address to a fixed virtual address and different platforms 
>>> will have very
>>> different address space layout. So Xen cannot use a fixed physical 
>>> address on
>>> MPU based system and need to have it configurable.
>>>
>>> So, we introduce a Kconfig option for users to set the start address. 
>>> The start
>>> address needs to be aligned to 4KB. We have a check for this alignment.
>>
>> It would suggest to add some explanation why you want the start 
>> address to be 4KB aligned.
> 
> Let me know if this makes sense.
> 
> "MPU allows us to define regions which are 64 bits aligned. This 
> restriction comes from the bitfields of PRBAR, PRLAR (the lower 6 bits 
> are 0 extended to provide the base and limit address of a region). This 
> means that the start address of Xen needs to be at least 64 bits aligned 
> (as it will correspond to the start address of memory protection region).
> 
> As for now Xen on MPU tries to use the same memory alignment 
> restrictions as it has been for MMU. Unlike MMU where the starting 
> virtual address is 2MB, Xen on MPU needs the start address to be 4 KB 
> (ie page size) aligned."
> 
> Thinking about this a bit more (and based on the discussion in "Re: 
> [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU systems"), 
> I think we can keep the 4 KB restriction for now and relax it later. Let 
> me know what you think.

I am fine with that.

> 
>>
>>>
>>> In case if the user forgets to set the start address, then 0xffffffff 
>>> is used
>>> as default. This is to trigger the error (on alignment check) and 
>>> thereby prompt
>>> user to set the start address.
>>>
>>> Also updated config.h so that it includes mpu/layout.h when 
>>> CONFIG_MPU is
>>> defined.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. Fixed some of the coding style issues.
>>> 2. Reworded the help message.
>>> 3. Updated the commit message.
>>>
>>>   xen/arch/arm/Kconfig                  | 10 ++++++++++
>>>   xen/arch/arm/include/asm/config.h     |  4 +++-
>>>   xen/arch/arm/include/asm/mpu/layout.h | 27 +++++++++++++++++++++++++++
>>
>> Looking at this patch again, I don't see any modification in 
>> xen.lds.S. Is it intended?
> 
> If we agree with the justification provided before, then this should be 
> the modification.
> 
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -232,6 +232,12 @@ SECTIONS
>    */
>   ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
> 
> +/*
> + * On MPU based platforms, the starting address is to be provided by user.
> + * One need to check that it is 4KB aligned.
> + */
> +ASSERT(IS_ALIGNED(_start,       4096), "starting address is misaligned")
> +

Ah I wasn't asking to add an ASSERT (although it would be good so long 
it is protected by CONFIG_MPU). Instead I was expecting XEN_VIRT_START 
to be replaced. But looking at the code again, I see you define
XEN_VIRT_START for the MPU.

I think this is a little bit odd to use XEN_VIRT_* defined for the MPU 
but it would be ok. Is the expectation that all the MPU code should be 
using XEN_START_ADDRESS? If so, maybe it would be worth add a comment on 
top of XEN_VIRT_ADDRESS.

Cheers,

-- 
Julien Grall


