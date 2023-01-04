Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1A65E013
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 23:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471522.731399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDCMQ-0007rV-Mj; Wed, 04 Jan 2023 22:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471522.731399; Wed, 04 Jan 2023 22:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDCMQ-0007oZ-Jz; Wed, 04 Jan 2023 22:35:50 +0000
Received: by outflank-mailman (input) for mailman id 471522;
 Wed, 04 Jan 2023 22:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pDCMP-0007oT-69
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 22:35:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 219598ff-8c80-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 23:35:46 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id u9so86272002ejo.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 14:35:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a17090676d300b008072c925e4csm15659503ejn.21.2023.01.04.14.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:35:45 -0800 (PST)
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
X-Inumbo-ID: 219598ff-8c80-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9D9ufjFO5ErkH2AbAYOcVhRTOeT61tLIfkXN1tOblOs=;
        b=qv7p6hbUZqhwy3iQDuhw5Zh/OaU+jdEqOBkCsMH4ACc+FvjAC91j7cExF3wcIjxTj/
         P5Af9RwADSEA4/2xj9jtn/bp4tinOssr7+eXzK5rb5W23ksxutq2KGWCOV8Vx0xUBEIj
         3SDQr6m6fnxHqGsFHN4hmyUPzpeyrvMBIGoy8RJkUKrdu3Dlse6HMVzuWofLbywDG8w7
         Yh0M2kZfJ6Hbhlrvq9jKxqEIEnU2CxVdRasynMZS6octhZaF3M72EbUgEIdGnHxJ5c16
         Zgdizvrjpo+H4Q9780RNeX85HvoeAzJ5ShUyofin14VywCadZG8+7SGyzKC6eUot9hS0
         mg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D9ufjFO5ErkH2AbAYOcVhRTOeT61tLIfkXN1tOblOs=;
        b=QhR2R8+ZYlkN2bhd4y7JoLRNbAnp/A+oYxJP6oo75shvul7BlwYL2GWUd1pfpX9Fxi
         DPfIBa/hiBev9agcpRVfJBepHSyYUzGycD/XBEjtyUxOBPZGEi6QVZSRYDhl1CH688Mm
         xsTWlTraHRdLqSXA7Uv9kYQ61MOWOnG6FHGZgTuf2G4PWSqtrsSxYbNZFCnxoqGl1fso
         gZlks54ekuejTuk4oaO+pNdkDAH/fHchGLKcacpwrqx3QG2spKh2EuOI14jQR+ku+NtG
         e39yhoSAYT39jFsHQ2v0Iww04UcxdX/Q1YkleB9s6/tQKpn0HDzmyEsKZuWhhwWGWzFx
         6CWA==
X-Gm-Message-State: AFqh2kpSRM3v/xXTRMgrEUEpEO4Re4QVN6u6iAVchg3CWrV6WznTHAbp
	RwJnwBvPW3+6h5JhcAkrefqxOg==
X-Google-Smtp-Source: AMrXdXsQ3IhtNb5cG1wk60QS7wd3RDWh6fd1SXn/KbYkoE54jRIhMPY1SXG2MimpwT8M9GQLVoAtyg==
X-Received: by 2002:a17:907:86a6:b0:7c0:fd1a:79f0 with SMTP id qa38-20020a17090786a600b007c0fd1a79f0mr59371406ejc.21.1672871746219;
        Wed, 04 Jan 2023 14:35:46 -0800 (PST)
Message-ID: <405dc396-7b7e-842a-2b94-6b26df1aa564@linaro.org>
Date: Wed, 4 Jan 2023 23:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <30ed41ab-f7c9-15fb-8f4b-b2742b1d4188@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <30ed41ab-f7c9-15fb-8f4b-b2742b1d4188@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 17:42, Chuck Zmudzinski wrote:
> On 1/4/23 9:44 AM, Bernhard Beschow wrote:
>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/i386/pc_piix.c             |  4 +---
>>   hw/isa/piix.c                 | 20 --------------------
>>   include/hw/southbridge/piix.h |  1 -
>>   3 files changed, 1 insertion(+), 24 deletions(-)
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 5738d9cdca..6b8de3d59d 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>       if (pcmc->pci_enabled) {
>>           DeviceState *dev;
>>           PCIDevice *pci_dev;
>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>> -                                         : TYPE_PIIX3_DEVICE;
>>           int i;
>>   
>>           pci_bus = i440fx_init(pci_type,
>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>                                          : pci_slot_get_pirq);
>>           pcms->bus = pci_bus;
>>   
>> -        pci_dev = pci_new_multifunction(-1, true, type);
>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>                                    machine_usb(machine), &error_abort);
>>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>> index 98e9b12661..e4587352c9 100644
>> --- a/hw/isa/piix.c
>> +++ b/hw/isa/piix.c
>> @@ -33,7 +33,6 @@
>>   #include "hw/qdev-properties.h"
>>   #include "hw/ide/piix.h"
>>   #include "hw/isa/isa.h"
>> -#include "hw/xen/xen.h"
>>   #include "sysemu/runstate.h"
>>   #include "migration/vmstate.h"
>>   #include "hw/acpi/acpi_aml_interface.h"
>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>       .class_init    = piix3_class_init,
>>   };
>>   
>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>> -{
>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> -
>> -    k->realize = piix3_realize;
>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>> -    dc->vmsd = &vmstate_piix3;
>> -}
>> -
>> -static const TypeInfo piix3_xen_info = {
>> -    .name          = TYPE_PIIX3_XEN_DEVICE,
>> -    .parent        = TYPE_PIIX_PCI_DEVICE,
>> -    .instance_init = piix3_init,
>> -    .class_init    = piix3_xen_class_init,
>> -};
>> -
>>   static void piix4_realize(PCIDevice *dev, Error **errp)
>>   {
>>       ERRP_GUARD();
>> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>>   {
>>       type_register_static(&piix_pci_type_info);
>>       type_register_static(&piix3_info);
>> -    type_register_static(&piix3_xen_info);
>>       type_register_static(&piix4_info);
>>   }
>>   
>> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
>> index 65ad8569da..b1fc94a742 100644
>> --- a/include/hw/southbridge/piix.h
>> +++ b/include/hw/southbridge/piix.h
>> @@ -77,7 +77,6 @@ struct PIIXState {
>>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>>   
>>   #define TYPE_PIIX3_DEVICE "PIIX3"
>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>   
>>   #endif
> 
> 
> This fixes the regression with the emulated usb tablet device that I reported in v1 here:
> 
> https://lore.kernel.org/qemu-devel/aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com/
> 
> I tested this patch again with all the prerequisites and now with v2 there are no regressions.
> 
> Tested-by: Chuck Zmudzinski <brchuckz@aol.com>

(IIUC Chuck meant to send this tag to the cover letter)


