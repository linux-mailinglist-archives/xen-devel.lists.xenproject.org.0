Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7823D37B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 23:12:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Qhz-0007km-VH; Wed, 05 Aug 2020 21:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3Qhy-0007kh-S5
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 21:12:22 +0000
X-Inumbo-ID: 12ad7f02-45c1-458a-ab80-d640e031215a
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12ad7f02-45c1-458a-ab80-d640e031215a;
 Wed, 05 Aug 2020 21:12:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h19so49333760ljg.13
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WG+eSyDZgT7X7JvLlS9jnjRsripYVIDIOyCobhZHaN0=;
 b=BLhoPDr17mhrDoy3hdmIGjlv7JTj6GDWI9XwKils9jTFE7CFe4TxX03xvYPeffDlFn
 DyqtSRUkZkKEieiOC7R9uoK8cIMYsU3ihJGYOCgpiSeAIObzjLGdUPr9lyfd74xu4dZR
 52kd8GhHli08WhC1ndNVw3gzxLGPkH3eHoICRGvxRDmIzrAVoUldQc7C7hao31Q2h0qD
 u3/jqSij+d+/zgLDciCn8MlShST9M/O8VxCKkKsbNnRXFQkbWpLCx/FUZ6iMKtWeeJhD
 TQUFXqJjaYSKRMbyBP57RQdi6zWMTYNF+4LztQEKVgaOWAkUKLaPsKNa90A+3N8F5+Ls
 s9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WG+eSyDZgT7X7JvLlS9jnjRsripYVIDIOyCobhZHaN0=;
 b=Tm1syiQrZI98xixhUwrC8U4zZd4edket+UtVbi1NixdychrHBwqMJpqPFwB4WponmE
 CP8NhK3OQLzZnrJ3FDDPN9HeD6qk5eGeVon70EZMhQsKIgqcoJVppJqcM8z0jKnxx5BO
 t6TarUEAHhCFDVp3B/lQg/SAu2wl3/f2lC+7zj3BSHDGPr3Cv7RSq8FnDEFEuVtEZWrf
 A8GxQdNDQbw8NxlijArkptwo4qPX952P9YBFHbrKiSnL79Dve5VaoV2itPVygVuLu5YY
 xLdeK4G4muzlOM3jmb2lB+Gn5QtU9q17yOxHW3CxY3Q0e1WwIJOzRCtM6yrowxlzYHYj
 6swA==
X-Gm-Message-State: AOAM530T7YDDU8d4ePPaR0KCsqcUgMi05ep/xrDKemVw4xbu0F3p8sKn
 nrFMWj8iecSffT8vP0u3SX4=
X-Google-Smtp-Source: ABdhPJy0S97ZqouHeaRMzu9h44cY0559W7s2Ty8p06FQ3jEHQIRsU6cWyYJ9gkGNM4heaZjqcULjUg==
X-Received: by 2002:a2e:9696:: with SMTP id q22mr2290165lji.11.1596661940493; 
 Wed, 05 Aug 2020 14:12:20 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j2sm1365043ljb.98.2020.08.05.14.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 14:12:20 -0700 (PDT)
Subject: Re: [RFC PATCH V1 10/12] libxl: Add support for virtio-disk
 configuration
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-11-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041601420.5748@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <19fd2966-6e54-4f68-7f37-b2d8bb910d93@gmail.com>
Date: Thu, 6 Aug 2020 00:12:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008041601420.5748@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 02:23, Stefano Stabellini wrote:

Hi Stefano

> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-disk
>> backend (emualator) which is intended to run out of Qemu and could be run
>> in any domain.
>>
>> Xenstore was chosen as a communication interface for the emulator running
>> in non-toolstack domain to be able to get configuration either by reading
>> Xenstore directly or by receiving command line parameters (an updated 'xl devd'
>> running in the same domain would read Xenstore beforehand and call backend
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
>> ---
>>   tools/libxl/Makefile                 |   4 +-
>>   tools/libxl/libxl_arm.c              |  63 +++++++++++++++----
>>   tools/libxl/libxl_create.c           |   1 +
>>   tools/libxl/libxl_internal.h         |   1 +
>>   tools/libxl/libxl_types.idl          |  15 +++++
>>   tools/libxl/libxl_types_internal.idl |   1 +
>>   tools/libxl/libxl_virtio_disk.c      | 109 +++++++++++++++++++++++++++++++++
>>   tools/xl/Makefile                    |   2 +-
>>   tools/xl/xl.h                        |   3 +
>>   tools/xl/xl_cmdtable.c               |  15 +++++
>>   tools/xl/xl_parse.c                  | 115 +++++++++++++++++++++++++++++++++++
>>   tools/xl/xl_virtio_disk.c            |  46 ++++++++++++++
>>   12 files changed, 360 insertions(+), 15 deletions(-)
>>   create mode 100644 tools/libxl/libxl_virtio_disk.c
>>   create mode 100644 tools/xl/xl_virtio_disk.c
>>
>> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
>> index 38cd43a..df94b13 100644
>> --- a/tools/libxl/Makefile
>> +++ b/tools/libxl/Makefile
>> @@ -141,7 +141,9 @@ LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
>>   			libxl_vtpm.o libxl_nic.o libxl_disk.o libxl_console.o \
>>   			libxl_cpupool.o libxl_mem.o libxl_sched.o libxl_tmem.o \
>>   			libxl_9pfs.o libxl_domain.o libxl_vdispl.o \
>> -			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o $(LIBXL_OBJS-y)
>> +			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o \
>> +			libxl_virtio_disk.o $(LIBXL_OBJS-y)
>> +
>>   LIBXL_OBJS += libxl_genid.o
>>   LIBXL_OBJS += _libxl_types.o libxl_flask.o _libxl_types_internal.o
>>   
>> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
>> index 4f748e3..469a8b0 100644
>> --- a/tools/libxl/libxl_arm.c
>> +++ b/tools/libxl/libxl_arm.c
>> @@ -13,6 +13,12 @@
>>   #define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
>>   #define GUEST_VIRTIO_MMIO_SPI   33
>>   
>> +#ifndef container_of
>> +#define container_of(ptr, type, member) ({			\
>> +        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
>> +        (type *)( (char *)__mptr - offsetof(type,member) );})
>> +#endif
>> +
>>   static const char *gicv_to_string(libxl_gic_version gic_version)
>>   {
>>       switch (gic_version) {
>> @@ -44,14 +50,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>           vuart_enabled = true;
>>       }
>>   
>> -    /*
>> -     * XXX: Handle properly virtio
>> -     * A proper solution would be the toolstack to allocate the interrupts
>> -     * used by each virtio backend and let the backend now which one is used
>> -     */
>>       if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
>> -        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
>> +        uint64_t virtio_base;
>> +        libxl_device_virtio_disk *virtio_disk;
>> +
>> +        virtio_base = GUEST_VIRTIO_MMIO_BASE;
>>           virtio_irq = GUEST_VIRTIO_MMIO_SPI;
>> +
>> +        if (!d_config->num_virtio_disks) {
>> +            LOG(ERROR, "Virtio is enabled, but no Virtio devices present\n");
>> +            return ERROR_FAIL;
>> +        }
>> +        virtio_disk = &d_config->virtio_disks[0];
>> +
>> +        for (i = 0; i < virtio_disk->num_disks; i++) {
>> +            virtio_disk->disks[i].base = virtio_base;
>> +            virtio_disk->disks[i].irq = virtio_irq;
>> +
>> +            LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64,
>> +                virtio_irq, virtio_base);
>> +
>> +            virtio_irq ++;
>> +            virtio_base += GUEST_VIRTIO_MMIO_SIZE;
>> +        }
>> +        virtio_irq --;
>> +
>> +        nr_spis += (virtio_irq - 32) + 1;
> It looks like it is an interrupt per device, which could lead to quite a
> few of them being allocated.

Yes.


> So, if we end up allocating
> let's say 6 virtio interrupts for a domain, the chance of a clash with a
> physical interrupt of a passthrough device is real.

Yes.


>
> I am not entirely sure how to solve it, but these are a few ideas:
> - choosing virtio interrupts that are less likely to conflict (maybe >
>    1000)
> - make the virtio irq (optionally) configurable so that a user could
>    override the default irq and specify one that doesn't conflict
> - implementing support for virq != pirq (even the xl interface doesn't
>    allow to specify the virq number for passthrough devices, see "irqs")

Good ideas. The first requires minimum effort. Couldn't we choose virtio 
interrupt to allocate after making sure it is absent in guest "irqs" 
(d_config->b_info.irqs[i]), I mean to find some holes?


-- 
Regards,

Oleksandr Tyshchenko


