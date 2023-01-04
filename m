Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBC65DBB2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 18:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471368.731194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD7yA-0004Pv-3u; Wed, 04 Jan 2023 17:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471368.731194; Wed, 04 Jan 2023 17:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD7yA-0004Nj-1G; Wed, 04 Jan 2023 17:54:30 +0000
Received: by outflank-mailman (input) for mailman id 471368;
 Wed, 04 Jan 2023 17:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aavW=5B=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pD7y9-0004NY-6N
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 17:54:29 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ac3425-8c58-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 18:54:27 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Jan 2023 17:54:24 +0000
Received: by hermes--production-ne1-7b69748c4d-brw6v (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3b6e3b6717f2ad0d4df9645e096a3d43; 
 Wed, 04 Jan 2023 17:54:18 +0000 (UTC)
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
X-Inumbo-ID: d3ac3425-8c58-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672854864; bh=62GrjcKcrjn6pGet/GNWyEnuI3H5ZMFveZgVFAY9fi4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XgcKO9mT2A5OpXMzNhTUWfEVZQeb3tZpsZi6pH8142PKactCJPOqzFwC0JdfDSsrPVx9PQymQO2Vh+y7/UH+fEjfmlLKfiAu6FO/nWGw/xlbSoj960yeTTZp7A5FPRNpovMsbZ5DMnAhrky90cR5W4IlqfThLdFaYNaozPbcoTRlgHPjeqNNffswzGk0pMkcfMBRfsEtngRVONq+24PF1eRHOaNp35sUXo43D4INbIR70r8t/imIFmavvVMR4xY6Hbdt8pLJY7E8Yz7IhW1r6gjpN5MpUZuR6Kp76gHXskt7q1FIkUEAM0PqM4t6KAnR2w7Mj/g2kPee4gwt0cnfmg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672854864; bh=hyoo4l5eYpZvZ37UDueVbgUvGgA7cb6c0wte2v6dAvd=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=LG2pMM13WGB66ytLaHr4OMlZA6Q2xRxDMSI4tEm6m/QLPGf3KWl9aSdO6B+2iLAuRbkU9Qx2LfjJY/8/lRLASAu8JQFel5gVTpQFLj1G1mRHxBHnukHWJSsaq4aAkPqrYEFeiN2zLnqcyFeEd9idjxfpz/eHxcp1yRwJUGQoJ2XWJBos9DdWysPxRgsZd+kSL+QfjONrMI+8Ivpz+wdrnw+REdozZ7IFHh+FoXHKbUqG39ZhXwTWH9ppsQF8iyRY8G8MD9EMr5OeG2ByLJwQGomyoWm4BHracWAqiISBcvH2eKjfwYkxIGFi+TlUuvJ7dmBypjQsdHlkPG94h9TPug==
X-YMail-OSG: hsgtjjMVM1kYbV.iYsvv_79.2anRl0pBtsppgVsWfzACkf34ams5kiyUUKtRAeR
 ZixpwMNisCWUZvqF3TyOuVRefxOjsMsVG_RWa0zr.A3jfIPAy6LYMBU3SbmOsSetaUSZfTM6v1X4
 MgjLyLoEu0MKqtTLBfk3Mb1Tg9yCa8HMuZtjK0eFZo3Mk4G8lUvWuDUhRMNLTPl7wAHj2W_YNqCa
 DOuVBUxMB8zVAtPSaSAZK4YnATYpBNYnwcrtbBrxLjSzu98wnxVVxOiKcEFisouTnxYS3qqjWXFi
 xyQoDB39mTkmGwRJ9DA.0Xz6rbntkl2Xx_jLQWy4dEvs2FBA8yNved08SQdsL7H7BVHE7amdURLN
 YLxKXvzdKyAmYknKoP6O_BZfNW0UFhzNz8GydVOQr2I5S8cWQSdyxX5XTW2f62mcLlY8_3dg4zIK
 K43e8sDu18HJberC7t2eM7SW9lQOuXnimfxTY4QgiyooPabhE11pNi9XO2QeA1Fgi6Pqi7EOvmFi
 mIcDAOd8L97.T5YfvC0ugCDemxEn7_rGWb2WVzW2JvgfEkMVlkK0kN3auayrzM_de0ynRY8GUjgh
 f.B8ZT.lCBxYSofNU4RJGVxId19GMonO5zj2ex0h7iJOSOtjPlBz1D17MY46RD15f3ihdrAU5z5r
 rOFdOiPq.FpngnAgSArFxIvOyO6Fm9qJ8QdPiGNw4R25XNm9_m1_05VgRGpeo.f5FX3WLHgv22C7
 ihX6yHXQDiNbEEktd1H_tcwJCVsRx_9PEG6QlXtX7uH8Yo3yQm77_ihbcDQ0jEMOMrJOqahMNzE5
 97KMP74VxteFthVugEqkr1UBTwbri99BzYKP5n1vLOCkazOaT6umA8pkuVbHE_jYW9RsjxoYizbW
 IBxG_usnYLBdA3.nBOjj4QpNmEVYaChv924thTD4OE47hI9ODDOETxR9PCLNe42GkBD3tJ8QGmsD
 A2ikhYE1_VqIPZcb6cSwK5Ju08oPEnUdK7S.viVcEiJzhFgT0DNh9xEqxEChtVOLnKOL5JqUImja
 eG3gTSGs_gY3C6.DfiWH4PhPZ0tfD6C7jgztZxzvORVtcnjjC2Oi.ZJAimFA6HSQvX5DS2c0Aag6
 1qiaH0EoSmd3O_AIch.ecUX4UnmUqNuey8UuXuvHUmo40DeVc9q14QDfWVgLT8fSKekjsWjeds90
 xoPCfKuQHXTaIxIhT3B9d5SR4.HlobPoSyeYQENmQrzDArxZiBsEpt10eRNIlmQ1.yR4vOoyCYwF
 EBIXU6X3QcOH.oPzJry9pykHkgOotSI5bfIUXz764ICdaAp2MSaBzjS.Jx.6NbUOqb.2z3kLduQs
 Qv0Tl.J3N4sWJiAlDd01j2A5dbpHND4nrKhCQj2zP1r.pi27izYq9Vkfexeo77IzxvfZ4VA3BMcm
 Kh1GwULZI04NKkPev4MSk9bpDL98aaoBY.OxfR3PnkG_fMLboLMujQIXDTCdu3D7grrrg58o97xo
 grE5Wwofk3j1.28IqBgz4EXC_7ceS8VMre8tRwQfI7DDV8VqYZBFOf.wVCbI6ok9hzhbokZh3wvf
 rTx2KRB0qNFLxlqfONlbUDh9DevOY8X5ltG5bRwqxEYA.ljbxS.aJWlxPpsNbxMDNeVLkr9xwz9Q
 ux9oFJSLl.uSV6.9xg7YwBtsH3jG65TrQtsR1P5wot.HH4pfCc4Anad7jv7jLykk9ZbivX_Rn5Hx
 4D2oolxJ002G18kAveulzNST1m5DdF_gdYQvitTLsjnBgZbjHw_Q4gI50Yb5Yv9SkgILQuk0OnUz
 xoR3J1E3xssxbZ2FCUcRAotd7r87C9PMXZ88M4nV_mxStQqaRbgm9nK4VxsJZERkmJvLKBklJFDx
 wy1X3M_.PklRG2hjjQnYpcJPM4tHOo.nZtwzi1dV9PDFkLMZN3x58gCHE.N4T2aR7M57J0Gm79SJ
 uyJmBphuyjttwYRbLzxRkguIhn3fMzhbg35si.8S8OeQRTa3gP2ro8KiN5qHp31caZCLV8m37C58
 5uU_6twcwnml9ok4uFaIWbW_sAHXW6SbcmdRE1z5i.U07PDLMghN5AV8LeKeKtsCnod2UGM9dP89
 9VCFtLto5buHFjzgkrS6.hp42mK2GN57tJS6ueY8q9LnmLR2o4AEUBpOAyQLZoyW5ccqWqaqgf_x
 XmDsl4SyxxsQmirGp0WRtPg0rtTCGNtxh28zkJ3JR0B8pG.wLhyECqc8Aid.LPydCoFdLOqgY0U3
 WkGJGa41Fz3kqygvv07ja9Qk-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
Date: Wed, 4 Jan 2023 12:54:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/23 10:35 AM, Philippe Mathieu-Daudé wrote:
> +Markus/Thomas
> 
> On 4/1/23 15:44, Bernhard Beschow wrote:
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
> 
> IIUC, since this device is user-creatable, we can't simply remove it
> without going thru the deprecation process. Alternatively we could
> add a type alias:
> 
> -- >8 --
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 4b0ef65780..d94f7ea369 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -64,6 +64,7 @@ typedef struct QDevAlias
>                                 QEMU_ARCH_LOONGARCH)
>   #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>   #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
> +#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)
> 
>   /* Please keep this table sorted by typename. */
>   static const QDevAlias qdev_alias_table[] = {
> @@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
>       { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
>       { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
>       { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
> +    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },

Hi Bernhard,

Can you comment if this should be:

+    { "PIIX", "PIIX3-xen", QEMU_ARCH_XEN },

instead? IIUC, the patch series also removed PIIX3 and PIIX4 and
replaced them with PIIX. Or am I not understanding correctly?

Best regards,

Chuck


>       { }
>   };
> ---
> 
> But I'm not sure due to this comment from commit ee46d8a503
> (2011-12-22 15:24:20 -0600):
> 
> 47) /*
> 48)  * Aliases were a bad idea from the start.  Let's keep them
> 49)  * from spreading further.
> 50)  */
> 
> Maybe using qdev_alias_table[] during device deprecation is
> acceptable?
> 
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


