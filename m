Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59C970A1D
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2024 23:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792763.1202554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snPEF-0003tP-Oc; Sun, 08 Sep 2024 21:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792763.1202554; Sun, 08 Sep 2024 21:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snPEF-0003r3-Ly; Sun, 08 Sep 2024 21:13:51 +0000
Received: by outflank-mailman (input) for mailman id 792763;
 Sun, 08 Sep 2024 21:13:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snPEE-0003qx-A6
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2024 21:13:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snPED-0001Jo-Kq; Sun, 08 Sep 2024 21:13:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snPED-000358-F2; Sun, 08 Sep 2024 21:13:49 +0000
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
	bh=H+GgYK6MHVw2Q2T2dc0lJGTslt1zsd/Ip5S19QQRkUQ=; b=udLU4whlIitt2itcCXBSnMubH1
	eW/S3YJlxYSAWF1vOEffNeCn6GpT3C0cUussb0rtv5UCyRsGuVCPGLuggG3eJz2y1OxmRHIqnrvBQ
	ilxqZbQglTY4ECOFDkDVqADGvxsZE2hqR+9yt5vL7naB1k6KQd5k82k0OJycsOEopwC8=;
Message-ID: <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
Date: Sun, 8 Sep 2024 22:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
 <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/09/2024 15:48, Ayan Kumar Halder wrote:
> 
> On 28/08/2024 15:49, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 23/08/2024 17:31, Ayan Kumar Halder wrote:
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
>>> So in this patch, we reuse the existing arm/platforms to store
>>> Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
>>> kind of MPU based platform's parameters. So we define default
>>> `XEN_START_ADDRESS` in the MPU specific header file.
>>
>> This seems a left-over from as previous work?
> Yes, this needs to be removed.
>>
>>>
>>> We also introduce one Kconfig option for users to override the
>>> default Xen start address of selected platform, if they think
>>> the default address doesn't suit their scenarios. For this
>>> Kconfig option, we use an unaligned address "0xffffffff" as the
>>> default value to indicate that users haven't used a customized
>>> Xen start address.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>   xen/arch/arm/Kconfig                  | 11 +++++++++++
>>>   xen/arch/arm/include/asm/mpu/layout.h | 25 +++++++++++++++++++++++++
>>>   2 files changed, 36 insertions(+)
>>>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 686948cefd..d722ca690c 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -23,6 +23,17 @@ config ARCH_DEFCONFIG
>>>       default "arch/arm/configs/arm32_defconfig" if ARM_32
>>>       default "arch/arm/configs/arm64_defconfig" if ARM_64
>>>   +config XEN_START_ADDRESS
>>> +    hex "Xen start address: keep default to use platform defined 
>>> address"
>>> +    default 0xFFFFFFFF
>>> +    depends on MPU
>>> +    help
>>> +      This option is allowed to set customized address at which Xen 
>>> will be
>>> +      linked on MPU systems.
>>
>> I don't quite understand what you mean by "allowed".
> 
> I will rephrase this as ...
> 
> "Used to set customized address at which which Xen will be linked
> 
> on MPU systems. This address must be aligned to a page size.
> 0xFFFFFFFF is used as the default value to indicate that user hasn't
> customized this address."

Reading this comment, I would like to ask some clarification. In the 
context of the MPU how do you define a page size? The definition is 
pretty clear when using the MMU because the granularity if defined by 
the HW. But for the MPU, it is a bit blur. Is it still 4KB? If so, is it 
actually realistic (we don't have that many MPU regions)?

Cheers,

-- 
Julien Grall

