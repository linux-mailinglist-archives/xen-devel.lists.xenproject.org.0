Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F2DC0EE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOY2-0008AL-2M; Fri, 18 Oct 2019 09:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLOY0-0008AG-Nk
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:27:48 +0000
X-Inumbo-ID: 8c04b602-f189-11e9-a531-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c04b602-f189-11e9-a531-bc764e2007e4;
 Fri, 18 Oct 2019 09:27:47 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id c10so4389476otd.9
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pUEiwwQjLt2xYtGo8SnML1+NaFafEWCmpGE3KBmhDn0=;
 b=eriAxyZteyVB4WtHCAzvWmaRQhkwM0uMDCK+my7Yjf1sn5WRYrPsA4yUc1qT++2uFQ
 bC4MFJbyEZVmSl0s7mc45RfXkjObw1xFrD33nZSb7vW5t9FqxrAD3S+vqktS3FSMElnZ
 qOqE7TOWMm43Cv0wsL/OHgEugzOxQKlQNLJMjkeEZLatlwH7T0BYyuGpwv4Ywd4qNtmi
 IRfxoT7kRuBmf1OHbfIOHASJGhHDCW0RKwLq5309ORgkG3ms/HL/RA+trH6uU0GH1Yz9
 DNCg08rLd1AWKa6COhUoL6OBM/jGXo9w9Jrj+Y6D2F5DCHjBNv+VnQSJ6BshlxL9H2Te
 xz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pUEiwwQjLt2xYtGo8SnML1+NaFafEWCmpGE3KBmhDn0=;
 b=WGwgHwMjNMRrYkv2U+CSBiYh0Mep7bUFF7JkFn9Kz9yuyiLWHNXZBlIB34DTVmRVjZ
 xX50jP+J3d4iJjPcAX5JWRKkC8ZKd3KomZ7GsoQSN+rxakfneBUS4cprVXszprWPcxJG
 FCoq4mD6ur28/7q7ZAj0sLWvjJlauNTRoicQswrgJDVPhNDO3Axr/tgCU6zFEmiImzlS
 7mK7PToDbeVSNGSnft6vVZD/Yfrbm/ftJHsDD6z1SeoB0use5oATynPmpHvsYXw1a2Xq
 XkXrYO30bzyBZAdIyubpKbHM/vHW2VPh0UekIhPTVAjFGgV8BBPYIm+SE3FnIuugNeMf
 +25Q==
X-Gm-Message-State: APjAAAUTceC6ko6u51s8D9nWQVM0dxJKVVPL9UftsL6TtD6zttf9YMSS
 ddtK4ocaMAV/UZd/Ce0BBW0OZB45xCUy/KBiP1Y=
X-Google-Smtp-Source: APXvYqxLUhgmO8EKAWDeaK/wSUnVVwy1YBz5OXY5mIPd5Mh9un+34aA9PHp1kh0TApObn8a+hdslUGrfDw9XYkfzfOo=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr6463206otl.64.1571390867071; 
 Fri, 18 Oct 2019 02:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:27:46
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-29-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-29-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:27:46 +0200
Message-ID: <CAL1e-=ioYVfXb1JEwM58BKt+wQ4bV82QnqiTD2uX65aJpVmdYw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 28/32] hw/pci-host/piix: Move i440FX
 declarations to hw/pci-host/i440fx.h
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
Content-Type: multipart/mixed; boundary="===============3957950508860175696=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3957950508860175696==
Content-Type: multipart/alternative; boundary="0000000000006f688a05952bf23b"

--0000000000006f688a05952bf23b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The hw/pci-host/piix.c contains a mix of PIIX3 and i440FX chipsets
> functions. To be able to split it, we need to export some
> declarations first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS                  |  1 +
>  hw/acpi/pcihp.c              |  2 +-
>  hw/i386/pc_piix.c            |  1 +
>  hw/pci-host/piix.c           |  1 +
>  include/hw/i386/pc.h         | 22 ---------------------
>  include/hw/pci-host/i440fx.h | 37 ++++++++++++++++++++++++++++++++++++
>  stubs/pci-host-piix.c        |  3 ++-
>  7 files changed, 43 insertions(+), 24 deletions(-)
>  create mode 100644 include/hw/pci-host/i440fx.h
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/MAINTAINERS b/MAINTAINERS
> index 556f58bd8c..adf059a164 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1228,6 +1228,7 @@ F: hw/i386/
>  F: hw/pci-host/piix.c
>  F: hw/pci-host/q35.c
>  F: hw/pci-host/pam.c
> +F: include/hw/pci-host/i440fx.h
>  F: include/hw/pci-host/q35.h
>  F: include/hw/pci-host/pam.h
>  F: hw/isa/lpc_ich9.c
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 82d295b6e8..8413348a33 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -27,7 +27,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/pcihp.h"
>
> -#include "hw/i386/pc.h"
> +#include "hw/pci-host/i440fx.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/acpi/acpi.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5b35ff04c7..8ac4bf12ca 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -29,6 +29,7 @@
>  #include "hw/loader.h"
>  #include "hw/i386/pc.h"
>  #include "hw/i386/apic.h"
> +#include "hw/pci-host/i440fx.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/firmware/smbios.h"
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index a450fc726e..0b5da5bc94 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -27,6 +27,7 @@
>  #include "hw/irq.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> +#include "hw/pci-host/i440fx.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/isa/isa.h"
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 1c20b96571..cead2828de 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -248,28 +248,6 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
>  /* hpet.c */
>  extern int no_hpet;
>
> -/* piix_pci.c */
> -struct PCII440FXState;
> -typedef struct PCII440FXState PCII440FXState;
> -
> -#define TYPE_I440FX_PCI_HOST_BRIDGE "i440FX-pcihost"
> -#define TYPE_I440FX_PCI_DEVICE "i440FX"
> -
> -#define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
> -
> -PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> -                    PCII440FXState **pi440fx_state, int *piix_devfn,
> -                    ISABus **isa_bus, qemu_irq *pic,
> -                    MemoryRegion *address_space_mem,
> -                    MemoryRegion *address_space_io,
> -                    ram_addr_t ram_size,
> -                    ram_addr_t below_4g_mem_size,
> -                    ram_addr_t above_4g_mem_size,
> -                    MemoryRegion *pci_memory,
> -                    MemoryRegion *ram_memory);
> -
> -PCIBus *find_i440fx(void);
> -
>  /* pc_sysfw.c */
>  void pc_system_flash_create(PCMachineState *pcms);
>  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion
> *rom_memory);
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> new file mode 100644
> index 0000000000..e327f9bf87
> --- /dev/null
> +++ b/include/hw/pci-host/i440fx.h
> @@ -0,0 +1,37 @@
> +/*
> + * QEMU i440FX North Bridge Emulation
> + *
> + * Copyright (c) 2006 Fabrice Bellard
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef HW_PCI_I440FX_H
> +#define HW_PCI_I440FX_H
> +
> +#include "hw/hw.h"
> +#include "hw/pci/pci_bus.h"
> +
> +typedef struct PCII440FXState PCII440FXState;
> +
> +#define TYPE_I440FX_PCI_HOST_BRIDGE "i440FX-pcihost"
> +#define TYPE_I440FX_PCI_DEVICE "i440FX"
> +
> +#define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
> +
> +PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> +                    PCII440FXState **pi440fx_state, int *piix_devfn,
> +                    ISABus **isa_bus, qemu_irq *pic,
> +                    MemoryRegion *address_space_mem,
> +                    MemoryRegion *address_space_io,
> +                    ram_addr_t ram_size,
> +                    ram_addr_t below_4g_mem_size,
> +                    ram_addr_t above_4g_mem_size,
> +                    MemoryRegion *pci_memory,
> +                    MemoryRegion *ram_memory);
> +
> +PCIBus *find_i440fx(void);
> +
> +#endif
> diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
> index 6ed81b1f21..93975adbfe 100644
> --- a/stubs/pci-host-piix.c
> +++ b/stubs/pci-host-piix.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
> -#include "hw/i386/pc.h"
> +#include "hw/pci-host/i440fx.h"
> +
>  PCIBus *find_i440fx(void)
>  {
>      return NULL;
> --
> 2.21.0
>
>
>

--0000000000006f688a05952bf23b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
The hw/pci-host/piix.c contains a mix of PIIX3 and i440FX chipsets<br>
functions. To be able to split it, we need to export some<br>
declarations first.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A0hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 =
+<br>
=C2=A0hw/pci-host/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 =
+<br>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 ----------=
-----------<br>
=C2=A0include/hw/pci-host/i440fx.h | 37 ++++++++++++++++++++++++++++++<wbr>=
++++++<br>
=C2=A0stubs/pci-host-piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A07 files changed, 43 insertions(+), 24 deletions(-)<br>
=C2=A0create mode 100644 include/hw/pci-host/i440fx.h<br>
<br></blockquote><div><br></div><div><span style=3D"color:rgb(34,34,34);fon=
t-size:14px;line-height:22.1200008392334px">Reviewed-by: Aleksandar Markovi=
c &lt;</span><a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_blank" st=
yle=3D"font-size:14px;line-height:22.1200008392334px">amarkovic@wavecomp.co=
m</a><span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.12000=
08392334px">&gt;</span><br></div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 556f58bd8c..adf059a164 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1228,6 +1228,7 @@ F: hw/i386/<br>
=C2=A0F: hw/pci-host/piix.c<br>
=C2=A0F: hw/pci-host/q35.c<br>
=C2=A0F: hw/pci-host/pam.c<br>
+F: include/hw/pci-host/i440fx.h<br>
=C2=A0F: include/hw/pci-host/q35.h<br>
=C2=A0F: include/hw/pci-host/pam.h<br>
=C2=A0F: hw/isa/lpc_ich9.c<br>
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
index 82d295b6e8..8413348a33 100644<br>
--- a/hw/acpi/pcihp.c<br>
+++ b/hw/acpi/pcihp.c<br>
@@ -27,7 +27,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;hw/acpi/pcihp.h&quot;<br>
<br>
-#include &quot;hw/i386/pc.h&quot;<br>
+#include &quot;hw/pci-host/i440fx.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_bridge.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi.h&quot;<br>
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
index 5b35ff04c7..8ac4bf12ca 100644<br>
--- a/hw/i386/pc_piix.c<br>
+++ b/hw/i386/pc_piix.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic.h&quot;<br>
+#include &quot;hw/pci-host/i440fx.h&quot;<br>
=C2=A0#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/display/ramfb.h&quot;<br>
=C2=A0#include &quot;hw/firmware/smbios.h&quot;<br>
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index a450fc726e..0b5da5bc94 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
+#include &quot;hw/pci-host/i440fx.h&quot;<br>
=C2=A0#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index 1c20b96571..cead2828de 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -248,28 +248,6 @@ int cmos_get_fd_drive_type(<wbr>FloppyDriveType fd0);<=
br>
=C2=A0/* hpet.c */<br>
=C2=A0extern int no_hpet;<br>
<br>
-/* piix_pci.c */<br>
-struct PCII440FXState;<br>
-typedef struct PCII440FXState PCII440FXState;<br>
-<br>
-#define TYPE_I440FX_PCI_HOST_BRIDGE &quot;i440FX-pcihost&quot;<br>
-#define TYPE_I440FX_PCI_DEVICE &quot;i440FX&quot;<br>
-<br>
-#define TYPE_IGD_PASSTHROUGH_I440FX_<wbr>PCI_DEVICE &quot;igd-passthrough-=
i440FX&quot;<br>
-<br>
-PCIBus *i440fx_init(const char *host_type, const char *pci_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCII=
440FXState **pi440fx_state, int *piix_devfn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISAB=
us **isa_bus, qemu_irq *pic,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *address_space_mem,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *address_space_io,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
addr_t ram_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
addr_t below_4g_mem_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
addr_t above_4g_mem_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *pci_memory,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *ram_memory);<br>
-<br>
-PCIBus *find_i440fx(void);<br>
-<br>
=C2=A0/* pc_sysfw.c */<br>
=C2=A0void pc_system_flash_create(<wbr>PCMachineState *pcms);<br>
=C2=A0void pc_system_firmware_init(<wbr>PCMachineState *pcms, MemoryRegion =
*rom_memory);<br>
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h<br=
>
new file mode 100644<br>
index 0000000000..e327f9bf87<br>
--- /dev/null<br>
+++ b/include/hw/pci-host/i440fx.h<br>
@@ -0,0 +1,37 @@<br>
+/*<br>
+ * QEMU i440FX North Bridge Emulation<br>
+ *<br>
+ * Copyright (c) 2006 Fabrice Bellard<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef HW_PCI_I440FX_H<br>
+#define HW_PCI_I440FX_H<br>
+<br>
+#include &quot;hw/hw.h&quot;<br>
+#include &quot;hw/pci/pci_bus.h&quot;<br>
+<br>
+typedef struct PCII440FXState PCII440FXState;<br>
+<br>
+#define TYPE_I440FX_PCI_HOST_BRIDGE &quot;i440FX-pcihost&quot;<br>
+#define TYPE_I440FX_PCI_DEVICE &quot;i440FX&quot;<br>
+<br>
+#define TYPE_IGD_PASSTHROUGH_I440FX_<wbr>PCI_DEVICE &quot;igd-passthrough-=
i440FX&quot;<br>
+<br>
+PCIBus *i440fx_init(const char *host_type, const char *pci_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCII=
440FXState **pi440fx_state, int *piix_devfn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISAB=
us **isa_bus, qemu_irq *pic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *address_space_mem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *address_space_io,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
addr_t ram_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
addr_t below_4g_mem_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_=
addr_t above_4g_mem_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *pci_memory,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memo=
ryRegion *ram_memory);<br>
+<br>
+PCIBus *find_i440fx(void);<br>
+<br>
+#endif<br>
diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c<br>
index 6ed81b1f21..93975adbfe 100644<br>
--- a/stubs/pci-host-piix.c<br>
+++ b/stubs/pci-host-piix.c<br>
@@ -1,5 +1,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;hw/i386/pc.h&quot;<br>
+#include &quot;hw/pci-host/i440fx.h&quot;<br>
+<br>
=C2=A0PCIBus *find_i440fx(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000006f688a05952bf23b--


--===============3957950508860175696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3957950508860175696==--

