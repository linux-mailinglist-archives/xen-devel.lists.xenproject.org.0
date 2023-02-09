Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55C6907AE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492387.761910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5Md-0007fe-Ug; Thu, 09 Feb 2023 11:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492387.761910; Thu, 09 Feb 2023 11:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5Md-0007d5-Rs; Thu, 09 Feb 2023 11:45:19 +0000
Received: by outflank-mailman (input) for mailman id 492387;
 Thu, 09 Feb 2023 11:45:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ5Mc-0007cy-VZ
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:45:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ5Mc-0002S0-JL; Thu, 09 Feb 2023 11:45:18 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ5Mc-0006tl-Ah; Thu, 09 Feb 2023 11:45:18 +0000
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
	bh=K7uFwIjAWN/sUvp8ClQquJ09JAmT7kQoYn3AN+LsTLI=; b=iyIWR9yrpRxsQFfPFVyEsA7JMb
	vK3vCLi7VesXIlxTRYs0vir4fVyHm8J+YsYjt8OznDcXiACAcvGNPI+mVVPYGNQ35RTvr0RaarVVn
	PppLQcDU3P/we/B4DWPl9LgjnMnHiybg/2M8C3Ip96r8Mu9mO0Bfl1M4rsnQ0B6CZEg8=;
Message-ID: <3655dce9-f795-3d37-3236-d95d74c865ff@xen.org>
Date: Thu, 9 Feb 2023 11:45:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-12-ayan.kumar.halder@amd.com>
 <ae501ac3-af2d-c4cb-3ea9-04dd946cdc51@xen.org>
 <eb4d4da7-0251-6efc-1311-6b236fdca6c4@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eb4d4da7-0251-6efc-1311-6b236fdca6c4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/02/2023 15:34, Ayan Kumar Halder wrote:
> 
> On 20/01/2023 11:06, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 17/01/2023 17:43, Ayan Kumar Halder wrote:
>>> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
>>> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
>>> "Virtualization Translation Control Register" for the bit descriptions.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>
>>> v1 - New patch.
>>>
>>>   xen/arch/arm/p2m.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index 948f199d84..cfdea55e71 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>>>       register_t val = 
>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>     #ifdef CONFIG_ARM_32
>>> -    if ( p2m_ipa_bits < 40 )
>>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>>           panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>>                 p2m_ipa_bits);
>>>   -    printk("P2M: 40-bit IPA\n");
>>> -    p2m_ipa_bits = 40;
>>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>>> +    p2m_ipa_bits = PADDR_BITS;
>>> +#ifdef CONFIG_ARM_PA_32
>>> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
>>> +#else
>>>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>> +#endif
>>
>> I am wondering whether this is right time to switch to an array like 
>> the arm64 code? This would allow to use 32-bit IPA also when Xen 
>> support 64-bit physical address.
> 
> In AArch64, we use ID_AA64MMFR0_EL1.PARange to determine the physical 
> address range supported at runtime. This is then used as an index into 
> pa_range_info[] to determine t0sz, root_order, etc.

It is using both the ID_AA64MMFR0_EL1 but also p2m_ipa_bits to decide 
the size.

> 
> However, for AArch32 I do not see an equivalent register (similar to 
> ID_AA64MMFR0_EL1) or any register to determine the physical address 
> range. Thus, I will prefer to keep the code as it is unless you suggest 
> any alternative.

I looked at the Arm Arm and indeed it doesn't look like there are 
equivalent for ID_AA64MMFR0_EL1.PARange.

However, my point was less about reading the system register but more 
about the fact we could have the code a bit more generic and avoid the 
assumption that PADDR_BITS is only modified when CONFIG_ARM_PA_32 is set.

Cheers,

-- 
Julien Grall

