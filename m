Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E956A31F752
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 11:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86831.163295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD35a-0003pV-HA; Fri, 19 Feb 2021 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86831.163295; Fri, 19 Feb 2021 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD35a-0003p6-DB; Fri, 19 Feb 2021 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 86831;
 Fri, 19 Feb 2021 10:32:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lD35Y-0003p1-Uz
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 10:32:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lD35X-0006RO-Sb; Fri, 19 Feb 2021 10:32:43 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lD35X-0005om-Gi; Fri, 19 Feb 2021 10:32:43 +0000
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
	bh=8sl1RSejo9EYD+aPu8zswMb1564lhYS/l4h4l2C6a1w=; b=PGWRJvunY5lFUkBIEd/sWjJKiB
	IbrsIO1c6cen4snB65UQfbBvy+WxrMFeCY2B2HEeYU9yYO3H4xlTjBuTo9Us4J22+FcoXStkorZEw
	NoCxuW/G+xZk+YF7Y2qWwEOemyyK4lLyp01ByCdlgLqb31WjcXXwd7xQoEfp24hIcR50=;
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
 <alpine.DEB.2.21.2102171233270.3234@sstabellini-ThinkPad-T480s>
 <0be0196f-5b3f-73f9-5ab7-7a54faabec5c@xen.org>
 <alpine.DEB.2.21.2102180920570.3234@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <98a15b6d-7460-31a0-0b4a-acf035571a17@xen.org>
Date: Fri, 19 Feb 2021 10:32:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102180920570.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/02/2021 01:42, Stefano Stabellini wrote:
> On Thu, 18 Feb 2021, Julien Grall wrote:
>> On 17/02/2021 23:54, Stefano Stabellini wrote:
>>> On Wed, 17 Feb 2021, Julien Grall wrote:
>>>> On 17/02/2021 02:00, Stefano Stabellini wrote:
>>> But actually it was always wrong for Linux to enable swiotlb-xen without
>>> checking whether it is 1:1 mapped or not. Today we enable swiotlb-xen in
>>> dom0 and disable it in domU, while we should have enabled swiotlb-xen if
>>> 1:1 mapped no matter dom0/domU. (swiotlb-xen could be useful in a 1:1
>>> mapped domU driver domain.)
>>>
>>>
>>> There is an argument (Andy was making on IRC) that being 1:1 mapped or
>>> not is an important information that Xen should provide to the domain
>>> regardless of anything else.
>>>
>>> So maybe we should add two flags:
>>>
>>> - XENFEAT_direct_mapped
>>> - XENFEAT_not_direct_mapped
>>
>> I am guessing the two flags is to allow Linux to fallback to the default
>> behavior (depending on dom0 vs domU) on older hypervisor On newer hypervisors,
>> one of this flag would always be set. Is that correct?
> 
> Yes. On a newer hypervisor one of the two would be present and Linux can
> make an informed decision. On an older hypervisor, neither flag would be
> present, so Linux will have to keep doing what is currently doing.
> 
>   
>>> To all domains. This is not even ARM specific. Today dom0 would get
>>> XENFEAT_direct_mapped and domUs XENFEAT_not_direct_mapped. With cache
>>> coloring all domains will get XENFEAT_not_direct_mapped. With Bertrand's
>>> team work on 1:1 mapping domUs, some domUs might start to get
>>> XENFEAT_direct_mapped also one day soon.
>>>
>>> Now I think this is the best option because it is descriptive, doesn't
>>> imply anything about what Linux should or should not do, and doesn't
>>> depend on unreliable IOMMU information.
>>
>> That's a good first step but this still doesn't solve the problem on whether
>> the swiotlb can be disabled per-device or even disabling the expensive 1:1
>> mapping in the IOMMU page-tables.
>>
>> It feels to me we need to have a more complete solution (not necessary
>> implemented) so we don't put ourself in the corner again.
> 
> Yeah, XENFEAT_{not,}_direct_mapped help cleaning things up, but don't
> solve the issues you described. Those are difficult to solve, it would
> be nice to have some idea.
> 
> One issue is that we only have limited information passed via device
> tree, limited to the "iommus" property. If that's all we have, there
> isn't much we can do.

We can actually do a lot with that :). See more below.

> The device tree list is maybe the only option,
> although it feels a bit complex intuitively. We could maybe replace the
> real iommu node with a fake iommu node only to use it to "tag" devices
> protected by the real iommu.
> 
> I like the idea of rewarding well-designed boards; boards that have an
> IOMMU and works for all DMA-mastering devices. It would be great to be
> able to optimize those in a simple way, without breaking the others. But
> unfortunately due to the limited info on device tree, I cannot think of
> a way to do it automatically. And it is not great to rely on platform
> files.

We would not be able to automate in Xen alone, however we can ask the 
help of Linux.

Xen is able to tell whether it has protected the device with an IOMMU or 
not. When creating the domain device-tree, it could replace the IOMMU 
node with a Xen specific one.

With the Xen IOMMU nodes, Linux could find out whether the device needs 
to use the swiotlb ops or not.

Skipping extra mapping in the IOMMU is a bit trickier. I can see two 
solutions:
   - A per-domain toggle to skip the IOMMU mapping. This is assuming 
that Linux is able to know that all DMA capable devices are protected. 
The problem is a  driver may be loaded later. Such drivers are unlikely 
to use existing grant, so the toggle could be used to say "all the grant 
after this point will require a mapping (or not)"

   - A per-grant flag to indicate whether an IOMMU mapping is necessary. 
This is assuming we are able to know whether a grant will be used for DMA.

>>> Instead, if we follow my original proposal of using
>>> XENFEAT_ARM_dom0_iommu and set it automatically when Dom0 is protected
>>> by IOMMU, we risk breaking PV drivers for platforms where that protection
>>> is incomplete. I have no idea how many there are out there today.
>>
>> This can virtually affect any platform as it is easy to disable an IOMMU in
>> the firmware table.
>>
>>> I have
>>> the feeling that there aren't that many but I am not sure. So yes, it
>>> could be that we start passing XENFEAT_ARM_dom0_iommu for a given
>>> platform, Linux skips the swiotlb-xen initialization, actually it is
>>> needed for a network/block device, and a PV driver breaks. I can see why
>>> you say this is a no-go.
>>>
>>>
>>> Third option. We still use XENFEAT_ARM_dom0_iommu but we never set
>>> XENFEAT_ARM_dom0_iommu automatically. It needs a platform specific flag
>>> to be set. We add the flag to xen/arch/arm/platforms/xilinx-zynqmp.c and
>>> any other platforms that qualify. Basically it is "opt in" instead of
>>> "opt out". We don't risk breaking anything because platforms would have
>>> XENFEAT_ARM_dom0_iommu disabled by default.
>> Well, yes you will not break other platforms. However, you are still at risk
>> to break your platform if the firmware table is updated and disable some but
>> not all IOMMUs (for performance concern, brokeness...).
> 
> This is something we might be able to detect: we can detect if an IOMMU
> is disabled.

This is assuming that node has not been removed... :) Anyway, as I 
pointed out in my original answer, I don't think platform quirk (or 
enablement) is a viable solution here.

Cheers,

-- 
Julien Grall

