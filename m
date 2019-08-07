Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABE8477E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMN-0000fp-PV; Wed, 07 Aug 2019 08:31:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHIx-0008RB-Rb
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:28:19 +0000
X-Inumbo-ID: 4e920d38-b8ed-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [213.121.35.72])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4e920d38-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:28:18 +0000 (UTC)
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926077.bt.com (10.36.82.108) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:27:55 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:28:16 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:28:16 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 07/26] hw/virtio: Access MemoryRegion
 with MemOp
Thread-Index: AQHVTPoPeg6DwrIkBEWe8eU+OaDygw==
Date: Wed, 7 Aug 2019 08:28:16 +0000
Message-ID: <1565166496048.47265@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 08:31:48 +0000
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 07/26] hw/virtio: Access
 MemoryRegion with MemOp
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
Content-Type: multipart/mixed; boundary="===============6620410533967626523=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6620410533967626523==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516649604847265btcom_"

--_000_156516649604847265btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/virtio/virtio-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index f6d2223..25875c8 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -17,6 +17,7 @@

 #include "qemu/osdep.h"

+#include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
@@ -550,7 +551,8 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, =
hwaddr addr,
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    memory_region_dispatch_write(mr, addr, val, len, MEMTXATTRS_UNSPECIFIE=
D);
+    memory_region_dispatch_write(mr, addr, val, size_memop(len),
+                                 MEMTXATTRS_UNSPECIFIED);
 }

 static void
@@ -573,7 +575,8 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

-    memory_region_dispatch_read(mr, addr, &val, len, MEMTXATTRS_UNSPECIFIE=
D);
+    memory_region_dispatch_read(mr, addr, &val, size_memop(len),
+                                MEMTXATTRS_UNSPECIFIED);
     switch (len) {
     case 1:
         pci_set_byte(buf, val);
--
1.8.3.1

?


--_000_156516649604847265btcom_
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
<div><span style=3D"font-size: 12pt;">The memory_region_dispatch_{read|writ=
e} operand &quot;unsigned size&quot; is</span><br>
</div>
<div>being converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Convert interfaces by using no-op size_memop.</div>
<div><br>
</div>
<div>After all interfaces are converted, size_memop will be implemented</di=
v>
<div>and the memory_region_dispatch_{read|write} operand &quot;unsigned siz=
e&quot;</div>
<div>will be converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>As size_memop is a no-op, this patch does not change any behaviour.</d=
iv>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;hw/virtio/virtio-pci.c | 7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index f6d2223..25875c8 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -17,6 &#43;17,7 @@</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;qemu/osdep.h&quot;</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;standard-headers/linux/virtio_pci.h&quot;</div>
<div>&nbsp;#include &quot;hw/virtio/virtio.h&quot;</div>
<div>&nbsp;#include &quot;hw/pci/pci.h&quot;</div>
<div>@@ -550,7 &#43;551,8 @@ void virtio_address_space_write(VirtIOPCIProxy=
 *proxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, len, MEMTXA=
TTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, size_me=
mop(len),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</d=
iv>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void</div>
<div>@@ -573,7 &#43;575,8 @@ virtio_address_space_read(VirtIOPCIProxy *prox=
y, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* Make sure caller aligned buf properly */</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(((uintptr_t)buf) &amp; (len - 1)));</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, len, ME=
MTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, siz=
e_memop(len),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</di=
v>
<div>&nbsp; &nbsp; &nbsp;switch (len) {</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pci_set_byte(buf, val);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156516649604847265btcom_--


--===============6620410533967626523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6620410533967626523==--

