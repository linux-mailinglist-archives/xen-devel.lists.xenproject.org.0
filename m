Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B202C876315
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690225.1076058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHv-0007eA-Oq; Fri, 08 Mar 2024 11:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690225.1076058; Fri, 08 Mar 2024 11:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHv-0007cb-IF; Fri, 08 Mar 2024 11:21:19 +0000
Received: by outflank-mailman (input) for mailman id 690225;
 Fri, 08 Mar 2024 11:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHt-00067H-Fp
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f916982d-dd3d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 12:21:13 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 2DF404EE0750;
 Fri,  8 Mar 2024 12:21:13 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f916982d-dd3d-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 5/7] xen/arm: address some violations of MISRA C Rule 20.7
Date: Fri,  8 Mar 2024 12:21:02 +0100
Message-Id: <a4a195005742ef7833da354859784c4506692821.1709896401.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709896401.git.nicola.vetrini@bugseng.com>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Style in arm64/cpufeature.c has not been amended, because this file seems
to be kept in sync with its Linux counterpart.

Changes in v2:
- Added parentheses for consistency
---
 xen/arch/arm/arm64/cpufeature.c          | 14 ++++-----
 xen/arch/arm/cpuerrata.c                 |  8 +++---
 xen/arch/arm/include/asm/arm64/sysregs.h |  2 +-
 xen/arch/arm/include/asm/guest_atomics.h |  4 +--
 xen/arch/arm/include/asm/mm.h            |  2 +-
 xen/arch/arm/include/asm/smccc.h         | 36 ++++++++++++------------
 xen/arch/arm/include/asm/vgic-emul.h     |  8 +++---
 xen/arch/arm/vcpreg.c                    |  5 ++--
 8 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index 864413d9cc03..6fb8974ade7f 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -78,13 +78,13 @@
 
 #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
 	{						\
-		.sign = SIGNED,				\
-		.visible = VISIBLE,			\
-		.strict = STRICT,			\
-		.type = TYPE,				\
-		.shift = SHIFT,				\
-		.width = WIDTH,				\
-		.safe_val = SAFE_VAL,			\
+		.sign = (SIGNED),				\
+		.visible = (VISIBLE),			\
+		.strict = (STRICT),			\
+		.type = (TYPE),				\
+		.shift = (SHIFT),				\
+		.width = (WIDTH),				\
+		.safe_val = (SAFE_VAL),			\
 	}
 
 /* Define a feature with unsigned values */
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index a28fa6ac78cc..2b7101ea2524 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -461,13 +461,13 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
 
 #define MIDR_RANGE(model, min, max)     \
     .matches = is_affected_midr_range,  \
-    .midr_model = model,                \
-    .midr_range_min = min,              \
-    .midr_range_max = max
+    .midr_model = (model),              \
+    .midr_range_min = (min),            \
+    .midr_range_max = (max)
 
 #define MIDR_ALL_VERSIONS(model)        \
     .matches = is_affected_midr_range,  \
-    .midr_model = model,                \
+    .midr_model = (model),              \
     .midr_range_min = 0,                \
     .midr_range_max = (MIDR_VARIANT_MASK | MIDR_REVISION_MASK)
 
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 3fdeb9d8cdef..b593e4028b53 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -465,7 +465,7 @@
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
-    uint64_t _r = v;                                    \
+    uint64_t _r = (v);                                  \
     asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
 } while (0)
 #define READ_SYSREG64(name) ({                          \
diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
index a1745f8613f6..8893eb9a55d7 100644
--- a/xen/arch/arm/include/asm/guest_atomics.h
+++ b/xen/arch/arm/include/asm/guest_atomics.h
@@ -32,7 +32,7 @@ static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
     perfc_incr(atomics_guest_paused);                                       \
                                                                             \
     domain_pause_nosync(d);                                                 \
-    name(nr, p);                                                            \
+    (name)(nr, p);                                                          \
     domain_unpause(d);                                                      \
 }
 
@@ -52,7 +52,7 @@ static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
     perfc_incr(atomics_guest_paused);                                       \
                                                                             \
     domain_pause_nosync(d);                                                 \
-    oldbit = name(nr, p);                                                   \
+    oldbit = (name)(nr, p);                                                 \
     domain_unpause(d);                                                      \
                                                                             \
     return oldbit;                                                          \
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index cbcf3bf14767..48538b5337aa 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -250,7 +250,7 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
 #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
-#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
+#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 /* Page-align address and convert to frame number format */
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 1adcd37443c7..a289c48b7ffd 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -122,56 +122,56 @@ struct arm_smccc_res {
 #define __constraint_read_7 __constraint_read_6, "r" (r7)
 
 #define __declare_arg_0(a0, res)                            \
-    struct arm_smccc_res    *___res = res;                  \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)a0;   \
+    struct arm_smccc_res    *___res = (res);                \
+    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1);                  \
     register unsigned long  r2 ASM_REG(2);                  \
     register unsigned long  r3 ASM_REG(3)
 
 #define __declare_arg_1(a0, a1, res)                        \
-    typeof(a1) __a1 = a1;                                   \
-    struct arm_smccc_res    *___res = res;                  \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)a0;   \
+    typeof(a1) __a1 = (a1);                                 \
+    struct arm_smccc_res    *___res = (res);                \
+    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1) = __a1;           \
     register unsigned long  r2 ASM_REG(2);                  \
     register unsigned long  r3 ASM_REG(3)
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
-    typeof(a1) __a1 = a1;                                   \
-    typeof(a2) __a2 = a2;                                   \
-    struct arm_smccc_res    *___res = res;				    \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)a0;   \
+    typeof(a1) __a1 = (a1);                                 \
+    typeof(a2) __a2 = (a2);                                 \
+    struct arm_smccc_res    *___res = (res);                \
+    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1) = __a1;           \
     register unsigned long  r2 ASM_REG(2) = __a2;           \
     register unsigned long  r3 ASM_REG(3)
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
-    typeof(a1) __a1 = a1;                                   \
-    typeof(a2) __a2 = a2;                                   \
-    typeof(a3) __a3 = a3;                                   \
-    struct arm_smccc_res    *___res = res;                  \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)a0;   \
+    typeof(a1) __a1 = (a1);                                 \
+    typeof(a2) __a2 = (a2);                                 \
+    typeof(a3) __a3 = (a3);                                 \
+    struct arm_smccc_res    *___res = (res);                \
+    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
     register unsigned long  r1 ASM_REG(1) = __a1;           \
     register unsigned long  r2 ASM_REG(2) = __a2;           \
     register unsigned long  r3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
-    typeof(a4) __a4 = a4;                               \
+    typeof(a4) __a4 = (a4);                             \
     __declare_arg_3(a0, a1, a2, a3, res);               \
     register unsigned long r4 ASM_REG(4) = __a4
 
 #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
-    typeof(a5) __a5 = a5;                               \
+    typeof(a5) __a5 = (a5);                             \
     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
     register typeof(a5) r5 ASM_REG(5) = __a5
 
 #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
-    typeof(a6) __a6 = a6;                                   \
+    typeof(a6) __a6 = (a6);                                 \
     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
     register typeof(a6) r6 ASM_REG(6) = __a6
 
 #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
-    typeof(a7) __a7 = a7;                                       \
+    typeof(a7) __a7 = (a7);                                     \
     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
     register typeof(a7) r7 ASM_REG(7) = __a7
 
diff --git a/xen/arch/arm/include/asm/vgic-emul.h b/xen/arch/arm/include/asm/vgic-emul.h
index e52fbaa3ec04..fd0cfa2175fe 100644
--- a/xen/arch/arm/include/asm/vgic-emul.h
+++ b/xen/arch/arm/include/asm/vgic-emul.h
@@ -6,11 +6,11 @@
  * a range of registers
  */
 
-#define VREG32(reg) reg ... reg + 3
-#define VREG64(reg) reg ... reg + 7
+#define VREG32(reg) (reg) ... ((reg) + 3)
+#define VREG64(reg) (reg) ... ((reg) + 7)
 
-#define VRANGE32(start, end) start ... end + 3
-#define VRANGE64(start, end) start ... end + 7
+#define VRANGE32(start, end) (start) ... ((end) + 3)
+#define VRANGE64(start, end) (start) ... ((end) + 7)
 
 /*
  * 64 bits registers can be accessible using 32-bit and 64-bit unless
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index a2d050070473..019cf34f003a 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -39,7 +39,8 @@
  */
 
 #ifdef CONFIG_ARM_64
-#define WRITE_SYSREG_SZ(sz, val, sysreg) WRITE_SYSREG((uint##sz##_t)val, sysreg)
+#define WRITE_SYSREG_SZ(sz, val, sysreg) \
+    WRITE_SYSREG((uint##sz##_t)(val), sysreg)
 #else
 /*
  * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which imposes
@@ -64,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool read)    \
     bool cache_enabled = vcpu_has_cache_enabled(v);                         \
                                                                             \
     GUEST_BUG_ON(read);                                                     \
-    WRITE_SYSREG_SZ(sz, *r, reg);                                           \
+    WRITE_SYSREG_SZ(sz, *(r), reg);                                         \
                                                                             \
     p2m_toggle_cache(v, cache_enabled);                                     \
                                                                             \
-- 
2.34.1


