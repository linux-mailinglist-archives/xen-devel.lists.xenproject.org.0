Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BFBDC12F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOe5-0000gZ-Ib; Fri, 18 Oct 2019 09:34:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLOe3-0000gR-9o
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:34:03 +0000
X-Inumbo-ID: 6adc55b0-f18a-11e9-8aca-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6adc55b0-f18a-11e9-8aca-bc764e2007e4;
 Fri, 18 Oct 2019 09:34:01 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 41so4390679oti.12
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8kmGKBvA+pMQPbeVneluAYIicVpDPfuuiN2lYzvLGFY=;
 b=W5joDb6Rjcl2602j/Rjoiuwtu4mxydfJjiGCU9G08MoH2kOVU8N1joNJ0VEKOzm0Ni
 Fy0bW93fVZ0tsQ2kT6cjnTGbCTBSf/9QhHJlhWompWQCLbux2saYsa0tsnt4d5OLowGk
 IeEjUbzm783DNHpqIXLqXL9FgoAc/HXTKZm5E9tu7RvFIHW0QqtYui6gy1RbuZmgFqkm
 iXIoSySM+Q+TJOBf50OrPXtZpMw6b1FS2jZcuMviQf5MdG7swbWgNVr6URSx3ZDAULMo
 VxOeE3xAWgeiI3sM7ZZEB4TE28syIYtYeQ7QBGAqo/vXSrDTIkBcqFGc9pfRW9uNkPMv
 seGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8kmGKBvA+pMQPbeVneluAYIicVpDPfuuiN2lYzvLGFY=;
 b=luqehxUuUn9XLIeU+QuoNxEvQ2qJOEioIlR3twKy4mOiuEMz2t0SftISxkVrH56SFh
 reHmPD+egkkT0Z2WEaW18iwD9JRMliCe4t1a6xfuvF/o/hqVfKJfOgjIWQwyO5/zlNCe
 Jp75EDYslfTHPMNRYR8moucCYRbwNHT9Y7KPsUso5EV17KrKU/JqHiRRL4hGhjOYnn13
 9MgUogc5YrUv2uDs7WPxYSkljdrs48SB1odTk5nqkdujwxMRkS5h4vLWpHOZyF3RjI8s
 KNjxX7NeWJ8JAtcFowAmH+O93zstRutx2akOM0fawLdEmRWN5uymWNX5R/8lihqyufDe
 Kl8w==
X-Gm-Message-State: APjAAAWWbcBUuMR8res5NFKNOE+V0hz6mu4xHe0h43s0HS+m0tw/jFm9
 8pm4hJCcqO+5dm7BR2W0/C5QU6PTKZbZUwER8V8=
X-Google-Smtp-Source: APXvYqyEuy4kvkbgBNCF1zQARF+H+MSyf/x3b0H3+IF5IOlbgKSSw5h6llJaNaTRCvCxy8pVlEw8pzwRvTjBSqDBtvs=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id
 y15mr6448632oti.121.1571391240977; 
 Fri, 18 Oct 2019 02:34:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:34:00
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-32-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-32-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:34:00 +0200
Message-ID: <CAL1e-=j78xuEhqdHaXn9StE=3M4VBx+yimosTMP6VtgCo0GuGw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 31/32] hw/pci-host: Rename incorrectly named
 'piix' as 'i440fx'
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
Content-Type: multipart/mixed; boundary="===============6419868081495348431=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6419868081495348431==
Content-Type: multipart/alternative; boundary="000000000000b8c01d05952c080b"

--000000000000b8c01d05952c080b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> We moved all the PIIX3 southbridge code out of hw/pci-host/piix.c,
> it now only contains i440FX northbridge code.
> Rename it to match the chipset modelled.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS                      | 2 +-
>  hw/i386/Kconfig                  | 2 +-
>  hw/pci-host/Kconfig              | 2 +-
>  hw/pci-host/Makefile.objs        | 2 +-
>  hw/pci-host/{piix.c =3D> i440fx.c} | 0
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename hw/pci-host/{piix.c =3D> i440fx.c} (100%)
>
>

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4845f47d93..1bc9959b8a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1225,7 +1225,7 @@ M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>  S: Supported
>  F: include/hw/i386/
>  F: hw/i386/
> -F: hw/pci-host/piix.c
> +F: hw/pci-host/i440fx.c
>  F: hw/pci-host/q35.c
>  F: hw/pci-host/pam.c
>  F: include/hw/pci-host/i440fx.h
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 589d75e26a..cfe94aede7 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -60,7 +60,7 @@ config I440FX
>      select PC_PCI
>      select PC_ACPI
>      select ACPI_SMBUS
> -    select PCI_PIIX
> +    select PCI_I440FX
>      select PIIX3
>      select IDE_PIIX
>      select DIMM
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 397043b289..b0aa8351c4 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -28,7 +28,7 @@ config PCI_SABRE
>      select PCI
>      bool
>
> -config PCI_PIIX
> +config PCI_I440FX
>      bool
>      select PCI
>      select PAM
> diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
> index a9cd3e022d..efd752b766 100644
> --- a/hw/pci-host/Makefile.objs
> +++ b/hw/pci-host/Makefile.objs
> @@ -13,7 +13,7 @@ common-obj-$(CONFIG_VERSATILE_PCI) +=3D versatile.o
>
>  common-obj-$(CONFIG_PCI_SABRE) +=3D sabre.o
>  common-obj-$(CONFIG_FULONG) +=3D bonito.o
> -common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o
> +common-obj-$(CONFIG_PCI_I440FX) +=3D i440fx.o
>  common-obj-$(CONFIG_PCI_EXPRESS_Q35) +=3D q35.o
>  common-obj-$(CONFIG_PCI_EXPRESS_GENERIC_BRIDGE) +=3D gpex.o
>  common-obj-$(CONFIG_PCI_EXPRESS_XILINX) +=3D xilinx-pcie.o
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/i440fx.c
> similarity index 100%
> rename from hw/pci-host/piix.c
> rename to hw/pci-host/i440fx.c
> --
> 2.21.0
>
>
>

--000000000000b8c01d05952c080b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
We moved all the PIIX3 southbridge code out of hw/pci-host/piix.c,<br>
it now only contains i440FX northbridge code.<br>
Rename it to match the chipset modelled.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/i386/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/pci-host/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 2 +-<br>
=C2=A0hw/pci-host/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0hw/pci-host/{piix.c =3D&gt; i440fx.c} | 0<br>
=C2=A05 files changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename hw/pci-host/{piix.c =3D&gt; i440fx.c} (100%)<br>
<br></blockquote><div><br></div><div><br></div><div><span style=3D"color:rg=
b(34,34,34);font-size:14px;line-height:22.1200008392334px">Reviewed-by: Ale=
ksandar Markovic &lt;</span><a href=3D"mailto:amarkovic@wavecomp.com" targe=
t=3D"_blank" style=3D"font-size:14px;line-height:22.1200008392334px">amarko=
vic@wavecomp.com</a><span style=3D"color:rgb(34,34,34);font-size:14px;line-=
height:22.1200008392334px">&gt;</span><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 4845f47d93..1bc9959b8a 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -1225,7 +1225,7 @@ M: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfe=
lbaum@gmail.com">marcel.apfelbaum@gmail.com</a>&gt;<br>
=C2=A0S: Supported<br>
=C2=A0F: include/hw/i386/<br>
=C2=A0F: hw/i386/<br>
-F: hw/pci-host/piix.c<br>
+F: hw/pci-host/i440fx.c<br>
=C2=A0F: hw/pci-host/q35.c<br>
=C2=A0F: hw/pci-host/pam.c<br>
=C2=A0F: include/hw/pci-host/i440fx.h<br>
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig<br>
index 589d75e26a..cfe94aede7 100644<br>
--- a/hw/i386/Kconfig<br>
+++ b/hw/i386/Kconfig<br>
@@ -60,7 +60,7 @@ config I440FX<br>
=C2=A0 =C2=A0 =C2=A0select PC_PCI<br>
=C2=A0 =C2=A0 =C2=A0select PC_ACPI<br>
=C2=A0 =C2=A0 =C2=A0select ACPI_SMBUS<br>
-=C2=A0 =C2=A0 select PCI_PIIX<br>
+=C2=A0 =C2=A0 select PCI_I440FX<br>
=C2=A0 =C2=A0 =C2=A0select PIIX3<br>
=C2=A0 =C2=A0 =C2=A0select IDE_PIIX<br>
=C2=A0 =C2=A0 =C2=A0select DIMM<br>
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig<br>
index 397043b289..b0aa8351c4 100644<br>
--- a/hw/pci-host/Kconfig<br>
+++ b/hw/pci-host/Kconfig<br>
@@ -28,7 +28,7 @@ config PCI_SABRE<br>
=C2=A0 =C2=A0 =C2=A0select PCI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
-config PCI_PIIX<br>
+config PCI_I440FX<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select PCI<br>
=C2=A0 =C2=A0 =C2=A0select PAM<br>
diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs<br>
index a9cd3e022d..efd752b766 100644<br>
--- a/hw/pci-host/Makefile.objs<br>
+++ b/hw/pci-host/Makefile.objs<br>
@@ -13,7 +13,7 @@ common-obj-$(CONFIG_VERSATILE_<wbr>PCI) +=3D versatile.o<=
br>
<br>
=C2=A0common-obj-$(CONFIG_PCI_SABRE) +=3D sabre.o<br>
=C2=A0common-obj-$(CONFIG_FULONG) +=3D bonito.o<br>
-common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o<br>
+common-obj-$(CONFIG_PCI_<wbr>I440FX) +=3D i440fx.o<br>
=C2=A0common-obj-$(CONFIG_PCI_<wbr>EXPRESS_Q35) +=3D q35.o<br>
=C2=A0common-obj-$(CONFIG_PCI_<wbr>EXPRESS_GENERIC_BRIDGE) +=3D gpex.o<br>
=C2=A0common-obj-$(CONFIG_PCI_<wbr>EXPRESS_XILINX) +=3D xilinx-pcie.o<br>
diff --git a/hw/pci-host/piix.c b/hw/pci-host/i440fx.c<br>
similarity index 100%<br>
rename from hw/pci-host/piix.c<br>
rename to hw/pci-host/i440fx.c<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000b8c01d05952c080b--


--===============6419868081495348431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6419868081495348431==--

