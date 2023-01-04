Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5965DC58
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 19:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471383.731216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD8oK-0001zD-Ef; Wed, 04 Jan 2023 18:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471383.731216; Wed, 04 Jan 2023 18:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD8oK-0001xJ-Bx; Wed, 04 Jan 2023 18:48:24 +0000
Received: by outflank-mailman (input) for mailman id 471383;
 Wed, 04 Jan 2023 18:48:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pD8oJ-0001xC-4K
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 18:48:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b9719bd-8c60-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 19:48:20 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id ud5so84922695ejc.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 10:48:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a170906115000b008373f9ea148sm15616785eja.71.2023.01.04.10.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:48:19 -0800 (PST)
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
X-Inumbo-ID: 5b9719bd-8c60-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVquXEatkjsnt7/WWB3T+s6lCdXnkT97jqT/BXU5H7A=;
        b=zw2gd8LZo8cOpCZglRMftk6BEyJasva6EP/VBZSAXcv9OKOjH6N5pZmQws6Ilaec2r
         rxXBXUYdnR1hcB2O2ot+/iyc8XC8nfpuzUBB+5mzocUghZoJvzHGGKd4gezz20bRA00L
         ZPqt2BQcinhISzbDcrGVqFZJ8KKcWNoNxKTW3IS4d8ksDwLdFQ+eRXI0CMTEHZos7nJW
         4wydv+J9HUuKhWtC897qN0xbqsbEYNknTQabNmAjuz+S+rKwR+popxvD3jm/yuHfhFWy
         AMpN+CKtEkpMqQsePykDGSf1bAcgQeFDhx2wYgqLqJO+TotxLXqAY8bJmXoFBYAfllnv
         FiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVquXEatkjsnt7/WWB3T+s6lCdXnkT97jqT/BXU5H7A=;
        b=ei6Oct+9eEg6p0OQ9ZqtFKvY5r9cFdiP9K8hcBpX/lc991JxuOQ56I+rKTAtS9Ohki
         5OKgAJWSBnqDvadu/F3OOpC2oRpzBIeIQLXFyP1bbmQ0Wo6Hw+DEL/VZO6O8+5OoUR62
         j+D/Ys/aTSljFZSHnEYsbiyAPvdmn58R1CqkmGTFBs7Sq3m9MEpEdRznZ/VpB2YKR7E9
         hMVK0s0aB6+h6V9ci6T/JM3WJklkKdjxZcLuZ9bLghfzN10xuxrlrioNcEGkp7aqIySO
         zOumbtW7YlBAAqNilUxmvIyy5Iwlh+h6A2NiYo0mUOkL7zWXTZcxOhNAXW1fWk2zUJ3y
         yB6g==
X-Gm-Message-State: AFqh2ko/5UC8owhvfPFr0GQz10WCDL22bthoM246z0R7glYKE7NLzZp6
	vRWcPPHIMKsjO0V5e+J4ZBK29w==
X-Google-Smtp-Source: AMrXdXtYAXbVIrEFvTkHu0Nr5M4bnN/BQvUtskqbL1WpwJ+T9PNcK0ZQpANoPO0mI9+9TvUnAkcmxg==
X-Received: by 2002:a17:907:c68a:b0:84c:e9c4:5751 with SMTP id ue10-20020a170907c68a00b0084ce9c45751mr6014067ejc.74.1672858100076;
        Wed, 04 Jan 2023 10:48:20 -0800 (PST)
Message-ID: <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
Date: Wed, 4 Jan 2023 19:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 18:54, Chuck Zmudzinski wrote:
> On 1/4/23 10:35 AM, Philippe Mathieu-Daudé wrote:
>> +Markus/Thomas
>>
>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>    hw/i386/pc_piix.c             |  4 +---
>>>    hw/isa/piix.c                 | 20 --------------------
>>>    include/hw/southbridge/piix.h |  1 -
>>>    3 files changed, 1 insertion(+), 24 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 5738d9cdca..6b8de3d59d 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>        if (pcmc->pci_enabled) {
>>>            DeviceState *dev;
>>>            PCIDevice *pci_dev;
>>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>> -                                         : TYPE_PIIX3_DEVICE;
>>>            int i;
>>>    
>>>            pci_bus = i440fx_init(pci_type,
>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>                                           : pci_slot_get_pirq);
>>>            pcms->bus = pci_bus;
>>>    
>>> -        pci_dev = pci_new_multifunction(-1, true, type);
>>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>>            object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>                                     machine_usb(machine), &error_abort);
>>>            object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>> index 98e9b12661..e4587352c9 100644
>>> --- a/hw/isa/piix.c
>>> +++ b/hw/isa/piix.c
>>> @@ -33,7 +33,6 @@
>>>    #include "hw/qdev-properties.h"
>>>    #include "hw/ide/piix.h"
>>>    #include "hw/isa/isa.h"
>>> -#include "hw/xen/xen.h"
>>>    #include "sysemu/runstate.h"
>>>    #include "migration/vmstate.h"
>>>    #include "hw/acpi/acpi_aml_interface.h"
>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>>        .class_init    = piix3_class_init,
>>>    };
>>>    
>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>> -{
>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> -
>>> -    k->realize = piix3_realize;
>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>> -    dc->vmsd = &vmstate_piix3;
>>
>> IIUC, since this device is user-creatable, we can't simply remove it
>> without going thru the deprecation process. Alternatively we could
>> add a type alias:
>>
>> -- >8 --
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 4b0ef65780..d94f7ea369 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>>                                  QEMU_ARCH_LOONGARCH)
>>    #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>    #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>
>>    /* Please keep this table sorted by typename. */
>>    static const QDevAlias qdev_alias_table[] = {
>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
>>        { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>>        { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>>        { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
> 
> Hi Bernhard,
> 
> Can you comment if this should be:
> 
> +    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
> 
> instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
> replaced them with PIIX. Or am I not understanding correctly?

There is a confusion in QEMU between PCI bridges, the first PCI
function they implement, and the other PCI functions.

Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
south bridge chipset, which expose a PCI-to-ISA bridge". A better
name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
device is named "PIIX3" with no indication of ISA bridge.

