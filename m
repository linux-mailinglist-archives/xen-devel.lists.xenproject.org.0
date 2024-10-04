Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21E990912
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810549.1223261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swl66-0003TN-HA; Fri, 04 Oct 2024 16:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810549.1223261; Fri, 04 Oct 2024 16:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swl66-0003RN-EV; Fri, 04 Oct 2024 16:24:06 +0000
Received: by outflank-mailman (input) for mailman id 810549;
 Fri, 04 Oct 2024 16:24:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1swl64-0003RH-Ny
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:24:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1swl63-0000FY-MG; Fri, 04 Oct 2024 16:24:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1swl63-0007gt-G5; Fri, 04 Oct 2024 16:24:03 +0000
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
	bh=Fv7Q7ZScwG3I+6rJMqComt+3CkPefeDVDEgLEYi5kk8=; b=pXpx/Z0/T2sjA1TR+Nu4XCXWMq
	BPWItIQDMt9dnf/2XGr74oUo3h2eMrqD4G3L2vqMPp2DBgg1zbFi5hOf5KRsfO3LCkzuqcX7ruaY6
	qO5ujRxuViL8PwffxNbpP/FVrAs7dOPh17jUae7JFaUv2P7d6N+G/YGbbKq8yRgHZaN0=;
Message-ID: <a24807bd-5224-4110-bc0e-946287f5c90e@xen.org>
Date: Fri, 4 Oct 2024 17:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
Content-Language: en-GB
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
 <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
 <b8419295-cc63-41b3-9f2d-277d81e5f85a@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b8419295-cc63-41b3-9f2d-277d81e5f85a@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/10/2024 16:37, Andrei Cherechesu wrote:
> Hi Julien, Stefano,

Hi Andrei,

> 
> On 01/10/2024 13:01, Julien Grall wrote:
>> Hi Andrei,
>>
>> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>
>>> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
>>>
>>> S32CC platforms use the NXP LINFlexD UART driver for
>>> console by default, and rely on Dom0 having access to
>>> SCMI services for system-level resources from firmware
>>> at EL3.
>>>
>>> Platform-related quirks will be addressed in following
>>> commits.
>>
>> I don't see any specific quirks in the series. Are you intended to send follow-up?
>>
>> [...]
> 
> Well, we could use an opinion on some SoC erratum implementation
> and if it would be acceptable for you or not, from any of
> the ARM maintainers.
> 
> The erratum is about some TLB Invalidate (tlbi) instruction
> variants (by Virtual Address) which are handled incorrectly
> in some cases (for some VAs), and that need to be replaced
> with broader versions.

Can you provide more details:
   1. Is this a processor issue?
   2. Which VAs are affected?
   3. What is the impact if the erratum is hit?
   3. Do we need to do anything on the behalf of the guests?

> It doesn't apply for all S32CC platforms, but we can use the
> Host DT compatible to identify this. My idea is that we define
> a platform quirk for this and check for it using
> platform_has_quirk().
 > Then, we either:>      - modify the definition for the affected 
'tlbi' variant
>      in arm64/flushtlb.h to actually execute the broader one
>      if needed
> or:
>      - define a new wrapper for the tlbi variant we want to
>      replace the affected one with
>      - check for this quirk before its usage and call the
>      more potent version if needed (there's only one
>      occurrence of usage for the affected version).
> 
> Number 2 seems better to me, it's more customizable and
> it's similar to the existing handling for
> PLATFORM_QUIRK_GIC_64K_STRIDE for some other Arm platform.

I need a bit more details first (see my questions above). But if there 
are not many VAs affected, then we may be able to re-order the Xen 
memory layout to avoid the VAs. So we wouldn't need any specific change 
in the TLB flush operations.

>>> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
>>> index bec6e55d1f..2c304b964d 100644
>>> --- a/xen/arch/arm/platforms/Makefile
>>> +++ b/xen/arch/arm/platforms/Makefile
>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>>>    obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>>>    obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>>>    obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>>> +obj-$(CONFIG_S32CC_PLATFORM)  += s32cc.o
>>>    obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>>>    obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
>>> diff --git a/xen/arch/arm/platforms/s32cc.c b/xen/arch/arm/platforms/s32cc.c
>>> new file mode 100644
>>> index 0000000000..f99a2d56f6
>>> --- /dev/null
>>> +++ b/xen/arch/arm/platforms/s32cc.c
>>
>> We only add a new platform if there are platform specific hook to implement. AFAICT, you don't implement any, so it should not be necessary.
> 
> Like I mentioned above, there's some erratum workaround which
> could make use of the platform_quirk() callback, that we want
> to send in the near future.

I think it would be best to introduce platforms/s32cc.c at that point.

Cheers,

-- 
Julien Grall


