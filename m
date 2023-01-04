Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADA65D74E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 16:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471274.731063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5no-0000kO-1k; Wed, 04 Jan 2023 15:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471274.731063; Wed, 04 Jan 2023 15:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5nn-0000hd-Uv; Wed, 04 Jan 2023 15:35:39 +0000
Received: by outflank-mailman (input) for mailman id 471274;
 Wed, 04 Jan 2023 15:35:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pD5nm-0000hX-K4
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 15:35:38 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f69a975-8c45-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 16:35:36 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id d17so13632402wrs.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 07:35:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm9758428wrb.24.2023.01.04.07.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:35:36 -0800 (PST)
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
X-Inumbo-ID: 6f69a975-8c45-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKfYp56DzEdln6bw+epRjXvgWK4+5r5Y+0Le7rGeP9o=;
        b=uUvu3TZZ6cU7XFsjBFeKFFSqBvz1X0ROcGMGdM4mLTlVoVeGwEz9o6k2bGbmQIg4om
         TzVOHY6Cc2lGZTwx1Jj931bRdVCLmTaRi4NoaiXpD5LbwGwC5p5EbIjsbQz/Fl5chbHt
         qwMRsbZtZebWs3sWytVS2FNwfYSGFEmenYR03MWPelgo93c5N9u/OtlHARpd+iCZPoxT
         HZ5YaVoZSL8s59ak8bCLBbh4Iq6DjtCsnsjdSBN7D015K8yzoJN7xivoNYasnE06Lgaj
         9nJr7AZ1SEXoTAuMxBDbxJyCxj8CTZoJKcaS2AoX+xRNQ3SuZqcYI8rj691I/weGzwsL
         /Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKfYp56DzEdln6bw+epRjXvgWK4+5r5Y+0Le7rGeP9o=;
        b=6GeLvfNmc+Yl+Y0EdLLWhCLf60sMuUjyAGn11iyVN4qqLd0de7MpU9L9eImxEd+1R1
         PXaq2MOnN3dMNRT5fu8EFyXkaG6w/ZLPpVerY6etXoJGFlQ4X8neClvPvV9mN/3eDrnZ
         TeGqFdC7fZ4Ie7ZrF7I6s1EBTVrVVTcWMmTcFgSv3JnWbtjmrkPFxxxbfGgoUJodGj90
         1HFciqGYd6cDxldYcHxHvKpOfPHdGh6Fx2EFZok/oDP8CNyu7eMDrCMulNTBQeyQpdNH
         PSbuhU3yJu8gtBMEpq05di6AlhJuSFqRs5k2GsN8aYoujv9FGS0RQB6nliAUnV7AG6JJ
         g0tg==
X-Gm-Message-State: AFqh2ko7mARTSnNbNfS0x4iyGcXn63Vzo7KRJQAG4crVxQTPGXbW4Arq
	Jaiw1ptyngYKH4H6nQEbX7pEdA==
X-Google-Smtp-Source: AMrXdXtY6RzOZmuFEL1JagfUdSvbatncLArmeYUWzIWeXgc02Qt4gc26aWsY4X0BGqOTYR424X5PZQ==
X-Received: by 2002:adf:de8a:0:b0:266:3709:5ce3 with SMTP id w10-20020adfde8a000000b0026637095ce3mr28787116wrl.0.1672846536505;
        Wed, 04 Jan 2023 07:35:36 -0800 (PST)
Message-ID: <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
Date: Wed, 4 Jan 2023 16:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+Markus/Thomas

On 4/1/23 15:44, Bernhard Beschow wrote:
> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
> TYPE_PIIX3_DEVICE. Remove this redundancy.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c             |  4 +---
>   hw/isa/piix.c                 | 20 --------------------
>   include/hw/southbridge/piix.h |  1 -
>   3 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5738d9cdca..6b8de3d59d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>       if (pcmc->pci_enabled) {
>           DeviceState *dev;
>           PCIDevice *pci_dev;
> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> -                                         : TYPE_PIIX3_DEVICE;
>           int i;
>   
>           pci_bus = i440fx_init(pci_type,
> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>                                          : pci_slot_get_pirq);
>           pcms->bus = pci_bus;
>   
> -        pci_dev = pci_new_multifunction(-1, true, type);
> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>                                    machine_usb(machine), &error_abort);
>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
> index 98e9b12661..e4587352c9 100644
> --- a/hw/isa/piix.c
> +++ b/hw/isa/piix.c
> @@ -33,7 +33,6 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/ide/piix.h"
>   #include "hw/isa/isa.h"
> -#include "hw/xen/xen.h"
>   #include "sysemu/runstate.h"
>   #include "migration/vmstate.h"
>   #include "hw/acpi/acpi_aml_interface.h"
> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>       .class_init    = piix3_class_init,
>   };
>   
> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -
> -    k->realize = piix3_realize;
> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
> -    dc->vmsd = &vmstate_piix3;

IIUC, since this device is user-creatable, we can't simply remove it
without going thru the deprecation process. Alternatively we could
add a type alias:

-- >8 --
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4b0ef65780..d94f7ea369 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -64,6 +64,7 @@ typedef struct QDevAlias
                                QEMU_ARCH_LOONGARCH)
  #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
  #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
+#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)

  /* Please keep this table sorted by typename. */
  static const QDevAlias qdev_alias_table[] = {
@@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
      { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
      { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
      { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
+    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
      { }
  };
---

But I'm not sure due to this comment from commit ee46d8a503
(2011-12-22 15:24:20 -0600):

47) /*
48)  * Aliases were a bad idea from the start.  Let's keep them
49)  * from spreading further.
50)  */

Maybe using qdev_alias_table[] during device deprecation is
acceptable?

> -}
> -
> -static const TypeInfo piix3_xen_info = {
> -    .name          = TYPE_PIIX3_XEN_DEVICE,
> -    .parent        = TYPE_PIIX_PCI_DEVICE,
> -    .instance_init = piix3_init,
> -    .class_init    = piix3_xen_class_init,
> -};
> -
>   static void piix4_realize(PCIDevice *dev, Error **errp)
>   {
>       ERRP_GUARD();
> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>   {
>       type_register_static(&piix_pci_type_info);
>       type_register_static(&piix3_info);
> -    type_register_static(&piix3_xen_info);
>       type_register_static(&piix4_info);
>   }
>   
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 65ad8569da..b1fc94a742 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -77,7 +77,6 @@ struct PIIXState {
>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>   
>   #define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>   
>   #endif


