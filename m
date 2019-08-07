Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CA84791
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMM-0000fD-FV; Wed, 07 Aug 2019 08:31:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHHK-0008Pq-9J
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:26:38 +0000
X-Inumbo-ID: 0c9c7294-b8ed-11e9-918d-5f3682d5b9a4
Received: from smtpe1.intersmtp.com (unknown [62.239.224.237])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c9c7294-b8ed-11e9-918d-5f3682d5b9a4;
 Wed, 07 Aug 2019 08:26:27 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 09:25:25 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:26:23 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:26:23 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 02/26] tcg: TCGMemOp is now accelerator
 independent MemOp
Thread-Index: AQHVTPnMCE4asD6g1UaFBXLBxM7Xag==
Date: Wed, 7 Aug 2019 08:26:23 +0000
Message-ID: <1565166381875.37725@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 02/26] tcg: TCGMemOp is now
 accelerator independent MemOp
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
Content-Type: multipart/mixed; boundary="===============0287920357058503730=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0287920357058503730==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516638187537725btcom_"

--_000_156516638187537725btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for collapsing the two byte swaps, adjust_endianness and
handle_bswap, along the I/O path.

Target dependant attributes are conditionalize upon NEED_CPU_H.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                             |   1 +
 accel/tcg/cputlb.c                      |   2 +-
 include/exec/memop.h                    | 110 ++++++++++++++++++++++++++
 target/alpha/translate.c                |   2 +-
 target/arm/translate-a64.c              |  48 ++++++------
 target/arm/translate-a64.h              |   2 +-
 target/arm/translate-sve.c              |   2 +-
 target/arm/translate.c                  |  32 ++++----
 target/arm/translate.h                  |   2 +-
 target/hppa/translate.c                 |  14 ++--
 target/i386/translate.c                 | 132 ++++++++++++++++------------=
----
 target/m68k/translate.c                 |   2 +-
 target/microblaze/translate.c           |   4 +-
 target/mips/translate.c                 |   8 +-
 target/openrisc/translate.c             |   4 +-
 target/ppc/translate.c                  |  12 +--
 target/riscv/insn_trans/trans_rva.inc.c |   8 +-
 target/riscv/insn_trans/trans_rvi.inc.c |   4 +-
 target/s390x/translate.c                |   6 +-
 target/s390x/translate_vx.inc.c         |  10 +--
 target/sparc/translate.c                |  14 ++--
 target/tilegx/translate.c               |  10 +--
 target/tricore/translate.c              |   8 +-
 tcg/README                              |   2 +-
 tcg/aarch64/tcg-target.inc.c            |  26 +++----
 tcg/arm/tcg-target.inc.c                |  26 +++----
 tcg/i386/tcg-target.inc.c               |  24 +++---
 tcg/mips/tcg-target.inc.c               |  16 ++--
 tcg/optimize.c                          |   2 +-
 tcg/ppc/tcg-target.inc.c                |  12 +--
 tcg/riscv/tcg-target.inc.c              |  20 ++---
 tcg/s390/tcg-target.inc.c               |  14 ++--
 tcg/sparc/tcg-target.inc.c              |   6 +-
 tcg/tcg-op.c                            |  38 ++++-----
 tcg/tcg-op.h                            |  86 ++++++++++-----------
 tcg/tcg.c                               |   2 +-
 tcg/tcg.h                               | 101 ++----------------------
 trace/mem-internal.h                    |   4 +-
 trace/mem.h                             |   4 +-
 39 files changed, 421 insertions(+), 399 deletions(-)
 create mode 100644 include/exec/memop.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d6de200..c7cf84a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1889,6 +1889,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: ioport.c
+F: include/exec/memop.h
 F: include/exec/memory.h
 F: include/exec/ram_addr.h
 F: memory.c
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bb9897b..523be4c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1133,7 +1133,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, tar=
get_ulong addr,
     uintptr_t index =3D tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *tlbe =3D tlb_entry(env, mmu_idx, addr);
     target_ulong tlb_addr =3D tlb_addr_write(tlbe);
-    TCGMemOp mop =3D get_memop(oi);
+    MemOp mop =3D get_memop(oi);
     int a_bits =3D get_alignment_bits(mop);
     int s_bits =3D mop & MO_SIZE;
     void *hostaddr;
diff --git a/include/exec/memop.h b/include/exec/memop.h
new file mode 100644
index 0000000..7262ca3
--- /dev/null
+++ b/include/exec/memop.h
@@ -0,0 +1,110 @@
+/*
+ * Constants for memory operations
+ *
+ * Authors:
+ *  Richard Henderson <rth@twiddle.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef MEMOP_H
+#define MEMOP_H
+
+typedef enum MemOp {
+    MO_8     =3D 0,
+    MO_16    =3D 1,
+    MO_32    =3D 2,
+    MO_64    =3D 3,
+    MO_SIZE  =3D 3,   /* Mask for the above.  */
+
+    MO_SIGN  =3D 4,   /* Sign-extended, otherwise zero-extended.  */
+
+    MO_BSWAP =3D 8,   /* Host reverse endian.  */
+#ifdef HOST_WORDS_BIGENDIAN
+    MO_LE    =3D MO_BSWAP,
+    MO_BE    =3D 0,
+#else
+    MO_LE    =3D 0,
+    MO_BE    =3D MO_BSWAP,
+#endif
+#ifdef NEED_CPU_H
+#ifdef TARGET_WORDS_BIGENDIAN
+    MO_TE    =3D MO_BE,
+#else
+    MO_TE    =3D MO_LE,
+#endif
+#endif
+
+    /*
+     * MO_UNALN accesses are never checked for alignment.
+     * MO_ALIGN accesses will result in a call to the CPU's
+     * do_unaligned_access hook if the guest address is not aligned.
+     * The default depends on whether the target CPU defines
+     * TARGET_ALIGNED_ONLY.
+     *
+     * Some architectures (e.g. ARMv8) need the address which is aligned
+     * to a size more than the size of the memory access.
+     * Some architectures (e.g. SPARCv9) need an address which is aligned,
+     * but less strictly than the natural alignment.
+     *
+     * MO_ALIGN supposes the alignment size is the size of a memory access=
.
+     *
+     * There are three options:
+     * - unaligned access permitted (MO_UNALN).
+     * - an alignment to the size of an access (MO_ALIGN);
+     * - an alignment to a specified size, which may be more or less than
+     *   the access size (MO_ALIGN_x where 'x' is a size in bytes);
+     */
+    MO_ASHIFT =3D 4,
+    MO_AMASK =3D 7 << MO_ASHIFT,
+#ifdef NEED_CPU_H
+#ifdef TARGET_ALIGNED_ONLY
+    MO_ALIGN =3D 0,
+    MO_UNALN =3D MO_AMASK,
+#else
+    MO_ALIGN =3D MO_AMASK,
+    MO_UNALN =3D 0,
+#endif
+#endif
+    MO_ALIGN_2  =3D 1 << MO_ASHIFT,
+    MO_ALIGN_4  =3D 2 << MO_ASHIFT,
+    MO_ALIGN_8  =3D 3 << MO_ASHIFT,
+    MO_ALIGN_16 =3D 4 << MO_ASHIFT,
+    MO_ALIGN_32 =3D 5 << MO_ASHIFT,
+    MO_ALIGN_64 =3D 6 << MO_ASHIFT,
+
+    /* Combinations of the above, for ease of use.  */
+    MO_UB    =3D MO_8,
+    MO_UW    =3D MO_16,
+    MO_UL    =3D MO_32,
+    MO_SB    =3D MO_SIGN | MO_8,
+    MO_SW    =3D MO_SIGN | MO_16,
+    MO_SL    =3D MO_SIGN | MO_32,
+    MO_Q     =3D MO_64,
+
+    MO_LEUW  =3D MO_LE | MO_UW,
+    MO_LEUL  =3D MO_LE | MO_UL,
+    MO_LESW  =3D MO_LE | MO_SW,
+    MO_LESL  =3D MO_LE | MO_SL,
+    MO_LEQ   =3D MO_LE | MO_Q,
+
+    MO_BEUW  =3D MO_BE | MO_UW,
+    MO_BEUL  =3D MO_BE | MO_UL,
+    MO_BESW  =3D MO_BE | MO_SW,
+    MO_BESL  =3D MO_BE | MO_SL,
+    MO_BEQ   =3D MO_BE | MO_Q,
+
+#ifdef NEED_CPU_H
+    MO_TEUW  =3D MO_TE | MO_UW,
+    MO_TEUL  =3D MO_TE | MO_UL,
+    MO_TESW  =3D MO_TE | MO_SW,
+    MO_TESL  =3D MO_TE | MO_SL,
+    MO_TEQ   =3D MO_TE | MO_Q,
+#endif
+
+    MO_SSIZE =3D MO_SIZE | MO_SIGN,
+} MemOp;
+
+#endif
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 2c9cccf..d5d4888 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -403,7 +403,7 @@ static inline void gen_store_mem(DisasContext *ctx,

 static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int =
rb,
                                            int32_t disp16, int mem_idx,
-                                           TCGMemOp op)
+                                           MemOp op)
 {
     TCGLabel *lab_fail, *lab_done;
     TCGv addr, val;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d323147..b6c07d6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -85,7 +85,7 @@ typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
 typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);
 typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
-typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, TCGMemO=
p);
+typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);

 /* initialize TCG globals.  */
 void a64_translate_init(void)
@@ -455,7 +455,7 @@ TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int =
sf)
  * Dn, Sn, Hn or Bn).
  * (Note that this is not the same mapping as for A32; see cpu.h)
  */
-static inline int fp_reg_offset(DisasContext *s, int regno, TCGMemOp size)
+static inline int fp_reg_offset(DisasContext *s, int regno, MemOp size)
 {
     return vec_reg_offset(s, regno, 0, size);
 }
@@ -871,7 +871,7 @@ static void do_gpr_ld_memidx(DisasContext *s,
                              bool iss_valid, unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    TCGMemOp memop =3D s->be_data + size;
+    MemOp memop =3D s->be_data + size;

     g_assert(size <=3D 3);

@@ -948,7 +948,7 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv=
_i64 tcg_addr, int size)
     TCGv_i64 tmphi;

     if (size < 4) {
-        TCGMemOp memop =3D s->be_data + size;
+        MemOp memop =3D s->be_data + size;
         tmphi =3D tcg_const_i64(0);
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
     } else {
@@ -989,7 +989,7 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv=
_i64 tcg_addr, int size)

 /* Get value of an element within a vector register */
 static void read_vec_element(DisasContext *s, TCGv_i64 tcg_dest, int srcid=
x,
-                             int element, TCGMemOp memop)
+                             int element, MemOp memop)
 {
     int vect_off =3D vec_reg_offset(s, srcidx, element, memop & MO_SIZE);
     switch (memop) {
@@ -1021,7 +1021,7 @@ static void read_vec_element(DisasContext *s, TCGv_i6=
4 tcg_dest, int srcidx,
 }

 static void read_vec_element_i32(DisasContext *s, TCGv_i32 tcg_dest, int s=
rcidx,
-                                 int element, TCGMemOp memop)
+                                 int element, MemOp memop)
 {
     int vect_off =3D vec_reg_offset(s, srcidx, element, memop & MO_SIZE);
     switch (memop) {
@@ -1048,7 +1048,7 @@ static void read_vec_element_i32(DisasContext *s, TCG=
v_i32 tcg_dest, int srcidx,

 /* Set value of an element within a vector register */
 static void write_vec_element(DisasContext *s, TCGv_i64 tcg_src, int desti=
dx,
-                              int element, TCGMemOp memop)
+                              int element, MemOp memop)
 {
     int vect_off =3D vec_reg_offset(s, destidx, element, memop & MO_SIZE);
     switch (memop) {
@@ -1070,7 +1070,7 @@ static void write_vec_element(DisasContext *s, TCGv_i=
64 tcg_src, int destidx,
 }

 static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
-                                  int destidx, int element, TCGMemOp memop=
)
+                                  int destidx, int element, MemOp memop)
 {
     int vect_off =3D vec_reg_offset(s, destidx, element, memop & MO_SIZE);
     switch (memop) {
@@ -1090,7 +1090,7 @@ static void write_vec_element_i32(DisasContext *s, TC=
Gv_i32 tcg_src,

 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
-                      TCGv_i64 tcg_addr, int size, TCGMemOp endian)
+                      TCGv_i64 tcg_addr, int size, MemOp endian)
 {
     TCGv_i64 tcg_tmp =3D tcg_temp_new_i64();

@@ -1102,7 +1102,7 @@ static void do_vec_st(DisasContext *s, int srcidx, in=
t element,

 /* Load from memory to vector register */
 static void do_vec_ld(DisasContext *s, int destidx, int element,
-                      TCGv_i64 tcg_addr, int size, TCGMemOp endian)
+                      TCGv_i64 tcg_addr, int size, MemOp endian)
 {
     TCGv_i64 tcg_tmp =3D tcg_temp_new_i64();

@@ -2200,7 +2200,7 @@ static void gen_load_exclusive(DisasContext *s, int r=
t, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     int idx =3D get_mem_index(s);
-    TCGMemOp memop =3D s->be_data;
+    MemOp memop =3D s->be_data;

     g_assert(size <=3D 3);
     if (is_pair) {
@@ -3286,7 +3286,7 @@ static void disas_ldst_multiple_struct(DisasContext *=
s, uint32_t insn)
     bool is_postidx =3D extract32(insn, 23, 1);
     bool is_q =3D extract32(insn, 30, 1);
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
-    TCGMemOp endian =3D s->be_data;
+    MemOp endian =3D s->be_data;

     int ebytes;   /* bytes per element */
     int elements; /* elements per vector */
@@ -5455,7 +5455,7 @@ static void disas_fp_csel(DisasContext *s, uint32_t i=
nsn)
     unsigned int mos, type, rm, cond, rn, rd;
     TCGv_i64 t_true, t_false, t_zero;
     DisasCompare64 c;
-    TCGMemOp sz;
+    MemOp sz;

     mos =3D extract32(insn, 29, 3);
     type =3D extract32(insn, 22, 2);
@@ -6267,7 +6267,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t in=
sn)
     int mos =3D extract32(insn, 29, 3);
     uint64_t imm;
     TCGv_i64 tcg_res;
-    TCGMemOp sz;
+    MemOp sz;

     if (mos || imm5) {
         unallocated_encoding(s);
@@ -7030,7 +7030,7 @@ static TCGv_i32 do_reduction_op(DisasContext *s, int =
fpopcode, int rn,
 {
     if (esize =3D=3D size) {
         int element;
-        TCGMemOp msize =3D esize =3D=3D 16 ? MO_16 : MO_32;
+        MemOp msize =3D esize =3D=3D 16 ? MO_16 : MO_32;
         TCGv_i32 tcg_elem;

         /* We should have one register left here */
@@ -8022,7 +8022,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, b=
ool is_scalar, bool is_q,
     int shift =3D (2 * esize) - immhb;
     int elements =3D is_scalar ? 1 : (64 / esize);
     bool round =3D extract32(opcode, 0, 1);
-    TCGMemOp ldop =3D (size + 1) | (is_u_shift ? 0 : MO_SIGN);
+    MemOp ldop =3D (size + 1) | (is_u_shift ? 0 : MO_SIGN);
     TCGv_i64 tcg_rn, tcg_rd, tcg_round;
     TCGv_i32 tcg_rd_narrowed;
     TCGv_i64 tcg_final;
@@ -8181,7 +8181,7 @@ static void handle_simd_qshl(DisasContext *s, bool sc=
alar, bool is_q,
             }
         };
         NeonGenTwoOpEnvFn *genfn =3D fns[src_unsigned][dst_unsigned][size]=
;
-        TCGMemOp memop =3D scalar ? size : MO_32;
+        MemOp memop =3D scalar ? size : MO_32;
         int maxpass =3D scalar ? 1 : is_q ? 4 : 2;

         for (pass =3D 0; pass < maxpass; pass++) {
@@ -8225,7 +8225,7 @@ static void handle_simd_intfp_conv(DisasContext *s, i=
nt rd, int rn,
     TCGv_ptr tcg_fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);
     TCGv_i32 tcg_shift =3D NULL;

-    TCGMemOp mop =3D size | (is_signed ? MO_SIGN : 0);
+    MemOp mop =3D size | (is_signed ? MO_SIGN : 0);
     int pass;

     if (fracbits || size =3D=3D MO_64) {
@@ -10004,7 +10004,7 @@ static void handle_vec_simd_shri(DisasContext *s, b=
ool is_q, bool is_u,
     int dsize =3D is_q ? 128 : 64;
     int esize =3D 8 << size;
     int elements =3D dsize/esize;
-    TCGMemOp memop =3D size | (is_u ? 0 : MO_SIGN);
+    MemOp memop =3D size | (is_u ? 0 : MO_SIGN);
     TCGv_i64 tcg_rn =3D new_tmp_a64(s);
     TCGv_i64 tcg_rd =3D new_tmp_a64(s);
     TCGv_i64 tcg_round;
@@ -10347,7 +10347,7 @@ static void handle_3rd_widening(DisasContext *s, in=
t is_q, int is_u, int size,
             TCGv_i64 tcg_op1 =3D tcg_temp_new_i64();
             TCGv_i64 tcg_op2 =3D tcg_temp_new_i64();
             TCGv_i64 tcg_passres;
-            TCGMemOp memop =3D MO_32 | (is_u ? 0 : MO_SIGN);
+            MemOp memop =3D MO_32 | (is_u ? 0 : MO_SIGN);

             int elt =3D pass + is_q * 2;

@@ -11827,7 +11827,7 @@ static void handle_2misc_pairwise(DisasContext *s, =
int opcode, bool u,

     if (size =3D=3D 2) {
         /* 32 + 32 -> 64 op */
-        TCGMemOp memop =3D size + (u ? 0 : MO_SIGN);
+        MemOp memop =3D size + (u ? 0 : MO_SIGN);

         for (pass =3D 0; pass < maxpass; pass++) {
             TCGv_i64 tcg_op1 =3D tcg_temp_new_i64();
@@ -12849,7 +12849,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)

     switch (is_fp) {
     case 1: /* normal fp */
-        /* convert insn encoded size to TCGMemOp size */
+        /* convert insn encoded size to MemOp size */
         switch (size) {
         case 0: /* half-precision */
             size =3D MO_16;
@@ -12897,7 +12897,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
         return;
     }

-    /* Given TCGMemOp size, adjust register and indexing.  */
+    /* Given MemOp size, adjust register and indexing.  */
     switch (size) {
     case MO_16:
         index =3D h << 2 | l << 1 | m;
@@ -13194,7 +13194,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
         TCGv_i64 tcg_res[2];
         int pass;
         bool satop =3D extract32(opcode, 0, 1);
-        TCGMemOp memop =3D MO_32;
+        MemOp memop =3D MO_32;

         if (satop || !u) {
             memop |=3D MO_SIGN;
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 9ab4087..f1246b7 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -64,7 +64,7 @@ static inline void assert_fp_access_checked(DisasContext =
*s)
  * the FP/vector register Qn.
  */
 static inline int vec_reg_offset(DisasContext *s, int regno,
-                                 int element, TCGMemOp size)
+                                 int element, MemOp size)
 {
     int element_size =3D 1 << size;
     int offs =3D element * element_size;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fa068b0..5d7edd0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4567,7 +4567,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a=
)
  */

 /* The memory mode of the dtype.  */
-static const TCGMemOp dtype_mop[16] =3D {
+static const MemOp dtype_mop[16] =3D {
     MO_UB, MO_UB, MO_UB, MO_UB,
     MO_SL, MO_UW, MO_UW, MO_UW,
     MO_SW, MO_SW, MO_UL, MO_UL,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462..d116c8c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -114,7 +114,7 @@ typedef enum ISSInfo {
 } ISSInfo;

 /* Save the syndrome information for a Data Abort */
-static void disas_set_da_iss(DisasContext *s, TCGMemOp memop, ISSInfo issi=
nfo)
+static void disas_set_da_iss(DisasContext *s, MemOp memop, ISSInfo issinfo=
)
 {
     uint32_t syn;
     int sas =3D memop & MO_SIZE;
@@ -1079,7 +1079,7 @@ static inline void store_reg_from_load(DisasContext *=
s, int reg, TCGv_i32 var)
  * that the address argument is TCGv_i32 rather than TCGv.
  */

-static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, TCGMemOp o=
p)
+static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
 {
     TCGv addr =3D tcg_temp_new();
     tcg_gen_extu_i32_tl(addr, a32);
@@ -1092,7 +1092,7 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCG=
v_i32 a32, TCGMemOp op)
 }

 static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, TCGMemOp opc)
+                            int index, MemOp opc)
 {
     TCGv addr;

@@ -1107,7 +1107,7 @@ static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32=
 val, TCGv_i32 a32,
 }

 static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, TCGMemOp opc)
+                            int index, MemOp opc)
 {
     TCGv addr;

@@ -1160,7 +1160,7 @@ static inline void gen_aa32_frob64(DisasContext *s, T=
CGv_i64 val)
 }

 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, TCGMemOp opc)
+                            int index, MemOp opc)
 {
     TCGv addr =3D gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
@@ -1175,7 +1175,7 @@ static inline void gen_aa32_ld64(DisasContext *s, TCG=
v_i64 val,
 }

 static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, TCGMemOp opc)
+                            int index, MemOp opc)
 {
     TCGv addr =3D gen_aa32_addr(s, a32, opc);

@@ -1400,7 +1400,7 @@ neon_reg_offset (int reg, int n)
  * where 0 is the least significant end of the register.
  */
 static inline long
-neon_element_offset(int reg, int element, TCGMemOp size)
+neon_element_offset(int reg, int element, MemOp size)
 {
     int element_size =3D 1 << size;
     int ofs =3D element * element_size;
@@ -1422,7 +1422,7 @@ static TCGv_i32 neon_load_reg(int reg, int pass)
     return tmp;
 }

-static void neon_load_element(TCGv_i32 var, int reg, int ele, TCGMemOp mop=
)
+static void neon_load_element(TCGv_i32 var, int reg, int ele, MemOp mop)
 {
     long offset =3D neon_element_offset(reg, ele, mop & MO_SIZE);

@@ -1441,7 +1441,7 @@ static void neon_load_element(TCGv_i32 var, int reg, =
int ele, TCGMemOp mop)
     }
 }

-static void neon_load_element64(TCGv_i64 var, int reg, int ele, TCGMemOp m=
op)
+static void neon_load_element64(TCGv_i64 var, int reg, int ele, MemOp mop)
 {
     long offset =3D neon_element_offset(reg, ele, mop & MO_SIZE);

@@ -1469,7 +1469,7 @@ static void neon_store_reg(int reg, int pass, TCGv_i3=
2 var)
     tcg_temp_free_i32(var);
 }

-static void neon_store_element(int reg, int ele, TCGMemOp size, TCGv_i32 v=
ar)
+static void neon_store_element(int reg, int ele, MemOp size, TCGv_i32 var)
 {
     long offset =3D neon_element_offset(reg, ele, size);

@@ -1488,7 +1488,7 @@ static void neon_store_element(int reg, int ele, TCGM=
emOp size, TCGv_i32 var)
     }
 }

-static void neon_store_element64(int reg, int ele, TCGMemOp size, TCGv_i64=
 var)
+static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 va=
r)
 {
     long offset =3D neon_element_offset(reg, ele, size);

@@ -3558,7 +3558,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32=
_t insn)
     int n;
     int vec_size;
     int mmu_idx;
-    TCGMemOp endian;
+    MemOp endian;
     TCGv_i32 addr;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -6867,7 +6867,7 @@ static int disas_neon_data_insn(DisasContext *s, uint=
32_t insn)
             } else if ((insn & 0x380) =3D=3D 0) {
                 /* VDUP */
                 int element;
-                TCGMemOp size;
+                MemOp size;

                 if ((insn & (7 << 16)) =3D=3D 0 || (q && (rd & 1))) {
                     return 1;
@@ -7435,7 +7435,7 @@ static void gen_load_exclusive(DisasContext *s, int r=
t, int rt2,
                                TCGv_i32 addr, int size)
 {
     TCGv_i32 tmp =3D tcg_temp_new_i32();
-    TCGMemOp opc =3D size | MO_ALIGN | s->be_data;
+    MemOp opc =3D size | MO_ALIGN | s->be_data;

     s->is_ldex =3D true;

@@ -7489,7 +7489,7 @@ static void gen_store_exclusive(DisasContext *s, int =
rd, int rt, int rt2,
     TCGv taddr;
     TCGLabel *done_label;
     TCGLabel *fail_label;
-    TCGMemOp opc =3D size | MO_ALIGN | s->be_data;
+    MemOp opc =3D size | MO_ALIGN | s->be_data;

     /* if (env->exclusive_addr =3D=3D addr && env->exclusive_val =3D=3D [a=
ddr]) {
          [addr] =3D {Rt};
@@ -8603,7 +8603,7 @@ static void disas_arm_insn(DisasContext *s, unsigned =
int insn)
                         */

                         TCGv taddr;
-                        TCGMemOp opc =3D s->be_data;
+                        MemOp opc =3D s->be_data;

                         rm =3D (insn) & 0xf;

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a20f6e2..284c510 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -21,7 +21,7 @@ typedef struct DisasContext {
     int condexec_cond;
     int thumb;
     int sctlr_b;
-    TCGMemOp be_data;
+    MemOp be_data;
 #if !defined(CONFIG_USER_ONLY)
     int user;
 #endif
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 188fe68..ff4802a 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -1500,7 +1500,7 @@ static void form_gva(DisasContext *ctx, TCGv_tl *pgva=
, TCGv_reg *pofs,
  */
 static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
                        unsigned rx, int scale, target_sreg disp,
-                       unsigned sp, int modify, TCGMemOp mop)
+                       unsigned sp, int modify, MemOp mop)
 {
     TCGv_reg ofs;
     TCGv_tl addr;
@@ -1518,7 +1518,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 de=
st, unsigned rb,

 static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
                        unsigned rx, int scale, target_sreg disp,
-                       unsigned sp, int modify, TCGMemOp mop)
+                       unsigned sp, int modify, MemOp mop)
 {
     TCGv_reg ofs;
     TCGv_tl addr;
@@ -1536,7 +1536,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 de=
st, unsigned rb,

 static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
                         unsigned rx, int scale, target_sreg disp,
-                        unsigned sp, int modify, TCGMemOp mop)
+                        unsigned sp, int modify, MemOp mop)
 {
     TCGv_reg ofs;
     TCGv_tl addr;
@@ -1554,7 +1554,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 s=
rc, unsigned rb,

 static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
                         unsigned rx, int scale, target_sreg disp,
-                        unsigned sp, int modify, TCGMemOp mop)
+                        unsigned sp, int modify, MemOp mop)
 {
     TCGv_reg ofs;
     TCGv_tl addr;
@@ -1580,7 +1580,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 s=
rc, unsigned rb,

 static bool do_load(DisasContext *ctx, unsigned rt, unsigned rb,
                     unsigned rx, int scale, target_sreg disp,
-                    unsigned sp, int modify, TCGMemOp mop)
+                    unsigned sp, int modify, MemOp mop)
 {
     TCGv_reg dest;

@@ -1653,7 +1653,7 @@ static bool trans_fldd(DisasContext *ctx, arg_ldst *a=
)

 static bool do_store(DisasContext *ctx, unsigned rt, unsigned rb,
                      target_sreg disp, unsigned sp,
-                     int modify, TCGMemOp mop)
+                     int modify, MemOp mop)
 {
     nullify_over(ctx);
     do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, disp, sp, modify, mop);
@@ -2940,7 +2940,7 @@ static bool trans_st(DisasContext *ctx, arg_ldst *a)

 static bool trans_ldc(DisasContext *ctx, arg_ldst *a)
 {
-    TCGMemOp mop =3D MO_TEUL | MO_ALIGN_16 | a->size;
+    MemOp mop =3D MO_TEUL | MO_ALIGN_16 | a->size;
     TCGv_reg zero, dest, ofs;
     TCGv_tl addr;

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 03150a8..def9867 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -87,8 +87,8 @@ typedef struct DisasContext {
     /* current insn context */
     int override; /* -1 if no override */
     int prefix;
-    TCGMemOp aflag;
-    TCGMemOp dflag;
+    MemOp aflag;
+    MemOp dflag;
     target_ulong pc_start;
     target_ulong pc; /* pc =3D eip + cs_base */
     /* current block context */
@@ -149,7 +149,7 @@ static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
-static void gen_op(DisasContext *s1, int op, TCGMemOp ot, int d);
+static void gen_op(DisasContext *s1, int op, MemOp ot, int d);

 /* i386 arith/logic operations */
 enum {
@@ -320,7 +320,7 @@ static inline bool byte_reg_is_xH(DisasContext *s, int =
reg)
 }

 /* Select the size of a push/pop operation.  */
-static inline TCGMemOp mo_pushpop(DisasContext *s, TCGMemOp ot)
+static inline MemOp mo_pushpop(DisasContext *s, MemOp ot)
 {
     if (CODE64(s)) {
         return ot =3D=3D MO_16 ? MO_16 : MO_64;
@@ -330,13 +330,13 @@ static inline TCGMemOp mo_pushpop(DisasContext *s, TC=
GMemOp ot)
 }

 /* Select the size of the stack pointer.  */
-static inline TCGMemOp mo_stacksize(DisasContext *s)
+static inline MemOp mo_stacksize(DisasContext *s)
 {
     return CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
 }

 /* Select only size 64 else 32.  Used for SSE operand sizes.  */
-static inline TCGMemOp mo_64_32(TCGMemOp ot)
+static inline MemOp mo_64_32(MemOp ot)
 {
 #ifdef TARGET_X86_64
     return ot =3D=3D MO_64 ? MO_64 : MO_32;
@@ -347,19 +347,19 @@ static inline TCGMemOp mo_64_32(TCGMemOp ot)

 /* Select size 8 if lsb of B is clear, else OT.  Used for decoding
    byte vs word opcodes.  */
-static inline TCGMemOp mo_b_d(int b, TCGMemOp ot)
+static inline MemOp mo_b_d(int b, MemOp ot)
 {
     return b & 1 ? ot : MO_8;
 }

 /* Select size 8 if lsb of B is clear, else OT capped at 32.
    Used for decoding operand size of port opcodes.  */
-static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)
+static inline MemOp mo_b_d32(int b, MemOp ot)
 {
     return b & 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32) : MO_8;
 }

-static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int reg, TCGv t=
0)
+static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv t0)
 {
     switch(ot) {
     case MO_8:
@@ -388,7 +388,7 @@ static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp =
ot, int reg, TCGv t0)
 }

 static inline
-void gen_op_mov_v_reg(DisasContext *s, TCGMemOp ot, TCGv t0, int reg)
+void gen_op_mov_v_reg(DisasContext *s, MemOp ot, TCGv t0, int reg)
 {
     if (ot =3D=3D MO_8 && byte_reg_is_xH(s, reg)) {
         tcg_gen_extract_tl(t0, cpu_regs[reg - 4], 8, 8);
@@ -411,13 +411,13 @@ static inline void gen_op_jmp_v(TCGv dest)
 }

 static inline
-void gen_op_add_reg_im(DisasContext *s, TCGMemOp size, int reg, int32_t va=
l)
+void gen_op_add_reg_im(DisasContext *s, MemOp size, int reg, int32_t val)
 {
     tcg_gen_addi_tl(s->tmp0, cpu_regs[reg], val);
     gen_op_mov_reg_v(s, size, reg, s->tmp0);
 }

-static inline void gen_op_add_reg_T0(DisasContext *s, TCGMemOp size, int r=
eg)
+static inline void gen_op_add_reg_T0(DisasContext *s, MemOp size, int reg)
 {
     tcg_gen_add_tl(s->tmp0, cpu_regs[reg], s->T0);
     gen_op_mov_reg_v(s, size, reg, s->tmp0);
@@ -451,7 +451,7 @@ static inline void gen_jmp_im(DisasContext *s, target_u=
long pc)
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
-static void gen_lea_v_seg(DisasContext *s, TCGMemOp aflag, TCGv a0,
+static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
                           int def_seg, int ovr_seg)
 {
     switch (aflag) {
@@ -514,13 +514,13 @@ static inline void gen_string_movl_A0_EDI(DisasContex=
t *s)
     gen_lea_v_seg(s, s->aflag, cpu_regs[R_EDI], R_ES, -1);
 }

-static inline void gen_op_movl_T0_Dshift(DisasContext *s, TCGMemOp ot)
+static inline void gen_op_movl_T0_Dshift(DisasContext *s, MemOp ot)
 {
     tcg_gen_ld32s_tl(s->T0, cpu_env, offsetof(CPUX86State, df));
     tcg_gen_shli_tl(s->T0, s->T0, ot);
 };

-static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp size, bool sign)
+static TCGv gen_ext_tl(TCGv dst, TCGv src, MemOp size, bool sign)
 {
     switch (size) {
     case MO_8:
@@ -551,18 +551,18 @@ static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp s=
ize, bool sign)
     }
 }

-static void gen_extu(TCGMemOp ot, TCGv reg)
+static void gen_extu(MemOp ot, TCGv reg)
 {
     gen_ext_tl(reg, reg, ot, false);
 }

-static void gen_exts(TCGMemOp ot, TCGv reg)
+static void gen_exts(MemOp ot, TCGv reg)
 {
     gen_ext_tl(reg, reg, ot, true);
 }

 static inline
-void gen_op_jnz_ecx(DisasContext *s, TCGMemOp size, TCGLabel *label1)
+void gen_op_jnz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)
 {
     tcg_gen_mov_tl(s->tmp0, cpu_regs[R_ECX]);
     gen_extu(size, s->tmp0);
@@ -570,14 +570,14 @@ void gen_op_jnz_ecx(DisasContext *s, TCGMemOp size, T=
CGLabel *label1)
 }

 static inline
-void gen_op_jz_ecx(DisasContext *s, TCGMemOp size, TCGLabel *label1)
+void gen_op_jz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)
 {
     tcg_gen_mov_tl(s->tmp0, cpu_regs[R_ECX]);
     gen_extu(size, s->tmp0);
     tcg_gen_brcondi_tl(TCG_COND_EQ, s->tmp0, 0, label1);
 }

-static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCGv_i32 n)
+static void gen_helper_in_func(MemOp ot, TCGv v, TCGv_i32 n)
 {
     switch (ot) {
     case MO_8:
@@ -594,7 +594,7 @@ static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCG=
v_i32 n)
     }
 }

-static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v, TCGv_i32 n)
+static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
 {
     switch (ot) {
     case MO_8:
@@ -611,7 +611,7 @@ static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v=
, TCGv_i32 n)
     }
 }

-static void gen_check_io(DisasContext *s, TCGMemOp ot, target_ulong cur_ei=
p,
+static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
                          uint32_t svm_flags)
 {
     target_ulong next_eip;
@@ -644,7 +644,7 @@ static void gen_check_io(DisasContext *s, TCGMemOp ot, =
target_ulong cur_eip,
     }
 }

-static inline void gen_movs(DisasContext *s, TCGMemOp ot)
+static inline void gen_movs(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -840,7 +840,7 @@ static CCPrepare gen_prepare_eflags_s(DisasContext *s, =
TCGv reg)
         return (CCPrepare) { .cond =3D TCG_COND_NEVER, .mask =3D -1 };
     default:
         {
-            TCGMemOp size =3D (s->cc_op - CC_OP_ADDB) & 3;
+            MemOp size =3D (s->cc_op - CC_OP_ADDB) & 3;
             TCGv t0 =3D gen_ext_tl(reg, cpu_cc_dst, size, true);
             return (CCPrepare) { .cond =3D TCG_COND_LT, .reg =3D t0, .mask=
 =3D -1 };
         }
@@ -885,7 +885,7 @@ static CCPrepare gen_prepare_eflags_z(DisasContext *s, =
TCGv reg)
                              .mask =3D -1 };
     default:
         {
-            TCGMemOp size =3D (s->cc_op - CC_OP_ADDB) & 3;
+            MemOp size =3D (s->cc_op - CC_OP_ADDB) & 3;
             TCGv t0 =3D gen_ext_tl(reg, cpu_cc_dst, size, false);
             return (CCPrepare) { .cond =3D TCG_COND_EQ, .reg =3D t0, .mask=
 =3D -1 };
         }
@@ -897,7 +897,7 @@ static CCPrepare gen_prepare_eflags_z(DisasContext *s, =
TCGv reg)
 static CCPrepare gen_prepare_cc(DisasContext *s, int b, TCGv reg)
 {
     int inv, jcc_op, cond;
-    TCGMemOp size;
+    MemOp size;
     CCPrepare cc;
     TCGv t0;

@@ -1075,7 +1075,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s, t=
arget_ulong next_eip)
     return l2;
 }

-static inline void gen_stos(DisasContext *s, TCGMemOp ot)
+static inline void gen_stos(DisasContext *s, MemOp ot)
 {
     gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
     gen_string_movl_A0_EDI(s);
@@ -1084,7 +1084,7 @@ static inline void gen_stos(DisasContext *s, TCGMemOp=
 ot)
     gen_op_add_reg_T0(s, s->aflag, R_EDI);
 }

-static inline void gen_lods(DisasContext *s, TCGMemOp ot)
+static inline void gen_lods(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1093,7 +1093,7 @@ static inline void gen_lods(DisasContext *s, TCGMemOp=
 ot)
     gen_op_add_reg_T0(s, s->aflag, R_ESI);
 }

-static inline void gen_scas(DisasContext *s, TCGMemOp ot)
+static inline void gen_scas(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     gen_op_ld_v(s, ot, s->T1, s->A0);
@@ -1102,7 +1102,7 @@ static inline void gen_scas(DisasContext *s, TCGMemOp=
 ot)
     gen_op_add_reg_T0(s, s->aflag, R_EDI);
 }

-static inline void gen_cmps(DisasContext *s, TCGMemOp ot)
+static inline void gen_cmps(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     gen_op_ld_v(s, ot, s->T1, s->A0);
@@ -1126,7 +1126,7 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_po=
rt, int ot)
 }


-static inline void gen_ins(DisasContext *s, TCGMemOp ot)
+static inline void gen_ins(DisasContext *s, MemOp ot)
 {
     if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -1148,7 +1148,7 @@ static inline void gen_ins(DisasContext *s, TCGMemOp =
ot)
     }
 }

-static inline void gen_outs(DisasContext *s, TCGMemOp ot)
+static inline void gen_outs(DisasContext *s, MemOp ot)
 {
     if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
@@ -1171,7 +1171,7 @@ static inline void gen_outs(DisasContext *s, TCGMemOp=
 ot)
 /* same method as Valgrind : we generate jumps to current or next
    instruction */
 #define GEN_REPZ(op)                                                      =
    \
-static inline void gen_repz_ ## op(DisasContext *s, TCGMemOp ot,          =
    \
+static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,             =
 \
                                  target_ulong cur_eip, target_ulong next_e=
ip) \
 {                                                                         =
    \
     TCGLabel *l2;                                                         =
    \
@@ -1187,7 +1187,7 @@ static inline void gen_repz_ ## op(DisasContext *s, T=
CGMemOp ot,              \
 }

 #define GEN_REPZ2(op)                                                     =
    \
-static inline void gen_repz_ ## op(DisasContext *s, TCGMemOp ot,          =
    \
+static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,             =
 \
                                    target_ulong cur_eip,                  =
    \
                                    target_ulong next_eip,                 =
    \
                                    int nz)                                =
    \
@@ -1284,7 +1284,7 @@ static void gen_illegal_opcode(DisasContext *s)
 }

 /* if d =3D=3D OR_TMP0, it means memory operand (address in A0) */
-static void gen_op(DisasContext *s1, int op, TCGMemOp ot, int d)
+static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
     if (d !=3D OR_TMP0) {
         if (s1->prefix & PREFIX_LOCK) {
@@ -1395,7 +1395,7 @@ static void gen_op(DisasContext *s1, int op, TCGMemOp=
 ot, int d)
 }

 /* if d =3D=3D OR_TMP0, it means memory operand (address in A0) */
-static void gen_inc(DisasContext *s1, TCGMemOp ot, int d, int c)
+static void gen_inc(DisasContext *s1, MemOp ot, int d, int c)
 {
     if (s1->prefix & PREFIX_LOCK) {
         if (d !=3D OR_TMP0) {
@@ -1421,7 +1421,7 @@ static void gen_inc(DisasContext *s1, TCGMemOp ot, in=
t d, int c)
     set_cc_op(s1, (c > 0 ? CC_OP_INCB : CC_OP_DECB) + ot);
 }

-static void gen_shift_flags(DisasContext *s, TCGMemOp ot, TCGv result,
+static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
                             TCGv shm1, TCGv count, bool is_right)
 {
     TCGv_i32 z32, s32, oldop;
@@ -1466,7 +1466,7 @@ static void gen_shift_flags(DisasContext *s, TCGMemOp=
 ot, TCGv result,
     set_cc_op(s, CC_OP_DYNAMIC);
 }

-static void gen_shift_rm_T1(DisasContext *s, TCGMemOp ot, int op1,
+static void gen_shift_rm_T1(DisasContext *s, MemOp ot, int op1,
                             int is_right, int is_arith)
 {
     target_ulong mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x1f);
@@ -1502,7 +1502,7 @@ static void gen_shift_rm_T1(DisasContext *s, TCGMemOp=
 ot, int op1,
     gen_shift_flags(s, ot, s->T0, s->tmp0, s->T1, is_right);
 }

-static void gen_shift_rm_im(DisasContext *s, TCGMemOp ot, int op1, int op2=
,
+static void gen_shift_rm_im(DisasContext *s, MemOp ot, int op1, int op2,
                             int is_right, int is_arith)
 {
     int mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x1f);
@@ -1542,7 +1542,7 @@ static void gen_shift_rm_im(DisasContext *s, TCGMemOp=
 ot, int op1, int op2,
     }
 }

-static void gen_rot_rm_T1(DisasContext *s, TCGMemOp ot, int op1, int is_ri=
ght)
+static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right=
)
 {
     target_ulong mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x1f);
     TCGv_i32 t0, t1;
@@ -1627,7 +1627,7 @@ static void gen_rot_rm_T1(DisasContext *s, TCGMemOp o=
t, int op1, int is_right)
     set_cc_op(s, CC_OP_DYNAMIC);
 }

-static void gen_rot_rm_im(DisasContext *s, TCGMemOp ot, int op1, int op2,
+static void gen_rot_rm_im(DisasContext *s, MemOp ot, int op1, int op2,
                           int is_right)
 {
     int mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x1f);
@@ -1705,7 +1705,7 @@ static void gen_rot_rm_im(DisasContext *s, TCGMemOp o=
t, int op1, int op2,
 }

 /* XXX: add faster immediate =3D 1 case */
-static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp ot, int op1,
+static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
                            int is_right)
 {
     gen_compute_eflags(s);
@@ -1761,7 +1761,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,
 }

 /* XXX: add faster immediate case */
-static void gen_shiftd_rm_T1(DisasContext *s, TCGMemOp ot, int op1,
+static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
                              bool is_right, TCGv count_in)
 {
     target_ulong mask =3D (ot =3D=3D MO_64 ? 63 : 31);
@@ -1842,7 +1842,7 @@ static void gen_shiftd_rm_T1(DisasContext *s, TCGMemO=
p ot, int op1,
     tcg_temp_free(count);
 }

-static void gen_shift(DisasContext *s1, int op, TCGMemOp ot, int d, int s)
+static void gen_shift(DisasContext *s1, int op, MemOp ot, int d, int s)
 {
     if (s !=3D OR_TMP1)
         gen_op_mov_v_reg(s1, ot, s1->T1, s);
@@ -1872,7 +1872,7 @@ static void gen_shift(DisasContext *s1, int op, TCGMe=
mOp ot, int d, int s)
     }
 }

-static void gen_shifti(DisasContext *s1, int op, TCGMemOp ot, int d, int c=
)
+static void gen_shifti(DisasContext *s1, int op, MemOp ot, int d, int c)
 {
     switch(op) {
     case OP_ROL:
@@ -2149,7 +2149,7 @@ static void gen_add_A0_ds_seg(DisasContext *s)
 /* generate modrm memory load or store of 'reg'. TMP0 is used if reg =3D=
=3D
    OR_TMP0 */
 static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, int modrm,
-                           TCGMemOp ot, int reg, int is_store)
+                           MemOp ot, int reg, int is_store)
 {
     int mod, rm;

@@ -2179,7 +2179,7 @@ static void gen_ldst_modrm(CPUX86State *env, DisasCon=
text *s, int modrm,
     }
 }

-static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, TCGMemO=
p ot)
+static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, MemOp o=
t)
 {
     uint32_t ret;

@@ -2202,7 +2202,7 @@ static inline uint32_t insn_get(CPUX86State *env, Dis=
asContext *s, TCGMemOp ot)
     return ret;
 }

-static inline int insn_const_size(TCGMemOp ot)
+static inline int insn_const_size(MemOp ot)
 {
     if (ot <=3D MO_32) {
         return 1 << ot;
@@ -2266,7 +2266,7 @@ static inline void gen_jcc(DisasContext *s, int b,
     }
 }

-static void gen_cmovcc1(CPUX86State *env, DisasContext *s, TCGMemOp ot, in=
t b,
+static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b=
,
                         int modrm, int reg)
 {
     CCPrepare cc;
@@ -2363,8 +2363,8 @@ static inline void gen_stack_update(DisasContext *s, =
int addend)
 /* Generate a push. It depends on ss32, addseg and dflag.  */
 static void gen_push_v(DisasContext *s, TCGv val)
 {
-    TCGMemOp d_ot =3D mo_pushpop(s, s->dflag);
-    TCGMemOp a_ot =3D mo_stacksize(s);
+    MemOp d_ot =3D mo_pushpop(s, s->dflag);
+    MemOp a_ot =3D mo_stacksize(s);
     int size =3D 1 << d_ot;
     TCGv new_esp =3D s->A0;

@@ -2383,9 +2383,9 @@ static void gen_push_v(DisasContext *s, TCGv val)
 }

 /* two step pop is necessary for precise exceptions */
-static TCGMemOp gen_pop_T0(DisasContext *s)
+static MemOp gen_pop_T0(DisasContext *s)
 {
-    TCGMemOp d_ot =3D mo_pushpop(s, s->dflag);
+    MemOp d_ot =3D mo_pushpop(s, s->dflag);

     gen_lea_v_seg(s, mo_stacksize(s), cpu_regs[R_ESP], R_SS, -1);
     gen_op_ld_v(s, d_ot, s->T0, s->A0);
@@ -2393,7 +2393,7 @@ static TCGMemOp gen_pop_T0(DisasContext *s)
     return d_ot;
 }

-static inline void gen_pop_update(DisasContext *s, TCGMemOp ot)
+static inline void gen_pop_update(DisasContext *s, MemOp ot)
 {
     gen_stack_update(s, 1 << ot);
 }
@@ -2405,8 +2405,8 @@ static inline void gen_stack_A0(DisasContext *s)

 static void gen_pusha(DisasContext *s)
 {
-    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_16;
-    TCGMemOp d_ot =3D s->dflag;
+    MemOp s_ot =3D s->ss32 ? MO_32 : MO_16;
+    MemOp d_ot =3D s->dflag;
     int size =3D 1 << d_ot;
     int i;

@@ -2421,8 +2421,8 @@ static void gen_pusha(DisasContext *s)

 static void gen_popa(DisasContext *s)
 {
-    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_16;
-    TCGMemOp d_ot =3D s->dflag;
+    MemOp s_ot =3D s->ss32 ? MO_32 : MO_16;
+    MemOp d_ot =3D s->dflag;
     int size =3D 1 << d_ot;
     int i;

@@ -2442,8 +2442,8 @@ static void gen_popa(DisasContext *s)

 static void gen_enter(DisasContext *s, int esp_addend, int level)
 {
-    TCGMemOp d_ot =3D mo_pushpop(s, s->dflag);
-    TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
+    MemOp d_ot =3D mo_pushpop(s, s->dflag);
+    MemOp a_ot =3D CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
     int size =3D 1 << d_ot;

     /* Push BP; compute FrameTemp into T1.  */
@@ -2482,8 +2482,8 @@ static void gen_enter(DisasContext *s, int esp_addend=
, int level)

 static void gen_leave(DisasContext *s)
 {
-    TCGMemOp d_ot =3D mo_pushpop(s, s->dflag);
-    TCGMemOp a_ot =3D mo_stacksize(s);
+    MemOp d_ot =3D mo_pushpop(s, s->dflag);
+    MemOp a_ot =3D mo_stacksize(s);

     gen_lea_v_seg(s, a_ot, cpu_regs[R_EBP], R_SS, -1);
     gen_op_ld_v(s, d_ot, s->T0, s->A0);
@@ -3045,7 +3045,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
     SSEFunc_0_eppi sse_fn_eppi;
     SSEFunc_0_ppi sse_fn_ppi;
     SSEFunc_0_eppt sse_fn_eppt;
-    TCGMemOp ot;
+    MemOp ot;

     b &=3D 0xff;
     if (s->prefix & PREFIX_DATA)
@@ -4488,7 +4488,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     CPUX86State *env =3D cpu->env_ptr;
     int b, prefixes;
     int shift;
-    TCGMemOp ot, aflag, dflag;
+    MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     int rex_w, rex_r;
@@ -5567,8 +5567,8 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0x1be: /* movsbS Gv, Eb */
     case 0x1bf: /* movswS Gv, Eb */
         {
-            TCGMemOp d_ot;
-            TCGMemOp s_ot;
+            MemOp d_ot;
+            MemOp s_ot;

             /* d_ot is the size of destination */
             d_ot =3D dflag;
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 60bcfb7..24c1dd3 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2414,7 +2414,7 @@ DISAS_INSN(cas)
     uint16_t ext;
     TCGv load;
     TCGv cmp;
-    TCGMemOp opc;
+    MemOp opc;

     switch ((insn >> 9) & 3) {
     case 1:
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 9ce65f3..41d1b8b 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -919,7 +919,7 @@ static void dec_load(DisasContext *dc)
     unsigned int size;
     bool rev =3D false, ex =3D false, ea =3D false;
     int mem_index =3D cpu_mmu_index(&dc->cpu->env, false);
-    TCGMemOp mop;
+    MemOp mop;

     mop =3D dc->opcode & 3;
     size =3D 1 << mop;
@@ -1035,7 +1035,7 @@ static void dec_store(DisasContext *dc)
     unsigned int size;
     bool rev =3D false, ex =3D false, ea =3D false;
     int mem_index =3D cpu_mmu_index(&dc->cpu->env, false);
-    TCGMemOp mop;
+    MemOp mop;

     mop =3D dc->opcode & 3;
     size =3D 1 << mop;
diff --git a/target/mips/translate.c b/target/mips/translate.c
index ca62800..59b5d85 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2526,7 +2526,7 @@ typedef struct DisasContext {
     int32_t CP0_Config5;
     /* Routine used to access memory */
     int mem_idx;
-    TCGMemOp default_tcg_memop_mask;
+    MemOp default_tcg_memop_mask;
     uint32_t hflags, saved_hflags;
     target_ulong btarget;
     bool ulri;
@@ -3706,7 +3706,7 @@ static void gen_st(DisasContext *ctx, uint32_t opc, i=
nt rt,

 /* Store conditional */
 static void gen_st_cond(DisasContext *ctx, int rt, int base, int offset,
-                        TCGMemOp tcg_mo, bool eva)
+                        MemOp tcg_mo, bool eva)
 {
     TCGv addr, t0, val;
     TCGLabel *l1 =3D gen_new_label();
@@ -4546,7 +4546,7 @@ static void gen_HILO(DisasContext *ctx, uint32_t opc,=
 int acc, int reg)
 }

 static inline void gen_r6_ld(target_long addr, int reg, int memidx,
-                             TCGMemOp memop)
+                             MemOp memop)
 {
     TCGv t0 =3D tcg_const_tl(addr);
     tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);
@@ -21828,7 +21828,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *=
env, DisasContext *ctx)
                              extract32(ctx->opcode, 0, 8);
                     TCGv va =3D tcg_temp_new();
                     TCGv t1 =3D tcg_temp_new();
-                    TCGMemOp memop =3D (extract32(ctx->opcode, 8, 3)) =3D=
=3D
+                    MemOp memop =3D (extract32(ctx->opcode, 8, 3)) =3D=3D
                                       NM_P_LS_UAWM ? MO_UNALN : 0;

                     count =3D (count =3D=3D 0) ? 8 : count;
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 4360ce4..b189c50 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -681,7 +681,7 @@ static bool trans_l_lwa(DisasContext *dc, arg_load *a)
     return true;
 }

-static void do_load(DisasContext *dc, arg_load *a, TCGMemOp mop)
+static void do_load(DisasContext *dc, arg_load *a, MemOp mop)
 {
     TCGv ea;

@@ -763,7 +763,7 @@ static bool trans_l_swa(DisasContext *dc, arg_store *a)
     return true;
 }

-static void do_store(DisasContext *dc, arg_store *a, TCGMemOp mop)
+static void do_store(DisasContext *dc, arg_store *a, MemOp mop)
 {
     TCGv t0 =3D tcg_temp_new();
     tcg_gen_addi_tl(t0, cpu_R[a->a], a->i);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4a5de28..31800ed 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -162,7 +162,7 @@ struct DisasContext {
     int mem_idx;
     int access_type;
     /* Translation flags */
-    TCGMemOp default_tcg_memop_mask;
+    MemOp default_tcg_memop_mask;
 #if defined(TARGET_PPC64)
     bool sf_mode;
     bool has_cfar;
@@ -3142,7 +3142,7 @@ static void gen_isync(DisasContext *ctx)

 #define MEMOP_GET_SIZE(x)  (1 << ((x) & MO_SIZE))

-static void gen_load_locked(DisasContext *ctx, TCGMemOp memop)
+static void gen_load_locked(DisasContext *ctx, MemOp memop)
 {
     TCGv gpr =3D cpu_gpr[rD(ctx->opcode)];
     TCGv t0 =3D tcg_temp_new();
@@ -3167,7 +3167,7 @@ LARX(lbarx, DEF_MEMOP(MO_UB))
 LARX(lharx, DEF_MEMOP(MO_UW))
 LARX(lwarx, DEF_MEMOP(MO_UL))

-static void gen_fetch_inc_conditional(DisasContext *ctx, TCGMemOp memop,
+static void gen_fetch_inc_conditional(DisasContext *ctx, MemOp memop,
                                       TCGv EA, TCGCond cond, int addend)
 {
     TCGv t =3D tcg_temp_new();
@@ -3193,7 +3193,7 @@ static void gen_fetch_inc_conditional(DisasContext *c=
tx, TCGMemOp memop,
     tcg_temp_free(u);
 }

-static void gen_ld_atomic(DisasContext *ctx, TCGMemOp memop)
+static void gen_ld_atomic(DisasContext *ctx, MemOp memop)
 {
     uint32_t gpr_FC =3D FC(ctx->opcode);
     TCGv EA =3D tcg_temp_new();
@@ -3306,7 +3306,7 @@ static void gen_ldat(DisasContext *ctx)
 }
 #endif

-static void gen_st_atomic(DisasContext *ctx, TCGMemOp memop)
+static void gen_st_atomic(DisasContext *ctx, MemOp memop)
 {
     uint32_t gpr_FC =3D FC(ctx->opcode);
     TCGv EA =3D tcg_temp_new();
@@ -3389,7 +3389,7 @@ static void gen_stdat(DisasContext *ctx)
 }
 #endif

-static void gen_conditional_store(DisasContext *ctx, TCGMemOp memop)
+static void gen_conditional_store(DisasContext *ctx, MemOp memop)
 {
     TCGLabel *l1 =3D gen_new_label();
     TCGLabel *l2 =3D gen_new_label();
diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/insn_tr=
ans/trans_rva.inc.c
index fadd888..be8a9f0 100644
--- a/target/riscv/insn_trans/trans_rva.inc.c
+++ b/target/riscv/insn_trans/trans_rva.inc.c
@@ -18,7 +18,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */

-static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, TCGMemOp mop)
+static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv src1 =3D tcg_temp_new();
     /* Put addr in load_res, data in load_val.  */
@@ -37,7 +37,7 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *=
a, TCGMemOp mop)
     return true;
 }

-static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, TCGMemOp mop)
+static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv src1 =3D tcg_temp_new();
     TCGv src2 =3D tcg_temp_new();
@@ -82,8 +82,8 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *=
a, TCGMemOp mop)
 }

 static bool gen_amo(DisasContext *ctx, arg_atomic *a,
-                    void(*func)(TCGv, TCGv, TCGv, TCGArg, TCGMemOp),
-                    TCGMemOp mop)
+                    void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
+                    MemOp mop)
 {
     TCGv src1 =3D tcg_temp_new();
     TCGv src2 =3D tcg_temp_new();
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_tr=
ans/trans_rvi.inc.c
index ea64731..cf440d1 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -135,7 +135,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }

-static bool gen_load(DisasContext *ctx, arg_lb *a, TCGMemOp memop)
+static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv t0 =3D tcg_temp_new();
     TCGv t1 =3D tcg_temp_new();
@@ -174,7 +174,7 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
     return gen_load(ctx, a, MO_TEUW);
 }

-static bool gen_store(DisasContext *ctx, arg_sb *a, TCGMemOp memop)
+static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv t0 =3D tcg_temp_new();
     TCGv dat =3D tcg_temp_new();
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index ac0d8b6..2927247 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -152,7 +152,7 @@ static inline int vec_full_reg_offset(uint8_t reg)
     return offsetof(CPUS390XState, vregs[reg][0]);
 }

-static inline int vec_reg_offset(uint8_t reg, uint8_t enr, TCGMemOp es)
+static inline int vec_reg_offset(uint8_t reg, uint8_t enr, MemOp es)
 {
     /* Convert element size (es) - e.g. MO_8 - to bytes */
     const uint8_t bytes =3D 1 << es;
@@ -2262,7 +2262,7 @@ static DisasJumpType op_csst(DisasContext *s, DisasOp=
s *o)
 #ifndef CONFIG_USER_ONLY
 static DisasJumpType op_csp(DisasContext *s, DisasOps *o)
 {
-    TCGMemOp mop =3D s->insn->data;
+    MemOp mop =3D s->insn->data;
     TCGv_i64 addr, old, cc;
     TCGLabel *lab =3D gen_new_label();

@@ -3228,7 +3228,7 @@ static DisasJumpType op_lm64(DisasContext *s, DisasOp=
s *o)
 static DisasJumpType op_lpd(DisasContext *s, DisasOps *o)
 {
     TCGv_i64 a1, a2;
-    TCGMemOp mop =3D s->insn->data;
+    MemOp mop =3D s->insn->data;

     /* In a parallel context, stop the world and single step.  */
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.in=
c.c
index 41d5cf8..4c56bbb 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -57,13 +57,13 @@
 #define FPF_LONG        3
 #define FPF_EXT         4

-static inline bool valid_vec_element(uint8_t enr, TCGMemOp es)
+static inline bool valid_vec_element(uint8_t enr, MemOp es)
 {
     return !(enr & ~(NUM_VEC_ELEMENTS(es) - 1));
 }

 static void read_vec_element_i64(TCGv_i64 dst, uint8_t reg, uint8_t enr,
-                                 TCGMemOp memop)
+                                 MemOp memop)
 {
     const int offs =3D vec_reg_offset(reg, enr, memop & MO_SIZE);

@@ -96,7 +96,7 @@ static void read_vec_element_i64(TCGv_i64 dst, uint8_t re=
g, uint8_t enr,
 }

 static void read_vec_element_i32(TCGv_i32 dst, uint8_t reg, uint8_t enr,
-                                 TCGMemOp memop)
+                                 MemOp memop)
 {
     const int offs =3D vec_reg_offset(reg, enr, memop & MO_SIZE);

@@ -123,7 +123,7 @@ static void read_vec_element_i32(TCGv_i32 dst, uint8_t =
reg, uint8_t enr,
 }

 static void write_vec_element_i64(TCGv_i64 src, int reg, uint8_t enr,
-                                  TCGMemOp memop)
+                                  MemOp memop)
 {
     const int offs =3D vec_reg_offset(reg, enr, memop & MO_SIZE);

@@ -146,7 +146,7 @@ static void write_vec_element_i64(TCGv_i64 src, int reg=
, uint8_t enr,
 }

 static void write_vec_element_i32(TCGv_i32 src, int reg, uint8_t enr,
-                                  TCGMemOp memop)
+                                  MemOp memop)
 {
     const int offs =3D vec_reg_offset(reg, enr, memop & MO_SIZE);

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 091bab5..bef9ce6 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2019,7 +2019,7 @@ static inline void gen_ne_fop_QD(DisasContext *dc, in=
t rd, int rs,
 }

 static void gen_swap(DisasContext *dc, TCGv dst, TCGv src,
-                     TCGv addr, int mmu_idx, TCGMemOp memop)
+                     TCGv addr, int mmu_idx, MemOp memop)
 {
     gen_address_mask(dc, addr);
     tcg_gen_atomic_xchg_tl(dst, addr, src, mmu_idx, memop);
@@ -2050,10 +2050,10 @@ typedef struct {
     ASIType type;
     int asi;
     int mem_idx;
-    TCGMemOp memop;
+    MemOp memop;
 } DisasASI;

-static DisasASI get_asi(DisasContext *dc, int insn, TCGMemOp memop)
+static DisasASI get_asi(DisasContext *dc, int insn, MemOp memop)
 {
     int asi =3D GET_FIELD(insn, 19, 26);
     ASIType type =3D GET_ASI_HELPER;
@@ -2267,7 +2267,7 @@ static DisasASI get_asi(DisasContext *dc, int insn, T=
CGMemOp memop)
 }

 static void gen_ld_asi(DisasContext *dc, TCGv dst, TCGv addr,
-                       int insn, TCGMemOp memop)
+                       int insn, MemOp memop)
 {
     DisasASI da =3D get_asi(dc, insn, memop);

@@ -2305,7 +2305,7 @@ static void gen_ld_asi(DisasContext *dc, TCGv dst, TC=
Gv addr,
 }

 static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
-                       int insn, TCGMemOp memop)
+                       int insn, MemOp memop)
 {
     DisasASI da =3D get_asi(dc, insn, memop);

@@ -2511,7 +2511,7 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
     case GET_ASI_BLOCK:
         /* Valid for lddfa on aligned registers only.  */
         if (size =3D=3D 8 && (rd & 7) =3D=3D 0) {
-            TCGMemOp memop;
+            MemOp memop;
             TCGv eight;
             int i;

@@ -2625,7 +2625,7 @@ static void gen_stf_asi(DisasContext *dc, TCGv addr,
     case GET_ASI_BLOCK:
         /* Valid for stdfa on aligned registers only.  */
         if (size =3D=3D 8 && (rd & 7) =3D=3D 0) {
-            TCGMemOp memop;
+            MemOp memop;
             TCGv eight;
             int i;

diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c
index c46a4ab..68dd4aa 100644
--- a/target/tilegx/translate.c
+++ b/target/tilegx/translate.c
@@ -290,7 +290,7 @@ static void gen_cmul2(TCGv tdest, TCGv tsrca, TCGv tsrc=
b, int sh, int rd)
 }

 static TileExcp gen_st_opcode(DisasContext *dc, unsigned dest, unsigned sr=
ca,
-                              unsigned srcb, TCGMemOp memop, const char *n=
ame)
+                              unsigned srcb, MemOp memop, const char *name=
)
 {
     if (dest) {
         return TILEGX_EXCP_OPCODE_UNKNOWN;
@@ -305,7 +305,7 @@ static TileExcp gen_st_opcode(DisasContext *dc, unsigne=
d dest, unsigned srca,
 }

 static TileExcp gen_st_add_opcode(DisasContext *dc, unsigned srca, unsigne=
d srcb,
-                                  int imm, TCGMemOp memop, const char *nam=
e)
+                                  int imm, MemOp memop, const char *name)
 {
     TCGv tsrca =3D load_gr(dc, srca);
     TCGv tsrcb =3D load_gr(dc, srcb);
@@ -496,7 +496,7 @@ static TileExcp gen_rr_opcode(DisasContext *dc, unsigne=
d opext,
 {
     TCGv tdest, tsrca;
     const char *mnemonic;
-    TCGMemOp memop;
+    MemOp memop;
     TileExcp ret =3D TILEGX_EXCP_NONE;
     bool prefetch_nofault =3D false;

@@ -1478,7 +1478,7 @@ static TileExcp gen_rri_opcode(DisasContext *dc, unsi=
gned opext,
     TCGv tsrca =3D load_gr(dc, srca);
     bool prefetch_nofault =3D false;
     const char *mnemonic;
-    TCGMemOp memop;
+    MemOp memop;
     int i2, i3;
     TCGv t0;

@@ -2106,7 +2106,7 @@ static TileExcp decode_y2(DisasContext *dc, tilegx_bu=
ndle_bits bundle)
     unsigned srca =3D get_SrcA_Y2(bundle);
     unsigned srcbdest =3D get_SrcBDest_Y2(bundle);
     const char *mnemonic;
-    TCGMemOp memop;
+    MemOp memop;
     bool prefetch_nofault =3D false;

     switch (OEY2(opc, mode)) {
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index dc2a65f..87a5f50 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -227,7 +227,7 @@ static inline void generate_trap(DisasContext *ctx, int=
 class, int tin);
 /* Functions for load/save to/from memory */

 static inline void gen_offset_ld(DisasContext *ctx, TCGv r1, TCGv r2,
-                                 int16_t con, TCGMemOp mop)
+                                 int16_t con, MemOp mop)
 {
     TCGv temp =3D tcg_temp_new();
     tcg_gen_addi_tl(temp, r2, con);
@@ -236,7 +236,7 @@ static inline void gen_offset_ld(DisasContext *ctx, TCG=
v r1, TCGv r2,
 }

 static inline void gen_offset_st(DisasContext *ctx, TCGv r1, TCGv r2,
-                                 int16_t con, TCGMemOp mop)
+                                 int16_t con, MemOp mop)
 {
     TCGv temp =3D tcg_temp_new();
     tcg_gen_addi_tl(temp, r2, con);
@@ -284,7 +284,7 @@ static void gen_offset_ld_2regs(TCGv rh, TCGv rl, TCGv =
base, int16_t con,
 }

 static void gen_st_preincr(DisasContext *ctx, TCGv r1, TCGv r2, int16_t of=
f,
-                           TCGMemOp mop)
+                           MemOp mop)
 {
     TCGv temp =3D tcg_temp_new();
     tcg_gen_addi_tl(temp, r2, off);
@@ -294,7 +294,7 @@ static void gen_st_preincr(DisasContext *ctx, TCGv r1, =
TCGv r2, int16_t off,
 }

 static void gen_ld_preincr(DisasContext *ctx, TCGv r1, TCGv r2, int16_t of=
f,
-                           TCGMemOp mop)
+                           MemOp mop)
 {
     TCGv temp =3D tcg_temp_new();
     tcg_gen_addi_tl(temp, r2, off);
diff --git a/tcg/README b/tcg/README
index 21fcdf7..b4382fa 100644
--- a/tcg/README
+++ b/tcg/README
@@ -512,7 +512,7 @@ Both t0 and t1 may be split into little-endian ordered =
pairs of registers
 if dealing with 64-bit quantities on a 32-bit host.

 The memidx selects the qemu tlb index to use (e.g. user or kernel access).
-The flags are the TCGMemOp bits, selecting the sign, width, and endianness
+The flags are the MemOp bits, selecting the sign, width, and endianness
 of the memory access.

 For a 32-bit host, qemu_ld/st_i64 is guaranteed to only be used with a
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 0713448..3f92101 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -1423,7 +1423,7 @@ static inline void tcg_out_rev16(TCGContext *s, TCGRe=
g rd, TCGReg rn)
     tcg_out_insn(s, 3507, REV16, TCG_TYPE_I32, rd, rn);
 }

-static inline void tcg_out_sxt(TCGContext *s, TCGType ext, TCGMemOp s_bits=
,
+static inline void tcg_out_sxt(TCGContext *s, TCGType ext, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
     /* Using ALIASes SXTB, SXTH, SXTW, of SBFM Xd, Xn, #0, #7|15|31 */
@@ -1431,7 +1431,7 @@ static inline void tcg_out_sxt(TCGContext *s, TCGType=
 ext, TCGMemOp s_bits,
     tcg_out_sbfm(s, ext, rd, rn, 0, bits);
 }

-static inline void tcg_out_uxt(TCGContext *s, TCGMemOp s_bits,
+static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
     /* Using ALIASes UXTB, UXTH of UBFM Wd, Wn, #0, #7|15 */
@@ -1580,8 +1580,8 @@ static inline void tcg_out_adr(TCGContext *s, TCGReg =
rd, void *target)
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
-    TCGMemOp size =3D opc & MO_SIZE;
+    MemOp opc =3D get_memop(oi);
+    MemOp size =3D opc & MO_SIZE;

     if (!reloc_pc19(lb->label_ptr[0], s->code_ptr)) {
         return false;
@@ -1605,8 +1605,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
-    TCGMemOp size =3D opc & MO_SIZE;
+    MemOp opc =3D get_memop(oi);
+    MemOp size =3D opc & MO_SIZE;

     if (!reloc_pc19(lb->label_ptr[0], s->code_ptr)) {
         return false;
@@ -1649,7 +1649,7 @@ QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) !=
=3D 8);
    slow path for the failure case, which will be patched later when finali=
zing
    the slow path. Generated code returns the host addend in X1,
    clobbers X0,X2,X3,TMP. */
-static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, TCGMemOp opc,
+static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
                              tcg_insn_unit **label_ptr, int mem_index,
                              bool is_read)
 {
@@ -1709,11 +1709,11 @@ static void tcg_out_tlb_read(TCGContext *s, TCGReg =
addr_reg, TCGMemOp opc,

 #endif /* CONFIG_SOFTMMU */

-static void tcg_out_qemu_ld_direct(TCGContext *s, TCGMemOp memop, TCGType =
ext,
+static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext=
,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    const TCGMemOp bswap =3D memop & MO_BSWAP;
+    const MemOp bswap =3D memop & MO_BSWAP;

     switch (memop & MO_SSIZE) {
     case MO_UB:
@@ -1765,11 +1765,11 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, T=
CGMemOp memop, TCGType ext,
     }
 }

-static void tcg_out_qemu_st_direct(TCGContext *s, TCGMemOp memop,
+static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    const TCGMemOp bswap =3D memop & MO_BSWAP;
+    const MemOp bswap =3D memop & MO_BSWAP;

     switch (memop & MO_SIZE) {
     case MO_8:
@@ -1804,7 +1804,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
MemOp memop,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi, TCGType ext)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    MemOp memop =3D get_memop(oi);
     const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64 ? TCG_TYPE_I64 : TC=
G_TYPE_I32;
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
@@ -1829,7 +1829,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg dat=
a_reg, TCGReg addr_reg,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    MemOp memop =3D get_memop(oi);
     const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64 ? TCG_TYPE_I64 : TC=
G_TYPE_I32;
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index ece88dc..94d80d7 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -1233,7 +1233,7 @@ QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) !=
=3D 4);
    containing the addend of the tlb entry.  Clobbers R0, R1, R2, TMP.  */

 static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi=
,
-                               TCGMemOp opc, int mem_index, bool is_load)
+                               MemOp opc, int mem_index, bool is_load)
 {
     int cmp_off =3D (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
@@ -1348,7 +1348,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 {
     TCGReg argreg, datalo, datahi;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     void *func;

     if (!reloc_pc24(lb->label_ptr[0], s->code_ptr)) {
@@ -1412,7 +1412,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 {
     TCGReg argreg, datalo, datahi;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);

     if (!reloc_pc24(lb->label_ptr[0], s->code_ptr)) {
         return false;
@@ -1453,11 +1453,11 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s=
, TCGLabelQemuLdst *lb)
 }
 #endif /* SOFTMMU */

-static inline void tcg_out_qemu_ld_index(TCGContext *s, TCGMemOp opc,
+static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
                                          TCGReg datalo, TCGReg datahi,
                                          TCGReg addrlo, TCGReg addend)
 {
-    TCGMemOp bswap =3D opc & MO_BSWAP;
+    MemOp bswap =3D opc & MO_BSWAP;

     switch (opc & MO_SSIZE) {
     case MO_UB:
@@ -1514,11 +1514,11 @@ static inline void tcg_out_qemu_ld_index(TCGContext=
 *s, TCGMemOp opc,
     }
 }

-static inline void tcg_out_qemu_ld_direct(TCGContext *s, TCGMemOp opc,
+static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
                                           TCGReg datalo, TCGReg datahi,
                                           TCGReg addrlo)
 {
-    TCGMemOp bswap =3D opc & MO_BSWAP;
+    MemOp bswap =3D opc & MO_BSWAP;

     switch (opc & MO_SSIZE) {
     case MO_UB:
@@ -1577,7 +1577,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is64)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     TCGReg addend;
@@ -1614,11 +1614,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TC=
GArg *args, bool is64)
 #endif
 }

-static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, TCGMemOp=
 opc,
+static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp op=
c,
                                          TCGReg datalo, TCGReg datahi,
                                          TCGReg addrlo, TCGReg addend)
 {
-    TCGMemOp bswap =3D opc & MO_BSWAP;
+    MemOp bswap =3D opc & MO_BSWAP;

     switch (opc & MO_SIZE) {
     case MO_8:
@@ -1659,11 +1659,11 @@ static inline void tcg_out_qemu_st_index(TCGContext=
 *s, int cond, TCGMemOp opc,
     }
 }

-static inline void tcg_out_qemu_st_direct(TCGContext *s, TCGMemOp opc,
+static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
                                           TCGReg datalo, TCGReg datahi,
                                           TCGReg addrlo)
 {
-    TCGMemOp bswap =3D opc & MO_BSWAP;
+    MemOp bswap =3D opc & MO_BSWAP;

     switch (opc & MO_SIZE) {
     case MO_8:
@@ -1708,7 +1708,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is64)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     TCGReg addend;
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 6ddeebf..9d8ed97 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1697,7 +1697,7 @@ static void * const qemu_st_helpers[16] =3D {
    First argument register is clobbered.  */

 static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg a=
ddrhi,
-                                    int mem_index, TCGMemOp opc,
+                                    int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
 {
     const TCGReg r0 =3D TCG_REG_L0;
@@ -1810,7 +1810,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool i=
s_ld, bool is_64,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     TCGReg data_reg;
     tcg_insn_unit **label_ptr =3D &l->label_ptr[0];
     int rexw =3D (l->type =3D=3D TCG_TYPE_I64 ? P_REXW : 0);
@@ -1895,8 +1895,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
-    TCGMemOp s_bits =3D opc & MO_SIZE;
+    MemOp opc =3D get_memop(oi);
+    MemOp s_bits =3D opc & MO_SIZE;
     tcg_insn_unit **label_ptr =3D &l->label_ptr[0];
     TCGReg retaddr;

@@ -1995,10 +1995,10 @@ static inline int setup_guest_base_seg(void)

 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg da=
tahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, bool is64, TCGMemOp memop)
+                                   int seg, bool is64, MemOp memop)
 {
-    const TCGMemOp real_bswap =3D memop & MO_BSWAP;
-    TCGMemOp bswap =3D real_bswap;
+    const MemOp real_bswap =3D memop & MO_BSWAP;
+    MemOp bswap =3D real_bswap;
     int rexw =3D is64 * P_REXW;
     int movop =3D OPC_MOVL_GvEv;

@@ -2103,7 +2103,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is64)
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
@@ -2137,15 +2137,15 @@ static void tcg_out_qemu_ld(TCGContext *s, const TC=
GArg *args, bool is64)

 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg da=
tahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, TCGMemOp memop)
+                                   int seg, MemOp memop)
 {
     /* ??? Ideally we wouldn't need a scratch register.  For user-only,
        we could perform the bswap twice to restore the original value
        instead of moving to the scratch.  But as it is, the L constraint
        means that TCG_REG_L0 is definitely free here.  */
     const TCGReg scratch =3D TCG_REG_L0;
-    const TCGMemOp real_bswap =3D memop & MO_BSWAP;
-    TCGMemOp bswap =3D real_bswap;
+    const MemOp real_bswap =3D memop & MO_BSWAP;
+    MemOp bswap =3D real_bswap;
     int movop =3D OPC_MOVL_EvGv;

     if (have_movbe && real_bswap) {
@@ -2221,7 +2221,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is64)
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index 41bff32..5442167 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1215,7 +1215,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg ba=
se, TCGReg addrl,
                              TCGReg addrh, TCGMemOpIdx oi,
                              tcg_insn_unit *label_ptr[2], bool is_load)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     unsigned s_bits =3D opc & MO_SIZE;
     unsigned a_bits =3D get_alignment_bits(opc);
     int mem_index =3D get_mmuidx(oi);
@@ -1313,7 +1313,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is=
_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     TCGReg v0;
     int i;

@@ -1363,8 +1363,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
-    TCGMemOp s_bits =3D opc & MO_SIZE;
+    MemOp opc =3D get_memop(oi);
+    MemOp s_bits =3D opc & MO_SIZE;
     int i;

     /* resolve label address */
@@ -1413,7 +1413,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 #endif

 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, TCGMemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, bool is_64)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
@@ -1521,7 +1521,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
 #endif
@@ -1558,7 +1558,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
 }

 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, TCGMemOp opc)
+                                   TCGReg base, MemOp opc)
 {
     /* Don't clutter the code below with checks to avoid bswapping ZERO.  =
*/
     if ((lo | hi) =3D=3D 0) {
@@ -1624,7 +1624,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is_64)
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
 #endif
diff --git a/tcg/optimize.c b/tcg/optimize.c
index d2424de..a89ffda 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1014,7 +1014,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(qemu_ld):
             {
                 TCGMemOpIdx oi =3D op->args[nb_oargs + nb_iargs];
-                TCGMemOp mop =3D get_memop(oi);
+                MemOp mop =3D get_memop(oi);
                 if (!(mop & MO_SIGN)) {
                     mask =3D (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
                 }
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 852b894..815edac 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -1506,7 +1506,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
    in CR7, loads the addend of the TLB into R3, and returns the register
    containing the guest address (zero-extended into R4).  Clobbers R0 and =
R2. */

-static TCGReg tcg_out_tlb_read(TCGContext *s, TCGMemOp opc,
+static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
                                TCGReg addrlo, TCGReg addrhi,
                                int mem_index, bool is_read)
 {
@@ -1633,7 +1633,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool i=
s_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     TCGReg hi, lo, arg =3D TCG_REG_R3;

     if (!reloc_pc14(lb->label_ptr[0], s->code_ptr)) {
@@ -1680,8 +1680,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
-    TCGMemOp s_bits =3D opc & MO_SIZE;
+    MemOp opc =3D get_memop(oi);
+    MemOp s_bits =3D opc & MO_SIZE;
     TCGReg hi, lo, arg =3D TCG_REG_R3;

     if (!reloc_pc14(lb->label_ptr[0], s->code_ptr)) {
@@ -1744,7 +1744,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
     TCGReg datalo, datahi, addrlo, rbase;
     TCGReg addrhi __attribute__((unused));
     TCGMemOpIdx oi;
-    TCGMemOp opc, s_bits;
+    MemOp opc, s_bits;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     tcg_insn_unit *label_ptr;
@@ -1819,7 +1819,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is_64)
     TCGReg datalo, datahi, addrlo, rbase;
     TCGReg addrhi __attribute__((unused));
     TCGMemOpIdx oi;
-    TCGMemOp opc, s_bits;
+    MemOp opc, s_bits;
 #ifdef CONFIG_SOFTMMU
     int mem_index;
     tcg_insn_unit *label_ptr;
diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 3e76bf5..7018509 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -970,7 +970,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addr=
l,
                              TCGReg addrh, TCGMemOpIdx oi,
                              tcg_insn_unit **label_ptr, bool is_load)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     unsigned s_bits =3D opc & MO_SIZE;
     unsigned a_bits =3D get_alignment_bits(opc);
     tcg_target_long compare_mask;
@@ -1044,7 +1044,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is=
_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
     TCGReg a0 =3D tcg_target_call_iarg_regs[0];
     TCGReg a1 =3D tcg_target_call_iarg_regs[1];
     TCGReg a2 =3D tcg_target_call_iarg_regs[2];
@@ -1077,8 +1077,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
-    TCGMemOp s_bits =3D opc & MO_SIZE;
+    MemOp opc =3D get_memop(oi);
+    MemOp s_bits =3D opc & MO_SIZE;
     TCGReg a0 =3D tcg_target_call_iarg_regs[0];
     TCGReg a1 =3D tcg_target_call_iarg_regs[1];
     TCGReg a2 =3D tcg_target_call_iarg_regs[2];
@@ -1121,9 +1121,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 #endif /* CONFIG_SOFTMMU */

 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, TCGMemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, bool is_64)
 {
-    const TCGMemOp bswap =3D opc & MO_BSWAP;
+    const MemOp bswap =3D opc & MO_BSWAP;

     /* We don't yet handle byteswapping, assert */
     g_assert(!bswap);
@@ -1172,7 +1172,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
 #endif
@@ -1208,9 +1208,9 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
 }

 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, TCGMemOp opc)
+                                   TCGReg base, MemOp opc)
 {
-    const TCGMemOp bswap =3D opc & MO_BSWAP;
+    const MemOp bswap =3D opc & MO_BSWAP;

     /* We don't yet handle byteswapping, assert */
     g_assert(!bswap);
@@ -1243,7 +1243,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is_64)
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
     TCGMemOpIdx oi;
-    TCGMemOp opc;
+    MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
 #endif
diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c
index fe42939..8aaa4ce 100644
--- a/tcg/s390/tcg-target.inc.c
+++ b/tcg/s390/tcg-target.inc.c
@@ -1430,7 +1430,7 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit=
 *dest)
     }
 }

-static void tcg_out_qemu_ld_direct(TCGContext *s, TCGMemOp opc, TCGReg dat=
a,
+static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
                                    TCGReg base, TCGReg index, int disp)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
@@ -1489,7 +1489,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCG=
MemOp opc, TCGReg data,
     }
 }

-static void tcg_out_qemu_st_direct(TCGContext *s, TCGMemOp opc, TCGReg dat=
a,
+static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
                                    TCGReg base, TCGReg index, int disp)
 {
     switch (opc & (MO_SIZE | MO_BSWAP)) {
@@ -1544,7 +1544,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19))=
;

 /* Load and compare a TLB entry, leaving the flags set.  Loads the TLB
    addend into R2.  Returns a register with the santitized guest address. =
 */
-static TCGReg tcg_out_tlb_read(TCGContext* s, TCGReg addr_reg, TCGMemOp op=
c,
+static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
                                int mem_index, bool is_ld)
 {
     unsigned s_bits =3D opc & MO_SIZE;
@@ -1614,7 +1614,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     TCGReg addr_reg =3D lb->addrlo_reg;
     TCGReg data_reg =3D lb->datalo_reg;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);

     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)s->code_ptr, 2)) {
@@ -1639,7 +1639,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     TCGReg addr_reg =3D lb->addrlo_reg;
     TCGReg data_reg =3D lb->datalo_reg;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);

     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)s->code_ptr, 2)) {
@@ -1694,7 +1694,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGR=
eg *addr_reg,
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
@@ -1721,7 +1721,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg dat=
a_reg, TCGReg addr_reg,
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    MemOp opc =3D get_memop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index 10b1cea..d7986cd 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -1081,7 +1081,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 12))=
;
    is in the returned register, maybe %o0.  The TLB addend is in %o1.  */

 static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
-                               TCGMemOp opc, int which)
+                               MemOp opc, int which)
 {
     int fast_off =3D TLB_MASK_TABLE_OFS(mem_index);
     int mask_off =3D fast_off + offsetof(CPUTLBDescFast, mask);
@@ -1164,7 +1164,7 @@ static const int qemu_st_opc[16] =3D {
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
                             TCGMemOpIdx oi, bool is_64)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    MemOp memop =3D get_memop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned memi =3D get_mmuidx(oi);
     TCGReg addrz, param;
@@ -1246,7 +1246,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg dat=
a, TCGReg addr,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    MemOp memop =3D get_memop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned memi =3D get_mmuidx(oi);
     TCGReg addrz, param;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 587d092..e87c327 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2714,7 +2714,7 @@ void tcg_gen_lookup_and_goto_ptr(void)
     }
 }

-static inline TCGMemOp tcg_canonicalize_memop(TCGMemOp op, bool is64, bool=
 st)
+static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
     /* Trigger the asserts within as early as possible.  */
     (void)get_alignment_bits(op);
@@ -2743,7 +2743,7 @@ static inline TCGMemOp tcg_canonicalize_memop(TCGMemO=
p op, bool is64, bool st)
 }

 static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,
-                         TCGMemOp memop, TCGArg idx)
+                         MemOp memop, TCGArg idx)
 {
     TCGMemOpIdx oi =3D make_memop_idx(memop, idx);
 #if TARGET_LONG_BITS =3D=3D 32
@@ -2758,7 +2758,7 @@ static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val,=
 TCGv addr,
 }

 static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
-                         TCGMemOp memop, TCGArg idx)
+                         MemOp memop, TCGArg idx)
 {
     TCGMemOpIdx oi =3D make_memop_idx(memop, idx);
 #if TARGET_LONG_BITS =3D=3D 32
@@ -2788,9 +2788,9 @@ static void tcg_gen_req_mo(TCGBar type)
     }
 }

-void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp mem=
op)
+void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    TCGMemOp orig_memop;
+    MemOp orig_memop;

     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop =3D tcg_canonicalize_memop(memop, 0, 0);
@@ -2825,7 +2825,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
     }
 }

-void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp mem=
op)
+void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i32 swap =3D NULL;

@@ -2858,9 +2858,9 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
     }
 }

-void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp mem=
op)
+void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
-    TCGMemOp orig_memop;
+    MemOp orig_memop;

     if (TCG_TARGET_REG_BITS =3D=3D 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
@@ -2911,7 +2911,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
     }
 }

-void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp mem=
op)
+void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i64 swap =3D NULL;

@@ -2953,7 +2953,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
     }
 }

-static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
+static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
 {
     switch (opc & MO_SSIZE) {
     case MO_SB:
@@ -2974,7 +2974,7 @@ static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 va=
l, TCGMemOp opc)
     }
 }

-static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
+static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, MemOp opc)
 {
     switch (opc & MO_SSIZE) {
     case MO_SB:
@@ -3034,7 +3034,7 @@ static void * const table_cmpxchg[16] =3D {
 };

 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
-                                TCGv_i32 newv, TCGArg idx, TCGMemOp memop)
+                                TCGv_i32 newv, TCGArg idx, MemOp memop)
 {
     memop =3D tcg_canonicalize_memop(memop, 0, 0);

@@ -3078,7 +3078,7 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv a=
ddr, TCGv_i32 cmpv,
 }

 void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
-                                TCGv_i64 newv, TCGArg idx, TCGMemOp memop)
+                                TCGv_i64 newv, TCGArg idx, MemOp memop)
 {
     memop =3D tcg_canonicalize_memop(memop, 1, 0);

@@ -3142,7 +3142,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv a=
ddr, TCGv_i64 cmpv,
 }

 static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
-                                TCGArg idx, TCGMemOp memop, bool new_val,
+                                TCGArg idx, MemOp memop, bool new_val,
                                 void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32))
 {
     TCGv_i32 t1 =3D tcg_temp_new_i32();
@@ -3160,7 +3160,7 @@ static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv ad=
dr, TCGv_i32 val,
 }

 static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
-                             TCGArg idx, TCGMemOp memop, void * const tabl=
e[])
+                             TCGArg idx, MemOp memop, void * const table[]=
)
 {
     gen_atomic_op_i32 gen;

@@ -3185,7 +3185,7 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr,=
 TCGv_i32 val,
 }

 static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
-                                TCGArg idx, TCGMemOp memop, bool new_val,
+                                TCGArg idx, MemOp memop, bool new_val,
                                 void (*gen)(TCGv_i64, TCGv_i64, TCGv_i64))
 {
     TCGv_i64 t1 =3D tcg_temp_new_i64();
@@ -3203,7 +3203,7 @@ static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv ad=
dr, TCGv_i64 val,
 }

 static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
-                             TCGArg idx, TCGMemOp memop, void * const tabl=
e[])
+                             TCGArg idx, MemOp memop, void * const table[]=
)
 {
     memop =3D tcg_canonicalize_memop(memop, 1, 0);

@@ -3257,7 +3257,7 @@ static void * const table_##NAME[16] =3D {           =
                     \
     WITH_ATOMIC64([MO_64 | MO_BE] =3D gen_helper_atomic_##NAME##q_be)     =
\
 };                                                                      \
 void tcg_gen_atomic_##NAME##_i32                                        \
-    (TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, TCGMemOp memop) \
+    (TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, MemOp memop)    \
 {                                                                       \
     if (tcg_ctx->tb_cflags & CF_PARALLEL) {                             \
         do_atomic_op_i32(ret, addr, val, idx, memop, table_##NAME);     \
@@ -3267,7 +3267,7 @@ void tcg_gen_atomic_##NAME##_i32                     =
                   \
     }                                                                   \
 }                                                                       \
 void tcg_gen_atomic_##NAME##_i64                                        \
-    (TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, TCGMemOp memop) \
+    (TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, MemOp memop)    \
 {                                                                       \
     if (tcg_ctx->tb_cflags & CF_PARALLEL) {                             \
         do_atomic_op_i64(ret, addr, val, idx, memop, table_##NAME);     \
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 2d4dd5c..e9cf172 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -851,10 +851,10 @@ void tcg_gen_lookup_and_goto_ptr(void);
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
 #endif

-void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
-void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
-void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
-void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
+void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, MemOp);
+void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, MemOp);

 static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
 {
@@ -912,46 +912,46 @@ static inline void tcg_gen_qemu_st64(TCGv_i64 arg, TC=
Gv addr, int mem_index)
 }

 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
-                                TCGArg, TCGMemOp);
+                                TCGArg, MemOp);
 void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
-                                TCGArg, TCGMemOp);
-
-void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
-void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
-
-void tcg_gen_atomic_fetch_add_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_fetch_add_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_fetch_and_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_fetch_and_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_fetch_or_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemO=
p);
-void tcg_gen_atomic_fetch_or_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemO=
p);
-void tcg_gen_atomic_fetch_xor_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_fetch_xor_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_fetch_smin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_smin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_umin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_umin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_smax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_smax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_umax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_fetch_umax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-
-void tcg_gen_atomic_add_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_add_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_and_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_and_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_or_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemO=
p);
-void tcg_gen_atomic_or_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemO=
p);
-void tcg_gen_atomic_xor_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);
-void tcg_gen_atomic_smin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_smin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_umin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_umin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_smax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_smax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_umax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMe=
mOp);
-void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMe=
mOp);
+                                TCGArg, MemOp);
+
+void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp);
+void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp);
+
+void tcg_gen_atomic_fetch_add_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp)=
;
+void tcg_gen_atomic_fetch_add_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp)=
;
+void tcg_gen_atomic_fetch_and_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp)=
;
+void tcg_gen_atomic_fetch_and_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp)=
;
+void tcg_gen_atomic_fetch_or_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp);
+void tcg_gen_atomic_fetch_or_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp);
+void tcg_gen_atomic_fetch_xor_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp)=
;
+void tcg_gen_atomic_fetch_xor_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp)=
;
+void tcg_gen_atomic_fetch_smin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_smin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_umin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_umin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_smax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_smax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_umax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_fetch_umax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+
+void tcg_gen_atomic_add_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp)=
;
+void tcg_gen_atomic_add_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp)=
;
+void tcg_gen_atomic_and_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp)=
;
+void tcg_gen_atomic_and_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp)=
;
+void tcg_gen_atomic_or_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp);
+void tcg_gen_atomic_or_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp);
+void tcg_gen_atomic_xor_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp)=
;
+void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp)=
;
+void tcg_gen_atomic_smin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_smin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+void tcg_gen_atomic_umin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_umin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+void tcg_gen_atomic_smax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_smax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);
+void tcg_gen_atomic_umax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp=
);
+void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp=
);

 void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
 void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8d23fb0..0dff196 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2056,7 +2056,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_pre=
fs)
             case INDEX_op_qemu_st_i64:
                 {
                     TCGMemOpIdx oi =3D op->args[k++];
-                    TCGMemOp op =3D get_memop(oi);
+                    MemOp op =3D get_memop(oi);
                     unsigned ix =3D get_mmuidx(oi);

                     if (op & ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 529acb2..a37181c 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -26,6 +26,7 @@
 #define TCG_H

 #include "cpu.h"
+#include "exec/memop.h"
 #include "exec/tb-context.h"
 #include "qemu/bitops.h"
 #include "qemu/queue.h"
@@ -309,103 +310,13 @@ typedef enum TCGType {
 #endif
 } TCGType;

-/* Constants for qemu_ld and qemu_st for the Memory Operation field.  */
-typedef enum TCGMemOp {
-    MO_8     =3D 0,
-    MO_16    =3D 1,
-    MO_32    =3D 2,
-    MO_64    =3D 3,
-    MO_SIZE  =3D 3,   /* Mask for the above.  */
-
-    MO_SIGN  =3D 4,   /* Sign-extended, otherwise zero-extended.  */
-
-    MO_BSWAP =3D 8,   /* Host reverse endian.  */
-#ifdef HOST_WORDS_BIGENDIAN
-    MO_LE    =3D MO_BSWAP,
-    MO_BE    =3D 0,
-#else
-    MO_LE    =3D 0,
-    MO_BE    =3D MO_BSWAP,
-#endif
-#ifdef TARGET_WORDS_BIGENDIAN
-    MO_TE    =3D MO_BE,
-#else
-    MO_TE    =3D MO_LE,
-#endif
-
-    /*
-     * MO_UNALN accesses are never checked for alignment.
-     * MO_ALIGN accesses will result in a call to the CPU's
-     * do_unaligned_access hook if the guest address is not aligned.
-     * The default depends on whether the target CPU defines
-     * TARGET_ALIGNED_ONLY.
-     *
-     * Some architectures (e.g. ARMv8) need the address which is aligned
-     * to a size more than the size of the memory access.
-     * Some architectures (e.g. SPARCv9) need an address which is aligned,
-     * but less strictly than the natural alignment.
-     *
-     * MO_ALIGN supposes the alignment size is the size of a memory access=
.
-     *
-     * There are three options:
-     * - unaligned access permitted (MO_UNALN).
-     * - an alignment to the size of an access (MO_ALIGN);
-     * - an alignment to a specified size, which may be more or less than
-     *   the access size (MO_ALIGN_x where 'x' is a size in bytes);
-     */
-    MO_ASHIFT =3D 4,
-    MO_AMASK =3D 7 << MO_ASHIFT,
-#ifdef TARGET_ALIGNED_ONLY
-    MO_ALIGN =3D 0,
-    MO_UNALN =3D MO_AMASK,
-#else
-    MO_ALIGN =3D MO_AMASK,
-    MO_UNALN =3D 0,
-#endif
-    MO_ALIGN_2  =3D 1 << MO_ASHIFT,
-    MO_ALIGN_4  =3D 2 << MO_ASHIFT,
-    MO_ALIGN_8  =3D 3 << MO_ASHIFT,
-    MO_ALIGN_16 =3D 4 << MO_ASHIFT,
-    MO_ALIGN_32 =3D 5 << MO_ASHIFT,
-    MO_ALIGN_64 =3D 6 << MO_ASHIFT,
-
-    /* Combinations of the above, for ease of use.  */
-    MO_UB    =3D MO_8,
-    MO_UW    =3D MO_16,
-    MO_UL    =3D MO_32,
-    MO_SB    =3D MO_SIGN | MO_8,
-    MO_SW    =3D MO_SIGN | MO_16,
-    MO_SL    =3D MO_SIGN | MO_32,
-    MO_Q     =3D MO_64,
-
-    MO_LEUW  =3D MO_LE | MO_UW,
-    MO_LEUL  =3D MO_LE | MO_UL,
-    MO_LESW  =3D MO_LE | MO_SW,
-    MO_LESL  =3D MO_LE | MO_SL,
-    MO_LEQ   =3D MO_LE | MO_Q,
-
-    MO_BEUW  =3D MO_BE | MO_UW,
-    MO_BEUL  =3D MO_BE | MO_UL,
-    MO_BESW  =3D MO_BE | MO_SW,
-    MO_BESL  =3D MO_BE | MO_SL,
-    MO_BEQ   =3D MO_BE | MO_Q,
-
-    MO_TEUW  =3D MO_TE | MO_UW,
-    MO_TEUL  =3D MO_TE | MO_UL,
-    MO_TESW  =3D MO_TE | MO_SW,
-    MO_TESL  =3D MO_TE | MO_SL,
-    MO_TEQ   =3D MO_TE | MO_Q,
-
-    MO_SSIZE =3D MO_SIZE | MO_SIGN,
-} TCGMemOp;
-
 /**
  * get_alignment_bits
- * @memop: TCGMemOp value
+ * @memop: MemOp value
  *
  * Extract the alignment size from the memop.
  */
-static inline unsigned get_alignment_bits(TCGMemOp memop)
+static inline unsigned get_alignment_bits(MemOp memop)
 {
     unsigned a =3D memop & MO_AMASK;

@@ -1186,7 +1097,7 @@ static inline size_t tcg_current_code_size(TCGContext=
 *s)
     return tcg_ptr_byte_diff(s->code_ptr, s->code_buf);
 }

-/* Combine the TCGMemOp and mmu_idx parameters into a single value.  */
+/* Combine the MemOp and mmu_idx parameters into a single value.  */
 typedef uint32_t TCGMemOpIdx;

 /**
@@ -1196,7 +1107,7 @@ typedef uint32_t TCGMemOpIdx;
  *
  * Encode these values into a single parameter.
  */
-static inline TCGMemOpIdx make_memop_idx(TCGMemOp op, unsigned idx)
+static inline TCGMemOpIdx make_memop_idx(MemOp op, unsigned idx)
 {
     tcg_debug_assert(idx <=3D 15);
     return (op << 4) | idx;
@@ -1208,7 +1119,7 @@ static inline TCGMemOpIdx make_memop_idx(TCGMemOp op,=
 unsigned idx)
  *
  * Extract the memory operation from the combined value.
  */
-static inline TCGMemOp get_memop(TCGMemOpIdx oi)
+static inline MemOp get_memop(TCGMemOpIdx oi)
 {
     return oi >> 4;
 }
diff --git a/trace/mem-internal.h b/trace/mem-internal.h
index f6efaf6..3444fbc 100644
--- a/trace/mem-internal.h
+++ b/trace/mem-internal.h
@@ -16,7 +16,7 @@
 #define TRACE_MEM_ST (1ULL << 5)    /* store (y/n) */

 static inline uint8_t trace_mem_build_info(
-    int size_shift, bool sign_extend, TCGMemOp endianness, bool store)
+    int size_shift, bool sign_extend, MemOp endianness, bool store)
 {
     uint8_t res;

@@ -33,7 +33,7 @@ static inline uint8_t trace_mem_build_info(
     return res;
 }

-static inline uint8_t trace_mem_get_info(TCGMemOp op, bool store)
+static inline uint8_t trace_mem_get_info(MemOp op, bool store)
 {
     return trace_mem_build_info(op & MO_SIZE, !!(op & MO_SIGN),
                                 op & MO_BSWAP, store);
diff --git a/trace/mem.h b/trace/mem.h
index 2b58196..8cf213d 100644
--- a/trace/mem.h
+++ b/trace/mem.h
@@ -18,7 +18,7 @@
  *
  * Return a value for the 'info' argument in guest memory access traces.
  */
-static uint8_t trace_mem_get_info(TCGMemOp op, bool store);
+static uint8_t trace_mem_get_info(MemOp op, bool store);

 /**
  * trace_mem_build_info:
@@ -26,7 +26,7 @@ static uint8_t trace_mem_get_info(TCGMemOp op, bool store=
);
  * Return a value for the 'info' argument in guest memory access traces.
  */
 static uint8_t trace_mem_build_info(int size_shift, bool sign_extend,
-                                    TCGMemOp endianness, bool store);
+                                    MemOp endianness, bool store);


 #include "trace/mem-internal.h"
--
1.8.3.1




--_000_156516638187537725btcom_
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
te swaps, adjust_endianness and</span><br>
</div>
<div>handle_bswap, along the I/O path.</div>
<div><br>
</div>
<div>Target dependant attributes are conditionalize upon NEED_CPU_H.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Acked-by: David Gibson &lt;david@gibson.dropbear.id.au&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;MAINTAINERS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 1 &#43;</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;include/exec/memop.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| 110 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;</div>
<div>&nbsp;target/alpha/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/arm/translate-a64.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp;48 &#43;&#43;&#43;&#43;&#43;&#43;------</div>
<div>&nbsp;target/arm/translate-a64.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/arm/translate-sve.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/arm/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp;32 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;target/arm/translate.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;target/hppa/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp;14 &#43;&#43;--</div>
<div>&nbsp;target/i386/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | 132 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;----------------</div>
<div>&nbsp;target/m68k/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;target/microblaze/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/mips/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | &nbsp; 8 &#43;-</div>
<div>&nbsp;target/openrisc/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/ppc/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp;12 &#43;--</div>
<div>&nbsp;target/riscv/insn_trans/trans_rva.inc.c | &nbsp; 8 &#43;-</div>
<div>&nbsp;target/riscv/insn_trans/trans_rvi.inc.c | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/s390x/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp; 6 &#43;-</div>
<div>&nbsp;target/s390x/translate_vx.inc.c &nbsp; &nbsp; &nbsp; &nbsp; | &n=
bsp;10 &#43;--</div>
<div>&nbsp;target/sparc/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp;14 &#43;&#43;--</div>
<div>&nbsp;target/tilegx/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;10 &#43;--</div>
<div>&nbsp;target/tricore/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 8 &#43;-</div>
<div>&nbsp;tcg/README &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/aarch64/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;| &nbsp;26 &#43;&#43;&#43;----</div>
<div>&nbsp;tcg/arm/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp;26 &#43;&#43;&#43;----</div>
<div>&nbsp;tcg/i386/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;24 &#43;&#43;&#43;---</div>
<div>&nbsp;tcg/mips/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;16 &#43;&#43;--</div>
<div>&nbsp;tcg/optimize.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/ppc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;| &nbsp;12 &#43;--</div>
<div>&nbsp;tcg/riscv/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp;20 &#43;&#43;---</div>
<div>&nbsp;tcg/s390/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | &nbsp;14 &#43;&#43;--</div>
<div>&nbsp;tcg/sparc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| &nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/tcg-op.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;38 &#43;&#43;&#43;&#4=
3;-----</div>
<div>&nbsp;tcg/tcg-op.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;86 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;-----------</div>
<div>&nbsp;tcg/tcg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 101 &#43;&#43;--------=
--------------</div>
<div>&nbsp;trace/mem-internal.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;trace/mem.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 &#43;-</div>
<div>&nbsp;39 files changed, 421 insertions(&#43;), 399 deletions(-)</div>
<div>&nbsp;create mode 100644 include/exec/memop.h</div>
<div><br>
</div>
<div>diff --git a/MAINTAINERS b/MAINTAINERS</div>
<div>index d6de200..c7cf84a 100644</div>
<div>--- a/MAINTAINERS</div>
<div>&#43;&#43;&#43; b/MAINTAINERS</div>
<div>@@ -1889,6 &#43;1889,7 @@ M: Paolo Bonzini &lt;pbonzini@redhat.com&gt;=
</div>
<div>&nbsp;S: Supported</div>
<div>&nbsp;F: include/exec/ioport.h</div>
<div>&nbsp;F: ioport.c</div>
<div>&#43;F: include/exec/memop.h</div>
<div>&nbsp;F: include/exec/memory.h</div>
<div>&nbsp;F: include/exec/ram_addr.h</div>
<div>&nbsp;F: memory.c</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index bb9897b..523be4c 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -1133,7 &#43;1133,7 @@ static void *atomic_mmu_lookup(CPUArchState =
*env, target_ulong addr,</div>
<div>&nbsp; &nbsp; &nbsp;uintptr_t index =3D tlb_index(env, mmu_idx, addr);=
</div>
<div>&nbsp; &nbsp; &nbsp;CPUTLBEntry *tlbe =3D tlb_entry(env, mmu_idx, addr=
);</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong tlb_addr =3D tlb_addr_write(tlbe);</d=
iv>
<div>- &nbsp; &nbsp;TCGMemOp mop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp mop =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;int a_bits =3D get_alignment_bits(mop);</div>
<div>&nbsp; &nbsp; &nbsp;int s_bits =3D mop &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;void *hostaddr;</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>new file mode 100644</div>
<div>index 0000000..7262ca3</div>
<div>--- /dev/null</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -0,0 &#43;1,110 @@</div>
<div>&#43;/*</div>
<div>&#43; * Constants for memory operations</div>
<div>&#43; *</div>
<div>&#43; * Authors:</div>
<div>&#43; * &nbsp;Richard Henderson &lt;rth@twiddle.net&gt;</div>
<div>&#43; *</div>
<div>&#43; * This work is licensed under the terms of the GNU GPL, version =
2 or later.</div>
<div>&#43; * See the COPYING file in the top-level directory.</div>
<div>&#43; *</div>
<div>&#43; */</div>
<div>&#43;</div>
<div>&#43;#ifndef MEMOP_H</div>
<div>&#43;#define MEMOP_H</div>
<div>&#43;</div>
<div>&#43;typedef enum MemOp {</div>
<div>&#43; &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>&#43; &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>&#43; &nbsp; &nbsp;MO_32 &nbsp; &nbsp;=3D 2,</div>
<div>&#43; &nbsp; &nbsp;MO_64 &nbsp; &nbsp;=3D 3,</div>
<div>&#43; &nbsp; &nbsp;MO_SIZE &nbsp;=3D 3, &nbsp; /* Mask for the above. =
&nbsp;*/</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_SIGN &nbsp;=3D 4, &nbsp; /* Sign-extended, other=
wise zero-extended. &nbsp;*/</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_BSWAP =3D 8, &nbsp; /* Host reverse endian. &nbs=
p;*/</div>
<div>&#43;#ifdef HOST_WORDS_BIGENDIAN</div>
<div>&#43; &nbsp; &nbsp;MO_LE &nbsp; &nbsp;=3D MO_BSWAP,</div>
<div>&#43; &nbsp; &nbsp;MO_BE &nbsp; &nbsp;=3D 0,</div>
<div>&#43;#else</div>
<div>&#43; &nbsp; &nbsp;MO_LE &nbsp; &nbsp;=3D 0,</div>
<div>&#43; &nbsp; &nbsp;MO_BE &nbsp; &nbsp;=3D MO_BSWAP,</div>
<div>&#43;#endif</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43;#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>&#43; &nbsp; &nbsp;MO_TE &nbsp; &nbsp;=3D MO_BE,</div>
<div>&#43;#else</div>
<div>&#43; &nbsp; &nbsp;MO_TE &nbsp; &nbsp;=3D MO_LE,</div>
<div>&#43;#endif</div>
<div>&#43;#endif</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;/*</div>
<div>&#43; &nbsp; &nbsp; * MO_UNALN accesses are never checked for alignmen=
t.</div>
<div>&#43; &nbsp; &nbsp; * MO_ALIGN accesses will result in a call to the C=
PU's</div>
<div>&#43; &nbsp; &nbsp; * do_unaligned_access hook if the guest address is=
 not aligned.</div>
<div>&#43; &nbsp; &nbsp; * The default depends on whether the target CPU de=
fines</div>
<div>&#43; &nbsp; &nbsp; * TARGET_ALIGNED_ONLY.</div>
<div>&#43; &nbsp; &nbsp; *</div>
<div>&#43; &nbsp; &nbsp; * Some architectures (e.g. ARMv8) need the address=
 which is aligned</div>
<div>&#43; &nbsp; &nbsp; * to a size more than the size of the memory acces=
s.</div>
<div>&#43; &nbsp; &nbsp; * Some architectures (e.g. SPARCv9) need an addres=
s which is aligned,</div>
<div>&#43; &nbsp; &nbsp; * but less strictly than the natural alignment.</d=
iv>
<div>&#43; &nbsp; &nbsp; *</div>
<div>&#43; &nbsp; &nbsp; * MO_ALIGN supposes the alignment size is the size=
 of a memory access.</div>
<div>&#43; &nbsp; &nbsp; *</div>
<div>&#43; &nbsp; &nbsp; * There are three options:</div>
<div>&#43; &nbsp; &nbsp; * - unaligned access permitted (MO_UNALN).</div>
<div>&#43; &nbsp; &nbsp; * - an alignment to the size of an access (MO_ALIG=
N);</div>
<div>&#43; &nbsp; &nbsp; * - an alignment to a specified size, which may be=
 more or less than</div>
<div>&#43; &nbsp; &nbsp; * &nbsp; the access size (MO_ALIGN_x where 'x' is =
a size in bytes);</div>
<div>&#43; &nbsp; &nbsp; */</div>
<div>&#43; &nbsp; &nbsp;MO_ASHIFT =3D 4,</div>
<div>&#43; &nbsp; &nbsp;MO_AMASK =3D 7 &lt;&lt; MO_ASHIFT,</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43;#ifdef TARGET_ALIGNED_ONLY</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN =3D 0,</div>
<div>&#43; &nbsp; &nbsp;MO_UNALN =3D MO_AMASK,</div>
<div>&#43;#else</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN =3D MO_AMASK,</div>
<div>&#43; &nbsp; &nbsp;MO_UNALN =3D 0,</div>
<div>&#43;#endif</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN_2 &nbsp;=3D 1 &lt;&lt; MO_ASHIFT,</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN_4 &nbsp;=3D 2 &lt;&lt; MO_ASHIFT,</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN_8 &nbsp;=3D 3 &lt;&lt; MO_ASHIFT,</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN_16 =3D 4 &lt;&lt; MO_ASHIFT,</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN_32 =3D 5 &lt;&lt; MO_ASHIFT,</div>
<div>&#43; &nbsp; &nbsp;MO_ALIGN_64 =3D 6 &lt;&lt; MO_ASHIFT,</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;/* Combinations of the above, for ease of use. &nbs=
p;*/</div>
<div>&#43; &nbsp; &nbsp;MO_UB &nbsp; &nbsp;=3D MO_8,</div>
<div>&#43; &nbsp; &nbsp;MO_UW &nbsp; &nbsp;=3D MO_16,</div>
<div>&#43; &nbsp; &nbsp;MO_UL &nbsp; &nbsp;=3D MO_32,</div>
<div>&#43; &nbsp; &nbsp;MO_SB &nbsp; &nbsp;=3D MO_SIGN | MO_8,</div>
<div>&#43; &nbsp; &nbsp;MO_SW &nbsp; &nbsp;=3D MO_SIGN | MO_16,</div>
<div>&#43; &nbsp; &nbsp;MO_SL &nbsp; &nbsp;=3D MO_SIGN | MO_32,</div>
<div>&#43; &nbsp; &nbsp;MO_Q &nbsp; &nbsp; =3D MO_64,</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_LEUW &nbsp;=3D MO_LE | MO_UW,</div>
<div>&#43; &nbsp; &nbsp;MO_LEUL &nbsp;=3D MO_LE | MO_UL,</div>
<div>&#43; &nbsp; &nbsp;MO_LESW &nbsp;=3D MO_LE | MO_SW,</div>
<div>&#43; &nbsp; &nbsp;MO_LESL &nbsp;=3D MO_LE | MO_SL,</div>
<div>&#43; &nbsp; &nbsp;MO_LEQ &nbsp; =3D MO_LE | MO_Q,</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_BEUW &nbsp;=3D MO_BE | MO_UW,</div>
<div>&#43; &nbsp; &nbsp;MO_BEUL &nbsp;=3D MO_BE | MO_UL,</div>
<div>&#43; &nbsp; &nbsp;MO_BESW &nbsp;=3D MO_BE | MO_SW,</div>
<div>&#43; &nbsp; &nbsp;MO_BESL &nbsp;=3D MO_BE | MO_SL,</div>
<div>&#43; &nbsp; &nbsp;MO_BEQ &nbsp; =3D MO_BE | MO_Q,</div>
<div>&#43;</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43; &nbsp; &nbsp;MO_TEUW &nbsp;=3D MO_TE | MO_UW,</div>
<div>&#43; &nbsp; &nbsp;MO_TEUL &nbsp;=3D MO_TE | MO_UL,</div>
<div>&#43; &nbsp; &nbsp;MO_TESW &nbsp;=3D MO_TE | MO_SW,</div>
<div>&#43; &nbsp; &nbsp;MO_TESL &nbsp;=3D MO_TE | MO_SL,</div>
<div>&#43; &nbsp; &nbsp;MO_TEQ &nbsp; =3D MO_TE | MO_Q,</div>
<div>&#43;#endif</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&#43;} MemOp;</div>
<div>&#43;</div>
<div>&#43;#endif</div>
<div>diff --git a/target/alpha/translate.c b/target/alpha/translate.c</div>
<div>index 2c9cccf..d5d4888 100644</div>
<div>--- a/target/alpha/translate.c</div>
<div>&#43;&#43;&#43; b/target/alpha/translate.c</div>
<div>@@ -403,7 &#43;403,7 @@ static inline void gen_store_mem(DisasContext =
*ctx,</div>
<div>&nbsp;</div>
<div>&nbsp;static DisasJumpType gen_store_conditional(DisasContext *ctx, in=
t ra, int rb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; int32_t disp16, int mem_idx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; TCGMemOp op)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; MemOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *lab_fail, *lab_done;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr, val;</div>
<div>diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c</=
div>
<div>index d323147..b6c07d6 100644</div>
<div>--- a/target/arm/translate-a64.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-a64.c</div>
<div>@@ -85,7 &#43;85,7 @@ typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);=
</div>
<div>&nbsp;typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);</div>
<div>&nbsp;typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);</=
div>
<div>&nbsp;typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);</div=
>
<div>-typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, TC=
GMemOp);</div>
<div>&#43;typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg=
, MemOp);</div>
<div>&nbsp;</div>
<div>&nbsp;/* initialize TCG globals. &nbsp;*/</div>
<div>&nbsp;void a64_translate_init(void)</div>
<div>@@ -455,7 &#43;455,7 @@ TCGv_i64 read_cpu_reg_sp(DisasContext *s, int =
reg, int sf)</div>
<div>&nbsp; * Dn, Sn, Hn or Bn).</div>
<div>&nbsp; * (Note that this is not the same mapping as for A32; see cpu.h=
)</div>
<div>&nbsp; */</div>
<div>-static inline int fp_reg_offset(DisasContext *s, int regno, TCGMemOp =
size)</div>
<div>&#43;static inline int fp_reg_offset(DisasContext *s, int regno, MemOp=
 size)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return vec_reg_offset(s, regno, 0, size);</div>
<div>&nbsp;}</div>
<div>@@ -871,7 &#43;871,7 @@ static void do_gpr_ld_memidx(DisasContext *s,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool iss_valid, unsigned int iss_srt,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool iss_sf, bool iss_ar)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D s-&gt;be_data &#43; size;</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D s-&gt;be_data &#43; size;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;g_assert(size &lt;=3D 3);</div>
<div>&nbsp;</div>
<div>@@ -948,7 &#43;948,7 @@ static void do_fp_ld(DisasContext *s, int dest=
idx, TCGv_i64 tcg_addr, int size)</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tmphi;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size &lt; 4) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D s-&gt;be_data &#43; si=
ze;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop =3D s-&gt;be_data &#43; s=
ize;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tmphi =3D tcg_const_i64(0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_qemu_ld_i64(tmplo, tcg_addr,=
 get_mem_index(s), memop);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -989,7 &#43;989,7 @@ static void do_fp_ld(DisasContext *s, int dest=
idx, TCGv_i64 tcg_addr, int size)</div>
<div>&nbsp;</div>
<div>&nbsp;/* Get value of an element within a vector register */</div>
<div>&nbsp;static void read_vec_element(DisasContext *s, TCGv_i64 tcg_dest,=
 int srcidx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; int element, TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int element, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, srcidx, element=
, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>@@ -1021,7 &#43;1021,7 @@ static void read_vec_element(DisasContext *s=
, TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void read_vec_element_i32(DisasContext *s, TCGv_i32 tcg_d=
est, int srcidx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int element, TCGMemOp memop)</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int element, MemOp memop)</=
div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, srcidx, element=
, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>@@ -1048,7 &#43;1048,7 @@ static void read_vec_element_i32(DisasContex=
t *s, TCGv_i32 tcg_dest, int srcidx,</div>
<div>&nbsp;</div>
<div>&nbsp;/* Set value of an element within a vector register */</div>
<div>&nbsp;static void write_vec_element(DisasContext *s, TCGv_i64 tcg_src,=
 int destidx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int element, TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int element, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, destidx, elemen=
t, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>@@ -1070,7 &#43;1070,7 @@ static void write_vec_element(DisasContext *=
s, TCGv_i64 tcg_src, int destidx,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_=
src,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int destidx, int element,=
 TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int destidx, int elem=
ent, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, destidx, elemen=
t, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>@@ -1090,7 &#43;1090,7 @@ static void write_vec_element_i32(DisasConte=
xt *s, TCGv_i32 tcg_src,</div>
<div>&nbsp;</div>
<div>&nbsp;/* Store from vector register to memory */</div>
<div>&nbsp;static void do_vec_st(DisasContext *s, int srcidx, int element,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;TCGv_i64 tcg_addr, int size, TCGMemOp endian)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;TCGv_i64 tcg_addr, int size, MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_tmp =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>@@ -1102,7 &#43;1102,7 @@ static void do_vec_st(DisasContext *s, int s=
rcidx, int element,</div>
<div>&nbsp;</div>
<div>&nbsp;/* Load from memory to vector register */</div>
<div>&nbsp;static void do_vec_ld(DisasContext *s, int destidx, int element,=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;TCGv_i64 tcg_addr, int size, TCGMemOp endian)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;TCGv_i64 tcg_addr, int size, MemOp endian)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_tmp =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>@@ -2200,7 &#43;2200,7 @@ static void gen_load_exclusive(DisasContext =
*s, int rt, int rt2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGv_i64 addr, int size, bool is_=
pair)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int idx =3D get_mem_index(s);</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D s-&gt;be_data;</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D s-&gt;be_data;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;g_assert(size &lt;=3D 3);</div>
<div>&nbsp; &nbsp; &nbsp;if (is_pair) {</div>
<div>@@ -3286,7 &#43;3286,7 @@ static void disas_ldst_multiple_struct(Disas=
Context *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;bool is_postidx =3D extract32(insn, 23, 1);</div>
<div>&nbsp; &nbsp; &nbsp;bool is_q =3D extract32(insn, 30, 1);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;</div>
<div>- &nbsp; &nbsp;TCGMemOp endian =3D s-&gt;be_data;</div>
<div>&#43; &nbsp; &nbsp;MemOp endian =3D s-&gt;be_data;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;int ebytes; &nbsp; /* bytes per element */</div>
<div>&nbsp; &nbsp; &nbsp;int elements; /* elements per vector */</div>
<div>@@ -5455,7 &#43;5455,7 @@ static void disas_fp_csel(DisasContext *s, u=
int32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int mos, type, rm, cond, rn, rd;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 t_true, t_false, t_zero;</div>
<div>&nbsp; &nbsp; &nbsp;DisasCompare64 c;</div>
<div>- &nbsp; &nbsp;TCGMemOp sz;</div>
<div>&#43; &nbsp; &nbsp;MemOp sz;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;mos =3D extract32(insn, 29, 3);</div>
<div>&nbsp; &nbsp; &nbsp;type =3D extract32(insn, 22, 2);</div>
<div>@@ -6267,7 &#43;6267,7 @@ static void disas_fp_imm(DisasContext *s, ui=
nt32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;int mos =3D extract32(insn, 29, 3);</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t imm;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_res;</div>
<div>- &nbsp; &nbsp;TCGMemOp sz;</div>
<div>&#43; &nbsp; &nbsp;MemOp sz;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (mos || imm5) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s);</div>
<div>@@ -7030,7 &#43;7030,7 @@ static TCGv_i32 do_reduction_op(DisasContext=
 *s, int fpopcode, int rn,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (esize =3D=3D size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int element;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp msize =3D esize =3D=3D 16 ? MO_1=
6 : MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;MemOp msize =3D esize =3D=3D 16 ? MO_=
16 : MO_32;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_elem;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* We should have one register left =
here */</div>
<div>@@ -8022,7 &#43;8022,7 @@ static void handle_vec_simd_sqshrn(DisasCont=
ext *s, bool is_scalar, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp;int shift =3D (2 * esize) - immhb;</div>
<div>&nbsp; &nbsp; &nbsp;int elements =3D is_scalar ? 1 : (64 / esize);</di=
v>
<div>&nbsp; &nbsp; &nbsp;bool round =3D extract32(opcode, 0, 1);</div>
<div>- &nbsp; &nbsp;TCGMemOp ldop =3D (size &#43; 1) | (is_u_shift ? 0 : MO=
_SIGN);</div>
<div>&#43; &nbsp; &nbsp;MemOp ldop =3D (size &#43; 1) | (is_u_shift ? 0 : M=
O_SIGN);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_rn, tcg_rd, tcg_round;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 tcg_rd_narrowed;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_final;</div>
<div>@@ -8181,7 &#43;8181,7 @@ static void handle_simd_qshl(DisasContext *s=
, bool scalar, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NeonGenTwoOpEnvFn *genfn =3D fns[src=
_unsigned][dst_unsigned][size];</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D scalar ? size : MO_32;=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop =3D scalar ? size : MO_32=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int maxpass =3D scalar ? 1 : is_q ? =
4 : 2;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; maxpass; =
pass&#43;&#43;) {</div>
<div>@@ -8225,7 &#43;8225,7 @@ static void handle_simd_intfp_conv(DisasCont=
ext *s, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_ptr tcg_fpst =3D get_fpstatus_ptr(size =3D=3D=
 MO_16);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 tcg_shift =3D NULL;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;TCGMemOp mop =3D size | (is_signed ? MO_SIGN : 0);</div=
>
<div>&#43; &nbsp; &nbsp;MemOp mop =3D size | (is_signed ? MO_SIGN : 0);</di=
v>
<div>&nbsp; &nbsp; &nbsp;int pass;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (fracbits || size =3D=3D MO_64) {</div>
<div>@@ -10004,7 &#43;10004,7 @@ static void handle_vec_simd_shri(DisasCont=
ext *s, bool is_q, bool is_u,</div>
<div>&nbsp; &nbsp; &nbsp;int dsize =3D is_q ? 128 : 64;</div>
<div>&nbsp; &nbsp; &nbsp;int esize =3D 8 &lt;&lt; size;</div>
<div>&nbsp; &nbsp; &nbsp;int elements =3D dsize/esize;</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D size | (is_u ? 0 : MO_SIGN);</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D size | (is_u ? 0 : MO_SIGN);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_rn =3D new_tmp_a64(s);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_rd =3D new_tmp_a64(s);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_round;</div>
<div>@@ -10347,7 &#43;10347,7 @@ static void handle_3rd_widening(DisasConte=
xt *s, int is_q, int is_u, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op1 =3D t=
cg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op2 =3D t=
cg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_passres;<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D MO_32 | =
(is_u ? 0 : MO_SIGN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop =3D MO_32 |=
 (is_u ? 0 : MO_SIGN);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int elt =3D pass &#43;=
 is_q * 2;</div>
<div>&nbsp;</div>
<div>@@ -11827,7 &#43;11827,7 @@ static void handle_2misc_pairwise(DisasCon=
text *s, int opcode, bool u,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size =3D=3D 2) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 32 &#43; 32 -&gt; 64 op */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D size &#43; (u ? 0 : MO=
_SIGN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop =3D size &#43; (u ? 0 : M=
O_SIGN);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; maxpass; =
pass&#43;&#43;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op1 =3D t=
cg_temp_new_i64();</div>
<div>@@ -12849,7 &#43;12849,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (is_fp) {</div>
<div>&nbsp; &nbsp; &nbsp;case 1: /* normal fp */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* convert insn encoded size to TCGMemOp =
size */</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* convert insn encoded size to MemOp=
 size */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0: /* half-precision */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>@@ -12897,7 &#43;12897,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;/* Given TCGMemOp size, adjust register and indexing. &=
nbsp;*/</div>
<div>&#43; &nbsp; &nbsp;/* Given MemOp size, adjust register and indexing. =
&nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;index =3D h &lt;&lt; 2 | l &lt;&lt; =
1 | m;</div>
<div>@@ -13194,7 &#43;13194,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_res[2];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int pass;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool satop =3D extract32(opcode, 0, =
1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop =3D MO_32;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (satop || !u) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memop |=3D MO_SIGN;</d=
iv>
<div>diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h</=
div>
<div>index 9ab4087..f1246b7 100644</div>
<div>--- a/target/arm/translate-a64.h</div>
<div>&#43;&#43;&#43; b/target/arm/translate-a64.h</div>
<div>@@ -64,7 &#43;64,7 @@ static inline void assert_fp_access_checked(Disa=
sContext *s)</div>
<div>&nbsp; * the FP/vector register Qn.</div>
<div>&nbsp; */</div>
<div>&nbsp;static inline int vec_reg_offset(DisasContext *s, int regno,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int element, TCGMemOp size)</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int element, MemOp size)</d=
iv>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int element_size =3D 1 &lt;&lt; size;</div>
<div>&nbsp; &nbsp; &nbsp;int offs =3D element * element_size;</div>
<div>diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c</=
div>
<div>index fa068b0..5d7edd0 100644</div>
<div>--- a/target/arm/translate-sve.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-sve.c</div>
<div>@@ -4567,7 &#43;4567,7 @@ static bool trans_STR_pri(DisasContext *s, a=
rg_rri *a)</div>
<div>&nbsp; */</div>
<div>&nbsp;</div>
<div>&nbsp;/* The memory mode of the dtype. &nbsp;*/</div>
<div>-static const TCGMemOp dtype_mop[16] =3D {</div>
<div>&#43;static const MemOp dtype_mop[16] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;MO_UB, MO_UB, MO_UB, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp;MO_SL, MO_UW, MO_UW, MO_UW,</div>
<div>&nbsp; &nbsp; &nbsp;MO_SW, MO_SW, MO_UL, MO_UL,</div>
<div>diff --git a/target/arm/translate.c b/target/arm/translate.c</div>
<div>index 7853462..d116c8c 100644</div>
<div>--- a/target/arm/translate.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate.c</div>
<div>@@ -114,7 &#43;114,7 @@ typedef enum ISSInfo {</div>
<div>&nbsp;} ISSInfo;</div>
<div>&nbsp;</div>
<div>&nbsp;/* Save the syndrome information for a Data Abort */</div>
<div>-static void disas_set_da_iss(DisasContext *s, TCGMemOp memop, ISSInfo=
 issinfo)</div>
<div>&#43;static void disas_set_da_iss(DisasContext *s, MemOp memop, ISSInf=
o issinfo)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t syn;</div>
<div>&nbsp; &nbsp; &nbsp;int sas =3D memop &amp; MO_SIZE;</div>
<div>@@ -1079,7 &#43;1079,7 @@ static inline void store_reg_from_load(Disas=
Context *s, int reg, TCGv_i32 var)</div>
<div>&nbsp; * that the address argument is TCGv_i32 rather than TCGv.</div>
<div>&nbsp; */</div>
<div>&nbsp;</div>
<div>-static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, TCGMe=
mOp op)</div>
<div>&#43;static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, M=
emOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_extu_i32_tl(addr, a32);</div>
<div>@@ -1092,7 &#43;1092,7 @@ static inline TCGv gen_aa32_addr(DisasContex=
t *s, TCGv_i32 a32, TCGMemOp op)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_=
i32 a32,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;int index, TCGMemOp opc)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int index, MemOp opc)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr;</div>
<div>&nbsp;</div>
<div>@@ -1107,7 &#43;1107,7 @@ static void gen_aa32_ld_i32(DisasContext *s,=
 TCGv_i32 val, TCGv_i32 a32,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_=
i32 a32,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;int index, TCGMemOp opc)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int index, MemOp opc)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr;</div>
<div>&nbsp;</div>
<div>@@ -1160,7 &#43;1160,7 @@ static inline void gen_aa32_frob64(DisasCont=
ext *s, TCGv_i64 val)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_=
i32 a32,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;int index, TCGMemOp opc)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int index, MemOp opc)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr =3D gen_aa32_addr(s, a32, opc);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_qemu_ld_i64(val, addr, index, opc);</div>
<div>@@ -1175,7 &#43;1175,7 @@ static inline void gen_aa32_ld64(DisasContex=
t *s, TCGv_i64 val,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_=
i32 a32,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;int index, TCGMemOp opc)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int index, MemOp opc)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr =3D gen_aa32_addr(s, a32, opc);</div>
<div>&nbsp;</div>
<div>@@ -1400,7 &#43;1400,7 @@ neon_reg_offset (int reg, int n)</div>
<div>&nbsp; * where 0 is the least significant end of the register.</div>
<div>&nbsp; */</div>
<div>&nbsp;static inline long</div>
<div>-neon_element_offset(int reg, int element, TCGMemOp size)</div>
<div>&#43;neon_element_offset(int reg, int element, MemOp size)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int element_size =3D 1 &lt;&lt; size;</div>
<div>&nbsp; &nbsp; &nbsp;int ofs =3D element * element_size;</div>
<div>@@ -1422,7 &#43;1422,7 @@ static TCGv_i32 neon_load_reg(int reg, int p=
ass)</div>
<div>&nbsp; &nbsp; &nbsp;return tmp;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void neon_load_element(TCGv_i32 var, int reg, int ele, TCGMemO=
p mop)</div>
<div>&#43;static void neon_load_element(TCGv_i32 var, int reg, int ele, Mem=
Op mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;long offset =3D neon_element_offset(reg, ele, mop =
&amp; MO_SIZE);</div>
<div>&nbsp;</div>
<div>@@ -1441,7 &#43;1441,7 @@ static void neon_load_element(TCGv_i32 var, =
int reg, int ele, TCGMemOp mop)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void neon_load_element64(TCGv_i64 var, int reg, int ele, TCGMe=
mOp mop)</div>
<div>&#43;static void neon_load_element64(TCGv_i64 var, int reg, int ele, M=
emOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;long offset =3D neon_element_offset(reg, ele, mop =
&amp; MO_SIZE);</div>
<div>&nbsp;</div>
<div>@@ -1469,7 &#43;1469,7 @@ static void neon_store_reg(int reg, int pass=
, TCGv_i32 var)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i32(var);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void neon_store_element(int reg, int ele, TCGMemOp size, TCGv_=
i32 var)</div>
<div>&#43;static void neon_store_element(int reg, int ele, MemOp size, TCGv=
_i32 var)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;long offset =3D neon_element_offset(reg, ele, size=
);</div>
<div>&nbsp;</div>
<div>@@ -1488,7 &#43;1488,7 @@ static void neon_store_element(int reg, int =
ele, TCGMemOp size, TCGv_i32 var)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void neon_store_element64(int reg, int ele, TCGMemOp size, TCG=
v_i64 var)</div>
<div>&#43;static void neon_store_element64(int reg, int ele, MemOp size, TC=
Gv_i64 var)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;long offset =3D neon_element_offset(reg, ele, size=
);</div>
<div>&nbsp;</div>
<div>@@ -3558,7 &#43;3558,7 @@ static int disas_neon_ls_insn(DisasContext *=
s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;int n;</div>
<div>&nbsp; &nbsp; &nbsp;int vec_size;</div>
<div>&nbsp; &nbsp; &nbsp;int mmu_idx;</div>
<div>- &nbsp; &nbsp;TCGMemOp endian;</div>
<div>&#43; &nbsp; &nbsp;MemOp endian;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 addr;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 tmp;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 tmp2;</div>
<div>@@ -6867,7 &#43;6867,7 @@ static int disas_neon_data_insn(DisasContext=
 *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if ((insn &amp;=
 0x380) =3D=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* VDUP =
*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int elem=
ent;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp size=
;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp siz=
e;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((ins=
n &amp; (7 &lt;&lt; 16)) =3D=3D 0 || (q &amp;&amp; (rd &amp; 1))) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;return 1;</div>
<div>@@ -7435,7 &#43;7435,7 @@ static void gen_load_exclusive(DisasContext =
*s, int rt, int rt2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGv_i32 addr, int size)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 tmp =3D tcg_temp_new_i32();</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D size | MO_ALIGN | s-&gt;be_data;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D size | MO_ALIGN | s-&gt;be_data;</div=
>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;s-&gt;is_ldex =3D true;</div>
<div>&nbsp;</div>
<div>@@ -7489,7 &#43;7489,7 @@ static void gen_store_exclusive(DisasContext=
 *s, int rd, int rt, int rt2,</div>
<div>&nbsp; &nbsp; &nbsp;TCGv taddr;</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *done_label;</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *fail_label;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D size | MO_ALIGN | s-&gt;be_data;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D size | MO_ALIGN | s-&gt;be_data;</div=
>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* if (env-&gt;exclusive_addr =3D=3D addr &amp;&am=
p; env-&gt;exclusive_val =3D=3D [addr]) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [addr] =3D {Rt};</div>
<div>@@ -8603,7 &#43;8603,7 @@ static void disas_arm_insn(DisasContext *s, =
unsigned int insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;TCGv taddr;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;TCGMemOp opc =3D s-&gt;be_data;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;MemOp opc =3D s-&gt;be_data;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;rm =3D (insn) &amp; 0xf;</div>
<div>&nbsp;</div>
<div>diff --git a/target/arm/translate.h b/target/arm/translate.h</div>
<div>index a20f6e2..284c510 100644</div>
<div>--- a/target/arm/translate.h</div>
<div>&#43;&#43;&#43; b/target/arm/translate.h</div>
<div>@@ -21,7 &#43;21,7 @@ typedef struct DisasContext {</div>
<div>&nbsp; &nbsp; &nbsp;int condexec_cond;</div>
<div>&nbsp; &nbsp; &nbsp;int thumb;</div>
<div>&nbsp; &nbsp; &nbsp;int sctlr_b;</div>
<div>- &nbsp; &nbsp;TCGMemOp be_data;</div>
<div>&#43; &nbsp; &nbsp;MemOp be_data;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp; &nbsp; &nbsp;int user;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/target/hppa/translate.c b/target/hppa/translate.c</div>
<div>index 188fe68..ff4802a 100644</div>
<div>--- a/target/hppa/translate.c</div>
<div>&#43;&#43;&#43; b/target/hppa/translate.c</div>
<div>@@ -1500,7 &#43;1500,7 @@ static void form_gva(DisasContext *ctx, TCGv=
_tl *pgva, TCGv_reg *pofs,</div>
<div>&nbsp; */</div>
<div>&nbsp;static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigne=
d rb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; unsigned rx, int scale, target_sreg disp,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; unsigned sp, int modify, TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; unsigned sp, int modify, MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_reg ofs;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_tl addr;</div>
<div>@@ -1518,7 &#43;1518,7 @@ static void do_load_32(DisasContext *ctx, TC=
Gv_i32 dest, unsigned rb,</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigne=
d rb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; unsigned rx, int scale, target_sreg disp,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; unsigned sp, int modify, TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; unsigned sp, int modify, MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_reg ofs;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_tl addr;</div>
<div>@@ -1536,7 &#43;1536,7 @@ static void do_load_64(DisasContext *ctx, TC=
Gv_i64 dest, unsigned rb,</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigne=
d rb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;unsigned rx, int scale, target_sreg disp,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;unsigned sp, int modify, TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;unsigned sp, int modify, MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_reg ofs;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_tl addr;</div>
<div>@@ -1554,7 &#43;1554,7 @@ static void do_store_32(DisasContext *ctx, T=
CGv_i32 src, unsigned rb,</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigne=
d rb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;unsigned rx, int scale, target_sreg disp,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;unsigned sp, int modify, TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;unsigned sp, int modify, MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_reg ofs;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_tl addr;</div>
<div>@@ -1580,7 &#43;1580,7 @@ static void do_store_64(DisasContext *ctx, T=
CGv_i64 src, unsigned rb,</div>
<div>&nbsp;</div>
<div>&nbsp;static bool do_load(DisasContext *ctx, unsigned rt, unsigned rb,=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;unsigned rx, int scale, target_sreg disp,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;unsigned sp, int modify, TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;unsigned sp, int modify, MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_reg dest;</div>
<div>&nbsp;</div>
<div>@@ -1653,7 &#43;1653,7 @@ static bool trans_fldd(DisasContext *ctx, ar=
g_ldst *a)</div>
<div>&nbsp;</div>
<div>&nbsp;static bool do_store(DisasContext *ctx, unsigned rt, unsigned rb=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; target_sreg disp, unsigned sp,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; int modify, TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; int modify, MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;nullify_over(ctx);</div>
<div>&nbsp; &nbsp; &nbsp;do_store_reg(ctx, load_gpr(ctx, rt), rb, 0, 0, dis=
p, sp, modify, mop);</div>
<div>@@ -2940,7 &#43;2940,7 @@ static bool trans_st(DisasContext *ctx, arg_=
ldst *a)</div>
<div>&nbsp;</div>
<div>&nbsp;static bool trans_ldc(DisasContext *ctx, arg_ldst *a)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp mop =3D MO_TEUL | MO_ALIGN_16 | a-&gt;size;</d=
iv>
<div>&#43; &nbsp; &nbsp;MemOp mop =3D MO_TEUL | MO_ALIGN_16 | a-&gt;size;</=
div>
<div>&nbsp; &nbsp; &nbsp;TCGv_reg zero, dest, ofs;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_tl addr;</div>
<div>&nbsp;</div>
<div>diff --git a/target/i386/translate.c b/target/i386/translate.c</div>
<div>index 03150a8..def9867 100644</div>
<div>--- a/target/i386/translate.c</div>
<div>&#43;&#43;&#43; b/target/i386/translate.c</div>
<div>@@ -87,8 &#43;87,8 @@ typedef struct DisasContext {</div>
<div>&nbsp; &nbsp; &nbsp;/* current insn context */</div>
<div>&nbsp; &nbsp; &nbsp;int override; /* -1 if no override */</div>
<div>&nbsp; &nbsp; &nbsp;int prefix;</div>
<div>- &nbsp; &nbsp;TCGMemOp aflag;</div>
<div>- &nbsp; &nbsp;TCGMemOp dflag;</div>
<div>&#43; &nbsp; &nbsp;MemOp aflag;</div>
<div>&#43; &nbsp; &nbsp;MemOp dflag;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong pc_start;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong pc; /* pc =3D eip &#43; cs_base */</d=
iv>
<div>&nbsp; &nbsp; &nbsp;/* current block context */</div>
<div>@@ -149,7 &#43;149,7 @@ static void gen_eob(DisasContext *s);</div>
<div>&nbsp;static void gen_jr(DisasContext *s, TCGv dest);</div>
<div>&nbsp;static void gen_jmp(DisasContext *s, target_ulong eip);</div>
<div>&nbsp;static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb=
_num);</div>
<div>-static void gen_op(DisasContext *s1, int op, TCGMemOp ot, int d);</di=
v>
<div>&#43;static void gen_op(DisasContext *s1, int op, MemOp ot, int d);</d=
iv>
<div>&nbsp;</div>
<div>&nbsp;/* i386 arith/logic operations */</div>
<div>&nbsp;enum {</div>
<div>@@ -320,7 &#43;320,7 @@ static inline bool byte_reg_is_xH(DisasContext=
 *s, int reg)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select the size of a push/pop operation. &nbsp;*/</div>
<div>-static inline TCGMemOp mo_pushpop(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline MemOp mo_pushpop(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (CODE64(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ot =3D=3D MO_16 ? MO_16 : MO_=
64;</div>
<div>@@ -330,13 &#43;330,13 @@ static inline TCGMemOp mo_pushpop(DisasConte=
xt *s, TCGMemOp ot)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select the size of the stack pointer. &nbsp;*/</div>
<div>-static inline TCGMemOp mo_stacksize(DisasContext *s)</div>
<div>&#43;static inline MemOp mo_stacksize(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_32 : MO=
_16;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select only size 64 else 32. &nbsp;Used for SSE operand sizes=
. &nbsp;*/</div>
<div>-static inline TCGMemOp mo_64_32(TCGMemOp ot)</div>
<div>&#43;static inline MemOp mo_64_32(MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>&nbsp; &nbsp; &nbsp;return ot =3D=3D MO_64 ? MO_64 : MO_32;</div>
<div>@@ -347,19 &#43;347,19 @@ static inline TCGMemOp mo_64_32(TCGMemOp ot)=
</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select size 8 if lsb of B is clear, else OT. &nbsp;Used for d=
ecoding</div>
<div>&nbsp; &nbsp; byte vs word opcodes. &nbsp;*/</div>
<div>-static inline TCGMemOp mo_b_d(int b, TCGMemOp ot)</div>
<div>&#43;static inline MemOp mo_b_d(int b, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return b &amp; 1 ? ot : MO_8;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select size 8 if lsb of B is clear, else OT capped at 32.</di=
v>
<div>&nbsp; &nbsp; Used for decoding operand size of port opcodes. &nbsp;*/=
</div>
<div>-static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)</div>
<div>&#43;static inline MemOp mo_b_d32(int b, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_3=
2) : MO_8;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int reg, T=
CGv t0)</div>
<div>&#43;static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, =
TCGv t0)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch(ot) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -388,7 &#43;388,7 @@ static void gen_op_mov_reg_v(DisasContext *s, =
TCGMemOp ot, int reg, TCGv t0)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static inline</div>
<div>-void gen_op_mov_v_reg(DisasContext *s, TCGMemOp ot, TCGv t0, int reg)=
</div>
<div>&#43;void gen_op_mov_v_reg(DisasContext *s, MemOp ot, TCGv t0, int reg=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_8 &amp;&amp; byte_reg_is_xH(s, re=
g)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_extract_tl(t0, cpu_regs[reg =
- 4], 8, 8);</div>
<div>@@ -411,13 &#43;411,13 @@ static inline void gen_op_jmp_v(TCGv dest)</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static inline</div>
<div>-void gen_op_add_reg_im(DisasContext *s, TCGMemOp size, int reg, int32=
_t val)</div>
<div>&#43;void gen_op_add_reg_im(DisasContext *s, MemOp size, int reg, int3=
2_t val)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_tl(s-&gt;tmp0, cpu_regs[reg], val);</=
div>
<div>&nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, size, reg, s-&gt;tmp0);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_op_add_reg_T0(DisasContext *s, TCGMemOp size, =
int reg)</div>
<div>&#43;static inline void gen_op_add_reg_T0(DisasContext *s, MemOp size,=
 int reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_add_tl(s-&gt;tmp0, cpu_regs[reg], s-&gt;T0=
);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, size, reg, s-&gt;tmp0);</div>
<div>@@ -451,7 &#43;451,7 @@ static inline void gen_jmp_im(DisasContext *s,=
 target_ulong pc)</div>
<div>&nbsp;/* Compute SEG:REG into A0. &nbsp;SEG is selected from the overr=
ide segment</div>
<div>&nbsp; &nbsp; (OVR_SEG) and the default segment (DEF_SEG). &nbsp;OVR_S=
EG may be -1 to</div>
<div>&nbsp; &nbsp; indicate no override. &nbsp;*/</div>
<div>-static void gen_lea_v_seg(DisasContext *s, TCGMemOp aflag, TCGv a0,</=
div>
<div>&#43;static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;int def_seg, int ovr_seg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (aflag) {</div>
<div>@@ -514,13 &#43;514,13 @@ static inline void gen_string_movl_A0_EDI(Di=
sasContext *s)</div>
<div>&nbsp; &nbsp; &nbsp;gen_lea_v_seg(s, s-&gt;aflag, cpu_regs[R_EDI], R_E=
S, -1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_op_movl_T0_Dshift(DisasContext *s, TCGMemOp ot=
)</div>
<div>&#43;static inline void gen_op_movl_T0_Dshift(DisasContext *s, MemOp o=
t)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_ld32s_tl(s-&gt;T0, cpu_env, offsetof(CPUX8=
6State, df));</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shli_tl(s-&gt;T0, s-&gt;T0, ot);</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>-static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp size, bool sign)<=
/div>
<div>&#43;static TCGv gen_ext_tl(TCGv dst, TCGv src, MemOp size, bool sign)=
</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -551,18 &#43;551,18 @@ static TCGv gen_ext_tl(TCGv dst, TCGv src, T=
CGMemOp size, bool sign)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_extu(TCGMemOp ot, TCGv reg)</div>
<div>&#43;static void gen_extu(MemOp ot, TCGv reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_ext_tl(reg, reg, ot, false);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_exts(TCGMemOp ot, TCGv reg)</div>
<div>&#43;static void gen_exts(MemOp ot, TCGv reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_ext_tl(reg, reg, ot, true);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static inline</div>
<div>-void gen_op_jnz_ecx(DisasContext *s, TCGMemOp size, TCGLabel *label1)=
</div>
<div>&#43;void gen_op_jnz_ecx(DisasContext *s, MemOp size, TCGLabel *label1=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_mov_tl(s-&gt;tmp0, cpu_regs[R_ECX]);</div>
<div>&nbsp; &nbsp; &nbsp;gen_extu(size, s-&gt;tmp0);</div>
<div>@@ -570,14 &#43;570,14 @@ void gen_op_jnz_ecx(DisasContext *s, TCGMemO=
p size, TCGLabel *label1)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static inline</div>
<div>-void gen_op_jz_ecx(DisasContext *s, TCGMemOp size, TCGLabel *label1)<=
/div>
<div>&#43;void gen_op_jz_ecx(DisasContext *s, MemOp size, TCGLabel *label1)=
</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_mov_tl(s-&gt;tmp0, cpu_regs[R_ECX]);</div>
<div>&nbsp; &nbsp; &nbsp;gen_extu(size, s-&gt;tmp0);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_brcondi_tl(TCG_COND_EQ, s-&gt;tmp0, 0, lab=
el1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCGv_i32 n)</div>
<div>&#43;static void gen_helper_in_func(MemOp ot, TCGv v, TCGv_i32 n)</div=
>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -594,7 &#43;594,7 @@ static void gen_helper_in_func(TCGMemOp ot, TC=
Gv v, TCGv_i32 n)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v, TCGv_i32 n)<=
/div>
<div>&#43;static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)=
</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -611,7 &#43;611,7 @@ static void gen_helper_out_func(TCGMemOp ot, T=
CGv_i32 v, TCGv_i32 n)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_check_io(DisasContext *s, TCGMemOp ot, target_ulong c=
ur_eip,</div>
<div>&#43;static void gen_check_io(DisasContext *s, MemOp ot, target_ulong =
cur_eip,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; uint32_t svm_flags)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong next_eip;</div>
<div>@@ -644,7 &#43;644,7 @@ static void gen_check_io(DisasContext *s, TCGM=
emOp ot, target_ulong cur_eip,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_movs(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_movs(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_string_movl_A0_ESI(s);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&gt;T0, s-&gt;A0);</div>
<div>@@ -840,7 &#43;840,7 @@ static CCPrepare gen_prepare_eflags_s(DisasCon=
text *s, TCGv reg)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return (CCPrepare) { .cond =3D TCG_C=
OND_NEVER, .mask =3D -1 };</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp size =3D (s-&gt;cc=
_op - CC_OP_ADDB) &amp; 3;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp size =3D (s-&gt;c=
c_op - CC_OP_ADDB) &amp; 3;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv t0 =3D gen_ext_tl=
(reg, cpu_cc_dst, size, true);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return (CCPrepare) { .=
cond =3D TCG_COND_LT, .reg =3D t0, .mask =3D -1 };</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -885,7 &#43;885,7 @@ static CCPrepare gen_prepare_eflags_z(DisasCon=
text *s, TCGv reg)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .mask =3D -1 };</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp size =3D (s-&gt;cc=
_op - CC_OP_ADDB) &amp; 3;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp size =3D (s-&gt;c=
c_op - CC_OP_ADDB) &amp; 3;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv t0 =3D gen_ext_tl=
(reg, cpu_cc_dst, size, false);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return (CCPrepare) { .=
cond =3D TCG_COND_EQ, .reg =3D t0, .mask =3D -1 };</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -897,7 &#43;897,7 @@ static CCPrepare gen_prepare_eflags_z(DisasCon=
text *s, TCGv reg)</div>
<div>&nbsp;static CCPrepare gen_prepare_cc(DisasContext *s, int b, TCGv reg=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int inv, jcc_op, cond;</div>
<div>- &nbsp; &nbsp;TCGMemOp size;</div>
<div>&#43; &nbsp; &nbsp;MemOp size;</div>
<div>&nbsp; &nbsp; &nbsp;CCPrepare cc;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0;</div>
<div>&nbsp;</div>
<div>@@ -1075,7 &#43;1075,7 @@ static TCGLabel *gen_jz_ecx_string(DisasCont=
ext *s, target_ulong next_eip)</div>
<div>&nbsp; &nbsp; &nbsp;return l2;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_stos(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_stos(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp;gen_string_movl_A0_EDI(s);</div>
<div>@@ -1084,7 &#43;1084,7 @@ static inline void gen_stos(DisasContext *s,=
 TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_add_reg_T0(s, s-&gt;aflag, R_EDI);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_lods(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_lods(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_string_movl_A0_ESI(s);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&gt;T0, s-&gt;A0);</div>
<div>@@ -1093,7 &#43;1093,7 @@ static inline void gen_lods(DisasContext *s,=
 TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_add_reg_T0(s, s-&gt;aflag, R_ESI);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_scas(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_scas(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_string_movl_A0_EDI(s);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&gt;T1, s-&gt;A0);</div>
<div>@@ -1102,7 &#43;1102,7 @@ static inline void gen_scas(DisasContext *s,=
 TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_add_reg_T0(s, s-&gt;aflag, R_EDI);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_cmps(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_cmps(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_string_movl_A0_EDI(s);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&gt;T1, s-&gt;A0);</div>
<div>@@ -1126,7 &#43;1126,7 @@ static void gen_bpt_io(DisasContext *s, TCGv=
_i32 t_port, int ot)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>-static inline void gen_ins(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_ins(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (tb_cflags(s-&gt;base.tb) &amp; CF_USE_ICOUNT) =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_io_start();</div>
<div>@@ -1148,7 &#43;1148,7 @@ static inline void gen_ins(DisasContext *s, =
TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_outs(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_outs(DisasContext *s, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (tb_cflags(s-&gt;base.tb) &amp; CF_USE_ICOUNT) =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_io_start();</div>
<div>@@ -1171,7 &#43;1171,7 @@ static inline void gen_outs(DisasContext *s,=
 TCGMemOp ot)</div>
<div>&nbsp;/* same method as Valgrind : we generate jumps to current or nex=
t</div>
<div>&nbsp; &nbsp; instruction */</div>
<div>&nbsp;#define GEN_REPZ(op) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;\</div>
<div>-static inline void gen_repz_ ## op(DisasContext *s, TCGMemOp ot, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&#43;static inline void gen_repz_ ## op(DisasContext *s, MemOp ot, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong cur_eip, targ=
et_ulong next_eip) \</div>
<div>&nbsp;{ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *l2; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; \</div>
<div>@@ -1187,7 &#43;1187,7 @@ static inline void gen_repz_ ## op(DisasCont=
ext *s, TCGMemOp ot, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div=
>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#define GEN_REPZ2(op) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; \</div>
<div>-static inline void gen_repz_ ## op(DisasContext *s, TCGMemOp ot, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&#43;static inline void gen_repz_ ## op(DisasContext *s, MemOp ot, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong cur_ei=
p, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong next_e=
ip, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int nz) &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>@@ -1284,7 &#43;1284,7 @@ static void gen_illegal_opcode(DisasContext =
*s)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* if d =3D=3D OR_TMP0, it means memory operand (address in A0) =
*/</div>
<div>-static void gen_op(DisasContext *s1, int op, TCGMemOp ot, int d)</div=
>
<div>&#43;static void gen_op(DisasContext *s1, int op, MemOp ot, int d)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (d !=3D OR_TMP0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s1-&gt;prefix &amp; PREFIX_LOCK)=
 {</div>
<div>@@ -1395,7 &#43;1395,7 @@ static void gen_op(DisasContext *s1, int op,=
 TCGMemOp ot, int d)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* if d =3D=3D OR_TMP0, it means memory operand (address in A0) =
*/</div>
<div>-static void gen_inc(DisasContext *s1, TCGMemOp ot, int d, int c)</div=
>
<div>&#43;static void gen_inc(DisasContext *s1, MemOp ot, int d, int c)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (s1-&gt;prefix &amp; PREFIX_LOCK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (d !=3D OR_TMP0) {</div>
<div>@@ -1421,7 &#43;1421,7 @@ static void gen_inc(DisasContext *s1, TCGMem=
Op ot, int d, int c)</div>
<div>&nbsp; &nbsp; &nbsp;set_cc_op(s1, (c &gt; 0 ? CC_OP_INCB : CC_OP_DECB)=
 &#43; ot);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_shift_flags(DisasContext *s, TCGMemOp ot, TCGv result=
,</div>
<div>&#43;static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv resul=
t,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv shm1, TCGv count, bool is_right)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 z32, s32, oldop;</div>
<div>@@ -1466,7 &#43;1466,7 @@ static void gen_shift_flags(DisasContext *s,=
 TCGMemOp ot, TCGv result,</div>
<div>&nbsp; &nbsp; &nbsp;set_cc_op(s, CC_OP_DYNAMIC);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_shift_rm_T1(DisasContext *s, TCGMemOp ot, int op1,</d=
iv>
<div>&#43;static void gen_shift_rm_T1(DisasContext *s, MemOp ot, int op1,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int is_right, int is_arith)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x=
1f);</div>
<div>@@ -1502,7 &#43;1502,7 @@ static void gen_shift_rm_T1(DisasContext *s,=
 TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp;gen_shift_flags(s, ot, s-&gt;T0, s-&gt;tmp0, s-&gt=
;T1, is_right);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_shift_rm_im(DisasContext *s, TCGMemOp ot, int op1, in=
t op2,</div>
<div>&#43;static void gen_shift_rm_im(DisasContext *s, MemOp ot, int op1, i=
nt op2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int is_right, int is_arith)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x1f);</div=
>
<div>@@ -1542,7 &#43;1542,7 @@ static void gen_shift_rm_im(DisasContext *s,=
 TCGMemOp ot, int op1, int op2,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_rot_rm_T1(DisasContext *s, TCGMemOp ot, int op1, int =
is_right)</div>
<div>&#43;static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int=
 is_right)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x=
1f);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 t0, t1;</div>
<div>@@ -1627,7 &#43;1627,7 @@ static void gen_rot_rm_T1(DisasContext *s, T=
CGMemOp ot, int op1, int is_right)</div>
<div>&nbsp; &nbsp; &nbsp;set_cc_op(s, CC_OP_DYNAMIC);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_rot_rm_im(DisasContext *s, TCGMemOp ot, int op1, int =
op2,</div>
<div>&#43;static void gen_rot_rm_im(DisasContext *s, MemOp ot, int op1, int=
 op2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;int is_right)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int mask =3D (ot =3D=3D MO_64 ? 0x3f : 0x1f);</div=
>
<div>@@ -1705,7 &#43;1705,7 @@ static void gen_rot_rm_im(DisasContext *s, T=
CGMemOp ot, int op1, int op2,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* XXX: add faster immediate =3D 1 case */</div>
<div>-static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp ot, int op1,</di=
v>
<div>&#43;static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; int is_right)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_compute_eflags(s);</div>
<div>@@ -1761,7 &#43;1761,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* XXX: add faster immediate case */</div>
<div>-static void gen_shiftd_rm_T1(DisasContext *s, TCGMemOp ot, int op1,</=
div>
<div>&#43;static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool is_right, TCGv count_in)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong mask =3D (ot =3D=3D MO_64 ? 63 : 31);=
</div>
<div>@@ -1842,7 &#43;1842,7 @@ static void gen_shiftd_rm_T1(DisasContext *s=
, TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free(count);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_shift(DisasContext *s1, int op, TCGMemOp ot, int d, i=
nt s)</div>
<div>&#43;static void gen_shift(DisasContext *s1, int op, MemOp ot, int d, =
int s)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (s !=3D OR_TMP1)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s1, ot, s1-&gt;T1, =
s);</div>
<div>@@ -1872,7 &#43;1872,7 @@ static void gen_shift(DisasContext *s1, int =
op, TCGMemOp ot, int d, int s)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_shifti(DisasContext *s1, int op, TCGMemOp ot, int d, =
int c)</div>
<div>&#43;static void gen_shifti(DisasContext *s1, int op, MemOp ot, int d,=
 int c)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch(op) {</div>
<div>&nbsp; &nbsp; &nbsp;case OP_ROL:</div>
<div>@@ -2149,7 &#43;2149,7 @@ static void gen_add_A0_ds_seg(DisasContext *=
s)</div>
<div>&nbsp;/* generate modrm memory load or store of 'reg'. TMP0 is used if=
 reg =3D=3D</div>
<div>&nbsp; &nbsp; OR_TMP0 */</div>
<div>&nbsp;static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, in=
t modrm,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; TCGMemOp ot, int reg, int is_store)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; MemOp ot, int reg, int is_store)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int mod, rm;</div>
<div>&nbsp;</div>
<div>@@ -2179,7 &#43;2179,7 @@ static void gen_ldst_modrm(CPUX86State *env,=
 DisasContext *s, int modrm,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, TC=
GMemOp ot)</div>
<div>&#43;static inline uint32_t insn_get(CPUX86State *env, DisasContext *s=
, MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t ret;</div>
<div>&nbsp;</div>
<div>@@ -2202,7 &#43;2202,7 @@ static inline uint32_t insn_get(CPUX86State =
*env, DisasContext *s, TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;return ret;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline int insn_const_size(TCGMemOp ot)</div>
<div>&#43;static inline int insn_const_size(MemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (ot &lt;=3D MO_32) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1 &lt;&lt; ot;</div>
<div>@@ -2266,7 &#43;2266,7 @@ static inline void gen_jcc(DisasContext *s, =
int b,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_cmovcc1(CPUX86State *env, DisasContext *s, TCGMemOp o=
t, int b,</div>
<div>&#43;static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp =
ot, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;int modrm, int reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CCPrepare cc;</div>
<div>@@ -2363,8 &#43;2363,8 @@ static inline void gen_stack_update(DisasCon=
text *s, int addend)</div>
<div>&nbsp;/* Generate a push. It depends on ss32, addseg and dflag. &nbsp;=
*/</div>
<div>&nbsp;static void gen_push_v(DisasContext *s, TCGv val)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>- &nbsp; &nbsp;TCGMemOp a_ot =3D mo_stacksize(s);</div>
<div>&#43; &nbsp; &nbsp;MemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>&#43; &nbsp; &nbsp;MemOp a_ot =3D mo_stacksize(s);</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv new_esp =3D s-&gt;A0;</div>
<div>&nbsp;</div>
<div>@@ -2383,9 &#43;2383,9 @@ static void gen_push_v(DisasContext *s, TCGv=
 val)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* two step pop is necessary for precise exceptions */</div>
<div>-static TCGMemOp gen_pop_T0(DisasContext *s)</div>
<div>&#43;static MemOp gen_pop_T0(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>&#43; &nbsp; &nbsp;MemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;gen_lea_v_seg(s, mo_stacksize(s), cpu_regs[R_ESP],=
 R_SS, -1);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_ld_v(s, d_ot, s-&gt;T0, s-&gt;A0);</div>
<div>@@ -2393,7 &#43;2393,7 @@ static TCGMemOp gen_pop_T0(DisasContext *s)<=
/div>
<div>&nbsp; &nbsp; &nbsp;return d_ot;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void gen_pop_update(DisasContext *s, TCGMemOp ot)</div>
<div>&#43;static inline void gen_pop_update(DisasContext *s, MemOp ot)</div=
>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_stack_update(s, 1 &lt;&lt; ot);</div>
<div>&nbsp;}</div>
<div>@@ -2405,8 &#43;2405,8 @@ static inline void gen_stack_A0(DisasContext=
 *s)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_pusha(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_16;</div>
<div>- &nbsp; &nbsp;TCGMemOp d_ot =3D s-&gt;dflag;</div>
<div>&#43; &nbsp; &nbsp;MemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_16;</div>
<div>&#43; &nbsp; &nbsp;MemOp d_ot =3D s-&gt;dflag;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>@@ -2421,8 &#43;2421,8 @@ static void gen_pusha(DisasContext *s)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_popa(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_16;</div>
<div>- &nbsp; &nbsp;TCGMemOp d_ot =3D s-&gt;dflag;</div>
<div>&#43; &nbsp; &nbsp;MemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_16;</div>
<div>&#43; &nbsp; &nbsp;MemOp d_ot =3D s-&gt;dflag;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>@@ -2442,8 &#43;2442,8 @@ static void gen_popa(DisasContext *s)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_enter(DisasContext *s, int esp_addend, int level=
)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>- &nbsp; &nbsp;TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_3=
2 : MO_16;</div>
<div>&#43; &nbsp; &nbsp;MemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>&#43; &nbsp; &nbsp;MemOp a_ot =3D CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_=
32 : MO_16;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Push BP; compute FrameTemp into T1. &nbsp;*/</d=
iv>
<div>@@ -2482,8 &#43;2482,8 @@ static void gen_enter(DisasContext *s, int e=
sp_addend, int level)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_leave(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>- &nbsp; &nbsp;TCGMemOp a_ot =3D mo_stacksize(s);</div>
<div>&#43; &nbsp; &nbsp;MemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div>
<div>&#43; &nbsp; &nbsp;MemOp a_ot =3D mo_stacksize(s);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;gen_lea_v_seg(s, a_ot, cpu_regs[R_EBP], R_SS, -1);=
</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_ld_v(s, d_ot, s-&gt;T0, s-&gt;A0);</div>
<div>@@ -3045,7 &#43;3045,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp;SSEFunc_0_eppi sse_fn_eppi;</div>
<div>&nbsp; &nbsp; &nbsp;SSEFunc_0_ppi sse_fn_ppi;</div>
<div>&nbsp; &nbsp; &nbsp;SSEFunc_0_eppt sse_fn_eppt;</div>
<div>- &nbsp; &nbsp;TCGMemOp ot;</div>
<div>&#43; &nbsp; &nbsp;MemOp ot;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;b &amp;=3D 0xff;</div>
<div>&nbsp; &nbsp; &nbsp;if (s-&gt;prefix &amp; PREFIX_DATA)</div>
<div>@@ -4488,7 &#43;4488,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;CPUX86State *env =3D cpu-&gt;env_ptr;</div>
<div>&nbsp; &nbsp; &nbsp;int b, prefixes;</div>
<div>&nbsp; &nbsp; &nbsp;int shift;</div>
<div>- &nbsp; &nbsp;TCGMemOp ot, aflag, dflag;</div>
<div>&#43; &nbsp; &nbsp;MemOp ot, aflag, dflag;</div>
<div>&nbsp; &nbsp; &nbsp;int modrm, reg, rm, mod, op, opreg, val;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong next_eip, tval;</div>
<div>&nbsp; &nbsp; &nbsp;int rex_w, rex_r;</div>
<div>@@ -5567,8 &#43;5567,8 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1be: /* movsbS Gv, Eb */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1bf: /* movswS Gv, Eb */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp d_ot;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp s_ot;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp d_ot;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp s_ot;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* d_ot is the size of=
 destination */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d_ot =3D dflag;</div>
<div>diff --git a/target/m68k/translate.c b/target/m68k/translate.c</div>
<div>index 60bcfb7..24c1dd3 100644</div>
<div>--- a/target/m68k/translate.c</div>
<div>&#43;&#43;&#43; b/target/m68k/translate.c</div>
<div>@@ -2414,7 &#43;2414,7 @@ DISAS_INSN(cas)</div>
<div>&nbsp; &nbsp; &nbsp;uint16_t ext;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv load;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv cmp;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch ((insn &gt;&gt; 9) &amp; 3) {</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>diff --git a/target/microblaze/translate.c b/target/microblaze/transla=
te.c</div>
<div>index 9ce65f3..41d1b8b 100644</div>
<div>--- a/target/microblaze/translate.c</div>
<div>&#43;&#43;&#43; b/target/microblaze/translate.c</div>
<div>@@ -919,7 &#43;919,7 @@ static void dec_load(DisasContext *dc)</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int size;</div>
<div>&nbsp; &nbsp; &nbsp;bool rev =3D false, ex =3D false, ea =3D false;</d=
iv>
<div>&nbsp; &nbsp; &nbsp;int mem_index =3D cpu_mmu_index(&amp;dc-&gt;cpu-&g=
t;env, false);</div>
<div>- &nbsp; &nbsp;TCGMemOp mop;</div>
<div>&#43; &nbsp; &nbsp;MemOp mop;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;mop =3D dc-&gt;opcode &amp; 3;</div>
<div>&nbsp; &nbsp; &nbsp;size =3D 1 &lt;&lt; mop;</div>
<div>@@ -1035,7 &#43;1035,7 @@ static void dec_store(DisasContext *dc)</div=
>
<div>&nbsp; &nbsp; &nbsp;unsigned int size;</div>
<div>&nbsp; &nbsp; &nbsp;bool rev =3D false, ex =3D false, ea =3D false;</d=
iv>
<div>&nbsp; &nbsp; &nbsp;int mem_index =3D cpu_mmu_index(&amp;dc-&gt;cpu-&g=
t;env, false);</div>
<div>- &nbsp; &nbsp;TCGMemOp mop;</div>
<div>&#43; &nbsp; &nbsp;MemOp mop;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;mop =3D dc-&gt;opcode &amp; 3;</div>
<div>&nbsp; &nbsp; &nbsp;size =3D 1 &lt;&lt; mop;</div>
<div>diff --git a/target/mips/translate.c b/target/mips/translate.c</div>
<div>index ca62800..59b5d85 100644</div>
<div>--- a/target/mips/translate.c</div>
<div>&#43;&#43;&#43; b/target/mips/translate.c</div>
<div>@@ -2526,7 &#43;2526,7 @@ typedef struct DisasContext {</div>
<div>&nbsp; &nbsp; &nbsp;int32_t CP0_Config5;</div>
<div>&nbsp; &nbsp; &nbsp;/* Routine used to access memory */</div>
<div>&nbsp; &nbsp; &nbsp;int mem_idx;</div>
<div>- &nbsp; &nbsp;TCGMemOp default_tcg_memop_mask;</div>
<div>&#43; &nbsp; &nbsp;MemOp default_tcg_memop_mask;</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t hflags, saved_hflags;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong btarget;</div>
<div>&nbsp; &nbsp; &nbsp;bool ulri;</div>
<div>@@ -3706,7 &#43;3706,7 @@ static void gen_st(DisasContext *ctx, uint32=
_t opc, int rt,</div>
<div>&nbsp;</div>
<div>&nbsp;/* Store conditional */</div>
<div>&nbsp;static void gen_st_cond(DisasContext *ctx, int rt, int base, int=
 offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;TCGMemOp tcg_mo, bool eva)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;MemOp tcg_mo, bool eva)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv addr, t0, val;</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *l1 =3D gen_new_label();</div>
<div>@@ -4546,7 &#43;4546,7 @@ static void gen_HILO(DisasContext *ctx, uint=
32_t opc, int acc, int reg)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void gen_r6_ld(target_long addr, int reg, int memi=
dx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0 =3D tcg_const_tl(addr);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);</div>
<div>@@ -21828,7 &#43;21828,7 @@ static int decode_nanomips_32_48_opc(CPUMI=
PSState *env, DisasContext *ctx)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; extract32(ctx-&gt;opcode, 0, 8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;TCGv va =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;TCGv t1 =3D tcg_temp_new();</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;TCGMemOp memop =3D (extract32(ctx-&gt;opcode, 8, 3)) =3D=3D</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;MemOp memop =3D (extract32(ctx-&gt;opcode, 8, 3)) =3D=3D</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NM_P_L=
S_UAWM ? MO_UNALN : 0;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;count =3D (count =3D=3D 0) ? 8 : count;</div>
<div>diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c=
</div>
<div>index 4360ce4..b189c50 100644</div>
<div>--- a/target/openrisc/translate.c</div>
<div>&#43;&#43;&#43; b/target/openrisc/translate.c</div>
<div>@@ -681,7 &#43;681,7 @@ static bool trans_l_lwa(DisasContext *dc, arg_=
load *a)</div>
<div>&nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void do_load(DisasContext *dc, arg_load *a, TCGMemOp mop)</div=
>
<div>&#43;static void do_load(DisasContext *dc, arg_load *a, MemOp mop)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv ea;</div>
<div>&nbsp;</div>
<div>@@ -763,7 &#43;763,7 @@ static bool trans_l_swa(DisasContext *dc, arg_=
store *a)</div>
<div>&nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void do_store(DisasContext *dc, arg_store *a, TCGMemOp mop)</d=
iv>
<div>&#43;static void do_store(DisasContext *dc, arg_store *a, MemOp mop)</=
div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0 =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_tl(t0, cpu_R[a-&gt;a], a-&gt;i);</div=
>
<div>diff --git a/target/ppc/translate.c b/target/ppc/translate.c</div>
<div>index 4a5de28..31800ed 100644</div>
<div>--- a/target/ppc/translate.c</div>
<div>&#43;&#43;&#43; b/target/ppc/translate.c</div>
<div>@@ -162,7 &#43;162,7 @@ struct DisasContext {</div>
<div>&nbsp; &nbsp; &nbsp;int mem_idx;</div>
<div>&nbsp; &nbsp; &nbsp;int access_type;</div>
<div>&nbsp; &nbsp; &nbsp;/* Translation flags */</div>
<div>- &nbsp; &nbsp;TCGMemOp default_tcg_memop_mask;</div>
<div>&#43; &nbsp; &nbsp;MemOp default_tcg_memop_mask;</div>
<div>&nbsp;#if defined(TARGET_PPC64)</div>
<div>&nbsp; &nbsp; &nbsp;bool sf_mode;</div>
<div>&nbsp; &nbsp; &nbsp;bool has_cfar;</div>
<div>@@ -3142,7 &#43;3142,7 @@ static void gen_isync(DisasContext *ctx)</di=
v>
<div>&nbsp;</div>
<div>&nbsp;#define MEMOP_GET_SIZE(x) &nbsp;(1 &lt;&lt; ((x) &amp; MO_SIZE))=
</div>
<div>&nbsp;</div>
<div>-static void gen_load_locked(DisasContext *ctx, TCGMemOp memop)</div>
<div>&#43;static void gen_load_locked(DisasContext *ctx, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv gpr =3D cpu_gpr[rD(ctx-&gt;opcode)];</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0 =3D tcg_temp_new();</div>
<div>@@ -3167,7 &#43;3167,7 @@ LARX(lbarx, DEF_MEMOP(MO_UB))</div>
<div>&nbsp;LARX(lharx, DEF_MEMOP(MO_UW))</div>
<div>&nbsp;LARX(lwarx, DEF_MEMOP(MO_UL))</div>
<div>&nbsp;</div>
<div>-static void gen_fetch_inc_conditional(DisasContext *ctx, TCGMemOp mem=
op,</div>
<div>&#43;static void gen_fetch_inc_conditional(DisasContext *ctx, MemOp me=
mop,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv E=
A, TCGCond cond, int addend)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t =3D tcg_temp_new();</div>
<div>@@ -3193,7 &#43;3193,7 @@ static void gen_fetch_inc_conditional(DisasC=
ontext *ctx, TCGMemOp memop,</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free(u);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void gen_ld_atomic(DisasContext *ctx, TCGMemOp memop)</div>
<div>&#43;static void gen_ld_atomic(DisasContext *ctx, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t gpr_FC =3D FC(ctx-&gt;opcode);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv EA =3D tcg_temp_new();</div>
<div>@@ -3306,7 &#43;3306,7 @@ static void gen_ldat(DisasContext *ctx)</div=
>
<div>&nbsp;}</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>-static void gen_st_atomic(DisasContext *ctx, TCGMemOp memop)</div>
<div>&#43;static void gen_st_atomic(DisasContext *ctx, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t gpr_FC =3D FC(ctx-&gt;opcode);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv EA =3D tcg_temp_new();</div>
<div>@@ -3389,7 &#43;3389,7 @@ static void gen_stdat(DisasContext *ctx)</di=
v>
<div>&nbsp;}</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>-static void gen_conditional_store(DisasContext *ctx, TCGMemOp memop)<=
/div>
<div>&#43;static void gen_conditional_store(DisasContext *ctx, MemOp memop)=
</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *l1 =3D gen_new_label();</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *l2 =3D gen_new_label();</div>
<div>diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/in=
sn_trans/trans_rva.inc.c</div>
<div>index fadd888..be8a9f0 100644</div>
<div>--- a/target/riscv/insn_trans/trans_rva.inc.c</div>
<div>&#43;&#43;&#43; b/target/riscv/insn_trans/trans_rva.inc.c</div>
<div>@@ -18,7 &#43;18,7 @@</div>
<div>&nbsp; * this program. &nbsp;If not, see &lt;http://www.gnu.org/licens=
es/&gt;.</div>
<div>&nbsp; */</div>
<div>&nbsp;</div>
<div>-static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, TCGMemOp =
mop)</div>
<div>&#43;static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp=
 mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv src1 =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;/* Put addr in load_res, data in load_val. &nbsp;*=
/</div>
<div>@@ -37,7 &#43;37,7 @@ static inline bool gen_lr(DisasContext *ctx, arg=
_atomic *a, TCGMemOp mop)</div>
<div>&nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, TCGMemOp =
mop)</div>
<div>&#43;static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp=
 mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv src1 =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;TCGv src2 =3D tcg_temp_new();</div>
<div>@@ -82,8 &#43;82,8 @@ static inline bool gen_sc(DisasContext *ctx, arg=
_atomic *a, TCGMemOp mop)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static bool gen_amo(DisasContext *ctx, arg_atomic *a,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;void(*func)(TCGv, TCGv, TCGv, TCGArg, TCGMemOp),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv src1 =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;TCGv src2 =3D tcg_temp_new();</div>
<div>diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/in=
sn_trans/trans_rvi.inc.c</div>
<div>index ea64731..cf440d1 100644</div>
<div>--- a/target/riscv/insn_trans/trans_rvi.inc.c</div>
<div>&#43;&#43;&#43; b/target/riscv/insn_trans/trans_rvi.inc.c</div>
<div>@@ -135,7 &#43;135,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_=
bgeu *a)</div>
<div>&nbsp; &nbsp; &nbsp;return gen_branch(ctx, a, TCG_COND_GEU);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static bool gen_load(DisasContext *ctx, arg_lb *a, TCGMemOp memop)</d=
iv>
<div>&#43;static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)</=
div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0 =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t1 =3D tcg_temp_new();</div>
<div>@@ -174,7 &#43;174,7 @@ static bool trans_lhu(DisasContext *ctx, arg_l=
hu *a)</div>
<div>&nbsp; &nbsp; &nbsp;return gen_load(ctx, a, MO_TEUW);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static bool gen_store(DisasContext *ctx, arg_sb *a, TCGMemOp memop)</=
div>
<div>&#43;static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)<=
/div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0 =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;TCGv dat =3D tcg_temp_new();</div>
<div>diff --git a/target/s390x/translate.c b/target/s390x/translate.c</div>
<div>index ac0d8b6..2927247 100644</div>
<div>--- a/target/s390x/translate.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate.c</div>
<div>@@ -152,7 &#43;152,7 @@ static inline int vec_full_reg_offset(uint8_t =
reg)</div>
<div>&nbsp; &nbsp; &nbsp;return offsetof(CPUS390XState, vregs[reg][0]);</di=
v>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline int vec_reg_offset(uint8_t reg, uint8_t enr, TCGMemOp e=
s)</div>
<div>&#43;static inline int vec_reg_offset(uint8_t reg, uint8_t enr, MemOp =
es)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;/* Convert element size (es) - e.g. MO_8 - to byte=
s */</div>
<div>&nbsp; &nbsp; &nbsp;const uint8_t bytes =3D 1 &lt;&lt; es;</div>
<div>@@ -2262,7 &#43;2262,7 @@ static DisasJumpType op_csst(DisasContext *s=
, DisasOps *o)</div>
<div>&nbsp;#ifndef CONFIG_USER_ONLY</div>
<div>&nbsp;static DisasJumpType op_csp(DisasContext *s, DisasOps *o)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp mop =3D s-&gt;insn-&gt;data;</div>
<div>&#43; &nbsp; &nbsp;MemOp mop =3D s-&gt;insn-&gt;data;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 addr, old, cc;</div>
<div>&nbsp; &nbsp; &nbsp;TCGLabel *lab =3D gen_new_label();</div>
<div>&nbsp;</div>
<div>@@ -3228,7 &#43;3228,7 @@ static DisasJumpType op_lm64(DisasContext *s=
, DisasOps *o)</div>
<div>&nbsp;static DisasJumpType op_lpd(DisasContext *s, DisasOps *o)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 a1, a2;</div>
<div>- &nbsp; &nbsp;TCGMemOp mop =3D s-&gt;insn-&gt;data;</div>
<div>&#43; &nbsp; &nbsp;MemOp mop =3D s-&gt;insn-&gt;data;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* In a parallel context, stop the world and singl=
e step. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;if (tb_cflags(s-&gt;base.tb) &amp; CF_PARALLEL) {<=
/div>
<div>diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_=
vx.inc.c</div>
<div>index 41d5cf8..4c56bbb 100644</div>
<div>--- a/target/s390x/translate_vx.inc.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate_vx.inc.c</div>
<div>@@ -57,13 &#43;57,13 @@</div>
<div>&nbsp;#define FPF_LONG &nbsp; &nbsp; &nbsp; &nbsp;3</div>
<div>&nbsp;#define FPF_EXT &nbsp; &nbsp; &nbsp; &nbsp; 4</div>
<div>&nbsp;</div>
<div>-static inline bool valid_vec_element(uint8_t enr, TCGMemOp es)</div>
<div>&#43;static inline bool valid_vec_element(uint8_t enr, MemOp es)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return !(enr &amp; ~(NUM_VEC_ELEMENTS(es) - 1));</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void read_vec_element_i64(TCGv_i64 dst, uint8_t reg, uint=
8_t enr,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;const int offs =3D vec_reg_offset(reg, enr, memop =
&amp; MO_SIZE);</div>
<div>&nbsp;</div>
<div>@@ -96,7 &#43;96,7 @@ static void read_vec_element_i64(TCGv_i64 dst, u=
int8_t reg, uint8_t enr,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void read_vec_element_i32(TCGv_i32 dst, uint8_t reg, uint=
8_t enr,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;const int offs =3D vec_reg_offset(reg, enr, memop =
&amp; MO_SIZE);</div>
<div>&nbsp;</div>
<div>@@ -123,7 &#43;123,7 @@ static void read_vec_element_i32(TCGv_i32 dst,=
 uint8_t reg, uint8_t enr,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void write_vec_element_i64(TCGv_i64 src, int reg, uint8_t=
 enr,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;const int offs =3D vec_reg_offset(reg, enr, memop =
&amp; MO_SIZE);</div>
<div>&nbsp;</div>
<div>@@ -146,7 &#43;146,7 @@ static void write_vec_element_i64(TCGv_i64 src=
, int reg, uint8_t enr,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void write_vec_element_i32(TCGv_i32 src, int reg, uint8_t=
 enr,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;const int offs =3D vec_reg_offset(reg, enr, memop =
&amp; MO_SIZE);</div>
<div>&nbsp;</div>
<div>diff --git a/target/sparc/translate.c b/target/sparc/translate.c</div>
<div>index 091bab5..bef9ce6 100644</div>
<div>--- a/target/sparc/translate.c</div>
<div>&#43;&#43;&#43; b/target/sparc/translate.c</div>
<div>@@ -2019,7 &#43;2019,7 @@ static inline void gen_ne_fop_QD(DisasContex=
t *dc, int rd, int rs,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_swap(DisasContext *dc, TCGv dst, TCGv src,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; TCGv addr, int mmu_idx, TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; TCGv addr, int mmu_idx, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_address_mask(dc, addr);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_atomic_xchg_tl(dst, addr, src, mmu_idx, me=
mop);</div>
<div>@@ -2050,10 &#43;2050,10 @@ typedef struct {</div>
<div>&nbsp; &nbsp; &nbsp;ASIType type;</div>
<div>&nbsp; &nbsp; &nbsp;int asi;</div>
<div>&nbsp; &nbsp; &nbsp;int mem_idx;</div>
<div>- &nbsp; &nbsp;TCGMemOp memop;</div>
<div>&#43; &nbsp; &nbsp;MemOp memop;</div>
<div>&nbsp;} DisasASI;</div>
<div>&nbsp;</div>
<div>-static DisasASI get_asi(DisasContext *dc, int insn, TCGMemOp memop)</=
div>
<div>&#43;static DisasASI get_asi(DisasContext *dc, int insn, MemOp memop)<=
/div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int asi =3D GET_FIELD(insn, 19, 26);</div>
<div>&nbsp; &nbsp; &nbsp;ASIType type =3D GET_ASI_HELPER;</div>
<div>@@ -2267,7 &#43;2267,7 @@ static DisasASI get_asi(DisasContext *dc, in=
t insn, TCGMemOp memop)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_ld_asi(DisasContext *dc, TCGv dst, TCGv addr,</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; int insn, TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; int insn, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;DisasASI da =3D get_asi(dc, insn, memop);</div>
<div>&nbsp;</div>
<div>@@ -2305,7 &#43;2305,7 @@ static void gen_ld_asi(DisasContext *dc, TCG=
v dst, TCGv addr,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; int insn, TCGMemOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; int insn, MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;DisasASI da =3D get_asi(dc, insn, memop);</div>
<div>&nbsp;</div>
<div>@@ -2511,7 &#43;2511,7 @@ static void gen_ldf_asi(DisasContext *dc, TC=
Gv addr,</div>
<div>&nbsp; &nbsp; &nbsp;case GET_ASI_BLOCK:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Valid for lddfa on aligned regist=
ers only. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D 8 &amp;&amp; (rd &am=
p; 7) =3D=3D 0) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv eight;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>@@ -2625,7 &#43;2625,7 @@ static void gen_stf_asi(DisasContext *dc, TC=
Gv addr,</div>
<div>&nbsp; &nbsp; &nbsp;case GET_ASI_BLOCK:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Valid for stdfa on aligned regist=
ers only. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D 8 &amp;&amp; (rd &am=
p; 7) =3D=3D 0) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp memop;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv eight;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c</di=
v>
<div>index c46a4ab..68dd4aa 100644</div>
<div>--- a/target/tilegx/translate.c</div>
<div>&#43;&#43;&#43; b/target/tilegx/translate.c</div>
<div>@@ -290,7 &#43;290,7 @@ static void gen_cmul2(TCGv tdest, TCGv tsrca, =
TCGv tsrcb, int sh, int rd)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static TileExcp gen_st_opcode(DisasContext *dc, unsigned dest, u=
nsigned srca,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned srcb, TCGMemOp memop, const ch=
ar *name)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned srcb, MemOp memop, const c=
har *name)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (dest) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return TILEGX_EXCP_OPCODE_UNKNOWN;</=
div>
<div>@@ -305,7 &#43;305,7 @@ static TileExcp gen_st_opcode(DisasContext *dc=
, unsigned dest, unsigned srca,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static TileExcp gen_st_add_opcode(DisasContext *dc, unsigned src=
a, unsigned srcb,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int imm, TCGMemOp memop, =
const char *name)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int imm, MemOp memop,=
 const char *name)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv tsrca =3D load_gr(dc, srca);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv tsrcb =3D load_gr(dc, srcb);</div>
<div>@@ -496,7 &#43;496,7 @@ static TileExcp gen_rr_opcode(DisasContext *dc=
, unsigned opext,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv tdest, tsrca;</div>
<div>&nbsp; &nbsp; &nbsp;const char *mnemonic;</div>
<div>- &nbsp; &nbsp;TCGMemOp memop;</div>
<div>&#43; &nbsp; &nbsp;MemOp memop;</div>
<div>&nbsp; &nbsp; &nbsp;TileExcp ret =3D TILEGX_EXCP_NONE;</div>
<div>&nbsp; &nbsp; &nbsp;bool prefetch_nofault =3D false;</div>
<div>&nbsp;</div>
<div>@@ -1478,7 &#43;1478,7 @@ static TileExcp gen_rri_opcode(DisasContext =
*dc, unsigned opext,</div>
<div>&nbsp; &nbsp; &nbsp;TCGv tsrca =3D load_gr(dc, srca);</div>
<div>&nbsp; &nbsp; &nbsp;bool prefetch_nofault =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;const char *mnemonic;</div>
<div>- &nbsp; &nbsp;TCGMemOp memop;</div>
<div>&#43; &nbsp; &nbsp;MemOp memop;</div>
<div>&nbsp; &nbsp; &nbsp;int i2, i3;</div>
<div>&nbsp; &nbsp; &nbsp;TCGv t0;</div>
<div>&nbsp;</div>
<div>@@ -2106,7 &#43;2106,7 @@ static TileExcp decode_y2(DisasContext *dc, =
tilegx_bundle_bits bundle)</div>
<div>&nbsp; &nbsp; &nbsp;unsigned srca =3D get_SrcA_Y2(bundle);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned srcbdest =3D get_SrcBDest_Y2(bundle);</di=
v>
<div>&nbsp; &nbsp; &nbsp;const char *mnemonic;</div>
<div>- &nbsp; &nbsp;TCGMemOp memop;</div>
<div>&#43; &nbsp; &nbsp;MemOp memop;</div>
<div>&nbsp; &nbsp; &nbsp;bool prefetch_nofault =3D false;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (OEY2(opc, mode)) {</div>
<div>diff --git a/target/tricore/translate.c b/target/tricore/translate.c</=
div>
<div>index dc2a65f..87a5f50 100644</div>
<div>--- a/target/tricore/translate.c</div>
<div>&#43;&#43;&#43; b/target/tricore/translate.c</div>
<div>@@ -227,7 &#43;227,7 @@ static inline void generate_trap(DisasContext =
*ctx, int class, int tin);</div>
<div>&nbsp;/* Functions for load/save to/from memory */</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void gen_offset_ld(DisasContext *ctx, TCGv r1, TCG=
v r2,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int16_t con, TCGMemOp mop)</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int16_t con, MemOp mop)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv temp =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_tl(temp, r2, con);</div>
<div>@@ -236,7 &#43;236,7 @@ static inline void gen_offset_ld(DisasContext =
*ctx, TCGv r1, TCGv r2,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void gen_offset_st(DisasContext *ctx, TCGv r1, TCG=
v r2,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int16_t con, TCGMemOp mop)</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int16_t con, MemOp mop)</di=
v>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv temp =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_tl(temp, r2, con);</div>
<div>@@ -284,7 &#43;284,7 @@ static void gen_offset_ld_2regs(TCGv rh, TCGv =
rl, TCGv base, int16_t con,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_st_preincr(DisasContext *ctx, TCGv r1, TCGv r2, =
int16_t off,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv temp =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_tl(temp, r2, off);</div>
<div>@@ -294,7 &#43;294,7 @@ static void gen_st_preincr(DisasContext *ctx, =
TCGv r1, TCGv r2, int16_t off,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_ld_preincr(DisasContext *ctx, TCGv r1, TCGv r2, =
int16_t off,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; TCGMemOp mop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; MemOp mop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv temp =3D tcg_temp_new();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_tl(temp, r2, off);</div>
<div>diff --git a/tcg/README b/tcg/README</div>
<div>index 21fcdf7..b4382fa 100644</div>
<div>--- a/tcg/README</div>
<div>&#43;&#43;&#43; b/tcg/README</div>
<div>@@ -512,7 &#43;512,7 @@ Both t0 and t1 may be split into little-endian=
 ordered pairs of registers</div>
<div>&nbsp;if dealing with 64-bit quantities on a 32-bit host.</div>
<div>&nbsp;</div>
<div>&nbsp;The memidx selects the qemu tlb index to use (e.g. user or kerne=
l access).</div>
<div>-The flags are the TCGMemOp bits, selecting the sign, width, and endia=
nness</div>
<div>&#43;The flags are the MemOp bits, selecting the sign, width, and endi=
anness</div>
<div>&nbsp;of the memory access.</div>
<div>&nbsp;</div>
<div>&nbsp;For a 32-bit host, qemu_ld/st_i64 is guaranteed to only be used =
with a</div>
<div>diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc=
.c</div>
<div>index 0713448..3f92101 100644</div>
<div>--- a/tcg/aarch64/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/aarch64/tcg-target.inc.c</div>
<div>@@ -1423,7 &#43;1423,7 @@ static inline void tcg_out_rev16(TCGContext =
*s, TCGReg rd, TCGReg rn)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_insn(s, 3507, REV16, TCG_TYPE_I32, rd, rn)=
;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void tcg_out_sxt(TCGContext *s, TCGType ext, TCGMemOp s=
_bits,</div>
<div>&#43;static inline void tcg_out_sxt(TCGContext *s, TCGType ext, MemOp =
s_bits,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg rd, TCGReg rn)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;/* Using ALIASes SXTB, SXTH, SXTW, of SBFM Xd, Xn,=
 #0, #7|15|31 */</div>
<div>@@ -1431,7 &#43;1431,7 @@ static inline void tcg_out_sxt(TCGContext *s=
, TCGType ext, TCGMemOp s_bits,</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_sbfm(s, ext, rd, rn, 0, bits);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void tcg_out_uxt(TCGContext *s, TCGMemOp s_bits,</div>
<div>&#43;static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg rd, TCGReg rn)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;/* Using ALIASes UXTB, UXTH of UBFM Wd, Wn, #0, #7=
|15 */</div>
<div>@@ -1580,8 &#43;1580,8 @@ static inline void tcg_out_adr(TCGContext *s=
, TCGReg rd, void *target)</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>- &nbsp; &nbsp;TCGMemOp size =3D opc &amp; MO_SIZE;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp size =3D opc &amp; MO_SIZE;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc19(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>@@ -1605,8 &#43;1605,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>- &nbsp; &nbsp;TCGMemOp size =3D opc &amp; MO_SIZE;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp size =3D opc &amp; MO_SIZE;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc19(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>@@ -1649,7 &#43;1649,7 @@ QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, t=
able) !=3D 8);</div>
<div>&nbsp; &nbsp; slow path for the failure case, which will be patched la=
ter when finalizing</div>
<div>&nbsp; &nbsp; the slow path. Generated code returns the host addend in=
 X1,</div>
<div>&nbsp; &nbsp; clobbers X0,X2,X3,TMP. */</div>
<div>-static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, TCGMemOp=
 opc,</div>
<div>&#43;static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemO=
p opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_insn_unit **label_ptr, int mem_index=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool is_read)</div>
<div>&nbsp;{</div>
<div>@@ -1709,11 &#43;1709,11 @@ static void tcg_out_tlb_read(TCGContext *s=
, TCGReg addr_reg, TCGMemOp opc,</div>
<div>&nbsp;</div>
<div>&nbsp;#endif /* CONFIG_SOFTMMU */</div>
<div>&nbsp;</div>
<div>-static void tcg_out_qemu_ld_direct(TCGContext *s, TCGMemOp memop, TCG=
Type ext,</div>
<div>&#43;static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TC=
GType ext,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg data_r, TCGR=
eg addr_r,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGType otype, TCGR=
eg off_r)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;const TCGMemOp bswap =3D memop &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;const MemOp bswap =3D memop &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop &amp; MO_SSIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>@@ -1765,11 &#43;1765,11 @@ static void tcg_out_qemu_ld_direct(TCGCont=
ext *s, TCGMemOp memop, TCGType ext,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void tcg_out_qemu_st_direct(TCGContext *s, TCGMemOp memop,</di=
v>
<div>&#43;static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg data_r, TCGR=
eg addr_r,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGType otype, TCGR=
eg off_r)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;const TCGMemOp bswap =3D memop &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;const MemOp bswap =3D memop &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop &amp; MO_SIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -1804,7 &#43;1804,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGMemOp memop,</div>
<div>&nbsp;static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, TCGType ext)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64=
 ? TCG_TYPE_I64 : TCG_TYPE_I32;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>@@ -1829,7 &#43;1829,7 @@ static void tcg_out_qemu_ld(TCGContext *s, T=
CGReg data_reg, TCGReg addr_reg,</div>
<div>&nbsp;static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64=
 ? TCG_TYPE_I64 : TCG_TYPE_I32;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c</div>
<div>index ece88dc..94d80d7 100644</div>
<div>--- a/tcg/arm/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/arm/tcg-target.inc.c</div>
<div>@@ -1233,7 &#43;1233,7 @@ QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, t=
able) !=3D 4);</div>
<div>&nbsp; &nbsp; containing the addend of the tlb entry. &nbsp;Clobbers R=
0, R1, R2, TMP. &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp;static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCG=
Reg addrhi,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOp opc, int mem_index, bool is_l=
oad)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MemOp opc, int mem_index, bool is_=
load)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int cmp_off =3D (is_load ? offsetof(CPUTLBEntry, a=
ddr_read)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
: offsetof(CPUTLBEntry, addr_write));</div>
<div>@@ -1348,7 &#43;1348,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg argreg, datalo, datahi;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;void *func;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc24(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1412,7 &#43;1412,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg argreg, datalo, datahi;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc24(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>@@ -1453,11 &#43;1453,11 @@ static bool tcg_out_qemu_st_slow_path(TCGC=
ontext *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;}</div>
<div>&nbsp;#endif /* SOFTMMU */</div>
<div>&nbsp;</div>
<div>-static inline void tcg_out_qemu_ld_index(TCGContext *s, TCGMemOp opc,=
</div>
<div>&#43;static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; TCGReg addrlo, TCGReg addend)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;MemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SSIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>@@ -1514,11 &#43;1514,11 @@ static inline void tcg_out_qemu_ld_index(T=
CGContext *s, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void tcg_out_qemu_ld_direct(TCGContext *s, TCGMemOp opc=
,</div>
<div>&#43;static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp op=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;TCGReg addrlo)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;MemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SSIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>@@ -1577,7 &#43;1577,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrlo, datalo, datahi, addrhi __attribute_=
_((unused));</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addend;</div>
<div>@@ -1614,11 &#43;1614,11 @@ static void tcg_out_qemu_ld(TCGContext *s,=
 const TCGArg *args, bool is64)</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, TCG=
MemOp opc,</div>
<div>&#43;static inline void tcg_out_qemu_st_index(TCGContext *s, int cond,=
 MemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; TCGReg addrlo, TCGReg addend)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;MemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -1659,11 &#43;1659,11 @@ static inline void tcg_out_qemu_st_index(T=
CGContext *s, int cond, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline void tcg_out_qemu_st_direct(TCGContext *s, TCGMemOp opc=
,</div>
<div>&#43;static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp op=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;TCGReg addrlo)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;MemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>@@ -1708,7 &#43;1708,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrlo, datalo, datahi, addrhi __attribute_=
_((unused));</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addend;</div>
<div>diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c</di=
v>
<div>index 6ddeebf..9d8ed97 100644</div>
<div>--- a/tcg/i386/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/i386/tcg-target.inc.c</div>
<div>@@ -1697,7 &#43;1697,7 @@ static void * const qemu_st_helpers[16] =3D =
{</div>
<div>&nbsp; &nbsp; First argument register is clobbered. &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo=
, TCGReg addrhi,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int mem_index, TCG=
MemOp opc,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int mem_index,=
 MemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_insn_unit=
 **label_ptr, int which)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;const TCGReg r0 =3D TCG_REG_L0;</div>
<div>@@ -1810,7 &#43;1810,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, bool is_ld, bool is_64,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_reg;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit **label_ptr =3D &amp;l-&gt;label_ptr=
[0];</div>
<div>&nbsp; &nbsp; &nbsp;int rexw =3D (l-&gt;type =3D=3D TCG_TYPE_I64 ? P_R=
EXW : 0);</div>
<div>@@ -1895,8 &#43;1895,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>- &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit **label_ptr =3D &amp;l-&gt;label_ptr=
[0];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg retaddr;</div>
<div>&nbsp;</div>
<div>@@ -1995,10 &#43;1995,10 @@ static inline int setup_guest_base_seg(voi=
d)</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo,=
 TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, int in=
dex, intptr_t ofs,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int seg, bool is64, TCGM=
emOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int seg, bool is64, =
MemOp memop)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;const TCGMemOp real_bswap =3D memop &amp; MO_BSWAP;</di=
v>
<div>- &nbsp; &nbsp;TCGMemOp bswap =3D real_bswap;</div>
<div>&#43; &nbsp; &nbsp;const MemOp real_bswap =3D memop &amp; MO_BSWAP;</d=
iv>
<div>&#43; &nbsp; &nbsp;MemOp bswap =3D real_bswap;</div>
<div>&nbsp; &nbsp; &nbsp;int rexw =3D is64 * P_REXW;</div>
<div>&nbsp; &nbsp; &nbsp;int movop =3D OPC_MOVL_GvEv;</div>
<div>&nbsp;</div>
<div>@@ -2103,7 &#43;2103,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg datalo, datahi, addrlo;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrhi __attribute__((unused));</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr[2];</div>
<div>@@ -2137,15 &#43;2137,15 @@ static void tcg_out_qemu_ld(TCGContext *s,=
 const TCGArg *args, bool is64)</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo,=
 TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, int in=
dex, intptr_t ofs,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int seg, TCGMemOp memop)=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int seg, MemOp memop=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;/* ??? Ideally we wouldn't need a scratch register=
. &nbsp;For user-only,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; we could perform the bswap twice to restor=
e the original value</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; instead of moving to the scratch. &nbsp;Bu=
t as it is, the L constraint</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; means that TCG_REG_L0 is definitely free h=
ere. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;const TCGReg scratch =3D TCG_REG_L0;</div>
<div>- &nbsp; &nbsp;const TCGMemOp real_bswap =3D memop &amp; MO_BSWAP;</di=
v>
<div>- &nbsp; &nbsp;TCGMemOp bswap =3D real_bswap;</div>
<div>&#43; &nbsp; &nbsp;const MemOp real_bswap =3D memop &amp; MO_BSWAP;</d=
iv>
<div>&#43; &nbsp; &nbsp;MemOp bswap =3D real_bswap;</div>
<div>&nbsp; &nbsp; &nbsp;int movop =3D OPC_MOVL_EvGv;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (have_movbe &amp;&amp; real_bswap) {</div>
<div>@@ -2221,7 &#43;2221,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg datalo, datahi, addrlo;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrhi __attribute__((unused));</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr[2];</div>
<div>diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c</di=
v>
<div>index 41bff32..5442167 100644</div>
<div>--- a/tcg/mips/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/mips/tcg-target.inc.c</div>
<div>@@ -1215,7 &#43;1215,7 @@ static void tcg_out_tlb_load(TCGContext *s, =
TCGReg base, TCGReg addrl,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg addrh, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_insn_unit *label_ptr[2], bool is_loa=
d)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(opc);</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index =3D get_mmuidx(oi);</div>
<div>@@ -1313,7 &#43;1313,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, int is_ld, TCGMemOpIdx oi,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg v0;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>@@ -1363,8 &#43;1363,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>- &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* resolve label address */</div>
<div>@@ -1413,7 &#43;1413,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCG=
Reg hi,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, TCGMemOp op=
c, bool is_64)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, MemOp o=
pc, bool is_64)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; (MO_SSIZE | MO_BSWAP)) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>@@ -1521,7 &#43;1521,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_regl, addr_regh __attribute__((unused)=
);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_regl, data_regh;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr[2];</div>
<div>&nbsp;#endif</div>
<div>@@ -1558,7 &#43;1558,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCG=
Reg hi,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, TCGMemOp op=
c)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, MemOp o=
pc)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;/* Don't clutter the code below with checks to avo=
id bswapping ZERO. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;if ((lo | hi) =3D=3D 0) {</div>
<div>@@ -1624,7 &#43;1624,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_regl, addr_regh __attribute__((unused)=
);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_regl, data_regh;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr[2];</div>
<div>&nbsp;#endif</div>
<div>diff --git a/tcg/optimize.c b/tcg/optimize.c</div>
<div>index d2424de..a89ffda 100644</div>
<div>--- a/tcg/optimize.c</div>
<div>&#43;&#43;&#43; b/tcg/optimize.c</div>
<div>@@ -1014,7 &#43;1014,7 @@ void tcg_optimize(TCGContext *s)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CASE_OP_32_64(qemu_ld):</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp=
Idx oi =3D op-&gt;args[nb_oargs &#43; nb_iargs];</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp mop =
=3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp mop=
 =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!(mo=
p &amp; MO_SIGN)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;mask =3D (2ULL &lt;&lt; ((8 &lt;&lt; (mop &amp; MO_SIZE)) - 1)) - 1;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c</div>
<div>index 852b894..815edac 100644</div>
<div>--- a/tcg/ppc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/ppc/tcg-target.inc.c</div>
<div>@@ -1506,7 &#43;1506,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) &lt;=
 -32768);</div>
<div>&nbsp; &nbsp; in CR7, loads the addend of the TLB into R3, and returns=
 the register</div>
<div>&nbsp; &nbsp; containing the guest address (zero-extended into R4). &n=
bsp;Clobbers R0 and R2. */</div>
<div>&nbsp;</div>
<div>-static TCGReg tcg_out_tlb_read(TCGContext *s, TCGMemOp opc,</div>
<div>&#43;static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg addrlo, TCGReg addrhi,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int mem_index, bool is_read)</div=
>
<div>&nbsp;{</div>
<div>@@ -1633,7 &#43;1633,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, bool is_ld, TCGMemOpIdx oi,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg hi, lo, arg =3D TCG_REG_R3;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc14(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1680,8 &#43;1680,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>- &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg hi, lo, arg =3D TCG_REG_R3;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc14(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1744,7 &#43;1744,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg datalo, datahi, addrlo, rbase;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrhi __attribute__((unused));</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc, s_bits;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc, s_bits;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr;</div>
<div>@@ -1819,7 &#43;1819,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg datalo, datahi, addrlo, rbase;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrhi __attribute__((unused));</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc, s_bits;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc, s_bits;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr;</div>
<div>diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c</=
div>
<div>index 3e76bf5..7018509 100644</div>
<div>--- a/tcg/riscv/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/riscv/tcg-target.inc.c</div>
<div>@@ -970,7 &#43;970,7 @@ static void tcg_out_tlb_load(TCGContext *s, TC=
GReg addrl,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg addrh, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_insn_unit **label_ptr, bool is_load)=
</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(opc);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_target_long compare_mask;</div>
<div>@@ -1044,7 &#43;1044,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, int is_ld, TCGMemOpIdx oi,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a0 =3D tcg_target_call_iarg_regs[0];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a1 =3D tcg_target_call_iarg_regs[1];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a2 =3D tcg_target_call_iarg_regs[2];</div>
<div>@@ -1077,8 &#43;1077,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>- &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a0 =3D tcg_target_call_iarg_regs[0];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a1 =3D tcg_target_call_iarg_regs[1];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a2 =3D tcg_target_call_iarg_regs[2];</div>
<div>@@ -1121,9 &#43;1121,9 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;#endif /* CONFIG_SOFTMMU */</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCG=
Reg hi,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, TCGMemOp op=
c, bool is_64)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, MemOp o=
pc, bool is_64)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;const TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;const MemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* We don't yet handle byteswapping, assert */</di=
v>
<div>&nbsp; &nbsp; &nbsp;g_assert(!bswap);</div>
<div>@@ -1172,7 &#43;1172,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_regl, addr_regh __attribute__((unused)=
);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_regl, data_regh;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr[1];</div>
<div>&nbsp;#endif</div>
<div>@@ -1208,9 &#43;1208,9 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCG=
Reg hi,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, TCGMemOp op=
c)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, MemOp o=
pc)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;const TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;const MemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* We don't yet handle byteswapping, assert */</di=
v>
<div>&nbsp; &nbsp; &nbsp;g_assert(!bswap);</div>
<div>@@ -1243,7 &#43;1243,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_regl, addr_regh __attribute__((unused)=
);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_regl, data_regh;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc;</div>
<div>&#43; &nbsp; &nbsp;MemOp opc;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr[1];</div>
<div>&nbsp;#endif</div>
<div>diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c</di=
v>
<div>index fe42939..8aaa4ce 100644</div>
<div>--- a/tcg/s390/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/s390/tcg-target.inc.c</div>
<div>@@ -1430,7 &#43;1430,7 @@ static void tcg_out_call(TCGContext *s, tcg_=
insn_unit *dest)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void tcg_out_qemu_ld_direct(TCGContext *s, TCGMemOp opc, TCGRe=
g data,</div>
<div>&#43;static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGR=
eg data,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, TCGReg=
 index, int disp)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; (MO_SSIZE | MO_BSWAP)) {</div>
<div>@@ -1489,7 &#43;1489,7 @@ static void tcg_out_qemu_ld_direct(TCGContex=
t *s, TCGMemOp opc, TCGReg data,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void tcg_out_qemu_st_direct(TCGContext *s, TCGMemOp opc, TCGRe=
g data,</div>
<div>&#43;static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGR=
eg data,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg base, TCGReg=
 index, int disp)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; (MO_SIZE | MO_BSWAP)) {</div>
<div>@@ -1544,7 &#43;1544,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) &lt;=
 -(1 &lt;&lt; 19));</div>
<div>&nbsp;</div>
<div>&nbsp;/* Load and compare a TLB entry, leaving the flags set. &nbsp;Lo=
ads the TLB</div>
<div>&nbsp; &nbsp; addend into R2. &nbsp;Returns a register with the santit=
ized guest address. &nbsp;*/</div>
<div>-static TCGReg tcg_out_tlb_read(TCGContext* s, TCGReg addr_reg, TCGMem=
Op opc,</div>
<div>&#43;static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, Me=
mOp opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int mem_index, bool is_ld)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;unsigned s_bits =3D opc &amp; MO_SIZE;</div>
<div>@@ -1614,7 &#43;1614,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_reg =3D lb-&gt;addrlo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_reg =3D lb-&gt;datalo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!patch_reloc(lb-&gt;label_ptr[0], R_390_PC16DB=
L,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (intptr_t)s-&gt;code_ptr, 2)) {</div>
<div>@@ -1639,7 &#43;1639,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_reg =3D lb-&gt;addrlo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_reg =3D lb-&gt;datalo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!patch_reloc(lb-&gt;label_ptr[0], R_390_PC16DB=
L,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (intptr_t)s-&gt;code_ptr, 2)) {</div>
<div>@@ -1694,7 &#43;1694,7 @@ static void tcg_prepare_user_ldst(TCGContext=
 *s, TCGReg *addr_reg,</div>
<div>&nbsp;static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr;</div>
<div>@@ -1721,7 &#43;1721,7 @@ static void tcg_out_qemu_ld(TCGContext* s, T=
CGReg data_reg, TCGReg addr_reg,</div>
<div>&nbsp;static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp opc =3D get_memop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr;</div>
<div>diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c</=
div>
<div>index 10b1cea..d7986cd 100644</div>
<div>--- a/tcg/sparc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/sparc/tcg-target.inc.c</div>
<div>@@ -1081,7 &#43;1081,7 @@ QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) &lt;=
 -(1 &lt;&lt; 12));</div>
<div>&nbsp; &nbsp; is in the returned register, maybe %o0. &nbsp;The TLB ad=
dend is in %o1. &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp;static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int m=
em_index,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGMemOp opc, int which)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MemOp opc, int which)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int fast_off =3D TLB_MASK_TABLE_OFS(mem_index);</d=
iv>
<div>&nbsp; &nbsp; &nbsp;int mask_off =3D fast_off &#43; offsetof(CPUTLBDes=
cFast, mask);</div>
<div>@@ -1164,7 &#43;1164,7 @@ static const int qemu_st_opc[16] =3D {</div>
<div>&nbsp;static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg a=
ddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, bool is_64)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D get_memop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned memi =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrz, param;</div>
<div>@@ -1246,7 &#43;1246,7 @@ static void tcg_out_qemu_ld(TCGContext *s, T=
CGReg data, TCGReg addr,</div>
<div>&nbsp;static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg a=
ddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;MemOp memop =3D get_memop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned memi =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrz, param;</div>
<div>diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c</div>
<div>index 587d092..e87c327 100644</div>
<div>--- a/tcg/tcg-op.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op.c</div>
<div>@@ -2714,7 &#43;2714,7 @@ void tcg_gen_lookup_and_goto_ptr(void)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline TCGMemOp tcg_canonicalize_memop(TCGMemOp op, bool is64,=
 bool st)</div>
<div>&#43;static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, b=
ool st)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;/* Trigger the asserts within as early as possible=
. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;(void)get_alignment_bits(op);</div>
<div>@@ -2743,7 &#43;2743,7 @@ static inline TCGMemOp tcg_canonicalize_memo=
p(TCGMemOp op, bool is64, bool st)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; TCGMemOp memop, TCGArg idx)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; MemOp memop, TCGArg idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D make_memop_idx(memop, idx);</di=
v>
<div>&nbsp;#if TARGET_LONG_BITS =3D=3D 32</div>
<div>@@ -2758,7 &#43;2758,7 @@ static void gen_ldst_i32(TCGOpcode opc, TCGv=
_i32 val, TCGv addr,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; TCGMemOp memop, TCGArg idx)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; MemOp memop, TCGArg idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D make_memop_idx(memop, idx);</di=
v>
<div>&nbsp;#if TARGET_LONG_BITS =3D=3D 32</div>
<div>@@ -2788,9 &#43;2788,9 @@ static void tcg_gen_req_mo(TCGBar type)</div=
>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemO=
p memop)</div>
<div>&#43;void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, Mem=
Op memop)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp orig_memop;</div>
<div>&#43; &nbsp; &nbsp;MemOp orig_memop;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);</div>
<div>&nbsp; &nbsp; &nbsp;memop =3D tcg_canonicalize_memop(memop, 0, 0);</di=
v>
<div>@@ -2825,7 &#43;2825,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemO=
p memop)</div>
<div>&#43;void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, Mem=
Op memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 swap =3D NULL;</div>
<div>&nbsp;</div>
<div>@@ -2858,9 &#43;2858,9 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemO=
p memop)</div>
<div>&#43;void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, Mem=
Op memop)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp orig_memop;</div>
<div>&#43; &nbsp; &nbsp;MemOp orig_memop;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (TCG_TARGET_REG_BITS =3D=3D 32 &amp;&amp; (memo=
p &amp; MO_SIZE) &lt; MO_64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_qemu_ld_i32(TCGV_LOW(val), a=
ddr, idx, memop);</div>
<div>@@ -2911,7 &#43;2911,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemO=
p memop)</div>
<div>&#43;void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, Mem=
Op memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 swap =3D NULL;</div>
<div>&nbsp;</div>
<div>@@ -2953,7 &#43;2953,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)=
</div>
<div>&#43;static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SSIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SB:</div>
<div>@@ -2974,7 &#43;2974,7 @@ static void tcg_gen_ext_i32(TCGv_i32 ret, TC=
Gv_i32 val, TCGMemOp opc)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)=
</div>
<div>&#43;static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, MemOp opc=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SSIZE) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SB:</div>
<div>@@ -3034,7 &#43;3034,7 @@ static void * const table_cmpxchg[16] =3D {<=
/div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i=
32 cmpv,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 newv, TCGArg idx, TCGMe=
mOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 newv, TCGArg idx, M=
emOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;memop =3D tcg_canonicalize_memop(memop, 0, 0);</di=
v>
<div>&nbsp;</div>
<div>@@ -3078,7 &#43;3078,7 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 ret=
v, TCGv addr, TCGv_i32 cmpv,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i=
64 cmpv,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 newv, TCGArg idx, TCGMe=
mOp memop)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 newv, TCGArg idx, M=
emOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;memop =3D tcg_canonicalize_memop(memop, 1, 0);</di=
v>
<div>&nbsp;</div>
<div>@@ -3142,7 &#43;3142,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 ret=
v, TCGv addr, TCGv_i64 cmpv,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i3=
2 val,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg idx, TCGMemOp memop, bool=
 new_val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg idx, MemOp memop, boo=
l new_val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;void (*gen)(TCGv_i32, TCGv_=
i32, TCGv_i32))</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 t1 =3D tcg_temp_new_i32();</div>
<div>@@ -3160,7 &#43;3160,7 @@ static void do_nonatomic_op_i32(TCGv_i32 ret=
, TCGv addr, TCGv_i32 val,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 v=
al,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; TCGArg idx, TCGMemOp memop, void * const tabl=
e[])</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGArg idx, MemOp memop, void * const tab=
le[])</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;gen_atomic_op_i32 gen;</div>
<div>&nbsp;</div>
<div>@@ -3185,7 &#43;3185,7 @@ static void do_atomic_op_i32(TCGv_i32 ret, T=
CGv addr, TCGv_i32 val,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i6=
4 val,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg idx, TCGMemOp memop, bool=
 new_val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg idx, MemOp memop, boo=
l new_val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;void (*gen)(TCGv_i64, TCGv_=
i64, TCGv_i64))</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 t1 =3D tcg_temp_new_i64();</div>
<div>@@ -3203,7 &#43;3203,7 @@ static void do_nonatomic_op_i64(TCGv_i64 ret=
, TCGv addr, TCGv_i64 val,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 v=
al,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; TCGArg idx, TCGMemOp memop, void * const tabl=
e[])</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGArg idx, MemOp memop, void * const tab=
le[])</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;memop =3D tcg_canonicalize_memop(memop, 1, 0);</di=
v>
<div>&nbsp;</div>
<div>@@ -3257,7 &#43;3257,7 @@ static void * const table_##NAME[16] =3D { &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_BE] =3D gen_helper_atomi=
c_##NAME##q_be) &nbsp; &nbsp; \</div>
<div>&nbsp;}; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp;void tcg_gen_atomic_##NAME##_i32 &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>- &nbsp; &nbsp;(TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, TCG=
MemOp memop) \</div>
<div>&#43; &nbsp; &nbsp;(TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx,=
 MemOp memop) &nbsp; &nbsp;\</div>
<div>&nbsp;{ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;if (tcg_ctx-&gt;tb_cflags &amp; CF_PARALLEL) { &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_atomic_op_i32(ret, addr, val, idx=
, memop, table_##NAME); &nbsp; &nbsp; \</div>
<div>@@ -3267,7 &#43;3267,7 @@ void tcg_gen_atomic_##NAME##_i32 &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp;} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp;} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp;void tcg_gen_atomic_##NAME##_i64 &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>- &nbsp; &nbsp;(TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, TCG=
MemOp memop) \</div>
<div>&#43; &nbsp; &nbsp;(TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx,=
 MemOp memop) &nbsp; &nbsp;\</div>
<div>&nbsp;{ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;if (tcg_ctx-&gt;tb_cflags &amp; CF_PARALLEL) { &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_atomic_op_i64(ret, addr, val, idx=
, memop, table_##NAME); &nbsp; &nbsp; \</div>
<div>diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h</div>
<div>index 2d4dd5c..e9cf172 100644</div>
<div>--- a/tcg/tcg-op.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op.h</div>
<div>@@ -851,10 &#43;851,10 @@ void tcg_gen_lookup_and_goto_ptr(void);</div=
>
<div>&nbsp;#define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>-void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);</div>
<div>-void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);</div>
<div>-void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);</div>
<div>-void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);</div>
<div>&#43;void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, MemOp);</div>
<div>&#43;void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, MemOp);</div>
<div>&#43;void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, MemOp);</div>
<div>&#43;void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, MemOp);</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int me=
m_index)</div>
<div>&nbsp;{</div>
<div>@@ -912,46 &#43;912,46 @@ static inline void tcg_gen_qemu_st64(TCGv_i6=
4 arg, TCGv addr, int mem_index)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i=
32,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg, TCGMemOp);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg, MemOp);</div>
<div>&nbsp;void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i=
64,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg, TCGMemOp);</div>
<div>-</div>
<div>-void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMem=
Op);</div>
<div>-void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMem=
Op);</div>
<div>-</div>
<div>-void tcg_gen_atomic_fetch_add_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_add_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_and_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_and_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_or_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TC=
GMemOp);</div>
<div>-void tcg_gen_atomic_fetch_or_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TC=
GMemOp);</div>
<div>-void tcg_gen_atomic_fetch_xor_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_xor_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_smin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_smin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_umin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_umin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_smax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_smax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_umax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_fetch_umax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-</div>
<div>-void tcg_gen_atomic_add_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_add_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_and_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_and_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_or_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TC=
GMemOp);</div>
<div>-void tcg_gen_atomic_or_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TC=
GMemOp);</div>
<div>-void tcg_gen_atomic_xor_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, T=
CGMemOp);</div>
<div>-void tcg_gen_atomic_smin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_smin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_umin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_umin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_smax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_smax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_umax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, =
TCGMemOp);</div>
<div>-void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, =
TCGMemOp);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGArg, MemOp);</div>
<div>&#43;</div>
<div>&#43;void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, Me=
mOp);</div>
<div>&#43;void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, Me=
mOp);</div>
<div>&#43;</div>
<div>&#43;void tcg_gen_atomic_fetch_add_i32(TCGv_i32, TCGv, TCGv_i32, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_add_i64(TCGv_i64, TCGv, TCGv_i64, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_and_i32(TCGv_i32, TCGv, TCGv_i32, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_and_i64(TCGv_i64, TCGv, TCGv_i64, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_or_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg=
, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_or_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg=
, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_xor_i32(TCGv_i32, TCGv, TCGv_i32, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_xor_i64(TCGv_i64, TCGv, TCGv_i64, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_smin_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_smin_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_umin_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_umin_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_smax_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_smax_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_umax_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_fetch_umax_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;</div>
<div>&#43;void tcg_gen_atomic_add_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_add_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_and_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_and_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_or_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg=
, MemOp);</div>
<div>&#43;void tcg_gen_atomic_or_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg=
, MemOp);</div>
<div>&#43;void tcg_gen_atomic_xor_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGAr=
g, MemOp);</div>
<div>&#43;void tcg_gen_atomic_smin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_smin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_umin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_umin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_smax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_smax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_umax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGA=
rg, MemOp);</div>
<div>&#43;void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGA=
rg, MemOp);</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);</div>
<div>&nbsp;void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);</di=
v>
<div>diff --git a/tcg/tcg.c b/tcg/tcg.c</div>
<div>index 8d23fb0..0dff196 100644</div>
<div>--- a/tcg/tcg.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg.c</div>
<div>@@ -2056,7 &#43;2056,7 @@ static void tcg_dump_ops(TCGContext *s, bool=
 have_prefs)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case INDEX_op_qemu_st_=
i64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;TCGMemOpIdx oi =3D op-&gt;args[k&#43;&#43;];</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;TCGMemOp op =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;MemOp op =3D get_memop(oi);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;unsigned ix =3D get_mmuidx(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (op &amp; ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index 529acb2..a37181c 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -26,6 &#43;26,7 @@</div>
<div>&nbsp;#define TCG_H</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;cpu.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/tb-context.h&quot;</div>
<div>&nbsp;#include &quot;qemu/bitops.h&quot;</div>
<div>&nbsp;#include &quot;qemu/queue.h&quot;</div>
<div>@@ -309,103 &#43;310,13 @@ typedef enum TCGType {</div>
<div>&nbsp;#endif</div>
<div>&nbsp;} TCGType;</div>
<div>&nbsp;</div>
<div>-/* Constants for qemu_ld and qemu_st for the Memory Operation field. =
&nbsp;*/</div>
<div>-typedef enum TCGMemOp {</div>
<div>- &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>- &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>- &nbsp; &nbsp;MO_32 &nbsp; &nbsp;=3D 2,</div>
<div>- &nbsp; &nbsp;MO_64 &nbsp; &nbsp;=3D 3,</div>
<div>- &nbsp; &nbsp;MO_SIZE &nbsp;=3D 3, &nbsp; /* Mask for the above. &nbs=
p;*/</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_SIGN &nbsp;=3D 4, &nbsp; /* Sign-extended, otherwise=
 zero-extended. &nbsp;*/</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_BSWAP =3D 8, &nbsp; /* Host reverse endian. &nbsp;*/=
</div>
<div>-#ifdef HOST_WORDS_BIGENDIAN</div>
<div>- &nbsp; &nbsp;MO_LE &nbsp; &nbsp;=3D MO_BSWAP,</div>
<div>- &nbsp; &nbsp;MO_BE &nbsp; &nbsp;=3D 0,</div>
<div>-#else</div>
<div>- &nbsp; &nbsp;MO_LE &nbsp; &nbsp;=3D 0,</div>
<div>- &nbsp; &nbsp;MO_BE &nbsp; &nbsp;=3D MO_BSWAP,</div>
<div>-#endif</div>
<div>-#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>- &nbsp; &nbsp;MO_TE &nbsp; &nbsp;=3D MO_BE,</div>
<div>-#else</div>
<div>- &nbsp; &nbsp;MO_TE &nbsp; &nbsp;=3D MO_LE,</div>
<div>-#endif</div>
<div>-</div>
<div>- &nbsp; &nbsp;/*</div>
<div>- &nbsp; &nbsp; * MO_UNALN accesses are never checked for alignment.</=
div>
<div>- &nbsp; &nbsp; * MO_ALIGN accesses will result in a call to the CPU's=
</div>
<div>- &nbsp; &nbsp; * do_unaligned_access hook if the guest address is not=
 aligned.</div>
<div>- &nbsp; &nbsp; * The default depends on whether the target CPU define=
s</div>
<div>- &nbsp; &nbsp; * TARGET_ALIGNED_ONLY.</div>
<div>- &nbsp; &nbsp; *</div>
<div>- &nbsp; &nbsp; * Some architectures (e.g. ARMv8) need the address whi=
ch is aligned</div>
<div>- &nbsp; &nbsp; * to a size more than the size of the memory access.</=
div>
<div>- &nbsp; &nbsp; * Some architectures (e.g. SPARCv9) need an address wh=
ich is aligned,</div>
<div>- &nbsp; &nbsp; * but less strictly than the natural alignment.</div>
<div>- &nbsp; &nbsp; *</div>
<div>- &nbsp; &nbsp; * MO_ALIGN supposes the alignment size is the size of =
a memory access.</div>
<div>- &nbsp; &nbsp; *</div>
<div>- &nbsp; &nbsp; * There are three options:</div>
<div>- &nbsp; &nbsp; * - unaligned access permitted (MO_UNALN).</div>
<div>- &nbsp; &nbsp; * - an alignment to the size of an access (MO_ALIGN);<=
/div>
<div>- &nbsp; &nbsp; * - an alignment to a specified size, which may be mor=
e or less than</div>
<div>- &nbsp; &nbsp; * &nbsp; the access size (MO_ALIGN_x where 'x' is a si=
ze in bytes);</div>
<div>- &nbsp; &nbsp; */</div>
<div>- &nbsp; &nbsp;MO_ASHIFT =3D 4,</div>
<div>- &nbsp; &nbsp;MO_AMASK =3D 7 &lt;&lt; MO_ASHIFT,</div>
<div>-#ifdef TARGET_ALIGNED_ONLY</div>
<div>- &nbsp; &nbsp;MO_ALIGN =3D 0,</div>
<div>- &nbsp; &nbsp;MO_UNALN =3D MO_AMASK,</div>
<div>-#else</div>
<div>- &nbsp; &nbsp;MO_ALIGN =3D MO_AMASK,</div>
<div>- &nbsp; &nbsp;MO_UNALN =3D 0,</div>
<div>-#endif</div>
<div>- &nbsp; &nbsp;MO_ALIGN_2 &nbsp;=3D 1 &lt;&lt; MO_ASHIFT,</div>
<div>- &nbsp; &nbsp;MO_ALIGN_4 &nbsp;=3D 2 &lt;&lt; MO_ASHIFT,</div>
<div>- &nbsp; &nbsp;MO_ALIGN_8 &nbsp;=3D 3 &lt;&lt; MO_ASHIFT,</div>
<div>- &nbsp; &nbsp;MO_ALIGN_16 =3D 4 &lt;&lt; MO_ASHIFT,</div>
<div>- &nbsp; &nbsp;MO_ALIGN_32 =3D 5 &lt;&lt; MO_ASHIFT,</div>
<div>- &nbsp; &nbsp;MO_ALIGN_64 =3D 6 &lt;&lt; MO_ASHIFT,</div>
<div>-</div>
<div>- &nbsp; &nbsp;/* Combinations of the above, for ease of use. &nbsp;*/=
</div>
<div>- &nbsp; &nbsp;MO_UB &nbsp; &nbsp;=3D MO_8,</div>
<div>- &nbsp; &nbsp;MO_UW &nbsp; &nbsp;=3D MO_16,</div>
<div>- &nbsp; &nbsp;MO_UL &nbsp; &nbsp;=3D MO_32,</div>
<div>- &nbsp; &nbsp;MO_SB &nbsp; &nbsp;=3D MO_SIGN | MO_8,</div>
<div>- &nbsp; &nbsp;MO_SW &nbsp; &nbsp;=3D MO_SIGN | MO_16,</div>
<div>- &nbsp; &nbsp;MO_SL &nbsp; &nbsp;=3D MO_SIGN | MO_32,</div>
<div>- &nbsp; &nbsp;MO_Q &nbsp; &nbsp; =3D MO_64,</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_LEUW &nbsp;=3D MO_LE | MO_UW,</div>
<div>- &nbsp; &nbsp;MO_LEUL &nbsp;=3D MO_LE | MO_UL,</div>
<div>- &nbsp; &nbsp;MO_LESW &nbsp;=3D MO_LE | MO_SW,</div>
<div>- &nbsp; &nbsp;MO_LESL &nbsp;=3D MO_LE | MO_SL,</div>
<div>- &nbsp; &nbsp;MO_LEQ &nbsp; =3D MO_LE | MO_Q,</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_BEUW &nbsp;=3D MO_BE | MO_UW,</div>
<div>- &nbsp; &nbsp;MO_BEUL &nbsp;=3D MO_BE | MO_UL,</div>
<div>- &nbsp; &nbsp;MO_BESW &nbsp;=3D MO_BE | MO_SW,</div>
<div>- &nbsp; &nbsp;MO_BESL &nbsp;=3D MO_BE | MO_SL,</div>
<div>- &nbsp; &nbsp;MO_BEQ &nbsp; =3D MO_BE | MO_Q,</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_TEUW &nbsp;=3D MO_TE | MO_UW,</div>
<div>- &nbsp; &nbsp;MO_TEUL &nbsp;=3D MO_TE | MO_UL,</div>
<div>- &nbsp; &nbsp;MO_TESW &nbsp;=3D MO_TE | MO_SW,</div>
<div>- &nbsp; &nbsp;MO_TESL &nbsp;=3D MO_TE | MO_SL,</div>
<div>- &nbsp; &nbsp;MO_TEQ &nbsp; =3D MO_TE | MO_Q,</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>-} TCGMemOp;</div>
<div>-</div>
<div>&nbsp;/**</div>
<div>&nbsp; * get_alignment_bits</div>
<div>- * @memop: TCGMemOp value</div>
<div>&#43; * @memop: MemOp value</div>
<div>&nbsp; *</div>
<div>&nbsp; * Extract the alignment size from the memop.</div>
<div>&nbsp; */</div>
<div>-static inline unsigned get_alignment_bits(TCGMemOp memop)</div>
<div>&#43;static inline unsigned get_alignment_bits(MemOp memop)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a =3D memop &amp; MO_AMASK;</div>
<div>&nbsp;</div>
<div>@@ -1186,7 &#43;1097,7 @@ static inline size_t tcg_current_code_size(T=
CGContext *s)</div>
<div>&nbsp; &nbsp; &nbsp;return tcg_ptr_byte_diff(s-&gt;code_ptr, s-&gt;cod=
e_buf);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-/* Combine the TCGMemOp and mmu_idx parameters into a single value. &=
nbsp;*/</div>
<div>&#43;/* Combine the MemOp and mmu_idx parameters into a single value. =
&nbsp;*/</div>
<div>&nbsp;typedef uint32_t TCGMemOpIdx;</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>@@ -1196,7 &#43;1107,7 @@ typedef uint32_t TCGMemOpIdx;</div>
<div>&nbsp; *</div>
<div>&nbsp; * Encode these values into a single parameter.</div>
<div>&nbsp; */</div>
<div>-static inline TCGMemOpIdx make_memop_idx(TCGMemOp op, unsigned idx)</=
div>
<div>&#43;static inline TCGMemOpIdx make_memop_idx(MemOp op, unsigned idx)<=
/div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;tcg_debug_assert(idx &lt;=3D 15);</div>
<div>&nbsp; &nbsp; &nbsp;return (op &lt;&lt; 4) | idx;</div>
<div>@@ -1208,7 &#43;1119,7 @@ static inline TCGMemOpIdx make_memop_idx(TCG=
MemOp op, unsigned idx)</div>
<div>&nbsp; *</div>
<div>&nbsp; * Extract the memory operation from the combined value.</div>
<div>&nbsp; */</div>
<div>-static inline TCGMemOp get_memop(TCGMemOpIdx oi)</div>
<div>&#43;static inline MemOp get_memop(TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return oi &gt;&gt; 4;</div>
<div>&nbsp;}</div>
<div>diff --git a/trace/mem-internal.h b/trace/mem-internal.h</div>
<div>index f6efaf6..3444fbc 100644</div>
<div>--- a/trace/mem-internal.h</div>
<div>&#43;&#43;&#43; b/trace/mem-internal.h</div>
<div>@@ -16,7 &#43;16,7 @@</div>
<div>&nbsp;#define TRACE_MEM_ST (1ULL &lt;&lt; 5) &nbsp; &nbsp;/* store (y/=
n) */</div>
<div>&nbsp;</div>
<div>&nbsp;static inline uint8_t trace_mem_build_info(</div>
<div>- &nbsp; &nbsp;int size_shift, bool sign_extend, TCGMemOp endianness, =
bool store)</div>
<div>&#43; &nbsp; &nbsp;int size_shift, bool sign_extend, MemOp endianness,=
 bool store)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t res;</div>
<div>&nbsp;</div>
<div>@@ -33,7 &#43;33,7 @@ static inline uint8_t trace_mem_build_info(</div=
>
<div>&nbsp; &nbsp; &nbsp;return res;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static inline uint8_t trace_mem_get_info(TCGMemOp op, bool store)</di=
v>
<div>&#43;static inline uint8_t trace_mem_get_info(MemOp op, bool store)</d=
iv>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return trace_mem_build_info(op &amp; MO_SIZE, !!(o=
p &amp; MO_SIGN),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op &amp; MO_BSWAP, store);<=
/div>
<div>diff --git a/trace/mem.h b/trace/mem.h</div>
<div>index 2b58196..8cf213d 100644</div>
<div>--- a/trace/mem.h</div>
<div>&#43;&#43;&#43; b/trace/mem.h</div>
<div>@@ -18,7 &#43;18,7 @@</div>
<div>&nbsp; *</div>
<div>&nbsp; * Return a value for the 'info' argument in guest memory access=
 traces.</div>
<div>&nbsp; */</div>
<div>-static uint8_t trace_mem_get_info(TCGMemOp op, bool store);</div>
<div>&#43;static uint8_t trace_mem_get_info(MemOp op, bool store);</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>&nbsp; * trace_mem_build_info:</div>
<div>@@ -26,7 &#43;26,7 @@ static uint8_t trace_mem_get_info(TCGMemOp op, b=
ool store);</div>
<div>&nbsp; * Return a value for the 'info' argument in guest memory access=
 traces.</div>
<div>&nbsp; */</div>
<div>&nbsp;static uint8_t trace_mem_build_info(int size_shift, bool sign_ex=
tend,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp endiannes=
s, bool store);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MemOp endianne=
ss, bool store);</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;trace/mem-internal.h&quot;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156516638187537725btcom_--


--===============0287920357058503730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0287920357058503730==--

