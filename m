Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF31DB053
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:45:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL6yl-0005vi-7u; Thu, 17 Oct 2019 14:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL6yj-0005va-QV
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:42:13 +0000
X-Inumbo-ID: 4e493bc8-f0ec-11e9-a531-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e493bc8-f0ec-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 14:42:12 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m19so2122552otp.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=p8zu+JQ/8E+9vjBm96Xk867oTxMsxhFQ5UrgW8e25eQ=;
 b=bbKFAZmED1JgheNt9E4w2kjZfXfe2qTLpTR6OR1z8kvDaCQoHwMOsjxXy5m12bcWi4
 eGm9+kGYfPw0XDLnkadiiPx3y+6wSaqNKlhU47TJW+CeMiwL7SSImLP1TgjsWIGIVCCi
 O+fMjOR0v+ksMevKOTdQBh+xKJGpkOHiWaFmzqz8T1E87uwREkiBtTV8be5qDH4RTZoy
 sbjGjjoAvAp1KFz3RwxGvKmhY34kmcOXPy9PLiW7bGJZ0IzvAzOizCuxpyFivui+OwLG
 AsELCbFWuNaPRU/m5IZzF+RsSNE7jRGygGrkDujSh0KOHqzI1Y28sJCN+ujiVqSQZxJS
 MxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=p8zu+JQ/8E+9vjBm96Xk867oTxMsxhFQ5UrgW8e25eQ=;
 b=PBGHUd6RUFJjaccTmEB26PjYMnNxR71ICI/4v6s+NDNIf7HEBb+ZwjiDgtWRS/RPim
 1txoJfQshziS2d+wNsWGZIBnqIetlhCJIWciQfvTqIWD1NIHdBW0qxPUMgTPBFyf7uXR
 C7N+CXyttHNxWuRJ6BMQBc1Jo9zL8M267CPY1S49zZ05mhzOkSRUn75GV1UORIeNo84u
 wRsaVTCT8OuAHtWix0nJHegAP/peAqO/AT/XS/Lno3bEl/XBiN1VX+UBzsFNE91emSaI
 4Q63f9/9uze4tS9w9Ps5ecvoDjENGqNj2tXAKkMatXrEyYaCfvt9iAszSnGsETLTxjFX
 a5yA==
X-Gm-Message-State: APjAAAV5XkCHSfD2MLYAecFblSXVXrUtRSBSFFt9YH6nysn9sxHQrF+R
 n5l7w7rZiPJukfPdEFaxJhu9Qv8wVGFtdZBjp+U=
X-Google-Smtp-Source: APXvYqwSUgWgjBI8SKKAz4m044GxQLiKQ1XAx4ZgjkY3/hA7u2GAvB7R9pqY4g3qPZR41nQDBZxzQdQ9oH2bXxCaSm0=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr3287342oth.306.1571323332516; 
 Thu, 17 Oct 2019 07:42:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:42:11
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-15-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-15-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:42:11 +0200
Message-ID: <CAL1e-=gk7HdGLQo9yqNoeMXqyyfOqaKuK1XSz+CafkGwAkuktw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 14/32] piix4: add a i8257 dma controller as
 specified in datasheet
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
Content-Type: multipart/mixed; boundary="===============5763184304370278740=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5763184304370278740==
Content-Type: multipart/alternative; boundary="0000000000000fdf3a05951c3981"

--0000000000000fdf3a05951c3981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Remove i8257 instanciated in malta board, to not have it twice.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-9-hpoussin@reactos.org>
> [PMD: rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c       | 4 ++++
>  hw/mips/mips_malta.c | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>




> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 8998b0ca47..1bc91b590c 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -29,6 +29,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
> +#include "hw/dma/i8257.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -164,6 +165,9 @@ static void piix4_realize(PCIDevice *pci_dev, Error
> **errp)
>      /* initialize ISA irqs */
>      isa_bus_irqs(isa_bus, s->isa);
>
> +    /* DMA */
> +    i8257_dma_init(isa_bus, 0);
> +
>      piix4_dev =3D pci_dev;
>  }
>
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index e499b7a6bb..df247177ca 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -28,7 +28,6 @@
>  #include "cpu.h"
>  #include "hw/i386/pc.h"
>  #include "hw/isa/superio.h"
> -#include "hw/dma/i8257.h"
>  #include "hw/char/serial.h"
>  #include "net/net.h"
>  #include "hw/boards.h"
> @@ -1430,7 +1429,6 @@ void mips_malta_init(MachineState *machine)
>      smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
>                            isa_get_irq(NULL, 9), NULL, 0, NULL);
>      pit =3D i8254_pit_init(isa_bus, 0x40, 0, NULL);
> -    i8257_dma_init(isa_bus, 0);
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>
>      /* generate SPD EEPROM data */
> --
> 2.21.0
>
>
>

--0000000000000fdf3a05951c3981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
Remove i8257 instanciated in malta board, to not have it twice.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-9-hpoussin@reactos.o=
rg">20171216090228.28505-9-hpoussin@reactos.org</a>&gt;<br>
[PMD: rebased]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0hw/mips/mips_malta.c | 2 --<br>
=C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
<br></blockquote><div><div id=3D"cvcmsg_16dbfeb33c93ed97" class=3D"yh  " st=
yle=3D"border-top-left-radius:0px;border-top-right-radius:0px;margin-bottom=
:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_16dbfeb33c93ed97=
"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div class=3D"Ni"><di=
v class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: Aleksandar Marko=
vic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_blank">amarkov=
ic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div></div><div style=
=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" tabindex=3D"0"><d=
iv class=3D"V j hf"></div></div></div><div style=3D"clear:both"></div></div=
></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=3D"yh" style=
=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16dbfecd588da1f7=
"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcreply_16dbfecd588=
da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=3D"V j td"></d=
iv></div></div></div></div></div><div><br></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 8998b0ca47..1bc91b590c 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/dma/i8257.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
@@ -164,6 +165,9 @@ static void piix4_realize(PCIDevice *pci_dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0/* initialize ISA irqs */<br>
=C2=A0 =C2=A0 =C2=A0isa_bus_irqs(isa_bus, s-&gt;isa);<br>
<br>
+=C2=A0 =C2=A0 /* DMA */<br>
+=C2=A0 =C2=A0 i8257_dma_init(isa_bus, 0);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D pci_dev;<br>
=C2=A0}<br>
<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index e499b7a6bb..df247177ca 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -28,7 +28,6 @@<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/isa/superio.h&quot;<br>
-#include &quot;hw/dma/i8257.h&quot;<br>
=C2=A0#include &quot;hw/char/serial.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
@@ -1430,7 +1429,6 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x110=
0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0isa_get_irq(NULL, 9), NULL, 0, NULL);<br>
=C2=A0 =C2=A0 =C2=A0pit =3D i8254_pit_init(isa_bus, 0x40, 0, NULL);<br>
-=C2=A0 =C2=A0 i8257_dma_init(isa_bus, 0);<br>
=C2=A0 =C2=A0 =C2=A0mc146818_rtc_init(isa_bus, 2000, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* generate SPD EEPROM data */<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000000fdf3a05951c3981--


--===============5763184304370278740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5763184304370278740==--

