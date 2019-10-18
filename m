Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAAFDC0DB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOU2-0007yJ-BO; Fri, 18 Oct 2019 09:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLOU0-0007yD-KT
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:23:40 +0000
X-Inumbo-ID: f8355c88-f188-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8355c88-f188-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 09:23:39 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id a15so4679479oic.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OKGB+MkRVS7wvgh4rljnpig1hDXNULrGSU4z+vvx9Ho=;
 b=Rg+JTgFfD8OR0S2/GX0lWB5FQ2BJzRwx6Bf4aSPoW8wg9mWnT5ngaOKPLiZfpOLJVv
 Gg+GJHpqAS4/CYQXeQatTvRR892EUOTBgkXjA0ri5wkpcqTz7iG9rbXK+34eQB7CI7Gu
 Hndvk5uR92sdqzM0oXjTMYh61oOWV7jGgZAPucd+sDVBr/GNZp2FnBiQzFH1KaRkzABr
 w+BLR2TCQJd7RcUzo/gmo3g6I2A7e/viFeoTFNcr4Nxzshxmx9xG9zXPM17E3M8lXw6j
 fSBZQ7zkE24BSxRqsqevZO/FY3UpO3H5eQnqMeUkDpL3u883QyPQ3240tnp/6DA7eZDP
 42sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OKGB+MkRVS7wvgh4rljnpig1hDXNULrGSU4z+vvx9Ho=;
 b=HDT/ekCvtppkLOpFTa/URLuUpEGxuw3hu0ECvU0KqmkBAZzThRtLiLqHykwHqxpYkw
 fFhtJw2ne8lW9LXxitIGXyq44LFp9txNUWV0ueNKi48jVV0n+WlCXYkt45zDOY1/B+Fn
 tukoEN1o62afpP5nGEV4ubl7/S6VFr992Q4PQDGJT+vJt/VjVu+naJwT5cmFD6GGsI0j
 vEwbZ900hQfZDbgve9JeaQq82g4g6womR+4xbEpIOFlmdAs/nCPsYO4B7hikRWXH70b7
 uGgTFNYPBuj0p1onxKfBJe5lY1AEffxmi+verm1oZvSCyTskjJzglnkL0iXc+Vp1yKyN
 H2tQ==
X-Gm-Message-State: APjAAAWBDlRwEJDoD2B4iFM/BQw3yVrQwh/VJTCrWp9ZCJ4LxQH6AM1X
 5D7uHHj6LAMaCPo+Y0Scqd+yjlkKXDH7keETMGo=
X-Google-Smtp-Source: APXvYqwUYp+aXPA4J8xTl0epqKbsbPzmfWcprgUa0oLR/MZUZiElYcdhX054sxieqq89ow7aIj7FjITRBXUDKBiQb8E=
X-Received: by 2002:aca:4d12:: with SMTP id a18mr6833514oib.79.1571390619085; 
 Fri, 18 Oct 2019 02:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:23:38
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-28-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-28-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:23:38 +0200
Message-ID: <CAL1e-=iGAUoPedsfRuyM7+5bNhXmBw0fmk0U3_f0UB-Zx_Am9w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 27/32] hw/pci-host/piix: Define and use the
 PIIX IRQ Route Control Registers
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
Content-Type: multipart/mixed; boundary="===============6592160329220479633=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6592160329220479633==
Content-Type: multipart/alternative; boundary="000000000000a7711205952be3c5"

--000000000000a7711205952be3c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> The IRQ Route Control registers definitions belong to the PIIX
> chipset. We were only defining the 'A' register. Define the other
> B, C and D registers, and use them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/xen/xen-hvm.c         | 5 +++--
>  hw/mips/gt64xxx_pci.c         | 4 ++--
>  hw/pci-host/piix.c            | 9 ++++-----
>  include/hw/southbridge/piix.h | 6 ++++++
>  4 files changed, 15 insertions(+), 9 deletions(-)
>
>
The register from the patch 27/32 doesn't have prefix and the registers
ftom this patch do - inconsistency?

In any case:

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 6b5e5bb7f5..4ce2fb9c89 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -14,6 +14,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/i386/pc.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/irq.h"
>  #include "hw/hw.h"
>  #include "hw/i386/apic-msidef.h"
> @@ -156,8 +157,8 @@ void xen_piix_pci_write_config_client(uint32_t
> address, uint32_t val, int len)
>              v =3D 0;
>          }
>          v &=3D 0xf;
> -        if (((address + i) >=3D 0x60) && ((address + i) <=3D 0x63)) {
> -            xen_set_pci_link_route(xen_domid, address + i - 0x60, v);
> +        if (((address + i) >=3D PIIX_PIRQCA) && ((address + i) <=3D
> PIIX_PIRQCD)) {
> +            xen_set_pci_link_route(xen_domid, address + i - PIIX_PIRQCA,
> v);
>          }
>      }
>  }
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index c277398c0d..5cab9c1ee1 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -1013,12 +1013,12 @@ static void gt64120_pci_set_irq(void *opaque, int
> irq_num, int level)
>
>      /* now we change the pic irq level according to the piix irq mapping=
s
> */
>      /* XXX: optimize */
> -    pic_irq =3D piix4_dev->config[0x60 + irq_num];
> +    pic_irq =3D piix4_dev->config[PIIX_PIRQCA + irq_num];
>      if (pic_irq < 16) {
>          /* The pic level is the logical OR of all the PCI irqs mapped to
> it. */
>          pic_level =3D 0;
>          for (i =3D 0; i < 4; i++) {
> -            if (pic_irq =3D=3D piix4_dev->config[0x60 + i]) {
> +            if (pic_irq =3D=3D piix4_dev->config[PIIX_PIRQCA + i]) {
>                  pic_level |=3D pci_irq_levels[i];
>              }
>          }
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 3770575c1a..a450fc726e 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -61,7 +61,6 @@ typedef struct I440FXState {
>  #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
>  #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>  #define XEN_PIIX_NUM_PIRQS      128ULL
> -#define PIIX_PIRQC              0x60
>
>  typedef struct PIIX3State {
>      PCIDevice dev;
> @@ -468,7 +467,7 @@ static void piix3_set_irq_level_internal(PIIX3State
> *piix3, int pirq, int level)
>      int pic_irq;
>      uint64_t mask;
>
> -    pic_irq =3D piix3->dev.config[PIIX_PIRQC + pirq];
> +    pic_irq =3D piix3->dev.config[PIIX_PIRQCA + pirq];
>      if (pic_irq >=3D PIIX_NUM_PIC_IRQS) {
>          return;
>      }
> @@ -482,7 +481,7 @@ static void piix3_set_irq_level(PIIX3State *piix3, in=
t
> pirq, int level)
>  {
>      int pic_irq;
>
> -    pic_irq =3D piix3->dev.config[PIIX_PIRQC + pirq];
> +    pic_irq =3D piix3->dev.config[PIIX_PIRQCA + pirq];
>      if (pic_irq >=3D PIIX_NUM_PIC_IRQS) {
>          return;
>      }
> @@ -501,7 +500,7 @@ static void piix3_set_irq(void *opaque, int pirq, int
> level)
>  static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
>  {
>      PIIX3State *piix3 =3D opaque;
> -    int irq =3D piix3->dev.config[PIIX_PIRQC + pin];
> +    int irq =3D piix3->dev.config[PIIX_PIRQCA + pin];
>      PCIINTxRoute route;
>
>      if (irq < PIIX_NUM_PIC_IRQS) {
> @@ -530,7 +529,7 @@ static void piix3_write_config(PCIDevice *dev,
>                                 uint32_t address, uint32_t val, int len)
>  {
>      pci_default_write_config(dev, address, val, len);
> -    if (ranges_overlap(address, len, PIIX_PIRQC, 4)) {
> +    if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
>          PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);
>          int pic_irq;
>
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
> index 79ebe0089b..9c92c37a4d 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -18,6 +18,12 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t
> smb_io_base,
>                        qemu_irq sci_irq, qemu_irq smi_irq,
>                        int smm_enabled, DeviceState **piix4_pm);
>
> +/* PIRQRC[A:D]: PIRQx Route Control Registers */
> +#define PIIX_PIRQCA 0x60
> +#define PIIX_PIRQCB 0x61
> +#define PIIX_PIRQCC 0x62
> +#define PIIX_PIRQCD 0x63
> +
>  /*
>   * Reset Control Register: PCI-accessible ISA-Compatible Register at
> address
>   * 0xcf9, provided by the PCI/ISA bridge (PIIX3 PCI function 0,
> 8086:7000).
> --
> 2.21.0
>
>
>

--000000000000a7711205952be3c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">The IRQ Route Control registers definitions belong =
to the PIIX<br>
chipset. We were only defining the &#39;A&#39; register. Define the other<b=
r>
B, C and D registers, and use them.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
=C2=A0hw/mips/gt64xxx_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0hw/pci-host/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++++-=
----<br>
=C2=A0include/hw/southbridge/piix.h | 6 ++++++<br>
=C2=A04 files changed, 15 insertions(+), 9 deletions(-)<br>
<br></blockquote><div><br></div><div>The register from the patch 27/32 does=
n&#39;t have prefix and the registers ftom this patch do - inconsistency?</=
div><div><br></div><div>In any case:</div><div><br></div><div><span style=
=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px">Revi=
ewed-by: Aleksandar Markovic &lt;</span><a href=3D"mailto:amarkovic@wavecom=
p.com" target=3D"_blank" style=3D"font-size:14px;line-height:22.12000083923=
34px">amarkovic@wavecomp.com</a><span style=3D"color:rgb(34,34,34);font-siz=
e:14px;line-height:22.1200008392334px">&gt;</span><br></div><div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c<br>
index 6b5e5bb7f5..4ce2fb9c89 100644<br>
--- a/hw/i386/xen/xen-hvm.c<br>
+++ b/hw/i386/xen/xen-hvm.c<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/hw.h&quot;<br>
=C2=A0#include &quot;hw/i386/apic-msidef.h&quot;<br>
@@ -156,8 +157,8 @@ void xen_piix_pci_write_config_<wbr>client(uint32_t add=
ress, uint32_t val, int len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v &amp;=3D 0xf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((address + i) &gt;=3D 0x60) &amp;&amp; ((=
address + i) &lt;=3D 0x63)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_set_pci_link_route(xen_<wbr>=
domid, address + i - 0x60, v);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((address + i) &gt;=3D PIIX_PIRQCA) &amp;&=
amp; ((address + i) &lt;=3D PIIX_PIRQCD)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_set_pci_link_route(xen_<wbr>=
domid, address + i - PIIX_PIRQCA, v);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c<br>
index c277398c0d..5cab9c1ee1 100644<br>
--- a/hw/mips/gt64xxx_pci.c<br>
+++ b/hw/mips/gt64xxx_pci.c<br>
@@ -1013,12 +1013,12 @@ static void gt64120_pci_set_irq(void *opaque, int i=
rq_num, int level)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* now we change the pic irq level according to the pii=
x irq mappings */<br>
=C2=A0 =C2=A0 =C2=A0/* XXX: optimize */<br>
-=C2=A0 =C2=A0 pic_irq =3D piix4_dev-&gt;config[0x60 + irq_num];<br>
+=C2=A0 =C2=A0 pic_irq =3D piix4_dev-&gt;config[PIIX_PIRQCA + irq_num];<br>
=C2=A0 =C2=A0 =C2=A0if (pic_irq &lt; 16) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The pic level is the logical OR of all=
 the PCI irqs mapped to it. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pic_level =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pic_irq =3D=3D piix4_dev-&gt=
;config[0x60 + i]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pic_irq =3D=3D piix4_dev-&gt=
;config[PIIX_PIRQCA + i]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pic_level |=
=3D pci_irq_levels[i];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index 3770575c1a..a450fc726e 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -61,7 +61,6 @@ typedef struct I440FXState {<br>
=C2=A0#define PIIX_NUM_PIC_IRQS=C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0 =
=C2=A0 /* i8259 * 2 */<br>
=C2=A0#define PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4ULL=C2=A0 =
=C2=A0 /* PIRQ[A-D] */<br>
=C2=A0#define XEN_PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 128ULL<br>
-#define PIIX_PIRQC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60<br=
>
<br>
=C2=A0typedef struct PIIX3State {<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice dev;<br>
@@ -468,7 +467,7 @@ static void piix3_set_irq_level_internal(<wbr>PIIX3Stat=
e *piix3, int pirq, int level)<br>
=C2=A0 =C2=A0 =C2=A0int pic_irq;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t mask;<br>
<br>
-=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQC + pirq];<br>
+=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pirq];<br>
=C2=A0 =C2=A0 =C2=A0if (pic_irq &gt;=3D PIIX_NUM_PIC_IRQS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -482,7 +481,7 @@ static void piix3_set_irq_level(PIIX3State *piix3, int =
pirq, int level)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int pic_irq;<br>
<br>
-=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQC + pirq];<br>
+=C2=A0 =C2=A0 pic_irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pirq];<br>
=C2=A0 =C2=A0 =C2=A0if (pic_irq &gt;=3D PIIX_NUM_PIC_IRQS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -501,7 +500,7 @@ static void piix3_set_irq(void *opaque, int pirq, int l=
evel)<br>
=C2=A0static PCIINTxRoute piix3_route_intx_pin_to_irq(<wbr>void *opaque, in=
t pin)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PIIX3State *piix3 =3D opaque;<br>
-=C2=A0 =C2=A0 int irq =3D piix3-&gt;dev.config[PIIX_PIRQC + pin];<br>
+=C2=A0 =C2=A0 int irq =3D piix3-&gt;dev.config[PIIX_PIRQCA + pin];<br>
=C2=A0 =C2=A0 =C2=A0PCIINTxRoute route;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (irq &lt; PIIX_NUM_PIC_IRQS) {<br>
@@ -530,7 +529,7 @@ static void piix3_write_config(PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t address, uint32_t val, int =
len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0pci_default_write_config(dev, address, val, len);<br>
-=C2=A0 =C2=A0 if (ranges_overlap(address, len, PIIX_PIRQC, 4)) {<br>
+=C2=A0 =C2=A0 if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(de=
v);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int pic_irq;<br>
<br>
diff --git a/include/hw/southbridge/piix.<wbr>h b/include/hw/southbridge/pi=
ix.<wbr>h<br>
index 79ebe0089b..9c92c37a4d 100644<br>
--- a/include/hw/southbridge/piix.<wbr>h<br>
+++ b/include/hw/southbridge/piix.<wbr>h<br>
@@ -18,6 +18,12 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t s=
mb_io_base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_irq sci_irq, qemu_irq smi_irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int smm_enabled, DeviceState **piix4_pm);<br>
<br>
+/* PIRQRC[A:D]: PIRQx Route Control Registers */<br>
+#define PIIX_PIRQCA 0x60<br>
+#define PIIX_PIRQCB 0x61<br>
+#define PIIX_PIRQCC 0x62<br>
+#define PIIX_PIRQCD 0x63<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Reset Control Register: PCI-accessible ISA-Compatible Register at =
address<br>
=C2=A0 * 0xcf9, provided by the PCI/ISA bridge (PIIX3 PCI function 0, 8086:=
7000).<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000a7711205952be3c5--


--===============6592160329220479633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6592160329220479633==--

