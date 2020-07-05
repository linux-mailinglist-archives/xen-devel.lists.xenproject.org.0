Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E16214B87
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 11:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js0ul-0000rs-Vm; Sun, 05 Jul 2020 09:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Cql=AQ=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1js0uk-0000rn-9P
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 09:26:22 +0000
X-Inumbo-ID: 9611fd7c-bea1-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9611fd7c-bea1-11ea-bca7-bc764e2007e4;
 Sun, 05 Jul 2020 09:26:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o2so38489997wmh.2
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2020 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V6VxSUE4Bn25txtzYc2pOs5ttoLW2r+gnS/zuul7E4Q=;
 b=O+ekF3GWrxTOzHZ0BXua7IHles3NGTwEiTdtbTwPbSx5SXIYw2TK/E6b5CRrqy0mBR
 ZZWQP+ly3nzbTRQD6TEw9YxQvPZp6hZBAyAQhaf08DrKnyb/X2AUwEiEy0bmncIE6s3e
 ow9/lwSEh1PH7a7iOFpGvRcHV24T9iMoM0H+S0RAMvAyHkE+gIpIs70JuzXFEmrkNT09
 DC/TNnWaKbXa1nicfAMu09rX1cjTEw8izyQFKH/MPKE8/fIc3T9jBVtNECURNS2XWoVN
 k0uFGgXqN+Z3VhAHfMcsz9KWS+dCCBNAtklP3Mo6/p+tK0yrEED2igLLLC91GAtis/+/
 JTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6VxSUE4Bn25txtzYc2pOs5ttoLW2r+gnS/zuul7E4Q=;
 b=C5brOw8dV3TOGECVvQrUc3Ju1Ko/9pLU0NPmHw8aqPzu2sKuuOQvochDm+Rt8dl5QN
 7XKIxuYX5V61fvE9ywGlqph3bBFEmJSXKFbJ9OZPmqa0nMxZ0BpBc0yf3ZtZxCsEHiib
 rDn8Qdd3kISkDd/nLZFY/w/l/X5QDXK86506uz/9bIJtmzbiWS4v/BOnEAOevqv5DtQw
 ce33O9uwtO1FqOFzlS5DN49m9J9QATCF43LGSsy2CFXWs6VZqjup0vWRuyNAxsr/mVKT
 fB4OUDY2SaDFP+By9Dg3rizJpp3tQwnk/8GonIAEFY9oaalzfv8ai2GfNSZmtTdtOxqC
 dlDw==
X-Gm-Message-State: AOAM530pvIGGnhWmqvjU7z3p4XlIGDmxJI970FZ724TfEzHxIl5pvmMl
 1GXzpcOeDgiePSuTAobQ9dY=
X-Google-Smtp-Source: ABdhPJwILjiR1W+EkE4Nf1XTSMb7GPG+l/lNl8jSnWMlocBShA2Uu5XgzV4UIQboIpbc4nOwhrDjQA==
X-Received: by 2002:a1c:44e:: with SMTP id 75mr44874861wme.139.1593941180006; 
 Sun, 05 Jul 2020 02:26:20 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w7sm19483180wmc.32.2020.07.05.02.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2020 02:26:19 -0700 (PDT)
Subject: Re: [PATCH 23/26] hw/usb/usb-hcd: Use EHCI type definitions
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-24-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041914490.92265@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f046b629-7b13-16d2-bb35-b4eda6fbc02b@amsat.org>
Date: Sun, 5 Jul 2020 11:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2007041914490.92265@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
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

On 7/4/20 7:15 PM, BALATON Zoltan wrote:
> On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
>> Various machine/board/soc models create EHCI device instances
>> with the generic QDEV API, and don't need to access USB internals.
>>
>> Simplify header inclusions by moving the QOM type names into a
>> simple header, with no need to include other "hw/usb" headers.
>>
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/usb/hcd-ehci.h         | 11 +----------
>> include/hw/usb/chipidea.h |  2 +-
>> include/hw/usb/usb-hcd.h  | 11 +++++++++++
>> hw/arm/allwinner-h3.c     |  1 -
>> hw/arm/exynos4210.c       |  2 +-
>> hw/arm/sbsa-ref.c         |  3 ++-
>> hw/arm/xilinx_zynq.c      |  2 +-
>> hw/ppc/sam460ex.c         |  1 -
>> hw/usb/chipidea.c         |  1 +
>> hw/usb/hcd-ehci-sysbus.c  |  1 +
>> 10 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
>> index 337b3ad05c..da70767409 100644
>> --- a/hw/usb/hcd-ehci.h
>> +++ b/hw/usb/hcd-ehci.h
>> @@ -23,6 +23,7 @@
>> #include "hw/pci/pci.h"
>> #include "hw/sysbus.h"
>> #include "usb-internal.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> #define CAPA_SIZE        0x10
>>
>> @@ -316,7 +317,6 @@ void usb_ehci_realize(EHCIState *s, DeviceState
>> *dev, Error **errp);
>> void usb_ehci_unrealize(EHCIState *s, DeviceState *dev);
>> void ehci_reset(void *opaque);
>>
>> -#define TYPE_PCI_EHCI "pci-ehci-usb"
>> #define PCI_EHCI(obj) OBJECT_CHECK(EHCIPCIState, (obj), TYPE_PCI_EHCI)
>>
>> typedef struct EHCIPCIState {
>> @@ -327,15 +327,6 @@ typedef struct EHCIPCIState {
>>     EHCIState ehci;
>> } EHCIPCIState;
>>
>> -
>> -#define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
>> -#define TYPE_PLATFORM_EHCI "platform-ehci-usb"
>> -#define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
>> -#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
>> -#define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
>> -#define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
>> -#define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
>> -
>> #define SYS_BUS_EHCI(obj) \
>>     OBJECT_CHECK(EHCISysBusState, (obj), TYPE_SYS_BUS_EHCI)
>> #define SYS_BUS_EHCI_CLASS(class) \
>> diff --git a/include/hw/usb/chipidea.h b/include/hw/usb/chipidea.h
>> index 1ec2e9dbda..28f46291de 100644
>> --- a/include/hw/usb/chipidea.h
>> +++ b/include/hw/usb/chipidea.h
>> @@ -2,6 +2,7 @@
>> #define CHIPIDEA_H
>>
>> #include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> typedef struct ChipideaState {
>>     /*< private >*/
>> @@ -10,7 +11,6 @@ typedef struct ChipideaState {
>>     MemoryRegion iomem[3];
>> } ChipideaState;
>>
>> -#define TYPE_CHIPIDEA "usb-chipidea"
>> #define CHIPIDEA(obj) OBJECT_CHECK(ChipideaState, (obj), TYPE_CHIPIDEA)
>>
>> #endif /* CHIPIDEA_H */
>> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
>> index 21fdfaf22d..74af3a4533 100644
>> --- a/include/hw/usb/usb-hcd.h
>> +++ b/include/hw/usb/usb-hcd.h
>> @@ -13,4 +13,15 @@
>> #define TYPE_SYSBUS_OHCI            "sysbus-ohci"
>> #define TYPE_PCI_OHCI               "pci-ohci"
>>
>> +/* EHCI */
>> +#define TYPE_SYS_BUS_EHCI           "sysbus-ehci-usb"
>> +#define TYPE_PCI_EHCI               "pci-ehci-usb"
>> +#define TYPE_PLATFORM_EHCI          "platform-ehci-usb"
>> +#define TYPE_EXYNOS4210_EHCI        "exynos4210-ehci-usb"
>> +#define TYPE_AW_H3_EHCI             "aw-h3-ehci-usb"
>> +#define TYPE_TEGRA2_EHCI            "tegra2-ehci-usb"
>> +#define TYPE_PPC4xx_EHCI            "ppc4xx-ehci-usb"
>> +#define TYPE_FUSBH200_EHCI          "fusbh200-ehci-usb"
>> +#define TYPE_CHIPIDEA               "usb-chipidea"
>> +
>> #endif
>> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> index d1d90ffa79..8b7adddc27 100644
>> --- a/hw/arm/allwinner-h3.c
>> +++ b/hw/arm/allwinner-h3.c
>> @@ -29,7 +29,6 @@
>> #include "hw/char/serial.h"
>> #include "hw/misc/unimp.h"
>> #include "hw/usb/usb-hcd.h"
>> -#include "hw/usb/hcd-ehci.h"
>> #include "hw/loader.h"
>> #include "sysemu/sysemu.h"
>> #include "hw/arm/allwinner-h3.h"
>> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
>> index fa639806ec..692fb02159 100644
>> --- a/hw/arm/exynos4210.c
>> +++ b/hw/arm/exynos4210.c
>> @@ -35,7 +35,7 @@
>> #include "hw/qdev-properties.h"
>> #include "hw/arm/exynos4210.h"
>> #include "hw/sd/sdhci.h"
>> -#include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>>
>> #define EXYNOS4210_CHIPID_ADDR         0x10000000
>>
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 021e7c1b8b..4e4c338ae9 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -38,6 +38,7 @@
>> #include "hw/loader.h"
>> #include "hw/pci-host/gpex.h"
>> #include "hw/qdev-properties.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/char/pl011.h"
>> #include "net/net.h"
>>
>> @@ -485,7 +486,7 @@ static void create_ehci(const SBSAMachineState *sms)
>>     hwaddr base = sbsa_ref_memmap[SBSA_EHCI].base;
>>     int irq = sbsa_ref_irqmap[SBSA_EHCI];
>>
>> -    sysbus_create_simple("platform-ehci-usb", base,
>> +    sysbus_create_simple(TYPE_PLATFORM_EHCI, base,
>>                          qdev_get_gpio_in(sms->gic, irq));
>> }
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index ed970273f3..9ccdc03095 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -29,7 +29,7 @@
>> #include "hw/loader.h"
>> #include "hw/misc/zynq-xadc.h"
>> #include "hw/ssi/ssi.h"
>> -#include "hw/usb/chipidea.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "qemu/error-report.h"
>> #include "hw/sd/sdhci.h"
>> #include "hw/char/cadence_uart.h"
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index ac60d17a86..3f7cf0d1ae 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -37,7 +37,6 @@
>> #include "hw/i2c/smbus_eeprom.h"
>> #include "hw/usb/usb.h"
>> #include "hw/usb/usb-hcd.h"
>> -#include "hw/usb/hcd-ehci.h"
>> #include "hw/ppc/fdt.h"
>> #include "hw/qdev-properties.h"
>> #include "hw/pci/pci.h"
>> diff --git a/hw/usb/chipidea.c b/hw/usb/chipidea.c
>> index 3dcd22ccba..e81f63295e 100644
>> --- a/hw/usb/chipidea.c
>> +++ b/hw/usb/chipidea.c
>> @@ -11,6 +11,7 @@
>>
>> #include "qemu/osdep.h"
>> #include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "hw/usb/chipidea.h"
>> #include "qemu/log.h"
>> #include "qemu/module.h"
>> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
>> index 3730736540..b7debc1934 100644
>> --- a/hw/usb/hcd-ehci-sysbus.c
>> +++ b/hw/usb/hcd-ehci-sysbus.c
>> @@ -18,6 +18,7 @@
>> #include "qemu/osdep.h"
>> #include "hw/qdev-properties.h"
>> #include "hw/usb/hcd-ehci.h"
>> +#include "hw/usb/usb-hcd.h"
>> #include "migration/vmstate.h"
>> #include "qemu/module.h"
> 
> Do these last two still need hw/usb/hcd-ehci.h? If so do they get
> hw/usb/usb-hcd.h via that one so do they need to explicitely include it
> again?

chipidea.c implements an HCI, so it uses the hcd-ehci.h internals,
else we get:

usb/chipidea.c:96:5: error: unknown type name ‘EHCIState’
   96 |     EHCIState *ehci = &SYS_BUS_EHCI(obj)->ehci;
      |     ^~~~~~~~~
hw/usb/chipidea.c:152:5: error: unknown type name ‘SysBusEHCIClass’
  152 |     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(klass);
      |     ^~~~~~~~~~~~~~~
hw/usb/chipidea.c:152:28: error: implicit declaration of function
‘SYS_BUS_EHCI_CLASS’ [-Werror=implicit-function-declaration]
  152 |     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(klass);
      |                            ^~~~~~~~~~~~~~~~~~

Similarly with hcd-ehci-sysbus.c:

hw/usb/hcd-ehci-sysbus.c:30:50: error: ‘vmstate_ehci’ undeclared here
(not in a function)
   30 |         VMSTATE_STRUCT(ehci, EHCISysBusState, 2, vmstate_ehci,
EHCIState),
      |                                                  ^~~~~~~~~~~~
hw/usb/hcd-ehci-sysbus.c:45:26: error: implicit declaration of function
‘SYS_BUS_EHCI’; did you mean ‘TYPE_SYS_BUS_EHCI’?
[-Werror=implicit-function-declaration]
   45 |     EHCISysBusState *i = SYS_BUS_EHCI(dev);
      |                          ^~~~~~~~~~~~
      |                          TYPE_SYS_BUS_EHCI
hw/usb/hcd-ehci-sysbus.c:48:5: error: implicit declaration of function
‘usb_ehci_realize’; did you mean ‘usb_ehci_sysbus_realize’?
[-Werror=implicit-function-declaration]
   48 |     usb_ehci_realize(s, dev, errp);
      |     ^~~~~~~~~~~~~~~~
      |     usb_ehci_sysbus_realize
hw/usb/hcd-ehci-sysbus.c:74:5: error: implicit declaration of function
‘usb_ehci_init’ [-Werror=implicit-function-declaration]
   74 |     usb_ehci_init(s, DEVICE(obj));
      |     ^~~~~~~~~~~~~

The idea of "hw/usb/usb-hcd.h" is to keep USB internals opaque to
machine/board/soc using controllers, they just want to use the
devices.

I'll see how to reword the description to make that clearer.

> 
> Regards,
> BALATON Zoltan

