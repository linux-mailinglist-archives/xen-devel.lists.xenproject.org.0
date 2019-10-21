Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F761DE31F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 06:21:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMP8l-00069W-CN; Mon, 21 Oct 2019 04:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMMSS-0000Kd-Fd
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 01:26:04 +0000
X-Inumbo-ID: bedefbea-f3a1-11e9-8aca-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bedefbea-f3a1-11e9-8aca-bc764e2007e4;
 Mon, 21 Oct 2019 01:26:03 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 67so9603760oto.3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Oct 2019 18:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bO2YErnw83aMmUMvYqh7FWJix6R/c/U/xMxZjC1Pm2E=;
 b=Rr7HrPL5fkrwZVAf+xGhqY+IpW9v5mK3nkTl0cx0d8Eq2waiLlJLVxCNZj2mxBcC6k
 fkhyTxaOmpLnZXi46wUk8BizdWSnOp7pRmBGxAyajgnFk6ikteqTKy/XfCKJJP3L0OTK
 n3nHFt9nQkCbnx/s/NBDf9WJNB8o/ap2VM5Ek3cerhiPBZ4CVIoGTh7VRI0FC8nID0Y+
 36HqYuzK3xnBdY6zb3zOqpdRIan/WH9aWJYgcaU8076owUn6u0O1xckGFJblmdTeCWPe
 l8grDu4HW6szObsx+pcra2FDMEfYFLoC5Mn5miqdvsMF5kugHGGl3R2K8GEmztOtry6v
 Ybsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bO2YErnw83aMmUMvYqh7FWJix6R/c/U/xMxZjC1Pm2E=;
 b=FMjqg8vuHXyZs6+FKV/hziJjlKNi1G+3r9968ZeSl40AeljTEqM+PU1JAS/pohQjnY
 Cm/4IXZ9G0AvXgTBdy9k9tCCKlm3WWVVtUg3KOZBC142Hedwm3zGntntlNn8PjIHfvzN
 5T2ROkYEdxf5KjN4dopmsuZKLqGcV8lmX2w62qdMJW7h0LaIt8/m+e+HpRvuWv1zZbqa
 CLACQfZ8jNETHEAp0QSm0Id3LnFFCn8J4bsehYYWmHcZRsJ6MeLsK+OI6Ri0RTws/SFF
 8lwczcnYe3ZtTE67jxtZftNbshsfCMikXgOp8eVjWYFW+El+r1t9LlHW6nwxxK87jPg8
 qKeA==
X-Gm-Message-State: APjAAAVUL1ZYeDuB72V4Y52uEDNcQJDG6GbJ1zJR7bEGkzG/IzTseqxe
 vrmuFs1fhkR9DwPdpQ/pRtGqlE8z1gKreJlmpac=
X-Google-Smtp-Source: APXvYqyH+hVNJulY3xClZobG5K49OV/GwgIf315EUTBGXs7JYYBrQQigP1UwnpW++Fn0p83oUnaqDs3ZPfJAQF5pjhE=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr14753485otr.194.1571621162497; 
 Sun, 20 Oct 2019 18:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-3-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-3-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 09:25:26 +0800
Message-ID: <CAKXe6SKQGYj+N04An+t5sP4jVkpEpmmGGfpZxb5VAV+w3owsBw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-Mailman-Approved-At: Mon, 21 Oct 2019 04:17:53 +0000
Subject: Re: [Xen-devel] [PATCH v2 02/20] piix4: Add the Reset Control
 Register
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
Content-Type: multipart/mixed; boundary="===============6391121533294836314=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6391121533294836314==
Content-Type: multipart/alternative; boundary="0000000000001cba5805956191a8"

--0000000000001cba5805956191a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:50=E5=86=99=E9=81=
=93=EF=BC=9A

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> The RCR I/O port (0xcf9) is used to generate a hard reset or a soft reset=
.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-7-hpoussin@reactos.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> [PMD: rebased, updated includes]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 890d999abf..d0b18e0586 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -2,6 +2,7 @@
>   * QEMU PIIX4 PCI Bridge Emulation
>   *
>   * Copyright (c) 2006 Fabrice Bellard
> + * Copyright (c) 2018 Herv=C3=A9 Poussineau
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining
> a copy
>   * of this software and associated documentation files (the "Software"),
> to deal
> @@ -28,11 +29,17 @@
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
>
>  PCIDevice *piix4_dev;
>
>  typedef struct PIIX4State {
>      PCIDevice dev;
> +
> +    /* Reset Control Register */
> +    MemoryRegion rcr_mem;
> +    uint8_t rcr;
>  } PIIX4State;
>
>  #define TYPE_PIIX4_PCI_DEVICE "PIIX4"
> @@ -87,15 +94,51 @@ static const VMStateDescription vmstate_piix4 =3D {
>      }
>  };
>
> +static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
> +                            unsigned int len)
> +{
> +    PIIX4State *s =3D opaque;
> +
> +    if (val & 4) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        return;
> +    }
> +
> +    s->rcr =3D val & 2; /* keep System Reset type only */
> +}
> +
> +static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int
> len)
> +{
> +    PIIX4State *s =3D opaque;
> +
> +    return s->rcr;
> +}
> +
> +static const MemoryRegionOps piix4_rcr_ops =3D {
> +    .read =3D piix4_rcr_read,
> +    .write =3D piix4_rcr_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 1,
> +    },
> +};
> +
>  static void piix4_realize(PCIDevice *dev, Error **errp)
>  {
> -    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
> +    PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
>
> -    if (!isa_bus_new(DEVICE(d), pci_address_space(dev),
> +    if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),
>                       pci_address_space_io(dev), errp)) {
>          return;
>      }
> -    piix4_dev =3D &d->dev;
> +
> +    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
> +                          "reset-control", 1);
> +    memory_region_add_subregion_overlap(pci_address_space_io(dev), 0xcf9=
,
>


Can we use 'RCR_IOPORT' instead of constant value here? Also don't see this
change
in later patches of this seirals.
Anyway

Reviewed-by: Li Qiang <liq3ea@gmail.com>

Thanks,
Li Qiang


> +                                        &s->rcr_mem, 1);
> +
> +    piix4_dev =3D dev;
>  }
>
>  int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
> --
> 2.21.0
>
>
>

--0000000000001cba5805956191a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:50=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.or=
g" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
<br>
The RCR I/O port (0xcf9) is used to generate a hard reset or a soft reset.<=
br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-7-hpoussin@reactos.o=
rg" target=3D"_blank">20171216090228.28505-7-hpoussin@reactos.org</a>&gt;<b=
r>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
[PMD: rebased, updated includes]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---=
<br>
=C2=A01 file changed, 46 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 890d999abf..d0b18e0586 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -2,6 +2,7 @@<br>
=C2=A0 * QEMU PIIX4 PCI Bridge Emulation<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2006 Fabrice Bellard<br>
+ * Copyright (c) 2018 Herv=C3=A9 Poussineau<br>
=C2=A0 *<br>
=C2=A0 * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
=C2=A0 * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
@@ -28,11 +29,17 @@<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;sysemu/reset.h&quot;<br>
+#include &quot;sysemu/runstate.h&quot;<br>
<br>
=C2=A0PCIDevice *piix4_dev;<br>
<br>
=C2=A0typedef struct PIIX4State {<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice dev;<br>
+<br>
+=C2=A0 =C2=A0 /* Reset Control Register */<br>
+=C2=A0 =C2=A0 MemoryRegion rcr_mem;<br>
+=C2=A0 =C2=A0 uint8_t rcr;<br>
=C2=A0} PIIX4State;<br>
<br>
=C2=A0#define TYPE_PIIX4_PCI_DEVICE &quot;PIIX4&quot;<br>
@@ -87,15 +94,51 @@ static const VMStateDescription vmstate_piix4 =3D {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
+static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int len)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 if (val &amp; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST=
_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;rcr =3D val &amp; 2; /* keep System Reset type only */=
<br>
+}<br>
+<br>
+static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len=
)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 return s-&gt;rcr;<br>
+}<br>
+<br>
+static const MemoryRegionOps piix4_rcr_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D piix4_rcr_read,<br>
+=C2=A0 =C2=A0 .write =3D piix4_rcr_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .impl =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 1,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
=C2=A0static void piix4_realize(PCIDevice *dev, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);<br>
<br>
-=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(d), pci_address_space(dev),<br>
+=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pci_address_space_io(dev), errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 piix4_dev =3D &amp;d-&gt;dev;<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;rcr_mem, OBJECT(dev), &amp;=
piix4_rcr_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;reset-control&quot;, 1);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion_overlap(pci_address_space_io(dev=
), 0xcf9,<br></blockquote><div><br></div><div><br></div><div>Can we use &#3=
9;RCR_IOPORT&#39; instead of constant value here? Also don&#39;t see this c=
hange</div><div>in later patches of this seirals.</div><div>Anyway</div><di=
v><br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.c=
om">liq3ea@gmail.com</a>&gt;<br></div><div><br></div><div>Thanks,</div><div=
>Li Qiang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&=
gt;rcr_mem, 1);<br>
+<br>
+=C2=A0 =C2=A0 piix4_dev =3D dev;<br>
=C2=A0}<br>
<br>
=C2=A0int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000001cba5805956191a8--


--===============6391121533294836314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6391121533294836314==--

