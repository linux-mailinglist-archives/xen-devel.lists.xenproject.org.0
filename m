Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DFBDF0C1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:04:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZAd-0002lF-6a; Mon, 21 Oct 2019 15:00:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMZAb-0002lA-6m
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:00:29 +0000
X-Inumbo-ID: 8438bc20-f413-11e9-8aca-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8438bc20-f413-11e9-8aca-bc764e2007e4;
 Mon, 21 Oct 2019 15:00:27 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k20so11301491oih.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTaILJ2pR9aI9rtdTSGg7t8dBKeJBocGahr2v6B2Q3M=;
 b=AeIwc5OfC47zTOxysWw30Uo6jkkAK9NrciFghKkVpzfhkK8+RChTNM6ppY9MKXPszL
 0Ob+toRlz8Ka3c8kc6g3ZkGXRdPbyNCXUCI9zJRA2A9PL4QPx9Nd2Y0IxsL0K3bySFVA
 Os91hkU1zK5khClXmMg6Qc8SIvqwpwSizW5OoQJ7swHf/usDXNsE1gWFPaIK1nrrVb1Q
 U88QxHDsBOtV+YpmnpM58qeevLcMqJCKKvSzH5+Jvynl7o68oPOLeNiwC23cKegWZkVM
 XGoxE+LEt94DGhz2mBiT/zlNhFnh2Uyj2JZJb3sO/6qqv9qSqmcsxb2cYWCWzjTCvXZQ
 SsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTaILJ2pR9aI9rtdTSGg7t8dBKeJBocGahr2v6B2Q3M=;
 b=KHgVZih5MmSoknNDNwO3GKP7lgRwVE1UOQS+YTDHpzcz3jh8PVj3n0gYJVOQG3etqv
 SM1H+G4fSu5F854u27MvtqiwAxMJtNLHYCGFHOuJlneq2akEHTEvV9ycnJcAZT6PM4vu
 lF8dDqm5vY/cAuxUAHRc3q/84vWug7teQ4x4CYAtoVLn0jGLfbNUB5VYvuXeDQ1K+6JG
 E6iDgC82CKu16/jKGH+KPEJ3GYQ3IeUXQVufYsK2a7YsMweCIGvhsaEe5h0MVzLRwxrh
 wNe2VsRx2AzJWYlgQpSKLAIW5iNBiITnr1OaDN8nvohH25BMh76VMRIulmDjPlUoUSiD
 vUIQ==
X-Gm-Message-State: APjAAAWHe9K7oajlUtYt+0IMa6HzhcqXQrO7+Gh51pJr6df8dU0z6P7+
 7Q5CcdUmDOeaKVGEuz4dg4nPpuh8eTdKzUlKTTQ=
X-Google-Smtp-Source: APXvYqw9lP2rdJm1F2fci2F+7WjweXLY28gCMSClFv2ET81+/4C0T9Ac7FEdBmuSZlSgYsVx0KQYRHxQ81CiMFCmzrg=
X-Received: by 2002:aca:f1d7:: with SMTP id p206mr20049302oih.97.1571670026622; 
 Mon, 21 Oct 2019 08:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-4-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-4-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 22:59:45 +0800
Message-ID: <CAKXe6SJB5cqR7yq-_TDcMzWCq7UoGvq=A9kCh11tNoqYjQgp3g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 03/20] piix4: Add a i8259 Interrupt
 Controller as specified in datasheet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============1066279498878218774=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1066279498878218774==
Content-Type: multipart/alternative; boundary="000000000000a441d805956cf1e2"

--000000000000a441d805956cf1e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:52=E5=86=99=E9=81=
=93=EF=BC=9A

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Add ISA irqs as piix4 gpio in, and CPU interrupt request as piix4 gpio ou=
t.
> Remove i8259 instanciated in malta board, to not have it twice.
>
> We can also remove the now unused piix4_init() function.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-8-hpoussin@reactos.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> [PMD: rebased, updated includes, use ISA_NUM_IRQS in for loop]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c       | 43 ++++++++++++++++++++++++++++++++-----------
>  hw/mips/mips_malta.c | 32 +++++++++++++-------------------
>  include/hw/i386/pc.h |  1 -
>  3 files changed, 45 insertions(+), 31 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index d0b18e0586..9c37c85ae2 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -24,6 +24,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "hw/irq.h"
>  #include "hw/i386/pc.h"
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
> @@ -36,6 +37,8 @@ PCIDevice *piix4_dev;
>
>  typedef struct PIIX4State {
>      PCIDevice dev;
> +    qemu_irq cpu_intr;
> +    qemu_irq *isa;
>
>      /* Reset Control Register */
>      MemoryRegion rcr_mem;
> @@ -94,6 +97,18 @@ static const VMStateDescription vmstate_piix4 =3D {
>      }
>  };
>
> +static void piix4_request_i8259_irq(void *opaque, int irq, int level)
> +{
> +    PIIX4State *s =3D opaque;
> +    qemu_set_irq(s->cpu_intr, level);
> +}
> +
> +static void piix4_set_i8259_irq(void *opaque, int irq, int level)
> +{
> +    PIIX4State *s =3D opaque;
> +    qemu_set_irq(s->isa[irq], level);
> +}
> +
>  static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
>                              unsigned int len)
>  {
> @@ -127,29 +142,35 @@ static const MemoryRegionOps piix4_rcr_ops =3D {
>  static void piix4_realize(PCIDevice *dev, Error **errp)
>  {
>      PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
> +    ISABus *isa_bus;
> +    qemu_irq *i8259_out_irq;
>
> -    if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),
> -                     pci_address_space_io(dev), errp)) {
> +    isa_bus =3D isa_bus_new(DEVICE(dev), pci_address_space(dev),
> +                          pci_address_space_io(dev), errp);
> +    if (!isa_bus) {
>          return;
>      }
>
> +    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
> +                            "isa", ISA_NUM_IRQS);
> +    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
> +                             "intr", 1);
> +
>


Does the piix4 hardware has the GPIO for interrupt? Seems not.



>      memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
>                            "reset-control", 1);
>      memory_region_add_subregion_overlap(pci_address_space_io(dev), 0xcf9=
,
>                                          &s->rcr_mem, 1);
>
> +    /* initialize i8259 pic */
> +    i8259_out_irq =3D qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
> +    s->isa =3D i8259_init(isa_bus, *i8259_out_irq);
>

In i8259_init, we also allocate 16 input line and 1 output line.
Seems it is duplicated with the GPIO allocation in previous.

Also
Maybe here can uses
i8259(isa_bus, qemu_allocate_irq(piix4_request_i8259_irq, s, 0));


> +
> +    /* initialize ISA irqs */
> +    isa_bus_irqs(isa_bus, s->isa);
> +
>      piix4_dev =3D dev;
>  }
>
> -int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
> -{
> -    PCIDevice *d;
> -
> -    d =3D pci_create_simple_multifunction(bus, devfn, true, "PIIX4");
> -    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
> -    return d->devfn;
> -}
> -
>  static void piix4_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 4d9c64b36a..7d25ab6c23 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -97,7 +97,7 @@ typedef struct {
>      SysBusDevice parent_obj;
>
>      MIPSCPSState cps;
> -    qemu_irq *i8259;
> +    qemu_irq i8259[16];
>  } MaltaState;
>
>  static ISADevice *pit;
> @@ -1235,8 +1235,8 @@ void mips_malta_init(MachineState *machine)
>      int64_t kernel_entry, bootloader_run_addr;
>      PCIBus *pci_bus;
>      ISABus *isa_bus;
> -    qemu_irq *isa_irq;
>      qemu_irq cbus_irq, i8259_irq;
> +    PCIDevice *pci;
>      int piix4_devfn;
>      I2CBus *smbus;
>      DriveInfo *dinfo;
> @@ -1407,30 +1407,24 @@ void mips_malta_init(MachineState *machine)
>      /* Board ID =3D 0x420 (Malta Board with CoreLV) */
>      stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>
> -    /*
> -     * We have a circular dependency problem: pci_bus depends on isa_irq=
,
> -     * isa_irq is provided by i8259, i8259 depends on ISA, ISA depends
> -     * on piix4, and piix4 depends on pci_bus.  To stop the cycle we hav=
e
> -     * qemu_irq_proxy() adds an extra bit of indirection, allowing us
> -     * to resolve the isa_irq -> i8259 dependency after i8259 is
> initialized.
> -     */
> -    isa_irq =3D qemu_irq_proxy(&s->i8259, 16);
> -
>      /* Northbridge */
> -    pci_bus =3D gt64120_register(isa_irq);
> +    pci_bus =3D gt64120_register(s->i8259);
>
>      /* Southbridge */
>      ide_drive_get(hd, ARRAY_SIZE(hd));
>
> -    piix4_devfn =3D piix4_init(pci_bus, &isa_bus, 80);
> +    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> +                                          true, "PIIX4");
> +    dev =3D DEVICE(pci);
> +    isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> +    piix4_devfn =3D pci->devfn;
>
> -    /*
> -     * Interrupt controller
> -     * The 8259 is attached to the MIPS CPU INT0 pin, ie interrupt 2
> -     */
> -    s->i8259 =3D i8259_init(isa_bus, i8259_irq);
> +    /* Interrupt controller */
> +    qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> +    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
> +        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
> +    }
>
>
Also here s->i8259 and the piix4 isa point to the same input line. Seems
duplicated.

I have come up with a more cleaner patch as following:

Though 'i8259_init' is called in the mips_malta_init. But is uses the isa
bus from piix4 device.
And seems it's more clean.
You can test it with more tests.

Thanks,
Li Qiang

Author: Li Qiang <liq3ea@163.com>
Date:   Mon Oct 21 22:41:17 2019 +0800

    piix4

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d0b18e0586..66a041040a 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -24,6 +24,7 @@
  */

 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
@@ -46,6 +47,7 @@ typedef struct PIIX4State {
 #define PIIX4_PCI_DEVICE(obj) \
     OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)

+
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
@@ -141,14 +143,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp=
)
     piix4_dev =3D dev;
 }

-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
-{
-    PCIDevice *d;
-
-    d =3D pci_create_simple_multifunction(bus, devfn, true, "PIIX4");
-    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
-    return d->devfn;
-}

 static void piix4_class_init(ObjectClass *klass, void *data)
 {
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 4d9c64b36a..420e0e9e80 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -28,6 +28,7 @@
 #include "cpu.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/superio.h"
+//#include "hw/isa/piix4.h"
 #include "hw/dma/i8257.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
@@ -97,7 +98,7 @@ typedef struct {
     SysBusDevice parent_obj;

     MIPSCPSState cps;
-    qemu_irq *i8259;
+    qemu_irq i8259[ISA_NUM_IRQS];
 } MaltaState;

 static ISADevice *pit;
@@ -1235,8 +1236,9 @@ void mips_malta_init(MachineState *machine)
     int64_t kernel_entry, bootloader_run_addr;
     PCIBus *pci_bus;
     ISABus *isa_bus;
-    qemu_irq *isa_irq;
     qemu_irq cbus_irq, i8259_irq;
+    qemu_irq *i8259;
+    PCIDevice *pci;
     int piix4_devfn;
     I2CBus *smbus;
     DriveInfo *dinfo;
@@ -1407,29 +1409,24 @@ void mips_malta_init(MachineState *machine)
     /* Board ID =3D 0x420 (Malta Board with CoreLV) */
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);

-    /*
-     * We have a circular dependency problem: pci_bus depends on isa_irq,
-     * isa_irq is provided by i8259, i8259 depends on ISA, ISA depends
-     * on piix4, and piix4 depends on pci_bus.  To stop the cycle we have
-     * qemu_irq_proxy() adds an extra bit of indirection, allowing us
-     * to resolve the isa_irq -> i8259 dependency after i8259 is
initialized.
-     */
-    isa_irq =3D qemu_irq_proxy(&s->i8259, 16);
-
     /* Northbridge */
-    pci_bus =3D gt64120_register(isa_irq);
+    pci_bus =3D gt64120_register(s->i8259);

     /* Southbridge */
     ide_drive_get(hd, ARRAY_SIZE(hd));

-    piix4_devfn =3D piix4_init(pci_bus, &isa_bus, 80);
+    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
+                                          true, "PIIX4");
+    dev =3D DEVICE(pci);
+    isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    piix4_devfn =3D pci->devfn;

-    /*
-     * Interrupt controller
-     * The 8259 is attached to the MIPS CPU INT0 pin, ie interrupt 2
-     */
-    s->i8259 =3D i8259_init(isa_bus, i8259_irq);

+    i8259 =3D i8259_init(isa_bus, i8259_irq);
+    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
+        s->i8259[i] =3D i8259[i];
+    }
+    g_free(i8259);
     isa_bus_irqs(isa_bus, s->i8259);
     pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);
     pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");



> -    isa_bus_irqs(isa_bus, s->i8259);
>      pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);
>      pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
>      smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 37bfd95113..374f3e8835 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -286,7 +286,6 @@ PCIBus *i440fx_init(const char *host_type, const char
> *pci_type,
>  PCIBus *find_i440fx(void);
>  /* piix4.c */
>  extern PCIDevice *piix4_dev;
> -int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
>
>  /* pc_sysfw.c */
>  void pc_system_flash_create(PCMachineState *pcms);
> --
> 2.21.0
>
>
>

--000000000000a441d805956cf1e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:52=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.or=
g" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
<br>
Add ISA irqs as piix4 gpio in, and CPU interrupt request as piix4 gpio out.=
<br>
Remove i8259 instanciated in malta board, to not have it twice.<br>
<br>
We can also remove the now unused piix4_init() function.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-8-hpoussin@reactos.o=
rg" target=3D"_blank">20171216090228.28505-8-hpoussin@reactos.org</a>&gt;<b=
r>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
[PMD: rebased, updated includes, use ISA_NUM_IRQS in for loop]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 +++++++++++++++++++++++=
+++++++++-----------<br>
=C2=A0hw/mips/mips_malta.c | 32 +++++++++++++-------------------<br>
=C2=A0include/hw/i386/pc.h |=C2=A0 1 -<br>
=C2=A03 files changed, 45 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index d0b18e0586..9c37c85ae2 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -24,6 +24,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
@@ -36,6 +37,8 @@ PCIDevice *piix4_dev;<br>
<br>
=C2=A0typedef struct PIIX4State {<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice dev;<br>
+=C2=A0 =C2=A0 qemu_irq cpu_intr;<br>
+=C2=A0 =C2=A0 qemu_irq *isa;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Reset Control Register */<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion rcr_mem;<br>
@@ -94,6 +97,18 @@ static const VMStateDescription vmstate_piix4 =3D {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
+static void piix4_request_i8259_irq(void *opaque, int irq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;cpu_intr, level);<br>
+}<br>
+<br>
+static void piix4_set_i8259_irq(void *opaque, int irq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;isa[irq], level);<br>
+}<br>
+<br>
=C2=A0static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int len)<br>
=C2=A0{<br>
@@ -127,29 +142,35 @@ static const MemoryRegionOps piix4_rcr_ops =3D {<br>
=C2=A0static void piix4_realize(PCIDevice *dev, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);<br>
+=C2=A0 =C2=A0 ISABus *isa_bus;<br>
+=C2=A0 =C2=A0 qemu_irq *i8259_out_irq;<br>
<br>
-=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci_address_space_io(dev), errp)) {<br>
+=C2=A0 =C2=A0 isa_bus =3D isa_bus_new(DEVICE(dev), pci_address_space(dev),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pci_address_space_io(dev), errp);<br>
+=C2=A0 =C2=A0 if (!isa_bus) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isa&quot;, ISA_NUM_IRQS);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE(dev), &amp;s-&gt;cpu_intr,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;intr&quot;, 1);<br>
+<br></blockquote><div><br></div><div><br></div><div>Does the piix4 hardwar=
e has the GPIO for interrupt? Seems not.</div><div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;rcr_mem, OBJECT(dev), =
&amp;piix4_rcr_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;reset-control&quot;, 1);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion_overlap(pci_address_space_i=
o(dev), 0xcf9,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;s-&gt;rcr_mem, 1);<br>
<br>
+=C2=A0 =C2=A0 /* initialize i8259 pic */<br>
+=C2=A0 =C2=A0 i8259_out_irq =3D qemu_allocate_irqs(piix4_request_i8259_irq=
, s, 1);<br>
+=C2=A0 =C2=A0 s-&gt;isa =3D i8259_init(isa_bus, *i8259_out_irq);<br></bloc=
kquote><div><br></div><div>In i8259_init, we also allocate 16 input line an=
d 1 output line.=C2=A0</div><div>Seems it is duplicated with the GPIO alloc=
ation in previous.</div><div>=C2=A0</div><div>Also</div><div>Maybe here can=
 uses=C2=A0</div><div>i8259(isa_bus, qemu_allocate_irq(piix4_request_i8259_=
irq, s, 0));</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+=C2=A0 =C2=A0 /* initialize ISA irqs */<br>
+=C2=A0 =C2=A0 isa_bus_irqs(isa_bus, s-&gt;isa);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D dev;<br>
=C2=A0}<br>
<br>
-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)<br>
-{<br>
-=C2=A0 =C2=A0 PCIDevice *d;<br>
-<br>
-=C2=A0 =C2=A0 d =3D pci_create_simple_multifunction(bus, devfn, true, &quo=
t;PIIX4&quot;);<br>
-=C2=A0 =C2=A0 *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(d), &quot;isa=
.0&quot;));<br>
-=C2=A0 =C2=A0 return d-&gt;devfn;<br>
-}<br>
-<br>
=C2=A0static void piix4_class_init(ObjectClass *klass, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 4d9c64b36a..7d25ab6c23 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -97,7 +97,7 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice parent_obj;<br>
<br>
=C2=A0 =C2=A0 =C2=A0MIPSCPSState cps;<br>
-=C2=A0 =C2=A0 qemu_irq *i8259;<br>
+=C2=A0 =C2=A0 qemu_irq i8259[16];<br>
=C2=A0} MaltaState;<br>
<br>
=C2=A0static ISADevice *pit;<br>
@@ -1235,8 +1235,8 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0int64_t kernel_entry, bootloader_run_addr;<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *pci_bus;<br>
=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
-=C2=A0 =C2=A0 qemu_irq *isa_irq;<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq cbus_irq, i8259_irq;<br>
+=C2=A0 =C2=A0 PCIDevice *pci;<br>
=C2=A0 =C2=A0 =C2=A0int piix4_devfn;<br>
=C2=A0 =C2=A0 =C2=A0I2CBus *smbus;<br>
=C2=A0 =C2=A0 =C2=A0DriveInfo *dinfo;<br>
@@ -1407,30 +1407,24 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0/* Board ID =3D 0x420 (Malta Board with CoreLV) */<br>
=C2=A0 =C2=A0 =C2=A0stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00=
000420);<br>
<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* We have a circular dependency problem: pci_bus depen=
ds on isa_irq,<br>
-=C2=A0 =C2=A0 =C2=A0* isa_irq is provided by i8259, i8259 depends on ISA, =
ISA depends<br>
-=C2=A0 =C2=A0 =C2=A0* on piix4, and piix4 depends on pci_bus.=C2=A0 To sto=
p the cycle we have<br>
-=C2=A0 =C2=A0 =C2=A0* qemu_irq_proxy() adds an extra bit of indirection, a=
llowing us<br>
-=C2=A0 =C2=A0 =C2=A0* to resolve the isa_irq -&gt; i8259 dependency after =
i8259 is initialized.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 isa_irq =3D qemu_irq_proxy(&amp;s-&gt;i8259, 16);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* Northbridge */<br>
-=C2=A0 =C2=A0 pci_bus =3D gt64120_register(isa_irq);<br>
+=C2=A0 =C2=A0 pci_bus =3D gt64120_register(s-&gt;i8259);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Southbridge */<br>
=C2=A0 =C2=A0 =C2=A0ide_drive_get(hd, ARRAY_SIZE(hd));<br>
<br>
-=C2=A0 =C2=A0 piix4_devfn =3D piix4_init(pci_bus, &amp;isa_bus, 80);<br>
+=C2=A0 =C2=A0 pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(1=
0, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, &quot;PIIX4&quot;);<br>
+=C2=A0 =C2=A0 dev =3D DEVICE(pci);<br>
+=C2=A0 =C2=A0 isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, &quot;isa.0&quot=
;));<br>
+=C2=A0 =C2=A0 piix4_devfn =3D pci-&gt;devfn;<br>
<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* Interrupt controller<br>
-=C2=A0 =C2=A0 =C2=A0* The 8259 is attached to the MIPS CPU INT0 pin, ie in=
terrupt 2<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 s-&gt;i8259 =3D i8259_init(isa_bus, i8259_irq);<br>
+=C2=A0 =C2=A0 /* Interrupt controller */<br>
+=C2=A0 =C2=A0 qdev_connect_gpio_out_named(dev, &quot;intr&quot;, 0, i8259_=
irq);<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; ISA_NUM_IRQS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;i8259[i] =3D qdev_get_gpio_in_named(dev,=
 &quot;isa&quot;, i);<br>
+=C2=A0 =C2=A0 }<br>
<br></blockquote><div><br></div><div>Also here s-&gt;i8259 and the piix4 is=
a point to the same input line. Seems duplicated.</div><div><br></div><div>=
I have come up with a more cleaner patch as following:</div><div><br></div>=
<div>Though &#39;i8259_init&#39; is called in the mips_malta_init. But is u=
ses the isa bus from piix4 device.</div><div>And seems it&#39;s more clean.=
</div><div>You can test it with more tests.</div><div><br></div><div>Thanks=
,</div><div>Li Qiang</div><div><br></div><div>Author: Li Qiang &lt;<a href=
=3D"mailto:liq3ea@163.com">liq3ea@163.com</a>&gt;<br>Date: =C2=A0 Mon Oct 2=
1 22:41:17 2019 +0800<br><br>=C2=A0 =C2=A0 piix4<br><br>diff --git a/hw/isa=
/piix4.c b/hw/isa/piix4.c<br>index d0b18e0586..66a041040a 100644<br>--- a/h=
w/isa/piix4.c<br>+++ b/hw/isa/piix4.c<br>@@ -24,6 +24,7 @@<br>=C2=A0 */<br>=
=C2=A0<br>=C2=A0#include &quot;qemu/osdep.h&quot;<br>+#include &quot;hw/irq=
.h&quot;<br>=C2=A0#include &quot;hw/i386/pc.h&quot;<br>=C2=A0#include &quot=
;hw/pci/pci.h&quot;<br>=C2=A0#include &quot;hw/isa/isa.h&quot;<br>@@ -46,6 =
+47,7 @@ typedef struct PIIX4State {<br>=C2=A0#define PIIX4_PCI_DEVICE(obj)=
 \<br>=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DE=
VICE)<br>=C2=A0<br>+<br>=C2=A0static void piix4_isa_reset(DeviceState *dev)=
<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);=
<br>@@ -141,14 +143,6 @@ static void piix4_realize(PCIDevice *dev, Error **=
errp)<br>=C2=A0 =C2=A0 =C2=A0piix4_dev =3D dev;<br>=C2=A0}<br>=C2=A0<br>-in=
t piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)<br>-{<br>- =C2=A0 =
=C2=A0PCIDevice *d;<br>-<br>- =C2=A0 =C2=A0d =3D pci_create_simple_multifun=
ction(bus, devfn, true, &quot;PIIX4&quot;);<br>- =C2=A0 =C2=A0*isa_bus =3D =
ISA_BUS(qdev_get_child_bus(DEVICE(d), &quot;isa.0&quot;));<br>- =C2=A0 =C2=
=A0return d-&gt;devfn;<br>-}<br>=C2=A0<br>=C2=A0static void piix4_class_ini=
t(ObjectClass *klass, void *data)<br>=C2=A0{<br>diff --git a/hw/mips/mips_m=
alta.c b/hw/mips/mips_malta.c<br>index 4d9c64b36a..420e0e9e80 100644<br>---=
 a/hw/mips/mips_malta.c<br>+++ b/hw/mips/mips_malta.c<br>@@ -28,6 +28,7 @@<=
br>=C2=A0#include &quot;cpu.h&quot;<br>=C2=A0#include &quot;hw/i386/pc.h&qu=
ot;<br>=C2=A0#include &quot;hw/isa/superio.h&quot;<br>+//#include &quot;hw/=
isa/piix4.h&quot;<br>=C2=A0#include &quot;hw/dma/i8257.h&quot;<br>=C2=A0#in=
clude &quot;hw/char/serial.h&quot;<br>=C2=A0#include &quot;net/net.h&quot;<=
br>@@ -97,7 +98,7 @@ typedef struct {<br>=C2=A0 =C2=A0 =C2=A0SysBusDevice p=
arent_obj;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0MIPSCPSState cps;<br>- =C2=A0 =
=C2=A0qemu_irq *i8259;<br>+ =C2=A0 =C2=A0qemu_irq i8259[ISA_NUM_IRQS];<br>=
=C2=A0} MaltaState;<br>=C2=A0<br>=C2=A0static ISADevice *pit;<br>@@ -1235,8=
 +1236,9 @@ void mips_malta_init(MachineState *machine)<br>=C2=A0 =C2=A0 =
=C2=A0int64_t kernel_entry, bootloader_run_addr;<br>=C2=A0 =C2=A0 =C2=A0PCI=
Bus *pci_bus;<br>=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>- =C2=A0 =C2=A0qem=
u_irq *isa_irq;<br>=C2=A0 =C2=A0 =C2=A0qemu_irq cbus_irq, i8259_irq;<br>+ =
=C2=A0 =C2=A0qemu_irq *i8259;<br>+ =C2=A0 =C2=A0PCIDevice *pci;<br>=C2=A0 =
=C2=A0 =C2=A0int piix4_devfn;<br>=C2=A0 =C2=A0 =C2=A0I2CBus *smbus;<br>=C2=
=A0 =C2=A0 =C2=A0DriveInfo *dinfo;<br>@@ -1407,29 +1409,24 @@ void mips_mal=
ta_init(MachineState *machine)<br>=C2=A0 =C2=A0 =C2=A0/* Board ID =3D 0x420=
 (Malta Board with CoreLV) */<br>=C2=A0 =C2=A0 =C2=A0stl_p(memory_region_ge=
t_ram_ptr(bios_copy) + 0x10, 0x00000420);<br>=C2=A0<br>- =C2=A0 =C2=A0/*<br=
>- =C2=A0 =C2=A0 * We have a circular dependency problem: pci_bus depends o=
n isa_irq,<br>- =C2=A0 =C2=A0 * isa_irq is provided by i8259, i8259 depends=
 on ISA, ISA depends<br>- =C2=A0 =C2=A0 * on piix4, and piix4 depends on pc=
i_bus.=C2=A0 To stop the cycle we have<br>- =C2=A0 =C2=A0 * qemu_irq_proxy(=
) adds an extra bit of indirection, allowing us<br>- =C2=A0 =C2=A0 * to res=
olve the isa_irq -&gt; i8259 dependency after i8259 is initialized.<br>- =
=C2=A0 =C2=A0 */<br>- =C2=A0 =C2=A0isa_irq =3D qemu_irq_proxy(&amp;s-&gt;i8=
259, 16);<br>-<br>=C2=A0 =C2=A0 =C2=A0/* Northbridge */<br>- =C2=A0 =C2=A0p=
ci_bus =3D gt64120_register(isa_irq);<br>+ =C2=A0 =C2=A0pci_bus =3D gt64120=
_register(s-&gt;i8259);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0/* Southbridge */<=
br>=C2=A0 =C2=A0 =C2=A0ide_drive_get(hd, ARRAY_SIZE(hd));<br>=C2=A0<br>- =
=C2=A0 =C2=A0piix4_devfn =3D piix4_init(pci_bus, &amp;isa_bus, 80);<br>+ =
=C2=A0 =C2=A0pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10,=
 0),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0true, &quot;PIIX4&quot;);<br>+ =C2=A0 =C2=A0dev =3D DEVICE(pci);<=
br>+ =C2=A0 =C2=A0isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, &quot;isa.0&q=
uot;));<br>+ =C2=A0 =C2=A0piix4_devfn =3D pci-&gt;devfn;<br>=C2=A0<br>- =C2=
=A0 =C2=A0/*<br>- =C2=A0 =C2=A0 * Interrupt controller<br>- =C2=A0 =C2=A0 *=
 The 8259 is attached to the MIPS CPU INT0 pin, ie interrupt 2<br>- =C2=A0 =
=C2=A0 */<br>- =C2=A0 =C2=A0s-&gt;i8259 =3D i8259_init(isa_bus, i8259_irq);=
<br>=C2=A0<br>+ =C2=A0 =C2=A0i8259 =3D i8259_init(isa_bus, i8259_irq);<br>+=
 =C2=A0 =C2=A0for (int i =3D 0; i &lt; ISA_NUM_IRQS; i++) {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;i8259[i] =3D i8259[i];<br>+ =C2=A0 =C2=A0}<br>+ =C2=
=A0 =C2=A0g_free(i8259);<br>=C2=A0 =C2=A0 =C2=A0isa_bus_irqs(isa_bus, s-&gt=
;i8259);<br>=C2=A0 =C2=A0 =C2=A0pci_piix4_ide_init(pci_bus, hd, piix4_devfn=
 + 1);<br>=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, piix4_devfn + 2, &=
quot;piix4-usb-uhci&quot;);<br></div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 isa_bus_irqs(isa_bus, s-&gt;i8259);<br>
=C2=A0 =C2=A0 =C2=A0pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);<br>
=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, piix4_devfn + 2, &quot;piix4=
-usb-uhci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x110=
0,<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index 37bfd95113..374f3e8835 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -286,7 +286,6 @@ PCIBus *i440fx_init(const char *host_type, const char *=
pci_type,<br>
=C2=A0PCIBus *find_i440fx(void);<br>
=C2=A0/* piix4.c */<br>
=C2=A0extern PCIDevice *piix4_dev;<br>
-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);<br>
<br>
=C2=A0/* pc_sysfw.c */<br>
=C2=A0void pc_system_flash_create(PCMachineState *pcms);<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000a441d805956cf1e2--


--===============1066279498878218774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1066279498878218774==--

