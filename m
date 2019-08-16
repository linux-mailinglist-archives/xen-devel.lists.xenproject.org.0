Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF18FC76
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWjV-0004De-Km; Fri, 16 Aug 2019 07:33:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWjU-0004D4-4D
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:33:08 +0000
X-Inumbo-ID: 168de474-bff8-11e9-8bb0-12813bfff9fa
Received: from smtpe1.intersmtp.com (unknown [213.121.35.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 168de474-bff8-11e9-8bb0-12813bfff9fa;
 Fri, 16 Aug 2019 07:33:06 +0000 (UTC)
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:32:44 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:33:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:33:05 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 19/42] hw/dma: Declare device little or
 big endian
Thread-Index: AQHVVATXv2y4d28XbEKe3xKBzbpwgA==
Date: Fri, 16 Aug 2019 07:33:05 +0000
Message-ID: <1565940784105.45471@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 19/42] hw/dma: Declare device
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
Content-Type: multipart/mixed; boundary="===============5323127866485605247=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5323127866485605247==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594078410545471btcom_"

--_000_156594078410545471btcom_
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
 hw/dma/bcm2835_dma.c | 4 ++--
 hw/dma/etraxfs_dma.c | 2 +-
 hw/dma/pl080.c       | 2 +-
 hw/dma/pl330.c       | 2 +-
 hw/dma/puv3_dma.c    | 2 +-
 hw/dma/sparc32_dma.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index a39e8f4..907d25c 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -288,7 +288,7 @@ static void bcm2835_dma15_write(void *opaque, hwaddr of=
fset, uint64_t value,
 static const MemoryRegionOps bcm2835_dma0_ops =3D {
     .read =3D bcm2835_dma0_read,
     .write =3D bcm2835_dma0_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
@@ -296,7 +296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =3D {
 static const MemoryRegionOps bcm2835_dma15_ops =3D {
     .read =3D bcm2835_dma15_read,
     .write =3D bcm2835_dma15_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index 85783eb..df3ba09 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -697,7 +697,7 @@ dma_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_ops =3D {
  .read =3D dma_read,
  .write =3D dma_write,
- .endianness =3D DEVICE_NATIVE_ENDIAN,
+ .endianness =3D DEVICE_LITTLE_ENDIAN,
  .valid =3D {
  .min_access_size =3D 1,
  .max_access_size =3D 4
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 7e57624..644eadb 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -346,7 +346,7 @@ static void pl080_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl080_ops =3D {
     .read =3D pl080_read,
     .write =3D pl080_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl080_reset(DeviceState *dev)
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index a56a3e7..4c51f2d 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1493,7 +1493,7 @@ static uint64_t pl330_iomem_read(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps pl330_ops =3D {
     .read =3D pl330_iomem_read,
     .write =3D pl330_iomem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 122f87a..7002373 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -75,7 +75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void puv3_dma_realize(DeviceState *dev, Error **errp)
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 88765d0..6b32372 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -224,7 +224,7 @@ static void dma_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_mem_ops =3D {
     .read =3D dma_mem_read,
     .write =3D dma_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
--
1.8.3.1

?


--_000_156594078410545471btcom_
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
<div>&nbsp;hw/dma/bcm2835_dma.c | 4 &#43;&#43;--</div>
<div>&nbsp;hw/dma/etraxfs_dma.c | 2 &#43;-</div>
<div>&nbsp;hw/dma/pl080.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/dma/pl330.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/dma/puv3_dma.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/dma/sparc32_dma.c | 2 &#43;-</div>
<div>&nbsp;6 files changed, 7 insertions(&#43;), 7 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c</div>
<div>index a39e8f4..907d25c 100644</div>
<div>--- a/hw/dma/bcm2835_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/bcm2835_dma.c</div>
<div>@@ -288,7 &#43;288,7 @@ static void bcm2835_dma15_write(void *opaque, =
hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma0_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma0_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma0_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>@@ -296,7 &#43;296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma15_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma15_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma15_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c</div>
<div>index 85783eb..df3ba09 100644</div>
<div>--- a/hw/dma/etraxfs_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/etraxfs_dma.c</div>
<div>@@ -697,7 &#43;697,7 @@ dma_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_ops =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.read =3D dma_read,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.write =3D dma_write,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.end=
ianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>=
.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.valid =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.min_access_size =3D 1,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.max_access_size =3D 4</div>
<div>diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c</div>
<div>index 7e57624..644eadb 100644</div>
<div>--- a/hw/dma/pl080.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl080.c</div>
<div>@@ -346,7 &#43;346,7 @@ static void pl080_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl080_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl080_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl080_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl080_reset(DeviceState *dev)</div>
<div>diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c</div>
<div>index a56a3e7..4c51f2d 100644</div>
<div>--- a/hw/dma/pl330.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl330.c</div>
<div>@@ -1493,7 &#43;1493,7 @@ static uint64_t pl330_iomem_read(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pl330_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl330_iomem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl330_iomem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c</div>
<div>index 122f87a..7002373 100644</div>
<div>--- a/hw/dma/puv3_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/puv3_dma.c</div>
<div>@@ -75,7 &#43;75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_dma_realize(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c</div>
<div>index 88765d0..6b32372 100644</div>
<div>--- a/hw/dma/sparc32_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/sparc32_dma.c</div>
<div>@@ -224,7 &#43;224,7 @@ static void dma_mem_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dma_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dma_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594078410545471btcom_--


--===============5323127866485605247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5323127866485605247==--

