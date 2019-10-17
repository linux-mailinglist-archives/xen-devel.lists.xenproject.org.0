Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4CDB057
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL70t-00067x-2E; Thu, 17 Oct 2019 14:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL70r-00067n-Dt
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:44:25 +0000
X-Inumbo-ID: 9c429f36-f0ec-11e9-a531-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c429f36-f0ec-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 14:44:23 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id o205so2331906oib.12
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=s8DKM15KvH0uYu+UhLBeNQsM0FqCD4kkvRCVTFD+zOo=;
 b=DfeywFOokKjkjOemcxOgsue88Gd1yBzd833lqriFJBwhP1LGNWX5WwEojEwRDcifim
 Kau5HoQ7FxCKP+G+HkNxf63qxoYB5T3HkOEQ68RNxTHb4aBeuJPTqcCInOpb9w/XdJZ4
 4DMVUYD2IKnkDqrOiFs4+XPK1cAWuxMFqmUCPcetJnNPyLIGLsDF08eBIl4XZ325Tbb0
 v9AYnTHHn5V3eKoyLaqyaLjO5E+7v7dg3GuTbN2kQbYCAQsgdUSeX40temmiki75OHMx
 Gf+lY4xrNa+mzelA5nwAwzNqEVVdt3xRMjFUmX9voyRg6kbXoCVLFwenWAY6gALdu3QD
 xJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=s8DKM15KvH0uYu+UhLBeNQsM0FqCD4kkvRCVTFD+zOo=;
 b=m1KDKRJBcwS8Aot+Z9SLHIEO7rHO9EgmTpuimc8+3sibemzjwki6AiRVihc6VerZYJ
 mrYNsw5TpRB+hxmP+0kSGqAE90w9IGnGKyD3GP/oJryZ3dQoIqTb7MFBqEMG3qIwmd0V
 KLbK3Om+mP/2uPAJvaHNj6fVBuKKHQRnXrHSMHVzVHKoMfNv8+pCGGTNlSC784c9kIgc
 8lcdVV4aVXn4sVz82N1hppATUaRkU2uWQfLJiexiNtc9WNNm+SjyJsIwy6GiRKFJxaJ+
 lRsLX6PcgBW3GVHR5RMbwhYSkGk4rLM17uYSqH4mX2RJjOK4S+OkY4a42hvw3VhYcQcp
 wxSw==
X-Gm-Message-State: APjAAAW9G/H2fi6qSdQq6tVAdh20EmAnLjCELikUSSZ+LqTwy2Xh0FsK
 Rw1TDk1FvO0yoPCxMEjjuM2KwPOWKdwKHucfRs0=
X-Google-Smtp-Source: APXvYqz4owix0wqODF/cfit6EocMHWUJl3Im7VLAMn06AaOESheCw//sMBDgRlSpxEz0KL6tmQWkiM5MIdNfzz5YK7k=
X-Received: by 2002:aca:4e56:: with SMTP id c83mr3560178oib.53.1571323463334; 
 Thu, 17 Oct 2019 07:44:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:44:21
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-17-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-17-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:44:21 +0200
Message-ID: <CAL1e-=jhF+hY9HFunmcmCBu4=QmEN+rDt6V6OhS5fd8PkN9q9Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 16/32] piix4: add a mc146818rtc controller
 as specified in datasheet
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
Content-Type: multipart/mixed; boundary="===============5682033290822237064=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5682033290822237064==
Content-Type: multipart/alternative; boundary="000000000000dc003f05951c4079"

--000000000000dc003f05951c4079
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Remove mc146818rtc instanciated in malta board, to not have it twice.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-13-hpoussin@reactos.org>
> [PMD: rebased, set RTC base_year to 2000]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS                   |  3 ++-
>  hw/acpi/piix4.c               |  2 +-
>  hw/i386/acpi-build.c          |  3 +--
>  hw/i386/pc_piix.c             |  1 +
>  hw/isa/piix4.c                | 22 ++++++++++++++++++++++
>  hw/mips/mips_malta.c          |  4 +---
>  include/hw/acpi/piix4.h       |  6 ------
>  include/hw/i386/pc.h          |  6 ------
>  include/hw/southbridge/piix.h | 20 ++++++++++++++++++++
>  9 files changed, 48 insertions(+), 19 deletions(-)
>  delete mode 100644 include/hw/acpi/piix4.h
>  create mode 100644 include/hw/southbridge/piix.h
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9f625fc2e..556f58bd8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1235,7 +1235,7 @@ F: hw/i2c/smbus_ich9.c
>  F: hw/acpi/piix4.c
>  F: hw/acpi/ich9.c
>  F: include/hw/acpi/ich9.h
> -F: include/hw/acpi/piix4.h
> +F: include/hw/southbridge/piix.h
>  F: hw/misc/sga.c
>  F: hw/isa/apm.c
>  F: include/hw/isa/apm.h
> @@ -1720,6 +1720,7 @@ M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>  M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  S: Maintained
>  F: hw/isa/piix4.c
> +F: include/hw/southbridge/piix.h
>
>  Firmware configuration (fw_cfg)
>  M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 1d29d438c7..27270621ab 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -21,6 +21,7 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/i386/pc.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/irq.h"
>  #include "hw/isa/apm.h"
>  #include "hw/i2c/pm_smbus.h"
> @@ -33,7 +34,6 @@
>  #include "qapi/error.h"
>  #include "qemu/range.h"
>  #include "exec/address-spaces.h"
> -#include "hw/acpi/piix4.h"
>  #include "hw/acpi/pcihp.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/cpu.h"
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4e0f9f425a..aa6fe61191 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -34,7 +34,6 @@
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/cpu.h"
> -#include "hw/acpi/piix4.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/isa/isa.h"
> @@ -52,7 +51,7 @@
>  #include "sysemu/reset.h"
>
>  /* Supported chipsets: */
> -#include "hw/acpi/piix4.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/acpi/pcihp.h"
>  #include "hw/i386/ich9.h"
>  #include "hw/pci/pci_bus.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6824b72124..431965d921 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -29,6 +29,7 @@
>  #include "hw/loader.h"
>  #include "hw/i386/pc.h"
>  #include "hw/i386/apic.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/firmware/smbios.h"
>  #include "hw/pci/pci.h"
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 0b0a0ecab1..9f554747af 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -24,6 +24,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/irq.h"
>  #include "hw/i386/pc.h"
>  #include "hw/pci/pci.h"
> @@ -31,6 +32,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/dma/i8257.h"
>  #include "hw/timer/i8254.h"
> +#include "hw/timer/mc146818rtc.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -42,6 +44,7 @@ typedef struct PIIX4State {
>      qemu_irq cpu_intr;
>      qemu_irq *isa;
>
> +    RTCState rtc;
>      /* Reset Control Register */
>      MemoryRegion rcr_mem;
>      uint8_t rcr;
> @@ -144,6 +147,7 @@ static void piix4_realize(PCIDevice *pci_dev, Error
> **errp)
>      PIIX4State *s =3D DO_UPCAST(PIIX4State, dev, pci_dev);
>      ISABus *isa_bus;
>      qemu_irq *i8259_out_irq;
> +    Error *err =3D NULL;
>
>      isa_bus =3D isa_bus_new(dev, pci_address_space(pci_dev),
>                            pci_address_space_io(pci_dev), errp);
> @@ -172,9 +176,26 @@ static void piix4_realize(PCIDevice *pci_dev, Error
> **errp)
>      /* DMA */
>      i8257_dma_init(isa_bus, 0);
>
> +    /* RTC */
> +    qdev_set_parent_bus(DEVICE(&s->rtc), BUS(isa_bus));
> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
> +    object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
> +
>      piix4_dev =3D pci_dev;
>  }
>
> +static void piix4_init(Object *obj)
> +{
> +    PIIX4State *s =3D PIIX4_PCI_DEVICE(obj);
> +
> +    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
> +}
> +
>  static void piix4_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -199,6 +220,7 @@ static const TypeInfo piix4_info =3D {
>      .name          =3D TYPE_PIIX4_PCI_DEVICE,
>      .parent        =3D TYPE_PCI_DEVICE,
>      .instance_size =3D sizeof(PIIX4State),
> +    .instance_init =3D piix4_init,
>      .class_init    =3D piix4_class_init,
>      .interfaces =3D (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 16d7a0e785..528c34a1c3 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -26,7 +26,7 @@
>  #include "qemu/units.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> -#include "hw/i386/pc.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/isa/superio.h"
>  #include "hw/char/serial.h"
>  #include "net/net.h"
> @@ -44,7 +44,6 @@
>  #include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> -#include "hw/timer/mc146818rtc.h"
>  #include "exec/address-spaces.h"
>  #include "hw/sysbus.h"             /* SysBusDevice */
>  #include "qemu/host-utils.h"
> @@ -1425,7 +1424,6 @@ void mips_malta_init(MachineState *machine)
>      pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
>      smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
>                            isa_get_irq(NULL, 9), NULL, 0, NULL);
> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>
>      /* generate SPD EEPROM data */
>      generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
> diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
> deleted file mode 100644
> index 028bb53e3d..0000000000
> --- a/include/hw/acpi/piix4.h
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#ifndef HW_ACPI_PIIX4_H
> -#define HW_ACPI_PIIX4_H
> -
> -#define TYPE_PIIX4_PM "PIIX4_PM"
> -
> -#endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index a95eab0d8a..c671c9fd2a 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -244,12 +244,6 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
>
>  #define PORT92_A20_LINE "a20"
>
> -/* acpi_piix.c */
> -
> -I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
> -                      qemu_irq sci_irq, qemu_irq smi_irq,
> -                      int smm_enabled, DeviceState **piix4_pm);
> -
>  /* hpet.c */
>  extern int no_hpet;
>
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
> new file mode 100644
> index 0000000000..b8ce26fec4
> --- /dev/null
> +++ b/include/hw/southbridge/piix.h
> @@ -0,0 +1,20 @@
> +/*
> + * QEMU PIIX South Bridge Emulation
> + *
> + * Copyright (c) 2006 Fabrice Bellard
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef HW_SOUTHBRIDGE_PIIX_H
> +#define HW_SOUTHBRIDGE_PIIX_H
> +
> +#define TYPE_PIIX4_PM "PIIX4_PM"
> +
> +I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
> +                      qemu_irq sci_irq, qemu_irq smi_irq,
> +                      int smm_enabled, DeviceState **piix4_pm);
> +
> +#endif
> --
> 2.21.0
>
>
>

--000000000000dc003f05951c4079
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
Remove mc146818rtc instanciated in malta board, to not have it twice.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-13-hpoussin@reactos.=
org">20171216090228.28505-13-hpoussin@reactos.org</a>&gt;<br>
[PMD: rebased, set RTC base_year to 2000]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<=
br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 22 ++++++++++++++++++++++<br>
=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---=
<br>
=C2=A0include/hw/acpi/piix4.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ------<br=
>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ----=
--<br>
=C2=A0include/hw/southbridge/piix.h | 20 ++++++++++++++++++++<br>
=C2=A09 files changed, 48 insertions(+), 19 deletions(-)<br>
=C2=A0delete mode 100644 include/hw/acpi/piix4.h<br>
=C2=A0create mode 100644 include/hw/southbridge/piix.h<br>
<br></blockquote><div><br></div><div><div id=3D"cvcmsg_16dbfeb33c93ed97" cl=
ass=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0p=
x;margin-bottom:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_1=
6dbfeb33c93ed97"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div c=
lass=3D"Ni"><div class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: A=
leksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"=
_blank">amarkovic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div><=
/div><div style=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" ta=
bindex=3D"0"><div class=3D"V j hf"></div></div></div><div style=3D"clear:bo=
th"></div></div></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=
=3D"yh" style=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16d=
bfecd588da1f7"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcrepl=
y_16dbfecd588da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=
=3D"V j td"></div></div></div></div></div></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index c9f625fc2e..556f58bd8c 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1235,7 +1235,7 @@ F: hw/i2c/smbus_ich9.c<br>
=C2=A0F: hw/acpi/piix4.c<br>
=C2=A0F: hw/acpi/ich9.c<br>
=C2=A0F: include/hw/acpi/ich9.h<br>
-F: include/hw/acpi/piix4.h<br>
+F: include/hw/southbridge/piix.h<br>
=C2=A0F: hw/misc/sga.c<br>
=C2=A0F: hw/isa/apm.c<br>
=C2=A0F: include/hw/isa/apm.h<br>
@@ -1720,6 +1720,7 @@ M: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpouss=
in@reactos.org">hpoussin@reactos.org</a>&gt;<br>
=C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org"=
>f4bug@amsat.org</a>&gt;<br>
=C2=A0S: Maintained<br>
=C2=A0F: hw/isa/piix4.c<br>
+F: include/hw/southbridge/piix.h<br>
<br>
=C2=A0Firmware configuration (fw_cfg)<br>
=C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.co=
m">philmd@redhat.com</a>&gt;<br>
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c<br>
index 1d29d438c7..27270621ab 100644<br>
--- a/hw/acpi/piix4.c<br>
+++ b/hw/acpi/piix4.c<br>
@@ -21,6 +21,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/isa/apm.h&quot;<br>
=C2=A0#include &quot;hw/i2c/pm_smbus.h&quot;<br>
@@ -33,7 +34,6 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/range.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
-#include &quot;hw/acpi/piix4.h&quot;<br>
=C2=A0#include &quot;hw/acpi/pcihp.h&quot;<br>
=C2=A0#include &quot;hw/acpi/cpu_hotplug.h&quot;<br>
=C2=A0#include &quot;hw/acpi/cpu.h&quot;<br>
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
index 4e0f9f425a..aa6fe61191 100644<br>
--- a/hw/i386/acpi-build.c<br>
+++ b/hw/i386/acpi-build.c<br>
@@ -34,7 +34,6 @@<br>
=C2=A0#include &quot;hw/acpi/acpi-defs.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi.h&quot;<br>
=C2=A0#include &quot;hw/acpi/cpu.h&quot;<br>
-#include &quot;hw/acpi/piix4.h&quot;<br>
=C2=A0#include &quot;hw/nvram/fw_cfg.h&quot;<br>
=C2=A0#include &quot;hw/acpi/bios-linker-loader.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
@@ -52,7 +51,7 @@<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
<br>
=C2=A0/* Supported chipsets: */<br>
-#include &quot;hw/acpi/piix4.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/acpi/pcihp.h&quot;<br>
=C2=A0#include &quot;hw/i386/ich9.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_bus.h&quot;<br>
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
index 6824b72124..431965d921 100644<br>
--- a/hw/i386/pc_piix.c<br>
+++ b/hw/i386/pc_piix.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/display/ramfb.h&quot;<br>
=C2=A0#include &quot;hw/firmware/smbios.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 0b0a0ecab1..9f554747af 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -24,6 +24,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
@@ -31,6 +32,7 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/dma/i8257.h&quot;<br>
=C2=A0#include &quot;hw/timer/i8254.h&quot;<br>
+#include &quot;hw/timer/mc146818rtc.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
@@ -42,6 +44,7 @@ typedef struct PIIX4State {<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq cpu_intr;<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq *isa;<br>
<br>
+=C2=A0 =C2=A0 RTCState rtc;<br>
=C2=A0 =C2=A0 =C2=A0/* Reset Control Register */<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion rcr_mem;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t rcr;<br>
@@ -144,6 +147,7 @@ static void piix4_realize(PCIDevice *pci_dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0PIIX4State *s =3D DO_UPCAST(PIIX4State, dev, pci_dev);<=
br>
=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq *i8259_out_irq;<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0isa_bus =3D isa_bus_new(dev, pci_address_space(pci_dev)=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0pci_address_space_io(pci_dev), errp);<br>
@@ -172,9 +176,26 @@ static void piix4_realize(PCIDevice *pci_dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0/* DMA */<br>
=C2=A0 =C2=A0 =C2=A0i8257_dma_init(isa_bus, 0);<br>
<br>
+=C2=A0 =C2=A0 /* RTC */<br>
+=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;rtc), BUS(isa_bus=
));<br>
+=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-<wbr>&gt;rtc), &quot;base_=
year&quot;, 2000);<br>
+=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(&amp;s-&gt;rtc), true, =
&quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 isa_init_irq(ISA_DEVICE(&amp;s-&gt;<wbr>rtc), &amp;s-&gt;rtc=
.irq, RTC_ISA_IRQ);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D pci_dev;<br>
=C2=A0}<br>
<br>
+static void piix4_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D PIIX4_PCI_DEVICE(obj);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;rtc, sizeof(s-&gt;rtc), TYPE_MC=
146818_RTC);<br>
+}<br>
+<br>
=C2=A0static void piix4_class_init(ObjectClass *klass, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
@@ -199,6 +220,7 @@ static const TypeInfo piix4_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PIIX4_=
PCI_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PCI_DEVICE,=
<br>
=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(PIIX4State),<br>
+=C2=A0 =C2=A0 .instance_init =3D piix4_init,<br>
=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D piix4_class_init,<br>
=C2=A0 =C2=A0 =C2=A0.interfaces =3D (InterfaceInfo[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ INTERFACE_CONVENTIONAL_PCI_<wbr>DEVICE =
},<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 16d7a0e785..528c34a1c3 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -26,7 +26,7 @@<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
-#include &quot;hw/i386/pc.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/isa/superio.h&quot;<br>
=C2=A0#include &quot;hw/char/serial.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
@@ -44,7 +44,6 @@<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
-#include &quot;hw/timer/mc146818rtc.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* SysBusDevice */<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
@@ -1425,7 +1424,6 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, piix4_devfn + 2, &quot;piix4=
-usb-uhci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x110=
0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0isa_get_irq(NULL, 9), NULL, 0, NULL);<br>
-=C2=A0 =C2=A0 mc146818_rtc_init(isa_bus, 2000, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* generate SPD EEPROM data */<br>
=C2=A0 =C2=A0 =C2=A0generate_eeprom_spd(&amp;smbus_<wbr>eeprom_buf[0 * 256]=
, ram_size);<br>
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h<br>
deleted file mode 100644<br>
index 028bb53e3d..0000000000<br>
--- a/include/hw/acpi/piix4.h<br>
+++ /dev/null<br>
@@ -1,6 +0,0 @@<br>
-#ifndef HW_ACPI_PIIX4_H<br>
-#define HW_ACPI_PIIX4_H<br>
-<br>
-#define TYPE_PIIX4_PM &quot;PIIX4_PM&quot;<br>
-<br>
-#endif<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index a95eab0d8a..c671c9fd2a 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -244,12 +244,6 @@ int cmos_get_fd_drive_type(<wbr>FloppyDriveType fd0);<=
br>
<br>
=C2=A0#define PORT92_A20_LINE &quot;a20&quot;<br>
<br>
-/* acpi_piix.c */<br>
-<br>
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 qemu_irq sci_irq, qemu_irq smi_irq,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int smm_enabled, DeviceState **piix4_pm);<br>
-<br>
=C2=A0/* hpet.c */<br>
=C2=A0extern int no_hpet;<br>
<br>
diff --git a/include/hw/southbridge/piix.<wbr>h b/include/hw/southbridge/pi=
ix.<wbr>h<br>
new file mode 100644<br>
index 0000000000..b8ce26fec4<br>
--- /dev/null<br>
+++ b/include/hw/southbridge/piix.<wbr>h<br>
@@ -0,0 +1,20 @@<br>
+/*<br>
+ * QEMU PIIX South Bridge Emulation<br>
+ *<br>
+ * Copyright (c) 2006 Fabrice Bellard<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef HW_SOUTHBRIDGE_PIIX_H<br>
+#define HW_SOUTHBRIDGE_PIIX_H<br>
+<br>
+#define TYPE_PIIX4_PM &quot;PIIX4_PM&quot;<br>
+<br>
+I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 qemu_irq sci_irq, qemu_irq smi_irq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int smm_enabled, DeviceState **piix4_pm);<br>
+<br>
+#endif<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000dc003f05951c4079--


--===============5682033290822237064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5682033290822237064==--

