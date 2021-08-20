Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3C3F2847
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 10:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169316.309265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGzl5-0003Vk-KW; Fri, 20 Aug 2021 08:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169316.309265; Fri, 20 Aug 2021 08:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGzl5-0003Tv-HH; Fri, 20 Aug 2021 08:20:11 +0000
Received: by outflank-mailman (input) for mailman id 169316;
 Fri, 20 Aug 2021 08:20:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGzl3-0003Tp-DQ
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 08:20:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGzl2-0005P1-BD; Fri, 20 Aug 2021 08:20:08 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGzl2-000809-4z; Fri, 20 Aug 2021 08:20:08 +0000
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
	bh=4UkdtyzA1SUbJVk3SXx5UndA57NHc1yZGmbWj5iTt8I=; b=etvKOaLMVc1/8jyJp8M+afSIvq
	8eg3JjXphy7UXTyVTC4tpMCXebLyWpiynwDdtyOrVTYfKsHyb8TvuZCEru+iq6JOdRCDeeYAwXifX
	nwhpkkbKWSuxLfNYUx+ifMQ0u8RXfy9YgrQVGm5qNdq1mGPALorqxcVIJllUmNusyB8I=;
Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
 <DB9PR08MB68572A84F6A73644C4FE3F609EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <35fdd7c0-0607-e2b6-776d-adf9eea2c0e2@xen.org>
Date: Fri, 20 Aug 2021 09:20:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB68572A84F6A73644C4FE3F609EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 20/08/2021 03:04, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月19日 21:28
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width
>> when platform is not set
>>
>> Hi,
>>
>> On 11/08/2021 11:23, Wei Chen wrote:
>>> From: Hongda Deng <Hongda.Deng@arm.com>
>>>
>>> In current code, arch_get_dma_bitsize will return 32 when platorm
>>> or platform->dma_bitsize is not set. It's not resonable, for Arm,
>>
>> s/resonable/reasonable/
>>
> 
> Ok
> 
>>> we don't require to reserve DMA memory. So we set dma_bitsize always
>>> be 0. In NO-NUMA system, arch_get_dma_bitsize will not be invoked,
>>> so dma_bitsize will not be overrided by this function.
>>
>> arch_get_dma_bitsize() is also used to allocate dom0 memory. We need to
>> be able to allocate some DMA-able memory that can be used by every devices.
>>
>>> But in NUMA
>>> system, once the online nodes are greater than 1, this function will
>>> be invoked. The dma_bitsize will be limited to 32. That means, only
>>> first 4GB memory can be used for DMA. But that's against our hardware
>>> design. We don't have that kind of restriction on hardware.
>>
>> What do you mean by "hardware design"? Are you referring to the server
>> you boot Xen on?
>>
> 
> Yes. I will change it to some neutral words. something like:
> "But that could not reflect some hardware's real DMA ability. They may not
> have kind of restriction on hardware." ?

The thing is DMA ability is not about the platform itself. It is more 
about the devices (this could just be a PCI card you just plugged). What 
you seem to suggest is no-one will ever plug such card on your platform. 
Is that correct?

> 
> 
>> Anyway, there are plenty of platform out that have devices which can't
>> DMA into memory above 32-bit. On RPI, this is even lower (30-bit).
>>
>> So I would be cautious to change the default limit.
>>
> 
> How about return 0 when platform doesn't specify the limit?
> In my opinion, arbitrary to give 32 on AArch64 doesn't make sense.
We have to care about the common use-case. We added this restriction a 
few years ago because we had a few reports of users using only 32-bit 
DMA capable device.

> But as you mentioned, if Xen is running on a platform with DMA limitation,
> but we have not listed this platform in Xen supported list, Xen cannot
> get DMA limit from platform->dma_bitsize. In this case, return 0 will
> also cause some issue.
> 
>> At the moment, the only place on Arm where we need DMA-able memory is
>> for dom0. This is allocated at boot and can't change afterwards (for now).
>>
> 
> For Dom0, we squash the patch#5 into this patch?

Let me answer with another question. Why should we modify the Arm code 
rather than the common code? IOW...

> 
>> So I would explore to remove the NUMA check for drop the DMA zone. FAOD,
>> both suggestion are for Arm only. For x86, they need to be kept.
>>
> 
> Without introducing new flag, such as lowmem_for_dma, it's a little
> hard to skip the numa node check. Unless we crudely add #ifdef ARCH to
> common code, which is not what we want to see ...
>        if ( !dma_bitsize && (num_online_nodes() > 1) )
>            dma_bitsize = arch_get_dma_bitsize();

... Why do you think we need this check on Arm when NUMA is enabled?

We can discuss how to remove it once this is answered.

Cheers,

-- 
Julien Grall

