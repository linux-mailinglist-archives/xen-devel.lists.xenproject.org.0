Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF9E7EC9B3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 18:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633823.988907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3JjQ-00065m-1X; Wed, 15 Nov 2023 17:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633823.988907; Wed, 15 Nov 2023 17:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3JjP-000649-UO; Wed, 15 Nov 2023 17:31:15 +0000
Received: by outflank-mailman (input) for mailman id 633823;
 Wed, 15 Nov 2023 17:31:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3JjO-00063x-3d
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 17:31:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3JjN-0006G3-MP; Wed, 15 Nov 2023 17:31:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3JjN-0005EP-Ga; Wed, 15 Nov 2023 17:31:13 +0000
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
	bh=fl6xOmXJi6+18dkqwdXBTON/RwPUjxd+q6/WwEvMjig=; b=KiJNN+PUuA63sTQP9RTPk4Y5pf
	VMqB/L7amRdn8wRZ9stZPWdfCRm1Flmw7jHwCbAeZXsOCJDYLX4zrQwyclUwdb8cuja/kJsglWW30
	JCSO1aWEySeXc2Hx57uRBnBzXemwqlmMbFVca5Bo/74nTVr8EkQY1GUEaE+kysUHeSko=;
Message-ID: <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
Date: Wed, 15 Nov 2023 17:31:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 15/11/2023 16:51, Oleksandr Tyshchenko wrote:
> 
> 
> On 15.11.23 14:33, Julien Grall wrote:
>> Hi,
> 
> 
> Hello Julien
> 
> Let me please try to explain some bits.
> 
> 
>>
>> Thanks for adding support for virtio-pci in Xen. I have some questions.
>>
>> On 15/11/2023 11:26, Sergiy Kibrik wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> In order to enable more use-cases such as having multiple
>>> device-models (Qemu) running in different backend domains which provide
>>> virtio-pci devices for the same guest, we allocate and expose one
>>> PCI host bridge for every virtio backend domain for that guest.
>>
>> OOI, why do you need to expose one PCI host bridge for every stubdomain?
>>
>> In fact looking at the next patch, it seems you are handling some of the
>> hostbridge request in Xen. This is adds a bit more confusion.
>>
>> I was expecting the virtual PCI device would be in the vPCI and each
>> Device emulator would advertise which BDF they are covering.
> 
> 
> This patch series only covers use-cases where the device emulator
> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices behind
> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI
> pass-through resources, handling, accounting, nothing. 

I understood you want to one Device Emulator to handle the entire PCI 
host bridge. But...

 From the
> hypervisor we only need a help to intercept the config space accesses
> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ...
> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and
> forward them to the linked device emulator (if any), that's all.

... I really don't see why you need to add code in Xen to trap the 
region. If QEMU is dealing with the hostbridge, then it should be able 
to register the MMIO region and then do the translation.

> 
> It is not possible (with current series) to run device emulators what
> emulate only separate PCI (virtio-pci) devices. For it to be possible, I
> think, much more changes are required than current patch series does.
> There at least should be special PCI Host bridge emulation in Xen (or
> reuse vPCI) for the integration. Also Xen should be in charge of forming
> resulting PCI interrupt based on each PCI device level signaling (if we
> use legacy interrupts), some kind of x86's XEN_DMOP_set_pci_intx_level,
> etc. Please note, I am not saying this is not possible in general,
> likely it is possible, but initial patch series doesn't cover these
> use-cases)
> 
> We expose one PCI host bridge per virtio backend domain. This is a
> separate PCI host bridge to combine all virtio-pci devices running in
> the same backend domain (in the same device emulator currently).
> The examples:
> - if only one domain runs Qemu which servers virtio-blk, virtio-net,
> virtio-console devices for DomU - only single PCI Host bridge will be
> exposed for DomU
> - if we add another domain to run Qemu to serve additionally virtio-gpu,
> virtio-input and virtio-snd for the *same* DomU - we expose second PCI
> Host bridge for DomU
> 
> I am afraid, we cannot end up exposing only single PCI Host bridge with
> current model (if we use device emulators running in different domains
> that handles the *entire* PCI Host bridges), this won't work.

That makes sense and it is fine. But see above, I think only the #2 is 
necessary for the hypervisor. Patch #5 should not be necessary at all.

[...]

>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>> ---
>>>    xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
>>>    1 file changed, 21 insertions(+)
>>>
>>> diff --git a/xen/include/public/arch-arm.h
>>> b/xen/include/public/arch-arm.h
>>> index a25e87dbda..e6c9cd5335 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -466,6 +466,19 @@ typedef uint64_t xen_callback_t;
>>>    #define GUEST_VPCI_MEM_ADDR                 xen_mk_ullong(0x23000000)
>>>    #define GUEST_VPCI_MEM_SIZE                 xen_mk_ullong(0x10000000)
>>> +/*
>>> + * 16 MB is reserved for virtio-pci configuration space based on
>>> calculation
>>> + * 8 bridges * 2 buses x 32 devices x 8 functions x 4 KB = 16 MB
>>
>> Can you explain how youd ecided the "2"?
> 
> good question, we have a limited free space available in memory layout
> (we had difficulties to find a suitable holes) also we don't expect a
> lot of virtio-pci devices, so "256" used vPCI would be too much. It was
> decided to reduce significantly, but select maximum to fit into free
> space, with having "2" buses we still fit into the chosen holes.

If you don't expect a lot of virtio devices, then why do you need two 
buses? Wouldn't one be sufficient?

> 
> 
>>
>>> + */
>>> +#define GUEST_VIRTIO_PCI_ECAM_BASE          xen_mk_ullong(0x33000000)
>>> +#define GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE    xen_mk_ullong(0x01000000)
>>> +#define GUEST_VIRTIO_PCI_HOST_ECAM_SIZE     xen_mk_ullong(0x00200000)
>>> +
>>> +/* 64 MB is reserved for virtio-pci memory */
>>> +#define GUEST_VIRTIO_PCI_ADDR_TYPE_MEM    xen_mk_ullong(0x02000000)
>>> +#define GUEST_VIRTIO_PCI_MEM_ADDR         xen_mk_ullong(0x34000000)
>>> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x04000000)
>>> +
>>>    /*
>>>     * 16MB == 4096 pages reserved for guest to use as a region to map its
>>>     * grant table in.
>>> @@ -476,6 +489,11 @@ typedef uint64_t xen_callback_t;
>>>    #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>>    #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>> +/* 64 MB is reserved for virtio-pci Prefetch memory */
>>
>> This doesn't seem a lot depending on your use case. Can you details how
>> you can up with "64 MB"?
> 
> the same calculation as it was done configuration space. It was observed
> that only 16K is used per virtio-pci device (maybe it can be bigger for
> usual PCI device, I don't know). Please look at the example of DomU log
> below (to strings that contain "*BAR 4: assigned*"):

What about virtio-gpu? I would expect a bit more memory is necessary for 
that use case.

Any case, what I am looking for is for some explanation in the commit 
message of the limits. I don't particularly care about the exact limit 
because this is not part of a stable ABI.

Cheers,

-- 
Julien Grall

