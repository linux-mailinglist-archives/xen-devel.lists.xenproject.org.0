Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606A623268
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 19:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441104.695393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ospka-0001Cx-4y; Wed, 09 Nov 2022 18:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441104.695393; Wed, 09 Nov 2022 18:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ospka-0001AN-26; Wed, 09 Nov 2022 18:24:36 +0000
Received: by outflank-mailman (input) for mailman id 441104;
 Wed, 09 Nov 2022 18:24:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ospkZ-0001AH-Bm
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 18:24:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ospkZ-0004tj-1x; Wed, 09 Nov 2022 18:24:35 +0000
Received: from [15.248.2.52] (helo=[10.24.69.10])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ospkY-0003MC-RQ; Wed, 09 Nov 2022 18:24:34 +0000
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
	bh=9zMIK7DpsgJeo5tLKbfv50cp3mrgjzZTkT6a662sn1E=; b=D0hf34bApVmLBs9RgNJq8S6/e8
	Am8tKuNA0BI2IY9r5u50aeNzCrrIWWkMqwRcqN5pdypLLporYvTKfFPiHYV3c2ZaMtzHaKdWWdpOM
	cr+UqBwCdellft3JDIEjJudb3uk0B90kXPh5m5D1oy09SUavuhjylhMmRinLGMzcAm/8=;
Message-ID: <e2a1233c-c001-9553-7abe-de97e96a650e@xen.org>
Date: Wed, 9 Nov 2022 18:24:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
 <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
 <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/11/2022 04:55, Wei Chen wrote:
> Hi Julien,

Hi Wei,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年11月7日 3:20
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Jiamei Xie <Jiamei.Xie@arm.com>
>> Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP
>> BaseR platform
>>
>>
>>
>> On 04/11/2022 10:07, Wei Chen wrote:
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
>>> So in this patch, we reuse the existing arm/platforms to store
>>> Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
>>> kind of FVP BaseR platform's parameters. So we define default
>>> `XEN_START_ADDRESS` for FVP BaseR in its platform file.
>>>
>>> We also introduce one Kconfig option for users to override the
>>> default Xen start address of selected platform, if they think
>>> the default address doesn't suit their scenarios. For this
>>> Kconfig option, we use an unaligned address "0xffffffff" as the
>>> default value to indicate that users haven't used a customized
>>> Xen start address.
>>>
>>> And as we introduced Armv8-R platforms to Xen, that means the
>>> existed Arm64 platforms should not be listed in Armv8-R platform
>>> list, so we add !ARM_V8R dependency for these platforms.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>>> ---
>>>    xen/arch/arm/Kconfig                           | 11 +++++++++++
>>>    xen/arch/arm/include/asm/platforms/fvp_baser.h | 14 ++++++++++++++
>>
>> I looked at the content of fvp_baser.h after this series is applied.
>> There are a bit of boiler plate that I expect to be part for other
>> platforms. In particular...
>>
>>>    xen/arch/arm/platforms/Kconfig                 | 16 +++++++++++++---
>>>    3 files changed, 38 insertions(+), 3 deletions(-)
>>>    create mode 100644 xen/arch/arm/include/asm/platforms/fvp_baser.h
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index ad592367bd..ac276307d6 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -138,6 +138,17 @@ config TEE
>>>    	  This option enables generic TEE mediators support. It allows
>> guests
>>>    	  to access real TEE via one of TEE mediators implemented in XEN.
>>>
>>> +config XEN_START_ADDRESS
>>> +	hex "Xen start address: keep default to use platform defined
>> address"
>>> +	default 0xFFFFFFFF
>>
>> ... this default value will need to be tested everywhere. At least for
>> now, I think you can avoid the per platform header by using the Kconfig
>> to select the proper address (see the config for selecting early printk
>> address).
>>
>> This will also avoids to use an invalid value here.
>>
> 
> We had considered to use Kconfig to define the start addresses of v8R64
> platforms (prompt users to input the address). But we also want to provide
> a default start address for each platform (Discussed in [1], header for
> default value, Kconfig option for customized address).
Why do you want to provide a default value? And how it is guaranteed 
that it will work for most of the users?

> 
> We also had thought to use Kconfig to define a default start address
> for each platform like what we had done for early printk in RFC[2].
> But this method has been deprecated.

Most of the current Xen is board agnostic except the UART. We push back 
the addition of new one because the address can be found in the firmware 
table and I wanted to avoid increase the number of option (there are 
dozens of platform out...).

> 
> So if we don’t use header files, just use the Kconfig, we can't
> provide a default start address for platforms, and have to force users
> to enter the start address.

I am not sure I see the problem to force the user to enter the start 
address. My worry with per-platform default value is we end up to force 
each vendor to provide an header in order to boot Xen.

I think it would be better to provide a config tailored for that 
platform (whether it is part of Xen can be debatable). This would allow 
a user to try a release Xen on their platform with zero changes in the code.

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
>>
>> Is there any reason to create a new Kconfig rather than using MPU?
>>
> 
> Did you mean FVP_BASER? If yes, we want to give each board a MACRO
> to indicate its specific configurations. In current series, this MACRO
> only be used for board specific start address.

See above for this.

> 
> If you meant Armv8R, that's because Armv8R does not equal to MPU.

I am not entirely sure to understand. Are you saying that an existing 
Xen can boot on Armv8R?

Cheers,

-- 
Julien Grall

