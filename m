Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3408FC99
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWp0-0006BZ-ND; Fri, 16 Aug 2019 07:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWoz-0006BF-2h
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:38:49 +0000
X-Inumbo-ID: e0d70936-bff8-11e9-a661-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [62.239.224.235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0d70936-bff8-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 07:38:46 +0000 (UTC)
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:44:40 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:38:43 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:38:43 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 38/42] memory: Single byte swap along the
 I/O path
Thread-Index: AQHVVAWh4SrE1xJVHUGCBVtvjA+sLA==
Date: Fri, 16 Aug 2019 07:38:43 +0000
Message-ID: <1565941122698.46462@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 38/42] memory: Single byte swap
 along the I/O path
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
Content-Type: multipart/mixed; boundary="===============5513411050861403193=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5513411050861403193==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594112269846462btcom_"

--_000_156594112269846462btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Now that MemOp has been pushed down into the memory API, and
callers are encoding endianness, we can collapse byte swaps
along the I/O path into the accelerator and target independent
adjust_endianness.

Collapsing byte swaps along the I/O path enables additional endian
inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant
byte swaps cancelling out.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c     | 42 +++------------------------------
 hw/virtio/virtio-pci.c | 10 ++++----
 memory.c               | 33 ++++++++++----------------
 memory_ldst.inc.c      | 63 ----------------------------------------------=
----
 4 files changed, 19 insertions(+), 129 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8022c81..bb2f55d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1200,38 +1200,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, ta=
rget_ulong addr,
     cpu_loop_exit_atomic(env_cpu(env), retaddr);
 }

-#ifdef TARGET_WORDS_BIGENDIAN
-#define NEED_BE_BSWAP 0
-#define NEED_LE_BSWAP 1
-#else
-#define NEED_BE_BSWAP 1
-#define NEED_LE_BSWAP 0
-#endif
-
-/*
- * Byte Swap Helper
- *
- * This should all dead code away depending on the build host and
- * access type.
- */
-
-static inline uint64_t handle_bswap(uint64_t val, MemOp op)
-{
-    if ((memop_big_endian(op) && NEED_BE_BSWAP) ||
-        (!memop_big_endian(op) && NEED_LE_BSWAP)) {
-        switch (op & MO_SIZE) {
-        case MO_8: return val;
-        case MO_16: return bswap16(val);
-        case MO_32: return bswap32(val);
-        case MO_64: return bswap64(val);
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        return val;
-    }
-}
-
 /*
  * Load Helpers
  *
@@ -1306,10 +1274,8 @@ load_helper(CPUArchState *env, target_ulong addr, TC=
GMemOpIdx oi,
             }
         }

-        /* FIXME: io_readx ignores MO_BSWAP.  */
-        res =3D io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type, op);
-        return handle_bswap(res, op);
+        return io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
+                        mmu_idx, addr, retaddr, access_type, op);
     }

     /* Handle slow unaligned access (it spans two pages or IO).  */
@@ -1552,10 +1518,8 @@ store_helper(CPUArchState *env, target_ulong addr, u=
int64_t val,
             }
         }

-        /* FIXME: io_writex ignores MO_BSWAP.  */
         io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
-                  handle_bswap(val, op),
-                  addr, retaddr, op);
+                  val, addr, retaddr, op);
         return;
     }

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ad06c12..84f820d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy=
, hwaddr addr,
         val =3D pci_get_byte(buf);
         break;
     case 2:
-        val =3D cpu_to_le16(pci_get_word(buf));
+        val =3D pci_get_word(buf);
         break;
     case 4:
-        val =3D cpu_to_le32(pci_get_long(buf));
+        val =3D pci_get_long(buf);
         break;
     default:
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
     memory_region_dispatch_write(mr, addr, val, size_memop(len) | MO_LE,
                                  MEMTXATTRS_UNSPECIFIED);
 }
@@ -576,7 +575,6 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

-    /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
     memory_region_dispatch_read(mr, addr, &val, size_memop(len) | MO_LE,
                                 MEMTXATTRS_UNSPECIFIED);
     switch (len) {
@@ -584,10 +582,10 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwad=
dr addr,
         pci_set_byte(buf, val);
         break;
     case 2:
-        pci_set_word(buf, le16_to_cpu(val));
+        pci_set_word(buf, val);
         break;
     case 4:
-        pci_set_long(buf, le32_to_cpu(val));
+        pci_set_long(buf, val);
         break;
     default:
         /* As length is under guest control, handle illegal values. */
diff --git a/memory.c b/memory.c
index 01fd29d..ebe0066 100644
--- a/memory.c
+++ b/memory.c
@@ -343,32 +343,23 @@ static void flatview_simplify(FlatView *view)
     }
 }

-static bool memory_region_wrong_endianness(MemoryRegion *mr)
+static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
 {
-#ifdef TARGET_WORDS_BIGENDIAN
-    return mr->ops->endianness =3D=3D MO_LE;
-#else
-    return mr->ops->endianness =3D=3D MO_BE;
-#endif
-}
-
-static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsigned s=
ize)
-{
-    if (memory_region_wrong_endianness(mr)) {
-        switch (size) {
-        case 1:
+    if ((op & MO_BSWAP) !=3D mr->ops->endianness) {
+        switch (op & MO_SIZE) {
+        case MO_8:
             break;
-        case 2:
+        case MO_16:
             *data =3D bswap16(*data);
             break;
-        case 4:
+        case MO_32:
             *data =3D bswap32(*data);
             break;
-        case 8:
+        case MO_64:
             *data =3D bswap64(*data);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
     }
 }
@@ -1442,7 +1433,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion =
*mr,
     }

     r =3D memory_region_dispatch_read1(mr, addr, pval, size, attrs);
-    adjust_endianness(mr, pval, size);
+    adjust_endianness(mr, pval, op);
     return r;
 }

@@ -1485,7 +1476,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion=
 *mr,
         return MEMTX_DECODE_ERROR;
     }

-    adjust_endianness(mr, &data, size);
+    adjust_endianness(mr, &data, op);

     if ((!kvm_eventfds_enabled()) &&
         memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)=
) {
@@ -2331,7 +2322,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     }

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, size_memop(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
@@ -2366,7 +2357,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, size_memop(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index 482e4b3..7b7f0c0 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -37,17 +37,7 @@ static inline uint32_t glue(address_space_ldl_internal, =
SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32 | endian,=
 attrs);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap32(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap32(val);
-        }
-#endif
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -113,17 +103,7 @@ static inline uint64_t glue(address_space_ldq_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64 | endian,=
 attrs);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap64(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap64(val);
-        }
-#endif
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -223,17 +203,7 @@ static inline uint32_t glue(address_space_lduw_interna=
l, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16 | endian,=
 attrs);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap16(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap16(val);
-        }
-#endif
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -335,17 +305,6 @@ static inline void glue(address_space_stl_internal, SU=
FFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap32(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap32(val);
-        }
-#endif
-        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_32 | endian,=
 attrs);
     } else {
         /* RAM case */
@@ -441,17 +400,6 @@ static inline void glue(address_space_stw_internal, SU=
FFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 2 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap16(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap16(val);
-        }
-#endif
-        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_16 | endian,=
 attrs);
     } else {
         /* RAM case */
@@ -515,17 +463,6 @@ static void glue(address_space_stq_internal, SUFFIX)(A=
RG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 8 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-
-#if defined(TARGET_WORDS_BIGENDIAN)
-        if (endian =3D=3D MO_LE) {
-            val =3D bswap64(val);
-        }
-#else
-        if (endian =3D=3D MO_BE) {
-            val =3D bswap64(val);
-        }
-#endif
-        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
         r =3D memory_region_dispatch_write(mr, addr1, val, MO_64 | endian,=
 attrs);
     } else {
         /* RAM case */
--
1.8.3.1

?


--_000_156594112269846462btcom_
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
<div><span style=3D"font-size: 12pt;">Now that MemOp has been pushed down i=
nto the memory API, and</span><br>
</div>
<div>callers are encoding endianness, we can collapse byte swaps</div>
<div>along the I/O path into the accelerator and target independent</div>
<div>adjust_endianness.</div>
<div><br>
</div>
<div>Collapsing byte swaps along the I/O path enables additional endian</di=
v>
<div>inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant</d=
iv>
<div>byte swaps cancelling out.</div>
<div><br>
</div>
<div>Suggested-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</=
div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; | 42 &#43;&#43;&#43;-----------=
-------------------</div>
<div>&nbsp;hw/virtio/virtio-pci.c | 10 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 33 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------------</div>
<div>&nbsp;memory_ldst.inc.c &nbsp; &nbsp; &nbsp;| 63 ---------------------=
-----------------------------</div>
<div>&nbsp;4 files changed, 19 insertions(&#43;), 129 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 8022c81..bb2f55d 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -1200,38 &#43;1200,6 @@ static void *atomic_mmu_lookup(CPUArchState=
 *env, target_ulong addr,</div>
<div>&nbsp; &nbsp; &nbsp;cpu_loop_exit_atomic(env_cpu(env), retaddr);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>-#define NEED_BE_BSWAP 0</div>
<div>-#define NEED_LE_BSWAP 1</div>
<div>-#else</div>
<div>-#define NEED_BE_BSWAP 1</div>
<div>-#define NEED_LE_BSWAP 0</div>
<div>-#endif</div>
<div>-</div>
<div>-/*</div>
<div>- * Byte Swap Helper</div>
<div>- *</div>
<div>- * This should all dead code away depending on the build host and</di=
v>
<div>- * access type.</div>
<div>- */</div>
<div>-</div>
<div>-static inline uint64_t handle_bswap(uint64_t val, MemOp op)</div>
<div>-{</div>
<div>- &nbsp; &nbsp;if ((memop_big_endian(op) &amp;&amp; NEED_BE_BSWAP) ||<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;(!memop_big_endian(op) &amp;&amp; NEED_LE=
_BSWAP)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;switch (op &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8: return val;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16: return bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32: return bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_64: return bswap64(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached();</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return val;</div>
<div>- &nbsp; &nbsp;}</div>
<div>-}</div>
<div>-</div>
<div>&nbsp;/*</div>
<div>&nbsp; * Load Helpers</div>
<div>&nbsp; *</div>
<div>@@ -1306,10 &#43;1274,8 @@ load_helper(CPUArchState *env, target_ulong=
 addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: io_readx ignores MO_BSWAP. &nbs=
p;*/</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;res =3D io_readx(env, &amp;env_tlb(env)-&=
gt;d[mmu_idx].iotlb[index],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; mmu_idx, addr, retaddr, access_type, op);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return handle_bswap(res, op);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return io_readx(env, &amp;env_tlb(env=
)-&gt;d[mmu_idx].iotlb[index],</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;mmu_idx, addr, retaddr, access_type, op);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle slow unaligned access (it spans two page=
s or IO). &nbsp;*/</div>
<div>@@ -1552,10 &#43;1518,8 @@ store_helper(CPUArchState *env, target_ulon=
g addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: io_writex ignores MO_BSWAP. &nb=
sp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;io_writex(env, &amp;env_tlb(env)-&gt=
;d[mmu_idx].iotlb[index], mmu_idx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;handle=
_bswap(val, op),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addr, =
retaddr, op);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;va=
l, addr, retaddr, op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index ad06c12..84f820d 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -542,16 &#43;542,15 @@ void virtio_address_space_write(VirtIOPCIPro=
xy *proxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D pci_get_byte(buf);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 2:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;val =3D cpu_to_le16(pci_get_word(buf));</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;val =3D pci_get_word(buf);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 4:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;val =3D cpu_to_le32(pci_get_long(buf));</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;val =3D pci_get_long(buf);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;/* FIXME: memory_region_dispatch_write ignores MO_BSWAP=
. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, size_m=
emop(len) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</=
div>
<div>&nbsp;}</div>
<div>@@ -576,7 &#43;575,6 @@ virtio_address_space_read(VirtIOPCIProxy *prox=
y, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* Make sure caller aligned buf properly */</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(((uintptr_t)buf) &amp; (len - 1)));</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read ignores MO_BSWAP.=
 &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, si=
ze_memop(len) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</d=
iv>
<div>&nbsp; &nbsp; &nbsp;switch (len) {</div>
<div>@@ -584,10 &#43;582,10 @@ virtio_address_space_read(VirtIOPCIProxy *pr=
oxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pci_set_byte(buf, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 2:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;pci_set_word(buf, le16_to_cpu(val));</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;pci_set_word(buf, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 4:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;pci_set_long(buf, le32_to_cpu(val));</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;pci_set_long(buf, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 01fd29d..ebe0066 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -343,32 &#43;343,23 @@ static void flatview_simplify(FlatView *view=
)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static bool memory_region_wrong_endianness(MemoryRegion *mr)</div>
<div>&#43;static void adjust_endianness(MemoryRegion *mr, uint64_t *data, M=
emOp op)</div>
<div>&nbsp;{</div>
<div>-#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D MO_LE;</div>
<div>-#else</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D MO_BE;</div>
<div>-#endif</div>
<div>-}</div>
<div>-</div>
<div>-static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsig=
ned size)</div>
<div>-{</div>
<div>- &nbsp; &nbsp;if (memory_region_wrong_endianness(mr)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 1:</div>
<div>&#43; &nbsp; &nbsp;if ((op &amp; MO_BSWAP) !=3D mr-&gt;ops-&gt;endiann=
ess) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;switch (op &amp; MO_SIZE) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 2:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data =3D bswap16(*dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 4:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data =3D bswap32(*dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data =3D bswap64(*dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;abort();</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached();=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>@@ -1442,7 &#43;1433,7 @@ MemTxResult memory_region_dispatch_read(Memo=
ryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read1(mr, addr, pval,=
 size, attrs);</div>
<div>- &nbsp; &nbsp;adjust_endianness(mr, pval, size);</div>
<div>&#43; &nbsp; &nbsp;adjust_endianness(mr, pval, op);</div>
<div>&nbsp; &nbsp; &nbsp;return r;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1485,7 &#43;1476,7 @@ MemTxResult memory_region_dispatch_write(Mem=
oryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return MEMTX_DECODE_ERROR;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;adjust_endianness(mr, &amp;data, size);</div>
<div>&#43; &nbsp; &nbsp;adjust_endianness(mr, &amp;data, op);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if ((!kvm_eventfds_enabled()) &amp;&amp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_write_eventfd=
s(mr, addr, data, size, attrs)) {</div>
<div>@@ -2331,7 &#43;2322,7 @@ void memory_region_add_eventfd(MemoryRegion =
*mr,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data, siz=
e);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data,=
 size_memop(size));</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_transaction_begin();</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; mr-&gt;ioeventfd_nb; &#43;&#4=
3;i) {</div>
<div>@@ -2366,7 &#43;2357,7 @@ void memory_region_del_eventfd(MemoryRegion =
*mr,</div>
<div>&nbsp; &nbsp; &nbsp;unsigned i;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data, siz=
e);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data,=
 size_memop(size));</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_transaction_begin();</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; mr-&gt;ioeventfd_nb; &#43;&#4=
3;i) {</div>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index 482e4b3..7b7f0c0 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -37,17 &#43;37,7 @@ static inline uint32_t glue(address_space_ldl_i=
nternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read ign=
ores MO_BSWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr=
, addr1, &amp;val, MO_32 | endian, attrs);</div>
<div>-#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#endif</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -113,17 &#43;103,7 @@ static inline uint64_t glue(address_space_ldq=
_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read ign=
ores MO_BSWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr=
, addr1, &amp;val, MO_64 | endian, attrs);</div>
<div>-#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#endif</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -223,17 &#43;203,7 @@ static inline uint32_t glue(address_space_ldu=
w_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read ign=
ores MO_BSWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr=
, addr1, &amp;val, MO_16 | endian, attrs);</div>
<div>-#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#endif</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -335,17 &#43;305,6 @@ static inline void glue(address_space_stl_int=
ernal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D TRANSLATE(addr, &amp;addr1, &amp;l, true, a=
ttrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 4 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>-</div>
<div>-#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_write ig=
nores MO_BSWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(m=
r, addr1, val, MO_32 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>@@ -441,17 &#43;400,6 @@ static inline void glue(address_space_stw_int=
ernal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D TRANSLATE(addr, &amp;addr1, &amp;l, true, a=
ttrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 2 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>-</div>
<div>-#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_write ig=
nores MO_BSWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(m=
r, addr1, val, MO_16 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>@@ -515,17 &#43;463,6 @@ static void glue(address_space_stq_internal, =
SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D TRANSLATE(addr, &amp;addr1, &amp;l, true, a=
ttrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 8 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>-</div>
<div>-#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_BE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>-#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_write ig=
nores MO_BSWAP. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(m=
r, addr1, val, MO_64 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594112269846462btcom_--


--===============5513411050861403193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5513411050861403193==--

