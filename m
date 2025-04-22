Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90DDA967DF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 13:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962534.1353732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Byt-0006dN-74; Tue, 22 Apr 2025 11:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962534.1353732; Tue, 22 Apr 2025 11:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Byt-0006Z6-3J; Tue, 22 Apr 2025 11:40:03 +0000
Received: by outflank-mailman (input) for mailman id 962534;
 Tue, 22 Apr 2025 11:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7Byr-0006Kq-4Z
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 11:40:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85e332a7-1f6e-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 13:40:00 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso59300675e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 04:40:00 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5ace47sm168773615e9.15.2025.04.22.04.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:39:59 -0700 (PDT)
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
X-Inumbo-ID: 85e332a7-1f6e-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745321999; x=1745926799; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVvfU+7eqssZP5v8gRrvIDHpMR4zRCPW6LahQGOlmQc=;
        b=WvKtJCNhxi4e1Z88LFl/mHhsrO7/IXLZxxBUI41+uY871jFR5ANek18TtREot4GhJW
         uqGwQgoGdLOsgKnMN84QJ+ZMoOvDaZP8u/vzEE2JJVH0EUrhuZ6Hu1PRfnnzxJJr/Q/o
         nnoTsfBF1cpXcIFT2Ga/Iz3Eyp3SGfBG46Ns4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321999; x=1745926799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVvfU+7eqssZP5v8gRrvIDHpMR4zRCPW6LahQGOlmQc=;
        b=R8FmLbVw+Ic1Pd/RO6xmPlZR9gKFgV2/3cOcHSQLp6/WnGgFuDhk1vuWAgyN62BrJK
         F87mE06xnLIAcLgWKhsvKzr01R7nLpUoTviAPuxgS9BiLE68gHy2ZkJ+EYX4Ozd1B5O/
         A1PB8Cli7W02wCl5K32tZnn4dtMw7d3xsv41eJLh2JplZj75HowQ/CXqabaiSjIhomsg
         siDbu9hBdEAAwZ1j2x1LZ4iCh3+CCMzdo3/svmi47Rv/8rOE45RiuwvoXBTR1LcsQGI/
         O2XsSgDazvPUAayIWuU/W/g7Jk7eSowZ6poeERwtFC1EpJqkE0AgeFtCGjj6UzCpoPE0
         MJmw==
X-Gm-Message-State: AOJu0YyK/d3H6yMP94LXQ9n+bIGWF1HgwPLo9WTWdasZ5YKLSgbVNxgF
	nTkamelvJddrXcxJndXUfR3ZmvvIEtVDYKpVaXAiO27NYQs7djs2McRtl21Ao6cOp3mOOdTR7mn
	VV3gqZg==
X-Gm-Gg: ASbGncuCPogFVqOUoCz8yknK8q3FFnvvBbVuq5+TzQqN78PJ9cMRuh9AJyIw9ppaKx3
	TekZdr1W9m6euXx9ze+9rSfeUTLBtgDfYt+cySXMTSPi6oslT36vNqg6fxs4j7dCU+5/Pms5/GY
	+XwkkvccV+HEfD7cH16MYVQn8InsnJTfmKoe1tNuOz3eDWz7xRDRY2PK3NuEMXqqNsfYX/Mwccy
	57wMfevIBL59Ht9t6ua4ZHqCbftiO8SWI3go4qHMaYBgNHJnFApxrS3N5LB9XesIoNGXsjc1VpH
	Kr2d9bhKgoAeIvEKGz7s2DgyrUYSSqTMvIb8HIBGL0lVXpCh75nyKhrjQCLCfw==
X-Google-Smtp-Source: AGHT+IFh/SoOkzGy8D+hs6AwiJ4PzitgLsehuM9ho/5k8caXBO32iheEMFL6e33SgWcWSrqI8SqgWA==
X-Received: by 2002:a05:600c:1c8e:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-4406ab6c278mr143300505e9.2.1745321999478;
        Tue, 22 Apr 2025 04:39:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen: Use asm inline when available for alternatives
Date: Tue, 22 Apr 2025 12:39:57 +0100
Message-Id: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compilers estimate the size of an asm() block for inlining purposes.

Constructs such as ALTERNATIVE appear large due to the metadata, depsite often
only being a handful of instructions.  asm inline() overrides the estimation
to identify the block as being small.

This has a substantial impact on inlining decisions, expected to be for the
better given that the compiler has a more accurate picture to work with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/Kconfig                               |  4 +++
 xen/arch/arm/include/asm/alternative.h    |  4 +--
 xen/arch/arm/include/asm/arm64/flushtlb.h |  4 +--
 xen/arch/arm/include/asm/arm64/io.h       | 43 ++++++++++++++---------
 xen/arch/arm/include/asm/cpuerrata.h      |  8 ++---
 xen/arch/arm/include/asm/cpufeature.h     |  8 ++---
 xen/arch/arm/include/asm/page.h           | 12 ++++---
 xen/arch/arm/include/asm/processor.h      |  7 ++--
 xen/arch/arm/include/asm/sysregs.h        | 10 +++---
 xen/arch/arm/mmu/p2m.c                    |  3 +-
 xen/arch/x86/include/asm/alternative.h    | 36 ++++++++++---------
 xen/include/xen/compiler.h                | 14 ++++++++
 12 files changed, 95 insertions(+), 58 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index ae1c401a981e..ab4ab42ae987 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -29,6 +29,10 @@ config LD_IS_GNU
 config LD_IS_LLVM
 	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
 
+config CC_HAS_ASM_INLINE
+	# GCC >= 9, Clang >= 11
+	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
+
 # Use -f{function,data}-sections compiler parameters
 config CC_SPLIT_SECTIONS
 	bool
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index 22477d9497a3..1563f03a0f5a 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -209,9 +209,9 @@ alternative_endif
 #endif  /*  __ASSEMBLY__  */
 
 /*
- * Usage: asm(ALTERNATIVE(oldinstr, newinstr, feature));
+ * Usage: asm_inline (ALTERNATIVE(oldinstr, newinstr, feature));
  *
- * Usage: asm(ALTERNATIVE(oldinstr, newinstr, feature, CONFIG_FOO));
+ * Usage: asm_inline (ALTERNATIVE(oldinstr, newinstr, feature, CONFIG_FOO));
  * N.B. If CONFIG_FOO is specified, but not selected, the whole block
  *      will be omitted, including oldinstr.
  */
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 45642201d147..3b99c11b50d1 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -31,7 +31,7 @@
 #define TLB_HELPER(name, tlbop, sh)              \
 static inline void name(void)                    \
 {                                                \
-    asm volatile(                                \
+    asm_inline volatile (                        \
         "dsb  "  # sh  "st;"                     \
         "tlbi "  # tlbop  ";"                    \
         ALTERNATIVE(                             \
@@ -55,7 +55,7 @@ static inline void name(void)                    \
 #define TLB_HELPER_VA(name, tlbop)               \
 static inline void name(vaddr_t va)              \
 {                                                \
-    asm volatile(                                \
+    asm_inline volatile (                        \
         "tlbi "  # tlbop  ", %0;"                \
         ALTERNATIVE(                             \
             "nop; nop;",                         \
diff --git a/xen/arch/arm/include/asm/arm64/io.h b/xen/arch/arm/include/asm/arm64/io.h
index 7d5959877759..ac90b729c44d 100644
--- a/xen/arch/arm/include/asm/arm64/io.h
+++ b/xen/arch/arm/include/asm/arm64/io.h
@@ -51,40 +51,51 @@ static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 static inline u8 __raw_readb(const volatile void __iomem *addr)
 {
         u8 val;
-        asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
-                                 "ldarb %w0, [%1]",
-                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
-                     : "=r" (val) : "r" (addr));
+
+        asm_inline volatile (
+            ALTERNATIVE("ldrb %w0, [%1]",
+                        "ldarb %w0, [%1]",
+                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+            : "=r" (val) : "r" (addr) );
+
         return val;
 }
 
 static inline u16 __raw_readw(const volatile void __iomem *addr)
 {
         u16 val;
-        asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
-                                 "ldarh %w0, [%1]",
-                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
-                     : "=r" (val) : "r" (addr));
+        asm_inline volatile (
+            ALTERNATIVE("ldrh %w0, [%1]",
+                        "ldarh %w0, [%1]",
+                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+            : "=r" (val) : "r" (addr) );
+
         return val;
 }
 
 static inline u32 __raw_readl(const volatile void __iomem *addr)
 {
         u32 val;
-        asm volatile(ALTERNATIVE("ldr %w0, [%1]",
-                                 "ldar %w0, [%1]",
-                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
-                     : "=r" (val) : "r" (addr));
+
+        asm_inline volatile (
+            ALTERNATIVE("ldr %w0, [%1]",
+                        "ldar %w0, [%1]",
+                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+            : "=r" (val) : "r" (addr) );
+
         return val;
 }
 
 static inline u64 __raw_readq(const volatile void __iomem *addr)
 {
         u64 val;
-        asm volatile(ALTERNATIVE("ldr %0, [%1]",
-                                 "ldar %0, [%1]",
-                                 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
-                     : "=r" (val) : "r" (addr));
+
+        asm_inline volatile (
+            ALTERNATIVE("ldr %0, [%1]",
+                        "ldar %0, [%1]",
+                        ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
+            : "=r" (val) : "r" (addr) );
+
         return val;
 }
 
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 8d7e7b9375bd..1799a16d7e7f 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -16,10 +16,10 @@ static inline bool check_workaround_##erratum(void)             \
     {                                                           \
         register_t ret;                                         \
                                                                 \
-        asm volatile (ALTERNATIVE("mov %0, #0",                 \
-                                  "mov %0, #1",                 \
-                                  feature)                      \
-                      : "=r" (ret));                            \
+        asm_inline volatile (                                   \
+            ALTERNATIVE("mov %0, #0",                           \
+                        "mov %0, #1", feature)                  \
+            : "=r" (ret) );                                     \
                                                                 \
         return unlikely(ret);                                   \
     }                                                           \
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 50297e53d90e..b6df18801166 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -102,10 +102,10 @@ static inline bool cpus_have_cap(unsigned int num)
 #define cpus_have_const_cap(num) ({                 \
         register_t __ret;                           \
                                                     \
-        asm volatile (ALTERNATIVE("mov %0, #0",     \
-                                  "mov %0, #1",     \
-                                  num)              \
-                      : "=r" (__ret));              \
+        asm_inline volatile (                       \
+            ALTERNATIVE("mov %0, #0",               \
+                        "mov %0, #1", num)          \
+            : "=r" (__ret) );                       \
                                                     \
         unlikely(__ret);                            \
         })
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 69f817d1e68a..27bc96b9f401 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -176,7 +176,8 @@ static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
     {
         size -= dcache_line_bytes - ((uintptr_t)p & cacheline_mask);
         p = (void *)((uintptr_t)p & ~cacheline_mask);
-        asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p));
+        asm_inline volatile (
+            __clean_and_invalidate_dcache_one(0) :: "r" (p) );
         p += dcache_line_bytes;
     }
 
@@ -185,7 +186,8 @@ static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
         asm volatile (__invalidate_dcache_one(0) : : "r" (p + idx));
 
     if ( size > 0 )
-        asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p + idx));
+        asm_inline volatile (
+            __clean_and_invalidate_dcache_one(0) :: "r" (p + idx) );
 
     dsb(sy);           /* So we know the flushes happen before continuing */
 
@@ -209,7 +211,7 @@ static inline int clean_dcache_va_range(const void *p, unsigned long size)
     p = (void *)((uintptr_t)p & ~cacheline_mask);
     for ( ; size >= dcache_line_bytes;
             idx += dcache_line_bytes, size -= dcache_line_bytes )
-        asm volatile (__clean_dcache_one(0) : : "r" (p + idx));
+        asm_inline volatile ( __clean_dcache_one(0) : : "r" (p + idx) );
     dsb(sy);           /* So we know the flushes happen before continuing */
     /* ARM callers assume that dcache_* functions cannot fail. */
     return 0;
@@ -247,7 +249,7 @@ static inline int clean_and_invalidate_dcache_va_range
     if ( sizeof(x) > MIN_CACHELINE_BYTES || sizeof(x) > alignof(x) )    \
         clean_dcache_va_range(_p, sizeof(x));                           \
     else                                                                \
-        asm volatile (                                                  \
+        asm_inline volatile (                                           \
             "dsb sy;"   /* Finish all earlier writes */                 \
             __clean_dcache_one(0)                                       \
             "dsb sy;"   /* Finish flush before continuing */            \
@@ -259,7 +261,7 @@ static inline int clean_and_invalidate_dcache_va_range
     if ( sizeof(x) > MIN_CACHELINE_BYTES || sizeof(x) > alignof(x) )    \
         clean_and_invalidate_dcache_va_range(_p, sizeof(x));            \
     else                                                                \
-        asm volatile (                                                  \
+        asm_inline volatile (                                           \
             "dsb sy;"   /* Finish all earlier writes */                 \
             __clean_and_invalidate_dcache_one(0)                        \
             "dsb sy;"   /* Finish flush before continuing */            \
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 60b587db697f..9cbc4f911061 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -607,9 +607,10 @@ register_t get_default_cptr_flags(void);
 #define SYNCHRONIZE_SERROR(feat)                                  \
     do {                                                          \
         ASSERT(local_abort_is_enabled());                         \
-        asm volatile(ALTERNATIVE("dsb sy; isb",                   \
-                                 "nop; nop", feat)                \
-                                 : : : "memory");                 \
+        asm_inline volatile (                                     \
+            ALTERNATIVE("dsb sy; isb",                            \
+                        "nop; nop", feat)                         \
+            ::: "memory" );                                       \
     } while (0)
 
 /*
diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
index 61e30c9e517c..5c2d362be3d8 100644
--- a/xen/arch/arm/include/asm/sysregs.h
+++ b/xen/arch/arm/include/asm/sysregs.h
@@ -22,11 +22,13 @@ static inline register_t read_sysreg_par(void)
      * DMB SY before and after accessing it, as part of the workaround for the
      * errata 1508412.
      */
-    asm volatile(ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
-                 CONFIG_ARM64_ERRATUM_1508412));
+    asm_inline volatile (
+        ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
+                    CONFIG_ARM64_ERRATUM_1508412) );
     par_el1 = READ_SYSREG64(PAR_EL1);
-    asm volatile(ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
-                 CONFIG_ARM64_ERRATUM_1508412));
+    asm_inline volatile (
+        ALTERNATIVE("nop", "dmb sy", ARM64_WORKAROUND_1508412,
+                    CONFIG_ARM64_ERRATUM_1508412) );
 
     return par_el1;
 }
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 7642dbc7c55b..d96078f547d5 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -228,7 +228,8 @@ void p2m_restore_state(struct vcpu *n)
      * registers associated to EL1/EL0 translations regime have been
      * synchronized.
      */
-    asm volatile(ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_AT_SPECULATE));
+    asm_inline volatile (
+        ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_AT_SPECULATE) );
     WRITE_SYSREG64(p2m->vttbr, VTTBR_EL2);
 
     last_vcpu_ran = &p2m->last_vcpu_ran[smp_processor_id()];
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 38472fb58e2d..4c8be51d0e23 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -116,12 +116,13 @@ extern void alternative_branches(void);
  * without volatile and memory clobber.
  */
 #define alternative(oldinstr, newinstr, feature)                        \
-        asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : : "memory")
+    asm_inline volatile ( ALTERNATIVE(oldinstr, newinstr, feature)      \
+                          ::: "memory" )
 
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
-	asm volatile (ALTERNATIVE_2(oldinstr, newinstr1, feature1,	\
-				    newinstr2, feature2)		\
-		      : : : "memory")
+    asm_inline volatile ( ALTERNATIVE_2(oldinstr, newinstr1, feature1,  \
+                                        newinstr2, feature2)            \
+                          ::: "memory" )
 
 /*
  * Alternative inline assembly with input.
@@ -133,14 +134,14 @@ extern void alternative_branches(void);
  * If you use variable sized constraints like "m" or "g" in the
  * replacement make sure to pad to the worst case length.
  */
-#define alternative_input(oldinstr, newinstr, feature, input...)	\
-	asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)		\
-		      : : input)
+#define alternative_input(oldinstr, newinstr, feature, input...)        \
+    asm_inline volatile ( ALTERNATIVE(oldinstr, newinstr, feature)      \
+                          :: input )
 
 /* Like alternative_input, but with a single output argument */
-#define alternative_io(oldinstr, newinstr, feature, output, input...)	\
-	asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)		\
-		      : output : input)
+#define alternative_io(oldinstr, newinstr, feature, output, input...)   \
+    asm_inline volatile ( ALTERNATIVE(oldinstr, newinstr, feature)      \
+                          : output : input )
 
 /*
  * This is similar to alternative_io. But it has two features and
@@ -150,11 +151,11 @@ extern void alternative_branches(void);
  * Otherwise, if CPU has feature1, newinstr1 is used.
  * Otherwise, oldinstr is used.
  */
-#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,	\
-			 feature2, output, input...)			\
-	asm volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1,	\
-				   newinstr2, feature2)			\
-		     : output : input)
+#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,      \
+                         feature2, output, input...)                    \
+    asm_inline volatile ( ALTERNATIVE_2(oldinstr, newinstr1, feature1,  \
+                                        newinstr2, feature2)            \
+                          : output : input )
 
 /* Use this macro(s) if you need more than one output parameter. */
 #define ASM_OUTPUT2(a...) a
@@ -234,8 +235,9 @@ extern void alternative_branches(void);
     rettype ret_;                                                  \
     register unsigned long r10_ asm("r10");                        \
     register unsigned long r11_ asm("r11");                        \
-    asm volatile (ALTERNATIVE("call *%c[addr](%%rip)", "call .",   \
-                              X86_FEATURE_ALWAYS)                  \
+    asm_inline volatile (                                          \
+        ALTERNATIVE("call *%c[addr](%%rip)", "call .",             \
+                    X86_FEATURE_ALWAYS)                            \
                   : ALT_CALL ## n ## _OUT, "=a" (ret_),            \
                     "=r" (r10_), "=r" (r11_) ASM_CALL_CONSTRAINT   \
                   : [addr] "i" (&(func)), "g" (func)               \
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index c68fab189154..d9b133016bb6 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -53,6 +53,20 @@
 #define unreachable() __builtin_unreachable()
 #endif
 
+/*
+ * Compilers estimate the size of an asm() block for inlining purposes.
+ * Constructs such as ALTERNATIVE appear large due to the metadata, depsite
+ * often only being a handful of instructions.  asm inline() overrides the
+ * estimation to identify the block as being small.
+ *
+ * Note: __inline is needed to avoid getting caught up in INIT_SECTIONS_ONLY.
+ */
+#if CONFIG_CC_HAS_ASM_INLINE
+# define asm_inline asm __inline
+#else
+# define asm_inline asm
+#endif
+
 /*
  * Add the pseudo keyword 'fallthrough' so case statement blocks
  * must end with any of these keywords:
-- 
2.39.5


