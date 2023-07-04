Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8E74707E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 14:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558309.872276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGes0-0003yr-1U; Tue, 04 Jul 2023 12:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558309.872276; Tue, 04 Jul 2023 12:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGerz-0003xC-Uq; Tue, 04 Jul 2023 12:10:59 +0000
Received: by outflank-mailman (input) for mailman id 558309;
 Tue, 04 Jul 2023 12:10:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGery-0003x3-0j
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 12:10:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGerx-000753-KF; Tue, 04 Jul 2023 12:10:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGerx-0002Fd-EX; Tue, 04 Jul 2023 12:10:57 +0000
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
	bh=0+NlS8i1p9v08aRSXry7rnarwsmM8IY/lH+nDOMKUf4=; b=B2AMI7eXQ3/t0m2C78bS0eOo5y
	z+Uhmlftz8XGYQeyRvIN2hJit8x3qYxTcti/d3QB5iyQ3wyYTf2jzZfIMMT6kXsVKqV6WUNdpsPSz
	oUwlDK7ugaWc9NaSAMbTqYmBom0YwDeGY6xmD39KHxVADDTRPTv3HzbvowpL/wzfJZiw=;
Message-ID: <f6bed109-f6da-fd0b-bd5b-077a57a04563@xen.org>
Date: Tue, 4 Jul 2023 13:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/52] xen/arm: add an option to define Xen start
 address for Armv8-R
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-4-Penny.Zheng@arm.com>
 <cb7e3d34-bbb8-e5df-f87b-0fcac4b65378@amd.com>
 <77c64929-514a-ea67-cf8b-176c895ff971@xen.org>
 <682fdfab-b755-e580-7688-3dc0c0e3779e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <682fdfab-b755-e580-7688-3dc0c0e3779e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/07/2023 13:02, Ayan Kumar Halder wrote:
> 
> On 04/07/2023 12:47, Julien Grall wrote:
>>
>>
>> On 04/07/2023 11:36, Ayan Kumar Halder wrote:
>>> Hi Penny,
>>
>> Hi Ayan,
> Hi Julien,
>>
>>> On 26/06/2023 04:33, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> From: Wei Chen <wei.chen@arm.com>
>>>>
>>>> On Armv8-A, Xen has a fixed virtual start address (link address
>>>> too) for all Armv8-A platforms. In an MMU based system, Xen can
>>>> map its loaded address to this virtual start address. So, on
>>>> Armv8-A platforms, the Xen start address does not need to be
>>>> configurable. But on Armv8-R platforms, there is no MMU to map
>>>> loaded address to a fixed virtual address and different platforms
>>>> will have very different address space layout. So Xen cannot use
>>>> a fixed physical address on MPU based system and need to have it
>>>> configurable.
>>>>
>>>> In this patch we introduce one Kconfig option for users to define
>>>> the default Xen start address for Armv8-R. Users can enter the
>>>> address in config time, or select the tailored platform config
>>>> file from arch/arm/configs.
>>>>
>>>> And as we introduced Armv8-R to Xen, that means the existed Arm64
>>>> MMU based platforms should not be listed in Armv8-R platform
>>>> list, so we add !HAS_MPU dependency for these platforms.
>>>>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> ---
>>>> v1 -> v2:
>>>> 1. Remove the platform header fvp_baser.h.
>>>> 2. Remove the default start address for fvp_baser64.
>>>> 3. Remove the description of default address from commit log.
>>>> 4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
>>>>     No matter Arm-v8r board has MPU or not, it always need to
>>>>     specify the start address.
>>>> ---
>>>> v3:
>>>> 1. Remove unrelated change of "CONFIG_FVP_BASER"
>>>> 2. Change ARM_V8R to HAS_MPU for Xen start address dependency
>>>> ---
>>>>   xen/arch/arm/Kconfig           | 8 ++++++++
>>>>   xen/arch/arm/platforms/Kconfig | 8 +++++---
>>>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 70fdc2ba63..ff17345cdb 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -181,6 +181,14 @@ config TEE
>>>>            This option enables generic TEE mediators support. It 
>>>> allows guests
>>>>            to access real TEE via one of TEE mediators implemented 
>>>> in XEN.
>>>>
>>>> +config XEN_START_ADDRESS
>>>> +       hex "Xen start address: keep default to use platform defined 
>>>> address"
>>>> +       default 0
>>>> +       depends on HAS_MPU
>>>> +       help
>>>> +         This option allows to set the customized address at which 
>>>> Xen will be
>>>> +         linked on MPU systems. This address must be aligned to a 
>>>> page size.
>>>> +
>>>>   source "arch/arm/tee/Kconfig"
>>>>
>>>>   config STATIC_SHM
>>>> diff --git a/xen/arch/arm/platforms/Kconfig 
>>>> b/xen/arch/arm/platforms/Kconfig
>>>> index c93a6b2756..75af48b5f9 100644
>>>> --- a/xen/arch/arm/platforms/Kconfig
>>>> +++ b/xen/arch/arm/platforms/Kconfig
>>>> @@ -1,6 +1,7 @@
>>>>   choice
>>>>          prompt "Platform Support"
>>>>          default ALL_PLAT
>>>> +       default NO_PLAT if HAS_MPU
>>>
>>> I am a bit concerned about this as we will be introducing R52 
>>> specific platform in xen/arch/arm/platforms/
>>>
>>> (For eg 
>>> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/platforms/amd-versal-net.c )
>>>
>>> Thus, we will have to remove this line at that time.
>>>
>>> Can you remove this line, please if it does not cause any issue ?
>>
>> From my understanding of the discussion at Xen Summit, most of the 
>> platform specific code would be moved to something similar to 
>> bootwrapper.
> 
> Yes, but I think bootwrappers are now deprecated.

They are still used on FVP to boot without UEFI/U-boot.

> 
> At least 
> git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git does not seem to be active and https://github.com/artagnon/boot-wrapper-aarch64 looks archived.
I expect bootwrappers to be fairly stable. So I am not entirely 
surprised that it is not "active".

> 
>>
>> So do you still actually need to have code in Xen for setting up the 
>> timer?
> 
> I think we can ignore it for now.
> 
> Just for information, we are using the platform specific code to achieve 
> the following :-
> 
> 1. Set up the timer and CNTFRQ
> 
> 2. Set up the secondary boot address and start the secondary cores.

This sounds like code that could be added in bootwrapper (or similar). 
So Xen (or any other OS/kernel) can share the logic and can rely on 
spin-table/PSCI for SMP bring-up.

Cheers,

-- 
Julien Grall

