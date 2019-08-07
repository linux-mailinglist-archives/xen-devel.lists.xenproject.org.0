Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572784790
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:35:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMO-0000gK-PI; Wed, 07 Aug 2019 08:31:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHJg-0008TK-8f
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:29:04 +0000
X-Inumbo-ID: 688360a2-b8ed-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [213.121.35.77])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 688360a2-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:29:01 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:28:46 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:28:59 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:28:59 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 09/26] exec: Access MemoryRegion with
 MemOp
Thread-Index: AQHVTPopl/eCIE+w30qkb8WHjtwBMw==
Date: Wed, 7 Aug 2019 08:28:59 +0000
Message-ID: <1565166539442.24361@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 09/26] exec: Access MemoryRegion
 with MemOp
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
Content-Type: multipart/mixed; boundary="===============7550659809370859858=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7550659809370859858==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516653944224361btcom_"

--_000_156516653944224361btcom_
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
 exec.c            |  6 ++++--
 memory_ldst.inc.c | 18 +++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/exec.c b/exec.c
index 3e78de3..9f69197 100644
--- a/exec.c
+++ b/exec.c
@@ -3334,7 +3334,8 @@ static MemTxResult flatview_write_continue(FlatView *=
fv, hwaddr addr,
             /* XXX: could force current_cpu to NULL to avoid
                potential bugs */
             val =3D ldn_p(buf, l);
-            result |=3D memory_region_dispatch_write(mr, addr1, val, l, at=
trs);
+            result |=3D memory_region_dispatch_write(mr, addr1, val,
+                                                   size_memop(l), attrs);
         } else {
             /* RAM case */
             ptr =3D qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
@@ -3395,7 +3396,8 @@ MemTxResult flatview_read_continue(FlatView *fv, hwad=
dr addr,
             /* I/O case */
             release_lock |=3D prepare_mmio_access(mr);
             l =3D memory_access_size(mr, l, addr1);
-            result |=3D memory_region_dispatch_read(mr, addr1, &val, l, at=
trs);
+            result |=3D memory_region_dispatch_read(mr, addr1, &val,
+                                                  size_memop(l), attrs);
             stn_p(buf, l, val);
         } else {
             /* RAM case */
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index acf865b..1e8a2fc 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -38,7 +38,7 @@ static inline uint32_t glue(address_space_ldl_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, size_memop(4), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap32(val);
@@ -114,7 +114,7 @@ static inline uint64_t glue(address_space_ldq_internal,=
 SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, size_memop(8), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap64(val);
@@ -188,7 +188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, size_memop(1), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -224,7 +224,7 @@ static inline uint32_t glue(address_space_lduw_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, size_memop(2), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap16(val);
@@ -300,7 +300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);

-        r =3D memory_region_dispatch_write(mr, addr1, val, 4, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, size_memop(4), =
attrs);
     } else {
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         stl_p(ptr, val);
@@ -346,7 +346,7 @@ static inline void glue(address_space_stl_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap32(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 4, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, size_memop(4), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -408,7 +408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (!memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-        r =3D memory_region_dispatch_write(mr, addr1, val, 1, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, size_memop(1), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -451,7 +451,7 @@ static inline void glue(address_space_stw_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap16(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 2, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, size_memop(2), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -524,7 +524,7 @@ static void glue(address_space_stq_internal, SUFFIX)(AR=
G1_DECL,
             val =3D bswap64(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 8, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, size_memop(8), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
--
1.8.3.1

?


--_000_156516653944224361btcom_
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
<div><span style=3D"font-size: 10pt;">The memory_region_dispatch_{read|writ=
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
<div>&nbsp;exec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;6 &#43;&=
#43;&#43;&#43;--</div>
<div>&nbsp;memory_ldst.inc.c | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;---------</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;), 11 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/exec.c b/exec.c</div>
<div>index 3e78de3..9f69197 100644</div>
<div>--- a/exec.c</div>
<div>&#43;&#43;&#43; b/exec.c</div>
<div>@@ -3334,7 &#43;3334,8 @@ static MemTxResult flatview_write_continue(F=
latView *fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: could force cu=
rrent_cpu to NULL to avoid</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; potential bugs=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldn_p(buf, l);=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_region_d=
ispatch_write(mr, addr1, val, l, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_regi=
on_dispatch_write(mr, addr1, val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(l), attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_ram_ptr_l=
ength(mr-&gt;ram_block, addr1, &amp;l, false);</div>
<div>@@ -3395,7 &#43;3396,8 @@ MemTxResult flatview_read_continue(FlatView =
*fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prep=
are_mmio_access(mr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;l =3D memory_access_si=
ze(mr, l, addr1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_region_d=
ispatch_read(mr, addr1, &amp;val, l, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_regi=
on_dispatch_read(mr, addr1, &amp;val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(l), attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stn_p(buf, l, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index acf865b..1e8a2fc 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -38,7 &#43;38,7 @@ static inline uint32_t glue(address_space_ldl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, size_memop(4), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>@@ -114,7 &#43;114,7 @@ static inline uint64_t glue(address_space_ldq_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 8, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, size_memop(8), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>@@ -188,7 &#43;188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1=
_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 1, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, size_memop(1), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -224,7 &#43;224,7 @@ static inline uint32_t glue(address_space_lduw=
_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 2, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, size_memop(2), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>@@ -300,7 &#43;300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(=
ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 4 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, size_memop(4), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_p(ptr, val);</div>
<div>@@ -346,7 &#43;346,7 @@ static inline void glue(address_space_stl_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, size_memop(4), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -408,7 &#43;408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL=
,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D TRANSLATE(addr, &amp;addr1, &amp;l, true, a=
ttrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_access_is_direct(mr, true)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 1, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, size_memop(1), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -451,7 &#43;451,7 @@ static inline void glue(address_space_stw_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 2, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, size_memop(2), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -524,7 &#43;524,7 @@ static void glue(address_space_stq_internal, S=
UFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 8, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, size_memop(8), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
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

--_000_156516653944224361btcom_--


--===============7550659809370859858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7550659809370859858==--

