Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCDDB072
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL74s-0006f4-RP; Thu, 17 Oct 2019 14:48:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL74r-0006eu-OO
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:48:33 +0000
X-Inumbo-ID: 30cbbce6-f0ed-11e9-bbab-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30cbbce6-f0ed-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 14:48:32 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 89so2079726oth.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BZXCpUhCfREGP5Y5KkAXoKF3LwyNMJ+QHt0WBiLCltg=;
 b=DM1Q7iKuNZzLcB9ccnA0BEgRoM0jR0JeBYu/RzjrNvLEVJwMDPOPigJI+cdh+rmUQ+
 uOKjuweWXQu4CoHoIa401FbZaI/L4IBYYOzdQinEHqW5Y6wA3yKN+SNrY92F19slIX/w
 ozzdo1VH42qrWXz0OJJe4oowNNJRnEnsEF3V6CCr1UnvcpPIsT9bRLTvyp8iTOZf+z7n
 u1RWk8OVERQdTBRSUCqU434UIQo4GqtSZdOaGDegv2u52Zt9XiP19h1pulR0F3HSEozX
 8tbJQzjcADbpE2ZEPhLIOIEzVDt6aX2P42RuyNk6CTyVh3gP0NFjf0pSRHv3/5XOgt7v
 QM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BZXCpUhCfREGP5Y5KkAXoKF3LwyNMJ+QHt0WBiLCltg=;
 b=hbbn6sTKksNWj0xUS9xEpqTJsubm40izDGoMXV5g7EhjGgoZQTRVn5NAjDiq2QbFpd
 2ugklMpQMto8Sb+jfhwjMX5/4nw3M8j0XusK+73FUBkVkg8oesrRm+bwGryRQH4C5Kq9
 Llog01QGBgQQDc54PIazFCbtb+50IiYrI+97xWtxPjV8JQG3qal93ex5/KtvWVdkZbeO
 h2Q7hcgMgaC2JcqBqVVoIitm3zDpRSZkiab1VWhLaJnpkT48EJLK8LBD46KR9TPH0rus
 wYYb5/+aa1EyVbiP5gppwcYf/ccHLo29c9p6SwWAl8kO4Z2AY9XfVlJisECh1kboCaaU
 6VRA==
X-Gm-Message-State: APjAAAVc1lhCm5Co+Dfoe+7TVvvru/karuab0AY6APWscS1mFEzYGEen
 nFRyIsmdc0g49IhKXKQjxzFMW5PMgh6EJFSFXBw=
X-Google-Smtp-Source: APXvYqxMK/K/YzvdlRI8mVs2l2zzJzC7DdEch6aYxQvfdnwiXmrxc5nb5dJg+6YuO8cex9dM1ylTiHKHI+A4RyJWauo=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr3311879oth.306.1571323712558; 
 Thu, 17 Oct 2019 07:48:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:48:32
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-13-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-13-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:48:32 +0200
Message-ID: <CAL1e-=h4AAo13+J8z2rfq6VeTgqE=ZekMRigJZ7eGAYdRCGSWA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 12/32] piix4: rename PIIX4 object to
 piix4-isa
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
Content-Type: multipart/mixed; boundary="===============6794375938303523231=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6794375938303523231==
Content-Type: multipart/alternative; boundary="000000000000b6d98905951c4f3a"

--000000000000b6d98905951c4f3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Other piix4 parts are already named piix4-ide and piix4-usb-uhci.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-15-hpoussin@reactos.org>
> [PMD: rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c       | 1 -
>  hw/mips/mips_malta.c | 2 +-
>  include/hw/isa/isa.h | 2 ++
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 1cfc51335a..c3a2bd0d70 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -45,7 +45,6 @@ typedef struct PIIX4State {
>      uint8_t rcr;
>  } PIIX4State;
>
> -#define TYPE_PIIX4_PCI_DEVICE "PIIX4"
>  #define PIIX4_PCI_DEVICE(obj) \
>      OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
>
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 7d25ab6c23..e499b7a6bb 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1414,7 +1414,7 @@ void mips_malta_init(MachineState *machine)
>      ide_drive_get(hd, ARRAY_SIZE(hd));
>
>      pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> -                                          true, "PIIX4");
> +                                          true, TYPE_PIIX4_PCI_DEVICE);
>      dev =3D DEVICE(pci);
>      isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>      piix4_devfn =3D pci->devfn;
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 018ada4f6f..79f703fd6c 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -147,4 +147,6 @@ static inline ISABus *isa_bus_from_device(ISADevice *=
d)
>      return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
>  }
>
> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> +
>  #endif
> --
> 2.21.0
>
>
>

--000000000000b6d98905951c4f3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
Other piix4 parts are already named piix4-ide and piix4-usb-uhci.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org">f4bug@amsat.org</a>&gt;<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-15-hpoussin@reactos.=
org">20171216090228.28505-15-hpoussin@reactos.org</a>&gt;<br>
[PMD: rebased]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/mips/mips_malta.c | 2 +-<br>
=C2=A0include/hw/isa/isa.h | 2 ++<br>
=C2=A03 files changed, 3 insertions(+), 2 deletions(-)<br>
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
=3D"V j td"></div></div></div></div></div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 1cfc51335a..c3a2bd0d70 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -45,7 +45,6 @@ typedef struct PIIX4State {<br>
=C2=A0 =C2=A0 =C2=A0uint8_t rcr;<br>
=C2=A0} PIIX4State;<br>
<br>
-#define TYPE_PIIX4_PCI_DEVICE &quot;PIIX4&quot;<br>
=C2=A0#define PIIX4_PCI_DEVICE(obj) \<br>
=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)<=
br>
<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 7d25ab6c23..e499b7a6bb 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -1414,7 +1414,7 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0ide_drive_get(hd, ARRAY_SIZE(hd));<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci =3D pci_create_simple_<wbr>multifunction(pci_bus, P=
CI_DEVFN(10, 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, &quot;PIIX4&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, TYPE_PIIX4_PCI_DEVICE);<br>
=C2=A0 =C2=A0 =C2=A0dev =3D DEVICE(pci);<br>
=C2=A0 =C2=A0 =C2=A0isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>dev, &quot;=
isa.0&quot;));<br>
=C2=A0 =C2=A0 =C2=A0piix4_devfn =3D pci-&gt;devfn;<br>
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h<br>
index 018ada4f6f..79f703fd6c 100644<br>
--- a/include/hw/isa/isa.h<br>
+++ b/include/hw/isa/isa.h<br>
@@ -147,4 +147,6 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)=
<br>
=C2=A0 =C2=A0 =C2=A0return ISA_BUS(qdev_get_parent_bus(<wbr>DEVICE(d)));<br=
>
=C2=A0}<br>
<br>
+#define TYPE_PIIX4_PCI_DEVICE &quot;piix4-isa&quot;<br>
+<br>
=C2=A0#endif<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000b6d98905951c4f3a--


--===============6794375938303523231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6794375938303523231==--

