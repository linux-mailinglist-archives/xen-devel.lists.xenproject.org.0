Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329C51136B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314513.532593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njcu9-0003ea-DO; Wed, 27 Apr 2022 08:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314513.532593; Wed, 27 Apr 2022 08:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njcu9-0003cb-9i; Wed, 27 Apr 2022 08:20:09 +0000
Received: by outflank-mailman (input) for mailman id 314513;
 Wed, 27 Apr 2022 08:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYrv=VF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1njcu7-0003YD-Qi
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:20:07 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86bf5eb-c602-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 10:20:06 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id x33so1832092lfu.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Apr 2022 01:20:06 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a194955000000b00471f0aea31fsm1730534lfj.39.2022.04.27.01.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 01:20:05 -0700 (PDT)
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
X-Inumbo-ID: d86bf5eb-c602-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dhf1reZJOa45GC0I46wPwCpg+/0wqt7dtK9ioMi1z3s=;
        b=NGx49lM7BRPmlL8qfpvveyxCVdNoxG7Apvew4FdejhMmqSEj4pmpZhTC5h/PAV7INZ
         nPk3MRuwrHuLn1J+7Yxchs81i7gSWnQCSIeWEA5C5HEQIJRVK+yUKDbCwoMoMmeJq06D
         R1pjHA4IhvKaBzolr7/Z6xgKFPQ3APEZUsylqYPjCBMhggWGVdMb5lXBRQzHp3XM0yu9
         wOMX6cIUvl4Kxy3t7ug0lUkQiYcXkv63JVxYBREdmvJS2AAbLX0jCyU9h2WKPRI0asqG
         efOsYwpWAREj2BLBuDeN29NBLdrzXX8HFO8S9qFU9niv9bysNc0s0fE0IZMjxsIHEIpw
         Uzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dhf1reZJOa45GC0I46wPwCpg+/0wqt7dtK9ioMi1z3s=;
        b=SbcRwJqjtKFVjaa0aKsiRF2KtAqtjfUbatEpto2x7VkTXRDopd0cKCUM7C7z36T5e2
         QsSpNacTvcsNa1tD2u18gCfnAtrZ0vEFz2cb4a2qBs0PeKuY2NmtVbkqyQ31tMcYFMfH
         LENfx2eHAeqNMEP1xwvz8yfIxnzkHUbm80aeNdkKY8MrfJ6/49McLs1IumjzDY6RUvMv
         b9Mn5s67eD0Y05nJj30tNk3hD8ZCNllhf9KAC8oOCiTqUzjwYiPNkOgfYj5KAIk27WKf
         +EBX4lYtefrIS7V7D9KA2tqY+IGwpB1JvKBmDKSqBwiNsv+BO5sL3TJ3zWwRGbr1WTEY
         C/Eg==
X-Gm-Message-State: AOAM533LxLfqwpxyVHr1ZgrpC6fARQmEpXasGoGY8U4DzC7Kohu3vL34
	CNpevn/KsPTFcKJPMW0KEQM=
X-Google-Smtp-Source: ABdhPJzOYbX5/ai8O4gWVRe2se2gUadbxtiXn6Xt7xDuWkEhH2CdERQFgltLDZHF+SGz1qkrO3yk8A==
X-Received: by 2002:a05:6512:12c3:b0:471:9d1d:3f46 with SMTP id p3-20020a05651212c300b004719d1d3f46mr19332172lfg.155.1651047605857;
        Wed, 27 Apr 2022 01:20:05 -0700 (PDT)
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <YmJ4NLuvA63Irow+@Air-de-Roger>
 <24112cfc-0446-d81e-85f1-ebf9da0afe14@gmail.com>
 <YmaeLc2iwxUPUAvF@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <57bfc576-48d5-9121-a32e-fa00be64d6a9@gmail.com>
Date: Wed, 27 Apr 2022 11:20:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YmaeLc2iwxUPUAvF@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 25.04.22 16:12, Roger Pau Monné wrote:


Hello Roger


> On Sat, Apr 23, 2022 at 10:39:14AM +0300, Oleksandr wrote:
>> On 22.04.22 12:41, Roger Pau Monné wrote:
>>
>>
>> Hello Roger
>>
>>> On Fri, Apr 08, 2022 at 09:21:04PM +0300, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This patch adds basic support for configuring and assisting virtio-mmio
>>>> based virtio-disk backend (emualator) which is intended to run out of
>>>> Qemu and could be run in any domain.
>>>> Although the Virtio block device is quite different from traditional
>>>> Xen PV block device (vbd) from the toolstack's point of view:
>>>>    - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>>>      written to Xenstore are fetched by the frontend (the vdev is not
>>>>      passed to the frontend)
>>>>    - the ring-ref/event-channel are not used for the backend<->frontend
>>>>      communication, the proposed IPC for Virtio is IOREQ/DM
>>>> it is still a "block device" and ought to be integrated in existing
>>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>>>> logic to deal with Virtio devices as well.
>>>>
>>>> For the immediate purpose and an ability to extend that support for
>>>> other use-cases in future (Qemu, virtio-pci, etc) perform the following
>>>> actions:
>>>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>>>>     that in the configuration
>>>> - Introduce new disk protocol field to libxl_device_disk struct
>>>>     (with LIBXL_DISK_PROTOCOL_XEN and LIBXL_DISK_PROTOCOL_VIRTIO_MMIO
>>>>     types) and reflect that in the configuration (new "protocol" option
>>>>     with "xen" protocol being default value)
>>>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>>>     one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>>>>
>>>> An example of domain configuration for Virtio disk:
>>>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, protocol=virtio-mmio']
>>>>
>>>> Nothing has changed for default Xen disk configuration.
>>>>
>>>> Please note, this patch is not enough for virtio-disk to work
>>>> on Xen (Arm), as for every Virtio device (including disk) we need
>>>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>>>> them to the backend, also update Guest device-tree. The subsequent
>>>> patch will add these missing bits. For the current patch,
>>>> the default "irq" and "base" are just written to the Xenstore.
>>>> This is not an ideal splitting, but this way we avoid breaking
>>>> the bisectability.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Changes RFC -> V1:
>>>>      - no changes
>>>>
>>>> Changes V1 -> V2:
>>>>      - rebase according to the new location of libxl_virtio_disk.c
>>>>
>>>> Changes V2 -> V3:
>>>>      - no changes
>>>>
>>>> Changes V3 -> V4:
>>>>      - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT
>>>>
>>>> Changes V4 -> V5:
>>>>      - split the changes, change the order of the patches
>>>>      - update patch description
>>>>      - don't introduce new "vdisk" configuration option with own parsing logic,
>>>>        re-use Xen PV block "disk" parsing/configuration logic for the virtio-disk
>>>>      - introduce "virtio" flag and document it's usage
>>>>      - add LIBXL_HAVE_DEVICE_DISK_VIRTIO
>>>>      - update libxlu_disk_l.[ch]
>>>>      - drop num_disks variable/MAX_VIRTIO_DISKS
>>>>      - drop Wei's T-b
>>>>
>>>> Changes V5 -> V6:
>>>>      - rebase on current staging
>>>>      - use "%"PRIu64 instead of %lu for disk->base in device_disk_add()
>>>>      - update *.gen.go files
>>>>
>>>> Changes V6 -> V7:
>>>>      - rebase on current staging
>>>>      - update *.gen.go files and libxlu_disk_l.[ch] files
>>>>      - update patch description
>>>>      - rework significantly to support more flexible configuration
>>>>        and have more generic basic implementation for being able to extend
>>>>        that for other use-cases (virtio-pci, qemu, etc).
>>>> ---
>>>>    docs/man/xl-disk-configuration.5.pod.in   |  37 +-
>>>>    tools/golang/xenlight/helpers.gen.go      |   6 +
>>>>    tools/golang/xenlight/types.gen.go        |  11 +
>>>>    tools/include/libxl.h                     |   6 +
>>>>    tools/libs/light/libxl_device.c           |  57 +-
>>>>    tools/libs/light/libxl_disk.c             | 111 +++-
>>>>    tools/libs/light/libxl_internal.h         |   1 +
>>>>    tools/libs/light/libxl_types.idl          |  10 +
>>>>    tools/libs/light/libxl_types_internal.idl |   1 +
>>>>    tools/libs/light/libxl_utils.c            |   2 +
>>>>    tools/libs/util/libxlu_disk_l.c           | 952 +++++++++++++++---------------
>>>>    tools/libs/util/libxlu_disk_l.h           |   2 +-
>>>>    tools/libs/util/libxlu_disk_l.l           |   9 +
>>>>    tools/xl/xl_block.c                       |  11 +
>>>>    14 files changed, 736 insertions(+), 480 deletions(-)
>>>>
>>>> diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
>>>> index 71d0e86..36c851f 100644
>>>> --- a/docs/man/xl-disk-configuration.5.pod.in
>>>> +++ b/docs/man/xl-disk-configuration.5.pod.in
>>>> @@ -232,7 +232,7 @@ Specifies the backend implementation to use
>>>>    =item Supported values
>>>> -phy, qdisk
>>>> +phy, qdisk, other
>>>>    =item Mandatory
>>>> @@ -244,11 +244,13 @@ Automatically determine which backend to use.
>>>>    =back
>>>> -This does not affect the guest's view of the device.  It controls
>>>> -which software implementation of the Xen backend driver is used.
>>>> +It controls which software implementation of the backend driver is used.
>>>> +Depending on the "protocol" option this may affect the guest's view
>>>> +of the device.
>>>>    Not all backend drivers support all combinations of other options.
>>>> -For example, "phy" does not support formats other than "raw".
>>>> +For example, "phy" and "other" do not support formats other than "raw" and
>>>> +"other" does not support protocols other than "virtio-mmio".
>>>>    Normally this option should not be specified, in which case libxl will
>>>>    automatically determine the most suitable backend.
>>>> @@ -344,8 +346,35 @@ can be used to disable "hole punching" for file based backends which
>>>>    were intentionally created non-sparse to avoid fragmentation of the
>>>>    file.
>>>> +=item B<protocol>=I<PROTOCOL>
>>>> +
>>>> +=over 4
>>>> +
>>>> +=item Description
>>>> +
>>>> +Specifies the communication protocol to use for the chosen "backendtype" option
>>>> +
>>>> +=item Supported values
>>>> +
>>>> +xen, virtio-mmio
>>>   From a user PoV, I think it would be better to just select xen or
>>> virtio here, but not the underlying configuration mechanism used to
>>> expose the devices to the guest.
>> I got your point.
>>
>>
>>
>>> We would likely need to add a different option to select mmio or pci
>>> then, but that should be set by default based on architecture/guest
>>> type.  For example on x86 it should default to pci, while on Arm I
>>> guess it will depend on whether the guest has PCI or not?
>>>
>>> In any case, I think we should offer an option that's selecting
>>> between xen or virtio protocol, and the way to expose the
>>> configuration of the device shouldn't need to be explicitly selected
>>> by the user.
>>
>> ok, for now I will use "xen and virtio" values for the "protocol" option,
>> then internally toolstack will assume that "virtio" really means
>> "virtio-mmio".
>>
>> When there is a need to expand that support to "virtio-pci", we will see how
>> to deal with it from the configuration PoV, probably like you suggested
>> above by adding another option (e.g. "transport") with default values based
>> on the architecture/guest type.
> I think this likely also wants to be a separate field in libxl_device_disk,
> which could be left empty and libxl will attempt to set a default.
> For example have the following in libxl_types.idl:
>
> libxl_device_protocol = Enumeration("device_protocol", [
>      (0, "UNKNOWN"),
>      (1, "XEN"),
>      (2, "VIRTIO"),
>      ])
>
> libxl_device_configuration = Enumeration("device_configuration", [
>      (0, "UNKNOWN"),
>      (1, "XENBUS"),
>      (2, "MMIO"),
>      ])
>
> libxl_device_disk = Struct("device_disk", [
>      ("protocol", libxl_device_protocol),
>      ("configuration", libxl_device_configuration),
>      ])
>
> I don't like libxl_device_configuration much, I think is too generic,
> but I can't think of anything better.  Maybe others can provide better
> names.


Here [1] we had a discussion regarding user configuration options. 
"protocol" cannot be used as it will lead to the confusion (at least 
with Xen PV block device which already has "protocol" frontend's entry 
in Xenstore).

Preliminary, we had agreed on the following names:
1. specification: xen or virtio
2. transport: mmio or pci

Please tell me, are you OK with them?


[1] 
https://lore.kernel.org/xen-devel/e657458d-d33e-a340-d9fe-152ec97eefec@suse.com/


>
> Thanks, Roger.

-- 
Regards,

Oleksandr Tyshchenko


