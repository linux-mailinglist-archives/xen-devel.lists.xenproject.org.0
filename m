Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F62671816
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480292.744604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4zI-0007Mq-GP; Wed, 18 Jan 2023 09:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480292.744604; Wed, 18 Jan 2023 09:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4zI-0007L8-Dj; Wed, 18 Jan 2023 09:44:08 +0000
Received: by outflank-mailman (input) for mailman id 480292;
 Wed, 18 Jan 2023 09:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI4zG-0007L2-SE
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4zG-0004Ln-IR; Wed, 18 Jan 2023 09:44:06 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4zG-00051I-CW; Wed, 18 Jan 2023 09:44:06 +0000
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
	bh=e0MM1jc+ZHh5iFMgn4j2QZWTG0OyHWz3yp3OPZQPxQg=; b=1Oxe+75Zkb89JyKII79RwOoKb9
	lhSvCtrk/vf0XD59RF2jVSMSFnTXWqa3VAk1Rey0w4x5qbPicB68DPD1E8dapYMChfJBs6eUWT24k
	IlbIJqNG1O1K8JQ3aKM8nc+aBav0p9OWGiuzSAVNjwegzh2Fn9TmMJkCd7ku0A7K41y0=;
Message-ID: <7ffe5d34-614d-f2aa-cf87-c518917c970a@xen.org>
Date: Wed, 18 Jan 2023 09:44:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-5-Penny.Zheng@arm.com>
 <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
 <PAXPR08MB7420A5C7F93F23F14C77C9BA9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420A5C7F93F23F14C77C9BA9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/01/2023 03:00, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2023年1月18日 7:24
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Jiamei Xie
>> <Jiamei.Xie@arm.com>
>> Subject: Re: [PATCH v2 04/40] xen/arm: add an option to define Xen start
>> address for Armv8-R
>>
>> Hi Penny,
>>
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> On Armv8-A, Xen has a fixed virtual start address (link address
>>> too) for all Armv8-A platforms. In an MMU based system, Xen can
>>> map its loaded address to this virtual start address. So, on
>>> Armv8-A platforms, the Xen start address does not need to be
>>> configurable. But on Armv8-R platforms, there is no MMU to map
>>> loaded address to a fixed virtual address and different platforms
>>> will have very different address space layout. So Xen cannot use
>>> a fixed physical address on MPU based system and need to have it
>>> configurable.
>>>
>>> In this patch we introduce one Kconfig option for users to define
>>> the default Xen start address for Armv8-R. Users can enter the
>>> address in config time, or select the tailored platform config
>>> file from arch/arm/configs.
>>>
>>> And as we introduced Armv8-R platforms to Xen, that means the
>>> existed Arm64 platforms should not be listed in Armv8-R platform
>>> list, so we add !ARM_V8R dependency for these platforms.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>>
>> Your signed-off-by is missing.
>>
>>> ---
>>> v1 -> v2:
>>> 1. Remove the platform header fvp_baser.h.
>>> 2. Remove the default start address for fvp_baser64.
>>> 3. Remove the description of default address from commit log.
>>> 4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
>>>      No matter Arm-v8r board has MPU or not, it always need to
>>>      specify the start address.
>>
>> I don't quite understand the last sentence. Are you saying that it is
>> possible to have an ARMv8-R system with an MPU nor a page-table?
>>
> 
> Yes, from the Cortex-R82 page [1], you can see the MPU is optional in EL1
> and EL2:
> "Two optional and programmable MPUs controlled from EL1 and EL2 respectively."
Would this mean a vendor may provide their custom solution to protect 
the memory?

> 
> Although it is unlikely that vendors using the Armv8-R IP will do so, it
> is indeed an option. In the ID register, there are also related bits in
> ID_AA64MMFR0_EL1 (MSA_frac) to indicate this.
> 
>>> ---
>>>    xen/arch/arm/Kconfig           |  8 ++++++++
>>>    xen/arch/arm/platforms/Kconfig | 16 +++++++++++++---
>>>    2 files changed, 21 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index ace7178c9a..c6b6b612d1 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -145,6 +145,14 @@ config TEE
>>>    	  This option enables generic TEE mediators support. It allows
>> guests
>>>    	  to access real TEE via one of TEE mediators implemented in XEN.
>>>
>>> +config XEN_START_ADDRESS
>>> +	hex "Xen start address: keep default to use platform defined
>> address"
>>> +	default 0
>>> +	depends on ARM_V8R
>>
>> It is still pretty unclear to me what would be the difference between
>> HAS_MPU and ARM_V8R.
>>
> 
> If we don't want to support non-MPU supported Armv8-R, I think they are the
> same. IMO, non-MPU supported Armv8-R is meaningless to Xen.
OOI, why do you think this is meaningless?

> 
>>> +	help
>>> +	  This option allows to set the customized address at which Xen will
>> be
>>> +	  linked on MPU systems. This address must be aligned to a page size.
>>> +
>>>    source "arch/arm/tee/Kconfig"
>>>
>>>    config STATIC_SHM
>>> diff --git a/xen/arch/arm/platforms/Kconfig
>> b/xen/arch/arm/platforms/Kconfig
>>> index c93a6b2756..0904793a0b 100644
>>> --- a/xen/arch/arm/platforms/Kconfig
>>> +++ b/xen/arch/arm/platforms/Kconfig
>>> @@ -1,6 +1,7 @@
>>>    choice
>>>    	prompt "Platform Support"
>>>    	default ALL_PLAT
>>> +	default FVP_BASER if ARM_V8R
>>>    	---help---
>>>    	Choose which hardware platform to enable in Xen.
>>>
>>> @@ -8,13 +9,14 @@ choice
>>>
>>>    config ALL_PLAT
>>>    	bool "All Platforms"
>>> +	depends on !ARM_V8R
>>>    	---help---
>>>    	Enable support for all available hardware platforms. It doesn't
>>>    	automatically select any of the related drivers.
>>>
>>>    config QEMU
>>>    	bool "QEMU aarch virt machine support"
>>> -	depends on ARM_64
>>> +	depends on ARM_64 && !ARM_V8R
>>>    	select GICV3
>>>    	select HAS_PL011
>>>    	---help---
>>> @@ -23,7 +25,7 @@ config QEMU
>>>
>>>    config RCAR3
>>>    	bool "Renesas RCar3 support"
>>> -	depends on ARM_64
>>> +	depends on ARM_64 && !ARM_V8R
>>>    	select HAS_SCIF
>>>    	select IPMMU_VMSA
>>>    	---help---
>>> @@ -31,14 +33,22 @@ config RCAR3
>>>
>>>    config MPSOC
>>>    	bool "Xilinx Ultrascale+ MPSoC support"
>>> -	depends on ARM_64
>>> +	depends on ARM_64 && !ARM_V8R
>>>    	select HAS_CADENCE_UART
>>>    	select ARM_SMMU
>>>    	---help---
>>>    	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>>>
>>> +config FVP_BASER
>>> +	bool "Fixed Virtual Platform BaseR support"
>>> +	depends on ARM_V8R
>>> +	help
>>> +	  Enable platform specific configurations for Fixed Virtual
>>> +	  Platform BaseR
>>
>> This seems unrelated to this patch.
>>
> 
> Can we add some descriptions in commit log for this change, or we
> Should move it to a new patch? 

New patch please or introduce it in the patch where you need it.

We had preferred to use separate
> patches for this kind of changes, but we found the number of patches
> would become more and more. This problem has been bothering us for
> organizing patches.

I understand the concern of increasing the number of patches. However, 
this also needs to weight against the review.

In this case, it is very difficult for me to understand why we need to 
introduce FVP_BASER.

In fact, on the previous version, we discussed to not introduce any new 
platform specific config. So I am a bit surprised this is actually needed.

Cheers,

-- 
Julien Grall

