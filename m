Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5D8FC6C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWiH-0003o8-96; Fri, 16 Aug 2019 07:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWiF-0003ni-ST
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:31:51 +0000
X-Inumbo-ID: e847e2fe-bff7-11e9-8bb0-12813bfff9fa
Received: from smtpe1.intersmtp.com (unknown [213.121.35.72])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e847e2fe-bff7-11e9-8bb0-12813bfff9fa;
 Fri, 16 Aug 2019 07:31:49 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926077.bt.com (10.36.82.108) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:31:17 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:31:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:31:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 15/42] hw/audio: Declare device little or
 big endian
Thread-Index: AQHVVASpX7Ub23JAUk+KsfVm4+Lt6g==
Date: Fri, 16 Aug 2019 07:31:47 +0000
Message-ID: <1565940706731.95978@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 15/42] hw/audio: Declare device
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
Content-Type: multipart/mixed; boundary="===============8329562094587863780=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8329562094587863780==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594070673195978btcom_"

--_000_156594070673195978btcom_
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
 hw/audio/cs4231.c          | 2 +-
 hw/audio/marvell_88w8618.c | 2 +-
 hw/audio/milkymist-ac97.c  | 2 +-
 hw/audio/pl041.c           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 8372299..8946648 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -132,7 +132,7 @@ static void cs_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps cs_mem_ops =3D {
     .read =3D cs_mem_read,
     .write =3D cs_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static const VMStateDescription vmstate_cs4231 =3D {
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index ff1a0d0..a79e0b1 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -240,7 +240,7 @@ static void mv88w8618_audio_reset(DeviceState *d)
 static const MemoryRegionOps mv88w8618_audio_ops =3D {
     .read =3D mv88w8618_audio_read,
     .write =3D mv88w8618_audio_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void mv88w8618_audio_init(Object *obj)
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index bf6a5a6..56feca2 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -176,7 +176,7 @@ static const MemoryRegionOps ac97_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void ac97_in_cb(void *opaque, int avail_b)
diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c
index 59c6ce1..b59a4f8 100644
--- a/hw/audio/pl041.c
+++ b/hw/audio/pl041.c
@@ -519,7 +519,7 @@ static void pl041_device_reset(DeviceState *d)
 static const MemoryRegionOps pl041_ops =3D {
     .read =3D pl041_read,
     .write =3D pl041_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl041_init(Object *obj)
--
1.8.3.1

?


--_000_156594070673195978btcom_
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
<div>&nbsp;hw/audio/cs4231.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</=
div>
<div>&nbsp;hw/audio/marvell_88w8618.c | 2 &#43;-</div>
<div>&nbsp;hw/audio/milkymist-ac97.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/audio/pl041.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 &#43;-</=
div>
<div>&nbsp;4 files changed, 4 insertions(&#43;), 4 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c</div>
<div>index 8372299..8946648 100644</div>
<div>--- a/hw/audio/cs4231.c</div>
<div>&#43;&#43;&#43; b/hw/audio/cs4231.c</div>
<div>@@ -132,7 &#43;132,7 @@ static void cs_mem_write(void *opaque, hwaddr =
addr,</div>
<div>&nbsp;static const MemoryRegionOps cs_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cs_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cs_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_cs4231 =3D {</div>
<div>diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c</=
div>
<div>index ff1a0d0..a79e0b1 100644</div>
<div>--- a/hw/audio/marvell_88w8618.c</div>
<div>&#43;&#43;&#43; b/hw/audio/marvell_88w8618.c</div>
<div>@@ -240,7 &#43;240,7 @@ static void mv88w8618_audio_reset(DeviceState =
*d)</div>
<div>&nbsp;static const MemoryRegionOps mv88w8618_audio_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mv88w8618_audio_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mv88w8618_audio_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void mv88w8618_audio_init(Object *obj)</div>
<div>diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c</di=
v>
<div>index bf6a5a6..56feca2 100644</div>
<div>--- a/hw/audio/milkymist-ac97.c</div>
<div>&#43;&#43;&#43; b/hw/audio/milkymist-ac97.c</div>
<div>@@ -176,7 &#43;176,7 @@ static const MemoryRegionOps ac97_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void ac97_in_cb(void *opaque, int avail_b)</div>
<div>diff --git a/hw/audio/pl041.c b/hw/audio/pl041.c</div>
<div>index 59c6ce1..b59a4f8 100644</div>
<div>--- a/hw/audio/pl041.c</div>
<div>&#43;&#43;&#43; b/hw/audio/pl041.c</div>
<div>@@ -519,7 &#43;519,7 @@ static void pl041_device_reset(DeviceState *d)=
</div>
<div>&nbsp;static const MemoryRegionOps pl041_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl041_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl041_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl041_init(Object *obj)</div>
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

--_000_156594070673195978btcom_--


--===============8329562094587863780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8329562094587863780==--

