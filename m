Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B68479C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHNp-0001l9-68; Wed, 07 Aug 2019 08:33:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHNn-0001kL-SU
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:33:19 +0000
X-Inumbo-ID: 00d27082-b8ee-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [213.121.35.72])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 00d27082-b8ee-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:33:17 +0000 (UTC)
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926077.bt.com (10.36.82.108) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:32:54 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:33:15 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:33:15 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 20/26] memory: Access MemoryRegion with
 endianness
Thread-Index: AQHVTPrBMLYYco2250O7I7O3jldIgg==
Date: Wed, 7 Aug 2019 08:33:15 +0000
Message-ID: <1565166794966.57397@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 20/26] memory: Access
 MemoryRegion with endianness
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
Content-Type: multipart/mixed; boundary="===============8022994538016741085=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8022994538016741085==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516679496657397btcom_"

--_000_156516679496657397btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for collapsing the two byte swaps adjust_endianness and
handle_bswap into the former.

Call memory_region_dispatch_{read|write} with endianness encoded into
the "MemOp op" operand.

This patch does not change any behaviour as
memory_region_dispatch_{read|write} is yet to handle the endianness.

Once it does handle endianness, callers with byte swaps need to
collapse them into adjust_endianness.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/s390x/s390-pci-inst.c |  3 ++-
 hw/virtio/virtio-pci.c   |  2 ++
 include/exec/memop.h     |  4 ++++
 memory_ldst.inc.c        | 20 +++++++++++++-------
 target/mips/op_helper.c  |  4 ++--
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0e92a37..d322b86 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -782,7 +782,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,
     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
                                               ldq_p(buffer + i * 8),
-                                              MO_64, MEMTXATTRS_UNSPECIFIE=
D);
+                                              MO_64 | MO_TE,
+                                              MEMTXATTRS_UNSPECIFIED);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
             return 0;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b929e44..70eb161 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, =
hwaddr addr,
         /* As length is under guest control, handle illegal values. */
         return;
     }
+    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
     memory_region_dispatch_write(mr, addr, val, size_memop(len),
                                  MEMTXATTRS_UNSPECIFIED);
 }
@@ -575,6 +576,7 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

+    /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
     memory_region_dispatch_read(mr, addr, &val, size_memop(len),
                                 MEMTXATTRS_UNSPECIFIED);
     switch (len) {
diff --git a/include/exec/memop.h b/include/exec/memop.h
index 4a4212d..47a5500 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -122,7 +122,11 @@ static inline MemOp size_memop(unsigned size)
     /* Power of 2 up to 8.  */
     assert((size & (size - 1)) =3D=3D 0 && size >=3D 1 && size <=3D 8);
 #endif
+#ifdef NEED_CPU_H
+    return ctz32(size) | MO_TE;
+#else
     return ctz32(size);
+#endif
 }

 #endif
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index d7e28d0..ff28b30 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -37,7 +37,8 @@ static inline uint32_t glue(address_space_ldl_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32, attrs);
+        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32 | endian,=
 attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D MO_LE) {
             val =3D bswap32(val);
@@ -112,7 +113,8 @@ static inline uint64_t glue(address_space_ldq_internal,=
 SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64, attrs);
+        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64 | endian,=
 attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D MO_LE) {
             val =3D bswap64(val);
@@ -221,7 +223,8 @@ static inline uint32_t glue(address_space_lduw_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16, attrs);
+        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16 | endian,=
 attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D MO_LE) {
             val =3D bswap16(val);
@@ -297,7 +300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);

-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_32, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_32 | MO_TE, =
attrs);
     } else {
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         stl_p(ptr, val);
@@ -343,7 +346,8 @@ static inline void glue(address_space_stl_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap32(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_32, attrs);
+        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_32 | endian,=
 attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -448,7 +452,8 @@ static inline void glue(address_space_stw_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap16(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_16, attrs);
+        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_16 | endian,=
 attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -521,7 +526,8 @@ static void glue(address_space_stq_internal, SUFFIX)(AR=
G1_DECL,
             val =3D bswap64(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_64, attrs);
+        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_64 | endian,=
 attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index e79f99d..1b475f3 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -4741,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong a=
ddr, uint32_t op)
     if (op =3D=3D 9) {
         /* Index Store Tag */
         memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     MO_64, MEMTXATTRS_UNSPECIFIED);
+                                     MO_64 | MO_TE, MEMTXATTRS_UNSPECIFIED=
);
     } else if (op =3D=3D 5) {
         /* Index Load Tag */
         memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    MO_64, MEMTXATTRS_UNSPECIFIED);
+                                    MO_64 | MO_TE, MEMTXATTRS_UNSPECIFIED)=
;
     }
 #endif
 }
--
1.8.3.1

?


--_000_156516679496657397btcom_
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
<div><span style=3D"font-size: 12pt;">Preparation for collapsing the two by=
te swaps adjust_endianness and</span><br>
</div>
<div>handle_bswap into the former.</div>
<div><br>
</div>
<div>Call memory_region_dispatch_{read|write} with endianness encoded into<=
/div>
<div>the &quot;MemOp op&quot; operand.</div>
<div><br>
</div>
<div>This patch does not change any behaviour as</div>
<div>memory_region_dispatch_{read|write} is yet to handle the endianness.</=
div>
<div><br>
</div>
<div>Once it does handle endianness, callers with byte swaps need to</div>
<div>collapse them into adjust_endianness.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c | &nbsp;3 &#43;&#43;-</div>
<div>&nbsp;hw/virtio/virtio-pci.c &nbsp; | &nbsp;2 &#43;&#43;</div>
<div>&nbsp;include/exec/memop.h &nbsp; &nbsp; | &nbsp;4 &#43;&#43;&#43;&#43=
;</div>
<div>&nbsp;memory_ldst.inc.c &nbsp; &nbsp; &nbsp; &nbsp;| 20 &#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-------</div>
<div>&nbsp;target/mips/op_helper.c &nbsp;| &nbsp;4 &#43;&#43;--</div>
<div>&nbsp;5 files changed, 23 insertions(&#43;), 10 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0e92a37..d322b86 100644</div>
<div>--- a/hw/s390x/s390-pci-inst.c</div>
<div>&#43;&#43;&#43; b/hw/s390x/s390-pci-inst.c</div>
<div>@@ -782,7 &#43;782,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t =
r1, uint8_t r3, uint64_t gaddr,</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; len / 8; i&#43;&#43;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result =3D memory_region_dispatch_wr=
ite(mr, offset &#43; i * 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;ldq_p(buffer &#43; i * 8),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;MO_64, MEMTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;MO_64 | MO_TE,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_program_interrupt=
(env, PGM_OPERAND, 6, ra);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index b929e44..70eb161 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -551,6 &#43;551,7 @@ void virtio_address_space_write(VirtIOPCIProxy=
 *proxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_write ignores MO_B=
SWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, size_m=
emop(len),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</=
div>
<div>&nbsp;}</div>
<div>@@ -575,6 &#43;576,7 @@ virtio_address_space_read(VirtIOPCIProxy *prox=
y, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* Make sure caller aligned buf properly */</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(((uintptr_t)buf) &amp; (len - 1)));</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read ignores MO_BS=
WAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, si=
ze_memop(len),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</d=
iv>
<div>&nbsp; &nbsp; &nbsp;switch (len) {</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 4a4212d..47a5500 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -122,7 &#43;122,11 @@ static inline MemOp size_memop(unsigned size)=
</div>
<div>&nbsp; &nbsp; &nbsp;/* Power of 2 up to 8. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;assert((size &amp; (size - 1)) =3D=3D 0 &amp;&amp;=
 size &gt;=3D 1 &amp;&amp; size &lt;=3D 8);</div>
<div>&nbsp;#endif</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43; &nbsp; &nbsp;return ctz32(size) | MO_TE;</div>
<div>&#43;#else</div>
<div>&nbsp; &nbsp; &nbsp;return ctz32(size);</div>
<div>&#43;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index d7e28d0..ff28b30 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -37,7 &#43;37,8 @@ static inline uint32_t glue(address_space_ldl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, MO_32, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read=
 ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, MO_32 | endian, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>@@ -112,7 &#43;113,8 @@ static inline uint64_t glue(address_space_ldq_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, MO_64, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read=
 ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, MO_64 | endian, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>@@ -221,7 &#43;223,8 @@ static inline uint32_t glue(address_space_lduw=
_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, MO_16, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read=
 ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, MO_16 | endian, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>@@ -297,7 &#43;300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(=
ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 4 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_32, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_32 | MO_TE, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_p(ptr, val);</div>
<div>@@ -343,7 &#43;346,8 @@ static inline void glue(address_space_stl_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_32, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_writ=
e ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_32 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -448,7 &#43;452,8 @@ static inline void glue(address_space_stw_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_16, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_writ=
e ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_16 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -521,7 &#43;526,8 @@ static void glue(address_space_stq_internal, S=
UFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_64, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_writ=
e ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_64 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c</div>
<div>index e79f99d..1b475f3 100644</div>
<div>--- a/target/mips/op_helper.c</div>
<div>&#43;&#43;&#43; b/target/mips/op_helper.c</div>
<div>@@ -4741,11 &#43;4741,11 @@ void helper_cache(CPUMIPSState *env, targe=
t_ulong addr, uint32_t op)</div>
<div>&nbsp; &nbsp; &nbsp;if (op =3D=3D 9) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Store Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_write(env-&gt=
;itc_tag, index, env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_64, MEMTXATTRS=
_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_64 | MO_TE=
, MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;} else if (op =3D=3D 5) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Load Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(env-&gt;=
itc_tag, index, &amp;env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_64, MEMTXATTRS_=
UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_64 | MO_TE,=
 MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156516679496657397btcom_--


--===============8022994538016741085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8022994538016741085==--

