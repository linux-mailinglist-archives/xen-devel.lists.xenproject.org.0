Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF87DF195
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZcN-0005b3-DD; Mon, 21 Oct 2019 15:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMZcM-0005ax-0h
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:29:10 +0000
X-Inumbo-ID: 868de578-f417-11e9-beca-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 868de578-f417-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:29:09 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k25so11348583oiw.13
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Cq+pU2HOkkmvQFf/5dZGWynGkefz5WUL/SnFWQYjhM=;
 b=HcAqh8Nwadq8MXjwYcYAp19qE77hybS6PeXkS+k7tURYIFf6hz4xAuAVtFI4EYQKM9
 gNZLfV0UviwcPRCqh5+DHWTQ35HvqnBBqPnuhQ7/yyHd4mNoMUu6uidRU2Ojoxk8phWm
 rusEiLxaQwbX38xAkNnX4Siyld6OVd75xTYyao+GxbSdGO5XibCRWFKf1zFNWY0W680l
 CDSr65XJBi4/zOuETu+0CnySasoBmVIyNPvIIECrYOrCXDJaRTLLTEE+Ad6Krq1OEXFn
 o5fxmj1aPbWflBHCfRO5aPs1yLcr3nfF7R/ihOpS6y50x8Q5FU9+a+l20hwsKYTYiiyZ
 cNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Cq+pU2HOkkmvQFf/5dZGWynGkefz5WUL/SnFWQYjhM=;
 b=SnyQQKZjw5YXgtrhd220pNQqDpm2nm+vAN9KQaU9gRCtxfLLIb54ZUBrN24fm8855P
 Ol8qnTxyKg3Og5hbH3F/yVrnOaS7fPL9FH/fbyo/XhZiX52Nx9pE7SToGX4k9dMCse1f
 OMZQnVKxp0/MY9zn3e1m6SqkSGliHxda8+TEmHodkRznWvRb+mb1GM8QozI3pt9LANMx
 L74yadsJRwDH2CMdkKWjzvKzUV7TD/FEzQQse0Eyda8PGCDzaWNLMmTSNX1FhJuZudPD
 99eRcdE0IEidmEoMHu0E7BcEfENZAdlh7g6QF8aQ75MLZeYMHTQ4MX1JGoL0SUK7YlMZ
 r71w==
X-Gm-Message-State: APjAAAUH1MK4go7lBU8Q+/Pt5h+noPg7CFBtwsrN3RSzOo6jg0uTfWhf
 2VClMOlihJWDoLNf2WS3Pka3nkQ65vjFsYTL2GM=
X-Google-Smtp-Source: APXvYqxyVDVmFyvq3Dk/btVsi1DmsFmQ1ZcHUVte8Q9mhkWQ7rtAPzzSRC5LiD2MwG9GLXVwua8S4NjNb8Aay394hok=
X-Received: by 2002:aca:d18:: with SMTP id 24mr20580734oin.56.1571671748726;
 Mon, 21 Oct 2019 08:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-10-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-10-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 23:28:31 +0800
Message-ID: <CAKXe6SJmhwCX278GNoT6D_z8JJvhpS=abYAkS4VuXUu-wgR_eg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 09/20] hw/mips/mips_malta: Create IDE
 hard drive array dynamically
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
Content-Type: multipart/mixed; boundary="===============0314120794490980588=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0314120794490980588==
Content-Type: multipart/alternative; boundary="000000000000498f5905956d5852"

--000000000000498f5905956d5852
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:53=E5=86=99=E9=81=
=93=EF=BC=9A

> In the next commit we'll refactor the PIIX4 code out of
> mips_malta_init(). As a preliminary step, add the 'ide_drives'
> variable and create the drive array dynamically.
>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  hw/mips/mips_malta.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 528c34a1c3..774bb810f6 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1235,7 +1235,8 @@ void mips_malta_init(MachineState *machine)
>      int piix4_devfn;
>      I2CBus *smbus;
>      DriveInfo *dinfo;
> -    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
> +    const size_t ide_drives =3D MAX_IDE_BUS * MAX_IDE_DEVS;
> +    DriveInfo **hd;
>      int fl_idx =3D 0;
>      int be;
>
> @@ -1406,7 +1407,8 @@ void mips_malta_init(MachineState *machine)
>      pci_bus =3D gt64120_register(s->i8259);
>
>      /* Southbridge */
> -    ide_drive_get(hd, ARRAY_SIZE(hd));
> +    hd =3D g_new(DriveInfo *, ide_drives);
> +    ide_drive_get(hd, ide_drives);
>
>      pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
>                                            true, TYPE_PIIX4_PCI_DEVICE);
> @@ -1421,6 +1423,7 @@ void mips_malta_init(MachineState *machine)
>      }
>
>      pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);
> +    g_free(hd);
>      pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
>      smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
>                            isa_get_irq(NULL, 9), NULL, 0, NULL);
> --
> 2.21.0
>
>
>

--000000000000498f5905956d5852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:53=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">In the next commit we&#39;ll refactor the PIIX4 code out of<br>
mips_malta_init(). As a preliminary step, add the &#39;ide_drives&#39;<br>
variable and create the drive array dynamically.<br>
<br>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com"=
>liq3ea@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0hw/mips/mips_malta.c | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 528c34a1c3..774bb810f6 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -1235,7 +1235,8 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0int piix4_devfn;<br>
=C2=A0 =C2=A0 =C2=A0I2CBus *smbus;<br>
=C2=A0 =C2=A0 =C2=A0DriveInfo *dinfo;<br>
-=C2=A0 =C2=A0 DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];<br>
+=C2=A0 =C2=A0 const size_t ide_drives =3D MAX_IDE_BUS * MAX_IDE_DEVS;<br>
+=C2=A0 =C2=A0 DriveInfo **hd;<br>
=C2=A0 =C2=A0 =C2=A0int fl_idx =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int be;<br>
<br>
@@ -1406,7 +1407,8 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0pci_bus =3D gt64120_register(s-&gt;i8259);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Southbridge */<br>
-=C2=A0 =C2=A0 ide_drive_get(hd, ARRAY_SIZE(hd));<br>
+=C2=A0 =C2=A0 hd =3D g_new(DriveInfo *, ide_drives);<br>
+=C2=A0 =C2=A0 ide_drive_get(hd, ide_drives);<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci =3D pci_create_simple_multifunction(pci_bus, PCI_DE=
VFN(10, 0),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0true, TYPE_PIIX4_PCI_DEVICE);<br>
@@ -1421,6 +1423,7 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);<br>
+=C2=A0 =C2=A0 g_free(hd);<br>
=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, piix4_devfn + 2, &quot;piix4=
-usb-uhci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x110=
0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0isa_get_irq(NULL, 9), NULL, 0, NULL);<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000498f5905956d5852--


--===============0314120794490980588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0314120794490980588==--

