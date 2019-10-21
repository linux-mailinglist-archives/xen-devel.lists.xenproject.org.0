Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC5DF151
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:28:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZZK-0005Ml-KW; Mon, 21 Oct 2019 15:26:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMZZJ-0005Mg-L6
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:26:01 +0000
X-Inumbo-ID: 15f8371e-f417-11e9-a531-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15f8371e-f417-11e9-a531-bc764e2007e4;
 Mon, 21 Oct 2019 15:26:00 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b16so537065otk.9
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuNxnGWn8X0PxSvJlJqm2uFtgDgOD38CuqTHbrJoTSY=;
 b=aa+EFLP6jCMuv0fhI0twVdL9qcfu+V8QKOOmkXTXx/qp1CVxud/rgNpdNnE30dhHyw
 Uv9xtst/Vaf5RgvfRzNWsf6J2jlcNMBadOCBeRH50FqE+zSvSBY55hzF6+Ah4EBnAogc
 eF9/rSw6LkxAo/VV42y+7q7Vo6ADwT3cf/RPJEb2z1ce6qoeC0JZN2TjoZdeJDHYTqyH
 96jckxIa/fsxuvzblP3ngStbycys5c7pFSgwny6jlro9bB51vrlycITG/qbIGGiA7qI7
 73bfsS4ISNEQlF4PzF79p1VtvCmdfurWjXZa6RgQwrBu0dih3PK88yhSvQrB1VqiRLM2
 XzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuNxnGWn8X0PxSvJlJqm2uFtgDgOD38CuqTHbrJoTSY=;
 b=LynNOCTHYUrBmj9LCxKL7cf1bgRwUOTn/J6T8R+f7pSdeZ8lFCq0YkbrMR/SpUcrv/
 +oSshpO/ONVfGT7KZZu+LLPU4WEHqy7gYxJb+RHAhRD+TNirst7Zbi/2ky6ddNKOENWE
 DMlvEeK+y55U+67oYLuQWhH43r5Hs1dOSSsggzma+mtJsAgm0vFQzNgFP7dyJAjGIphr
 GqPnQdaOsl1119zshrUFEEl3YqTAA5bBH8WKMXGqj0Jcz3iTBuD3IXbVvyYc5SNTO4Tq
 CI71cvf14XIkdekV1ToonWZKgcLS9RjNMSqwwSfbvkg+GSEJiAJ+YgECL6kU+YqZCMjt
 MGlQ==
X-Gm-Message-State: APjAAAWI6UJ0KrLx52y8el0TrxXU5DjTdfrzN2BizhWrdwbjWivs7AlE
 YOrRcLBFAiIlH+9nx5Ah49lXN8fKrATKLeBdIdA=
X-Google-Smtp-Source: APXvYqz9JaqT4XppLLuL4kNDVb70Himar5+EsE4iUfaMlCtaKhyb30Z0+PWGsHHCljDadvkaDLfgLifFtxBekC+R008=
X-Received: by 2002:a05:6830:159a:: with SMTP id
 i26mr18158173otr.149.1571671559928; 
 Mon, 21 Oct 2019 08:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-7-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-7-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 23:25:19 +0800
Message-ID: <CAKXe6SL6GX_eL4yXfmdbGaYd0=Pbpo1vx1P+NbWM_eZ3GCYgBA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 06/20] piix4: Add a i8257 DMA Controller
 as specified in datasheet
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
Content-Type: multipart/mixed; boundary="===============5682226932655043558=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5682226932655043558==
Content-Type: multipart/alternative; boundary="0000000000000880cd05956d4d5e"

--0000000000000880cd05956d4d5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:55=E5=86=99=E9=81=
=93=EF=BC=9A

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Remove i8257 instantiated in malta board, to not have it twice.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-9-hpoussin@reactos.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> [PMD: rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c       | 4 ++++
>  hw/mips/mips_malta.c | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index ac9383a658..0b24d8323c 100644
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
> @@ -167,6 +168,9 @@ static void piix4_realize(PCIDevice *dev, Error **err=
p)
>      /* initialize ISA irqs */
>      isa_bus_irqs(isa_bus, s->isa);
>
> +    /* DMA */
> +    i8257_dma_init(isa_bus, 0);
> +
>      piix4_dev =3D dev;
>  }
>
>
Could you please explain why this is better calling 'i8257_dma_init' in
piix4 realize function
instead of calling it in mips_malta_init.

I'm still a little of which things should be done in realize and which
should be done in qom instance init function.

Thanks,
Li Qiang



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

--0000000000000880cd05956d4d5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:55=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.or=
g" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
<br>
Remove i8257 instantiated in malta board, to not have it twice.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-9-hpoussin@reactos.o=
rg" target=3D"_blank">20171216090228.28505-9-hpoussin@reactos.org</a>&gt;<b=
r>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
[PMD: rebased]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0hw/mips/mips_malta.c | 2 --<br>
=C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index ac9383a658..0b24d8323c 100644<br>
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
@@ -167,6 +168,9 @@ static void piix4_realize(PCIDevice *dev, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0/* initialize ISA irqs */<br>
=C2=A0 =C2=A0 =C2=A0isa_bus_irqs(isa_bus, s-&gt;isa);<br>
<br>
+=C2=A0 =C2=A0 /* DMA */<br>
+=C2=A0 =C2=A0 i8257_dma_init(isa_bus, 0);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D dev;<br>
=C2=A0}<br>
<br></blockquote><div><br></div><div>Could you please explain why this is b=
etter calling &#39;i8257_dma_init&#39; in piix4 realize function</div><div>=
instead of calling it in mips_malta_init.=C2=A0</div><div><br></div><div>I&=
#39;m still a little of which things should be done in realize and which sh=
ould be done in qom instance init function.</div><div><br></div><div>Thanks=
,</div><div>Li Qiang=C2=A0</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--0000000000000880cd05956d4d5e--


--===============5682226932655043558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5682226932655043558==--

