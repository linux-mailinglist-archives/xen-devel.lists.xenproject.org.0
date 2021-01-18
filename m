Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785992F9B4C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69439.124258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PxS-0007vc-TO; Mon, 18 Jan 2021 08:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69439.124258; Mon, 18 Jan 2021 08:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PxS-0007vC-Pt; Mon, 18 Jan 2021 08:32:18 +0000
Received: by outflank-mailman (input) for mailman id 69439;
 Mon, 18 Jan 2021 08:32:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh0t=GV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1PxQ-0007v7-IU
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:32:16 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c74d576-4e4c-4015-9c40-b5c9333e4222;
 Mon, 18 Jan 2021 08:32:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id o19so22862454lfo.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 00:32:15 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d11sm1817765lfe.115.2021.01.18.00.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:32:13 -0800 (PST)
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
X-Inumbo-ID: 5c74d576-4e4c-4015-9c40-b5c9333e4222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cUAiSNfY0qwI70AIo04DtHLatNkF7ujaxbjX9UgOsiA=;
        b=WE/l5Q4VWJ0TletytJwkxuSO62nSj4ASZomJKzzJ5D9pXPoJD4IoL6F3APWoEvs6TT
         ro8Zifk/vrBps69a+cXD7k4PMxwEqh81bjiLR3FCYm9+/5w6pdDUVEGHIcFtdhkrYV4A
         IolIuuIhucO+MD3Fz7ZY8FT0PSP8ej2KqDUODp3Nob+o0gxDqJVsWOkCaZuZVwK9Ps/G
         gi/x5buPQP0gCVOJXNwKMdyvITfh6pFP3yu2nMWTfKPGZ7yTwGnlew/9RKSKiZ0H72yT
         WGyLz2g+Bz0nZrZyLxcB+WZHR04+UrpHWREgpSHpCsYpltF1WZNJMrKvN8q5G5hW1hzT
         Y8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cUAiSNfY0qwI70AIo04DtHLatNkF7ujaxbjX9UgOsiA=;
        b=qZ96TF3fbSAgAMNug3TTEOUsQfP3M26q+eo5v5SyWasznjGzLkvKkhukiYJXZGyj8C
         3HUH1ez6miLkq1vRW+b03zVIFYimPxcK9QuHvgQiwkf+y6FhT9EqLWk4y7alU305zh8v
         nk+/tewX9wMgxpd/ypqBSzSUoiLJhu1qEfSMm4fWKsSjBU4ZjyrNcmURowQ+PUE8fB4q
         u2kr9Nx+Fog+Jjd1pTY1SK9hCeQwsQeZ+pXJaBMYkrJTHZd9HyMB6PaUlNAPERzedHiA
         r7GaMU6NEOMTvEVQMtPKkdduVTGKvMTsYYFIY4DtmNKS3iwwGhtZS8kgKbzshYBMcGuG
         oNYg==
X-Gm-Message-State: AOAM532zVggJCz6WTizCIMZ0aP6qMurB+Etaz4ysTwHJtgUYYYr8vigb
	8jzbU719FnffasDILKMukcM=
X-Google-Smtp-Source: ABdhPJyF/e2vW62Vy2Mk11S/x//4oA65ZavR+JT6Ikoe0GuGptDz/srXY6E6t/W87sNf32kmmBJlDA==
X-Received: by 2002:a19:c711:: with SMTP id x17mr10928049lff.56.1610958733830;
        Mon, 18 Jan 2021 00:32:13 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <87f92e40-6462-21ba-0c56-b77c6518fef8@gmail.com>
Date: Mon, 18 Jan 2021 10:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e1da0892-5496-b438-f52f-1e5dd8d48979@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.01.21 00:01, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-disk
>> backend (emualator) which is intended to run out of Qemu and could be 
>> run
>> in any domain.
>>
>> Xenstore was chosen as a communication interface for the emulator 
>> running
>> in non-toolstack domain to be able to get configuration either by 
>> reading
>> Xenstore directly or by receiving command line parameters (an updated 
>> 'xl devd'
>> running in the same domain would read Xenstore beforehand and call 
>> backend
>> executable with the required arguments).
>>
>> An example of domain configuration (two disks are assigned to the guest,
>> the latter is in readonly mode):
>>
>> vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]
>>
>> Where per-disk Xenstore entries are:
>> - filename and readonly flag (configured via "vdisk" property)
>> - base and irq (allocated dynamically)
>>
>> Besides handling 'visible' params described in configuration file,
>> patch also allocates virtio-mmio specific ones for each device and
>> writes them into Xenstore. virtio-mmio params (irq and base) are
>> unique per guest domain, they allocated at the domain creation time
>> and passed through to the emulator. Each VirtIO device has at least
>> one pair of these params.
>>
>> TODO:
>> 1. An extra "virtio" property could be removed.
>> 2. Update documentation.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Changes RFC -> V1:
>>     - no changes
>>
>> Changes V1 -> V2:
>>     - rebase according to the new location of libxl_virtio_disk.c
>>
>> Changes V2 -> V3:
>>     - no changes
>>
>> Changes V3 -> V4:
>>     - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT
>>
>> Please note, there is a real concern about VirtIO interrupts allocation.
>> [Just copy here what Stefano said in RFC thread]
>>
>> So, if we end up allocating let's say 6 virtio interrupts for a domain,
>> the chance of a clash with a physical interrupt of a passthrough 
>> device is real.
>
> For the first version, I think a static approach is fine because it 
> doesn't bind us to anything yet (there is no interface change). We can 
> refine it on follow-ups as we figure out how virtio is going to be 
> used in the field.
>
>>
>> I am not entirely sure how to solve it, but these are a few ideas:
>> - choosing virtio interrupts that are less likely to conflict (maybe 
>> > 1000)
>
> Well, we only support 988 interrupts :). However, we will waste some 
> memory in the vGIC structure (we would need to allocate memory for the 
> 988 interrupts) if you chose an interrupt towards then end.
>
>> - make the virtio irq (optionally) configurable so that a user could
>>    override the default irq and specify one that doesn't conflict
>
> This is not very ideal because it makes the use of virtio quite 
> unfriendly with passthrough. Note that platform device passthrough is 
> already unfriendly, but I am thinking PCI :).
>
>> - implementing support for virq != pirq (even the xl interface doesn't
>>    allow to specify the virq number for passthrough devices, see "irqs")
> I can't remember whether I had a reason to not support virq != pirq 
> when this was initially implemented. This is one possibility, but it 
> is as unfriendly as the previous option.
>
> I will add a 4th one:
>    - Automatically allocate the virtio IRQ. This should be possible to 
> do it without too much trouble as we know in advance which IRQs will 
> be passthrough.
As I understand the IRQs for passthrough are described in "irq" property 
and stored in d_config->b_info.irqs[i], so yes we know in advance which 
IRQs will be used for passthrough
and we will be able to choose non-clashed ones (iterating over all IRQs 
in a reserved range) for the virtio devices.  The question is how many 
IRQs should be reserved.


>
> My preference is the 4th one, that said we may also want to pick 
> either 2 or 3 to give some flexibility to an admin if they wish to get 
> their hand dirty.

Personally I would be ok with 4th, but without admin involvement.


>
>
>>
>> Also there is one suggestion from Wei Chen regarding a parameter for 
>> domain
>> config file which I haven't addressed yet.
>> [Just copy here what Wei said in V2 thread]
>> Can we keep use the same 'disk' parameter for virtio-disk, but add an 
>> option like
>> "model=virtio-disk"?
>> For example:
>> disk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3,model=virtio-disk' ]
>> Just like what Xen has done for x86 virtio-net.
>> ---
>>   tools/libs/light/Makefile                 |   1 +
>>   tools/libs/light/libxl_arm.c              |  56 ++++++++++++---
>>   tools/libs/light/libxl_create.c           |   1 +
>>   tools/libs/light/libxl_internal.h         |   1 +
>>   tools/libs/light/libxl_types.idl          |  15 ++++
>>   tools/libs/light/libxl_types_internal.idl |   1 +
>>   tools/libs/light/libxl_virtio_disk.c      | 109 
>> ++++++++++++++++++++++++++++
>>   tools/xl/Makefile                         |   2 +-
>>   tools/xl/xl.h                             |   3 +
>>   tools/xl/xl_cmdtable.c                    |  15 ++++
>>   tools/xl/xl_parse.c                       | 115 
>> ++++++++++++++++++++++++++++++
>>   tools/xl/xl_virtio_disk.c                 |  46 ++++++++++++
>>   12 files changed, 354 insertions(+), 11 deletions(-)
>>   create mode 100644 tools/libs/light/libxl_virtio_disk.c
>>   create mode 100644 tools/xl/xl_virtio_disk.c
>>
>> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
>> index 68f6fa3..ccc91b9 100644
>> --- a/tools/libs/light/Makefile
>> +++ b/tools/libs/light/Makefile
>> @@ -115,6 +115,7 @@ SRCS-y += libxl_genid.c
>>   SRCS-y += _libxl_types.c
>>   SRCS-y += libxl_flask.c
>>   SRCS-y += _libxl_types_internal.c
>> +SRCS-y += libxl_virtio_disk.c
>>     ifeq ($(CONFIG_LIBNL),y)
>>   CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 588ee5a..9eb3022 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -8,6 +8,12 @@
>>   #include <assert.h>
>>   #include <xen/device_tree_defs.h>
>>   +#ifndef container_of
>> +#define container_of(ptr, type, member) ({            \
>> +        typeof( ((type *)0)->member ) *__mptr = (ptr);    \
>> +        (type *)( (char *)__mptr - offsetof(type,member) );})
>> +#endif
>> +
>>   static const char *gicv_to_string(libxl_gic_version gic_version)
>>   {
>>       switch (gic_version) {
>> @@ -39,14 +45,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>           vuart_enabled = true;
>>       }
>>   -    /*
>> -     * XXX: Handle properly virtio
>> -     * A proper solution would be the toolstack to allocate the 
>> interrupts
>> -     * used by each virtio backend and let the backend now which one 
>> is used
>> -     */
>
> Ok, so you added some code in patch #23 that is going to be mostly 
> dropped here. I think you want to rethink how you do the split here.
>
> One possible approach would be to have a patch which adds the 
> infrastructe but no call. It would contain:
>   1) Allocate a space in the virtio region and an interrupt
>   2) Create the bindings.
>
> Those helpers can then be called in this patch.

Sounds reasonable.


>
>
>>       if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
>
> It feels to me that this parameter is not necessary. You can easily 
> infer it based whether you have a virtio disks attached or not.

Yes!


>
>
>> -        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
>> +        uint64_t virtio_base;
>> +        libxl_device_virtio_disk *virtio_disk;
>> +
>> +        virtio_base = GUEST_VIRTIO_MMIO_BASE;
>>           virtio_irq = GUEST_VIRTIO_MMIO_SPI;
>
> Looking at patch #23, you defined a single SPI and a region that can 
> only fit virtio device. However, here, you are going to define 
> multiple virtio devices.
>
> I think you want to define the following:
>
>  - GUEST_VIRTIO_MMIO_BASE: Base address of the virtio window
>  - GUEST_VIRTIO_MMIO_SIZE: Full length of the virtio window (may 
> contain multiple devices)
>  - GUEST_VIRTIO_SPI_FIRST: First SPI reserved for virtio
>  - GUEST_VIRTIO_SPI_LAST: Last SPI reserved for virtio
>
> The per-device size doesn't need to be defined in arch-arm.h. Instead, 
> I would only define internally (unless we can use a virtio.h header 
> from Linux?).

I think I got the idea. What are the preferences for these values?


>
>
>> +
>> +        if (!d_config->num_virtio_disks) {
>> +            LOG(ERROR, "Virtio is enabled, but no Virtio devices 
>> present\n");
>> +            return ERROR_FAIL;
>> +        }
>> +        virtio_disk = &d_config->virtio_disks[0];
>> +
>> +        for (i = 0; i < virtio_disk->num_disks; i++) {
>> +            virtio_disk->disks[i].base = virtio_base;
>> +            virtio_disk->disks[i].irq = virtio_irq;
>> +
>> +            LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 
>> 0x%"PRIx64,
>> +                virtio_irq, virtio_base);
>> +
>> +            virtio_irq ++;
>
> NIT: We usually don't have space before ++ or ...

ok


>
>> +            virtio_base += GUEST_VIRTIO_MMIO_SIZE;
>> +        }
>> +        virtio_irq --;
>
> ... --;

ok


>
>> +
>> +        nr_spis += (virtio_irq - 32) + 1;
>>           virtio_enabled = true;
>>       }
>
> [...]
>
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index 2a3364b..054a0c9 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -1204,6 +1204,120 @@ out:
>>       if (rc) exit(EXIT_FAILURE);
>>   }
>>   +#define MAX_VIRTIO_DISKS 4
>
> May I ask why this is hardcoded to 4?

I found 4 as a reasonable value for the initial implementation.
This means how many disks the single device instance can handle.
Do you think we need to change it?


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


