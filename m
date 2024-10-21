Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233859A6E53
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823706.1237752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uSY-0001qc-6x; Mon, 21 Oct 2024 15:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823706.1237752; Mon, 21 Oct 2024 15:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uSY-0001nS-2q; Mon, 21 Oct 2024 15:36:42 +0000
Received: by outflank-mailman (input) for mailman id 823706;
 Mon, 21 Oct 2024 15:36:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2uSW-0001nM-Rs
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:36:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uSW-0003DM-L3; Mon, 21 Oct 2024 15:36:40 +0000
Received: from [2a02:8012:3a1:0:827:16ef:abff:1cc1]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uSW-0002R6-Fp; Mon, 21 Oct 2024 15:36:40 +0000
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
	bh=nLueNOYoLFNP+jViI1e8HCR/HUdQAOWaDBOX/I1ywnc=; b=YGUphi9WOkLh8MP65pIsIIddW9
	WVaAFePpmdhwyui7yX9fZX6xlYAZ/MTDJNzWFu4PXi5ZOOvPBqXyYTiQ4YkeRVunNKG4pPNgEm8m/
	ZWGqIrxhV+fONlEZqvhcY0hodG5QxRONmwKOLpZtAuGzvSt9f3WrnghCXvRlNt0LPbp0=;
Message-ID: <8983387d-79f7-49e3-bd1b-8c401e01eeb6@xen.org>
Date: Mon, 21 Oct 2024 16:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 21/10/2024 16:30, Ayan Kumar Halder wrote:
> 
> On 18/10/2024 23:25, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>>> After the regions have been created, now we enable the MPU. For this 
>>> we disable
>>> the background region so that the new memory map created for the 
>>> regions take
>>> effect. Also, we treat all RW regions as non executable and the data 
>>> cache is
>>> enabled.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from :-
>>>
>>> v2 - 1. Extracted from the previous patch into a new one.
>>>
>>> 2. Disabled background region.
>>>
>>>   xen/arch/arm/arm64/mpu/head.S                | 29 ++++++++++++++++++--
>>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  3 ++
>>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/ 
>>> head.S
>>> index 4a21bc815c..e354f4552b 100644
>>> --- a/xen/arch/arm/arm64/mpu/head.S
>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>> @@ -61,6 +61,30 @@
>>>       add \xb, \xb, x20       /* x20 - Phys offset */
>>>   .endm
>>>   +/*
>>> + * Enable EL2 MPU and data cache
>>> + * If the Background region is enabled, then the MPU uses the 
>>> default memory
>>> + * map as the Background region for generating the memory
>>> + * attributes when MPU is disabled.
>>> + * Since the default memory map of the Armv8-R AArch64 architecture is
>>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background 
>>> region here.
>>> + *
>>> + * Clobbers x0
>>> + *
>>> + */
>>> +FUNC_LOCAL(enable_mpu)
>>> +    mrs   x0, SCTLR_EL2
>>> +    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>
>> NIT: Can't we have a single "orr" instruction to set all the flags?
> Yes, I will change this.
>>
>>> +    dsb   sy
>>
>> I still question this use of "dsb sy"...
> 
> Actually I kept this to ensure that all outstanding memory access are 
> completed before MPU is enabled.

I don't mind to keep it for this reason so long it is documented.

Cheers,


-- 
Julien Grall


