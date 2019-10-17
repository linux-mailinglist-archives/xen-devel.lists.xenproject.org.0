Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCDCDB0C9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7O6-0000gz-VD; Thu, 17 Oct 2019 15:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7O4-0000gs-Vd
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:08:25 +0000
X-Inumbo-ID: f6c88d3c-f0ef-11e9-bbab-bc764e2007e4
Received: from mail-ot1-x341.google.com (unknown [2607:f8b0:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6c88d3c-f0ef-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 15:08:24 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id y39so2175890ota.7
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Te8iL1ySJYsi3TwuCbc9+ISM/XmgmPuQ5oUDyGYi3wg=;
 b=NEM4mLafveESryGZ/FAFGhdi1XOz8bFhZxPxM57dcv3qHbRqOOYOrzJDTSUGVvd3Tw
 e6vFSebqteu0l5ktJJbFAY9PC8gtQrX+E1x32O7GNSoo0M7RGSzsy7lbtjJ54Alzkytf
 jfVAshPkNODfLrNha9VMh+4LJSf8OON4fLKHRu19uSSd8FQ32VCYrk6dwfepm3sWuyhi
 0YC55RcaBemNM5y41Lkb2M2VnSlD6I/DRu6+OEqxQ2OV4FormdjlR/a7icdDHDPXk5i2
 Gh04mQ9RBGapOYseI7bbP2V+VUfLV6mm5l1R3Hs2w9BHho/Ca13XPUWfCDLO2ZSG52mS
 A+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Te8iL1ySJYsi3TwuCbc9+ISM/XmgmPuQ5oUDyGYi3wg=;
 b=W5vP/Uvs8hriVNBEbRwGdy5luiXFqUoWj2yDTZ3pmzw3QrgIzcIl231ZH7SpL1kjBW
 sH+wSdWbqmI3PDmkQOZNfliFr3DGNlkyMrdgNboJz+Eq02ZJk8MHyjH1vaZfR6wJKFER
 02uw3Wn9EJXGARuj5koI7wXP2gTQVtwLricqr3J8j55mRF6Qt7Td0fyqsusUS6L9Hv7n
 4ugTHstMaiJQ3X0ddl6mkvX531IquwqG7fjpx4TnPaPqNOdhpi2MIEKRXelZRl3oxo/z
 e8PAOTxIYTcgmF6YnbASAMZ29YKo6iqg9U9VGG1hq8j1zSD8E/ZJMBj9PAiEVg07gbw+
 ouvQ==
X-Gm-Message-State: APjAAAX3ImnjZVqtWShFFDDiRj/qwB3V7L4t1IpM2snt2ldBIKH0cONw
 vM/JV482VHKtkagB5dK7xTgjcca3nFa94xZ9LFI=
X-Google-Smtp-Source: APXvYqxeE8bkHz+4rdTuiC2swckEAr5SOf51TdhrM8/a7iOdcX2s5a8wlbX5169LopVNHRUx7yKEwTxdYQ2NN2SxMfk=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr3283229otl.64.1571324903693; 
 Thu, 17 Oct 2019 08:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:08:22
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-14-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-14-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:08:22 +0200
Message-ID: <CAL1e-=iiea+spwyVRCjMsfz-B1PxGfYx_b1ter0yxF0K9L1ghA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 13/32] piix4: convert reset function to QOM
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
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============4782500622258535057=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4782500622258535057==
Content-Type: multipart/alternative; boundary="000000000000b6214d05951c9610"

--000000000000b6214d05951c9610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20180106153730.30313-15-hpoussin@reactos.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index c3a2bd0d70..8998b0ca47 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -48,10 +48,10 @@ typedef struct PIIX4State {
>  #define PIIX4_PCI_DEVICE(obj) \
>      OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
>
> -static void piix4_reset(void *opaque)
> +static void piix4_reset(DeviceState *dev)
>  {
> -    PIIX4State *d =3D opaque;
> -    uint8_t *pci_conf =3D d->dev.config;
> +    PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
> +    uint8_t *pci_conf =3D s->dev.config;
>
>      pci_conf[0x04] =3D 0x07; // master, memory and I/O
>      pci_conf[0x05] =3D 0x00;
> @@ -165,7 +165,6 @@ static void piix4_realize(PCIDevice *pci_dev, Error
> **errp)
>      isa_bus_irqs(isa_bus, s->isa);
>
>      piix4_dev =3D pci_dev;
> -    qemu_register_reset(piix4_reset, s);
>  }
>
>  static void piix4_class_init(ObjectClass *klass, void *data)
> @@ -177,6 +176,7 @@ static void piix4_class_init(ObjectClass *klass, void
> *data)
>      k->vendor_id =3D PCI_VENDOR_ID_INTEL;
>      k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB_0;
>      k->class_id =3D PCI_CLASS_BRIDGE_ISA;
> +    dc->reset =3D piix4_reset;
>      dc->desc =3D "ISA bridge";
>      dc->vmsd =3D &vmstate_piix4;
>      /*
> --
> 2.21.0
>
>
>

--000000000000b6214d05951c9610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20180106153730.30313-15-hpoussin@reactos.=
org">20180106153730.30313-15-hpoussin@reactos.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br></blockquote><div><br></div><div id=3D"cvcmsg_16dbfeb33c93ed97" class=
=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0px;m=
argin-bottom:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_16db=
feb33c93ed97"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div clas=
s=3D"Ni"><div class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: Alek=
sandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_bl=
ank">amarkovic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div></di=
v><div style=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" tabin=
dex=3D"0"><div class=3D"V j hf"></div></div></div><div style=3D"clear:both"=
></div></div></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=3D=
"yh" style=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16dbfe=
cd588da1f7"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcreply_1=
6dbfecd588da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=3D"V=
 j td"></div></div></div></div></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index c3a2bd0d70..8998b0ca47 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -48,10 +48,10 @@ typedef struct PIIX4State {<br>
=C2=A0#define PIIX4_PCI_DEVICE(obj) \<br>
=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)<=
br>
<br>
-static void piix4_reset(void *opaque)<br>
+static void piix4_reset(DeviceState *dev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PIIX4State *d =3D opaque;<br>
-=C2=A0 =C2=A0 uint8_t *pci_conf =3D d-&gt;dev.config;<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);<br>
+=C2=A0 =C2=A0 uint8_t *pci_conf =3D s-&gt;dev.config;<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x04] =3D 0x07; // master, memory and I/O<br>
=C2=A0 =C2=A0 =C2=A0pci_conf[0x05] =3D 0x00;<br>
@@ -165,7 +165,6 @@ static void piix4_realize(PCIDevice *pci_dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0isa_bus_irqs(isa_bus, s-&gt;isa);<br>
<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D pci_dev;<br>
-=C2=A0 =C2=A0 qemu_register_reset(piix4_<wbr>reset, s);<br>
=C2=A0}<br>
<br>
=C2=A0static void piix4_class_init(ObjectClass *klass, void *data)<br>
@@ -177,6 +176,7 @@ static void piix4_class_init(ObjectClass *klass, void *=
data)<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_INTEL;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_INTEL_82371AB_0;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;class_id =3D PCI_CLASS_BRIDGE_ISA;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D piix4_reset;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;ISA bridge&quot;;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_piix4;<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000b6214d05951c9610--


--===============4782500622258535057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4782500622258535057==--

