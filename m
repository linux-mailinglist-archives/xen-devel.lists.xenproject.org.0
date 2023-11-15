Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF47ECA8D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 19:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633836.988936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3KhE-0004Of-43; Wed, 15 Nov 2023 18:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633836.988936; Wed, 15 Nov 2023 18:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3KhE-0004MD-1K; Wed, 15 Nov 2023 18:33:04 +0000
Received: by outflank-mailman (input) for mailman id 633836;
 Wed, 15 Nov 2023 18:33:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3KhD-0004M7-9c
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 18:33:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3KhC-0007rl-VX; Wed, 15 Nov 2023 18:33:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3KhC-0007tx-Kz; Wed, 15 Nov 2023 18:33:02 +0000
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
	bh=4J4FIB6xVcquEu163Z98su52FN+IjhTsdPXxW7R7Q5I=; b=yJKnHDuo/WoZdErup07Hdji0od
	wqh1DKmEmpkPVLbT3UzXzMiAdvQlEQkhVhz8eI+lT953Q2ljPy9OrVphZviJ6Rin3oWni4yMY86EB
	M4mZfJzRL6hn/I8LsunBgU4MWLxdqw7qYaSrqpB4uIxa9WP6ku/hNuxGosxvd7hUdWWs=;
Message-ID: <38ac9e15-3618-4178-b4f6-00a16eb53578@xen.org>
Date: Wed, 15 Nov 2023 18:33:00 +0000
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
 <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
 <1e5b414b-c730-4fbf-bc51-c292e396f6c5@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1e5b414b-c730-4fbf-bc51-c292e396f6c5@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 15/11/2023 18:14, Oleksandr Tyshchenko wrote:
> On 15.11.23 19:31, Julien Grall wrote:
>> On 15/11/2023 16:51, Oleksandr Tyshchenko wrote:
>>> On 15.11.23 14:33, Julien Grall wrote:
>>>> Thanks for adding support for virtio-pci in Xen. I have some questions.
>>>>
>>>> On 15/11/2023 11:26, Sergiy Kibrik wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> In order to enable more use-cases such as having multiple
>>>>> device-models (Qemu) running in different backend domains which provide
>>>>> virtio-pci devices for the same guest, we allocate and expose one
>>>>> PCI host bridge for every virtio backend domain for that guest.
>>>>
>>>> OOI, why do you need to expose one PCI host bridge for every stubdomain?
>>>>
>>>> In fact looking at the next patch, it seems you are handling some of the
>>>> hostbridge request in Xen. This is adds a bit more confusion.
>>>>
>>>> I was expecting the virtual PCI device would be in the vPCI and each
>>>> Device emulator would advertise which BDF they are covering.
>>>
>>>
>>> This patch series only covers use-cases where the device emulator
>>> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices behind
>>> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI
>>> pass-through resources, handling, accounting, nothing.
>>
>> I understood you want to one Device Emulator to handle the entire PCI
>> host bridge. But...
>>
>>   From the
>>> hypervisor we only need a help to intercept the config space accesses
>>> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ...
>>> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and
>>> forward them to the linked device emulator (if any), that's all.
>>
>> ... I really don't see why you need to add code in Xen to trap the
>> region. If QEMU is dealing with the hostbridge, then it should be able
>> to register the MMIO region and then do the translation.
> 
> 
> Hmm, sounds surprising I would say. Are you saying that unmodified Qemu
> will work if we drop #5?

I don't know if an unmodified QEMU will work. My point is I don't view 
the patch in Xen necessary. You should be able to tell QEMU "here is the 
ECAM region, please emulate an hostbridge". QEMU will then register the 
region to Xen and all the accesses will be forwarded.

In the future we may need a patch similar to #5 if we want to have 
multiple DM using the same hostbridge. But this is a different 
discussion and the patch would need some rework.

The ioreq.c code was always meant to be generic and is always for every 
emulated MMIO. So you want to limit any change in it. Checking the MMIO 
region belongs to the hostbridge and doing the translation is IMHO not a 
good idea to do in ioreq.c. Instead you want to do the conversion from 
MMIO to (sbdf, offset) in virtio_pci_mmio{read, write}(). So the job of 
ioreq.c is to simply find the correct Device Model and forward it.

I also don't see why the feature is gated by has_vcpi(). They are two 
distinct features (at least in your current model).

Cheers,

-- 
Julien Grall

