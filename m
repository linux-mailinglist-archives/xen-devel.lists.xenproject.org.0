Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BF8478F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMP-0000ge-C1; Wed, 07 Aug 2019 08:31:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHKS-0008Tz-Lu
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:29:52 +0000
X-Inumbo-ID: 85690c3c-b8ed-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [62.239.224.236])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85690c3c-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:29:50 +0000 (UTC)
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 09:25:53 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:29:48 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:29:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 11/26] memory: Access MemoryRegion with
 MemOp
Thread-Index: AQHVTPpFjUE/j/BhfEuAUN0KOEZJqg==
Date: Wed, 7 Aug 2019 08:29:47 +0000
Message-ID: <1565166587275.42474@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 11/26] memory: Access
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
Content-Type: multipart/mixed; boundary="===============4426536919874754839=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4426536919874754839==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516658727542474btcom_"

--_000_156516658727542474btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Convert memory_region_dispatch_{read|write} operand "unsigned size"
into a "MemOp op".

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/memop.h  | 18 +++++++++++++-----
 include/exec/memory.h |  9 +++++----
 memory.c              |  7 +++++--
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 5c5769e..4a4212d 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -12,6 +12,8 @@
 #ifndef MEMOP_H
 #define MEMOP_H

+#include "qemu/host-utils.h"
+
 typedef enum MemOp {
     MO_8     =3D 0,
     MO_16    =3D 1,
@@ -107,14 +109,20 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

+/* MemOp to size in bytes.  */
+static inline unsigned memop_size(MemOp op)
+{
+    return 1 << ((op) & MO_SIZE);
+}
+
 /* Size in bytes to MemOp.  */
 static inline MemOp size_memop(unsigned size)
 {
-    /*
-     * FIXME: No-op to aid conversion of memory_region_dispatch_{read|writ=
e}
-     * "unsigned size" operand into a "MemOp op".
-     */
-    return size;
+#ifdef CONFIG_DEBUG_TCG
+    /* Power of 2 up to 8.  */
+    assert((size & (size - 1)) =3D=3D 0 && size >=3D 1 && size <=3D 8);
+#endif
+    return ctz32(size);
 }

 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bb0961d..975b86a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -19,6 +19,7 @@
 #include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/ramlist.h"
 #include "qemu/queue.h"
 #include "qemu/int128.h"
@@ -1731,13 +1732,13 @@ void mtree_info(bool flatview, bool dispatch_tree, =
bool owner);
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @pval: pointer to uint64_t which the data is written to
- * @size: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs);
 /**
  * memory_region_dispatch_write: perform a write directly to the specified
@@ -1746,13 +1747,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegio=
n *mr,
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @data: data to write
- * @size: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs);

 /**
diff --git a/memory.c b/memory.c
index 5d8c9a9..89ea4fb 100644
--- a/memory.c
+++ b/memory.c
@@ -1439,9 +1439,10 @@ static MemTxResult memory_region_dispatch_read1(Memo=
ryRegion *mr,
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs)
 {
+    unsigned size =3D memop_size(op);
     MemTxResult r;

     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
@@ -1483,9 +1484,11 @@ static bool memory_region_dispatch_write_eventfds(Me=
moryRegion *mr,
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs)
 {
+    unsigned size =3D memop_size(op);
+
     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
--
1.8.3.1

?


--_000_156516658727542474btcom_
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
<div><span style=3D"font-size: 10pt;">Convert memory_region_dispatch_{read|=
write} operand &quot;unsigned size&quot;</span><br>
</div>
<div>into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/memop.h &nbsp;| 18 &#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;-----</div>
<div>&nbsp;include/exec/memory.h | &nbsp;9 &#43;&#43;&#43;&#43;&#43;----</d=
iv>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp=
;7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;3 files changed, 23 insertions(&#43;), 11 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 5c5769e..4a4212d 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -12,6 &#43;12,8 @@</div>
<div>&nbsp;#ifndef MEMOP_H</div>
<div>&nbsp;#define MEMOP_H</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;qemu/host-utils.h&quot;</div>
<div>&#43;</div>
<div>&nbsp;typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>&nbsp; &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>@@ -107,14 &#43;109,20 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>&#43;/* MemOp to size in bytes. &nbsp;*/</div>
<div>&#43;static inline unsigned memop_size(MemOp op)</div>
<div>&#43;{</div>
<div>&#43; &nbsp; &nbsp;return 1 &lt;&lt; ((op) &amp; MO_SIZE);</div>
<div>&#43;}</div>
<div>&#43;</div>
<div>&nbsp;/* Size in bytes to MemOp. &nbsp;*/</div>
<div>&nbsp;static inline MemOp size_memop(unsigned size)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;/*</div>
<div>- &nbsp; &nbsp; * FIXME: No-op to aid conversion of memory_region_disp=
atch_{read|write}</div>
<div>- &nbsp; &nbsp; * &quot;unsigned size&quot; operand into a &quot;MemOp=
 op&quot;.</div>
<div>- &nbsp; &nbsp; */</div>
<div>- &nbsp; &nbsp;return size;</div>
<div>&#43;#ifdef CONFIG_DEBUG_TCG</div>
<div>&#43; &nbsp; &nbsp;/* Power of 2 up to 8. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp;assert((size &amp; (size - 1)) =3D=3D 0 &amp;&amp; =
size &gt;=3D 1 &amp;&amp; size &lt;=3D 8);</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;return ctz32(size);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/include/exec/memory.h b/include/exec/memory.h</div>
<div>index bb0961d..975b86a 100644</div>
<div>--- a/include/exec/memory.h</div>
<div>&#43;&#43;&#43; b/include/exec/memory.h</div>
<div>@@ -19,6 &#43;19,7 @@</div>
<div>&nbsp;#include &quot;exec/cpu-common.h&quot;</div>
<div>&nbsp;#include &quot;exec/hwaddr.h&quot;</div>
<div>&nbsp;#include &quot;exec/memattrs.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/ramlist.h&quot;</div>
<div>&nbsp;#include &quot;qemu/queue.h&quot;</div>
<div>&nbsp;#include &quot;qemu/int128.h&quot;</div>
<div>@@ -1731,13 &#43;1732,13 @@ void mtree_info(bool flatview, bool dispat=
ch_tree, bool owner);</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @pval: pointer to uint64_t which the data is written to</div>
<div>- * @size: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint64_t *pval,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsi=
gned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MemTxAttrs attrs);</div>
<div>&nbsp;/**</div>
<div>&nbsp; * memory_region_dispatch_write: perform a write directly to the=
 specified</div>
<div>@@ -1746,13 &#43;1747,13 @@ MemTxResult memory_region_dispatch_read(Me=
moryRegion *mr,</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @data: data to write</div>
<div>- * @size: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; uint64_t data,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uns=
igned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; MemTxAttrs attrs);</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 5d8c9a9..89ea4fb 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1439,9 &#43;1439,10 @@ static MemTxResult memory_region_dispatch_r=
ead1(MemoryRegion *mr,</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint64_t *pval,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsi=
gned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MemTxAttrs attrs)</div>
<div>&nbsp;{</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D memop_size(op);</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, fa=
lse, attrs)) {</div>
<div>@@ -1483,9 &#43;1484,11 @@ static bool memory_region_dispatch_write_ev=
entfds(MemoryRegion *mr,</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; uint64_t data,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uns=
igned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; MemTxAttrs attrs)</div>
<div>&nbsp;{</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D memop_size(op);</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, tr=
ue, attrs)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unassigned_mem_write(mr, addr, data,=
 size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return MEMTX_DECODE_ERROR;</div>
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

--_000_156516658727542474btcom_--


--===============4426536919874754839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4426536919874754839==--

