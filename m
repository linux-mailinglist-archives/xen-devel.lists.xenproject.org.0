Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE188478C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMb-0000wA-Ig; Wed, 07 Aug 2019 08:32:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHM5-0000eL-99
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:31:33 +0000
X-Inumbo-ID: c156d4c2-b8ed-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [62.239.224.234])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c156d4c2-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:31:31 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 09:31:06 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:31:28 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:31:28 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 16/26] exec: Map device_endian onto MemOp
Thread-Index: AQHVTPqBizwOZ0pOOka1lx5iTeYAMw==
Date: Wed, 7 Aug 2019 08:31:28 +0000
Message-ID: <1565166687895.25037@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 08:32:04 +0000
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 16/26] exec: Map device_endian
 onto MemOp
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============0373994539903350518=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0373994539903350518==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516668789525037btcom_"

--_000_156516668789525037btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation to replace device_endian with MemOp.

Mapping device_endian onto MemOp limits behaviour changes to this
relatively smaller patch.

The next patch will replace all device_endian usages with the
equivalent MemOp. That patch will be large but have no behaviour
changes.

A subsequent patch will then delete unused device_endian.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/char/serial.c          | 18 ++++++------------
 include/exec/cpu-common.h | 10 +++++++---
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7c42a2a..7345f69 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1012,22 +1012,15 @@ static void serial_mm_write(void *opaque, hwaddr ad=
dr,
     serial_ioport_write(s, addr >> s->it_shift, value, 1);
 }

-static const MemoryRegionOps serial_mm_ops[3] =3D {
-    [DEVICE_NATIVE_ENDIAN] =3D {
-        .read =3D serial_mm_read,
-        .write =3D serial_mm_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
-        .valid.max_access_size =3D 8,
-        .impl.max_access_size =3D 8,
-    },
-    [DEVICE_LITTLE_ENDIAN] =3D {
+static const MemoryRegionOps serial_mm_ops[2] =3D {
+    [0] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
         .endianness =3D DEVICE_LITTLE_ENDIAN,
         .valid.max_access_size =3D 8,
         .impl.max_access_size =3D 8,
     },
-    [DEVICE_BIG_ENDIAN] =3D {
+    [1] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
         .endianness =3D DEVICE_BIG_ENDIAN,
@@ -1053,8 +1046,9 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     serial_realize_core(s, &error_fatal);
     vmstate_register(NULL, base, &vmstate_serial, s);

-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
-                          "serial", 8 << it_shift);
+    memory_region_init_io(&s->io, NULL,
+                          &serial_mm_ops[end =3D=3D DEVICE_LITTLE_ENDIAN ?=
 0 : 1],
+                          s, "serial", 8 << it_shift);
     memory_region_add_subregion(address_space, base, &s->io);
     return s;
 }
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index f7dbe75..c388453 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -16,10 +16,14 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #if !defined(CONFIG_USER_ONLY)

+#include "exec/memop.h"
+
 enum device_endian {
-    DEVICE_NATIVE_ENDIAN,
-    DEVICE_BIG_ENDIAN,
-    DEVICE_LITTLE_ENDIAN,
+#ifdef NEED_CPU_H
+    DEVICE_NATIVE_ENDIAN =3D MO_TE,
+#endif
+    DEVICE_BIG_ENDIAN =3D MO_BE,
+    DEVICE_LITTLE_ENDIAN =3D MO_LE,
 };

 #if defined(HOST_WORDS_BIGENDIAN)
--
1.8.3.1

?


--_000_156516668789525037btcom_
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
<div><span style=3D"font-size: 10pt;">Preparation to replace device_endian =
with MemOp.</span><br>
</div>
<div><br>
</div>
<div>Mapping device_endian onto MemOp limits behaviour changes to this</div=
>
<div>relatively smaller patch.</div>
<div><br>
</div>
<div>The next patch will replace all device_endian usages with the</div>
<div>equivalent MemOp. That patch will be large but have no behaviour</div>
<div>changes.</div>
<div><br>
</div>
<div>A subsequent patch will then delete unused device_endian.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/char/serial.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 18 &#43;&#4=
3;&#43;&#43;&#43;&#43;------------</div>
<div>&nbsp;include/exec/cpu-common.h | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;---</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;), 15 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/char/serial.c b/hw/char/serial.c</div>
<div>index 7c42a2a..7345f69 100644</div>
<div>--- a/hw/char/serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/serial.c</div>
<div>@@ -1012,22 &#43;1012,15 @@ static void serial_mm_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;serial_ioport_write(s, addr &gt;&gt; s-&gt;it_shif=
t, value, 1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static const MemoryRegionOps serial_mm_ops[3] =3D {</div>
<div>- &nbsp; &nbsp;[DEVICE_NATIVE_ENDIAN] =3D {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;[DEVICE_LITTLE_ENDIAN] =3D {</div>
<div>&#43;static const MemoryRegionOps serial_mm_ops[2] =3D {</div>
<div>&#43; &nbsp; &nbsp;[0] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;[DEVICE_BIG_ENDIAN] =3D {</div>
<div>&#43; &nbsp; &nbsp;[1] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</=
div>
<div>@@ -1053,8 &#43;1046,9 @@ SerialState *serial_mm_init(MemoryRegion *ad=
dress_space,</div>
<div>&nbsp; &nbsp; &nbsp;serial_realize_core(s, &amp;error_fatal);</div>
<div>&nbsp; &nbsp; &nbsp;vmstate_register(NULL, base, &amp;vmstate_serial, =
s);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL, &amp;serial_=
mm_ops[end], s,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;serial&quot;, 8 &lt;&lt; it_shift);</div>
<div>&#43; &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;&amp;serial_mm_ops[end =3D=3D DEVICE_LITTLE_ENDIA=
N ? 0 : 1],</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;s, &quot;serial&quot;, 8 &lt;&lt; it_shift);</div=
>
<div>&nbsp; &nbsp; &nbsp;memory_region_add_subregion(address_space, base, &=
amp;s-&gt;io);</div>
<div>&nbsp; &nbsp; &nbsp;return s;</div>
<div>&nbsp;}</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index f7dbe75..c388453 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -16,10 &#43;16,14 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div=
>
<div>&nbsp;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&#43;</div>
<div>&nbsp;enum device_endian {</div>
<div>- &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN,</div>
<div>- &nbsp; &nbsp;DEVICE_BIG_ENDIAN,</div>
<div>- &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN,</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43; &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN =3D MO_TE,</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;DEVICE_BIG_ENDIAN =3D MO_BE,</div>
<div>&#43; &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(HOST_WORDS_BIGENDIAN)</div>
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

--_000_156516668789525037btcom_--


--===============0373994539903350518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0373994539903350518==--

