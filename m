Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B702FD672
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71643.128453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GvV-0000i4-Cr; Wed, 20 Jan 2021 17:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71643.128453; Wed, 20 Jan 2021 17:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GvV-0000hd-8P; Wed, 20 Jan 2021 17:05:49 +0000
Received: by outflank-mailman (input) for mailman id 71643;
 Wed, 20 Jan 2021 17:05:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2GvT-0000hX-RF
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:05:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2GvR-0005YB-Bs; Wed, 20 Jan 2021 17:05:45 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2GvQ-0005Lv-Vw; Wed, 20 Jan 2021 17:05:45 +0000
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
	bh=kXGJ3WZEneRIqRnFnlpgw29gqQif+QGz3VbMYzyNlaI=; b=RfowHY105nyGivBivjPlhU6ME3
	g4anQN1qgY3VyKDp0gY3YOQeRfqcTe1GXjqDHcINVIoQHSE5sM8b+v+2YdSojPfk5aKPXszdin/DM
	mkQ9M200VT691ns0vhALY6y8XjoAsUJ75NUMkwG6akaKOjOCTlzRYPkEz2LYW3a8CgSw=;
Subject: Re: [PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk
 configuration
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-25-git-send-email-olekstysh@gmail.com>
 <e1da0892-5496-b438-f52f-1e5dd8d48979@xen.org>
 <87f92e40-6462-21ba-0c56-b77c6518fef8@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dce22061-aa73-dba7-601d-fe20f989688d@xen.org>
Date: Wed, 20 Jan 2021 17:05:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87f92e40-6462-21ba-0c56-b77c6518fef8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 18/01/2021 08:32, Oleksandr wrote:
> 
> On 16.01.21 00:01, Julien Grall wrote:
>> Hi Oleksandr,
> 
> Hi Julien
> 
> 
>>
>> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch adds basic support for configuring and assisting virtio-disk
>>> backend (emualator) which is intended to run out of Qemu and could be 
>>> run
>>> in any domain.
>>>
>>> Xenstore was chosen as a communication interface for the emulator 
>>> running
>>> in non-toolstack domain to be able to get configuration either by 
>>> reading
>>> Xenstore directly or by receiving command line parameters (an updated 
>>> 'xl devd'
>>> running in the same domain would read Xenstore beforehand and call 
>>> backend
>>> executable with the required arguments).
>>>
>>> An example of domain configuration (two disks are assigned to the guest,
>>> the latter is in readonly mode):
>>>
>>> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
>>>
>>> Where per-disk Xenstore entries are:
>>> - filename and readonly flag (configured via "vdisk" property)
>>> - base and irq (allocated dynamically)
>>>
>>> Besides handling 'visible' params described in configuration file,
>>> patch also allocates virtio-mmio specific ones for each device and
>>> writes them into Xenstore. virtio-mmio params (irq and base) are
>>> unique per guest domain, they allocated at the domain creation time
>>> and passed through to the emulator. Each VirtIO device has at least
>>> one pair of these params.
>>>
>>> TODO:
>>> 1. An extra "virtio" property could be removed.
>>> 2. Update documentation.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> [On Arm only]
>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>>
>>> ---
>>> Changes RFC -> V1:
>>>     - no changes
>>>
>>> Changes V1 -> V2:
>>>     - rebase according to the new location of libxl_virtio_disk.c
>>>
>>> Changes V2 -> V3:
>>>     - no changes
>>>
>>> Changes V3 -> V4:
>>>     - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT
>>>
>>> Please note, there is a real concern about VirtIO interrupts allocation.
>>> [Just copy here what Stefano said in RFC thread]
>>>
>>> So, if we end up allocating let's say 6 virtio interrupts for a domain,
>>> the chance of a clash with a physical interrupt of a passthrough 
>>> device is real.
>>
>> For the first version, I think a static approach is fine because it 
>> doesn't bind us to anything yet (there is no interface change). We can 
>> refine it on follow-ups as we figure out how virtio is going to be 
>> used in the field.
>>
>>>
>>> I am not entirely sure how to solve it, but these are a few ideas:
>>> - choosing virtio interrupts that are less likely to conflict (maybe 
>>> > 1000)
>>
>> Well, we only support 988 interrupts :). However, we will waste some 
>> memory in the vGIC structure (we would need to allocate memory for the 
>> 988 interrupts) if you chose an interrupt towards then end.
>>
>>> - make the virtio irq (optionally) configurable so that a user could
>>>    override the default irq and specify one that doesn't conflict
>>
>> This is not very ideal because it makes the use of virtio quite 
>> unfriendly with passthrough. Note that platform device passthrough is 
>> already unfriendly, but I am thinking PCI :).
>>
>>> - implementing support for virq != pirq (even the xl interface doesn't
>>>    allow to specify the virq number for passthrough devices, see "irqs")
>> I can't remember whether I had a reason to not support virq != pirq 
>> when this was initially implemented. This is one possibility, but it 
>> is as unfriendly as the previous option.
>>
>> I will add a 4th one:
>>    - Automatically allocate the virtio IRQ. This should be possible to 
>> do it without too much trouble as we know in advance which IRQs will 
>> be passthrough.
> As I understand the IRQs for passthrough are described in "irq" property 
> and stored in d_config->b_info.irqs[i], so yes we know in advance which 
> IRQs will be used for passthrough
> and we will be able to choose non-clashed ones (iterating over all IRQs 
> in a reserved range) for the virtio devices.  The question is how many 
> IRQs should be reserved.

If we are automatically selecting the interrupt for virtio devices, then 
I don't think we need to reserve a batch. Instead, we can allocate one 
by one as we create the virtio device in libxl.

For the static case, then a range of 10-20 might be sufficient for now.

[...]

>>> -        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
>>> +        uint64_t virtio_base;
>>> +        libxl_device_virtio_disk *virtio_disk;
>>> +
>>> +        virtio_base = GUEST_VIRTIO_MMIO_BASE;
>>>           virtio_irq = GUEST_VIRTIO_MMIO_SPI;
>>
>> Looking at patch #23, you defined a single SPI and a region that can 
>> only fit virtio device. However, here, you are going to define 
>> multiple virtio devices.
>>
>> I think you want to define the following:
>>
>>  - GUEST_VIRTIO_MMIO_BASE: Base address of the virtio window
>>  - GUEST_VIRTIO_MMIO_SIZE: Full length of the virtio window (may 
>> contain multiple devices)
>>  - GUEST_VIRTIO_SPI_FIRST: First SPI reserved for virtio
>>  - GUEST_VIRTIO_SPI_LAST: Last SPI reserved for virtio
>>
>> The per-device size doesn't need to be defined in arch-arm.h. Instead, 
>> I would only define internally (unless we can use a virtio.h header 
>> from Linux?).
> 
> I think I got the idea. What are the preferences for these values?

I have suggested some values in patch #23. Let me know what you think there.

[...]

>>> +
>>> +        nr_spis += (virtio_irq - 32) + 1;
>>>           virtio_enabled = true;
>>>       }
>>
>> [...]
>>
>>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>>> index 2a3364b..054a0c9 100644
>>> --- a/tools/xl/xl_parse.c
>>> +++ b/tools/xl/xl_parse.c
>>> @@ -1204,6 +1204,120 @@ out:
>>>       if (rc) exit(EXIT_FAILURE);
>>>   }
>>>   +#define MAX_VIRTIO_DISKS 4
>>
>> May I ask why this is hardcoded to 4?
> 
> I found 4 as a reasonable value for the initial implementation.
> This means how many disks the single device instance can handle.

Right, the question is why do you need to impose a limit in xl?

Looking at the code, the value is only used in:

+        if (virtio_disk->num_disks > MAX_VIRTIO_DISKS) {
+            fprintf(stderr, "vdisk: currently only %d disks are supported",
+                    MAX_VIRTIO_DISKS);

The rest of the code (at list in libxl/xl) seems to be completely 
agnostic to the number of disks. So it feels strange to me to impose 
what looks like an arbitrary limit in the tools.

Cheers,

-- 
Julien Grall

