Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D918ADB0B9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7LS-0000On-EH; Thu, 17 Oct 2019 15:05:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7LQ-0000Oa-IN
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:05:40 +0000
X-Inumbo-ID: 9473087e-f0ef-11e9-a531-bc764e2007e4
Received: from mail-ot1-x341.google.com (unknown [2607:f8b0:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9473087e-f0ef-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 15:05:39 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id c10so2160533otd.9
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7LaYtff+/Kv18UTa0H5mwJqrAwMfKjyjGBjo3y9guK8=;
 b=hnLIZGf9Dq0UjT8iQADDZhHiB/dTLe+xNZ0M0PCVmPtXB0M7+h6taH/reUqIqD06H1
 QomSxUvW2hlCmRDTMB3RZ9W7qfpYqSuvEQP+RqweQFP7A8n6mJxPjaL1VSBmf4iQXkyw
 o8pxkJX9icbbQJERT+uk/wSZBN6zKIREbgk8Q71//ymdgZS1Sh8Jy4/996SkbzkP/NKG
 WWBf4tY0eP3XCL1dOEOB36L0ClTvK3F9KyZLY5TCrtaMhh1RoUnCniZl/9nv1D5MVs+2
 b70dWIRhyTm6wIz0ORTAGFb9pfFT7EEknYNgPa8imJrQqH3mKHkr8SQ6V0/iaza7vokg
 VzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7LaYtff+/Kv18UTa0H5mwJqrAwMfKjyjGBjo3y9guK8=;
 b=JVIDJ6sw5FSnllhWDacGqp210RhTkUTXdTRFUo4Y6aYQ4FhPmjMyBlwpWxUL1DDdwD
 ICx0WtSq8fkba7s/a4t5LzlY3fI39C5PwESCQxXr2Fy3UQLvxSCVYmuWV2U2Z4hbwFCy
 s/Tkttfk6bEQXdR9lvUPGYM2fvr68zSJl0K5QCIhbKou30Gw3VNZ4TfcZuxrYq+/zAiG
 BRcyztAqe2tDgAlSQKNCH5LzXx3kYnq67odgmOoPBXhkFEP/2EsfGWaRift/gPcw64Yk
 FIH2LaHbacnJGJrV9M9TuGHHsfBdkd7LJEIphN9JUDPyxHpOWNRYMzZuc9PjbtQnxzwq
 +5dA==
X-Gm-Message-State: APjAAAXO05/5M50Lwo9P5kTWQVqFCX6wCnIWKVU1afnHNS8+lDZZQNo2
 k5HKQrpfYHE0/V3yPpcjVbmfDaUUT3uIuqL/AFQ=
X-Google-Smtp-Source: APXvYqw+ceKkhpC+kRj5EkQDhwPRisBC8MFzHPsh+ib7vBZ7LB6XkyVQ1KCb7w7u5pI7mDXPxrKh6Im+jAjz8xlJQzE=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id
 y15mr3255659oti.121.1571324738696; 
 Thu, 17 Oct 2019 08:05:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:05:37
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-10-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-10-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:05:37 +0200
Message-ID: <CAL1e-=hSzG5F7hjsRgo_y6M0aCoJ0Uj6vR86nWkf=aQ2S3Yz7w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 09/32] piix4: add Reset Control Register
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
Content-Type: multipart/mixed; boundary="===============6397730534580838892=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6397730534580838892==
Content-Type: multipart/alternative; boundary="000000000000e079fd05951c8c13"

--000000000000e079fd05951c8c13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> The RCR I/O port (0xcf9) is used to generate a hard reset or a soft reset=
.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-7-hpoussin@reactos.org>
> [PMD: rebased, updated includes]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 4202243e41..6e2d9b9774 100644
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
> @@ -29,11 +30,16 @@
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/reset.h"
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
> @@ -88,6 +94,34 @@ static const VMStateDescription vmstate_piix4 =3D {
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
> +    s->rcr =3D val & 2; /* keep System Reset type only */
> +}
> +
> +static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int
> len)
> +{
> +    PIIX4State *s =3D opaque;
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
>  static void piix4_realize(PCIDevice *pci_dev, Error **errp)
>  {
>      DeviceState *dev =3D DEVICE(pci_dev);
> @@ -97,6 +131,12 @@ static void piix4_realize(PCIDevice *pci_dev, Error
> **errp)
>                       pci_address_space_io(pci_dev), errp)) {
>          return;
>      }
> +
> +    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
> +                          "reset-control", 1);
> +    memory_region_add_subregion_overlap(pci_address_space_io(pci_dev),
> 0xcf9,
> +                                        &s->rcr_mem, 1);
> +
>      piix4_dev =3D pci_dev;
>      qemu_register_reset(piix4_reset, s);
>  }
> --
> 2.21.0
>
>
>

--000000000000e079fd05951c8c13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
The RCR I/O port (0xcf9) is used to generate a hard reset or a soft reset.<=
br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-7-hpoussin@reactos.o=
rg">20171216090228.28505-7-hpoussin@reactos.org</a>&gt;<br>
[PMD: rebased, updated includes]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c | 40 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A01 file changed, 40 insertions(+)<br>
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
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 4202243e41..6e2d9b9774 100644<br>
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
@@ -29,11 +30,16 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
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
@@ -88,6 +94,34 @@ static const VMStateDescription vmstate_piix4 =3D {<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(<wbr>SHUTDOWN_CAUSE_=
GUEST_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 s-&gt;rcr =3D val &amp; 2; /* keep System Reset type only */=
<br>
+}<br>
+<br>
+static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len=
)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
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
=C2=A0static void piix4_realize(PCIDevice *pci_dev, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceState *dev =3D DEVICE(pci_dev);<br>
@@ -97,6 +131,12 @@ static void piix4_realize(PCIDevice *pci_dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pci_address_space_io(pci_dev), errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;rcr_<wbr>mem, OBJECT(dev), =
&amp;piix4_rcr_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;reset-control&quot;, 1);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion_<wbr>overlap(pci_address_space_i=
o(<wbr>pci_dev), 0xcf9,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&=
gt;rcr_mem, 1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D pci_dev;<br>
=C2=A0 =C2=A0 =C2=A0qemu_register_reset(piix4_<wbr>reset, s);<br>
=C2=A0}<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000e079fd05951c8c13--


--===============6397730534580838892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6397730534580838892==--

