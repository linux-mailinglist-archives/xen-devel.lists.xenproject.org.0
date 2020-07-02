Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB35212730
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 16:58:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr0fV-000470-LD; Thu, 02 Jul 2020 14:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrbb=AN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jr0fT-00046v-Kh
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 14:58:27 +0000
X-Inumbo-ID: 7b642416-bc74-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b642416-bc74-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 14:58:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so28323432wmo.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2020 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=T4F0H2VU/s4RezHwUWV4RCFlQyqVluB7IEU0w1AzBn8=;
 b=MIMI034ooObgfsFTG3w3Jz4ZmxsS3Tgr59tT+D0k/xKyuvXd2D9ujipi4EG8ptnr8V
 rHEbyHcn890re8tdz2OjbYs6kdXsaPC0tsDiBilrl/wd5dQ+q7+kPz0pp7Ji4pHorPNy
 FUZpdEs/ZKamM42pGo6dv//2+GLKs63UQ+TYzsCn12NL2TA1im3xRSlZ/e7zGrvEl22l
 Tyh0BWtGWyJs4PQQGt+XuwA+LkS7pVpIKOn8fj9hYPKVQqxVsOyEZHNLPCzttt+HL+PT
 rGqDiN++xKFZdIXf0CnFqQqBNeJsgVA/NeBf4dZWkz22rCLwbwzH1+StXiuzEQT+TgXF
 58ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=T4F0H2VU/s4RezHwUWV4RCFlQyqVluB7IEU0w1AzBn8=;
 b=uZvKQdpbScnS77mPsbDOzR2JiPCABbERxr7vBpAvl5+nNZAV48CGTpPThyxE260eBb
 yjeeFDqzDK9HPv5jAv8iUmIvJrevBtPZ5mCgQADqgOM/QL8KUJo9tMPcmUcFJD39hfms
 oB4qrhWQerAj6h9JaKOVJXbkBF3kYrqLQtNIV6D18SDnjhhk7SwZn9Tavl193bK5LdT5
 XsB/ZHscTUUBy/ho4xPWTHkeUEKBHpFRTQ5pnx8z1i+/oUjzs9NdcueISeVqfpHQAcsm
 rC8F1yMVwsOCnQCPaQLLbuk5IQXOGzK75Wswq3GrVZMT5pN2s+KZ1SZpebtszOawwRX8
 OoPA==
X-Gm-Message-State: AOAM530RuY/SASghjjmmJ4KywzvLzNBVWLIAl1CnBjoYgJeXXmXJmPCC
 2B1kwI20fNckY+2T2dvhaAk=
X-Google-Smtp-Source: ABdhPJwUrvl47VbP0f6r7yOTUAH3GoGj5xbmWhtNFciNa2UmNtA4YqHYfBRB/hMh2zEEq9TtXau8JA==
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr31902659wmu.55.1593701905660; 
 Thu, 02 Jul 2020 07:58:25 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id r67sm11391627wmr.9.2020.07.02.07.58.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 07:58:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>,
 "'Paul Durrant'" <paul.durrant@citrix.com>
References: <20200604183141.32044-1-pbonzini@redhat.com>
 <20200702142544.GA2157@perard.uk.xensource.com>
In-Reply-To: <20200702142544.GA2157@perard.uk.xensource.com>
Subject: RE: [PATCH v5] xen: fix build without pci passthrough
Date: Thu, 2 Jul 2020 15:58:24 +0100
Message-ID: <002301d65081$3c7e4600$b57ad200$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIUWz2X2P52aIvTbn1t59d871MHUAHbluYKqGlue5A=
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 =?iso-8859-1?Q?'Roger_Pau_Monn=E9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Anthony PERARD
> Sent: 02 July 2020 15:26
> To: Paul Durrant <paul.durrant@citrix.com>

Emails to this address are probably going to /dev/null by now :-)

> Cc: xen-devel@lists.xenproject.org; Roger Pau Monn=E9 =
<roger.pau@citrix.com>
> Subject: Re: [PATCH v5] xen: fix build without pci passthrough
>=20
> On Thu, Jun 04, 2020 at 02:31:41PM -0400, Paolo Bonzini wrote:
> > From: Anthony PERARD <anthony.perard@citrix.com>
> >
> > Xen PCI passthrough support may not be available and thus the global
> > variable "has_igd_gfx_passthru" might be compiled out. Common code
> > should not access it in that case.
> >
> > Unfortunately, we can't use CONFIG_XEN_PCI_PASSTHROUGH directly in
> > xen-common.c so this patch instead move access to the
> > has_igd_gfx_passthru variable via function and those functions are
> > also implemented as stubs. The stubs will be used when QEMU is built
> > without passthrough support.
> >
> > Now, when one will want to enable igd-passthru via the -machine
> > property, they will get an error message if QEMU is built without
> > passthrough support.
> >
> > Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an =
accelerator property')
> > Reported-by: Roger Pau Monn=E9 <roger.pau@citrix.com>
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > Message-Id: <20200603160442.3151170-1-anthony.perard@citrix.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Hi Paul,
>=20
> Can I backport this patch to qemu-xen-4.14? It allows to build qemu
> without pci passthrough support which seems to be important for =
FreeBSD
> as PT with QEMU is only available on Linux.
>=20
> (There's a fix to the patch that I would backport as well. "xen:
> Actually fix build without passthrough")
>=20
> Thanks.

I have no objection to make this fix for 4.14.

Cheers,

  Paul

>=20
> > ---
> >  accel/xen/xen-all.c  |  4 ++--
> >  hw/Makefile.objs     |  2 +-
> >  hw/i386/pc_piix.c    |  2 +-
> >  hw/xen/Makefile.objs |  3 ++-
> >  hw/xen/xen_pt.c      | 12 +++++++++++-
> >  hw/xen/xen_pt.h      |  6 ++++--
> >  hw/xen/xen_pt_stub.c | 22 ++++++++++++++++++++++
> >  7 files changed, 43 insertions(+), 8 deletions(-)
> >  create mode 100644 hw/xen/xen_pt_stub.c
> >
> > diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> > index f3edc65ec9..0c24d4b191 100644
> > --- a/accel/xen/xen-all.c
> > +++ b/accel/xen/xen-all.c
> > @@ -137,12 +137,12 @@ static void xen_change_state_handler(void =
*opaque, int running,
> >
> >  static bool xen_get_igd_gfx_passthru(Object *obj, Error **errp)
> >  {
> > -    return has_igd_gfx_passthru;
> > +    return xen_igd_gfx_pt_enabled();
> >  }
> >
> >  static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error =
**errp)
> >  {
> > -    has_igd_gfx_passthru =3D value;
> > +    xen_igd_gfx_pt_set(value, errp);
> >  }
> >
> >  static void xen_setup_post(MachineState *ms, AccelState *accel)
> > diff --git a/hw/Makefile.objs b/hw/Makefile.objs
> > index 660e2b4373..4cbe5e4e57 100644
> > --- a/hw/Makefile.objs
> > +++ b/hw/Makefile.objs
> > @@ -35,7 +35,7 @@ devices-dirs-y +=3D usb/
> >  devices-dirs-$(CONFIG_VFIO) +=3D vfio/
> >  devices-dirs-y +=3D virtio/
> >  devices-dirs-y +=3D watchdog/
> > -devices-dirs-y +=3D xen/
> > +devices-dirs-$(CONFIG_XEN) +=3D xen/
> >  devices-dirs-$(CONFIG_MEM_DEVICE) +=3D mem/
> >  devices-dirs-$(CONFIG_NUBUS) +=3D nubus/
> >  devices-dirs-y +=3D semihosting/
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index eea964e72b..054d3aa9f7 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -377,7 +377,7 @@ static void pc_init_isa(MachineState *machine)
> >  #ifdef CONFIG_XEN
> >  static void pc_xen_hvm_init_pci(MachineState *machine)
> >  {
> > -    const char *pci_type =3D has_igd_gfx_passthru ?
> > +    const char *pci_type =3D xen_igd_gfx_pt_enabled() ?
> >                  TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE : =
TYPE_I440FX_PCI_DEVICE;
> >
> >      pc_init1(machine,
> > diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> > index 340b2c5096..3fc715e595 100644
> > --- a/hw/xen/Makefile.objs
> > +++ b/hw/xen/Makefile.objs
> > @@ -1,6 +1,7 @@
> >  # xen backend driver support
> > -common-obj-$(CONFIG_XEN) +=3D xen-legacy-backend.o xen_devconfig.o =
xen_pvdev.o xen-bus.o xen-bus-
> helper.o xen-backend.o
> > +common-obj-y +=3D xen-legacy-backend.o xen_devconfig.o xen_pvdev.o =
xen-bus.o xen-bus-helper.o xen-
> backend.o
> >
> >  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen-host-pci-device.o
> >  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt.o =
xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
> >  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) +=3D xen_pt_load_rom.o
> > +obj-$(call $(lnot, $(CONFIG_XEN_PCI_PASSTHROUGH))) +=3D =
xen_pt_stub.o
> > diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> > index 81d5ad8da7..ab84443d5e 100644
> > --- a/hw/xen/xen_pt.c
> > +++ b/hw/xen/xen_pt.c
> > @@ -65,7 +65,17 @@
> >  #include "qemu/range.h"
> >  #include "exec/address-spaces.h"
> >
> > -bool has_igd_gfx_passthru;
> > +static bool has_igd_gfx_passthru;
> > +
> > +bool xen_igd_gfx_pt_enabled(void)
> > +{
> > +    return has_igd_gfx_passthru;
> > +}
> > +
> > +void xen_igd_gfx_pt_set(bool value, Error **errp)
> > +{
> > +    has_igd_gfx_passthru =3D value;
> > +}
> >
> >  #define XEN_PT_NR_IRQS (256)
> >  static uint8_t xen_pt_mapped_machine_irq[XEN_PT_NR_IRQS] =3D {0};
> > diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> > index 179775db7b..6e9cec95f3 100644
> > --- a/hw/xen/xen_pt.h
> > +++ b/hw/xen/xen_pt.h
> > @@ -5,6 +5,9 @@
> >  #include "hw/pci/pci.h"
> >  #include "xen-host-pci-device.h"
> >
> > +bool xen_igd_gfx_pt_enabled(void);
> > +void xen_igd_gfx_pt_set(bool value, Error **errp);
> > +
> >  void xen_pt_log(const PCIDevice *d, const char *f, ...) =
GCC_FMT_ATTR(2, 3);
> >
> >  #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, =
__func__, ##_a)
> > @@ -322,10 +325,9 @@ extern void =
*pci_assign_dev_load_option_rom(PCIDevice *dev,
> >                                              unsigned int domain,
> >                                              unsigned int bus, =
unsigned int slot,
> >                                              unsigned int function);
> > -extern bool has_igd_gfx_passthru;
> >  static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
> >  {
> > -    return (has_igd_gfx_passthru
> > +    return (xen_igd_gfx_pt_enabled()
> >              && ((dev->class_code >> 0x8) =3D=3D =
PCI_CLASS_DISPLAY_VGA));
> >  }
> >  int xen_pt_register_vga_regions(XenHostPCIDevice *dev);
> > diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
> > new file mode 100644
> > index 0000000000..2d8cac8d54
> > --- /dev/null
> > +++ b/hw/xen/xen_pt_stub.c
> > @@ -0,0 +1,22 @@
> > +/*
> > + * Copyright (C) 2020       Citrix Systems UK Ltd.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 =
or later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/xen/xen_pt.h"
> > +#include "qapi/error.h"
> > +
> > +bool xen_igd_gfx_pt_enabled(void)
> > +{
> > +    return false;
> > +}
> > +
> > +void xen_igd_gfx_pt_set(bool value, Error **errp)
> > +{
> > +    if (value) {
> > +        error_setg(errp, "Xen PCI passthrough support not built =
in");
> > +    }
> > +}
> > --
> > 2.26.2
> >
> >
>=20
> --
> Anthony PERARD



