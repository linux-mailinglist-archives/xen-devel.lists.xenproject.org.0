Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661802147DC
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 20:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrmbg-0006vo-2j; Sat, 04 Jul 2020 18:09:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrmbe-0006vi-Ny
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 18:09:42 +0000
X-Inumbo-ID: 87cf9380-be21-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87cf9380-be21-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 18:09:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o8so35042700wmh.4
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=26ESjHbgI4BTNqbm3B28vUYqBjitO3tpkPCaUOMj9bA=;
 b=mjQJFUI6aMztNDG3wk/I6lnSW2MW7aYTzbw8VjESugs+xxGssINBebLZzFFWc19OPr
 QSUTSmQNkVGIrwTCsL4FjoH+68hC6bI8Bu9TjoFJtfgQ+ojd/8scxej8aXQOMQQPzTV6
 4SZl9IrZoHaHos6nZzG+AuvhsMVhLKm9f7CmrQHCqW9A1VOL62ay3xmyihw246V5vwhP
 juGXylLSDJ3HYcpmN2QekRlfO3gTk4QXapNlbM3byEIyzGCWd7W1Q5QKZPPW2j0JKBn7
 W/4JYAusxRFcM2RSD/HrsAG8G9eozJBBNKpgfRsKjzLUcXXH4VVQ2nPytwZJJDydSR62
 kyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=26ESjHbgI4BTNqbm3B28vUYqBjitO3tpkPCaUOMj9bA=;
 b=c9uAtNHP2yhy8APOASHR5Rl4xVOu8LY5aEQzt6eqniHQG5TFBQrRWkivNRSuk8rCCy
 WNHDfFYFm89okah+bCcM9ZCZkIU9JprCrXYrPQgy6eKrIRiTO2jk4ARF3fqBwx3NxpX8
 LOmFqQucuO0tGhAuwt2RxOsi5OaarVJpq1jlhutoJ8C+i7F/hMgy67uH19Kvew5zOW5L
 NG1qz/pDLsBvHGi0W3k09tp/dpHbMUSocsvw6q3f+F+zoKFyqZCN9B27BbW/2pZcmTXP
 lHF5s8ePkzENDY6JX/YsK6vg4peAlUHfX3gfRH5b1pDL2SlOKDXEsn0R87pjsluOd1AK
 ekyA==
X-Gm-Message-State: AOAM531KkU4nukNUWFaegmUn5Nx2lYrhetp/fkbgpl98kswmBxvY55/1
 rL2deA8SOCFNSQsY7j/mdw8=
X-Google-Smtp-Source: ABdhPJwzNYUs2VQ8iFHaSSyYEPlKjZV73AzYSO9YQqAb7SjZkDwNyzXJcWkT3bJwzOf1ZQv9R1lWpw==
X-Received: by 2002:a1c:acc2:: with SMTP id v185mr40248743wme.81.1593886180534; 
 Sat, 04 Jul 2020 11:09:40 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 92sm18722180wrr.96.2020.07.04.11.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 11:09:39 -0700 (PDT)
Subject: Re: [PATCH 22/26] hw/usb/usb-hcd: Use OHCI type definitions
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-23-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041909370.92265@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c966ff55-5499-b302-a5a5-2cc601c4a4f6@amsat.org>
Date: Sat, 4 Jul 2020 20:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2007041909370.92265@zero.eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/4/20 7:13 PM, BALATON Zoltan wrote:
> On Sat, 4 Jul 2020, Philippe Mathieu-Daud� wrote:
>> Various machine/board/soc models create OHCI device instances
>> with the generic QDEV API, and don't need to access USB internals.
>>
>> Simplify header inclusions by moving the QOM type names into a
>> simple header, with no need to include other "hw/usb" headers.
>>
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>
>> ---
>> hw/usb/hcd-ohci.h������� |� 2 +-
>> include/hw/usb/usb-hcd.h | 16 ++++++++++++++++
> 
> I wonder if we need a new header for this or these could just go in the
> new public hw/usb/usb.h as machines creating a HCD may also add devices
> (like keyboard/mouse) so probably will need both headers anyway so
> splitting it up may not worth it but I don't really mind, either way.

Hmm the rationale for this choice is: SoC might only instanciate USB HCI
via sysbus/qdev API, without any use of "hw/usb/usb.h". This is the
machine / board that instanciate USB devices and plug them to the HCI on
the SoC.

I can reword better the description.

> 
> For sm501 and sam460ex parts:
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Regards,
> BALATON Zoltan
> 
>> hw/arm/allwinner-a10.c�� |� 2 +-
>> hw/arm/allwinner-h3.c��� |� 9 +++++----
>> hw/arm/pxa2xx.c��������� |� 3 ++-
>> hw/arm/realview.c������� |� 3 ++-
>> hw/arm/versatilepb.c���� |� 3 ++-
>> hw/display/sm501.c������ |� 3 ++-
>> hw/ppc/mac_newworld.c��� |� 3 ++-
>> hw/ppc/mac_oldworld.c��� |� 3 ++-
>> hw/ppc/sam460ex.c������� |� 3 ++-
>> hw/ppc/spapr.c���������� |� 3 ++-
>> hw/usb/hcd-ohci-pci.c��� |� 2 +-
>> 13 files changed, 40 insertions(+), 15 deletions(-)
>> create mode 100644 include/hw/usb/usb-hcd.h
>>
>> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
>> index 771927ea17..6949cf0dab 100644
>> --- a/hw/usb/hcd-ohci.h
>> +++ b/hw/usb/hcd-ohci.h
>> @@ -21,6 +21,7 @@
>> #ifndef HCD_OHCI_H
>> #define HCD_OHCI_H
>>
>> +#include "hw/usb/usb-hcd.h"
>> #include "sysemu/dma.h"
>> #include "usb-internal.h"
>>
>> @@ -91,7 +92,6 @@ typedef struct OHCIState {
>> ��� void (*ohci_die)(struct OHCIState *ohci);
>> } OHCIState;
>>
>> -#define TYPE_SYSBUS_OHCI "sysbus-ohci"
>> #define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj),
>> TYPE_SYSBUS_OHCI)
>>
>> typedef struct {
>> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
>> new file mode 100644
>> index 0000000000..21fdfaf22d
>> --- /dev/null
>> +++ b/include/hw/usb/usb-hcd.h
>> @@ -0,0 +1,16 @@
>> +/*
>> + * QEMU USB HCD types
>> + *
>> + * Copyright (c) 2020� Philippe Mathieu-Daud� <f4bug@amsat.org>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef HW_USB_HCD_TYPES_H
>> +#define HW_USB_HCD_TYPES_H
>> +
>> +/* OHCI */
>> +#define TYPE_SYSBUS_OHCI����������� "sysbus-ohci"
>> +#define TYPE_PCI_OHCI�������������� "pci-ohci"
>> +
>> +#endif
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index 52e0d83760..53c24ff602 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -25,7 +25,7 @@
>> #include "hw/misc/unimp.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/boards.h"
>> -#include "hw/usb/hcd-ohci.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> #define AW_A10_MMC0_BASE������� 0x01c0f000
>> #define AW_A10_PIC_REG_BASE���� 0x01c20400
>> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> index 8e09468e86..d1d90ffa79 100644
>> --- a/hw/arm/allwinner-h3.c
>> +++ b/hw/arm/allwinner-h3.c
>> @@ -28,6 +28,7 @@
>> #include "hw/sysbus.h"
>> #include "hw/char/serial.h"
>> #include "hw/misc/unimp.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/usb/hcd-ehci.h"
>> #include "hw/loader.h"
>> #include "sysemu/sysemu.h"
>> @@ -381,16 +382,16 @@ static void allwinner_h3_realize(DeviceState
>> *dev, Error **errp)
>> ������������������������ qdev_get_gpio_in(DEVICE(&s->gic),
>> ����������������������������������������� AW_H3_GIC_SPI_EHCI3));
>>
>> -��� sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
>> +��� sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI0],
>> ������������������������ qdev_get_gpio_in(DEVICE(&s->gic),
>> ����������������������������������������� AW_H3_GIC_SPI_OHCI0));
>> -��� sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
>> +��� sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI1],
>> ������������������������ qdev_get_gpio_in(DEVICE(&s->gic),
>> ����������������������������������������� AW_H3_GIC_SPI_OHCI1));
>> -��� sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
>> +��� sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI2],
>> ������������������������ qdev_get_gpio_in(DEVICE(&s->gic),
>> ����������������������������������������� AW_H3_GIC_SPI_OHCI2));
>> -��� sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
>> +��� sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI3],
>> ������������������������ qdev_get_gpio_in(DEVICE(&s->gic),
>> ����������������������������������������� AW_H3_GIC_SPI_OHCI3));
>>
>> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
>> index f104a33463..27196170f5 100644
>> --- a/hw/arm/pxa2xx.c
>> +++ b/hw/arm/pxa2xx.c
>> @@ -18,6 +18,7 @@
>> #include "hw/arm/pxa.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/char/serial.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/i2c/i2c.h"
>> #include "hw/irq.h"
>> #include "hw/qdev-properties.h"
>> @@ -2196,7 +2197,7 @@ PXA2xxState *pxa270_init(MemoryRegion
>> *address_space,
>> ������� s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
>> ��� }
>>
>> -��� sysbus_create_simple("sysbus-ohci", 0x4c000000,
>> +��� sysbus_create_simple(TYPE_SYSBUS_OHCI, 0x4c000000,
>> ������������������������ qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
>>
>> ��� s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
>> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
>> index b6c0a1adb9..0aa34bd4c2 100644
>> --- a/hw/arm/realview.c
>> +++ b/hw/arm/realview.c
>> @@ -16,6 +16,7 @@
>> #include "hw/net/lan9118.h"
>> #include "hw/net/smc91c111.h"
>> #include "hw/pci/pci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "net/net.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/boards.h"
>> @@ -256,7 +257,7 @@ static void realview_init(MachineState *machine,
>> ������� sysbus_connect_irq(busdev, 3, pic[51]);
>> ������� pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci");
>> ������� if (machine_usb(machine)) {
>> -����������� pci_create_simple(pci_bus, -1, "pci-ohci");
>> +����������� pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>> ������� }
>> ������� n = drive_get_max_bus(IF_SCSI);
>> ������� while (n >= 0) {
>> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
>> index e596b8170f..3e6224dc96 100644
>> --- a/hw/arm/versatilepb.c
>> +++ b/hw/arm/versatilepb.c
>> @@ -17,6 +17,7 @@
>> #include "net/net.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/pci/pci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/i2c/i2c.h"
>> #include "hw/i2c/arm_sbcon_i2c.h"
>> #include "hw/irq.h"
>> @@ -273,7 +274,7 @@ static void versatile_init(MachineState *machine,
>> int board_id)
>> ������� }
>> ��� }
>> ��� if (machine_usb(machine)) {
>> -������� pci_create_simple(pci_bus, -1, "pci-ohci");
>> +������� pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>> ��� }
>> ��� n = drive_get_max_bus(IF_SCSI);
>> ��� while (n >= 0) {
>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>> index 9cccc68c35..5f076c841f 100644
>> --- a/hw/display/sm501.c
>> +++ b/hw/display/sm501.c
>> @@ -33,6 +33,7 @@
>> #include "hw/sysbus.h"
>> #include "migration/vmstate.h"
>> #include "hw/pci/pci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/qdev-properties.h"
>> #include "hw/i2c/i2c.h"
>> #include "hw/display/i2c-ddc.h"
>> @@ -1961,7 +1962,7 @@ static void sm501_realize_sysbus(DeviceState
>> *dev, Error **errp)
>> ��� sysbus_init_mmio(sbd, &s->state.mmio_region);
>>
>> ��� /* bridge to usb host emulation module */
>> -��� usb_dev = qdev_new("sysbus-ohci");
>> +��� usb_dev = qdev_new(TYPE_SYSBUS_OHCI);
>> ��� qdev_prop_set_uint32(usb_dev, "num-ports", 2);
>> ��� qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
>> ��� sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 7bf69f4a1f..3c32c1831b 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -55,6 +55,7 @@
>> #include "hw/input/adb.h"
>> #include "hw/ppc/mac_dbdma.h"
>> #include "hw/pci/pci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "net/net.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/boards.h"
>> @@ -411,7 +412,7 @@ static void ppc_core99_init(MachineState *machine)
>> ��� }
>>
>> ��� if (machine->usb) {
>> -������� pci_create_simple(pci_bus, -1, "pci-ohci");
>> +������� pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>>
>> ������� /* U3 needs to use USB for input because Linux doesn't support
>> via-cuda
>> ������� on PPC64 */
>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index f8c204ead7..a429a3e1df 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -37,6 +37,7 @@
>> #include "hw/isa/isa.h"
>> #include "hw/pci/pci.h"
>> #include "hw/pci/pci_host.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/boards.h"
>> #include "hw/nvram/fw_cfg.h"
>> #include "hw/char/escc.h"
>> @@ -301,7 +302,7 @@ static void ppc_heathrow_init(MachineState *machine)
>> ��� qdev_realize_and_unref(dev, adb_bus, &error_fatal);
>>
>> ��� if (machine_usb(machine)) {
>> -������� pci_create_simple(pci_bus, -1, "pci-ohci");
>> +������� pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>> ��� }
>>
>> ��� if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8)
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 781b45e14b..ac60d17a86 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -36,6 +36,7 @@
>> #include "hw/i2c/ppc4xx_i2c.h"
>> #include "hw/i2c/smbus_eeprom.h"
>> #include "hw/usb/usb.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/usb/hcd-ehci.h"
>> #include "hw/ppc/fdt.h"
>> #include "hw/qdev-properties.h"
>> @@ -372,7 +373,7 @@ static void sam460ex_init(MachineState *machine)
>>
>> ��� /* USB */
>> ��� sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
>> -��� dev = qdev_new("sysbus-ohci");
>> +��� dev = qdev_new(TYPE_SYSBUS_OHCI);
>> ��� qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
>> ��� qdev_prop_set_uint32(dev, "num-ports", 6);
>> ��� sbdev = SYS_BUS_DEVICE(dev);
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 0c0409077f..db1706a66c 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -71,6 +71,7 @@
>> #include "exec/address-spaces.h"
>> #include "exec/ram_addr.h"
>> #include "hw/usb/usb.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "qemu/config-file.h"
>> #include "qemu/error-report.h"
>> #include "trace.h"
>> @@ -2958,7 +2959,7 @@ static void spapr_machine_init(MachineState
>> *machine)
>>
>> ��� if (machine->usb) {
>> ������� if (smc->use_ohci_by_default) {
>> -����������� pci_create_simple(phb->bus, -1, "pci-ohci");
>> +����������� pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
>> ������� } else {
>> ����������� pci_create_simple(phb->bus, -1, "nec-usb-xhci");
>> ������� }
>> diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
>> index cb6bc55f59..14df83ec2e 100644
>> --- a/hw/usb/hcd-ohci-pci.c
>> +++ b/hw/usb/hcd-ohci-pci.c
>> @@ -29,8 +29,8 @@
>> #include "trace.h"
>> #include "hcd-ohci.h"
>> #include "usb-internal.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> -#define TYPE_PCI_OHCI "pci-ohci"
>> #define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
>>
>> typedef struct {
>>

