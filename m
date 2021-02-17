Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C531DD80
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86347.162070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPsu-0003Oi-IU; Wed, 17 Feb 2021 16:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86347.162070; Wed, 17 Feb 2021 16:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPsu-0003OJ-F6; Wed, 17 Feb 2021 16:41:04 +0000
Received: by outflank-mailman (input) for mailman id 86347;
 Wed, 17 Feb 2021 16:41:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCPss-0003OE-LB
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:41:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPss-0007PD-8U; Wed, 17 Feb 2021 16:41:02 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPsr-000815-TF; Wed, 17 Feb 2021 16:41:02 +0000
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
	bh=e45F8tRQETYHRvyIL3xkas+Ry4NXrjDpWegxK+BOBVM=; b=F3D6NkkAr2JcueAQXK+zKcRTou
	0eRedKyNP8ziMA86mkfJyqFSmAhwRutl4qErm2LInCHEzEwRyYypmeZT/t/CRNd14UvJNo3EOhv/R
	iwwqZtxB3XO80TbPNmyRsdOR50qsK3rWTwdHC0HoqMbZm7Pm6N5UUIBIa3f2rgS3KZgc=;
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
 <505CE19F-B324-4DE2-8EC4-D885780FD17A@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <463b0594-a78b-3f9b-e816-2cbd2a1d16dd@xen.org>
Date: Wed, 17 Feb 2021 16:41:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <505CE19F-B324-4DE2-8EC4-D885780FD17A@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 17/02/2021 15:37, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 17 Feb 2021, at 08:50, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 17/02/2021 02:00, Stefano Stabellini wrote:
>>> Hi all,
>>> Today Linux uses the swiotlb-xen driver (drivers/xen/swiotlb-xen.c) to
>>> translate addresses for DMA operations in Dom0. Specifically,
>>> swiotlb-xen is used to translate the address of a foreign page (a page
>>> belonging to a domU) mapped into Dom0 before using it for DMA.
>>> This is important because although Dom0 is 1:1 mapped, DomUs are not. On
>>> systems without an IOMMU swiotlb-xen enables PV drivers to work as long
>>> as the backends are in Dom0. Thanks to swiotlb-xen, the DMA operation
>>> ends up using the MFN, rather than the GFN.
>>> On systems with an IOMMU, this is not necessary: when a foreign page is
>>> mapped in Dom0, it is added to the Dom0 p2m. A new GFN->MFN translation
>>> is enstablished for both MMU and SMMU. Dom0 could safely use the GFN
>>> address (instead of the MFN) for DMA operations and they would work. It
>>> would be more efficient than using swiotlb-xen.
>>> If you recall my presentation from Xen Summit 2020, Xilinx is working on
>>> cache coloring. With cache coloring, no domain is 1:1 mapped, not even
>>> Dom0. In a scenario where Dom0 is not 1:1 mapped, swiotlb-xen does not
>>> work as intended.
>>> The suggested solution for both these issues is to add a new feature
>>> flag "XENFEAT_ARM_dom0_iommu" that tells Dom0 that it is safe not to use
>>> swiotlb-xen because IOMMU translations are available for Dom0. If
>>> XENFEAT_ARM_dom0_iommu is set, Linux should skip the swiotlb-xen
>>> initialization. I have tested this scheme with and without cache
>>> coloring (hence with and without 1:1 mapping of Dom0) on ZCU102 and it
>>> works as expected: DMA operations succeed.
>>> What about systems where an IOMMU is present but not all devices are
>>> protected?
>>> There is no way for Xen to know which devices are protected and which
>>> ones are not: devices that do not have the "iommus" property could or
>>> could not be DMA masters.
>>> Perhaps Xen could populate a whitelist of devices protected by the IOMMU
>>> based on the "iommus" property. It would require some added complexity
>>> in Xen and especially in the swiotlb-xen driver in Linux to use it,
>>> which is not ideal.
>>
>> You are trading a bit more complexity in Xen and Linux with a user will may not be able to use the hypervisor on his/her platform without a quirk in Xen (see more below).
>>
>>> However, this approach would not work for cache
>>> coloring where dom0 is not 1:1 mapped so the swiotlb-xen should not be
>>> used either way
>>
>> Not all the Dom0 Linux kernel will be able to work with cache colouring. So you will need a way for the kernel to say "Hey I am can avoid using swiotlb".
> 
> I fully agree and from my current understanding the condition is “having an iommu”.
> 
>>
>>> For these reasons, I would like to propose a single flag
>>> XENFEAT_ARM_dom0_iommu which says that the IOMMU can be relied upon for
>>> DMA translations. In situations where a DMA master is not SMMU
>>> protected, XENFEAT_ARM_dom0_iommu should not be set. For example, on a
>>> platform where an IOMMU is present and protects most DMA masters but it
>>> is leaving out the MMC controller, then XENFEAT_ARM_dom0_iommu should
>>> not be set (because PV block is not going to work without swiotlb-xen.)
>>> This also means that cache coloring won't be usable on such a system (at
>>> least not usable with the MMC controller so the system integrator should
>>> pay special care to setup the system).
>>> It is worth noting that if we wanted to extend the interface to add a
>>> list of protected devices in the future, it would still be possible. It
>>> would be compatible with XENFEAT_ARM_dom0_iommu.
>>
>> I imagine by compatible, you mean XENFEAT_ARM_dom0_iommu would be cleared and instead the device-tree list would be used. Is that correct?
> 
> What do you mean by device tree list here ?

Sorry I meant "device list". I was referring to Stefano's suggestion to 
describe the list of devices protected in the device-tree.

> 
>>
>>> How to set XENFEAT_ARM_dom0_iommu?
>>> We could set XENFEAT_ARM_dom0_iommu automatically when
>>> is_iommu_enabled(d) for Dom0. We could also have a platform specific
>>> (xen/arch/arm/platforms/) override so that a specific platform can
>>> disable XENFEAT_ARM_dom0_iommu. For debugging purposes and advanced
>>> users, it would also be useful to be able to override it via a Xen
>>> command line parameter.
>> Platform quirks should be are limited to a small set of platforms.
>>
>> In this case, this would not be only per-platform but also per-firmware table as a developer can decide to remove/add IOMMU nodes in the DT at any time.
>>
>> In addition to that, it means we are introducing a regression for those users as Xen 4.14 would have worked on there platform but not anymore. They would need to go through all the nodes and find out which one is not protected.
> 
> I am not sure i understand your point here as we cannot detect if a device is protected or not by an IOMMU as we do not know which device requires one.

That's correct...

> Could you explain what use case working before would not work here ?

 From Stefano's e-mail, Xen would expose XENFEAT_ARM_dom0_iommu if all 
the devices are protected by the IOMMU.

This implies that Xen is aware whether ever DMA-capable devices are 
protected. As you rightfully pointed out this cannot work.

>>
>> This is a bit of a daunting task and we are going to end up having a lot of per-platform quirk in Xen.
> 
>  From my understanding the quirks here would be in Linux as it would have to decide for what to use swiotlb or not.

This is not how I understood Stefano's e-mail. But even if it is 
happening in Linux, then we need a way to tell Linux which devices have 
been protected by Xen.

> What quirk do you imagine we could implement in Xen ?

Me? None. That Stefano's idea and I don't think it can work.

Cheers,

-- 
Julien Grall

