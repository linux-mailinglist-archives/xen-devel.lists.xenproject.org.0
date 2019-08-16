Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0D8FC71
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:36:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWis-00040c-1p; Fri, 16 Aug 2019 07:32:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWiq-00040D-GZ
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:32:28 +0000
X-Inumbo-ID: fdc58709-bff7-11e9-8bb0-12813bfff9fa
Received: from smtpe1.intersmtp.com (unknown [62.239.224.236])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdc58709-bff7-11e9-8bb0-12813bfff9fa;
 Fri, 16 Aug 2019 07:32:26 +0000 (UTC)
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:28:31 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:32:24 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:32:24 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 17/42] hw/char: Declare device little or
 big endian
Thread-Index: AQHVVAS/MEVTyvOxxkaaWGWKyfz7nA==
Date: Fri, 16 Aug 2019 07:32:24 +0000
Message-ID: <1565940743566.34044@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 17/42] hw/char: Declare device
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
Content-Type: multipart/mixed; boundary="===============0294315501852807598=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0294315501852807598==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594074356634044btcom_"

--_000_156594074356634044btcom_
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
 hw/char/cadence_uart.c   | 2 +-
 hw/char/escc.c           | 2 +-
 hw/char/etraxfs_ser.c    | 2 +-
 hw/char/grlib_apbuart.c  | 2 +-
 hw/char/imx_serial.c     | 2 +-
 hw/char/lm32_uart.c      | 2 +-
 hw/char/milkymist-uart.c | 2 +-
 hw/char/pl011.c          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fa25fe2..6c7b904 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -457,7 +457,7 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void cadence_uart_reset(DeviceState *dev)
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 8ddbb4b..36182d9 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -574,7 +574,7 @@ static uint64_t escc_mem_read(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps escc_mem_ops =3D {
     .read =3D escc_mem_read,
     .write =3D escc_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 9745bca..cda687b 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -155,7 +155,7 @@ ser_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ser_ops =3D {
     .read =3D ser_read,
     .write =3D ser_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index c2bb3ac..119fc84 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -237,7 +237,7 @@ static void grlib_apbuart_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps grlib_apbuart_ops =3D {
     .write      =3D grlib_apbuart_write,
     .read       =3D grlib_apbuart_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 0655a95..7c66551 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -332,7 +332,7 @@ static void imx_event(void *opaque, int event)
 static const struct MemoryRegionOps imx_serial_ops =3D {
     .read =3D imx_serial_read,
     .write =3D imx_serial_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void imx_serial_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index d047a44..2fe5f60 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -205,7 +205,7 @@ static void uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 8a78fcc..bdb8282 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -156,7 +156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void uart_rx(void *opaque, const uint8_t *buf, int size)
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c1ae2f3..5fb95d2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -287,7 +287,7 @@ static void pl011_event(void *opaque, int event)
 static const MemoryRegionOps pl011_ops =3D {
     .read =3D pl011_read,
     .write =3D pl011_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_pl011 =3D {
--
1.8.3.1

?


--_000_156594074356634044btcom_
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
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">For each device declared with DEVICE_=
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
<div>&nbsp;hw/char/cadence_uart.c &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/char/escc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 &#43;-</di=
v>
<div>&nbsp;hw/char/etraxfs_ser.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/char/grlib_apbuart.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/char/imx_serial.c &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/char/lm32_uart.c &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/char/milkymist-uart.c | 2 &#43;-</div>
<div>&nbsp;hw/char/pl011.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</di=
v>
<div>&nbsp;8 files changed, 8 insertions(&#43;), 8 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c</div>
<div>index fa25fe2..6c7b904 100644</div>
<div>--- a/hw/char/cadence_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/cadence_uart.c</div>
<div>@@ -457,7 &#43;457,7 @@ static uint64_t uart_read(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cadence_uart_reset(DeviceState *dev)</div>
<div>diff --git a/hw/char/escc.c b/hw/char/escc.c</div>
<div>index 8ddbb4b..36182d9 100644</div>
<div>--- a/hw/char/escc.c</div>
<div>&#43;&#43;&#43; b/hw/char/escc.c</div>
<div>@@ -574,7 &#43;574,7 @@ static uint64_t escc_mem_read(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps escc_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D escc_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D escc_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c</div>
<div>index 9745bca..cda687b 100644</div>
<div>--- a/hw/char/etraxfs_ser.c</div>
<div>&#43;&#43;&#43; b/hw/char/etraxfs_ser.c</div>
<div>@@ -155,7 &#43;155,7 @@ ser_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ser_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ser_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ser_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c</div>
<div>index c2bb3ac..119fc84 100644</div>
<div>--- a/hw/char/grlib_apbuart.c</div>
<div>&#43;&#43;&#43; b/hw/char/grlib_apbuart.c</div>
<div>@@ -237,7 &#43;237,7 @@ static void grlib_apbuart_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps grlib_apbuart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp;=3D grlib_apbuart_write=
,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp; &nbsp; &nbsp; =3D grlib_apbuart_read,=
</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void grlib_apbuart_realize(DeviceState *dev, Error **errp=
)</div>
<div>diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c</div>
<div>index 0655a95..7c66551 100644</div>
<div>--- a/hw/char/imx_serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/imx_serial.c</div>
<div>@@ -332,7 &#43;332,7 @@ static void imx_event(void *opaque, int event)=
</div>
<div>&nbsp;static const struct MemoryRegionOps imx_serial_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_serial_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_serial_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_serial_realize(DeviceState *dev, Error **errp)</=
div>
<div>diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c</div>
<div>index d047a44..2fe5f60 100644</div>
<div>--- a/hw/char/lm32_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/lm32_uart.c</div>
<div>@@ -205,7 &#43;205,7 @@ static void uart_write(void *opaque, hwaddr ad=
dr,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c</div>
<div>index 8a78fcc..bdb8282 100644</div>
<div>--- a/hw/char/milkymist-uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/milkymist-uart.c</div>
<div>@@ -156,7 &#43;156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void uart_rx(void *opaque, const uint8_t *buf, int size)<=
/div>
<div>diff --git a/hw/char/pl011.c b/hw/char/pl011.c</div>
<div>index c1ae2f3..5fb95d2 100644</div>
<div>--- a/hw/char/pl011.c</div>
<div>&#43;&#43;&#43; b/hw/char/pl011.c</div>
<div>@@ -287,7 &#43;287,7 @@ static void pl011_event(void *opaque, int even=
t)</div>
<div>&nbsp;static const MemoryRegionOps pl011_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl011_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl011_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pl011 =3D {</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156594074356634044btcom_--


--===============0294315501852807598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0294315501852807598==--

