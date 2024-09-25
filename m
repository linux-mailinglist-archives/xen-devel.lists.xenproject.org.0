Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0709865E4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 19:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804469.1215459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stW4p-0005G2-0P; Wed, 25 Sep 2024 17:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804469.1215459; Wed, 25 Sep 2024 17:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stW4o-0005DT-U4; Wed, 25 Sep 2024 17:45:22 +0000
Received: by outflank-mailman (input) for mailman id 804469;
 Wed, 25 Sep 2024 17:45:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1stW4o-0005DL-1A
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 17:45:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stW4n-0007Sb-Fe; Wed, 25 Sep 2024 17:45:21 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1stW4n-0006Qv-8t; Wed, 25 Sep 2024 17:45:21 +0000
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
	bh=czZv3N9TOLaEM4runV0b8+VxqeuN/u2jjWu+DrNpQBY=; b=fZf+H8FQ4MoIQ2D/R4PB8yzir/
	Tym5bSvQcOyu1iABcaxUOaybBouFFgtC1jETkGDWbvxPodC/Syp7uJS0d0fal9hzHPQ0rIHEC8cQs
	efn/+XOEOHuIeFziLy5yktgqRq76R+VoWFpmzHO7B7RYTltjdMB+mb2dUHYuEGFJhj0k=;
Message-ID: <f7f6cf0a-5828-4053-bce2-f27df0727ab1@xen.org>
Date: Wed, 25 Sep 2024 18:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 dpsmith@apertussolutions.com, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org> <ZvQ7mf9MbmSyC6RB@zapote>
 <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org> <ZvQ-AK--W7sWom7r@zapote>
 <CAJy5ezpLVciE0ENGYtC4cwJ7U4rPTR4E68M+vq=2jBgK2it3zg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAJy5ezpLVciE0ENGYtC4cwJ7U4rPTR4E68M+vq=2jBgK2it3zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Edgar,

On 25/09/2024 17:49, Edgar E. Iglesias wrote:
> On Wed, Sep 25, 2024 at 10:44 AM Edgar E. Iglesias <edgar.iglesias@amd.com>
> wrote:
> 
>> On Wed, Sep 25, 2024 at 05:38:13PM +0100, Julien Grall wrote:
>>> Hi Edgar,
>>>
>>> On 25/09/2024 17:34, Edgar E. Iglesias wrote:
>>>> On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
>>>>> Hi,
>>>>> On 24/09/2024 17:23, Edgar E. Iglesias wrote:
>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>
>>>>>> When virtio-pci is specified in the dom0less domU properties,
>> create a
>>>>>> virtio-pci node in the guest's device tree. Set up an mmio handler
>> with
>>>>>> a register for the guest to poll when the backend has connected and
>>>>>> virtio-pci bus is ready to be probed. Grant tables may be used by
>>>>>> specifying virtio-pci = "grants";.
>>>>>>
>>>>>> [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
>>>>>>     Make grants iommu-map cover the entire PCI bus.
>>>>>>     Add virtio-pci-ranges to specify memory-map for direct-mapped
>> guests.
>>>>>>     Document virtio-pci dom0less fdt bindings.]
>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>>>>> ---
>>>>>>     docs/misc/arm/device-tree/booting.txt |  21 +++
>>>>>>     xen/arch/arm/dom0less-build.c         | 238
>> ++++++++++++++++++++++++++
>>>>>>     xen/arch/arm/include/asm/kernel.h     |  15 ++
>>>>>>     3 files changed, 274 insertions(+)
>>>>>>
>>>>>> diff --git a/docs/misc/arm/device-tree/booting.txt
>> b/docs/misc/arm/device-tree/booting.txt
>>>>>> index 3a04f5c57f..82f3bd7026 100644
>>>>>> --- a/docs/misc/arm/device-tree/booting.txt
>>>>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>>>>> @@ -276,6 +276,27 @@ with the following properties:
>>>>>>         passed through. This option is the default if this property
>> is missing
>>>>>>         and the user does not provide the device partial device
>> tree for the domain.
>>>>>> +- virtio-pci
>>>>>
>>>>> Similar question to the other patches, why is this specific to
>> virtio PCI?
>>>>> QEMU (or another device module) is free to emulate whatever it wants
>> behind
>>>>> the PCI hosbtridge.
>>>>
>>>> There's no hard limitatino to only virtio-pci devices it's more of a
>>>> recommendation that PVH guests should not use "emulated" devices but
>>>> there's nothing stopping it.
>>>
>>> Could you provide a bit more details where this requirement is coming
>> from?
>>> For instance, I would expect we would need to do some emulation to boot
>>> Windows on Arm.
>>>
>>
>> I see. I guess it just came from my mental model, I thought part of the
>> philosophy behind PVH was to avoid emulated devices and use
>> paravirualized (virtio or something else) or passthrough whereever
>> possible (except for the basic set of devices needed like vGIC, vuart,
>> MMU).
>>
> 
> For  example, we would recommend users to use virtio-net in favor of an
> emulated eepro1000 or whatever other NIC models available in QEMU.

Indeed. I would always recommend user to use virtio-net over eepro1000.

> But there is no hard requirement nor limitation, a user can connect any
> available PCI device from the QEMU set.

We need to be clear about what we are exposing to the guest. With this 
patch we will describe a PCI hostbridge in Device Tree (well it is an 
empty region we hope the Device Model to emulate at some point). But the 
hypervisor will not create the device model. Instead, you expect the 
user/integrator to have extra script to launch a Device Model (So it may 
not even be a hostbridge).

>
> Another thing we're looking to do is to minimize the QEMU build (Kconfig +
> configure flags) to create a small build with only the stuff needed for
> virtio-pci.

It is nice to have a cut down version of QEMU :). However, Xen doesn't 
care about the device model used for the emulation. I have seen some 
specialized DM in the wild (and used them while I was working on 
disaggregating the DM).

Anyway, while I understand this approach works in tailored environment, 
I am not convinced this works for a more general approach. The two 
options I would rather consider are:
   1. Allow the device model to receive access for a single PCI device 
(IOW hook into vPCI).
   2. Find a way to let the user provide the binding (maybe in a partial 
device-tree) + the list of Interrupts/MMIO that would be emulated by QEMU.

The second approach might be another way to get a second hostbridge in 
your use case while giving a bit more flexibility in what can be done 
(thinking about disagreggated environment).

Cheers,

-- 
Julien Grall


