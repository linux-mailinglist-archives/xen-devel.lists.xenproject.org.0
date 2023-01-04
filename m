Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C865DDCB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 21:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471484.731344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAd3-00038A-Le; Wed, 04 Jan 2023 20:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471484.731344; Wed, 04 Jan 2023 20:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDAd3-00035U-Ij; Wed, 04 Jan 2023 20:44:53 +0000
Received: by outflank-mailman (input) for mailman id 471484;
 Wed, 04 Jan 2023 20:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pDAd1-00035O-M2
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 20:44:51 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2371365-8c70-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 21:44:50 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id u28so45464790edd.10
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 12:44:50 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a05640200c500b00463c5c32c6esm15153884edu.89.2023.01.04.12.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:44:49 -0800 (PST)
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
X-Inumbo-ID: a2371365-8c70-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbV63gD9zn2fwjFvmF2ZygodMpZQcbM7tsdfwBcVKcw=;
        b=JoTrbyhvGJhx35lyAEl4uafzDehZJtSZL96Yt/G8GZyAM9VW+8CK7S+MgS6Jl360Z2
         uedFsPbWc2WBAqkRE5QrwUKI2LMmP9tIxJ+bOHpq6YZQfHu9tuLCcruvkj4euj8HY3k5
         cotEGIqV8sKqrfsO8VBrzHh8imH2bd9RoDXYgPe51OCGe3pSM+e6G1zU3N0zrBgpFTug
         vx8kd6S47Lj9jZ2rsEWEFSn7stp1xHEW9lyOZqgt+XC0OHufB57DzOhvUhNHv03pCM55
         EW/P/y2yrem3oCCItMjDKhUO3Hg0OO7PMDXqR7mQZvo3eqKlYvPOQ1YyocbnL18EKJiR
         K+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbV63gD9zn2fwjFvmF2ZygodMpZQcbM7tsdfwBcVKcw=;
        b=hDspIl/xQ5h8ScskmOwGo/gqLsAM/zsw48LIS+7xlIur54BpjFEhJpBk7T/dNtYK4J
         30Y4hHr76LaMdlA70TA5tdWxmT18KFKe0ia7QqqOyU9hJ3NJa7GE5xYCFEjgRkXd++J0
         1Y10Sbo6kgduqUsbWbiTWOyw2x5Muj1s/LRRqv+XpjIv4ZxMfYwgE5Yux6IojzNC7FLh
         LO7eoD0dQfqKiPFt5Hc47J7TdFYZm1NDC7cJt9pzivwh6WtFpDv72IXuKM51SR//8bsc
         VpbkJI37DQWkFE2cTlg9a+8JGr4NFqL/9DoybyP+Tr/vp1g9C8QldRKeXY4fXti4i0KM
         TSSA==
X-Gm-Message-State: AFqh2kqHCLDWkteorhHeIsNig/rPL0ffNqG96EZF8CKRHQaekSMoyuvB
	SR+5Dfbx0Aj+zxxFcbhFh+U=
X-Google-Smtp-Source: AMrXdXvoh5ORGxbIS7Ab4BCz07HsM9Kyaok5VbIDwUkQO0I/bxoGzMUn3yMRwqi70ndk6P6pYenC4Q==
X-Received: by 2002:a05:6402:551b:b0:46a:732e:fd29 with SMTP id fi27-20020a056402551b00b0046a732efd29mr44634692edb.42.1672865090026;
        Wed, 04 Jan 2023 12:44:50 -0800 (PST)
Date: Wed, 04 Jan 2023 20:44:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_6/6=5D_hw/isa/piix=3A_Res?= =?US-ASCII?Q?olve_redundant_TYPE=5FPIIX3=5FXEN=5FDEVICE?=
In-Reply-To: <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com> <20230104144437.27479-7-shentey@gmail.com> <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org> <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
Message-ID: <E3E983F2-0FB3-4F6B-B2D6-ABE7E021228E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 4=2E Januar 2023 17:54:16 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/4/23 10:35=E2=80=AFAM, Philippe Mathieu-Daud=C3=A9 wrote:
>> +Markus/Thomas
>>=20
>> On 4/1/23 15:44, Bernhard Beschow wrote:
>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>> TYPE_PIIX3_DEVICE=2E Remove this redundancy=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>   hw/i386/pc_piix=2Ec             |  4 +---
>>>   hw/isa/piix=2Ec                 | 20 --------------------
>>>   include/hw/southbridge/piix=2Eh |  1 -
>>>   3 files changed, 1 insertion(+), 24 deletions(-)
>>>=20
>>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>>> index 5738d9cdca=2E=2E6b8de3d59d 100644
>>> --- a/hw/i386/pc_piix=2Ec
>>> +++ b/hw/i386/pc_piix=2Ec
>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>       if (pcmc->pci_enabled) {
>>>           DeviceState *dev;
>>>           PCIDevice *pci_dev;
>>> -        const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>> -                                         : TYPE_PIIX3_DEVICE;
>>>           int i;
>>>  =20
>>>           pci_bus =3D i440fx_init(pci_type,
>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>                                          : pci_slot_get_pirq);
>>>           pcms->bus =3D pci_bus;
>>>  =20
>>> -        pci_dev =3D pci_new_multifunction(-1, true, type);
>>> +        pci_dev =3D pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE=
);
>>>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>                                    machine_usb(machine), &error_abort)=
;
>>>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>> diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>>> index 98e9b12661=2E=2Ee4587352c9 100644
>>> --- a/hw/isa/piix=2Ec
>>> +++ b/hw/isa/piix=2Ec
>>> @@ -33,7 +33,6 @@
>>>   #include "hw/qdev-properties=2Eh"
>>>   #include "hw/ide/piix=2Eh"
>>>   #include "hw/isa/isa=2Eh"
>>> -#include "hw/xen/xen=2Eh"
>>>   #include "sysemu/runstate=2Eh"
>>>   #include "migration/vmstate=2Eh"
>>>   #include "hw/acpi/acpi_aml_interface=2Eh"
>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info =3D {
>>>       =2Eclass_init    =3D piix3_class_init,
>>>   };
>>>  =20
>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>> -{
>>> -    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
>>> -
>>> -    k->realize =3D piix3_realize;
>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>> -    k->device_id =3D PCI_DEVICE_ID_INTEL_82371SB_0;
>>> -    dc->vmsd =3D &vmstate_piix3;
>>=20
>> IIUC, since this device is user-creatable, we can't simply remove it
>> without going thru the deprecation process=2E Alternatively we could
>> add a type alias:
>>=20
>> -- >8 --
>> diff --git a/softmmu/qdev-monitor=2Ec b/softmmu/qdev-monitor=2Ec
>> index 4b0ef65780=2E=2Ed94f7ea369 100644
>> --- a/softmmu/qdev-monitor=2Ec
>> +++ b/softmmu/qdev-monitor=2Ec
>> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>>                                 QEMU_ARCH_LOONGARCH)
>>   #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>   #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
>>=20
>>   /* Please keep this table sorted by typename=2E */
>>   static const QDevAlias qdev_alias_table[] =3D {
>> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] =3D {
>>       { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO =
},
>>       { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>>       { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
>> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
>
>Hi Bernhard,
>
>Can you comment if this should be:
>
>+    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },
>
>instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
>replaced them with PIIX=2E Or am I not understanding correctly?

PIIX3 is correct=2E The PIIX consolidation is just about sharing code betw=
een the PIIX3 and PIIX4 south bridges and should not cause any user or gues=
t observable differences=2E

Best regards,
Bernhard

>
>Best regards,
>
>Chuck
>
>
>>       { }
>>   };
>> ---
>>=20
>> But I'm not sure due to this comment from commit ee46d8a503
>> (2011-12-22 15:24:20 -0600):
>>=20
>> 47) /*
>> 48)  * Aliases were a bad idea from the start=2E  Let's keep them
>> 49)  * from spreading further=2E
>> 50)  */
>>=20
>> Maybe using qdev_alias_table[] during device deprecation is
>> acceptable?
>>=20
>>> -}
>>> -
>>> -static const TypeInfo piix3_xen_info =3D {
>>> -    =2Ename          =3D TYPE_PIIX3_XEN_DEVICE,
>>> -    =2Eparent        =3D TYPE_PIIX_PCI_DEVICE,
>>> -    =2Einstance_init =3D piix3_init,
>>> -    =2Eclass_init    =3D piix3_xen_class_init,
>>> -};
>>> -
>>>   static void piix4_realize(PCIDevice *dev, Error **errp)
>>>   {
>>>       ERRP_GUARD();
>>> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>>>   {
>>>       type_register_static(&piix_pci_type_info);
>>>       type_register_static(&piix3_info);
>>> -    type_register_static(&piix3_xen_info);
>>>       type_register_static(&piix4_info);
>>>   }
>>>  =20
>>> diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/=
piix=2Eh
>>> index 65ad8569da=2E=2Eb1fc94a742 100644
>>> --- a/include/hw/southbridge/piix=2Eh
>>> +++ b/include/hw/southbridge/piix=2Eh
>>> @@ -77,7 +77,6 @@ struct PIIXState {
>>>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>>>  =20
>>>   #define TYPE_PIIX3_DEVICE "PIIX3"
>>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>>  =20
>>>   #endif
>>=20
>

