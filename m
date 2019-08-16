Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE58FC8A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWmY-0005Ol-Rz; Fri, 16 Aug 2019 07:36:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWmX-0005OJ-N6
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:36:17 +0000
X-Inumbo-ID: 86ab9bac-bff8-11e9-a661-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [213.121.35.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86ab9bac-bff8-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 07:36:14 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:35:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:36:13 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:36:13 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 30/42] hw/timer: Declare device little or
 big endian
Thread-Index: AQHVVAVHJHteuAQjY06hANVhOnIhew==
Date: Fri, 16 Aug 2019 07:36:13 +0000
Message-ID: <1565940972287.31476@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 30/42] hw/timer: Declare device
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
Content-Type: multipart/mixed; boundary="===============6565533466468331013=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6565533466468331013==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594097228731476btcom_"

--_000_156594097228731476btcom_
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
 hw/timer/a9gtimer.c         | 4 ++--
 hw/timer/arm_mptimer.c      | 4 ++--
 hw/timer/arm_timer.c        | 4 ++--
 hw/timer/armv7m_systick.c   | 2 +-
 hw/timer/aspeed_rtc.c       | 2 +-
 hw/timer/cadence_ttc.c      | 2 +-
 hw/timer/grlib_gptimer.c    | 2 +-
 hw/timer/hpet.c             | 2 +-
 hw/timer/imx_epit.c         | 2 +-
 hw/timer/imx_gpt.c          | 2 +-
 hw/timer/lm32_timer.c       | 2 +-
 hw/timer/milkymist-sysctl.c | 2 +-
 hw/timer/mss-timer.c        | 2 +-
 hw/timer/pl031.c            | 2 +-
 hw/timer/stm32f2xx_timer.c  | 2 +-
 hw/timer/sun4v-rtc.c        | 2 +-
 16 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 09e2a7b..8bb5f6e 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -254,7 +254,7 @@ static const MemoryRegionOps a9_gtimer_this_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const MemoryRegionOps a9_gtimer_ops =3D {
@@ -264,7 +264,7 @@ static const MemoryRegionOps a9_gtimer_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void a9_gtimer_reset(DeviceState *dev)
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 93044aa..9397218 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -190,7 +190,7 @@ static const MemoryRegionOps arm_thistimer_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const MemoryRegionOps timerblock_ops =3D {
@@ -200,7 +200,7 @@ static const MemoryRegionOps timerblock_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void timerblock_reset(TimerBlock *tb)
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index f0a7534..22ce3ff 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -265,7 +265,7 @@ static void sp804_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps sp804_ops =3D {
     .read =3D sp804_read,
     .write =3D sp804_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_sp804 =3D {
@@ -346,7 +346,7 @@ static void icp_pit_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps icp_pit_ops =3D {
     .read =3D icp_pit_read,
     .write =3D icp_pit_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void icp_pit_init(Object *obj)
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 9464074..3c34fd0 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -191,7 +191,7 @@ static MemTxResult systick_write(void *opaque, hwaddr a=
ddr,
 static const MemoryRegionOps systick_ops =3D {
     .read_with_attrs =3D systick_read,
     .write_with_attrs =3D systick_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c
index 19f061c..c528e47 100644
--- a/hw/timer/aspeed_rtc.c
+++ b/hw/timer/aspeed_rtc.c
@@ -130,7 +130,7 @@ static void aspeed_rtc_reset(DeviceState *d)
 static const MemoryRegionOps aspeed_rtc_ops =3D {
     .read =3D aspeed_rtc_read,
     .write =3D aspeed_rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_aspeed_rtc =3D {
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 115d935..d422efe 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -389,7 +389,7 @@ static void cadence_ttc_write(void *opaque, hwaddr offs=
et,
 static const MemoryRegionOps cadence_ttc_ops =3D {
     .read =3D cadence_ttc_read,
     .write =3D cadence_ttc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void cadence_timer_reset(CadenceTimerState *s)
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index e45a490..dc3b028 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -313,7 +313,7 @@ static void grlib_gptimer_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps grlib_gptimer_ops =3D {
     .read =3D grlib_gptimer_read,
     .write =3D grlib_gptimer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 41024f3..8268b24 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -675,7 +675,7 @@ static const MemoryRegionOps hpet_ram_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void hpet_reset(DeviceState *d)
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 7a88316..a87dc06 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -282,7 +282,7 @@ static void imx_epit_cmp(void *opaque)
 static const MemoryRegionOps imx_epit_ops =3D {
     .read =3D imx_epit_read,
     .write =3D imx_epit_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_imx_timer_epit =3D {
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 3086c03..4eca249 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -474,7 +474,7 @@ static void imx_gpt_timeout(void *opaque)
 static const MemoryRegionOps imx_gpt_ops =3D {
     .read =3D imx_gpt_read,
     .write =3D imx_gpt_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };


diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index 6ce876c..88d2ee0 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -144,7 +144,7 @@ static void timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index a9d2508..c1d715f 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -220,7 +220,7 @@ static const MemoryRegionOps sysctl_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void timer0_hit(void *opaque)
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index 6add47a..26a51f1 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -197,7 +197,7 @@ timer_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps timer_ops =3D {
     .read =3D timer_read,
     .write =3D timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 1a7e2ee..62b0fab 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -175,7 +175,7 @@ static void pl031_write(void * opaque, hwaddr offset,
 static const MemoryRegionOps pl031_ops =3D {
     .read =3D pl031_read,
     .write =3D pl031_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl031_init(Object *obj)
diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 4c49dc4..ecfcdad 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -265,7 +265,7 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr =
offset,
 static const MemoryRegionOps stm32f2xx_timer_ops =3D {
     .read =3D stm32f2xx_timer_read,
     .write =3D stm32f2xx_timer_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_stm32f2xx_timer =3D {
diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
index ba62adc..6b7ca75 100644
--- a/hw/timer/sun4v-rtc.c
+++ b/hw/timer/sun4v-rtc.c
@@ -48,7 +48,7 @@ static void sun4v_rtc_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps sun4v_rtc_ops =3D {
     .read =3D sun4v_rtc_read,
     .write =3D sun4v_rtc_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 void sun4v_rtc_init(hwaddr addr)
--
1.8.3.1

?


--_000_156594097228731476btcom_
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
<div>&nbsp;hw/timer/a9gtimer.c &nbsp; &nbsp; &nbsp; &nbsp; | 4 &#43;&#43;--=
</div>
<div>&nbsp;hw/timer/arm_mptimer.c &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</div=
>
<div>&nbsp;hw/timer/arm_timer.c &nbsp; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--=
</div>
<div>&nbsp;hw/timer/armv7m_systick.c &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/timer/aspeed_rtc.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/timer/cadence_ttc.c &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/timer/grlib_gptimer.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/timer/hpet.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 &#=
43;-</div>
<div>&nbsp;hw/timer/imx_epit.c &nbsp; &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/timer/imx_gpt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-<=
/div>
<div>&nbsp;hw/timer/lm32_timer.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/timer/milkymist-sysctl.c | 2 &#43;-</div>
<div>&nbsp;hw/timer/mss-timer.c &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/timer/pl031.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#=
43;-</div>
<div>&nbsp;hw/timer/stm32f2xx_timer.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/timer/sun4v-rtc.c &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;16 files changed, 19 insertions(&#43;), 19 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c</div>
<div>index 09e2a7b..8bb5f6e 100644</div>
<div>--- a/hw/timer/a9gtimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/a9gtimer.c</div>
<div>@@ -254,7 &#43;254,7 @@ static const MemoryRegionOps a9_gtimer_this_op=
s =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps a9_gtimer_ops =3D {</div>
<div>@@ -264,7 &#43;264,7 @@ static const MemoryRegionOps a9_gtimer_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void a9_gtimer_reset(DeviceState *dev)</div>
<div>diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c</div>
<div>index 93044aa..9397218 100644</div>
<div>--- a/hw/timer/arm_mptimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/arm_mptimer.c</div>
<div>@@ -190,7 &#43;190,7 @@ static const MemoryRegionOps arm_thistimer_ops=
 =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps timerblock_ops =3D {</div>
<div>@@ -200,7 &#43;200,7 @@ static const MemoryRegionOps timerblock_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void timerblock_reset(TimerBlock *tb)</div>
<div>diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c</div>
<div>index f0a7534..22ce3ff 100644</div>
<div>--- a/hw/timer/arm_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/arm_timer.c</div>
<div>@@ -265,7 &#43;265,7 @@ static void sp804_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps sp804_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sp804_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sp804_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_sp804 =3D {</div>
<div>@@ -346,7 &#43;346,7 @@ static void icp_pit_write(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps icp_pit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D icp_pit_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D icp_pit_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void icp_pit_init(Object *obj)</div>
<div>diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c</di=
v>
<div>index 9464074..3c34fd0 100644</div>
<div>--- a/hw/timer/armv7m_systick.c</div>
<div>&#43;&#43;&#43; b/hw/timer/armv7m_systick.c</div>
<div>@@ -191,7 &#43;191,7 @@ static MemTxResult systick_write(void *opaque,=
 hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps systick_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D systick_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D systick_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c</div>
<div>index 19f061c..c528e47 100644</div>
<div>--- a/hw/timer/aspeed_rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/aspeed_rtc.c</div>
<div>@@ -130,7 &#43;130,7 @@ static void aspeed_rtc_reset(DeviceState *d)</=
div>
<div>&nbsp;static const MemoryRegionOps aspeed_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D aspeed_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D aspeed_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_aspeed_rtc =3D {</div>
<div>diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c</div>
<div>index 115d935..d422efe 100644</div>
<div>--- a/hw/timer/cadence_ttc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/cadence_ttc.c</div>
<div>@@ -389,7 &#43;389,7 @@ static void cadence_ttc_write(void *opaque, hw=
addr offset,</div>
<div>&nbsp;static const MemoryRegionOps cadence_ttc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D cadence_ttc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D cadence_ttc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cadence_timer_reset(CadenceTimerState *s)</div>
<div>diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c</div>
<div>index e45a490..dc3b028 100644</div>
<div>--- a/hw/timer/grlib_gptimer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/grlib_gptimer.c</div>
<div>@@ -313,7 &#43;313,7 @@ static void grlib_gptimer_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps grlib_gptimer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D grlib_gptimer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D grlib_gptimer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c</div>
<div>index 41024f3..8268b24 100644</div>
<div>--- a/hw/timer/hpet.c</div>
<div>&#43;&#43;&#43; b/hw/timer/hpet.c</div>
<div>@@ -675,7 &#43;675,7 @@ static const MemoryRegionOps hpet_ram_ops =3D =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void hpet_reset(DeviceState *d)</div>
<div>diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c</div>
<div>index 7a88316..a87dc06 100644</div>
<div>--- a/hw/timer/imx_epit.c</div>
<div>&#43;&#43;&#43; b/hw/timer/imx_epit.c</div>
<div>@@ -282,7 &#43;282,7 @@ static void imx_epit_cmp(void *opaque)</div>
<div>&nbsp;static const MemoryRegionOps imx_epit_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_epit_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_epit_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_imx_timer_epit =3D {</di=
v>
<div>diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c</div>
<div>index 3086c03..4eca249 100644</div>
<div>--- a/hw/timer/imx_gpt.c</div>
<div>&#43;&#43;&#43; b/hw/timer/imx_gpt.c</div>
<div>@@ -474,7 &#43;474,7 @@ static void imx_gpt_timeout(void *opaque)</div=
>
<div>&nbsp;static const MemoryRegionOps imx_gpt_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_gpt_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_gpt_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c</div>
<div>index 6ce876c..88d2ee0 100644</div>
<div>--- a/hw/timer/lm32_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/lm32_timer.c</div>
<div>@@ -144,7 &#43;144,7 @@ static void timer_write(void *opaque, hwaddr a=
ddr,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c=
</div>
<div>index a9d2508..c1d715f 100644</div>
<div>--- a/hw/timer/milkymist-sysctl.c</div>
<div>&#43;&#43;&#43; b/hw/timer/milkymist-sysctl.c</div>
<div>@@ -220,7 &#43;220,7 @@ static const MemoryRegionOps sysctl_mmio_ops =
=3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void timer0_hit(void *opaque)</div>
<div>diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c</div>
<div>index 6add47a..26a51f1 100644</div>
<div>--- a/hw/timer/mss-timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/mss-timer.c</div>
<div>@@ -197,7 &#43;197,7 @@ timer_write(void *opaque, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c</div>
<div>index 1a7e2ee..62b0fab 100644</div>
<div>--- a/hw/timer/pl031.c</div>
<div>&#43;&#43;&#43; b/hw/timer/pl031.c</div>
<div>@@ -175,7 &#43;175,7 @@ static void pl031_write(void * opaque, hwaddr =
offset,</div>
<div>&nbsp;static const MemoryRegionOps pl031_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl031_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl031_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl031_init(Object *obj)</div>
<div>diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c</=
div>
<div>index 4c49dc4..ecfcdad 100644</div>
<div>--- a/hw/timer/stm32f2xx_timer.c</div>
<div>&#43;&#43;&#43; b/hw/timer/stm32f2xx_timer.c</div>
<div>@@ -265,7 &#43;265,7 @@ static void stm32f2xx_timer_write(void *opaque=
, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_timer_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_timer_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_timer_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stm32f2xx_timer =3D {</d=
iv>
<div>diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c</div>
<div>index ba62adc..6b7ca75 100644</div>
<div>--- a/hw/timer/sun4v-rtc.c</div>
<div>&#43;&#43;&#43; b/hw/timer/sun4v-rtc.c</div>
<div>@@ -48,7 &#43;48,7 @@ static void sun4v_rtc_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps sun4v_rtc_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D sun4v_rtc_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D sun4v_rtc_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void sun4v_rtc_init(hwaddr addr)</div>
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

--_000_156594097228731476btcom_--


--===============6565533466468331013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6565533466468331013==--

