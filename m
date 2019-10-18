Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDB4DCC3C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 19:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLVfe-0001Hd-Iq; Fri, 18 Oct 2019 17:04:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLVfc-0001HY-Td
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 17:04:08 +0000
X-Inumbo-ID: 4b8b9c04-f1c9-11e9-bbab-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b8b9c04-f1c9-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 17:04:07 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m19so5589587otp.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bDkaYEuXLrk5gORcRlPGVt7oxf6zCxNVYFWtJrj+Y6E=;
 b=qBXq6i5P5242KBGQVy0CX7I12MH8WNP3dL4wJI3TW6ILw0F22FrYnMuDA/FUKcp+3/
 cgdZW0sEqm/Ptt+8NrCUvbILt4nhwcBTYzVJ8/g27EoqB+U4ZY4zp989a6Hz9my0dxyd
 MZ74Tv+esTjIB1z2pJt7NjNzPH2SPxsBWjz8WfFRf/EO3jNHDdailNqEzJUxlbTHl4hb
 MxC8VtMevE6OyLDr5Uvdj4ErmOcRSpeIbfnGsyjU+cd4B5hkrh3CFDaYEoCbjWLO5HXh
 fqpce8tYWFVQxJ2eyX53wbGV/8nXT7aj5bl3VIlzBetabH7scYlN1dFMBzjjbIT0aRNS
 efAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bDkaYEuXLrk5gORcRlPGVt7oxf6zCxNVYFWtJrj+Y6E=;
 b=qLlyOgbgVUI6PdQJMrYjHaXkpv4hcBSzFsMvM/T80zkN7diRZIe4q6XuVlD0WCZDuc
 Hl5YTieWU27bVYctfGdRhcl27+M79vEmiAhwSTCrU2QUdMtrB716E2k9yX4cEEpJszx9
 tXV3lNh8wpH+psyJZiwfqufFBOfIq8R6axaMIGjBMOQmTCvnQ4aN2oDWcuafoPH3D07j
 qP8vCXiERWqIdi/rNvtjq5TPw0bTxJMxQezMiZHjltKwA82WmuBXW7qxGwMWzac2jkbs
 K5GoOvfrCuIlAc22kvkwItx885/jak+oZ/BcHixQZEoOTjzmEwYOwSCAFxniZZPy6aWl
 5dGg==
X-Gm-Message-State: APjAAAV9L//NJJOY9FirMYsquhX8xw961TV7mnsMKkZHCPrHyFvhxkQ9
 L699GlFWbE+KwIIjahNv3lO3DYeDAUmFvlsMqoA=
X-Google-Smtp-Source: APXvYqxDdpOvXmKbC0prh5gAR8ElpRIgErg2wqpu+0QNVY1zzrSln2fvSp8S1Aa03XRqC0pzq9XcFldtIO4/bE1/1Xo=
X-Received: by 2002:a05:6830:452:: with SMTP id
 d18mr8718963otc.295.1571418246685; 
 Fri, 18 Oct 2019 10:04:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 10:04:06
 -0700 (PDT)
In-Reply-To: <20191018134754.16362-21-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-21-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 19:04:06 +0200
Message-ID: <CAL1e-=gHBfvchVaAbus+GVaSVUFyae41iCB3i5HGhyLTvOr2Ew@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 20/20] hw/pci-host/i440fx: Remove the
 last PIIX3 traces
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============5986439006008169494=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5986439006008169494==
Content-Type: multipart/alternative; boundary="000000000000632a83059532525f"

--000000000000632a83059532525f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> The PIIX3 is not tied to the i440FX and can even be used without it.
> Move its creation to the machine code (pc_piix.c).
> We have now removed the last trace of southbridge code in the i440FX
> northbridge.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc_piix.c            | 8 +++++++-
>  hw/pci-host/i440fx.c         | 8 --------
>  include/hw/pci-host/i440fx.h | 3 +--
>  3 files changed, 8 insertions(+), 11 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

Philippe, I don't have any test equipment available at the moment, did you
do some smoke tests with new v2 of the series (like booting a Malta board,
or other relevant scenario)?

Veuillez agr=C3=A9er, Monsieur Philippe, l'assurance de mon parfaite
consid=C3=A9ration.

Aleksandar


> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 11b8de049f..f6e7196a82 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -199,14 +199,20 @@ static void pc_init1(MachineState *machine,
>      }
>
>      if (pcmc->pci_enabled) {
> +        PIIX3State *piix3;
> +
>          pci_bus =3D i440fx_init(host_type,
>                                pci_type,
> -                              &i440fx_state, &piix3_devfn, &isa_bus,
> pcms->gsi,
> +                              &i440fx_state,
>                                system_memory, system_io, machine->ram_siz=
e,
>                                pcms->below_4g_mem_size,
>                                pcms->above_4g_mem_size,
>                                pci_memory, ram_memory);
>          pcms->bus =3D pci_bus;
> +
> +        piix3 =3D piix3_create(pci_bus, &isa_bus);
> +        piix3->pic =3D pcms->gsi;
> +        piix3_devfn =3D piix3->dev.devfn;
>      } else {
>          pci_bus =3D NULL;
>          i440fx_state =3D NULL;
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 79ecd58a2b..f27131102d 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -27,7 +27,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/pci-host/i440fx.h"
> -#include "hw/southbridge/piix.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "qapi/error.h"
> @@ -272,8 +271,6 @@ static void i440fx_realize(PCIDevice *dev, Error
> **errp)
>
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      PCII440FXState **pi440fx_state,
> -                    int *piix3_devfn,
> -                    ISABus **isa_bus, qemu_irq *pic,
>                      MemoryRegion *address_space_mem,
>                      MemoryRegion *address_space_io,
>                      ram_addr_t ram_size,
> @@ -286,7 +283,6 @@ PCIBus *i440fx_init(const char *host_type, const char
> *pci_type,
>      PCIBus *b;
>      PCIDevice *d;
>      PCIHostState *s;
> -    PIIX3State *piix3;
>      PCII440FXState *f;
>      unsigned i;
>      I440FXState *i440fx;
> @@ -339,10 +335,6 @@ PCIBus *i440fx_init(const char *host_type, const cha=
r
> *pci_type,
>                   PAM_EXPAN_SIZE);
>      }
>
> -    piix3 =3D piix3_create(b, isa_bus);
> -    piix3->pic =3D pic;
> -    *piix3_devfn =3D piix3->dev.devfn;
> -
>      ram_size =3D ram_size / 8 / 1024 / 1024;
>      if (ram_size > 255) {
>          ram_size =3D 255;
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index e327f9bf87..f54e6466e4 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -22,8 +22,7 @@ typedef struct PCII440FXState PCII440FXState;
>  #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> -                    PCII440FXState **pi440fx_state, int *piix_devfn,
> -                    ISABus **isa_bus, qemu_irq *pic,
> +                    PCII440FXState **pi440fx_state,
>                      MemoryRegion *address_space_mem,
>                      MemoryRegion *address_space_io,
>                      ram_addr_t ram_size,
> --
> 2.21.0
>
>
>

--000000000000632a83059532525f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">The PIIX3 is not tied to the i440FX and can even be =
used without it.<br>
Move its creation to the machine code (pc_piix.c).<br>
We have now removed the last trace of southbridge code in the i440FX<br>
northbridge.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++++=
+-<br>
=C2=A0hw/pci-host/i440fx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 --------<br=
>
=C2=A0include/hw/pci-host/i440fx.h | 3 +--<br>
=C2=A03 files changed, 8 insertions(+), 11 deletions(-)<br>
<br></blockquote><div><br></div><div><span style=3D"color:rgb(34,34,34);fon=
t-size:14px;line-height:22.1200008392334px">Reviewed-by: Aleksandar Markovi=
c &lt;</span><a href=3D"mailto:amarkovic@wavecomp.com" style=3D"font-size:1=
4px;line-height:22.1200008392334px">amarkovic@wavecomp.com</a><span style=
=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px">&gt;=
</span><br></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;lin=
e-height:22.1200008392334px"><br></span></div><div><span style=3D"color:rgb=
(34,34,34);font-size:14px;line-height:22.1200008392334px">Philippe, I don&#=
39;t have any test equipment available at the moment, did you do some smoke=
 tests with new v2 of the series (like booting a Malta board, or other rele=
vant scenario)?</span></div><div><span style=3D"color:rgb(34,34,34);font-si=
ze:14px;line-height:22.1200008392334px"><br></span></div><div><span style=
=3D"margin:0px;padding:0px;border:0px;font-family:&#39;Helvetica Neue&#39;,=
Helvetica,&#39;Nimbus Sans L&#39;,Arial,&#39;Liberation Sans&#39;,sans-seri=
f;font-size:16px;font-style:inherit;font-stretch:inherit;line-height:25px;v=
ertical-align:baseline;color:rgb(51,51,51)">Veuillez agr=C3=A9er, Monsieur =
Philippe, l&#39;assurance de mon parfaite consid=C3=A9ration.</span><br></d=
iv><div><span style=3D"margin:0px;padding:0px;border:0px;font-family:&#39;H=
elvetica Neue&#39;,Helvetica,&#39;Nimbus Sans L&#39;,Arial,&#39;Liberation =
Sans&#39;,sans-serif;font-size:16px;font-style:inherit;font-stretch:inherit=
;line-height:25px;vertical-align:baseline;color:rgb(51,51,51)"><br></span><=
/div><div><span style=3D"margin:0px;padding:0px;border:0px;font-family:&#39=
;Helvetica Neue&#39;,Helvetica,&#39;Nimbus Sans L&#39;,Arial,&#39;Liberatio=
n Sans&#39;,sans-serif;font-size:16px;font-style:inherit;font-stretch:inher=
it;line-height:25px;vertical-align:baseline;color:rgb(51,51,51)">Aleksandar=
</span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
index 11b8de049f..f6e7196a82 100644<br>
--- a/hw/i386/pc_piix.c<br>
+++ b/hw/i386/pc_piix.c<br>
@@ -199,14 +199,20 @@ static void pc_init1(MachineState *machine,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (pcmc-&gt;pci_enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX3State *piix3;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus =3D i440fx_init(host_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;i440fx_state, &amp;piix3_devfn, &amp;i=
sa_bus, pcms-&gt;gsi,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;i440fx_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system_memory, system_io, machine-&gt=
;ram_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcms-&gt;below_4g_mem_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcms-&gt;above_4g_mem_size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_memory, ram_memory);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcms-&gt;bus =3D pci_bus;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D piix3_create(pci_bus, &amp;isa_bus);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3-&gt;pic =3D pcms-&gt;gsi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3_devfn =3D piix3-&gt;dev.devfn;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i440fx_state =3D NULL;<br>
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c<br>
index 79ecd58a2b..f27131102d 100644<br>
--- a/hw/pci-host/i440fx.c<br>
+++ b/hw/pci-host/i440fx.c<br>
@@ -27,7 +27,6 @@<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/i440fx.h&quot;<br>
-#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -272,8 +271,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp=
)<br>
<br>
=C2=A0PCIBus *i440fx_init(const char *host_type, const char *pci_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCII440FXState **pi440fx_state,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int =
*piix3_devfn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISAB=
us **isa_bus, qemu_irq *pic,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_mem,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_io,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ram_addr_t ram_size,<br>
@@ -286,7 +283,6 @@ PCIBus *i440fx_init(const char *host_type, const char *=
pci_type,<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *b;<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice *d;<br>
=C2=A0 =C2=A0 =C2=A0PCIHostState *s;<br>
-=C2=A0 =C2=A0 PIIX3State *piix3;<br>
=C2=A0 =C2=A0 =C2=A0PCII440FXState *f;<br>
=C2=A0 =C2=A0 =C2=A0unsigned i;<br>
=C2=A0 =C2=A0 =C2=A0I440FXState *i440fx;<br>
@@ -339,10 +335,6 @@ PCIBus *i440fx_init(const char *host_type, const char =
*pci_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAM_EXPAN_SI=
ZE);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 piix3 =3D piix3_create(b, isa_bus);<br>
-=C2=A0 =C2=A0 piix3-&gt;pic =3D pic;<br>
-=C2=A0 =C2=A0 *piix3_devfn =3D piix3-&gt;dev.devfn;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0ram_size =3D ram_size / 8 / 1024 / 1024;<br>
=C2=A0 =C2=A0 =C2=A0if (ram_size &gt; 255) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ram_size =3D 255;<br>
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h<br=
>
index e327f9bf87..f54e6466e4 100644<br>
--- a/include/hw/pci-host/i440fx.h<br>
+++ b/include/hw/pci-host/i440fx.h<br>
@@ -22,8 +22,7 @@ typedef struct PCII440FXState PCII440FXState;<br>
=C2=A0#define TYPE_IGD_PASSTHROUGH_I440FX_<wbr>PCI_DEVICE &quot;igd-passthr=
ough-i440FX&quot;<br>
<br>
=C2=A0PCIBus *i440fx_init(const char *host_type, const char *pci_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCII=
440FXState **pi440fx_state, int *piix_devfn,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISAB=
us **isa_bus, qemu_irq *pic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCII=
440FXState **pi440fx_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_mem,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *address_space_io,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ram_addr_t ram_size,<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000632a83059532525f--


--===============5986439006008169494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5986439006008169494==--

