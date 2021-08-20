Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B164A3F2B14
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169419.309481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2XT-0006eA-Ec; Fri, 20 Aug 2021 11:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169419.309481; Fri, 20 Aug 2021 11:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2XT-0006bZ-BV; Fri, 20 Aug 2021 11:18:19 +0000
Received: by outflank-mailman (input) for mailman id 169419;
 Fri, 20 Aug 2021 11:18:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH2XR-0006bT-O5
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:18:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2XR-0000TI-Hr; Fri, 20 Aug 2021 11:18:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2XR-0005jn-Bv; Fri, 20 Aug 2021 11:18:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XrUklDuPUV70Pkq3TmqSu7P0L92HYTuOCVkrBipAJlE=; b=M9WLK/MSIFgbaDrWxpPL2m6op+
	F1VvIuiiul3nlBAzUtq1RFCeBqfah34mWN8e+CsJpNJ75OZGFZr8JUV+buJ9M1Z5bYEdvSBTxJoG7
	90IDZaVITlqLIKVXq0zvGjiSaVMxe5fRPitvfGdv2RaVoaSRNmc8aX3+oCmjlaBZW03w=;
Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
 <DB9PR08MB68572A84F6A73644C4FE3F609EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <35fdd7c0-0607-e2b6-776d-adf9eea2c0e2@xen.org>
 <DB9PR08MB685782C02B95DB20F4E1626F9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ec9fcd88-5ea6-8e9e-f226-a818276887d0@xen.org>
Date: Fri, 20 Aug 2021 12:18:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB685782C02B95DB20F4E1626F9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 20/08/2021 10:37, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月20日 16:20
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width
>> when platform is not set
>>
>>
>>
>> On 20/08/2021 03:04, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi Wei,
>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2021年8月19日 21:28
>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>>>> sstabellini@kernel.org; jbeulich@suse.com
>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>> Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit
>> width
>>>> when platform is not set
>>>>
>>>> Hi,
>>>>
>>>> On 11/08/2021 11:23, Wei Chen wrote:
>>>>> From: Hongda Deng <Hongda.Deng@arm.com>
>>>>>
>>>>> In current code, arch_get_dma_bitsize will return 32 when platorm
>>>>> or platform->dma_bitsize is not set. It's not resonable, for Arm,
>>>>
>>>> s/resonable/reasonable/
>>>>
>>>
>>> Ok
>>>
>>>>> we don't require to reserve DMA memory. So we set dma_bitsize always
>>>>> be 0. In NO-NUMA system, arch_get_dma_bitsize will not be invoked,
>>>>> so dma_bitsize will not be overrided by this function.
>>>>
>>>> arch_get_dma_bitsize() is also used to allocate dom0 memory. We need to
>>>> be able to allocate some DMA-able memory that can be used by every
>> devices.
>>>>
>>>>> But in NUMA
>>>>> system, once the online nodes are greater than 1, this function will
>>>>> be invoked. The dma_bitsize will be limited to 32. That means, only
>>>>> first 4GB memory can be used for DMA. But that's against our hardware
>>>>> design. We don't have that kind of restriction on hardware.
>>>>
>>>> What do you mean by "hardware design"? Are you referring to the server
>>>> you boot Xen on?
>>>>
>>>
>>> Yes. I will change it to some neutral words. something like:
>>> "But that could not reflect some hardware's real DMA ability. They may
>> not
>>> have kind of restriction on hardware." ?
>>
>> The thing is DMA ability is not about the platform itself. It is more
>> about the devices (this could just be a PCI card you just plugged). What
>> you seem to suggest is no-one will ever plug such card on your platform.
>> Is that correct?
>>
> 
> OK, I understand now. Let's keep 32-bit as default value, but even in this
> case, how about DMA-16 devices? Although these devices are very rare, they
> still exist : )

I haven't heard anyone reporting issues with them on Xen on Arm. So I 
assume that either it works or no-one is using them.

My main point is we need to care about the common use case. 32-bit DMA 
device is still a thing and caused trouble to some of our users (e.g. NXP).

If tomorrow, someone report issue with 16-bit DMA device, then we can 
consider our options how to handle.

>>>> So I would explore to remove the NUMA check for drop the DMA zone. FAOD,
>>>> both suggestion are for Arm only. For x86, they need to be kept.
>>>>
>>>
>>> Without introducing new flag, such as lowmem_for_dma, it's a little
>>> hard to skip the numa node check. Unless we crudely add #ifdef ARCH to
>>> common code, which is not what we want to see ...
>>>         if ( !dma_bitsize && (num_online_nodes() > 1) )
>>>             dma_bitsize = arch_get_dma_bitsize();
>>
>> ... Why do you think we need this check on Arm when NUMA is enabled?
>>
> 
> I didn't think Arm needs, what I said is introduce a flag to disable
> this check for Arm or other Architectures that they don't need this check.
> 
>> We can discuss how to remove it once this is answered.
>>
> 
> I think we can start to discuss it.

How about replacing the second part of the check with a new helper 
arch_have_default_dma_zone() (or a different name)?

Cheers,

-- 
Julien Grall

