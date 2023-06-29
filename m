Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FA74285F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556856.869684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsee-0005zh-KR; Thu, 29 Jun 2023 14:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556856.869684; Thu, 29 Jun 2023 14:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsee-0005y2-HH; Thu, 29 Jun 2023 14:29:52 +0000
Received: by outflank-mailman (input) for mailman id 556856;
 Thu, 29 Jun 2023 14:29:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEsed-0005xd-HC
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:29:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEsec-00066L-TI; Thu, 29 Jun 2023 14:29:50 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.2.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEsec-00050P-M7; Thu, 29 Jun 2023 14:29:50 +0000
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
	bh=uoe4E0r6VF/PVbNYzzlj1HtWMu/9jlP4ejlFsxEySxY=; b=szgSsoSDemrS1QdIuSJoKaGmGy
	iGy+ybzLUByWP+Xzny/pHGXyf1xdrvNwOVQXJHPwZQKBZ6vJT5cMj7eSE6/FQ45EvJPuLDoWnjPBm
	28bKTN3N9ZmIt188kakP6ettpo/ZtLBZnQ9NvffxYjaSbNQ/yCPnpw1YHYNJF1UYcOOI=;
Message-ID: <3e77ef15-4a34-8246-bf48-d87557690b48@xen.org>
Date: Thu, 29 Jun 2023 15:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/52] xen/mpu: introduce setup_mm_mappings
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-28-Penny.Zheng@arm.com>
 <ba80b734-fb18-49ee-a5b6-1c69ae5a811b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ba80b734-fb18-49ee-a5b6-1c69ae5a811b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/06/2023 15:05, Ayan Kumar Halder wrote:
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> Function setup_pagetables is responsible for boot-time pagetable setup
>> in MMU system at C world.
>> In MPU system, as we have already built up start-of-day Xen MPU memory
>> region mapping in assembly boot-time, here we only need to do a few
>> memory management data initializtion, including reading the number of
>> maximum MPU regions supported by the EL2 MPU, and setting the according
>> bitfield for regions enabled in assembly boot-time, in bitmap 
>> xen_mpumap_mask.
>> This bitmap xen_mpumap_mask is responsible for recording the usage of 
>> EL2 MPU
>> memory regions.
>>
>> In order to keep only one codeflow in arm/setup.c, setup_mm_mappings
>> , with a more generic name, is introduced to replace setup_pagetables.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - introduce bitmap xen_mpumap_mask for dynamic allocation on MPU regions
>> ---
>>   xen/arch/arm/include/asm/arm64/mpu.h     |  1 +
>>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +++
>>   xen/arch/arm/include/asm/mm.h            |  4 ++--
>>   xen/arch/arm/mmu/mm.c                    |  7 +++++-
>>   xen/arch/arm/mpu/mm.c                    | 30 ++++++++++++++++++++++++
>>   xen/arch/arm/setup.c                     |  2 +-
>>   6 files changed, 43 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>> b/xen/arch/arm/include/asm/arm64/mpu.h
>> index 6ec2c10b14..407fec66c9 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -19,6 +19,7 @@
>>    * or it needs adjustment.
>>    */
>>   #define REGION_UART_SEL            0x07
>> +#define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
> 
> May be this is simpler to read
> 
> #define MPUIR_REGION_MASK _AC(0xFF, UL)
> 
> Also, you can move it to xen/arch/arm/include/asm/mpu.h as it is common 
> between R52 and R82.

I would actually prefer if we use GENMASK(...).

[...]

>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index fb6bb721b1..e06a6e5810 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -20,6 +20,7 @@
>>    */
>>
>>   #include <xen/init.h>
>> +#include <xen/mm.h>
>>   #include <xen/page-size.h>
>>   #include <asm/arm64/mpu.h>
>>
>> @@ -27,6 +28,35 @@
>>   pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>>        xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
>>
>> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
>> +uint8_t __ro_after_init max_xen_mpumap;
>> +
>> +/*
>> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory 
>> regions.
>> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
>> + * region 1, ..., and so on.
>> + * If a MPU memory region gets enabled, set the according bit to 1.
>> + */
>> +static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
>> +
>> +void __init setup_mm_mappings(unsigned long boot_phys_offset)
>> +{
>> +    unsigned int nr_regions = REGION_UART_SEL, i = 0;
>> +
>> +    /*
>> +     * MPUIR_EL2.Region[0:7] identifies the number of regions 
>> supported by
>> +     * the EL2 MPU.
>> +     */
>> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & 
>> MPUIR_REGION_MASK);
> 
> NIT:- You may dop "& MPUIR_REGION_MASK " as the other bits are RES0

 From the Arm Arm (look for the definition of RES0 in the glossary):

"
To preserve forward compatibility, software:
• Must not rely on the bit reading as 0.
• Must use an SBZP policy to write to the bit.
"

So we should not drop "& MPUIR_REGION_MASK".

Cheers,

-- 
Julien Grall

