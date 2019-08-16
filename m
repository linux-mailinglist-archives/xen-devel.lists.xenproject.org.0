Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8C8FC7C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:38:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWlP-0004to-63; Fri, 16 Aug 2019 07:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWlM-0004t4-VN
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:35:05 +0000
X-Inumbo-ID: 5b91939a-bff8-11e9-aee9-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [62.239.224.235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b91939a-bff8-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 07:35:03 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:40:57 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:35:00 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:35:00 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 26/42] hw/net: Declare device little or
 big endian
Thread-Index: AQHVVAUcPICP1n2ya0Cx6fWxt6l8Gg==
Date: Fri, 16 Aug 2019 07:35:00 +0000
Message-ID: <1565940899704.36138@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 26/42] hw/net: Declare device
 little or big endian
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 gxt@mprc.pku.edu.cn, robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, balrogg@gmail.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============4447022464204622795=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4447022464204622795==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594089970436138btcom_"

--_000_156594089970436138btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/net/allwinner_emac.c | 2 +-
 hw/net/imx_fec.c        | 2 +-
 hw/net/lan9118.c        | 4 ++--
 hw/net/lance.c          | 2 +-
 hw/net/smc91c111.c      | 2 +-
 hw/net/stellaris_enet.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index eecda52..97e22e7 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -418,7 +418,7 @@ static void aw_emac_set_link(NetClientState *nc)
 static const MemoryRegionOps aw_emac_mem_ops =3D {
     .read =3D aw_emac_read,
     .write =3D aw_emac_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 404154e..76d42c8 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1278,7 +1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D {
     .write                 =3D imx_eth_write,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
-    .endianness            =3D DEVICE_NATIVE_ENDIAN,
+    .endianness            =3D DEVICE_LITTLE_ENDIAN,
 };

 static void imx_eth_cleanup(NetClientState *nc)
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index f6120be..bb1bbb3 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1304,13 +1304,13 @@ static uint64_t lan9118_16bit_mode_read(void *opaqu=
e, hwaddr offset,
 static const MemoryRegionOps lan9118_mem_ops =3D {
     .read =3D lan9118_readl,
     .write =3D lan9118_writel,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const MemoryRegionOps lan9118_16bit_mem_ops =3D {
     .read =3D lan9118_16bit_mode_read,
     .write =3D lan9118_16bit_mode_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static NetClientInfo net_lan9118_info =3D {
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 2978c01..d95f170 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -74,7 +74,7 @@ static uint64_t lance_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps lance_mem_ops =3D {
     .read =3D lance_mem_read,
     .write =3D lance_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 2,
         .max_access_size =3D 2,
diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 4a612ee..49e4bf5 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -757,7 +757,7 @@ static const MemoryRegionOps smc91c111_mem_ops =3D {
     .write =3D smc91c111_writefn,
     .valid.min_access_size =3D 1,
     .valid.max_access_size =3D 4,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static NetClientInfo net_smc91c111_info =3D {
diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 2f645bf..15ec227 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -456,7 +456,7 @@ static void stellaris_enet_write(void *opaque, hwaddr o=
ffset,
 static const MemoryRegionOps stellaris_enet_ops =3D {
     .read =3D stellaris_enet_read,
     .write =3D stellaris_enet_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void stellaris_enet_reset(DeviceState *dev)
--
1.8.3.1

?


--_000_156594089970436138btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">For each device declared with DEVICE_=
NATIVE_ENDIAN, find the set of</span><br>
</div>
<div>targets from the set of target/hw/*/device.o.</div>
<div><br>
</div>
<div>If the set of targets are all little or all big endian, re-declare</di=
v>
<div>the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN</di=
v>
<div>respectively.</div>
<div><br>
</div>
<div>This *naive* deduction may result in genuinely native endian devices</=
div>
<div>being incorrectly declared as little or big endian, but should not</di=
v>
<div>introduce regressions for current targets.</div>
<div><br>
</div>
<div>These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it</=
div>
<div>has a new target with an opposite endian or 2) someone informed knows<=
/div>
<div>better =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/net/allwinner_emac.c | 2 &#43;-</div>
<div>&nbsp;hw/net/imx_fec.c &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/net/lan9118.c &nbsp; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</di=
v>
<div>&nbsp;hw/net/lance.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div=
>
<div>&nbsp;hw/net/smc91c111.c &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/net/stellaris_enet.c | 2 &#43;-</div>
<div>&nbsp;6 files changed, 7 insertions(&#43;), 7 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c</div>
<div>index eecda52..97e22e7 100644</div>
<div>--- a/hw/net/allwinner_emac.c</div>
<div>&#43;&#43;&#43; b/hw/net/allwinner_emac.c</div>
<div>@@ -418,7 &#43;418,7 @@ static void aw_emac_set_link(NetClientState *n=
c)</div>
<div>&nbsp;static const MemoryRegionOps aw_emac_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aw_emac_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aw_emac_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c</div>
<div>index 404154e..76d42c8 100644</div>
<div>--- a/hw/net/imx_fec.c</div>
<div>&#43;&#43;&#43; b/hw/net/imx_fec.c</div>
<div>@@ -1278,7 &#43;1278,7 @@ static const MemoryRegionOps imx_eth_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; =3D imx_eth_write,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
=3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;=3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_eth_cleanup(NetClientState *nc)</div>
<div>diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c</div>
<div>index f6120be..bb1bbb3 100644</div>
<div>--- a/hw/net/lan9118.c</div>
<div>&#43;&#43;&#43; b/hw/net/lan9118.c</div>
<div>@@ -1304,13 &#43;1304,13 @@ static uint64_t lan9118_16bit_mode_read(vo=
id *opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps lan9118_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lan9118_readl,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lan9118_writel,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps lan9118_16bit_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lan9118_16bit_mode_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lan9118_16bit_mode_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_lan9118_info =3D {</div>
<div>diff --git a/hw/net/lance.c b/hw/net/lance.c</div>
<div>index 2978c01..d95f170 100644</div>
<div>--- a/hw/net/lance.c</div>
<div>&#43;&#43;&#43; b/hw/net/lance.c</div>
<div>@@ -74,7 &#43;74,7 @@ static uint64_t lance_mem_read(void *opaque, hwa=
ddr addr,</div>
<div>&nbsp;static const MemoryRegionOps lance_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D lance_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D lance_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 2,</div>
<div>diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c</div>
<div>index 4a612ee..49e4bf5 100644</div>
<div>--- a/hw/net/smc91c111.c</div>
<div>&#43;&#43;&#43; b/hw/net/smc91c111.c</div>
<div>@@ -757,7 &#43;757,7 @@ static const MemoryRegionOps smc91c111_mem_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D smc91c111_writefn,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static NetClientInfo net_smc91c111_info =3D {</div>
<div>diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c</div>
<div>index 2f645bf..15ec227 100644</div>
<div>--- a/hw/net/stellaris_enet.c</div>
<div>&#43;&#43;&#43; b/hw/net/stellaris_enet.c</div>
<div>@@ -456,7 &#43;456,7 @@ static void stellaris_enet_write(void *opaque,=
 hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps stellaris_enet_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stellaris_enet_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stellaris_enet_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void stellaris_enet_reset(DeviceState *dev)</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594089970436138btcom_--


--===============4447022464204622795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4447022464204622795==--

