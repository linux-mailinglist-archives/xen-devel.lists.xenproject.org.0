Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C998A899CE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952561.1347982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dPY-0001nK-FJ; Tue, 15 Apr 2025 10:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952561.1347982; Tue, 15 Apr 2025 10:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dPY-0001k1-Bh; Tue, 15 Apr 2025 10:21:00 +0000
Received: by outflank-mailman (input) for mailman id 952561;
 Tue, 15 Apr 2025 10:20:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4dPW-0001be-M4
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:20:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4dPW-00GxIz-0o;
 Tue, 15 Apr 2025 10:20:58 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4dPV-003UjR-2M;
 Tue, 15 Apr 2025 10:20:58 +0000
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
	bh=sa6mUBCe1n9ojq5qON03yW2GTv5plXKt1J/oxDFyhlo=; b=Up7ZhJx7QxzU06z++BRLJHL29B
	r6VP1ctH+tuEDU8ujYRbdeMMs3rLrx7g3CPR4ihO9NV1pjRpztIuKadq2/XKGZvjm3cQxteOg+R00
	ipgGdXPu31w5MQJtCR9gyR9VuqzKPHV6YWkks+W0OpCgxU2dpLAorx1BpJxflQZ8gxbs=;
Message-ID: <9eec0359-e9e9-4d38-abc0-3cde6eb94e3b@xen.org>
Date: Tue, 15 Apr 2025 19:20:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-8-luca.fancellu@arm.com>
 <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
 <4771188E-B307-4452-A900-2ACACC1CE333@arm.com>
 <fcacc6b6-ea4b-4917-ac46-5264ac3e4039@xen.org>
 <A053DC71-B301-4D64-8EDB-C225E2ED3FA7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A053DC71-B301-4D64-8EDB-C225E2ED3FA7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 15/04/2025 16:55, Luca Fancellu wrote:
> Hi Julien,
> 
>>>>> +static void __init setup_mpu(void)
>>>>> +{
>>>>> +    register_t prenr;
>>>>> +    unsigned int i = 0;
>>>>> +
>>>>> +    /*
>>>>> +     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
>>>>> +     * the EL2 MPU.
>>>>> +     */
>>>>> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
>>>>> +
>>>>> +    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
>>>>> +    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
>>>>> +
>>>>> +    /*
>>>>> +     * Set the bitfield for regions enabled in assembly boot-time.
>>>>> +     * This code works under the assumption that the code in head.S has
>>>>> +     * allocated and enabled regions below 32 (N < 32).
>>>>> +
>>>> This is a bit fragile. I think it would be better if the bitmap is set by head.S as we add the regions. Same for ...
>>> So, I was trying to avoid that because in that case we need to place xen_mpumap out of the BSS and start
>>> manipulating the bitmap from asm, instead I was hoping to use the C code, I understand that if someone
>>> wants to have more than 31 region as boot region this might break, but it’s also a bit unlikely?
>>
>> The 31 is only part of the problem. The other problem is there is at least one other places in Xen (i.e. as early_fdt_map()) which will also create an entry in the MPU before setup_mm()/setup_mpu() is called. I am a bit concerned that the assumption is going to spread and yet we have no way to programmatically check if this will be broken.
> 
> If we would like to find ways, we could check eventually for clashes on enabled MPU regions;
> so the only part where a region is created in the C world without the assistance of xen_mpumap is early_fdt_map(),
> asserts etc could be used in one or both setup_mpu and early_fdt_map to prevent breakage.
 > >>
>> Furthermore, right now, you are hardcoding the slot used and updating the MPU. But if you had the bitmap updated, you could just look up for a free slot.
> 
> of course, but still the early DTB map is temporary and it will be gone after boot, so it won’t impact much unless I’m
> missing something.

It doesn't really matter whether the region is temporary or not. My 
concern is you are making assumption that are difficult to track (they 
are not documented where a developper would most likely look at).

So if we still want to hardcode the value, then this should be 
documented in head.S and probably in a layout.h (or similar) so there is 
a single place where the MPU layout is described.

> 
>>
>>> So I was balancing the pros to manipulate everything from the C world against the cons (boot region > 31).
>>> Is it still your preferred way to handle everything from asm?
>>
>> Yes. I don't think the change in asm will be large and this would allow to remove other assumptions (like in the FDT mapping code).
> 
> not large, but still something to be maintained, we will need arm64/arm32 code to set/clear bits on the bitmap
> (causing duplication with bitops.c), code to save things on the xen_mpumap, code to clean/invalidate dcache for the entries in xen_mpumap and finally we will need to keep the code aligned to the implementation of the bitmap
> (which is fairly stable, but still needs to be taken into account).

I understand the changes and risks, but I still think this is the right 
approach. Let see what the other maintainers think.

> 
>>
>> As a side note, I noticed that the MPU entries are not cleared before we enable the MPU. Is there anything in the boot protocol that guarantee all the entries will be invalid? If not, then I think we need to clear the entries.
>>
>> Otherwise, your current logic doesn't work. That said, I think it would still be necessary even if we get rid of your logic because we don't know the content of the MPU entries.
> 
> The PRLAR.EN bit resets to zero on a warm reset, so any region will be always disabled unless programmed, I thought it is enough.

This is only telling me the state PRLAR.EN when the CPU is initially 
turn on. This doesn't tell me the value of the bit when jumping in Xen.

I am making the difference because there might be another software 
running at EL2 before jumping into Xen (e.g. bootloader, or even a 
previous Xen if we were using Kexec) which could use the MPU.

So I am looking for some details on how the expected state of the system 
when jumping to an OS/hypervisor. For a comparison, on the MMU side, we 
have the Linux arm64 Image protocol that will specific how
a bootloader needs to configure the system.

Cheers,

-- 
Julien Grall


