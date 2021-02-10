Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442A3161B9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 10:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83497.155540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lOL-0003QG-6G; Wed, 10 Feb 2021 09:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83497.155540; Wed, 10 Feb 2021 09:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lOL-0003Pr-2V; Wed, 10 Feb 2021 09:02:33 +0000
Received: by outflank-mailman (input) for mailman id 83497;
 Wed, 10 Feb 2021 09:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=en6K=HM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l9lOI-0003Pm-Sc
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 09:02:30 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7f91d6f-0f9e-4b34-9c87-6a909752286c;
 Wed, 10 Feb 2021 09:02:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u25so1726062lfc.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Feb 2021 01:02:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p3sm211881lfu.271.2021.02.10.01.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 01:02:28 -0800 (PST)
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
X-Inumbo-ID: a7f91d6f-0f9e-4b34-9c87-6a909752286c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7G5wVlyRsXuQzM/tjl3QMxBCBuW8EeiKEzvQNC3uzGw=;
        b=KVmGRBLWx3DqHtvFy0kgHN6SH+CngI92cF5MXuq6qA+MIqdQ8xLnDGuMUm/DMLVisB
         ERf+ZhF0owfTt/goko7oHISPBRZwavdzye4SeS4Ezv9YrsMt3Z30I2S+lZv64/4TIRz2
         uoC579sap1XR0VZy8OsoIeZ3RFC9p/aQV7zFAbeAvrErbZOd7AHNnAaWORiFXQO7g0NQ
         Sc69ULHO16+b6nAe0USVEDg6Sbc6eYETpx1CZZ/ZiWjqCDfRNMI6fcQYtHzyN760swOs
         4yvyrCsjnyx/hoZK7dZaWIM8jDPgqBpBvE00G1yGrrpNYAO9mLmaPhrPJy0sbMcac3MS
         0Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7G5wVlyRsXuQzM/tjl3QMxBCBuW8EeiKEzvQNC3uzGw=;
        b=tHsLK6Vjqr4sbbY3hcCOERb/i0H8Tzvqz4QMogpwjgLTA8l0JHRG3paXQ1MRyEtM9O
         VQ3Js0ZpkTt1yTqESwG3L56C5DSzsvDSqn+LOGNlwNwXwBxpylzSutQK/cJGCmVJi30A
         9lbqFGsNxuvrh2G/jPU8oqCUFwnbrAPHe3hhSf1DS6bn6DQDOmp54CAfylX+ZNNasLsw
         EoRdC/rqD3CTi6qu1qUjniW/nmBEOrmiLtD3YbMSjuUpK6CcEAS6MjI1UqmxuJSyD/E5
         HrZnGOiD+ob+cR7rPLaSFGqY4DA/JztYh2ukoMjIFmxsHimKkuxxfinbqnvGn5a0JJfB
         qUSw==
X-Gm-Message-State: AOAM5324D8Vir+BoBWRCJtS9P4zdHTijQH1lxYSSDYDG3hC18S2uxsMW
	+btYtmaNf4tu3YZcgQ5urSo=
X-Google-Smtp-Source: ABdhPJzfmsWUPZI98ctxJ7iBA7EjBVpaZFnHW54OyMwgehgB99FB36yeOre1EaBU/HqrcHzWiOUMrA==
X-Received: by 2002:a05:6512:2214:: with SMTP id h20mr1158603lfu.81.1612947748361;
        Wed, 10 Feb 2021 01:02:28 -0800 (PST)
Subject: Re: [PATCH V4 24/24] [RFC] libxl: Add support for virtio-disk
 configuration
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-25-git-send-email-olekstysh@gmail.com>
 <e1da0892-5496-b438-f52f-1e5dd8d48979@xen.org>
 <87f92e40-6462-21ba-0c56-b77c6518fef8@gmail.com>
 <dce22061-aa73-dba7-601d-fe20f989688d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <57272148-ff37-1e5e-1b83-b56304431bc9@gmail.com>
Date: Wed, 10 Feb 2021 11:02:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dce22061-aa73-dba7-601d-fe20f989688d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.01.21 19:05, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


Sorry for the late response.


>
> On 18/01/2021 08:32, Oleksandr wrote:
>>
>> On 16.01.21 00:01, Julien Grall wrote:
>>> Hi Oleksandr,
>>
>> Hi Julien
>>
>>
>>>
>>> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This patch adds basic support for configuring and assisting 
>>>> virtio-disk
>>>> backend (emualator) which is intended to run out of Qemu and could 
>>>> be run
>>>> in any domain.
>>>>
>>>> Xenstore was chosen as a communication interface for the emulator 
>>>> running
>>>> in non-toolstack domain to be able to get configuration either by 
>>>> reading
>>>> Xenstore directly or by receiving command line parameters (an 
>>>> updated 'xl devd'
>>>> running in the same domain would read Xenstore beforehand and call 
>>>> backend
>>>> executable with the required arguments).
>>>>
>>>> An example of domain configuration (two disks are assigned to the 
>>>> guest,
>>>> the latter is in readonly mode):
>>>>
>>>> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
>>>>
>>>> Where per-disk Xenstore entries are:
>>>> - filename and readonly flag (configured via "vdisk" property)
>>>> - base and irq (allocated dynamically)
>>>>
>>>> Besides handling 'visible' params described in configuration file,
>>>> patch also allocates virtio-mmio specific ones for each device and
>>>> writes them into Xenstore. virtio-mmio params (irq and base) are
>>>> unique per guest domain, they allocated at the domain creation time
>>>> and passed through to the emulator. Each VirtIO device has at least
>>>> one pair of these params.
>>>>
>>>> TODO:
>>>> 1. An extra "virtio" property could be removed.
>>>> 2. Update documentation.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> [On Arm only]
>>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>>>
>>>> ---
>>>> Changes RFC -> V1:
>>>>     - no changes
>>>>
>>>> Changes V1 -> V2:
>>>>     - rebase according to the new location of libxl_virtio_disk.c
>>>>
>>>> Changes V2 -> V3:
>>>>     - no changes
>>>>
>>>> Changes V3 -> V4:
>>>>     - rebase according to the new argument for 
>>>> DEFINE_DEVICE_TYPE_STRUCT
>>>>
>>>> Please note, there is a real concern about VirtIO interrupts 
>>>> allocation.
>>>> [Just copy here what Stefano said in RFC thread]
>>>>
>>>> So, if we end up allocating let's say 6 virtio interrupts for a 
>>>> domain,
>>>> the chance of a clash with a physical interrupt of a passthrough 
>>>> device is real.
>>>
>>> For the first version, I think a static approach is fine because it 
>>> doesn't bind us to anything yet (there is no interface change). We 
>>> can refine it on follow-ups as we figure out how virtio is going to 
>>> be used in the field.
>>>
>>>>
>>>> I am not entirely sure how to solve it, but these are a few ideas:
>>>> - choosing virtio interrupts that are less likely to conflict 
>>>> (maybe > 1000)
>>>
>>> Well, we only support 988 interrupts :). However, we will waste some 
>>> memory in the vGIC structure (we would need to allocate memory for 
>>> the 988 interrupts) if you chose an interrupt towards then end.
>>>
>>>> - make the virtio irq (optionally) configurable so that a user could
>>>>    override the default irq and specify one that doesn't conflict
>>>
>>> This is not very ideal because it makes the use of virtio quite 
>>> unfriendly with passthrough. Note that platform device passthrough 
>>> is already unfriendly, but I am thinking PCI :).
>>>
>>>> - implementing support for virq != pirq (even the xl interface doesn't
>>>>    allow to specify the virq number for passthrough devices, see 
>>>> "irqs")
>>> I can't remember whether I had a reason to not support virq != pirq 
>>> when this was initially implemented. This is one possibility, but it 
>>> is as unfriendly as the previous option.
>>>
>>> I will add a 4th one:
>>>    - Automatically allocate the virtio IRQ. This should be possible 
>>> to do it without too much trouble as we know in advance which IRQs 
>>> will be passthrough.
>> As I understand the IRQs for passthrough are described in "irq" 
>> property and stored in d_config->b_info.irqs[i], so yes we know in 
>> advance which IRQs will be used for passthrough
>> and we will be able to choose non-clashed ones (iterating over all 
>> IRQs in a reserved range) for the virtio devices.  The question is 
>> how many IRQs should be reserved.
>
> If we are automatically selecting the interrupt for virtio devices, 
> then I don't think we need to reserve a batch. Instead, we can 
> allocate one by one as we create the virtio device in libxl.

Looks like, yes, the reserved range is not needed if we use 4th option.


>
>
> For the static case, then a range of 10-20 might be sufficient for now.

ok


Thinking a bit more what approach to choose...
I would tend to automatically allocate the virtio IRQ (4th option) 
rather than use static approach with reserved IRQs
in order to eliminate the chance of a clash with a physical IRQs 
completely from the very beginning. From other side
we can indeed use static approach (as simpler one) for now and then 
refine it when we have more understanding about the virtio usage.
What do you think?


>
>
> [...]
>
>>>> -        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
>>>> +        uint64_t virtio_base;
>>>> +        libxl_device_virtio_disk *virtio_disk;
>>>> +
>>>> +        virtio_base = GUEST_VIRTIO_MMIO_BASE;
>>>>           virtio_irq = GUEST_VIRTIO_MMIO_SPI;
>>>
>>> Looking at patch #23, you defined a single SPI and a region that can 
>>> only fit virtio device. However, here, you are going to define 
>>> multiple virtio devices.
>>>
>>> I think you want to define the following:
>>>
>>>  - GUEST_VIRTIO_MMIO_BASE: Base address of the virtio window
>>>  - GUEST_VIRTIO_MMIO_SIZE: Full length of the virtio window (may 
>>> contain multiple devices)
>>>  - GUEST_VIRTIO_SPI_FIRST: First SPI reserved for virtio
>>>  - GUEST_VIRTIO_SPI_LAST: Last SPI reserved for virtio
>>>
>>> The per-device size doesn't need to be defined in arch-arm.h. 
>>> Instead, I would only define internally (unless we can use a 
>>> virtio.h header from Linux?).
>>
>> I think I got the idea. What are the preferences for these values?
>
> I have suggested some values in patch #23. Let me know what you think 
> there.

ok, thank you. I agree with the values.


>
>
> [...]
>
>>>> +
>>>> +        nr_spis += (virtio_irq - 32) + 1;
>>>>           virtio_enabled = true;
>>>>       }
>>>
>>> [...]
>>>
>>>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>>>> index 2a3364b..054a0c9 100644
>>>> --- a/tools/xl/xl_parse.c
>>>> +++ b/tools/xl/xl_parse.c
>>>> @@ -1204,6 +1204,120 @@ out:
>>>>       if (rc) exit(EXIT_FAILURE);
>>>>   }
>>>>   +#define MAX_VIRTIO_DISKS 4
>>>
>>> May I ask why this is hardcoded to 4?
>>
>> I found 4 as a reasonable value for the initial implementation.
>> This means how many disks the single device instance can handle.
>
> Right, the question is why do you need to impose a limit in xl?
>
> Looking at the code, the value is only used in:
>
> +        if (virtio_disk->num_disks > MAX_VIRTIO_DISKS) {
> +            fprintf(stderr, "vdisk: currently only %d disks are 
> supported",
> +                    MAX_VIRTIO_DISKS);
>
> The rest of the code (at list in libxl/xl) seems to be completely 
> agnostic to the number of disks. So it feels strange to me to impose 
> what looks like an arbitrary limit in the tools.

Well, will drop this limit here.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


