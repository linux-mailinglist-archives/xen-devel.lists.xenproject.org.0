Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA898544F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 09:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803488.1214063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stMZx-0008Rx-1f; Wed, 25 Sep 2024 07:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803488.1214063; Wed, 25 Sep 2024 07:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stMZw-0008QJ-Uj; Wed, 25 Sep 2024 07:36:52 +0000
Received: by outflank-mailman (input) for mailman id 803488;
 Wed, 25 Sep 2024 07:36:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1stMZv-0008QD-Ty
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 07:36:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stMZu-0003e2-JS; Wed, 25 Sep 2024 07:36:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stMZu-0000sr-Aj; Wed, 25 Sep 2024 07:36:50 +0000
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
	bh=GgfdtX07kWAbpLDtk53jjMZOFvy5CWJBu2TrqQQCnDM=; b=s2t72qBGvMinewAY57Rcy5OM6G
	yRtSE/rErVzHiHPwlA/K1Zg8PL9pGxZhRKO0XijNb3s36oQFZqy5/gQZ1FBJAosT0dty2k9rSWJ9n
	FS+fQb0bXlDrVtSWsT5rojGUD+VT7MnPwcX1fDq/uputKOnSLT5PwR+X+FZ0UJeakozw=;
Message-ID: <f9682602-9e76-493c-8315-6b71905d33b7@xen.org>
Date: Wed, 25 Sep 2024 08:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/arm: Reserve resources for virtio-pci
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 dpsmith@apertussolutions.com
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-3-edgar.iglesias@gmail.com>
 <465cb8b5-5f46-42ce-be8f-a38c1c23a805@xen.org> <ZvLyzZ8n-QgrYOCW@zapote>
 <7b867cf0-9d4b-4067-ac56-a7d6b3d440f5@xen.org>
 <alpine.DEB.2.22.394.2409241559150.1417852@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2409241559150.1417852@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 25/09/2024 00:16, Stefano Stabellini wrote:
> On Tue, 24 Sep 2024, Julien Grall wrote:
>> On 24/09/2024 18:11, Edgar E. Iglesias wrote:
>>> On Tue, Sep 24, 2024 at 05:35:20PM +0100, Julien Grall wrote:
>>>> Hi Edgar,
>>>>
>>>> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
>>>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>>>
>>>>> Reserve memory ranges and interrupt lines for an externally
>>>>> emulated PCI controller (e.g by QEMU) dedicated to hosting
>>>>> Virtio devices and potentially other emulated devices.
>>>>>
>>>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>>>> ---
>>>>>     xen/include/public/arch-arm.h | 17 +++++++++++++++++
>>>>>     1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/xen/include/public/arch-arm.h
>>>>> b/xen/include/public/arch-arm.h
>>>>> index e19f0251a6..654b827715 100644
>>>>> --- a/xen/include/public/arch-arm.h
>>>>> +++ b/xen/include/public/arch-arm.h
>>>>> @@ -494,6 +494,20 @@ typedef uint64_t xen_callback_t;
>>>>>     #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM
>>>>> @ 8GB */
>>>>>     #define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
>>>>> +/* Virtio PCI - Ordered by decreasing size to keep things aligned */
>>>>> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE  xen_mk_ullong(0x43000000)
>>>>> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE
>>>>> xen_mk_ullong(0x0f000000000)
>>>>> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE  xen_mk_ullong(0x100000000)
>>>>> +
>>>>> +#define GUEST_VIRTIO_PCI_ECAM_BASE
>>>>> (GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE + \
>>>>> +
>>>>> GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE)
>>>>> +#define GUEST_VIRTIO_PCI_ECAM_SIZE      xen_mk_ullong(0x10000000)
>>>>> +
>>>>> +#define GUEST_VIRTIO_PCI_MEM_TYPE         xen_mk_ullong(0x02000000)
>>>>> +#define GUEST_VIRTIO_PCI_MEM_BASE         (GUEST_VIRTIO_PCI_ECAM_BASE +
>>>>> \
>>>>> +                                           GUEST_VIRTIO_PCI_ECAM_SIZE)
>>>>> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x00002000000)
>>>>
>>>> Why is this specific to virtio PCI? However, I am not entirely convinced
>>>> we
>>>> should have a second PCI hostbridge exposed to the guest for a few
>>>> reasons:
>>>>     1. This require to reserve yet another range in the address space
>>>> (could
>>>> be solved with a more dynamic layout)
>>>>     2. From your instructions, the guest needs to explicitly do a PCI
>>>> rescan.
>>
>> Another big advantage I forgot to mention is disaggregation. In a world where
>> the hostbridge is handled in Xen, you could have a PCI device emulated by dom0
>> while the other is emulated by a stub domain.
>>
>>>>
>>>> So rather than having a second hostbridge, have you considered to extend
>>>> the
>>>> existing hostbridge (implemented in Xen) to support a mix of physical PCI
>>>> device and virtual one?
>>>>
>>>
>>> Thanks Julien,
>>>
>>> It's briefly come up in a couple of discussions but I haven't looked
>>> carefully at it. It is a good idea and it's probably worth prototyping
>>> to see what the gaps are in hypercall interfaces, QEMU support etc.
>>
>> I also vaguely recall to discuss it on xen-devel. But I couldn't find the
>> discussion... :(.
>>
>> I think all the hypercalls should be there but will require some plumbing in
>> Xen on Arm. QEMU should be able to request Xen to forward configuration access
>> for a given PCI device (see XEN_DMOP_IO_RANGE_PCI). They will then be
>> forwarded to QEMU using IOREQ_TYPE_PCI_CONFIG.
>>
>> We also have an hypercall to be able to inject interrupts from QEMU (see
>> XEN_DMOP_set_irq_level).
> 
> Hi Julien,
> 
> Yes, I remember a thread on xen-devel too about this topic when EPAM
> suggested a similar two-hostbridges approach. I was one of the people
> suggesting to use a single hostbridge at the time.
> 
> However, when we looked at the implementation more closely, the
> two-hostbridge approach was easier to get up and running. It works
> (almost) out of the box. Currently, we have the two-hostbridge solution
> working on both ARM and x86 to enable virtio-pci to work alongside vPCI
> in Dom0less/Hyperlaunch configurations.

I understand this is the easiest solution... However, this requires code 
in Xen that I am not yet convinced it is good to have.

I am not too concerned about the MMIO range part. This can be (easily) 
solved. I am more concerned about the support of background region and 
the fact the OS needs to be able to rescan.

I am definitely not an expert of PCI, but AFAIK, it is possible to have 
the guest to be notified when a PCI device is hotplug. Why can't we use it?

> 
> While I think that a single hostbridge is better architecturally, it is
> important to consider that virtio is moving toward a new transport
> (virtio-msg, Bertrand is also involved) which does not require a
> hostbridge. This new transport is key for all our use-cases as it
> addresses safety requirements and supports AMP configurations without a
> shared hypervisor between the frontend and backend. Edgar is one of the
> top contributors to virtio-msg. Given this, I don't think it's
> worthwhile to invest much effort in virtio-pci, as it will be replaced
> soon in embedded applications.
To me this raises the question why we should have a temporary solution 
upstream then?

Cheers,

-- 
Julien Grall

