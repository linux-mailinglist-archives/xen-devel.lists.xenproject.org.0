Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D2A890CE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 02:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951660.1347503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4UMl-0000rP-5V; Tue, 15 Apr 2025 00:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951660.1347503; Tue, 15 Apr 2025 00:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4UMl-0000pK-2r; Tue, 15 Apr 2025 00:41:31 +0000
Received: by outflank-mailman (input) for mailman id 951660;
 Tue, 15 Apr 2025 00:41:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4UMj-0000pE-JF
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 00:41:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4UMj-00FAvy-03;
 Tue, 15 Apr 2025 00:41:29 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4UMi-007rVL-0m;
 Tue, 15 Apr 2025 00:41:28 +0000
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
	bh=T/nSxo0GFS84KDM4AxHN+8vc9NnQXnsoRW/ZdiXHhys=; b=wDxUdcMz+y/rhQpbrASq6Vnlom
	sqwOYdC4HhVYMQkXTiEzofJ0BAUjigxCSBaBk0Uy7T9Gq0g9dMAT3R2ydupiDxUUZ9HqqoxXKxsQg
	ppPLKXuZr0J2jVH4Y6QTtjWExnvCh4mTmbnvCI1uKFy5SinQvenumm4APCyjjIVzvjnk=;
Message-ID: <fcacc6b6-ea4b-4917-ac46-5264ac3e4039@xen.org>
Date: Tue, 15 Apr 2025 09:41:21 +0900
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <4771188E-B307-4452-A900-2ACACC1CE333@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 15/04/2025 00:17, Luca Fancellu wrote:
> HI Julien,
> 
>> On 14 Apr 2025, at 13:12, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 11/04/2025 23:56, Luca Fancellu wrote:
>>> Implement the function setup_mpu that will logically track the MPU
>>> regions defined by hardware registers, start introducing data
>>> structures and functions to track the status from the C world.
>>> The xen_mpumap_mask bitmap is used to track which MPU region are
>>> enabled at runtime.
>>> This function is called from setup_mm() which full implementation
>>> will be provided in a later stage.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v3 changes:
>>>   - Moved PRENR_MASK define to common.
>>> ---
>>> ---
>>>   xen/arch/arm/include/asm/mpu.h |  2 ++
>>>   xen/arch/arm/mpu/mm.c          | 49 +++++++++++++++++++++++++++++++++-
>>>   2 files changed, 50 insertions(+), 1 deletion(-)
>>> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>> index eba5086cde97..77d0566f9780 100644
>>> --- a/xen/arch/arm/include/asm/mpu.h
>>> +++ b/xen/arch/arm/include/asm/mpu.h
>>> @@ -20,6 +20,8 @@
>>>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>>>   #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>>>   +#define PRENR_MASK  GENMASK(31, 0)
>>> +
>>>   /* Access permission attributes. */
>>>   /* Read/Write at EL2, No Access at EL1/EL0. */
>>>   #define AP_RW_EL2 0x0
>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>> index 635d1f5a2ba0..e0a40489a7fc 100644
>>> --- a/xen/arch/arm/mpu/mm.c
>>> +++ b/xen/arch/arm/mpu/mm.c
>>> @@ -14,6 +14,17 @@
>>>     struct page_info *frame_table;
>>>   +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
>>> +uint8_t __ro_after_init max_xen_mpumap;
>>
>> Are this variable and ...
>>
>>> +
>>> +/*
>>> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
>>> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
>>> + * region 1, ..., and so on.
>>> + * If a MPU memory region gets enabled, set the according bit to 1.
>>> + */
>>> +DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
>>
>> ... this one meant to be global? If yes, then they need to have a declaration in the header. If not, then you want to add 'static'.
> 
> yes they are meant to be global, I’ll add a declaration in the header.
> 
>>
>>> +
>>>   /* EL2 Xen MPU memory region mapping table. */
>>>   pr_t xen_mpumap[MAX_MPU_REGIONS];
>>>   @@ -222,9 +233,45 @@ pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
>>>       return region;
>>>   }
>>>   +/*
>>> + * The code in this function needs to track the regions programmed in
>>> + * arm64/mpu/head.S
>>> + */
>>> +static void __init setup_mpu(void)
>>> +{
>>> +    register_t prenr;
>>> +    unsigned int i = 0;
>>> +
>>> +    /*
>>> +     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
>>> +     * the EL2 MPU.
>>> +     */
>>> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
>>> +
>>> +    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
>>> +    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
>>> +
>>> +    /*
>>> +     * Set the bitfield for regions enabled in assembly boot-time.
>>> +     * This code works under the assumption that the code in head.S has
>>> +     * allocated and enabled regions below 32 (N < 32).
>>> +
>> This is a bit fragile. I think it would be better if the bitmap is set by head.S as we add the regions. Same for ...
> 
> So, I was trying to avoid that because in that case we need to place xen_mpumap out of the BSS and start
> manipulating the bitmap from asm, instead I was hoping to use the C code, I understand that if someone
> wants to have more than 31 region as boot region this might break, but it’s also a bit unlikely?

The 31 is only part of the problem. The other problem is there is at 
least one other places in Xen (i.e. as early_fdt_map()) which will also 
create an entry in the MPU before setup_mm()/setup_mpu() is called. I am 
a bit concerned that the assumption is going to spread and yet we have 
no way to programmatically check if this will be broken.

Furthermore, right now, you are hardcoding the slot used and updating 
the MPU. But if you had the bitmap updated, you could just look up for a 
free slot.

> 
> So I was balancing the pros to manipulate everything from the C world against the cons (boot region > 31).
> 
> Is it still your preferred way to handle everything from asm?

Yes. I don't think the change in asm will be large and this would allow 
to remove other assumptions (like in the FDT mapping code).

As a side note, I noticed that the MPU entries are not cleared before we 
enable the MPU. Is there anything in the boot protocol that guarantee 
all the entries will be invalid? If not, then I think we need to clear 
the entries.

Otherwise, your current logic doesn't work. That said, I think it would 
still be necessary even if we get rid of your logic because we don't 
know the content of the MPU entries.

Cheers,

-- 
Julien Grall


