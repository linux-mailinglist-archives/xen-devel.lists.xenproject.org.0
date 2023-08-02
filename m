Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6872076D6FA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 20:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575117.900898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRGlH-0003kv-3G; Wed, 02 Aug 2023 18:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575117.900898; Wed, 02 Aug 2023 18:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRGlH-0003it-0G; Wed, 02 Aug 2023 18:39:55 +0000
Received: by outflank-mailman (input) for mailman id 575117;
 Wed, 02 Aug 2023 18:39:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRGlF-0003in-NY
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 18:39:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRGlF-0001i1-3K; Wed, 02 Aug 2023 18:39:53 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.26.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRGlE-0001X1-OF; Wed, 02 Aug 2023 18:39:52 +0000
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
	bh=GzOA+EIFInXB9PUvby4YlhpdN8FpNm3/+NnR918g4kM=; b=ioP0H6bbkhK5Q57k5XpaiIFt0x
	LpmbxNOCF1yX9W2wdScczioEDrjjpVD02i2pJx/1rsN5AFdUqMpew8GW8/sMeVFsbgWcOUy7onOJH
	/F4N+CJ19mpMiV7mzx/GG7At0bmFvNevbk4pKI8kSZWq61UsfalKsj7YMCUEMRhjaZCQ=;
Message-ID: <46a985da-03e9-b05d-0107-7c54526c71f9@xen.org>
Date: Wed, 2 Aug 2023 19:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <9B62D8DC-2425-42A4-A95F-BC41FA27238D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9B62D8DC-2425-42A4-A95F-BC41FA27238D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/08/2023 18:54, Luca Fancellu wrote:
> 
> 
>> On 2 Aug 2023, at 18:39, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 02/08/2023 16:05, Luca Fancellu wrote:
>>>> On 2 Aug 2023, at 15:48, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 02/08/2023 16:42, Luca Fancellu wrote:
>>>>>
>>>>>
>>>>>> On 2 Aug 2023, at 15:26, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> Hi Luca,
>>>>>>
>>>>>> On 02/08/2023 15:53, Luca Fancellu wrote:
>>>>>>>
>>>>>>>
>>>>>>> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
>>>>>>> when needed, the option is active by default.
>>>>>>>
>>>>>>> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
>>>>>>> the GICv2 emulation for guests, it is required only when using GICV2
>>>>>>> driver, otherwise using GICV3 it is optional and can be deselected
>>>>>>> if the user doesn't want to offer the vGICv2 interface to guests or
>>>>>>> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
>>>>>>>
>>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>>> ---
>>>>>>> xen/arch/arm/Kconfig        | 13 +++++++++++++
>>>>>>> xen/arch/arm/Makefile       |  4 ++--
>>>>>>> xen/arch/arm/domain_build.c |  4 ++++
>>>>>>> xen/arch/arm/gic-v3.c       |  4 ++++
>>>>>>> xen/arch/arm/vgic.c         |  2 ++
>>>>>>> 5 files changed, 25 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>>> index fd57a82dd284..dc702f08ace7 100644
>>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>>> @@ -78,6 +78,14 @@ config ARM_EFI
>>>>>>>          UEFI firmware. A UEFI stub is provided to allow Xen to
>>>>>>>          be booted as an EFI application.
>>>>>>>
>>>>>>> +config GICV2
>>>>>> So, now it would be possible to deselect both GIC drivers and Xen would not complain when building.
>>>>>> This means that Xen would fail on boot without any message as it happens before serial driver initialization.
>>>>>> Since having GIC driver built in is a must-have I think we need to make sure that at least one is enabled.
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> I tried and I had:
>>>>>
>>>>> Starting kernel ...
>>>>>
>>>>> - UART enabled -
>>>>> - Boot CPU booting -
>>>>> - Current EL 0000000000000008 -
>>>>> - Initialize CPU -
>>>>> - Turning on paging -
>>>>> - Zero BSS -
>>>>> - Ready -
>>>>> (XEN) Checking for initrd in /chosen
>>>>> (XEN) RAM: 0000000080000000 - 00000000feffffff
>>>>> (XEN) RAM: 0000000880000000 - 00000008ffffffff
>>>>> (XEN)
>>>>> (XEN) MODULE[0]: 0000000084000000 - 000000008415d000 Xen
>>>>> (XEN) MODULE[1]: 00000000fd6c5000 - 00000000fd6c8000 Device Tree
>>>>> (XEN) MODULE[2]: 0000000080080000 - 00000000814f1a00 Kernel
>>>>> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
>>>>> (XEN)  RESVD[1]: 0000000018000000 - 00000000187fffff
>>>>> (XEN)
>>>>> (XEN)
>>>>> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart dtuart=serial0 bootscrub=0
>>>>> (XEN) PFN compression on bits 20...22
>>>>> (XEN) Domain heap initialised
>>>>> (XEN) Booting using Device Tree
>>>>> (XEN) Platform: Generic System
>>>>> (XEN)
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 0:
>>>>> (XEN) Unable to find compatible GIC in the device tree
>>>>> (XEN) ****************************************
>>>>> (XEN)
>>>>> (XEN) Manual reset required ('noreboot' specified)
>>>> Having early printk enabled all the time is not common and not enabled in release builds FWIK.
>>
>> There are a lot of information printed before the console is properly brought up. I wonder if we should look at adding early console like Linux does?
>>
>>>> So in general, user would just see "Starting kernel" from u-boot and had to debug what's going on.
>>>>
>>>>>
>>>>> Wouldn’t be enough to suggest the user that at least one GIC needs to be selected? In the help it
>>>>> also states “if unsure, say Y"
>>>> I always think it is better to meet the users needs by preventing unwise mistakes like unselecting both drivers.
>>>> As always, it is up to maintainers.
>>> Anyway I understand your point, do you think something like that could be ok? I’ve checked and it works, it
>>> compile only if at least one GIC driver is enabled
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 264d2f2d4b09..85b4a7f08932 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -1096,6 +1096,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>         preinit_xen_time();
>>>   +    /* Don't build if at least one GIC driver is enabled */
>>> +    BUILD_BUG_ON(!(IS_ENABLED(CONFIG_GICV3) || IS_ENABLED(CONFIG_GICV2)
>>> +                 || IS_ENABLED(CONFIG_NEW_VGIC)));
>> randconfig in gitlab will now randomly fail compilation. If we want to encode the dependency then it should be done in Kconfig. But I haven't looked at how to do that.
> 
> Ok I’ll investigate it, apart from that, if I find a possible way to have that in Kconfig, do you have any objection on what this patch is doing and the approach taken?

Even if it is not possible, I wouldn't worry too much about it. While I 
agree with Michal that it is not great to have nothing printed, Kconfig 
can only reject configuration that are properly broken. But there are 
plenty that are sound but would still not boot on some platform.

A pretty good example is someone may decide to disable GICv3 and try to 
boot on a GICv3 platform... Another one is not enabling the UART driver 
for your platform :).

The latter there is nothing we can do without earlyprintk. But for the 
former, then we can try to enable the console earlier and/or delay when 
the GIC is initialized.

Cheers,

-- 
Julien Grall

