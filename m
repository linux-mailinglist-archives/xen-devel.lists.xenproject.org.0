Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C969EDC126
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOcC-0000Yr-V2; Fri, 18 Oct 2019 09:32:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLOcB-0000Yl-3C
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:32:07 +0000
X-Inumbo-ID: 245b8de0-f18a-11e9-beca-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 245b8de0-f18a-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 09:32:03 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a15so4697197oic.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=d4jRdU8trmI1irYo0e7itr+36NtFiQSw1G4kGSw8c2w=;
 b=duHwzwI1uqvAy7MF7QPNNVOlBOcAl3D1BW8qxxTjgZtVzdpTMBFB4kMtTOpcm127bf
 8DtArLzqkWTZUUWTFpxR0L17K4RuasiobcdDdVaWEEYpHQ1LGg7sTIeVmorFdyafSEyn
 Bzho+kRT1anlO6Qd5oR8WJHJd2Qv9ApG9J7RWdD5awrl3SWZzX3N/HkM/3GskoHHZLpz
 1lADyF129EvjGe7V/5osE/JIzh3CDkYNlt9ZN/3z50/J+hfwMiBfY5du/4mo8YXEBKLK
 yfaqjZTnbM2MOb5RrIHKeEJaeL5jgARSPe6ScLh9b8Ru0zGUW25zH0gw+4AU5DA7jBh+
 v7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=d4jRdU8trmI1irYo0e7itr+36NtFiQSw1G4kGSw8c2w=;
 b=l0m7vJlrfF1xaKPWhrftoARRLWQ+F9cpNwhseig0TsEqZh9l3vwLCXZqAhSRg7BzPL
 xGZk3HPY1KPiii4F7EbHMHbPntQoN7tbPTAM/kRnGCDTrbi6CB1c+znqIYmowuxWGb+x
 Qbl40fB/+xeupvPNA2HP8pA505mavEJ+4QBO4bY6Fw9ynJ18UqW2FW7xTD+QhjdsxyTN
 QvGjdADY7rTQ+7yUgs7TastMg/Su16BzfjC75HsxdI2/rLlh+KkRCCGTfZWjgVHvVmUh
 FV3mZoTzn49DplCyMAcCdLc+kVaHpWcvzkyzRMziZH8iiGi/HtAlo9FrSIR/C+y979iK
 +Seg==
X-Gm-Message-State: APjAAAV1oO7nC/PS6z9yk/48RP4D4j2pyRXfMtpVcYLKHrBd5jkYaoWE
 0kmRjtfvRFvc6QSDbwEPdEuVTp0i3tnPmyx6qEI=
X-Google-Smtp-Source: APXvYqzmdhGDOSCAKzFLo1DR2hGsQySqSVQJp0hiVSczd0ALeLXK6HYVc+9WHpSXB75edil5DFk+faCOGTnDQ2ugjXI=
X-Received: by 2002:a05:6808:341:: with SMTP id
 j1mr6931449oie.106.1571391122416; 
 Fri, 18 Oct 2019 02:32:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:32:02
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-31-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-31-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:32:02 +0200
Message-ID: <CAL1e-=hx3BtCXugrYsYH_kLeKa-wuvPWQDHQ2iOgVEPVhT4i1g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 30/32] hw/pci-host/piix: Extract PIIX3
 functions to hw/isa/piix3.c
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============3929220089666017444=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3929220089666017444==
Content-Type: multipart/alternative; boundary="000000000000a7a92d05952c0182"

--000000000000a7a92d05952c0182
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Move all the PIIX3 functions to a new file: hw/isa/piix3.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Checkpatch warning:
>
>  ERROR: spaces required around that '*' (ctx:VxV)
>  #312: FILE: hw/isa/piix3.c:248:
>  +    .subsections =3D (const VMStateDescription*[]) {
>                                               ^
> ---
>  MAINTAINERS                   |   1 +
>  hw/i386/Kconfig               |   1 +
>  hw/isa/Kconfig                |   4 +
>  hw/isa/Makefile.objs          |   1 +
>  hw/isa/piix3.c                | 399 +++++++++++++++++++++++++++++++++
>  hw/pci-host/Kconfig           |   1 -
>  hw/pci-host/piix.c            | 402 ----------------------------------
>  include/hw/southbridge/piix.h |  36 +++
>  8 files changed, 442 insertions(+), 403 deletions(-)
>  create mode 100644 hw/isa/piix3.c
>
>

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/MAINTAINERS b/MAINTAINERS
> index adf059a164..4845f47d93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1231,6 +1231,7 @@ F: hw/pci-host/pam.c
>  F: include/hw/pci-host/i440fx.h
>  F: include/hw/pci-host/q35.h
>  F: include/hw/pci-host/pam.h
> +F: hw/isa/piix3.c
>  F: hw/isa/lpc_ich9.c
>  F: hw/i2c/smbus_ich9.c
>  F: hw/acpi/piix4.c
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index c5c9d4900e..589d75e26a 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -61,6 +61,7 @@ config I440FX
>      select PC_ACPI
>      select ACPI_SMBUS
>      select PCI_PIIX
> +    select PIIX3
>      select IDE_PIIX
>      select DIMM
>      select SMBIOS
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 98a289957e..8a38813cc1 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -29,6 +29,10 @@ config PC87312
>      select FDC
>      select IDE_ISA
>
> +config PIIX3
> +    bool
> +    select ISA_BUS
> +
>  config PIIX4
>      bool
>      # For historical reasons, SuperIO devices are created in the board
> diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
> index ff97485504..8e73960a75 100644
> --- a/hw/isa/Makefile.objs
> +++ b/hw/isa/Makefile.objs
> @@ -3,6 +3,7 @@ common-obj-$(CONFIG_ISA_SUPERIO) +=3D isa-superio.o
>  common-obj-$(CONFIG_APM) +=3D apm.o
>  common-obj-$(CONFIG_I82378) +=3D i82378.o
>  common-obj-$(CONFIG_PC87312) +=3D pc87312.o
> +common-obj-$(CONFIG_PIIX3) +=3D piix3.o
>  common-obj-$(CONFIG_PIIX4) +=3D piix4.o
>  common-obj-$(CONFIG_VT82C686) +=3D vt82c686.o
>  common-obj-$(CONFIG_SMC37C669) +=3D smc37c669-superio.o
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> new file mode 100644
> index 0000000000..05146447ef
> --- /dev/null
> +++ b/hw/isa/piix3.c
> @@ -0,0 +1,399 @@
> +/*
> + * QEMU PIIX PCI ISA Bridge Emulation
> + *
> + * Copyright (c) 2006 Fabrice Bellard
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/range.h"
> +#include "hw/southbridge/piix.h"
> +#include "hw/irq.h"
> +#include "hw/isa/isa.h"
> +#include "hw/xen/xen.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
> +#include "migration/vmstate.h"
> +
> +#define XEN_PIIX_NUM_PIRQS      128ULL
> +
> +#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
> +#define PIIX3_PCI_DEVICE(obj) \
> +    OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)
> +
> +#define TYPE_PIIX3_DEVICE "PIIX3"
> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> +
> +static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
> +{
> +    qemu_set_irq(piix3->pic[pic_irq],
> +                 !!(piix3->pic_levels &
> +                    (((1ULL << PIIX_NUM_PIRQS) - 1) <<
> +                     (pic_irq * PIIX_NUM_PIRQS))));
> +}
> +
> +static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq,
> int level)
> +{
> +    int pic_irq;
> +    uint64_t mask;
> +
> +    pic_irq =3D piix3->dev.config[PIIX_PIRQCA + pirq];
> +    if (pic_irq >=3D PIIX_NUM_PIC_IRQS) {
> +        return;
> +    }
> +
> +    mask =3D 1ULL << ((pic_irq * PIIX_NUM_PIRQS) + pirq);
> +    piix3->pic_levels &=3D ~mask;
> +    piix3->pic_levels |=3D mask * !!level;
> +}
> +
> +static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
> +{
> +    int pic_irq;
> +
> +    pic_irq =3D piix3->dev.config[PIIX_PIRQCA + pirq];
> +    if (pic_irq >=3D PIIX_NUM_PIC_IRQS) {
> +        return;
> +    }
> +
> +    piix3_set_irq_level_internal(piix3, pirq, level);
> +
> +    piix3_set_irq_pic(piix3, pic_irq);
> +}
> +
> +static void piix3_set_irq(void *opaque, int pirq, int level)
> +{
> +    PIIX3State *piix3 =3D opaque;
> +    piix3_set_irq_level(piix3, pirq, level);
> +}
> +
> +static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
> +{
> +    PIIX3State *piix3 =3D opaque;
> +    int irq =3D piix3->dev.config[PIIX_PIRQCA + pin];
> +    PCIINTxRoute route;
> +
> +    if (irq < PIIX_NUM_PIC_IRQS) {
> +        route.mode =3D PCI_INTX_ENABLED;
> +        route.irq =3D irq;
> +    } else {
> +        route.mode =3D PCI_INTX_DISABLED;
> +        route.irq =3D -1;
> +    }
> +    return route;
> +}
> +
> +/* irq routing is changed. so rebuild bitmap */
> +static void piix3_update_irq_levels(PIIX3State *piix3)
> +{
> +    PCIBus *bus =3D pci_get_bus(&piix3->dev);
> +    int pirq;
> +
> +    piix3->pic_levels =3D 0;
> +    for (pirq =3D 0; pirq < PIIX_NUM_PIRQS; pirq++) {
> +        piix3_set_irq_level(piix3, pirq, pci_bus_get_irq_level(bus,
> pirq));
> +    }
> +}
> +
> +static void piix3_write_config(PCIDevice *dev,
> +                               uint32_t address, uint32_t val, int len)
> +{
> +    pci_default_write_config(dev, address, val, len);
> +    if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
> +        PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);
> +        int pic_irq;
> +
> +        pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
> +        piix3_update_irq_levels(piix3);
> +        for (pic_irq =3D 0; pic_irq < PIIX_NUM_PIC_IRQS; pic_irq++) {
> +            piix3_set_irq_pic(piix3, pic_irq);
> +        }
> +    }
> +}
> +
> +static void piix3_write_config_xen(PCIDevice *dev,
> +                                   uint32_t address, uint32_t val, int
> len)
> +{
> +    xen_piix_pci_write_config_client(address, val, len);
> +    piix3_write_config(dev, address, val, len);
> +}
> +
> +static void piix3_reset(void *opaque)
> +{
> +    PIIX3State *d =3D opaque;
> +    uint8_t *pci_conf =3D d->dev.config;
> +
> +    pci_conf[0x04] =3D 0x07; /* master, memory and I/O */
> +    pci_conf[0x05] =3D 0x00;
> +    pci_conf[0x06] =3D 0x00;
> +    pci_conf[0x07] =3D 0x02; /* PCI_status_devsel_medium */
> +    pci_conf[0x4c] =3D 0x4d;
> +    pci_conf[0x4e] =3D 0x03;
> +    pci_conf[0x4f] =3D 0x00;
> +    pci_conf[0x60] =3D 0x80;
> +    pci_conf[0x61] =3D 0x80;
> +    pci_conf[0x62] =3D 0x80;
> +    pci_conf[0x63] =3D 0x80;
> +    pci_conf[0x69] =3D 0x02;
> +    pci_conf[0x70] =3D 0x80;
> +    pci_conf[0x76] =3D 0x0c;
> +    pci_conf[0x77] =3D 0x0c;
> +    pci_conf[0x78] =3D 0x02;
> +    pci_conf[0x79] =3D 0x00;
> +    pci_conf[0x80] =3D 0x00;
> +    pci_conf[0x82] =3D 0x00;
> +    pci_conf[0xa0] =3D 0x08;
> +    pci_conf[0xa2] =3D 0x00;
> +    pci_conf[0xa3] =3D 0x00;
> +    pci_conf[0xa4] =3D 0x00;
> +    pci_conf[0xa5] =3D 0x00;
> +    pci_conf[0xa6] =3D 0x00;
> +    pci_conf[0xa7] =3D 0x00;
> +    pci_conf[0xa8] =3D 0x0f;
> +    pci_conf[0xaa] =3D 0x00;
> +    pci_conf[0xab] =3D 0x00;
> +    pci_conf[0xac] =3D 0x00;
> +    pci_conf[0xae] =3D 0x00;
> +
> +    d->pic_levels =3D 0;
> +    d->rcr =3D 0;
> +}
> +
> +static int piix3_post_load(void *opaque, int version_id)
> +{
> +    PIIX3State *piix3 =3D opaque;
> +    int pirq;
> +
> +    /*
> +     * Because the i8259 has not been deserialized yet, qemu_irq_raise
> +     * might bring the system to a different state than the saved one;
> +     * for example, the interrupt could be masked but the i8259 would
> +     * not know that yet and would trigger an interrupt in the CPU.
> +     *
> +     * Here, we update irq levels without raising the interrupt.
> +     * Interrupt state will be deserialized separately through the i8259=
.
> +     */
> +    piix3->pic_levels =3D 0;
> +    for (pirq =3D 0; pirq < PIIX_NUM_PIRQS; pirq++) {
> +        piix3_set_irq_level_internal(piix3, pirq,
> +            pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
> +    }
> +    return 0;
> +}
> +
> +static int piix3_pre_save(void *opaque)
> +{
> +    int i;
> +    PIIX3State *piix3 =3D opaque;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(piix3->pci_irq_levels_vmstate); i++) {
> +        piix3->pci_irq_levels_vmstate[i] =3D
> +            pci_bus_get_irq_level(pci_get_bus(&piix3->dev), i);
> +    }
> +
> +    return 0;
> +}
> +
> +static bool piix3_rcr_needed(void *opaque)
> +{
> +    PIIX3State *piix3 =3D opaque;
> +
> +    return (piix3->rcr !=3D 0);
> +}
> +
> +static const VMStateDescription vmstate_piix3_rcr =3D {
> +    .name =3D "PIIX3/rcr",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D piix3_rcr_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8(rcr, PIIX3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_piix3 =3D {
> +    .name =3D "PIIX3",
> +    .version_id =3D 3,
> +    .minimum_version_id =3D 2,
> +    .post_load =3D piix3_post_load,
> +    .pre_save =3D piix3_pre_save,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(dev, PIIX3State),
> +        VMSTATE_INT32_ARRAY_V(pci_irq_levels_vmstate, PIIX3State,
> +                              PIIX_NUM_PIRQS, 3),
> +        VMSTATE_END_OF_LIST()
> +    },
> +    .subsections =3D (const VMStateDescription*[]) {
> +        &vmstate_piix3_rcr,
> +        NULL
> +    }
> +};
> +
> +
> +static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned
> len)
> +{
> +    PIIX3State *d =3D opaque;
> +
> +    if (val & 4) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        return;
> +    }
> +    d->rcr =3D val & 2; /* keep System Reset type only */
> +}
> +
> +static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)
> +{
> +    PIIX3State *d =3D opaque;
> +
> +    return d->rcr;
> +}
> +
> +static const MemoryRegionOps rcr_ops =3D {
> +    .read =3D rcr_read,
> +    .write =3D rcr_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN
> +};
> +
> +static void piix3_realize(PCIDevice *dev, Error **errp)
> +{
> +    PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);
> +
> +    if (!isa_bus_new(DEVICE(d), get_system_memory(),
> +                     pci_address_space_io(dev), errp)) {
> +        return;
> +    }
> +
> +    memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
> +                          "piix3-reset-control", 1);
> +    memory_region_add_subregion_overlap(pci_address_space_io(dev),
> RCR_IOPORT,
> +                                        &d->rcr_mem, 1);
> +
> +    qemu_register_reset(piix3_reset, d);
> +}
> +
> +static void pci_piix3_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    dc->desc        =3D "ISA bridge";
> +    dc->vmsd        =3D &vmstate_piix3;
> +    dc->hotpluggable   =3D false;
> +    k->realize      =3D piix3_realize;
> +    k->vendor_id    =3D PCI_VENDOR_ID_INTEL;
> +    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> +    k->device_id    =3D PCI_DEVICE_ID_INTEL_82371SB_0;
> +    k->class_id     =3D PCI_CLASS_BRIDGE_ISA;
> +    /*
> +     * Reason: part of PIIX3 southbridge, needs to be wired up by
> +     * pc_piix.c's pc_init1()
> +     */
> +    dc->user_creatable =3D false;
> +}
> +
> +static const TypeInfo piix3_pci_type_info =3D {
> +    .name =3D TYPE_PIIX3_PCI_DEVICE,
> +    .parent =3D TYPE_PCI_DEVICE,
> +    .instance_size =3D sizeof(PIIX3State),
> +    .abstract =3D true,
> +    .class_init =3D pci_piix3_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
> +};
> +
> +static void piix3_class_init(ObjectClass *klass, void *data)
> +{
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    k->config_write =3D piix3_write_config;
> +}
> +
> +static const TypeInfo piix3_info =3D {
> +    .name          =3D TYPE_PIIX3_DEVICE,
> +    .parent        =3D TYPE_PIIX3_PCI_DEVICE,
> +    .class_init    =3D piix3_class_init,
> +};
> +
> +static void piix3_xen_class_init(ObjectClass *klass, void *data)
> +{
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    k->config_write =3D piix3_write_config_xen;
> +};
> +
> +static const TypeInfo piix3_xen_info =3D {
> +    .name          =3D TYPE_PIIX3_XEN_DEVICE,
> +    .parent        =3D TYPE_PIIX3_PCI_DEVICE,
> +    .class_init    =3D piix3_xen_class_init,
> +};
> +
> +static void piix3_register_types(void)
> +{
> +    type_register_static(&piix3_pci_type_info);
> +    type_register_static(&piix3_info);
> +    type_register_static(&piix3_xen_info);
> +}
> +
> +type_init(piix3_register_types)
> +
> +/*
> + * Return the global irq number corresponding to a given device irq
> + * pin. We could also use the bus number to have a more precise mapping.
> + */
> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> +{
> +    int slot_addend;
> +    slot_addend =3D (pci_dev->devfn >> 3) - 1;
> +    return (pci_intx + slot_addend) & 3;
> +}
> +
> +PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
> +{
> +    PIIX3State *piix3;
> +    PCIDevice *pci_dev;
> +
> +    /*
> +     * Xen supports additional interrupt routes from the PCI devices to
> +     * the IOAPIC: the four pins of each PCI device on the bus are also
> +     * connected to the IOAPIC directly.
> +     * These additional routes can be discovered through ACPI.
> +     */
> +    if (xen_enabled()) {
> +        pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true,
> +                                                  TYPE_PIIX3_XEN_DEVICE)=
;
> +        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
> +        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
> +                     piix3, XEN_PIIX_NUM_PIRQS);
> +    } else {
> +        pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true,
> +                                                  TYPE_PIIX3_DEVICE);
> +        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
> +        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
> +                     piix3, PIIX_NUM_PIRQS);
> +        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
> +    }
> +    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> +
> +    return piix3;
> +}
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 1edc1a31d4..397043b289 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -32,7 +32,6 @@ config PCI_PIIX
>      bool
>      select PCI
>      select PAM
> -    select ISA_BUS
>
>  config PCI_EXPRESS_Q35
>      bool
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 61f91ff561..79ecd58a2b 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -24,22 +24,15 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/i386/pc.h"
> -#include "hw/irq.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/pci-host/i440fx.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
>  #include "qapi/error.h"
> -#include "qemu/range.h"
> -#include "hw/xen/xen.h"
>  #include "migration/vmstate.h"
>  #include "hw/pci-host/pam.h"
> -#include "sysemu/reset.h"
> -#include "sysemu/runstate.h"
> -#include "hw/i386/ioapic.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>
> @@ -59,49 +52,9 @@ typedef struct I440FXState {
>      uint32_t short_root_bus;
>  } I440FXState;
>
> -#define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
> -#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
> -#define XEN_PIIX_NUM_PIRQS      128ULL
> -
> -typedef struct PIIX3State {
> -    PCIDevice dev;
> -
> -    /*
> -     * bitmap to track pic levels.
> -     * The pic level is the logical OR of all the PCI irqs mapped to it
> -     * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
> -     *
> -     * PIRQ is mapped to PIC pins, we track it by
> -     * PIIX_NUM_PIRQS * PIIX_NUM_PIC_IRQS =3D 64 bits with
> -     * pic_irq * PIIX_NUM_PIRQS + pirq
> -     */
> -#if PIIX_NUM_PIC_IRQS * PIIX_NUM_PIRQS > 64
> -#error "unable to encode pic state in 64bit in pic_levels."
> -#endif
> -    uint64_t pic_levels;
> -
> -    qemu_irq *pic;
> -
> -    /* This member isn't used. Just for save/load compatibility */
> -    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> -
> -    /* Reset Control Register contents */
> -    uint8_t rcr;
> -
> -    /* IO memory region for Reset Control Register (RCR_IOPORT) */
> -    MemoryRegion rcr_mem;
> -} PIIX3State;
> -
> -#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
> -#define PIIX3_PCI_DEVICE(obj) \
> -    OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)
> -
>  #define I440FX_PCI_DEVICE(obj) \
>      OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEVICE)
>
> -#define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> -
>  struct PCII440FXState {
>      /*< private >*/
>      PCIDevice parent_obj;
> @@ -128,22 +81,6 @@ struct PCII440FXState {
>   */
>  #define I440FX_COREBOOT_RAM_SIZE 0x57
>
> -static void piix3_set_irq(void *opaque, int pirq, int level);
> -static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int
> pci_intx);
> -static void piix3_write_config_xen(PCIDevice *dev,
> -                               uint32_t address, uint32_t val, int len);
> -
> -/*
> - * Return the global irq number corresponding to a given device irq
> - * pin. We could also use the bus number to have a more precise mapping.
> - */
> -static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
> -{
> -    int slot_addend;
> -    slot_addend =3D (pci_dev->devfn >> 3) - 1;
> -    return (pci_intx + slot_addend) & 3;
> -}
> -
>  static void i440fx_update_memory_mappings(PCII440FXState *d)
>  {
>      int i;
> @@ -333,36 +270,6 @@ static void i440fx_realize(PCIDevice *dev, Error
> **errp)
>      }
>  }
>
> -static PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
> -{
> -    PIIX3State *piix3;
> -    PCIDevice *pci_dev;
> -
> -    /*
> -     * Xen supports additional interrupt routes from the PCI devices to
> -     * the IOAPIC: the four pins of each PCI device on the bus are also
> -     * connected to the IOAPIC directly.
> -     * These additional routes can be discovered through ACPI.
> -     */
> -    if (xen_enabled()) {
> -        pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true,
> -                                                  TYPE_PIIX3_XEN_DEVICE)=
;
> -        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
> -        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
> -                     piix3, XEN_PIIX_NUM_PIRQS);
> -    } else {
> -        pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true,
> -                                                  TYPE_PIIX3_DEVICE);
> -        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
> -        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
> -                     piix3, PIIX_NUM_PIRQS);
> -        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
> -    }
> -    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> -
> -    return piix3;
> -}
> -
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      PCII440FXState **pi440fx_state,
>                      int *piix3_devfn,
> @@ -455,312 +362,6 @@ PCIBus *find_i440fx(void)
>      return s ? s->bus : NULL;
>  }
>
> -/* PIIX3 PCI to ISA bridge */
> -static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
> -{
> -    qemu_set_irq(piix3->pic[pic_irq],
> -                 !!(piix3->pic_levels &
> -                    (((1ULL << PIIX_NUM_PIRQS) - 1) <<
> -                     (pic_irq * PIIX_NUM_PIRQS))));
> -}
> -
> -static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq,
> int level)
> -{
> -    int pic_irq;
> -    uint64_t mask;
> -
> -    pic_irq =3D piix3->dev.config[PIIX_PIRQCA + pirq];
> -    if (pic_irq >=3D PIIX_NUM_PIC_IRQS) {
> -        return;
> -    }
> -
> -    mask =3D 1ULL << ((pic_irq * PIIX_NUM_PIRQS) + pirq);
> -    piix3->pic_levels &=3D ~mask;
> -    piix3->pic_levels |=3D mask * !!level;
> -}
> -
> -static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
> -{
> -    int pic_irq;
> -
> -    pic_irq =3D piix3->dev.config[PIIX_PIRQCA + pirq];
> -    if (pic_irq >=3D PIIX_NUM_PIC_IRQS) {
> -        return;
> -    }
> -
> -    piix3_set_irq_level_internal(piix3, pirq, level);
> -
> -    piix3_set_irq_pic(piix3, pic_irq);
> -}
> -
> -static void piix3_set_irq(void *opaque, int pirq, int level)
> -{
> -    PIIX3State *piix3 =3D opaque;
> -    piix3_set_irq_level(piix3, pirq, level);
> -}
> -
> -static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
> -{
> -    PIIX3State *piix3 =3D opaque;
> -    int irq =3D piix3->dev.config[PIIX_PIRQCA + pin];
> -    PCIINTxRoute route;
> -
> -    if (irq < PIIX_NUM_PIC_IRQS) {
> -        route.mode =3D PCI_INTX_ENABLED;
> -        route.irq =3D irq;
> -    } else {
> -        route.mode =3D PCI_INTX_DISABLED;
> -        route.irq =3D -1;
> -    }
> -    return route;
> -}
> -
> -/* irq routing is changed. so rebuild bitmap */
> -static void piix3_update_irq_levels(PIIX3State *piix3)
> -{
> -    PCIBus *bus =3D pci_get_bus(&piix3->dev);
> -    int pirq;
> -
> -    piix3->pic_levels =3D 0;
> -    for (pirq =3D 0; pirq < PIIX_NUM_PIRQS; pirq++) {
> -        piix3_set_irq_level(piix3, pirq, pci_bus_get_irq_level(bus,
> pirq));
> -    }
> -}
> -
> -static void piix3_write_config(PCIDevice *dev,
> -                               uint32_t address, uint32_t val, int len)
> -{
> -    pci_default_write_config(dev, address, val, len);
> -    if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
> -        PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);
> -        int pic_irq;
> -
> -        pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
> -        piix3_update_irq_levels(piix3);
> -        for (pic_irq =3D 0; pic_irq < PIIX_NUM_PIC_IRQS; pic_irq++) {
> -            piix3_set_irq_pic(piix3, pic_irq);
> -        }
> -    }
> -}
> -
> -static void piix3_write_config_xen(PCIDevice *dev,
> -                               uint32_t address, uint32_t val, int len)
> -{
> -    xen_piix_pci_write_config_client(address, val, len);
> -    piix3_write_config(dev, address, val, len);
> -}
> -
> -static void piix3_reset(void *opaque)
> -{
> -    PIIX3State *d =3D opaque;
> -    uint8_t *pci_conf =3D d->dev.config;
> -
> -    pci_conf[0x04] =3D 0x07; /* master, memory and I/O */
> -    pci_conf[0x05] =3D 0x00;
> -    pci_conf[0x06] =3D 0x00;
> -    pci_conf[0x07] =3D 0x02; /* PCI_status_devsel_medium */
> -    pci_conf[0x4c] =3D 0x4d;
> -    pci_conf[0x4e] =3D 0x03;
> -    pci_conf[0x4f] =3D 0x00;
> -    pci_conf[0x60] =3D 0x80;
> -    pci_conf[0x61] =3D 0x80;
> -    pci_conf[0x62] =3D 0x80;
> -    pci_conf[0x63] =3D 0x80;
> -    pci_conf[0x69] =3D 0x02;
> -    pci_conf[0x70] =3D 0x80;
> -    pci_conf[0x76] =3D 0x0c;
> -    pci_conf[0x77] =3D 0x0c;
> -    pci_conf[0x78] =3D 0x02;
> -    pci_conf[0x79] =3D 0x00;
> -    pci_conf[0x80] =3D 0x00;
> -    pci_conf[0x82] =3D 0x00;
> -    pci_conf[0xa0] =3D 0x08;
> -    pci_conf[0xa2] =3D 0x00;
> -    pci_conf[0xa3] =3D 0x00;
> -    pci_conf[0xa4] =3D 0x00;
> -    pci_conf[0xa5] =3D 0x00;
> -    pci_conf[0xa6] =3D 0x00;
> -    pci_conf[0xa7] =3D 0x00;
> -    pci_conf[0xa8] =3D 0x0f;
> -    pci_conf[0xaa] =3D 0x00;
> -    pci_conf[0xab] =3D 0x00;
> -    pci_conf[0xac] =3D 0x00;
> -    pci_conf[0xae] =3D 0x00;
> -
> -    d->pic_levels =3D 0;
> -    d->rcr =3D 0;
> -}
> -
> -static int piix3_post_load(void *opaque, int version_id)
> -{
> -    PIIX3State *piix3 =3D opaque;
> -    int pirq;
> -
> -    /* Because the i8259 has not been deserialized yet, qemu_irq_raise
> -     * might bring the system to a different state than the saved one;
> -     * for example, the interrupt could be masked but the i8259 would
> -     * not know that yet and would trigger an interrupt in the CPU.
> -     *
> -     * Here, we update irq levels without raising the interrupt.
> -     * Interrupt state will be deserialized separately through the i8259=
.
> -     */
> -    piix3->pic_levels =3D 0;
> -    for (pirq =3D 0; pirq < PIIX_NUM_PIRQS; pirq++) {
> -        piix3_set_irq_level_internal(piix3, pirq,
> -            pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
> -    }
> -    return 0;
> -}
> -
> -static int piix3_pre_save(void *opaque)
> -{
> -    int i;
> -    PIIX3State *piix3 =3D opaque;
> -
> -    for (i =3D 0; i < ARRAY_SIZE(piix3->pci_irq_levels_vmstate); i++) {
> -        piix3->pci_irq_levels_vmstate[i] =3D
> -            pci_bus_get_irq_level(pci_get_bus(&piix3->dev), i);
> -    }
> -
> -    return 0;
> -}
> -
> -static bool piix3_rcr_needed(void *opaque)
> -{
> -    PIIX3State *piix3 =3D opaque;
> -
> -    return (piix3->rcr !=3D 0);
> -}
> -
> -static const VMStateDescription vmstate_piix3_rcr =3D {
> -    .name =3D "PIIX3/rcr",
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> -    .needed =3D piix3_rcr_needed,
> -    .fields =3D (VMStateField[]) {
> -        VMSTATE_UINT8(rcr, PIIX3State),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
> -static const VMStateDescription vmstate_piix3 =3D {
> -    .name =3D "PIIX3",
> -    .version_id =3D 3,
> -    .minimum_version_id =3D 2,
> -    .post_load =3D piix3_post_load,
> -    .pre_save =3D piix3_pre_save,
> -    .fields =3D (VMStateField[]) {
> -        VMSTATE_PCI_DEVICE(dev, PIIX3State),
> -        VMSTATE_INT32_ARRAY_V(pci_irq_levels_vmstate, PIIX3State,
> -                              PIIX_NUM_PIRQS, 3),
> -        VMSTATE_END_OF_LIST()
> -    },
> -    .subsections =3D (const VMStateDescription*[]) {
> -        &vmstate_piix3_rcr,
> -        NULL
> -    }
> -};
> -
> -
> -static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned
> len)
> -{
> -    PIIX3State *d =3D opaque;
> -
> -    if (val & 4) {
> -        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> -        return;
> -    }
> -    d->rcr =3D val & 2; /* keep System Reset type only */
> -}
> -
> -static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)
> -{
> -    PIIX3State *d =3D opaque;
> -
> -    return d->rcr;
> -}
> -
> -static const MemoryRegionOps rcr_ops =3D {
> -    .read =3D rcr_read,
> -    .write =3D rcr_write,
> -    .endianness =3D DEVICE_LITTLE_ENDIAN
> -};
> -
> -static void piix3_realize(PCIDevice *dev, Error **errp)
> -{
> -    PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);
> -
> -    if (!isa_bus_new(DEVICE(d), get_system_memory(),
> -                     pci_address_space_io(dev), errp)) {
> -        return;
> -    }
> -
> -    memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
> -                          "piix3-reset-control", 1);
> -    memory_region_add_subregion_overlap(pci_address_space_io(dev),
> RCR_IOPORT,
> -                                        &d->rcr_mem, 1);
> -
> -    qemu_register_reset(piix3_reset, d);
> -}
> -
> -static void pci_piix3_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> -
> -    dc->desc        =3D "ISA bridge";
> -    dc->vmsd        =3D &vmstate_piix3;
> -    dc->hotpluggable   =3D false;
> -    k->realize      =3D piix3_realize;
> -    k->vendor_id    =3D PCI_VENDOR_ID_INTEL;
> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> -    k->device_id    =3D PCI_DEVICE_ID_INTEL_82371SB_0;
> -    k->class_id     =3D PCI_CLASS_BRIDGE_ISA;
> -    /*
> -     * Reason: part of PIIX3 southbridge, needs to be wired up by
> -     * pc_piix.c's pc_init1()
> -     */
> -    dc->user_creatable =3D false;
> -}
> -
> -static const TypeInfo piix3_pci_type_info =3D {
> -    .name =3D TYPE_PIIX3_PCI_DEVICE,
> -    .parent =3D TYPE_PCI_DEVICE,
> -    .instance_size =3D sizeof(PIIX3State),
> -    .abstract =3D true,
> -    .class_init =3D pci_piix3_class_init,
> -    .interfaces =3D (InterfaceInfo[]) {
> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> -        { },
> -    },
> -};
> -
> -static void piix3_class_init(ObjectClass *klass, void *data)
> -{
> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> -
> -    k->config_write =3D piix3_write_config;
> -}
> -
> -static const TypeInfo piix3_info =3D {
> -    .name          =3D TYPE_PIIX3_DEVICE,
> -    .parent        =3D TYPE_PIIX3_PCI_DEVICE,
> -    .class_init    =3D piix3_class_init,
> -};
> -
> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
> -{
> -    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> -
> -    k->config_write =3D piix3_write_config_xen;
> -};
> -
> -static const TypeInfo piix3_xen_info =3D {
> -    .name          =3D TYPE_PIIX3_XEN_DEVICE,
> -    .parent        =3D TYPE_PIIX3_PCI_DEVICE,
> -    .class_init    =3D piix3_xen_class_init,
> -};
> -
>  static void i440fx_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -922,9 +523,6 @@ static void i440fx_register_types(void)
>  {
>      type_register_static(&i440fx_info);
>      type_register_static(&igd_passthrough_i440fx_info);
> -    type_register_static(&piix3_pci_type_info);
> -    type_register_static(&piix3_info);
> -    type_register_static(&piix3_xen_info);
>      type_register_static(&i440fx_pcihost_info);
>  }
>
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
> index 9c92c37a4d..324a3a99fc 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -12,6 +12,8 @@
>  #ifndef HW_SOUTHBRIDGE_PIIX_H
>  #define HW_SOUTHBRIDGE_PIIX_H
>
> +#include "hw/pci/pci.h"
> +
>  #define TYPE_PIIX4_PM "PIIX4_PM"
>
>  I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
> @@ -30,8 +32,42 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t
> smb_io_base,
>   */
>  #define RCR_IOPORT 0xcf9
>
> +#define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
> +#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
> +
> +typedef struct PIIXState {
> +    PCIDevice dev;
> +
> +    /*
> +     * bitmap to track pic levels.
> +     * The pic level is the logical OR of all the PCI irqs mapped to it
> +     * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
> +     *
> +     * PIRQ is mapped to PIC pins, we track it by
> +     * PIIX_NUM_PIRQS * PIIX_NUM_PIC_IRQS =3D 64 bits with
> +     * pic_irq * PIIX_NUM_PIRQS + pirq
> +     */
> +#if PIIX_NUM_PIC_IRQS * PIIX_NUM_PIRQS > 64
> +#error "unable to encode pic state in 64bit in pic_levels."
> +#endif
> +    uint64_t pic_levels;
> +
> +    qemu_irq *pic;
> +
> +    /* This member isn't used. Just for save/load compatibility */
> +    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> +
> +    /* Reset Control Register contents */
> +    uint8_t rcr;
> +
> +    /* IO memory region for Reset Control Register (RCR_IOPORT) */
> +    MemoryRegion rcr_mem;
> +} PIIX3State;
> +
>  extern PCIDevice *piix4_dev;
>
> +PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
> +
>  DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
>                            I2CBus **smbus, size_t ide_buses);
>
> --
> 2.21.0
>
>
>

--000000000000a7a92d05952c0182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
Move all the PIIX3 functions to a new file: hw/isa/piix3.c.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
Checkpatch warning:<br>
<br>
=C2=A0ERROR: spaces required around that &#39;*&#39; (ctx:VxV)<br>
=C2=A0#312: FILE: hw/isa/piix3.c:248:<br>
=C2=A0+=C2=A0 =C2=A0 .subsections =3D (const VMStateDescription*[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/i386/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/isa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +<br>
=C2=A0hw/isa/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 399 ++++++++++++++++++++++++++++++<wbr>+++<br>
=C2=A0hw/pci-host/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 -<br>
=C2=A0hw/pci-host/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 402 ---=
---------------------------<wbr>----<br>
=C2=A0include/hw/southbridge/piix.h |=C2=A0 36 +++<br>
=C2=A08 files changed, 442 insertions(+), 403 deletions(-)<br>
=C2=A0create mode 100644 hw/isa/piix3.c<br>
<br></blockquote><div><br></div><div><br></div><div><span style=3D"color:rg=
b(34,34,34);font-size:14px;line-height:22.1200008392334px">Reviewed-by: Ale=
ksandar Markovic &lt;</span><a href=3D"mailto:amarkovic@wavecomp.com" targe=
t=3D"_blank" style=3D"font-size:14px;line-height:22.1200008392334px">amarko=
vic@wavecomp.com</a><span style=3D"color:rgb(34,34,34);font-size:14px;line-=
height:22.1200008392334px">&gt;</span><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index adf059a164..4845f47d93 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1231,6 +1231,7 @@ F: hw/pci-host/pam.c<br>
=C2=A0F: include/hw/pci-host/i440fx.h<br>
=C2=A0F: include/hw/pci-host/q35.h<br>
=C2=A0F: include/hw/pci-host/pam.h<br>
+F: hw/isa/piix3.c<br>
=C2=A0F: hw/isa/lpc_ich9.c<br>
=C2=A0F: hw/i2c/smbus_ich9.c<br>
=C2=A0F: hw/acpi/piix4.c<br>
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig<br>
index c5c9d4900e..589d75e26a 100644<br>
--- a/hw/i386/Kconfig<br>
+++ b/hw/i386/Kconfig<br>
@@ -61,6 +61,7 @@ config I440FX<br>
=C2=A0 =C2=A0 =C2=A0select PC_ACPI<br>
=C2=A0 =C2=A0 =C2=A0select ACPI_SMBUS<br>
=C2=A0 =C2=A0 =C2=A0select PCI_PIIX<br>
+=C2=A0 =C2=A0 select PIIX3<br>
=C2=A0 =C2=A0 =C2=A0select IDE_PIIX<br>
=C2=A0 =C2=A0 =C2=A0select DIMM<br>
=C2=A0 =C2=A0 =C2=A0select SMBIOS<br>
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig<br>
index 98a289957e..8a38813cc1 100644<br>
--- a/hw/isa/Kconfig<br>
+++ b/hw/isa/Kconfig<br>
@@ -29,6 +29,10 @@ config PC87312<br>
=C2=A0 =C2=A0 =C2=A0select FDC<br>
=C2=A0 =C2=A0 =C2=A0select IDE_ISA<br>
<br>
+config PIIX3<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select ISA_BUS<br>
+<br>
=C2=A0config PIIX4<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0# For historical reasons, SuperIO devices are created i=
n the board<br>
diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs<br>
index ff97485504..8e73960a75 100644<br>
--- a/hw/isa/Makefile.objs<br>
+++ b/hw/isa/Makefile.objs<br>
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_ISA_<wbr>SUPERIO) +=3D isa-superio.o<br=
>
=C2=A0common-obj-$(CONFIG_APM) +=3D apm.o<br>
=C2=A0common-obj-$(CONFIG_I82378) +=3D i82378.o<br>
=C2=A0common-obj-$(CONFIG_PC87312) +=3D pc87312.o<br>
+common-obj-$(CONFIG_PIIX3) +=3D piix3.o<br>
=C2=A0common-obj-$(CONFIG_PIIX4) +=3D piix4.o<br>
=C2=A0common-obj-$(CONFIG_VT82C686) +=3D vt82c686.o<br>
=C2=A0common-obj-$(CONFIG_SMC37C669) +=3D smc37c669-superio.o<br>
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c<br>
new file mode 100644<br>
index 0000000000..05146447ef<br>
--- /dev/null<br>
+++ b/hw/isa/piix3.c<br>
@@ -0,0 +1,399 @@<br>
+/*<br>
+ * QEMU PIIX PCI ISA Bridge Emulation<br>
+ *<br>
+ * Copyright (c) 2006 Fabrice Bellard<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/range.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/isa/isa.h&quot;<br>
+#include &quot;hw/xen/xen.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;sysemu/reset.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+<br>
+#define XEN_PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 128ULL<br>
+<br>
+#define TYPE_PIIX3_PCI_DEVICE &quot;pci-piix3&quot;<br>
+#define PIIX3_PCI_DEVICE(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)<br>
+<br>
+#define TYPE_PIIX3_DEVICE &quot;PIIX3&quot;<br>
+#define TYPE_PIIX3_XEN_DEVICE &quot;PIIX3-xen&quot;<br>
+<br>
+static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_set_irq(piix3-&gt;pic[pic_<wbr>irq],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!(piix3-&gt=
;pic_levels &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((1=
ULL &lt;&lt; PIIX_NUM_PIRQS) - 1) &lt;&lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(pic_irq * PIIX_NUM_PIRQS))));<br>
+}<br>
+<br>
+static void piix3_set_irq_level_internal(<wbr>PIIX3State *piix3, int pirq,=
 int level)<br>
+{<br>
+=C2=A0 =C2=A0 int pic_irq;<br>
+=C2=A0 =C2=A0 uint64_t mask;<br>
+<br>
+=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pirq];<br>
+=C2=A0 =C2=A0 if (pic_irq &gt;=3D PIIX_NUM_PIC_IRQS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 mask =3D 1ULL &lt;&lt; ((pic_irq * PIIX_NUM_PIRQS) + pirq);<=
br>
+=C2=A0 =C2=A0 piix3-&gt;pic_levels &amp;=3D ~mask;<br>
+=C2=A0 =C2=A0 piix3-&gt;pic_levels |=3D mask * !!level;<br>
+}<br>
+<br>
+static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)<br=
>
+{<br>
+=C2=A0 =C2=A0 int pic_irq;<br>
+<br>
+=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pirq];<br>
+=C2=A0 =C2=A0 if (pic_irq &gt;=3D PIIX_NUM_PIC_IRQS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 piix3_set_irq_level_internal(<wbr>piix3, pirq, level);<br>
+<br>
+=C2=A0 =C2=A0 piix3_set_irq_pic(piix3, pic_irq);<br>
+}<br>
+<br>
+static void piix3_set_irq(void *opaque, int pirq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
+=C2=A0 =C2=A0 piix3_set_irq_level(piix3, pirq, level);<br>
+}<br>
+<br>
+static PCIINTxRoute piix3_route_intx_pin_to_irq(<wbr>void *opaque, int pin=
)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
+=C2=A0 =C2=A0 int irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pin];<br>
+=C2=A0 =C2=A0 PCIINTxRoute route;<br>
+<br>
+=C2=A0 =C2=A0 if (irq &lt; PIIX_NUM_PIC_IRQS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.mode =3D PCI_INTX_ENABLED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.irq =3D irq;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.mode =3D PCI_INTX_DISABLED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.irq =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return route;<br>
+}<br>
+<br>
+/* irq routing is changed. so rebuild bitmap */<br>
+static void piix3_update_irq_levels(<wbr>PIIX3State *piix3)<br>
+{<br>
+=C2=A0 =C2=A0 PCIBus *bus =3D pci_get_bus(&amp;piix3-&gt;dev);<br>
+=C2=A0 =C2=A0 int pirq;<br>
+<br>
+=C2=A0 =C2=A0 piix3-&gt;pic_levels =3D 0;<br>
+=C2=A0 =C2=A0 for (pirq =3D 0; pirq &lt; PIIX_NUM_PIRQS; pirq++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_set_irq_level(piix3, pirq, pci_bus_get_i=
rq_level(bus, pirq));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void piix3_write_config(PCIDevice *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t address, uint32_t val, int l=
en)<br>
+{<br>
+=C2=A0 =C2=A0 pci_default_write_config(dev, address, val, len);<br>
+=C2=A0 =C2=A0 if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int pic_irq;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_fire_intx_routing_<wbr>notifier(pci_ge=
t_bus(&amp;piix3-&gt;<wbr>dev));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_update_irq_levels(piix3)<wbr>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (pic_irq =3D 0; pic_irq &lt; PIIX_NUM_PIC_=
IRQS; pic_irq++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_set_irq_pic(piix3, pic_irq=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void piix3_write_config_xen(<wbr>PCIDevice *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t address, uint3=
2_t val, int len)<br>
+{<br>
+=C2=A0 =C2=A0 xen_piix_pci_write_config_<wbr>client(address, val, len);<br=
>
+=C2=A0 =C2=A0 piix3_write_config(dev, address, val, len);<br>
+}<br>
+<br>
+static void piix3_reset(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *d =3D opaque;<br>
+=C2=A0 =C2=A0 uint8_t *pci_conf =3D d-&gt;dev.config;<br>
+<br>
+=C2=A0 =C2=A0 pci_conf[0x04] =3D 0x07; /* master, memory and I/O */<br>
+=C2=A0 =C2=A0 pci_conf[0x05] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0x06] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0x07] =3D 0x02; /* PCI_status_devsel_medium */<br>
+=C2=A0 =C2=A0 pci_conf[0x4c] =3D 0x4d;<br>
+=C2=A0 =C2=A0 pci_conf[0x4e] =3D 0x03;<br>
+=C2=A0 =C2=A0 pci_conf[0x4f] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0x60] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x61] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x62] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x63] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x69] =3D 0x02;<br>
+=C2=A0 =C2=A0 pci_conf[0x70] =3D 0x80;<br>
+=C2=A0 =C2=A0 pci_conf[0x76] =3D 0x0c;<br>
+=C2=A0 =C2=A0 pci_conf[0x77] =3D 0x0c;<br>
+=C2=A0 =C2=A0 pci_conf[0x78] =3D 0x02;<br>
+=C2=A0 =C2=A0 pci_conf[0x79] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0x80] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0x82] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa0] =3D 0x08;<br>
+=C2=A0 =C2=A0 pci_conf[0xa2] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa3] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa4] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa5] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa6] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa7] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xa8] =3D 0x0f;<br>
+=C2=A0 =C2=A0 pci_conf[0xaa] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xab] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xac] =3D 0x00;<br>
+=C2=A0 =C2=A0 pci_conf[0xae] =3D 0x00;<br>
+<br>
+=C2=A0 =C2=A0 d-&gt;pic_levels =3D 0;<br>
+=C2=A0 =C2=A0 d-&gt;rcr =3D 0;<br>
+}<br>
+<br>
+static int piix3_post_load(void *opaque, int version_id)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
+=C2=A0 =C2=A0 int pirq;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Because the i8259 has not been deserialized yet, qem=
u_irq_raise<br>
+=C2=A0 =C2=A0 =C2=A0* might bring the system to a different state than the=
 saved one;<br>
+=C2=A0 =C2=A0 =C2=A0* for example, the interrupt could be masked but the i=
8259 would<br>
+=C2=A0 =C2=A0 =C2=A0* not know that yet and would trigger an interrupt in =
the CPU.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Here, we update irq levels without raising the inter=
rupt.<br>
+=C2=A0 =C2=A0 =C2=A0* Interrupt state will be deserialized separately thro=
ugh the i8259.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 piix3-&gt;pic_levels =3D 0;<br>
+=C2=A0 =C2=A0 for (pirq =3D 0; pirq &lt; PIIX_NUM_PIRQS; pirq++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_set_irq_level_internal(<wbr>piix3, pirq,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_get_irq_level(pci_get_<w=
br>bus(&amp;piix3-&gt;dev), pirq));<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int piix3_pre_save(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(piix3-&gt;pci_irq_<wbr>level=
s_vmstate); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3-&gt;pci_irq_levels_vmstate[<wbr>i] =3D<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_get_irq_level(pci_get_<w=
br>bus(&amp;piix3-&gt;dev), i);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static bool piix3_rcr_needed(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 return (piix3-&gt;rcr !=3D 0);<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_piix3_rcr =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;PIIX3/rcr&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .needed =3D piix3_rcr_needed,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(rcr, PIIX3State),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_piix3 =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;PIIX3&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 3,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 2,<br>
+=C2=A0 =C2=A0 .post_load =3D piix3_post_load,<br>
+=C2=A0 =C2=A0 .pre_save =3D piix3_pre_save,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_PCI_DEVICE(dev, PIIX3State),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT32_ARRAY_V(pci_irq_<wbr>levels_vmst=
ate, PIIX3State,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX_NUM_PIRQS, 3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .subsections =3D (const VMStateDescription*[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vmstate_piix3_rcr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+<br>
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned le=
n)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *d =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 if (val &amp; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(<wbr>SHUTDOWN_CAUSE_=
GUEST_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 d-&gt;rcr =3D val &amp; 2; /* keep System Reset type only */=
<br>
+}<br>
+<br>
+static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *d =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 return d-&gt;rcr;<br>
+}<br>
+<br>
+static const MemoryRegionOps rcr_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D rcr_read,<br>
+=C2=A0 =C2=A0 .write =3D rcr_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN<br>
+};<br>
+<br>
+static void piix3_realize(PCIDevice *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);<br>
+<br>
+=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(d), get_system_memory(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci_address_space_io(dev), errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;d-&gt;rcr_<wbr>mem, OBJECT(dev), =
&amp;rcr_ops, d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;piix3-reset-control&quot;, 1);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion_<wbr>overlap(pci_address_space_i=
o(<wbr>dev), RCR_IOPORT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;d-&=
gt;rcr_mem, 1);<br>
+<br>
+=C2=A0 =C2=A0 qemu_register_reset(piix3_<wbr>reset, d);<br>
+}<br>
+<br>
+static void pci_piix3_class_init(<wbr>ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;ISA bridge&=
quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;vmstate_piix=
3;<br>
+=C2=A0 =C2=A0 dc-&gt;hotpluggable=C2=A0 =C2=A0=3D false;<br>
+=C2=A0 =C2=A0 k-&gt;realize=C2=A0 =C2=A0 =C2=A0 =3D piix3_realize;<br>
+=C2=A0 =C2=A0 k-&gt;vendor_id=C2=A0 =C2=A0 =3D PCI_VENDOR_ID_INTEL;<br>
+=C2=A0 =C2=A0 /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */<br>
+=C2=A0 =C2=A0 k-&gt;device_id=C2=A0 =C2=A0 =3D PCI_DEVICE_ID_INTEL_82371SB=
_0;<br>
+=C2=A0 =C2=A0 k-&gt;class_id=C2=A0 =C2=A0 =C2=A0=3D PCI_CLASS_BRIDGE_ISA;<=
br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Reason: part of PIIX3 southbridge, needs to be wired=
 up by<br>
+=C2=A0 =C2=A0 =C2=A0* pc_piix.c&#39;s pc_init1()<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 dc-&gt;user_creatable =3D false;<br>
+}<br>
+<br>
+static const TypeInfo piix3_pci_type_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_PIIX3_PCI_DEVICE,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_PCI_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(PIIX3State),<br>
+=C2=A0 =C2=A0 .abstract =3D true,<br>
+=C2=A0 =C2=A0 .class_init =3D pci_piix3_class_init,<br>
+=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { INTERFACE_CONVENTIONAL_PCI_<wbr>DEVICE },<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void piix3_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 k-&gt;config_write =3D piix3_write_config;<br>
+}<br>
+<br>
+static const TypeInfo piix3_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_DEVIC=
E,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_PCI_DEVICE=
,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D piix3_class_init,<br>
+};<br>
+<br>
+static void piix3_xen_class_init(<wbr>ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 k-&gt;config_write =3D piix3_write_config_xen;<br>
+};<br>
+<br>
+static const TypeInfo piix3_xen_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_XEN_D=
EVICE,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_PCI_DEVICE=
,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D piix3_xen_class_init,<br>
+};<br>
+<br>
+static void piix3_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;piix3_<wbr>pci_type_info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;piix3_<wbr>info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;piix3_<wbr>xen_info);<br>
+}<br>
+<br>
+type_init(piix3_register_<wbr>types)<br>
+<br>
+/*<br>
+ * Return the global irq number corresponding to a given device irq<br>
+ * pin. We could also use the bus number to have a more precise mapping.<b=
r>
+ */<br>
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)<br>
+{<br>
+=C2=A0 =C2=A0 int slot_addend;<br>
+=C2=A0 =C2=A0 slot_addend =3D (pci_dev-&gt;devfn &gt;&gt; 3) - 1;<br>
+=C2=A0 =C2=A0 return (pci_intx + slot_addend) &amp; 3;<br>
+}<br>
+<br>
+PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX3State *piix3;<br>
+=C2=A0 =C2=A0 PCIDevice *pci_dev;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Xen supports additional interrupt routes from the PC=
I devices to<br>
+=C2=A0 =C2=A0 =C2=A0* the IOAPIC: the four pins of each PCI device on the =
bus are also<br>
+=C2=A0 =C2=A0 =C2=A0* connected to the IOAPIC directly.<br>
+=C2=A0 =C2=A0 =C2=A0* These additional routes can be discovered through AC=
PI.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (xen_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_<wbr>multifuncti=
on(pci_bus, -1, true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_XEN_DEVICE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_p=
ci_slot_get_pirq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0piix3, XEN_PIIX_NUM_PIRQS);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_<wbr>multifuncti=
on(pci_bus, -1, true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_DEVICE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_=
get_pirq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0piix3, PIIX_NUM_PIRQS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_set_route_irq_fn(pci_<wbr>bus, piix3_r=
oute_intx_pin_to_irq);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 *isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>DEVICE(piix3), =
&quot;isa.0&quot;));<br>
+<br>
+=C2=A0 =C2=A0 return piix3;<br>
+}<br>
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig<br>
index 1edc1a31d4..397043b289 100644<br>
--- a/hw/pci-host/Kconfig<br>
+++ b/hw/pci-host/Kconfig<br>
@@ -32,7 +32,6 @@ config PCI_PIIX<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select PCI<br>
=C2=A0 =C2=A0 =C2=A0select PAM<br>
-=C2=A0 =C2=A0 select ISA_BUS<br>
<br>
=C2=A0config PCI_EXPRESS_Q35<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index 61f91ff561..79ecd58a2b 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -24,22 +24,15 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
-#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/i440fx.h&quot;<br>
=C2=A0#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
-#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;qemu/range.h&quot;<br>
-#include &quot;hw/xen/xen.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/pam.h&quot;<br>
-#include &quot;sysemu/reset.h&quot;<br>
-#include &quot;sysemu/runstate.h&quot;<br>
-#include &quot;hw/i386/ioapic.h&quot;<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
<br>
@@ -59,49 +52,9 @@ typedef struct I440FXState {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t short_root_bus;<br>
=C2=A0} I440FXState;<br>
<br>
-#define PIIX_NUM_PIC_IRQS=C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0 =C2=A0=
 /* i8259 * 2 */<br>
-#define PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4ULL=C2=A0 =C2=A0=
 /* PIRQ[A-D] */<br>
-#define XEN_PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 128ULL<br>
-<br>
-typedef struct PIIX3State {<br>
-=C2=A0 =C2=A0 PCIDevice dev;<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* bitmap to track pic levels.<br>
-=C2=A0 =C2=A0 =C2=A0* The pic level is the logical OR of all the PCI irqs =
mapped to it<br>
-=C2=A0 =C2=A0 =C2=A0* So one PIC level is tracked by PIIX_NUM_PIRQS bits.<=
br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* PIRQ is mapped to PIC pins, we track it by<br>
-=C2=A0 =C2=A0 =C2=A0* PIIX_NUM_PIRQS * PIIX_NUM_PIC_IRQS =3D 64 bits with<=
br>
-=C2=A0 =C2=A0 =C2=A0* pic_irq * PIIX_NUM_PIRQS + pirq<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-#if PIIX_NUM_PIC_IRQS * PIIX_NUM_PIRQS &gt; 64<br>
-#error &quot;unable to encode pic state in 64bit in pic_levels.&quot;<br>
-#endif<br>
-=C2=A0 =C2=A0 uint64_t pic_levels;<br>
-<br>
-=C2=A0 =C2=A0 qemu_irq *pic;<br>
-<br>
-=C2=A0 =C2=A0 /* This member isn&#39;t used. Just for save/load compatibil=
ity */<br>
-=C2=A0 =C2=A0 int32_t pci_irq_levels_vmstate[PIIX_<wbr>NUM_PIRQS];<br>
-<br>
-=C2=A0 =C2=A0 /* Reset Control Register contents */<br>
-=C2=A0 =C2=A0 uint8_t rcr;<br>
-<br>
-=C2=A0 =C2=A0 /* IO memory region for Reset Control Register (RCR_IOPORT) =
*/<br>
-=C2=A0 =C2=A0 MemoryRegion rcr_mem;<br>
-} PIIX3State;<br>
-<br>
-#define TYPE_PIIX3_PCI_DEVICE &quot;pci-piix3&quot;<br>
-#define PIIX3_PCI_DEVICE(obj) \<br>
-=C2=A0 =C2=A0 OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)<br>
-<br>
=C2=A0#define I440FX_PCI_DEVICE(obj) \<br>
=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEV=
ICE)<br>
<br>
-#define TYPE_PIIX3_DEVICE &quot;PIIX3&quot;<br>
-#define TYPE_PIIX3_XEN_DEVICE &quot;PIIX3-xen&quot;<br>
-<br>
=C2=A0struct PCII440FXState {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice parent_obj;<br>
@@ -128,22 +81,6 @@ struct PCII440FXState {<br>
=C2=A0 */<br>
=C2=A0#define I440FX_COREBOOT_RAM_SIZE 0x57<br>
<br>
-static void piix3_set_irq(void *opaque, int pirq, int level);<br>
-static PCIINTxRoute piix3_route_intx_pin_to_irq(<wbr>void *opaque, int pci=
_intx);<br>
-static void piix3_write_config_xen(<wbr>PCIDevice *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t address, uint32_t val, int l=
en);<br>
-<br>
-/*<br>
- * Return the global irq number corresponding to a given device irq<br>
- * pin. We could also use the bus number to have a more precise mapping.<b=
r>
- */<br>
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)<br>
-{<br>
-=C2=A0 =C2=A0 int slot_addend;<br>
-=C2=A0 =C2=A0 slot_addend =3D (pci_dev-&gt;devfn &gt;&gt; 3) - 1;<br>
-=C2=A0 =C2=A0 return (pci_intx + slot_addend) &amp; 3;<br>
-}<br>
-<br>
=C2=A0static void i440fx_update_memory_mappings(<wbr>PCII440FXState *d)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
@@ -333,36 +270,6 @@ static void i440fx_realize(PCIDevice *dev, Error **err=
p)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *piix3;<br>
-=C2=A0 =C2=A0 PCIDevice *pci_dev;<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* Xen supports additional interrupt routes from the PC=
I devices to<br>
-=C2=A0 =C2=A0 =C2=A0* the IOAPIC: the four pins of each PCI device on the =
bus are also<br>
-=C2=A0 =C2=A0 =C2=A0* connected to the IOAPIC directly.<br>
-=C2=A0 =C2=A0 =C2=A0* These additional routes can be discovered through AC=
PI.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (xen_enabled()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_<wbr>multifuncti=
on(pci_bus, -1, true,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_XEN_DEVICE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_p=
ci_slot_get_pirq,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0piix3, XEN_PIIX_NUM_PIRQS);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_<wbr>multifuncti=
on(pci_bus, -1, true,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_DEVICE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_=
get_pirq,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0piix3, PIIX_NUM_PIRQS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_set_route_irq_fn(pci_<wbr>bus, piix3_r=
oute_intx_pin_to_irq);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 *isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>DEVICE(piix3), =
&quot;isa.0&quot;));<br>
-<br>
-=C2=A0 =C2=A0 return piix3;<br>
-}<br>
-<br>
=C2=A0PCIBus *i440fx_init(const char *host_type, const char *pci_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCII440FXState **pi440fx_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int *piix3_devfn,<br>
@@ -455,312 +362,6 @@ PCIBus *find_i440fx(void)<br>
=C2=A0 =C2=A0 =C2=A0return s ? s-&gt;bus : NULL;<br>
=C2=A0}<br>
<br>
-/* PIIX3 PCI to ISA bridge */<br>
-static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)<br>
-{<br>
-=C2=A0 =C2=A0 qemu_set_irq(piix3-&gt;pic[pic_<wbr>irq],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!(piix3-&gt=
;pic_levels &amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((1=
ULL &lt;&lt; PIIX_NUM_PIRQS) - 1) &lt;&lt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(pic_irq * PIIX_NUM_PIRQS))));<br>
-}<br>
-<br>
-static void piix3_set_irq_level_internal(<wbr>PIIX3State *piix3, int pirq,=
 int level)<br>
-{<br>
-=C2=A0 =C2=A0 int pic_irq;<br>
-=C2=A0 =C2=A0 uint64_t mask;<br>
-<br>
-=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pirq];<br>
-=C2=A0 =C2=A0 if (pic_irq &gt;=3D PIIX_NUM_PIC_IRQS) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 mask =3D 1ULL &lt;&lt; ((pic_irq * PIIX_NUM_PIRQS) + pirq);<=
br>
-=C2=A0 =C2=A0 piix3-&gt;pic_levels &amp;=3D ~mask;<br>
-=C2=A0 =C2=A0 piix3-&gt;pic_levels |=3D mask * !!level;<br>
-}<br>
-<br>
-static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)<br=
>
-{<br>
-=C2=A0 =C2=A0 int pic_irq;<br>
-<br>
-=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pirq];<br>
-=C2=A0 =C2=A0 if (pic_irq &gt;=3D PIIX_NUM_PIC_IRQS) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 piix3_set_irq_level_internal(<wbr>piix3, pirq, level);<br>
-<br>
-=C2=A0 =C2=A0 piix3_set_irq_pic(piix3, pic_irq);<br>
-}<br>
-<br>
-static void piix3_set_irq(void *opaque, int pirq, int level)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
-=C2=A0 =C2=A0 piix3_set_irq_level(piix3, pirq, level);<br>
-}<br>
-<br>
-static PCIINTxRoute piix3_route_intx_pin_to_irq(<wbr>void *opaque, int pin=
)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
-=C2=A0 =C2=A0 int irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pin];<br>
-=C2=A0 =C2=A0 PCIINTxRoute route;<br>
-<br>
-=C2=A0 =C2=A0 if (irq &lt; PIIX_NUM_PIC_IRQS) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.mode =3D PCI_INTX_ENABLED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.irq =3D irq;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.mode =3D PCI_INTX_DISABLED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 route.irq =3D -1;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return route;<br>
-}<br>
-<br>
-/* irq routing is changed. so rebuild bitmap */<br>
-static void piix3_update_irq_levels(<wbr>PIIX3State *piix3)<br>
-{<br>
-=C2=A0 =C2=A0 PCIBus *bus =3D pci_get_bus(&amp;piix3-&gt;dev);<br>
-=C2=A0 =C2=A0 int pirq;<br>
-<br>
-=C2=A0 =C2=A0 piix3-&gt;pic_levels =3D 0;<br>
-=C2=A0 =C2=A0 for (pirq =3D 0; pirq &lt; PIIX_NUM_PIRQS; pirq++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_set_irq_level(piix3, pirq, pci_bus_get_i=
rq_level(bus, pirq));<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static void piix3_write_config(PCIDevice *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t address, uint32_t val, int l=
en)<br>
-{<br>
-=C2=A0 =C2=A0 pci_default_write_config(dev, address, val, len);<br>
-=C2=A0 =C2=A0 if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int pic_irq;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_fire_intx_routing_<wbr>notifier(pci_ge=
t_bus(&amp;piix3-&gt;<wbr>dev));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_update_irq_levels(piix3)<wbr>;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (pic_irq =3D 0; pic_irq &lt; PIIX_NUM_PIC_=
IRQS; pic_irq++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_set_irq_pic(piix3, pic_irq=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static void piix3_write_config_xen(<wbr>PCIDevice *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t address, uint32_t val, int l=
en)<br>
-{<br>
-=C2=A0 =C2=A0 xen_piix_pci_write_config_<wbr>client(address, val, len);<br=
>
-=C2=A0 =C2=A0 piix3_write_config(dev, address, val, len);<br>
-}<br>
-<br>
-static void piix3_reset(void *opaque)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *d =3D opaque;<br>
-=C2=A0 =C2=A0 uint8_t *pci_conf =3D d-&gt;dev.config;<br>
-<br>
-=C2=A0 =C2=A0 pci_conf[0x04] =3D 0x07; /* master, memory and I/O */<br>
-=C2=A0 =C2=A0 pci_conf[0x05] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0x06] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0x07] =3D 0x02; /* PCI_status_devsel_medium */<br>
-=C2=A0 =C2=A0 pci_conf[0x4c] =3D 0x4d;<br>
-=C2=A0 =C2=A0 pci_conf[0x4e] =3D 0x03;<br>
-=C2=A0 =C2=A0 pci_conf[0x4f] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0x60] =3D 0x80;<br>
-=C2=A0 =C2=A0 pci_conf[0x61] =3D 0x80;<br>
-=C2=A0 =C2=A0 pci_conf[0x62] =3D 0x80;<br>
-=C2=A0 =C2=A0 pci_conf[0x63] =3D 0x80;<br>
-=C2=A0 =C2=A0 pci_conf[0x69] =3D 0x02;<br>
-=C2=A0 =C2=A0 pci_conf[0x70] =3D 0x80;<br>
-=C2=A0 =C2=A0 pci_conf[0x76] =3D 0x0c;<br>
-=C2=A0 =C2=A0 pci_conf[0x77] =3D 0x0c;<br>
-=C2=A0 =C2=A0 pci_conf[0x78] =3D 0x02;<br>
-=C2=A0 =C2=A0 pci_conf[0x79] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0x80] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0x82] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa0] =3D 0x08;<br>
-=C2=A0 =C2=A0 pci_conf[0xa2] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa3] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa4] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa5] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa6] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa7] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xa8] =3D 0x0f;<br>
-=C2=A0 =C2=A0 pci_conf[0xaa] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xab] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xac] =3D 0x00;<br>
-=C2=A0 =C2=A0 pci_conf[0xae] =3D 0x00;<br>
-<br>
-=C2=A0 =C2=A0 d-&gt;pic_levels =3D 0;<br>
-=C2=A0 =C2=A0 d-&gt;rcr =3D 0;<br>
-}<br>
-<br>
-static int piix3_post_load(void *opaque, int version_id)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
-=C2=A0 =C2=A0 int pirq;<br>
-<br>
-=C2=A0 =C2=A0 /* Because the i8259 has not been deserialized yet, qemu_irq=
_raise<br>
-=C2=A0 =C2=A0 =C2=A0* might bring the system to a different state than the=
 saved one;<br>
-=C2=A0 =C2=A0 =C2=A0* for example, the interrupt could be masked but the i=
8259 would<br>
-=C2=A0 =C2=A0 =C2=A0* not know that yet and would trigger an interrupt in =
the CPU.<br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* Here, we update irq levels without raising the inter=
rupt.<br>
-=C2=A0 =C2=A0 =C2=A0* Interrupt state will be deserialized separately thro=
ugh the i8259.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 piix3-&gt;pic_levels =3D 0;<br>
-=C2=A0 =C2=A0 for (pirq =3D 0; pirq &lt; PIIX_NUM_PIRQS; pirq++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_set_irq_level_internal(<wbr>piix3, pirq,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_get_irq_level(pci_get_<w=
br>bus(&amp;piix3-&gt;dev), pirq));<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-<br>
-static int piix3_pre_save(void *opaque)<br>
-{<br>
-=C2=A0 =C2=A0 int i;<br>
-=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
-<br>
-=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(piix3-&gt;pci_irq_<wbr>level=
s_vmstate); i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3-&gt;pci_irq_levels_vmstate[<wbr>i] =3D<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_get_irq_level(pci_get_<w=
br>bus(&amp;piix3-&gt;dev), i);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-<br>
-static bool piix3_rcr_needed(void *opaque)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *piix3 =3D opaque;<br>
-<br>
-=C2=A0 =C2=A0 return (piix3-&gt;rcr !=3D 0);<br>
-}<br>
-<br>
-static const VMStateDescription vmstate_piix3_rcr =3D {<br>
-=C2=A0 =C2=A0 .name =3D &quot;PIIX3/rcr&quot;,<br>
-=C2=A0 =C2=A0 .version_id =3D 1,<br>
-=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
-=C2=A0 =C2=A0 .needed =3D piix3_rcr_needed,<br>
-=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(rcr, PIIX3State),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
-=C2=A0 =C2=A0 }<br>
-};<br>
-<br>
-static const VMStateDescription vmstate_piix3 =3D {<br>
-=C2=A0 =C2=A0 .name =3D &quot;PIIX3&quot;,<br>
-=C2=A0 =C2=A0 .version_id =3D 3,<br>
-=C2=A0 =C2=A0 .minimum_version_id =3D 2,<br>
-=C2=A0 =C2=A0 .post_load =3D piix3_post_load,<br>
-=C2=A0 =C2=A0 .pre_save =3D piix3_pre_save,<br>
-=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_PCI_DEVICE(dev, PIIX3State),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT32_ARRAY_V(pci_irq_<wbr>levels_vmst=
ate, PIIX3State,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX_NUM_PIRQS, 3),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
-=C2=A0 =C2=A0 },<br>
-=C2=A0 =C2=A0 .subsections =3D (const VMStateDescription*[]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vmstate_piix3_rcr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>
-=C2=A0 =C2=A0 }<br>
-};<br>
-<br>
-<br>
-static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned le=
n)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *d =3D opaque;<br>
-<br>
-=C2=A0 =C2=A0 if (val &amp; 4) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(<wbr>SHUTDOWN_CAUSE_=
GUEST_RESET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 d-&gt;rcr =3D val &amp; 2; /* keep System Reset type only */=
<br>
-}<br>
-<br>
-static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *d =3D opaque;<br>
-<br>
-=C2=A0 =C2=A0 return d-&gt;rcr;<br>
-}<br>
-<br>
-static const MemoryRegionOps rcr_ops =3D {<br>
-=C2=A0 =C2=A0 .read =3D rcr_read,<br>
-=C2=A0 =C2=A0 .write =3D rcr_write,<br>
-=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN<br>
-};<br>
-<br>
-static void piix3_realize(PCIDevice *dev, Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);<br>
-<br>
-=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(d), get_system_memory(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci_address_space_io(dev), errp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 memory_region_init_io(&amp;d-&gt;rcr_<wbr>mem, OBJECT(dev), =
&amp;rcr_ops, d,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;piix3-reset-control&quot;, 1);<br>
-=C2=A0 =C2=A0 memory_region_add_subregion_<wbr>overlap(pci_address_space_i=
o(<wbr>dev), RCR_IOPORT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;d-&=
gt;rcr_mem, 1);<br>
-<br>
-=C2=A0 =C2=A0 qemu_register_reset(piix3_<wbr>reset, d);<br>
-}<br>
-<br>
-static void pci_piix3_class_init(<wbr>ObjectClass *klass, void *data)<br>
-{<br>
-=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
-=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
-<br>
-=C2=A0 =C2=A0 dc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;ISA bridge&=
quot;;<br>
-=C2=A0 =C2=A0 dc-&gt;vmsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;vmstate_piix=
3;<br>
-=C2=A0 =C2=A0 dc-&gt;hotpluggable=C2=A0 =C2=A0=3D false;<br>
-=C2=A0 =C2=A0 k-&gt;realize=C2=A0 =C2=A0 =C2=A0 =3D piix3_realize;<br>
-=C2=A0 =C2=A0 k-&gt;vendor_id=C2=A0 =C2=A0 =3D PCI_VENDOR_ID_INTEL;<br>
-=C2=A0 =C2=A0 /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */<br>
-=C2=A0 =C2=A0 k-&gt;device_id=C2=A0 =C2=A0 =3D PCI_DEVICE_ID_INTEL_82371SB=
_0;<br>
-=C2=A0 =C2=A0 k-&gt;class_id=C2=A0 =C2=A0 =C2=A0=3D PCI_CLASS_BRIDGE_ISA;<=
br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* Reason: part of PIIX3 southbridge, needs to be wired=
 up by<br>
-=C2=A0 =C2=A0 =C2=A0* pc_piix.c&#39;s pc_init1()<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 dc-&gt;user_creatable =3D false;<br>
-}<br>
-<br>
-static const TypeInfo piix3_pci_type_info =3D {<br>
-=C2=A0 =C2=A0 .name =3D TYPE_PIIX3_PCI_DEVICE,<br>
-=C2=A0 =C2=A0 .parent =3D TYPE_PCI_DEVICE,<br>
-=C2=A0 =C2=A0 .instance_size =3D sizeof(PIIX3State),<br>
-=C2=A0 =C2=A0 .abstract =3D true,<br>
-=C2=A0 =C2=A0 .class_init =3D pci_piix3_class_init,<br>
-=C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { INTERFACE_CONVENTIONAL_PCI_<wbr>DEVICE },<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
-=C2=A0 =C2=A0 },<br>
-};<br>
-<br>
-static void piix3_class_init(ObjectClass *klass, void *data)<br>
-{<br>
-=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
-<br>
-=C2=A0 =C2=A0 k-&gt;config_write =3D piix3_write_config;<br>
-}<br>
-<br>
-static const TypeInfo piix3_info =3D {<br>
-=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_DEVIC=
E,<br>
-=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_PCI_DEVICE=
,<br>
-=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D piix3_class_init,<br>
-};<br>
-<br>
-static void piix3_xen_class_init(<wbr>ObjectClass *klass, void *data)<br>
-{<br>
-=C2=A0 =C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
-<br>
-=C2=A0 =C2=A0 k-&gt;config_write =3D piix3_write_config_xen;<br>
-};<br>
-<br>
-static const TypeInfo piix3_xen_info =3D {<br>
-=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_XEN_D=
EVICE,<br>
-=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX3_PCI_DEVICE=
,<br>
-=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D piix3_xen_class_init,<br>
-};<br>
-<br>
=C2=A0static void i440fx_class_init(ObjectClass *klass, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
@@ -922,9 +523,6 @@ static void i440fx_register_types(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;i440fx_<wbr>info);<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;igd_<wbr>passthrough_i440fx_i=
nfo);<br>
-=C2=A0 =C2=A0 type_register_static(&amp;piix3_<wbr>pci_type_info);<br>
-=C2=A0 =C2=A0 type_register_static(&amp;piix3_<wbr>info);<br>
-=C2=A0 =C2=A0 type_register_static(&amp;piix3_<wbr>xen_info);<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;i440fx_<wbr>pcihost_info);<br=
>
=C2=A0}<br>
<br>
diff --git a/include/hw/southbridge/piix.<wbr>h b/include/hw/southbridge/pi=
ix.<wbr>h<br>
index 9c92c37a4d..324a3a99fc 100644<br>
--- a/include/hw/southbridge/piix.<wbr>h<br>
+++ b/include/hw/southbridge/piix.<wbr>h<br>
@@ -12,6 +12,8 @@<br>
=C2=A0#ifndef HW_SOUTHBRIDGE_PIIX_H<br>
=C2=A0#define HW_SOUTHBRIDGE_PIIX_H<br>
<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+<br>
=C2=A0#define TYPE_PIIX4_PM &quot;PIIX4_PM&quot;<br>
<br>
=C2=A0I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,<b=
r>
@@ -30,8 +32,42 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t s=
mb_io_base,<br>
=C2=A0 */<br>
=C2=A0#define RCR_IOPORT 0xcf9<br>
<br>
+#define PIIX_NUM_PIC_IRQS=C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0 =C2=A0=
 /* i8259 * 2 */<br>
+#define PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4ULL=C2=A0 =C2=A0=
 /* PIRQ[A-D] */<br>
+<br>
+typedef struct PIIXState {<br>
+=C2=A0 =C2=A0 PCIDevice dev;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* bitmap to track pic levels.<br>
+=C2=A0 =C2=A0 =C2=A0* The pic level is the logical OR of all the PCI irqs =
mapped to it<br>
+=C2=A0 =C2=A0 =C2=A0* So one PIC level is tracked by PIIX_NUM_PIRQS bits.<=
br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* PIRQ is mapped to PIC pins, we track it by<br>
+=C2=A0 =C2=A0 =C2=A0* PIIX_NUM_PIRQS * PIIX_NUM_PIC_IRQS =3D 64 bits with<=
br>
+=C2=A0 =C2=A0 =C2=A0* pic_irq * PIIX_NUM_PIRQS + pirq<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+#if PIIX_NUM_PIC_IRQS * PIIX_NUM_PIRQS &gt; 64<br>
+#error &quot;unable to encode pic state in 64bit in pic_levels.&quot;<br>
+#endif<br>
+=C2=A0 =C2=A0 uint64_t pic_levels;<br>
+<br>
+=C2=A0 =C2=A0 qemu_irq *pic;<br>
+<br>
+=C2=A0 =C2=A0 /* This member isn&#39;t used. Just for save/load compatibil=
ity */<br>
+=C2=A0 =C2=A0 int32_t pci_irq_levels_vmstate[PIIX_<wbr>NUM_PIRQS];<br>
+<br>
+=C2=A0 =C2=A0 /* Reset Control Register contents */<br>
+=C2=A0 =C2=A0 uint8_t rcr;<br>
+<br>
+=C2=A0 =C2=A0 /* IO memory region for Reset Control Register (RCR_IOPORT) =
*/<br>
+=C2=A0 =C2=A0 MemoryRegion rcr_mem;<br>
+} PIIX3State;<br>
+<br>
=C2=A0extern PCIDevice *piix4_dev;<br>
<br>
+PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);<br>
+<br>
=C2=A0DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0I2CBus **smbus, size_t ide_buses);<br>
=C2=A0<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000a7a92d05952c0182--


--===============3929220089666017444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3929220089666017444==--

