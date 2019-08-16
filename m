Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677098FC9A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWoi-000653-93; Fri, 16 Aug 2019 07:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWog-00064R-8x
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:38:30 +0000
X-Inumbo-ID: d519a176-bff8-11e9-aee9-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [213.121.35.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d519a176-bff8-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 07:38:26 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:38:03 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:38:24 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:38:24 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 37/42] cputlb: Replace size and endian
 operands for MemOp
Thread-Index: AQHVVAWWeriLpAK7qkS+T9izYShEdQ==
Date: Fri, 16 Aug 2019 07:38:24 +0000
Message-ID: <1565941103483.3364@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 37/42] cputlb: Replace size and
 endian operands for MemOp
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
Content-Type: multipart/mixed; boundary="===============6964584543690043184=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6964584543690043184==
Content-Language: en-AU
Content-Type: multipart/alternative; boundary="_000_15659411034833364btcom_"

--_000_15659411034833364btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for collapsing the two byte swaps adjust_endianness and
handle_bswap into the former.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c   | 172 +++++++++++++++++++++++++----------------------=
----
 include/exec/memop.h |   6 ++
 memory.c             |  11 +---
 3 files changed, 90 insertions(+), 99 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 0aff6a3..8022c81 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, =
int size,

 static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                          int mmu_idx, target_ulong addr, uintptr_t retaddr=
,
-                         MMUAccessType access_type, int size)
+                         MMUAccessType access_type, MemOp op)
 {
     CPUState *cpu =3D env_cpu(env);
     hwaddr mr_offset;
@@ -906,15 +906,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBE=
ntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_read(mr, mr_offset, &val,
-                                    size_memop(size) | MO_TE,
-                                    iotlbentry->attrs);
+    r =3D memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry-=
>attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;

-        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
+        cpu_transaction_failed(cpu, physaddr, addr, memop_size(op), access=
_type,
                                mmu_idx, iotlbentry->attrs, r, retaddr);
     }
     if (locked) {
@@ -926,7 +924,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEnt=
ry *iotlbentry,

 static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                       int mmu_idx, uint64_t val, target_ulong addr,
-                      uintptr_t retaddr, int size)
+                      uintptr_t retaddr, MemOp op)
 {
     CPUState *cpu =3D env_cpu(env);
     hwaddr mr_offset;
@@ -948,16 +946,15 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntr=
y *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_write(mr, mr_offset, val,
-                                     size_memop(size) | MO_TE,
-                                     iotlbentry->attrs);
+    r =3D memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry-=
>attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;

-        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+        cpu_transaction_failed(cpu, physaddr, addr, memop_size(op),
+                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs,=
 r,
+                               retaddr);
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
@@ -1218,14 +1215,15 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
  * access type.
  */

-static inline uint64_t handle_bswap(uint64_t val, int size, bool big_endia=
n)
+static inline uint64_t handle_bswap(uint64_t val, MemOp op)
 {
-    if ((big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP)) {
-        switch (size) {
-        case 1: return val;
-        case 2: return bswap16(val);
-        case 4: return bswap32(val);
-        case 8: return bswap64(val);
+    if ((memop_big_endian(op) && NEED_BE_BSWAP) ||
+        (!memop_big_endian(op) && NEED_LE_BSWAP)) {
+        switch (op & MO_SIZE) {
+        case MO_8: return val;
+        case MO_16: return bswap16(val);
+        case MO_32: return bswap32(val);
+        case MO_64: return bswap64(val);
         default:
             g_assert_not_reached();
         }
@@ -1248,7 +1246,7 @@ typedef uint64_t FullLoadHelper(CPUArchState *env, ta=
rget_ulong addr,

 static inline uint64_t __attribute__((always_inline))
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
-            uintptr_t retaddr, size_t size, bool big_endian, bool code_rea=
d,
+            uintptr_t retaddr, MemOp op, bool code_read,
             FullLoadHelper *full_load)
 {
     uintptr_t mmu_idx =3D get_mmuidx(oi);
@@ -1262,6 +1260,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
     unsigned a_bits =3D get_alignment_bits(get_memop(oi));
     void *haddr;
     uint64_t res;
+    size_t size =3D memop_size(op);

     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1307,9 +1306,10 @@ load_helper(CPUArchState *env, target_ulong addr, TC=
GMemOpIdx oi,
             }
         }

+        /* FIXME: io_readx ignores MO_BSWAP.  */
         res =3D io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type, size);
-        return handle_bswap(res, size, big_endian);
+                       mmu_idx, addr, retaddr, access_type, op);
+        return handle_bswap(res, op);
     }

     /* Handle slow unaligned access (it spans two pages or IO).  */
@@ -1326,7 +1326,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
         r2 =3D full_load(env, addr2, oi, retaddr);
         shift =3D (addr & (size - 1)) * 8;

-        if (big_endian) {
+        if (memop_big_endian(op)) {
             /* Big-endian combine.  */
             res =3D (r1 << shift) | (r2 >> ((size * 8) - shift));
         } else {
@@ -1338,30 +1338,27 @@ load_helper(CPUArchState *env, target_ulong addr, T=
CGMemOpIdx oi,

  do_aligned_access:
     haddr =3D (void *)((uintptr_t)addr + entry->addend);
-    switch (size) {
-    case 1:
+    switch (op) {
+    case MO_UB:
         res =3D ldub_p(haddr);
         break;
-    case 2:
-        if (big_endian) {
-            res =3D lduw_be_p(haddr);
-        } else {
-            res =3D lduw_le_p(haddr);
-        }
+    case MO_BEUW:
+        res =3D lduw_be_p(haddr);
         break;
-    case 4:
-        if (big_endian) {
-            res =3D (uint32_t)ldl_be_p(haddr);
-        } else {
-            res =3D (uint32_t)ldl_le_p(haddr);
-        }
+    case MO_LEUW:
+        res =3D lduw_le_p(haddr);
         break;
-    case 8:
-        if (big_endian) {
-            res =3D ldq_be_p(haddr);
-        } else {
-            res =3D ldq_le_p(haddr);
-        }
+    case MO_BEUL:
+        res =3D (uint32_t)ldl_be_p(haddr);
+        break;
+    case MO_LEUL:
+        res =3D (uint32_t)ldl_le_p(haddr);
+        break;
+    case MO_BEQ:
+        res =3D ldq_be_p(haddr);
+        break;
+    case MO_LEQ:
+        res =3D ldq_le_p(haddr);
         break;
     default:
         g_assert_not_reached();
@@ -1383,8 +1380,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
 static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 1, false, false,
-                       full_ldub_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_8, false, full_ldub_mmu)=
;
 }

 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
@@ -1396,7 +1392,7 @@ tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *en=
v, target_ulong addr,
 static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 2, false, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
                        full_le_lduw_mmu);
 }

@@ -1409,7 +1405,7 @@ tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env=
, target_ulong addr,
 static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 2, true, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
                        full_be_lduw_mmu);
 }

@@ -1422,7 +1418,7 @@ tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env=
, target_ulong addr,
 static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 4, false, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
                        full_le_ldul_mmu);
 }

@@ -1435,7 +1431,7 @@ tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env=
, target_ulong addr,
 static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 4, true, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
                        full_be_ldul_mmu);
 }

@@ -1448,14 +1444,14 @@ tcg_target_ulong helper_be_ldul_mmu(CPUArchState *e=
nv, target_ulong addr,
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 8, false, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
                        helper_le_ldq_mmu);
 }

 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 8, true, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
                        helper_be_ldq_mmu);
 }

@@ -1501,7 +1497,7 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env=
, target_ulong addr,

 static inline void __attribute__((always_inline))
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
-             TCGMemOpIdx oi, uintptr_t retaddr, size_t size, bool big_endi=
an)
+             TCGMemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
     uintptr_t mmu_idx =3D get_mmuidx(oi);
     uintptr_t index =3D tlb_index(env, mmu_idx, addr);
@@ -1510,6 +1506,7 @@ store_helper(CPUArchState *env, target_ulong addr, ui=
nt64_t val,
     const size_t tlb_off =3D offsetof(CPUTLBEntry, addr_write);
     unsigned a_bits =3D get_alignment_bits(get_memop(oi));
     void *haddr;
+    size_t size =3D memop_size(op);

     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1555,9 +1552,10 @@ store_helper(CPUArchState *env, target_ulong addr, u=
int64_t val,
             }
         }

+        /* FIXME: io_writex ignores MO_BSWAP.  */
         io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
-                  handle_bswap(val, size, big_endian),
-                  addr, retaddr, size);
+                  handle_bswap(val, op),
+                  addr, retaddr, op);
         return;
     }

@@ -1593,7 +1591,7 @@ store_helper(CPUArchState *env, target_ulong addr, ui=
nt64_t val,
          */
         for (i =3D 0; i < size; ++i) {
             uint8_t val8;
-            if (big_endian) {
+            if (memop_big_endian(op)) {
                 /* Big-endian extract.  */
                 val8 =3D val >> (((size - 1) * 8) - (i * 8));
             } else {
@@ -1607,30 +1605,27 @@ store_helper(CPUArchState *env, target_ulong addr, =
uint64_t val,

  do_aligned_access:
     haddr =3D (void *)((uintptr_t)addr + entry->addend);
-    switch (size) {
-    case 1:
+    switch (op) {
+    case MO_UB:
         stb_p(haddr, val);
         break;
-    case 2:
-        if (big_endian) {
-            stw_be_p(haddr, val);
-        } else {
-            stw_le_p(haddr, val);
-        }
+    case MO_BEUW:
+        stw_be_p(haddr, val);
         break;
-    case 4:
-        if (big_endian) {
-            stl_be_p(haddr, val);
-        } else {
-            stl_le_p(haddr, val);
-        }
+    case MO_LEUW:
+        stw_le_p(haddr, val);
         break;
-    case 8:
-        if (big_endian) {
-            stq_be_p(haddr, val);
-        } else {
-            stq_le_p(haddr, val);
-        }
+    case MO_BEUL:
+        stl_be_p(haddr, val);
+        break;
+    case MO_LEUL:
+        stl_le_p(haddr, val);
+        break;
+    case MO_BEQ:
+        stq_be_p(haddr, val);
+        break;
+    case MO_LEQ:
+        stq_le_p(haddr, val);
         break;
     default:
         g_assert_not_reached();
@@ -1641,43 +1636,43 @@ store_helper(CPUArchState *env, target_ulong addr, =
uint64_t val,
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                         TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 1, false);
+    store_helper(env, addr, val, oi, retaddr, MO_8);
 }

 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 2, false);
+    store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }

 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 2, true);
+    store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }

 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 4, false);
+    store_helper(env, addr, val, oi, retaddr, MO_LEUL);
 }

 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 4, true);
+    store_helper(env, addr, val, oi, retaddr, MO_BEUL);
 }

 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 8, false);
+    store_helper(env, addr, val, oi, retaddr, MO_LEQ);
 }

 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, 8, true);
+    store_helper(env, addr, val, oi, retaddr, MO_BEQ);
 }

 /* First set of helpers allows passing in of OI and RETADDR.  This makes
@@ -1742,8 +1737,7 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulon=
g addr, uint64_t val,
 static uint64_t full_ldub_cmmu(CPUArchState *env, target_ulong addr,
                                TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 1, false, true,
-                       full_ldub_cmmu);
+    return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_cmmu)=
;
 }

 uint8_t helper_ret_ldb_cmmu(CPUArchState *env, target_ulong addr,
@@ -1755,7 +1749,7 @@ uint8_t helper_ret_ldb_cmmu(CPUArchState *env, target=
_ulong addr,
 static uint64_t full_le_lduw_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 2, false, true,
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, true,
                        full_le_lduw_cmmu);
 }

@@ -1768,7 +1762,7 @@ uint16_t helper_le_ldw_cmmu(CPUArchState *env, target=
_ulong addr,
 static uint64_t full_be_lduw_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 2, true, true,
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, true,
                        full_be_lduw_cmmu);
 }

@@ -1781,7 +1775,7 @@ uint16_t helper_be_ldw_cmmu(CPUArchState *env, target=
_ulong addr,
 static uint64_t full_le_ldul_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 4, false, true,
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, true,
                        full_le_ldul_cmmu);
 }

@@ -1794,7 +1788,7 @@ uint32_t helper_le_ldl_cmmu(CPUArchState *env, target=
_ulong addr,
 static uint64_t full_be_ldul_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 4, true, true,
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, true,
                        full_be_ldul_cmmu);
 }

@@ -1807,13 +1801,13 @@ uint32_t helper_be_ldl_cmmu(CPUArchState *env, targ=
et_ulong addr,
 uint64_t helper_le_ldq_cmmu(CPUArchState *env, target_ulong addr,
                             TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 8, false, true,
+    return load_helper(env, addr, oi, retaddr, MO_LEQ, true,
                        helper_le_ldq_cmmu);
 }

 uint64_t helper_be_ldq_cmmu(CPUArchState *env, target_ulong addr,
                             TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, 8, true, true,
+    return load_helper(env, addr, oi, retaddr, MO_BEQ, true,
                        helper_be_ldq_cmmu);
 }
diff --git a/include/exec/memop.h b/include/exec/memop.h
index 0a610b7..529d07b 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -125,4 +125,10 @@ static inline MemOp size_memop(unsigned size)
     return ctz32(size);
 }

+/* Big endianness from MemOp.  */
+static inline bool memop_big_endian(MemOp op)
+{
+    return (op & MO_BSWAP) =3D=3D MO_BE;
+}
+
 #endif
diff --git a/memory.c b/memory.c
index 689390f..01fd29d 100644
--- a/memory.c
+++ b/memory.c
@@ -343,15 +343,6 @@ static void flatview_simplify(FlatView *view)
     }
 }

-static bool memory_region_big_endian(MemoryRegion *mr)
-{
-#ifdef TARGET_WORDS_BIGENDIAN
-    return mr->ops->endianness !=3D MO_LE;
-#else
-    return mr->ops->endianness =3D=3D MO_BE;
-#endif
-}
-
 static bool memory_region_wrong_endianness(MemoryRegion *mr)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -564,7 +555,7 @@ static MemTxResult access_with_adjusted_size(hwaddr add=
r,
     /* FIXME: support unaligned access? */
     access_size =3D MAX(MIN(size, access_size_max), access_size_min);
     access_mask =3D MAKE_64BIT_MASK(0, access_size * 8);
-    if (memory_region_big_endian(mr)) {
+    if (memop_big_endian(mr->ops->endianness)) {
         for (i =3D 0; i < size; i +=3D access_size) {
             r |=3D access_fn(mr, addr + i, value, access_size,
                         (size - access_size - i) * 8, access_mask, attrs);
--
1.8.3.1

?


--_000_15659411034833364btcom_
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
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; | 172 &#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;--------------------------</div>
<div>&nbsp;include/exec/memop.h | &nbsp; 6 &#43;&#43;</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;11 &#=
43;---</div>
<div>&nbsp;3 files changed, 90 insertions(&#43;), 99 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 0aff6a3..8022c81 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -881,7 &#43;881,7 @@ static void tlb_fill(CPUState *cpu, target_ulo=
ng addr, int size,</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlb=
entry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; int mmu_idx, target_ulong addr, uintptr_t retaddr,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; MMUAccessType access_type, int size)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; MMUAccessType access_type, MemOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cpu =3D env_cpu(env);</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr mr_offset;</div>
<div>@@ -906,15 &#43;906,13 @@ static uint64_t io_readx(CPUArchState *env, =
CPUIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &amp;v=
al,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(size) |=
 MO_TE,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&gt;att=
rs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &a=
mp;val, op, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_region;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr, add=
r, size, access_type,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr,=
 addr, memop_size(op), access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu_idx, iotlbentry-&gt;attrs, r,=
 retaddr);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (locked) {</div>
<div>@@ -926,7 &#43;924,7 @@ static uint64_t io_readx(CPUArchState *env, CP=
UIOTLBEntry *iotlbentry,</div>
<div>&nbsp;</div>
<div>&nbsp;static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbent=
ry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;int mmu_idx, uint64_t val, target_ulong addr,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;uintptr_t retaddr, int size)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;uintptr_t retaddr, MemOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cpu =3D env_cpu(env);</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr mr_offset;</div>
<div>@@ -948,16 &#43;946,15 @@ static void io_writex(CPUArchState *env, CPU=
IOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, val,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(size) =
| MO_TE,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iotlbentry-&gt;at=
trs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, v=
al, op, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_region;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr, add=
r, size, MMU_DATA_STORE,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu_idx, iotlbentry-&gt;attrs, r, reta=
ddr);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr,=
 addr, memop_size(op),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MMU_DATA_STORE, mmu_idx, iotlbentr=
y-&gt;attrs, r,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; retaddr);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (locked) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_unlock_iothread();</div>
<div>@@ -1218,14 &#43;1215,15 @@ static void *atomic_mmu_lookup(CPUArchStat=
e *env, target_ulong addr,</div>
<div>&nbsp; * access type.</div>
<div>&nbsp; */</div>
<div>&nbsp;</div>
<div>-static inline uint64_t handle_bswap(uint64_t val, int size, bool big_=
endian)</div>
<div>&#43;static inline uint64_t handle_bswap(uint64_t val, MemOp op)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;if ((big_endian &amp;&amp; NEED_BE_BSWAP) || (!big_endi=
an &amp;&amp; NEED_LE_BSWAP)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 1: return val;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 2: return bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 4: return bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 8: return bswap64(val);</div>
<div>&#43; &nbsp; &nbsp;if ((memop_big_endian(op) &amp;&amp; NEED_BE_BSWAP)=
 ||</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;(!memop_big_endian(op) &amp;&amp; NEE=
D_LE_BSWAP)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;switch (op &amp; MO_SIZE) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8: return val;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16: return bswap16(val);</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32: return bswap32(val);</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64: return bswap64(val);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached()=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -1248,7 &#43;1246,7 @@ typedef uint64_t FullLoadHelper(CPUArchState=
 *env, target_ulong addr,</div>
<div>&nbsp;</div>
<div>&nbsp;static inline uint64_t __attribute__((always_inline))</div>
<div>&nbsp;load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi=
,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uintptr_t retaddr, size_t s=
ize, bool big_endian, bool code_read,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uintptr_t retaddr, MemO=
p op, bool code_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;FullLoadHelper *full_l=
oad)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uintptr_t mmu_idx =3D get_mmuidx(oi);</div>
<div>@@ -1262,6 &#43;1260,7 @@ load_helper(CPUArchState *env, target_ulong =
addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_memop(o=
i));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t res;</div>
<div>&#43; &nbsp; &nbsp;size_t size =3D memop_size(op);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>&nbsp; &nbsp; &nbsp;if (addr &amp; ((1 &lt;&lt; a_bits) - 1)) {</div>
<div>@@ -1307,9 &#43;1306,10 @@ load_helper(CPUArchState *env, target_ulong=
 addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: io_readx ignores MO_BSWAP. =
&nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D io_readx(env, &amp;env_tlb(e=
nv)-&gt;d[mmu_idx].iotlb[index],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; mmu_idx, addr, retaddr, access_type, size);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return handle_bswap(res, size, big_endian=
);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; mmu_idx, addr, retaddr, access_type, op);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return handle_bswap(res, op);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle slow unaligned access (it spans two page=
s or IO). &nbsp;*/</div>
<div>@@ -1326,7 &#43;1326,7 @@ load_helper(CPUArchState *env, target_ulong =
addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r2 =3D full_load(env, addr2, oi, ret=
addr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;shift =3D (addr &amp; (size - 1)) * =
8;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (memop_big_endian(op)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Big-endian combine.=
 &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D (r1 &lt;&lt; s=
hift) | (r2 &gt;&gt; ((size * 8) - shift));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -1338,30 &#43;1338,27 @@ load_helper(CPUArchState *env, target_ulon=
g addr, TCGMemOpIdx oi,</div>
<div>&nbsp;</div>
<div>&nbsp; do_aligned_access:</div>
<div>&nbsp; &nbsp; &nbsp;haddr =3D (void *)((uintptr_t)addr &#43; entry-&gt=
;addend);</div>
<div>- &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp;case 1:</div>
<div>&#43; &nbsp; &nbsp;switch (op) {</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D ldub_p(haddr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case 2:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D lduw_be_p(haddr);</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D lduw_le_p(haddr);</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;case MO_BEUW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;res =3D lduw_be_p(haddr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case 4:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D (uint32_t)ldl_be_p(=
haddr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D (uint32_t)ldl_le_p(=
haddr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;case MO_LEUW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;res =3D lduw_le_p(haddr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case 8:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D ldq_be_p(haddr);</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;res =3D ldq_le_p(haddr);</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;case MO_BEUL:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;res =3D (uint32_t)ldl_be_p(haddr);</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&#43; &nbsp; &nbsp;case MO_LEUL:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;res =3D (uint32_t)ldl_le_p(haddr);</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&#43; &nbsp; &nbsp;case MO_BEQ:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;res =3D ldq_be_p(haddr);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&#43; &nbsp; &nbsp;case MO_LEQ:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;res =3D ldq_le_p(haddr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached();</div>
<div>@@ -1383,8 &#43;1380,7 @@ load_helper(CPUArchState *env, target_ulong =
addr, TCGMemOpIdx oi,</div>
<div>&nbsp;static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong ad=
dr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uintptr_t retaddr)=
</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 1, false, fa=
lse,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; full_ldub_mmu);</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_8, fa=
lse, full_ldub_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_u=
long addr,</div>
<div>@@ -1396,7 &#43;1392,7 @@ tcg_target_ulong helper_ret_ldub_mmu(CPUArch=
State *env, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong=
 addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t =
retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 2, false, fa=
lse,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_LEUW,=
 false,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_le_lduw_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1409,7 &#43;1405,7 @@ tcg_target_ulong helper_le_lduw_mmu(CPUArchS=
tate *env, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong=
 addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t =
retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 2, true, fal=
se,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_BEUW,=
 false,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_be_lduw_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1422,7 &#43;1418,7 @@ tcg_target_ulong helper_be_lduw_mmu(CPUArchS=
tate *env, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong=
 addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t =
retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 4, false, fa=
lse,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_LEUL,=
 false,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_le_ldul_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1435,7 &#43;1431,7 @@ tcg_target_ulong helper_le_ldul_mmu(CPUArchS=
tate *env, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong=
 addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t =
retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 4, true, fal=
se,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_BEUL,=
 false,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_be_ldul_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1448,14 &#43;1444,14 @@ tcg_target_ulong helper_be_ldul_mmu(CPUArc=
hState *env, target_ulong addr,</div>
<div>&nbsp;uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 8, false, fa=
lse,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_LEQ, =
false,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; helper_le_ldq_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 8, true, fal=
se,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_BEQ, =
false,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; helper_be_ldq_mmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1501,7 &#43;1497,7 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchS=
tate *env, target_ulong addr,</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void __attribute__((always_inline))</div>
<div>&nbsp;store_helper(CPUArchState *env, target_ulong addr, uint64_t val,=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t =
retaddr, size_t size, bool big_endian)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintpt=
r_t retaddr, MemOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uintptr_t mmu_idx =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;uintptr_t index =3D tlb_index(env, mmu_idx, addr);=
</div>
<div>@@ -1510,6 &#43;1506,7 @@ store_helper(CPUArchState *env, target_ulong=
 addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp;const size_t tlb_off =3D offsetof(CPUTLBEntry, add=
r_write);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_memop(o=
i));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&#43; &nbsp; &nbsp;size_t size =3D memop_size(op);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>&nbsp; &nbsp; &nbsp;if (addr &amp; ((1 &lt;&lt; a_bits) - 1)) {</div>
<div>@@ -1555,9 &#43;1552,10 @@ store_helper(CPUArchState *env, target_ulon=
g addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: io_writex ignores MO_BSWAP.=
 &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;io_writex(env, &amp;env_tlb(env)-&gt=
;d[mmu_idx].iotlb[index], mmu_idx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;handle=
_bswap(val, size, big_endian),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addr, =
retaddr, size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ha=
ndle_bswap(val, op),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ad=
dr, retaddr, op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1593,7 &#43;1591,7 @@ store_helper(CPUArchState *env, target_ulong=
 addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; size; &#43;&#43=
;i) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8_t val8;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (memop_big_endian(op=
)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Big-e=
ndian extract. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val8 =3D=
 val &gt;&gt; (((size - 1) * 8) - (i * 8));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -1607,30 &#43;1605,27 @@ store_helper(CPUArchState *env, target_ulo=
ng addr, uint64_t val,</div>
<div>&nbsp;</div>
<div>&nbsp; do_aligned_access:</div>
<div>&nbsp; &nbsp; &nbsp;haddr =3D (void *)((uintptr_t)addr &#43; entry-&gt=
;addend);</div>
<div>- &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp;case 1:</div>
<div>&#43; &nbsp; &nbsp;switch (op) {</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stb_p(haddr, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case 2:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stw_be_p(haddr, val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stw_le_p(haddr, val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;case MO_BEUW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;stw_be_p(haddr, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case 4:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_be_p(haddr, val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_le_p(haddr, val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;case MO_LEUW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;stw_le_p(haddr, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case 8:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (big_endian) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stq_be_p(haddr, val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stq_le_p(haddr, val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;case MO_BEUL:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;stl_be_p(haddr, val);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&#43; &nbsp; &nbsp;case MO_LEUL:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;stl_le_p(haddr, val);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&#43; &nbsp; &nbsp;case MO_BEQ:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;stq_be_p(haddr, val);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&#43; &nbsp; &nbsp;case MO_LEQ:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;stq_le_p(haddr, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached();</div>
<div>@@ -1641,43 &#43;1636,43 @@ store_helper(CPUArchState *env, target_ulo=
ng addr, uint64_t val,</div>
<div>&nbsp;void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, ui=
nt8_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 1, false);</d=
iv>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_8);</d=
iv>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uin=
t16_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 2, false);</d=
iv>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_LEUW);=
</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uin=
t16_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 2, true);</di=
v>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_BEUW);=
</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uin=
t32_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 4, false);</d=
iv>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_LEUL);=
</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uin=
t32_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 4, true);</di=
v>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_BEUL);=
</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uin=
t64_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 8, false);</d=
iv>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_LEQ);<=
/div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uin=
t64_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, 8, true);</di=
v>
<div>&#43; &nbsp; &nbsp;store_helper(env, addr, val, oi, retaddr, MO_BEQ);<=
/div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* First set of helpers allows passing in of OI and RETADDR. &nb=
sp;This makes</div>
<div>@@ -1742,8 &#43;1737,7 @@ void helper_be_stq_mmu(CPUArchState *env, ta=
rget_ulong addr, uint64_t val,</div>
<div>&nbsp;static uint64_t full_ldub_cmmu(CPUArchState *env, target_ulong a=
ddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOpIdx oi, uintptr_t retaddr=
)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 1, false, tr=
ue,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; full_ldub_cmmu);</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_8, tr=
ue, full_ldub_cmmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint8_t helper_ret_ldb_cmmu(CPUArchState *env, target_ulong addr=
,</div>
<div>@@ -1755,7 &#43;1749,7 @@ uint8_t helper_ret_ldb_cmmu(CPUArchState *en=
v, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_le_lduw_cmmu(CPUArchState *env, target_ulon=
g addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uint=
ptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 2, false, tr=
ue,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_LEUW,=
 true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_le_lduw_cmmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1768,7 &#43;1762,7 @@ uint16_t helper_le_ldw_cmmu(CPUArchState *en=
v, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_be_lduw_cmmu(CPUArchState *env, target_ulon=
g addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uint=
ptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 2, true, tru=
e,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_BEUW,=
 true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_be_lduw_cmmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1781,7 &#43;1775,7 @@ uint16_t helper_be_ldw_cmmu(CPUArchState *en=
v, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_le_ldul_cmmu(CPUArchState *env, target_ulon=
g addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uint=
ptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 4, false, tr=
ue,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_LEUL,=
 true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_le_ldul_cmmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1794,7 &#43;1788,7 @@ uint32_t helper_le_ldl_cmmu(CPUArchState *en=
v, target_ulong addr,</div>
<div>&nbsp;static uint64_t full_be_ldul_cmmu(CPUArchState *env, target_ulon=
g addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uint=
ptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 4, true, tru=
e,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_BEUL,=
 true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; full_be_ldul_cmmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1807,13 &#43;1801,13 @@ uint32_t helper_be_ldl_cmmu(CPUArchState *=
env, target_ulong addr,</div>
<div>&nbsp;uint64_t helper_le_ldq_cmmu(CPUArchState *env, target_ulong addr=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 8, false, tr=
ue,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_LEQ, =
true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; helper_le_ldq_cmmu);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;uint64_t helper_be_ldq_cmmu(CPUArchState *env, target_ulong addr=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, uintptr_t retaddr)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, 8, true, tru=
e,</div>
<div>&#43; &nbsp; &nbsp;return load_helper(env, addr, oi, retaddr, MO_BEQ, =
true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; helper_be_ldq_cmmu);</div>
<div>&nbsp;}</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 0a610b7..529d07b 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -125,4 &#43;125,10 @@ static inline MemOp size_memop(unsigned size)=
</div>
<div>&nbsp; &nbsp; &nbsp;return ctz32(size);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&#43;/* Big endianness from MemOp. &nbsp;*/</div>
<div>&#43;static inline bool memop_big_endian(MemOp op)</div>
<div>&#43;{</div>
<div>&#43; &nbsp; &nbsp;return (op &amp; MO_BSWAP) =3D=3D MO_BE;</div>
<div>&#43;}</div>
<div>&#43;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 689390f..01fd29d 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -343,15 &#43;343,6 @@ static void flatview_simplify(FlatView *view)=
</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static bool memory_region_big_endian(MemoryRegion *mr)</div>
<div>-{</div>
<div>-#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness !=3D MO_LE;</div>
<div>-#else</div>
<div>- &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D MO_BE;</div>
<div>-#endif</div>
<div>-}</div>
<div>-</div>
<div>&nbsp;static bool memory_region_wrong_endianness(MemoryRegion *mr)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp;#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>@@ -564,7 &#43;555,7 @@ static MemTxResult access_with_adjusted_size(h=
waddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* FIXME: support unaligned access? */</div>
<div>&nbsp; &nbsp; &nbsp;access_size =3D MAX(MIN(size, access_size_max), ac=
cess_size_min);</div>
<div>&nbsp; &nbsp; &nbsp;access_mask =3D MAKE_64BIT_MASK(0, access_size * 8=
);</div>
<div>- &nbsp; &nbsp;if (memory_region_big_endian(mr)) {</div>
<div>&#43; &nbsp; &nbsp;if (memop_big_endian(mr-&gt;ops-&gt;endianness)) {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; size; i &#43;=
=3D access_size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r |=3D access_fn(mr, a=
ddr &#43; i, value, access_size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;(size - access_size - i) * 8, access_mask, attrs);</div=
>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15659411034833364btcom_--


--===============6964584543690043184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6964584543690043184==--

