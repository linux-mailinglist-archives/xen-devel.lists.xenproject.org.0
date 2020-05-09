Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02EC1CC023
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 11:57:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXME3-0001XL-N2; Sat, 09 May 2020 09:56:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYqh=6X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jXME2-0001XG-Hl
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 09:56:54 +0000
X-Inumbo-ID: 69746630-91db-11ea-a0d4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69746630-91db-11ea-a0d4-12813bfff9fa;
 Sat, 09 May 2020 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U7T9L4VBA06Qbk4y86VhRGArJj2r/9HhmmdCI1mU0s0=; b=ieghrjCCB+oM2V24UGQRGs4auX
 qlH/5zJWLkyfYjzSDqzx8YsO7kps3G7ln/ryTxrgOgKoKbYEQnJ3+UAhOxXNyWfmXyZcdrQlpYpge
 CuxqMaAfqdKFGS8yp3M5khn/pvjhdT99NUPGQiaFu4emJiCRbeP2l8OOtzgvNBHAX+Ik=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jXME1-0007hk-0e; Sat, 09 May 2020 09:56:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jXME0-00074h-Ls; Sat, 09 May 2020 09:56:52 +0000
Subject: Re: [PATCH 03/12] xen/arm: introduce 1:1 mapping for domUs
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-3-sstabellini@kernel.org>
 <3f26f6a0-89bd-cbec-f07f-90a08fa60e26@xen.org>
 <alpine.DEB.2.21.2004301417070.28941@sstabellini-ThinkPad-T480s>
 <77d2858c-768c-e2a1-e2c9-32cb1612512d@xen.org>
 <alpine.DEB.2.21.2005081351340.26167@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <df25b809-035d-aa78-664c-69855ace5f60@xen.org>
Date: Sat, 9 May 2020 10:56:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005081351340.26167@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 09/05/2020 01:07, Stefano Stabellini wrote:
> On Fri, 1 May 2020, Julien Grall wrote:
>> On 01/05/2020 02:26, Stefano Stabellini wrote:
>>> On Wed, 15 Apr 2020, Julien Grall wrote:
>>>> On 15/04/2020 02:02, Stefano Stabellini wrote:
>>>>> In some cases it is desirable to map domU memory 1:1 (guest physical ==
>>>>> physical.) For instance, because we want to assign a device to the domU
>>>>> but the IOMMU is not present or cannot be used. In these cases, other
>>>>> mechanisms should be used for DMA protection, e.g. a MPU.
>>>>
>>>> I am not against this, however the documentation should clearly explain
>>>> that
>>>> you are making your platform insecure unless you have other mean for DMA
>>>> protection.
>>>
>>> I'll expand the docs
>>>
>>>
>>>>>
>>>>> This patch introduces a new device tree option for dom0less guests to
>>>>> request a domain to be directly mapped. It also specifies the memory
>>>>> ranges. This patch documents the new attribute and parses it at boot
>>>>> time. (However, the implementation of 1:1 mapping is missing and just
>>>>> BUG() out at the moment.)  Finally the patch sets the new direct_map
>>>>> flag for DomU domains.
>>>>>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>> ---
>>>>>     docs/misc/arm/device-tree/booting.txt | 13 +++++++
>>>>>     docs/misc/arm/passthrough-noiommu.txt | 35 ++++++++++++++++++
>>>>>     xen/arch/arm/domain_build.c           | 52
>>>>> +++++++++++++++++++++++++--
>>>>>     3 files changed, 98 insertions(+), 2 deletions(-)
>>>>>     create mode 100644 docs/misc/arm/passthrough-noiommu.txt
>>>>>
>>>>> diff --git a/docs/misc/arm/device-tree/booting.txt
>>>>> b/docs/misc/arm/device-tree/booting.txt
>>>>> index 5243bc7fd3..fce5f7ed5a 100644
>>>>> --- a/docs/misc/arm/device-tree/booting.txt
>>>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>>>> @@ -159,6 +159,19 @@ with the following properties:
>>>>>         used, or GUEST_VPL011_SPI+1 if vpl011 is enabled, whichever is
>>>>>         greater.
>>>>>     +- direct-map
>>>>> +
>>>>> +    Optional. An array of integer pairs specifying addresses and sizes.
>>>>> +    direct_map requests the memory of the domain to be 1:1 mapped with
>>>>> +    the memory ranges specified as argument. Only sizes that are a
>>>>> +    power of two number of pages are allowed.
>>>>> +
>>>>> +- #direct-map-addr-cells and #direct-map-size-cells
>>>>> +
>>>>> +    The number of cells to use for the addresses and for the sizes in
>>>>> +    direct-map. Default and maximum are 2 cells for both addresses and
>>>>> +    sizes.
>>>>> +
>>>>
>>>> As this is going to be mostly used for passthrough, can't we take
>>>> advantage of
>>>> the partial device-tree and describe the memory region using memory node?
>>>
>>> With the system device tree bindings that are under discussion the role
>>> of the partial device tree might be reduce going forward, and might even
>>> go away in the long term. For this reason, I would prefer not to add
>>> more things to the partial device tree.
>>
>> Was the interface you suggested approved by the committee behind system device
>> tree? If not, we will still have to support your proposal + whatever the
>> committee come up with. So I am not entirely sure why using the partial
>> device-tree will be an issue.
> 
> Not yet

This answer...

> 
> 
>> It is actually better to keep everything in the partial device-tree as it
>> would avoid to clash with whatever you come up with the system device tree.
> 
> I don't think we want to support both in the long term. The closer we
> are to it the better for transitioning.

... raises the question how your solution is going to be closer? Do you 
mind providing more details on the system device-tree?

> 
> 
>> Also, I don't think the partial device-tree could ever go away at least in
>> Xen. This is an external interface we provide to the user, removing it would
>> mean users would not be able to upgrade from Xen 4.x to 4.y without any major
>> rewrite of there DT.
> 
> I don't want to put the memory ranges inside the multiboot,device-tree
> module because that is clearly for device assignment:
> 
> "Device Assignment (Passthrough) is supported by adding another module,
> alongside the kernel and ramdisk, with the device tree fragment
> corresponding to the device node to assign to the guest."

Thanks you for copying the documentation here... As you know, when the 
partial device-tree was designed, it was only focused on device 
assignment. However, I don't see how this prevents us to extend it to 
more use cases.

Describing the RAM regions in the partial device-tree means you have a 
single place where you can understand the memory layout of your guest.

You have also much more flexibility for describing your guests over the 
/chosen node and avoid to clash with the rest of the host device-tree.

> 
> One could do 1:1 memory mapping without device assignment.
 >
> Genuine question: did we write down any compatibility promise on that
> interface? If so, do you know where? I'd like to take a look.

Nothing written in Xen, however a Device-Tree bindings are meant to be 
stable.

This would be a pretty bad user experience if you had to rewrite your 
device-tree when upgrading Xen 4.14 to Xen 5.x. This also means 
roll-back would be more difficult as there are more components dependency.

> In any case backward compatible interfaces can be deprecated although it
> takes time. Alternatively it could be made optional (even for device
> assignment). So expanding its scope beyond device assignment
> configuration it is not a good idea.

What would be the replacement? I still haven't seen any light of the 
so-called system device-tree.

At the moment, I can better picture how this can work with the partial 
device-tree. One of the advantage is you could describe your guest 
layout in one place and then re-use it for booting a guest from the 
toolstack (not implemented yet) or the hypervisor.

I could change my mind if it turns out to be genuinely more complicated 
to implement in Xen and/or you provide more details on how this is going 
to work out with the system device-tree.

Cheers,

-- 
Julien Grall

