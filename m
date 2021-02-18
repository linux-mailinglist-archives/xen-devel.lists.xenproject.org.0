Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8831E829
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 10:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86522.162530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCg3a-0005t2-Jn; Thu, 18 Feb 2021 09:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86522.162530; Thu, 18 Feb 2021 09:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCg3a-0005sd-Gj; Thu, 18 Feb 2021 09:57:10 +0000
Received: by outflank-mailman (input) for mailman id 86522;
 Thu, 18 Feb 2021 09:57:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCg3Y-0005sY-QF
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 09:57:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCg3X-0002vZ-4P; Thu, 18 Feb 2021 09:57:07 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCg3W-0000AL-NT; Thu, 18 Feb 2021 09:57:06 +0000
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
	bh=vEjg5XJVHUXx9pXONWEXqqHBcvyqRSVXUjBeUHcGnug=; b=gpFRm6of+x+3vRmwoaWzXZdUq9
	kXGJMysOv7E9FttYy8lXshmjj9XvrD6YWQpljuhBwqFm2+dHuA6fAkLoY1hJHyONrYptM9w17aIPb
	4NiVPngiOUtMFc03ZPgdTKO81LkWVs41bjpGczfiC6PXsCG5lOyEn3oJDprHJgv3lKww=;
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
 <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <0be0196f-5b3f-73f9-5ab7-7a54faabec5c@xen.org>
Date: Thu, 18 Feb 2021 09:57:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/02/2021 23:54, Stefano Stabellini wrote:
> On Wed, 17 Feb 2021, Julien Grall wrote:
>> On 17/02/2021 02:00, Stefano Stabellini wrote:
>>> Hi all,
>>>
>>> Today Linux uses the swiotlb-xen driver (drivers/xen/swiotlb-xen.c) to
>>> translate addresses for DMA operations in Dom0. Specifically,
>>> swiotlb-xen is used to translate the address of a foreign page (a page
>>> belonging to a domU) mapped into Dom0 before using it for DMA.
>>>
>>> This is important because although Dom0 is 1:1 mapped, DomUs are not. On
>>> systems without an IOMMU swiotlb-xen enables PV drivers to work as long
>>> as the backends are in Dom0. Thanks to swiotlb-xen, the DMA operation
>>> ends up using the MFN, rather than the GFN.
>>>
>>>
>>> On systems with an IOMMU, this is not necessary: when a foreign page is
>>> mapped in Dom0, it is added to the Dom0 p2m. A new GFN->MFN translation
>>> is enstablished for both MMU and SMMU. Dom0 could safely use the GFN
>>> address (instead of the MFN) for DMA operations and they would work. It
>>> would be more efficient than using swiotlb-xen.
>>>
>>> If you recall my presentation from Xen Summit 2020, Xilinx is working on
>>> cache coloring. With cache coloring, no domain is 1:1 mapped, not even
>>> Dom0. In a scenario where Dom0 is not 1:1 mapped, swiotlb-xen does not
>>> work as intended.
>>>
>>>
>>> The suggested solution for both these issues is to add a new feature
>>> flag "XENFEAT_ARM_dom0_iommu" that tells Dom0 that it is safe not to use
>>> swiotlb-xen because IOMMU translations are available for Dom0. If
>>> XENFEAT_ARM_dom0_iommu is set, Linux should skip the swiotlb-xen
>>> initialization. I have tested this scheme with and without cache
>>> coloring (hence with and without 1:1 mapping of Dom0) on ZCU102 and it
>>> works as expected: DMA operations succeed.
>>>
>>>
>>> What about systems where an IOMMU is present but not all devices are
>>> protected?
>>>
>>> There is no way for Xen to know which devices are protected and which
>>> ones are not: devices that do not have the "iommus" property could or
>>> could not be DMA masters.
>>>
>>> Perhaps Xen could populate a whitelist of devices protected by the IOMMU
>>> based on the "iommus" property. It would require some added complexity
>>> in Xen and especially in the swiotlb-xen driver in Linux to use it,
>>> which is not ideal.
>>
>> You are trading a bit more complexity in Xen and Linux with a user will may
>> not be able to use the hypervisor on his/her platform without a quirk in Xen
>> (see more below).
>>
>>> However, this approach would not work for cache
>>> coloring where dom0 is not 1:1 mapped so the swiotlb-xen should not be
>>> used either way
>>
>> Not all the Dom0 Linux kernel will be able to work with cache colouring. So
>> you will need a way for the kernel to say "Hey I am can avoid using swiotlb".
> 
> A dom0 Linux kernel unmodified can work with Xen cache coloring enabled.

Really? I was expecting Linux to configure the DMA transaction to use 
the MFN for foreign pages. So a mapping GFN == MFN would be necessary.

> The swiotlb-xen is unneeded and also all the pfn_valid() checks to detect
> if a page is local or foreign don't work as intended. 

I am not sure to understand this. Are you saying that Linux will 
"mistakenly" consider the foreign page as local? Therefore, it would 
always use the GFN rather than MFN?

> However, it still
> works on systems where the IOMMU can be relied upon. That's because the
> IOMMU does the GFN->MFN translations, and also because both swiotlb-xen
> code paths (cache flush local and cache flush via hypercall) work.
> 
> Also considering that somebody that enables cache coloring has to know
> the entire system well, I don't think we need a runtime flag from Linux
> to say "Hey I can avoid using swiotlb".

I think we should avoid to hardcode any decision again. Otherwise, 
sooner or later this will come back to bite us.

[...]

>>> How to set XENFEAT_ARM_dom0_iommu?
>>>
>>> We could set XENFEAT_ARM_dom0_iommu automatically when
>>> is_iommu_enabled(d) for Dom0. We could also have a platform specific
>>> (xen/arch/arm/platforms/) override so that a specific platform can
>>> disable XENFEAT_ARM_dom0_iommu. For debugging purposes and advanced
>>> users, it would also be useful to be able to override it via a Xen
>>> command line parameter.
>> Platform quirks should be are limited to a small set of platforms.
>>
>> In this case, this would not be only per-platform but also per-firmware table
>> as a developer can decide to remove/add IOMMU nodes in the DT at any time.
>>
>> In addition to that, it means we are introducing a regression for those users
>> as Xen 4.14 would have worked on there platform but not anymore. They would
>> need to go through all the nodes and find out which one is not protected.
>>
>> This is a bit of a daunting task and we are going to end up having a lot of
>> per-platform quirk in Xen.
>>
>> So this approach selecting the flag is a no-go for me. FAOD, the inverted idea
>> (i.e. only setting XENFEAT_ARM_dom0_iommu per-platform) is a no go as well.
>>
>> I don't have a good idea how to set the flag automatically. My
>> requirement is newer Xen should continue to work on all supported
>> platforms without any additional per-platform effort.
> 
> Absolutely agreed.
> 
> 
> One option would be to rename the flag to XENFEAT_ARM_cache_coloring and
> only set it when cache coloring is enabled.  Obviously you need to know
> what you are doing if you are enabling cache coloring. If we go down
> that route, we don't risk breaking compatibility with any platforms.
> Given that cache coloring is not upstream yet (upstreaming should start
> very soon), maybe the only thing to do now would be to reserve a XENFEAT
> number.

At least in this context, I can't see how the problem described is cache 
coloring specific. Although, we may need to expose such flag for other 
purpose in the future.

> 
> But actually it was always wrong for Linux to enable swiotlb-xen without
> checking whether it is 1:1 mapped or not. Today we enable swiotlb-xen in
> dom0 and disable it in domU, while we should have enabled swiotlb-xen if
> 1:1 mapped no matter dom0/domU. (swiotlb-xen could be useful in a 1:1
> mapped domU driver domain.)
> 
> 
> There is an argument (Andy was making on IRC) that being 1:1 mapped or
> not is an important information that Xen should provide to the domain
> regardless of anything else.
> 
> So maybe we should add two flags:
> 
> - XENFEAT_direct_mapped
> - XENFEAT_not_direct_mapped

I am guessing the two flags is to allow Linux to fallback to the default 
behavior (depending on dom0 vs domU) on older hypervisor On newer 
hypervisors, one of this flag would always be set. Is that correct?

> 
> To all domains. This is not even ARM specific. Today dom0 would get
> XENFEAT_direct_mapped and domUs XENFEAT_not_direct_mapped. With cache
> coloring all domains will get XENFEAT_not_direct_mapped. With Bertrand's
> team work on 1:1 mapping domUs, some domUs might start to get
> XENFEAT_direct_mapped also one day soon.
> 
> Now I think this is the best option because it is descriptive, doesn't
> imply anything about what Linux should or should not do, and doesn't
> depend on unreliable IOMMU information.

That's a good first step but this still doesn't solve the problem on 
whether the swiotlb can be disabled per-device or even disabling the 
expensive 1:1 mapping in the IOMMU page-tables.

It feels to me we need to have a more complete solution (not necessary 
implemented) so we don't put ourself in the corner again.

> Instead, if we follow my original proposal of using
> XENFEAT_ARM_dom0_iommu and set it automatically when Dom0 is protected
> by IOMMU, we risk breaking PV drivers for platforms where that protection
> is incomplete. I have no idea how many there are out there today. 

This can virtually affect any platform as it is easy to disable an IOMMU 
in the firmware table.

> I have
> the feeling that there aren't that many but I am not sure. So yes, it
> could be that we start passing XENFEAT_ARM_dom0_iommu for a given
> platform, Linux skips the swiotlb-xen initialization, actually it is
> needed for a network/block device, and a PV driver breaks. I can see why
> you say this is a no-go.
> 
> 
> Third option. We still use XENFEAT_ARM_dom0_iommu but we never set
> XENFEAT_ARM_dom0_iommu automatically. It needs a platform specific flag
> to be set. We add the flag to xen/arch/arm/platforms/xilinx-zynqmp.c and
> any other platforms that qualify. Basically it is "opt in" instead of
> "opt out". We don't risk breaking anything because platforms would have
> XENFEAT_ARM_dom0_iommu disabled by default.
Well, yes you will not break other platforms. However, you are still at 
risk to break your platform if the firmware table is updated and disable 
some but not all IOMMUs (for performance concern, brokeness...).

> Still, I think the
> XENFEAT_not/direct_mapped route is much cleaner and simpler.

The XENFEAT_{not,}_direct_mapped also doesn't rely on every platform to 
add code in Xen to take advantage of new features.

Cheers,

-- 
Julien Grall

