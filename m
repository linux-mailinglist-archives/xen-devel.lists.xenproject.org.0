Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53D6CF4CD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516354.800383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcm0-0007cg-B3; Wed, 29 Mar 2023 20:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516354.800383; Wed, 29 Mar 2023 20:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcm0-0007WG-6H; Wed, 29 Mar 2023 20:52:00 +0000
Received: by outflank-mailman (input) for mailman id 516354;
 Wed, 29 Mar 2023 20:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phcly-0007Dz-8d
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a00536-ce73-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 22:51:55 +0200 (CEST)
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
X-Inumbo-ID: 89a00536-ce73-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eSeAliY8stK5FpKU+Y8ZX7tSMz7VhD1iswPu1xQrQJA=;
  b=ctMnwzR3o056tr02fyy5vTdp6RcmkcYlYKqXJUoxIPSmYTBOh0r71BGR
   fanAHcUPG3S6a2UfTgs4yYejYjC0S777YDGkW02CqK07ZFHilTWcKW1ov
   kiCD10AyVWDLWmX1dSSveFRBMturMywwK3tH0YANBgEovqQhjnQAoU/wT
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102947420
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qOyLZqucfHQNWnEPHRrymQltA+fnVCxeMUV32f8akzHdYApBsoF/q
 tZmKW6GPayKNmL9eNF2Yd/go0MEscLXydZjTgs4qH1gFC8U+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASExiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMyFSXwyo2/CNw6/ibcx2mPwECO/EBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqcrjimXktCXDCZ4RSU3FK8lODgoSKlZIQMLaS30qU2snTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZRAUvOj/i90htRHSF/FGCrCNqfnTNgill
 lhmsxMCa6UvYd8jjvvkrAGX027w9vAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i4TI25CK+KPoQQCnSUSONh1Hs2DaJ39z6FraTRuftnZ
 cfznTiEVh729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSbPIZ9caQvmUwzMxP/cyOkj2
 4oFZpTiJtQ2eLGWXxQ7BqZIcwBXciRjXMivwyGVH8baSjdb9KgaI6e56dscl0ZNxMy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:ljlk3qtCu5TIRwrkBKfFlEva7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="102947420"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/9] x86: Rename struct cpuid_policy to struct cpu_policy
Date: Wed, 29 Mar 2023 21:51:31 +0100
Message-ID: <20230329205137.323253-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also merge lib/x86/cpuid.h entirely into lib/x86/cpu-policy.h

Use a temporary define to make struct cpuid_policy still work.

There's one forward declaration of struct cpuid_policy in
tools/tests/x86_emulator/x86-emulate.h that isn't covered by the define, and
it's easier to rename that now than to rearrange the includes.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c |   2 +-
 tools/tests/x86_emulator/Makefile         |   2 +-
 tools/tests/x86_emulator/x86-emulate.h    |   2 +-
 xen/arch/x86/include/asm/cpuid.h          |   1 -
 xen/arch/x86/x86_emulate/x86_emulate.h    |   2 +-
 xen/include/xen/lib/x86/cpu-policy.h      | 463 ++++++++++++++++++++-
 xen/include/xen/lib/x86/cpuid.h           | 475 ----------------------
 xen/lib/x86/cpuid.c                       |   2 +-
 8 files changed, 467 insertions(+), 482 deletions(-)
 delete mode 100644 xen/include/xen/lib/x86/cpuid.h

diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 7d0f274c6cdd..79e42e8bfd04 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -9,7 +9,7 @@
 #include <getopt.h>
 
 #include <xen-tools/common-macros.h>
-#include <xen/lib/x86/cpuid.h>
+#include <xen/lib/x86/cpu-policy.h>
 #include <xen/lib/x86/msr.h>
 #include <xen/domctl.h>
 
diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
index 7b07c31bbde4..2f7c58040004 100644
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -286,7 +286,7 @@ HOSTCFLAGS += $(CFLAGS_xeninclude) -I. $(HOSTCFLAGS-$(XEN_COMPILE_ARCH))
 x86.h := $(addprefix $(XEN_ROOT)/tools/include/xen/asm/,\
                      x86-vendors.h x86-defns.h msr-index.h) \
          $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
-                     cpuid.h cpuid-autogen.h)
+                     cpu-policy.h)
 x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
 
 x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o: %.o: %.c $(x86_emulate.h)
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 1af986f78d16..19544b0b3a8a 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -65,7 +65,7 @@
 #define is_canonical_address(x) (((int64_t)(x) >> 47) == ((int64_t)(x) >> 63))
 
 extern uint32_t mxcsr_mask;
-extern struct cpuid_policy cp;
+extern struct cpu_policy cp;
 
 #define MMAP_SZ 16384
 bool emul_test_init(void);
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index 49b3128f06f9..d418e8100dde 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -9,7 +9,6 @@
 #include <xen/percpu.h>
 
 #include <xen/lib/x86/cpu-policy.h>
-#include <xen/lib/x86/cpuid.h>
 
 #include <public/sysctl.h>
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index bb7af967ffee..75015104fbdb 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -23,7 +23,7 @@
 #ifndef __X86_EMULATE_H__
 #define __X86_EMULATE_H__
 
-#include <xen/lib/x86/cpuid.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 #define MAX_INST_LEN 15
 
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 3a5300d1078c..5e430d848021 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -2,9 +2,342 @@
 #ifndef XEN_LIB_X86_POLICIES_H
 #define XEN_LIB_X86_POLICIES_H
 
-#include <xen/lib/x86/cpuid.h>
+#include <xen/lib/x86/cpuid-autogen.h>
 #include <xen/lib/x86/msr.h>
 
+#define FEATURESET_1d     0 /* 0x00000001.edx      */
+#define FEATURESET_1c     1 /* 0x00000001.ecx      */
+#define FEATURESET_e1d    2 /* 0x80000001.edx      */
+#define FEATURESET_e1c    3 /* 0x80000001.ecx      */
+#define FEATURESET_Da1    4 /* 0x0000000d:1.eax    */
+#define FEATURESET_7b0    5 /* 0x00000007:0.ebx    */
+#define FEATURESET_7c0    6 /* 0x00000007:0.ecx    */
+#define FEATURESET_e7d    7 /* 0x80000007.edx      */
+#define FEATURESET_e8b    8 /* 0x80000008.ebx      */
+#define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
+#define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
+#define FEATURESET_e21a  11 /* 0x80000021.eax      */
+#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
+#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
+#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
+#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
+
+struct cpuid_leaf
+{
+    uint32_t a, b, c, d;
+};
+
+/*
+ * Versions of GCC before 5 unconditionally reserve %rBX as the PIC hard
+ * register, and are unable to cope with spilling it.  This results in a
+ * rather cryptic error:
+ *    error: inconsistent operand constraints in an ‘asm’
+ *
+ * In affected situations, work around the issue by using a separate register
+ * to hold the the %rBX output, and xchg twice to leave %rBX preserved around
+ * the asm() statement.
+ */
+#if defined(__PIC__) && __GNUC__ < 5 && !defined(__clang__) && defined(__i386__)
+# define XCHG_BX "xchg %%ebx, %[bx];"
+# define BX_CON [bx] "=&r"
+#elif defined(__PIC__) && __GNUC__ < 5 && !defined(__clang__) && \
+    defined(__x86_64__) && (defined(__code_model_medium__) || \
+                            defined(__code_model_large__))
+# define XCHG_BX "xchg %%rbx, %q[bx];"
+# define BX_CON [bx] "=&r"
+#else
+# define XCHG_BX ""
+# define BX_CON "=&b"
+#endif
+
+static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
+{
+    asm ( XCHG_BX
+          "cpuid;"
+          XCHG_BX
+          : "=a" (l->a), BX_CON (l->b), "=&c" (l->c), "=&d" (l->d)
+          : "a" (leaf) );
+}
+
+static inline void cpuid_count_leaf(
+    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *l)
+{
+    asm ( XCHG_BX
+          "cpuid;"
+          XCHG_BX
+          : "=a" (l->a), BX_CON (l->b), "=c" (l->c), "=&d" (l->d)
+          : "a" (leaf), "c" (subleaf) );
+}
+
+#undef BX_CON
+#undef XCHG
+
+/**
+ * Given the vendor id from CPUID leaf 0, look up Xen's internal integer
+ * vendor ID.  Returns X86_VENDOR_UNKNOWN for any unknown vendor.
+ */
+unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
+
+/**
+ * Given Xen's internal vendor ID, return a string suitable for printing.
+ * Returns "Unknown" for any unrecognised ID.
+ */
+const char *x86_cpuid_vendor_to_str(unsigned int vendor);
+
+#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
+#define CPUID_GUEST_NR_CACHE      (5u + 1)
+#define CPUID_GUEST_NR_FEAT       (2u + 1)
+#define CPUID_GUEST_NR_TOPO       (1u + 1)
+#define CPUID_GUEST_NR_XSTATE     (62u + 1)
+#define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
+#define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
+#define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
+                                      CPUID_GUEST_NR_EXTD_AMD)
+
+/*
+ * Maximum number of leaves a struct cpuid_policy turns into when serialised
+ * for interaction with the toolstack.  (Sum of all leaves in each union, less
+ * the entries in basic which sub-unions hang off of.)
+ */
+#define CPUID_MAX_SERIALISED_LEAVES                     \
+    (CPUID_GUEST_NR_BASIC +                             \
+     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
+     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
+     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
+     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
+     CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
+
+struct cpu_policy
+{
+#define DECL_BITFIELD(word) _DECL_BITFIELD(FEATURESET_ ## word)
+#define _DECL_BITFIELD(x)   __DECL_BITFIELD(x)
+#define __DECL_BITFIELD(x)  CPUID_BITFIELD_ ## x
+
+    /* Basic leaves: 0x000000xx */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_BASIC];
+        struct {
+            /* Leaf 0x0 - Max and vendor. */
+            uint32_t max_leaf, vendor_ebx, vendor_ecx, vendor_edx;
+
+            /* Leaf 0x1 - Family/model/stepping and features. */
+            uint32_t raw_fms;
+            uint8_t :8,       /* Brand ID. */
+                clflush_size, /* Number of 8-byte blocks per cache line. */
+                lppp,         /* Logical processors per package. */
+                apic_id;      /* Initial APIC ID. */
+            union {
+                uint32_t _1c;
+                struct { DECL_BITFIELD(1c); };
+            };
+            union {
+                uint32_t _1d;
+                struct { DECL_BITFIELD(1d); };
+            };
+
+            /* Leaf 0x2 - TLB/Cache/Prefetch. */
+            uint8_t l2_nr_queries; /* Documented as fixed to 1. */
+            uint8_t l2_desc[15];
+
+            uint64_t :64, :64; /* Leaf 0x3 - PSN. */
+            uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
+            uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
+            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+            uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
+            uint64_t :64, :64; /* Leaf 0x8 - rsvd */
+            uint64_t :64, :64; /* Leaf 0x9 - DCA */
+
+            /* Leaf 0xa - Intel PMU. */
+            uint8_t pmu_version, _pmu[15];
+
+            uint64_t :64, :64; /* Leaf 0xb - Topology. */
+            uint64_t :64, :64; /* Leaf 0xc - rsvd */
+            uint64_t :64, :64; /* Leaf 0xd - XSTATE. */
+        };
+    } basic;
+
+    /* Structured cache leaf: 0x00000004[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_CACHE];
+        struct cpuid_cache_leaf {
+            uint32_t /* a */ type:5, level:3;
+            bool self_init:1, fully_assoc:1;
+            uint32_t :4, threads_per_cache:12, cores_per_package:6;
+            uint32_t /* b */ line_size:12, partitions:10, ways:10;
+            uint32_t /* c */ sets;
+            bool /* d */ wbinvd:1, inclusive:1, complex:1;
+        } subleaf[CPUID_GUEST_NR_CACHE];
+    } cache;
+
+    /* Structured feature leaf: 0x00000007[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_FEAT];
+        struct {
+            /* Subleaf 0. */
+            uint32_t max_subleaf;
+            union {
+                uint32_t _7b0;
+                struct { DECL_BITFIELD(7b0); };
+            };
+            union {
+                uint32_t _7c0;
+                struct { DECL_BITFIELD(7c0); };
+            };
+            union {
+                uint32_t _7d0;
+                struct { DECL_BITFIELD(7d0); };
+            };
+
+            /* Subleaf 1. */
+            union {
+                uint32_t _7a1;
+                struct { DECL_BITFIELD(7a1); };
+            };
+            union {
+                uint32_t _7b1;
+                struct { DECL_BITFIELD(7b1); };
+            };
+            union {
+                uint32_t _7c1;
+                struct { DECL_BITFIELD(7c1); };
+            };
+            union {
+                uint32_t _7d1;
+                struct { DECL_BITFIELD(7d1); };
+            };
+
+            /* Subleaf 2. */
+            uint32_t /* a */:32, /* b */:32, /* c */:32;
+            union {
+                uint32_t _7d2;
+                struct { DECL_BITFIELD(7d2); };
+            };
+        };
+    } feat;
+
+    /* Extended topology enumeration: 0x0000000B[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_TOPO];
+        struct cpuid_topo_leaf {
+            uint32_t id_shift:5, :27;
+            uint16_t nr_logical, :16;
+            uint8_t level, type, :8, :8;
+            uint32_t x2apic_id;
+        } subleaf[CPUID_GUEST_NR_TOPO];
+    } topo;
+
+    /* Xstate feature leaf: 0x0000000D[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_XSTATE];
+
+        struct {
+            /* Subleaf 0. */
+            uint32_t xcr0_low, /* b */:32, max_size, xcr0_high;
+
+            /* Subleaf 1. */
+            union {
+                uint32_t Da1;
+                struct { DECL_BITFIELD(Da1); };
+            };
+            uint32_t /* b */:32, xss_low, xss_high;
+        };
+
+        /* Per-component common state.  Valid for i >= 2. */
+        struct {
+            uint32_t size, offset;
+            bool xss:1, align:1;
+            uint32_t _res_d;
+        } comp[CPUID_GUEST_NR_XSTATE];
+    } xstate;
+
+    /* Extended leaves: 0x800000xx */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
+        struct {
+            /* Leaf 0x80000000 - Max and vendor. */
+            uint32_t max_leaf, vendor_ebx, vendor_ecx, vendor_edx;
+
+            /* Leaf 0x80000001 - Family/model/stepping and features. */
+            uint32_t raw_fms, /* b */:32;
+            union {
+                uint32_t e1c;
+                struct { DECL_BITFIELD(e1c); };
+            };
+            union {
+                uint32_t e1d;
+                struct { DECL_BITFIELD(e1d); };
+            };
+
+            uint64_t :64, :64; /* Brand string. */
+            uint64_t :64, :64; /* Brand string. */
+            uint64_t :64, :64; /* Brand string. */
+            uint64_t :64, :64; /* L1 cache/TLB. */
+            uint64_t :64, :64; /* L2/3 cache/TLB. */
+
+            /* Leaf 0x80000007 - Advanced Power Management. */
+            uint32_t /* a */:32, /* b */:32, /* c */:32;
+            union {
+                uint32_t e7d;
+                struct { DECL_BITFIELD(e7d); };
+            };
+
+            /* Leaf 0x80000008 - Misc addr/feature info. */
+            uint8_t maxphysaddr, maxlinaddr, :8, :8;
+            union {
+                uint32_t e8b;
+                struct { DECL_BITFIELD(e8b); };
+            };
+            uint32_t nc:8, :4, apic_id_size:4, :16;
+            uint32_t /* d */:32;
+
+            uint64_t :64, :64; /* Leaf 0x80000009. */
+            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
+            uint64_t :64, :64; /* Leaf 0x8000000b. */
+            uint64_t :64, :64; /* Leaf 0x8000000c. */
+            uint64_t :64, :64; /* Leaf 0x8000000d. */
+            uint64_t :64, :64; /* Leaf 0x8000000e. */
+            uint64_t :64, :64; /* Leaf 0x8000000f. */
+            uint64_t :64, :64; /* Leaf 0x80000010. */
+            uint64_t :64, :64; /* Leaf 0x80000011. */
+            uint64_t :64, :64; /* Leaf 0x80000012. */
+            uint64_t :64, :64; /* Leaf 0x80000013. */
+            uint64_t :64, :64; /* Leaf 0x80000014. */
+            uint64_t :64, :64; /* Leaf 0x80000015. */
+            uint64_t :64, :64; /* Leaf 0x80000016. */
+            uint64_t :64, :64; /* Leaf 0x80000017. */
+            uint64_t :64, :64; /* Leaf 0x80000018. */
+            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
+            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
+            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
+            uint64_t :64, :64; /* Leaf 0x8000001c. */
+            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
+            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
+            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
+            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
+
+            /* Leaf 0x80000021 - Extended Feature 2 */
+            union {
+                uint32_t e21a;
+                struct { DECL_BITFIELD(e21a); };
+            };
+            uint32_t /* b */:32, /* c */:32, /* d */:32;
+        };
+    } extd;
+
+#undef __DECL_BITFIELD
+#undef _DECL_BITFIELD
+#undef DECL_BITFIELD
+
+    /* Toolstack selected Hypervisor max_leaf (if non-zero). */
+    uint8_t hv_limit, hv2_limit;
+
+    /* Value calculated from raw data above. */
+    uint8_t x86_vendor;
+};
+
+/* Temporary */
+#define cpuid_policy cpu_policy
+
 struct old_cpu_policy
 {
     struct cpuid_policy *cpuid;
@@ -19,6 +352,134 @@ struct cpu_policy_errors
 
 #define INIT_CPU_POLICY_ERRORS { -1, -1, -1 }
 
+/* Fill in a featureset bitmap from a CPUID policy. */
+static inline void cpuid_policy_to_featureset(
+    const struct cpuid_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
+{
+    fs[FEATURESET_1d]  = p->basic._1d;
+    fs[FEATURESET_1c]  = p->basic._1c;
+    fs[FEATURESET_e1d] = p->extd.e1d;
+    fs[FEATURESET_e1c] = p->extd.e1c;
+    fs[FEATURESET_Da1] = p->xstate.Da1;
+    fs[FEATURESET_7b0] = p->feat._7b0;
+    fs[FEATURESET_7c0] = p->feat._7c0;
+    fs[FEATURESET_e7d] = p->extd.e7d;
+    fs[FEATURESET_e8b] = p->extd.e8b;
+    fs[FEATURESET_7d0] = p->feat._7d0;
+    fs[FEATURESET_7a1] = p->feat._7a1;
+    fs[FEATURESET_e21a] = p->extd.e21a;
+    fs[FEATURESET_7b1] = p->feat._7b1;
+    fs[FEATURESET_7d2] = p->feat._7d2;
+    fs[FEATURESET_7c1] = p->feat._7c1;
+    fs[FEATURESET_7d1] = p->feat._7d1;
+}
+
+/* Fill in a CPUID policy from a featureset bitmap. */
+static inline void cpuid_featureset_to_policy(
+    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpuid_policy *p)
+{
+    p->basic._1d  = fs[FEATURESET_1d];
+    p->basic._1c  = fs[FEATURESET_1c];
+    p->extd.e1d   = fs[FEATURESET_e1d];
+    p->extd.e1c   = fs[FEATURESET_e1c];
+    p->xstate.Da1 = fs[FEATURESET_Da1];
+    p->feat._7b0  = fs[FEATURESET_7b0];
+    p->feat._7c0  = fs[FEATURESET_7c0];
+    p->extd.e7d   = fs[FEATURESET_e7d];
+    p->extd.e8b   = fs[FEATURESET_e8b];
+    p->feat._7d0  = fs[FEATURESET_7d0];
+    p->feat._7a1  = fs[FEATURESET_7a1];
+    p->extd.e21a  = fs[FEATURESET_e21a];
+    p->feat._7b1  = fs[FEATURESET_7b1];
+    p->feat._7d2  = fs[FEATURESET_7d2];
+    p->feat._7c1  = fs[FEATURESET_7c1];
+    p->feat._7d1  = fs[FEATURESET_7d1];
+}
+
+static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
+{
+    return ((uint64_t)p->xstate.xcr0_high << 32) | p->xstate.xcr0_low;
+}
+
+static inline uint64_t cpuid_policy_xstates(const struct cpuid_policy *p)
+{
+    uint64_t val = p->xstate.xcr0_high | p->xstate.xss_high;
+
+    return (val << 32) | p->xstate.xcr0_low | p->xstate.xss_low;
+}
+
+const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature);
+
+/**
+ * Recalculate the content in a CPUID policy which is derived from raw data.
+ */
+void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p);
+
+/**
+ * Fill a CPUID policy using the native CPUID instruction.
+ *
+ * No sanitisation is performed, but synthesised values are calculated.
+ * Values may be influenced by a hypervisor or from masking/faulting
+ * configuration.
+ */
+void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
+
+/**
+ * Clear leaf data beyond the policies max leaf/subleaf settings.
+ *
+ * Policy serialisation purposefully omits out-of-range leaves, because there
+ * are a large number of them due to vendor differences.  However, when
+ * constructing new policies (e.g. levelling down), it is possible to end up
+ * with out-of-range leaves with stale content in them.  This helper clears
+ * them.
+ */
+void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
+
+#ifdef __XEN__
+#include <public/arch-x86/xen.h>
+typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
+#else
+#include <xen/arch-x86/xen.h>
+typedef xen_cpuid_leaf_t cpuid_leaf_buffer_t[];
+#endif
+
+/**
+ * Serialise a cpuid_policy object into an array of cpuid leaves.
+ *
+ * @param policy     The cpuid_policy to serialise.
+ * @param leaves     The array of leaves to serialise into.
+ * @param nr_entries The number of entries in 'leaves'.
+ * @returns -errno
+ *
+ * Writes at most CPUID_MAX_SERIALISED_LEAVES.  May fail with -ENOBUFS if the
+ * leaves array is too short.  On success, nr_entries is updated with the
+ * actual number of leaves written.
+ */
+int x86_cpuid_copy_to_buffer(const struct cpuid_policy *policy,
+                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
+
+/**
+ * Unserialise a cpuid_policy object from an array of cpuid leaves.
+ *
+ * @param policy      The cpuid_policy to unserialise into.
+ * @param leaves      The array of leaves to unserialise from.
+ * @param nr_entries  The number of entries in 'leaves'.
+ * @param err_leaf    Optional hint for error diagnostics.
+ * @param err_subleaf Optional hint for error diagnostics.
+ * @returns -errno
+ *
+ * Reads at most CPUID_MAX_SERIALISED_LEAVES.  May return -ERANGE if an
+ * incoming leaf is out of range of cpuid_policy, in which case the optional
+ * err_* pointers will identify the out-of-range indicies.
+ *
+ * No content validation of in-range leaves is performed.  Synthesised data is
+ * recalculated.
+ */
+int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
+                               const cpuid_leaf_buffer_t leaves,
+                               uint32_t nr_entries, uint32_t *err_leaf,
+                               uint32_t *err_subleaf);
+
 /*
  * Calculate whether two policies are compatible.
  *
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
deleted file mode 100644
index fa98b371eef4..000000000000
--- a/xen/include/xen/lib/x86/cpuid.h
+++ /dev/null
@@ -1,475 +0,0 @@
-/* Common data structures and functions consumed by hypervisor and toolstack */
-#ifndef XEN_LIB_X86_CPUID_H
-#define XEN_LIB_X86_CPUID_H
-
-#include <xen/lib/x86/cpuid-autogen.h>
-
-#define FEATURESET_1d     0 /* 0x00000001.edx      */
-#define FEATURESET_1c     1 /* 0x00000001.ecx      */
-#define FEATURESET_e1d    2 /* 0x80000001.edx      */
-#define FEATURESET_e1c    3 /* 0x80000001.ecx      */
-#define FEATURESET_Da1    4 /* 0x0000000d:1.eax    */
-#define FEATURESET_7b0    5 /* 0x00000007:0.ebx    */
-#define FEATURESET_7c0    6 /* 0x00000007:0.ecx    */
-#define FEATURESET_e7d    7 /* 0x80000007.edx      */
-#define FEATURESET_e8b    8 /* 0x80000008.ebx      */
-#define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
-#define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
-#define FEATURESET_e21a  11 /* 0x80000021.eax      */
-#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
-#define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
-#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
-#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
-
-struct cpuid_leaf
-{
-    uint32_t a, b, c, d;
-};
-
-/*
- * Versions of GCC before 5 unconditionally reserve %rBX as the PIC hard
- * register, and are unable to cope with spilling it.  This results in a
- * rather cryptic error:
- *    error: inconsistent operand constraints in an ‘asm’
- *
- * In affected situations, work around the issue by using a separate register
- * to hold the the %rBX output, and xchg twice to leave %rBX preserved around
- * the asm() statement.
- */
-#if defined(__PIC__) && __GNUC__ < 5 && !defined(__clang__) && defined(__i386__)
-# define XCHG_BX "xchg %%ebx, %[bx];"
-# define BX_CON [bx] "=&r"
-#elif defined(__PIC__) && __GNUC__ < 5 && !defined(__clang__) && \
-    defined(__x86_64__) && (defined(__code_model_medium__) || \
-                            defined(__code_model_large__))
-# define XCHG_BX "xchg %%rbx, %q[bx];"
-# define BX_CON [bx] "=&r"
-#else
-# define XCHG_BX ""
-# define BX_CON "=&b"
-#endif
-
-static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
-{
-    asm ( XCHG_BX
-          "cpuid;"
-          XCHG_BX
-          : "=a" (l->a), BX_CON (l->b), "=&c" (l->c), "=&d" (l->d)
-          : "a" (leaf) );
-}
-
-static inline void cpuid_count_leaf(
-    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *l)
-{
-    asm ( XCHG_BX
-          "cpuid;"
-          XCHG_BX
-          : "=a" (l->a), BX_CON (l->b), "=c" (l->c), "=&d" (l->d)
-          : "a" (leaf), "c" (subleaf) );
-}
-
-#undef BX_CON
-#undef XCHG
-
-/**
- * Given the vendor id from CPUID leaf 0, look up Xen's internal integer
- * vendor ID.  Returns X86_VENDOR_UNKNOWN for any unknown vendor.
- */
-unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
-
-/**
- * Given Xen's internal vendor ID, return a string suitable for printing.
- * Returns "Unknown" for any unrecognised ID.
- */
-const char *x86_cpuid_vendor_to_str(unsigned int vendor);
-
-#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
-#define CPUID_GUEST_NR_CACHE      (5u + 1)
-#define CPUID_GUEST_NR_FEAT       (2u + 1)
-#define CPUID_GUEST_NR_TOPO       (1u + 1)
-#define CPUID_GUEST_NR_XSTATE     (62u + 1)
-#define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
-#define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
-#define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
-                                      CPUID_GUEST_NR_EXTD_AMD)
-
-/*
- * Maximum number of leaves a struct cpuid_policy turns into when serialised
- * for interaction with the toolstack.  (Sum of all leaves in each union, less
- * the entries in basic which sub-unions hang off of.)
- */
-#define CPUID_MAX_SERIALISED_LEAVES                     \
-    (CPUID_GUEST_NR_BASIC +                             \
-     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
-     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
-     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
-     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
-     CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
-
-struct cpuid_policy
-{
-#define DECL_BITFIELD(word) _DECL_BITFIELD(FEATURESET_ ## word)
-#define _DECL_BITFIELD(x)   __DECL_BITFIELD(x)
-#define __DECL_BITFIELD(x)  CPUID_BITFIELD_ ## x
-
-    /* Basic leaves: 0x000000xx */
-    union {
-        struct cpuid_leaf raw[CPUID_GUEST_NR_BASIC];
-        struct {
-            /* Leaf 0x0 - Max and vendor. */
-            uint32_t max_leaf, vendor_ebx, vendor_ecx, vendor_edx;
-
-            /* Leaf 0x1 - Family/model/stepping and features. */
-            uint32_t raw_fms;
-            uint8_t :8,       /* Brand ID. */
-                clflush_size, /* Number of 8-byte blocks per cache line. */
-                lppp,         /* Logical processors per package. */
-                apic_id;      /* Initial APIC ID. */
-            union {
-                uint32_t _1c;
-                struct { DECL_BITFIELD(1c); };
-            };
-            union {
-                uint32_t _1d;
-                struct { DECL_BITFIELD(1d); };
-            };
-
-            /* Leaf 0x2 - TLB/Cache/Prefetch. */
-            uint8_t l2_nr_queries; /* Documented as fixed to 1. */
-            uint8_t l2_desc[15];
-
-            uint64_t :64, :64; /* Leaf 0x3 - PSN. */
-            uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
-            uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
-            uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
-            uint64_t :64, :64; /* Leaf 0x8 - rsvd */
-            uint64_t :64, :64; /* Leaf 0x9 - DCA */
-
-            /* Leaf 0xa - Intel PMU. */
-            uint8_t pmu_version, _pmu[15];
-
-            uint64_t :64, :64; /* Leaf 0xb - Topology. */
-            uint64_t :64, :64; /* Leaf 0xc - rsvd */
-            uint64_t :64, :64; /* Leaf 0xd - XSTATE. */
-        };
-    } basic;
-
-    /* Structured cache leaf: 0x00000004[xx] */
-    union {
-        struct cpuid_leaf raw[CPUID_GUEST_NR_CACHE];
-        struct cpuid_cache_leaf {
-            uint32_t /* a */ type:5, level:3;
-            bool self_init:1, fully_assoc:1;
-            uint32_t :4, threads_per_cache:12, cores_per_package:6;
-            uint32_t /* b */ line_size:12, partitions:10, ways:10;
-            uint32_t /* c */ sets;
-            bool /* d */ wbinvd:1, inclusive:1, complex:1;
-        } subleaf[CPUID_GUEST_NR_CACHE];
-    } cache;
-
-    /* Structured feature leaf: 0x00000007[xx] */
-    union {
-        struct cpuid_leaf raw[CPUID_GUEST_NR_FEAT];
-        struct {
-            /* Subleaf 0. */
-            uint32_t max_subleaf;
-            union {
-                uint32_t _7b0;
-                struct { DECL_BITFIELD(7b0); };
-            };
-            union {
-                uint32_t _7c0;
-                struct { DECL_BITFIELD(7c0); };
-            };
-            union {
-                uint32_t _7d0;
-                struct { DECL_BITFIELD(7d0); };
-            };
-
-            /* Subleaf 1. */
-            union {
-                uint32_t _7a1;
-                struct { DECL_BITFIELD(7a1); };
-            };
-            union {
-                uint32_t _7b1;
-                struct { DECL_BITFIELD(7b1); };
-            };
-            union {
-                uint32_t _7c1;
-                struct { DECL_BITFIELD(7c1); };
-            };
-            union {
-                uint32_t _7d1;
-                struct { DECL_BITFIELD(7d1); };
-            };
-
-            /* Subleaf 2. */
-            uint32_t /* a */:32, /* b */:32, /* c */:32;
-            union {
-                uint32_t _7d2;
-                struct { DECL_BITFIELD(7d2); };
-            };
-        };
-    } feat;
-
-    /* Extended topology enumeration: 0x0000000B[xx] */
-    union {
-        struct cpuid_leaf raw[CPUID_GUEST_NR_TOPO];
-        struct cpuid_topo_leaf {
-            uint32_t id_shift:5, :27;
-            uint16_t nr_logical, :16;
-            uint8_t level, type, :8, :8;
-            uint32_t x2apic_id;
-        } subleaf[CPUID_GUEST_NR_TOPO];
-    } topo;
-
-    /* Xstate feature leaf: 0x0000000D[xx] */
-    union {
-        struct cpuid_leaf raw[CPUID_GUEST_NR_XSTATE];
-
-        struct {
-            /* Subleaf 0. */
-            uint32_t xcr0_low, /* b */:32, max_size, xcr0_high;
-
-            /* Subleaf 1. */
-            union {
-                uint32_t Da1;
-                struct { DECL_BITFIELD(Da1); };
-            };
-            uint32_t /* b */:32, xss_low, xss_high;
-        };
-
-        /* Per-component common state.  Valid for i >= 2. */
-        struct {
-            uint32_t size, offset;
-            bool xss:1, align:1;
-            uint32_t _res_d;
-        } comp[CPUID_GUEST_NR_XSTATE];
-    } xstate;
-
-    /* Extended leaves: 0x800000xx */
-    union {
-        struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
-        struct {
-            /* Leaf 0x80000000 - Max and vendor. */
-            uint32_t max_leaf, vendor_ebx, vendor_ecx, vendor_edx;
-
-            /* Leaf 0x80000001 - Family/model/stepping and features. */
-            uint32_t raw_fms, /* b */:32;
-            union {
-                uint32_t e1c;
-                struct { DECL_BITFIELD(e1c); };
-            };
-            union {
-                uint32_t e1d;
-                struct { DECL_BITFIELD(e1d); };
-            };
-
-            uint64_t :64, :64; /* Brand string. */
-            uint64_t :64, :64; /* Brand string. */
-            uint64_t :64, :64; /* Brand string. */
-            uint64_t :64, :64; /* L1 cache/TLB. */
-            uint64_t :64, :64; /* L2/3 cache/TLB. */
-
-            /* Leaf 0x80000007 - Advanced Power Management. */
-            uint32_t /* a */:32, /* b */:32, /* c */:32;
-            union {
-                uint32_t e7d;
-                struct { DECL_BITFIELD(e7d); };
-            };
-
-            /* Leaf 0x80000008 - Misc addr/feature info. */
-            uint8_t maxphysaddr, maxlinaddr, :8, :8;
-            union {
-                uint32_t e8b;
-                struct { DECL_BITFIELD(e8b); };
-            };
-            uint32_t nc:8, :4, apic_id_size:4, :16;
-            uint32_t /* d */:32;
-
-            uint64_t :64, :64; /* Leaf 0x80000009. */
-            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
-            uint64_t :64, :64; /* Leaf 0x8000000b. */
-            uint64_t :64, :64; /* Leaf 0x8000000c. */
-            uint64_t :64, :64; /* Leaf 0x8000000d. */
-            uint64_t :64, :64; /* Leaf 0x8000000e. */
-            uint64_t :64, :64; /* Leaf 0x8000000f. */
-            uint64_t :64, :64; /* Leaf 0x80000010. */
-            uint64_t :64, :64; /* Leaf 0x80000011. */
-            uint64_t :64, :64; /* Leaf 0x80000012. */
-            uint64_t :64, :64; /* Leaf 0x80000013. */
-            uint64_t :64, :64; /* Leaf 0x80000014. */
-            uint64_t :64, :64; /* Leaf 0x80000015. */
-            uint64_t :64, :64; /* Leaf 0x80000016. */
-            uint64_t :64, :64; /* Leaf 0x80000017. */
-            uint64_t :64, :64; /* Leaf 0x80000018. */
-            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
-            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
-            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
-            uint64_t :64, :64; /* Leaf 0x8000001c. */
-            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
-            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
-            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
-            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
-
-            /* Leaf 0x80000021 - Extended Feature 2 */
-            union {
-                uint32_t e21a;
-                struct { DECL_BITFIELD(e21a); };
-            };
-            uint32_t /* b */:32, /* c */:32, /* d */:32;
-        };
-    } extd;
-
-#undef __DECL_BITFIELD
-#undef _DECL_BITFIELD
-#undef DECL_BITFIELD
-
-    /* Toolstack selected Hypervisor max_leaf (if non-zero). */
-    uint8_t hv_limit, hv2_limit;
-
-    /* Value calculated from raw data above. */
-    uint8_t x86_vendor;
-};
-
-/* Fill in a featureset bitmap from a CPUID policy. */
-static inline void cpuid_policy_to_featureset(
-    const struct cpuid_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
-{
-    fs[FEATURESET_1d]  = p->basic._1d;
-    fs[FEATURESET_1c]  = p->basic._1c;
-    fs[FEATURESET_e1d] = p->extd.e1d;
-    fs[FEATURESET_e1c] = p->extd.e1c;
-    fs[FEATURESET_Da1] = p->xstate.Da1;
-    fs[FEATURESET_7b0] = p->feat._7b0;
-    fs[FEATURESET_7c0] = p->feat._7c0;
-    fs[FEATURESET_e7d] = p->extd.e7d;
-    fs[FEATURESET_e8b] = p->extd.e8b;
-    fs[FEATURESET_7d0] = p->feat._7d0;
-    fs[FEATURESET_7a1] = p->feat._7a1;
-    fs[FEATURESET_e21a] = p->extd.e21a;
-    fs[FEATURESET_7b1] = p->feat._7b1;
-    fs[FEATURESET_7d2] = p->feat._7d2;
-    fs[FEATURESET_7c1] = p->feat._7c1;
-    fs[FEATURESET_7d1] = p->feat._7d1;
-}
-
-/* Fill in a CPUID policy from a featureset bitmap. */
-static inline void cpuid_featureset_to_policy(
-    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpuid_policy *p)
-{
-    p->basic._1d  = fs[FEATURESET_1d];
-    p->basic._1c  = fs[FEATURESET_1c];
-    p->extd.e1d   = fs[FEATURESET_e1d];
-    p->extd.e1c   = fs[FEATURESET_e1c];
-    p->xstate.Da1 = fs[FEATURESET_Da1];
-    p->feat._7b0  = fs[FEATURESET_7b0];
-    p->feat._7c0  = fs[FEATURESET_7c0];
-    p->extd.e7d   = fs[FEATURESET_e7d];
-    p->extd.e8b   = fs[FEATURESET_e8b];
-    p->feat._7d0  = fs[FEATURESET_7d0];
-    p->feat._7a1  = fs[FEATURESET_7a1];
-    p->extd.e21a  = fs[FEATURESET_e21a];
-    p->feat._7b1  = fs[FEATURESET_7b1];
-    p->feat._7d2  = fs[FEATURESET_7d2];
-    p->feat._7c1  = fs[FEATURESET_7c1];
-    p->feat._7d1  = fs[FEATURESET_7d1];
-}
-
-static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-{
-    return ((uint64_t)p->xstate.xcr0_high << 32) | p->xstate.xcr0_low;
-}
-
-static inline uint64_t cpuid_policy_xstates(const struct cpuid_policy *p)
-{
-    uint64_t val = p->xstate.xcr0_high | p->xstate.xss_high;
-
-    return (val << 32) | p->xstate.xcr0_low | p->xstate.xss_low;
-}
-
-const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature);
-
-/**
- * Recalculate the content in a CPUID policy which is derived from raw data.
- */
-void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p);
-
-/**
- * Fill a CPUID policy using the native CPUID instruction.
- *
- * No sanitisation is performed, but synthesised values are calculated.
- * Values may be influenced by a hypervisor or from masking/faulting
- * configuration.
- */
-void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
-
-/**
- * Clear leaf data beyond the policies max leaf/subleaf settings.
- *
- * Policy serialisation purposefully omits out-of-range leaves, because there
- * are a large number of them due to vendor differences.  However, when
- * constructing new policies (e.g. levelling down), it is possible to end up
- * with out-of-range leaves with stale content in them.  This helper clears
- * them.
- */
-void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
-
-#ifdef __XEN__
-#include <public/arch-x86/xen.h>
-typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
-#else
-#include <xen/arch-x86/xen.h>
-typedef xen_cpuid_leaf_t cpuid_leaf_buffer_t[];
-#endif
-
-/**
- * Serialise a cpuid_policy object into an array of cpuid leaves.
- *
- * @param policy     The cpuid_policy to serialise.
- * @param leaves     The array of leaves to serialise into.
- * @param nr_entries The number of entries in 'leaves'.
- * @returns -errno
- *
- * Writes at most CPUID_MAX_SERIALISED_LEAVES.  May fail with -ENOBUFS if the
- * leaves array is too short.  On success, nr_entries is updated with the
- * actual number of leaves written.
- */
-int x86_cpuid_copy_to_buffer(const struct cpuid_policy *policy,
-                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
-
-/**
- * Unserialise a cpuid_policy object from an array of cpuid leaves.
- *
- * @param policy      The cpuid_policy to unserialise into.
- * @param leaves      The array of leaves to unserialise from.
- * @param nr_entries  The number of entries in 'leaves'.
- * @param err_leaf    Optional hint for error diagnostics.
- * @param err_subleaf Optional hint for error diagnostics.
- * @returns -errno
- *
- * Reads at most CPUID_MAX_SERIALISED_LEAVES.  May return -ERANGE if an
- * incoming leaf is out of range of cpuid_policy, in which case the optional
- * err_* pointers will identify the out-of-range indicies.
- *
- * No content validation of in-range leaves is performed.  Synthesised data is
- * recalculated.
- */
-int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
-                               const cpuid_leaf_buffer_t leaves,
-                               uint32_t nr_entries, uint32_t *err_leaf,
-                               uint32_t *err_subleaf);
-
-#endif /* !XEN_LIB_X86_CPUID_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 8eb88314f53c..e81f76c779c0 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -1,6 +1,6 @@
 #include "private.h"
 
-#include <xen/lib/x86/cpuid.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 static void zero_leaves(struct cpuid_leaf *l,
                         unsigned int first, unsigned int last)
-- 
2.30.2


