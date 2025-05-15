Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE10AB9042
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 21:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985923.1371720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegT-0004qZ-41; Thu, 15 May 2025 19:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985923.1371720; Thu, 15 May 2025 19:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegS-0004nN-W3; Thu, 15 May 2025 19:56:00 +0000
Received: by outflank-mailman (input) for mailman id 985923;
 Thu, 15 May 2025 19:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=us+D=X7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFegQ-0004Ph-Ui
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 19:55:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e81310e-31c6-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 21:55:58 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so13898975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 12:55:58 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd6fe86sm78320035e9.0.2025.05.15.12.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:55:56 -0700 (PDT)
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
X-Inumbo-ID: 9e81310e-31c6-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747338957; x=1747943757; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W3bFdSiNP3j+BlDRwES7FFOKrPIgmWmQytxBIEpGDk=;
        b=OYnQy+LVL05zUwsCKJ2B19kpdyeOHooqHfXCtQc+bF6KnJRBVo3IpSldsUuWRwuHrQ
         hCHMoR65jTvgGSysHBjZQmaeMZmBo3B+wa5y8IDunwjV+8s0aOCluBwSKNEGNcH+fTW9
         pCxO76wpGy17LUO7Rt7ghH+3gka2c33Xejai8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338957; x=1747943757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W3bFdSiNP3j+BlDRwES7FFOKrPIgmWmQytxBIEpGDk=;
        b=ptm6ZY7iLu2Qt9Rr7vPMTXtg46bbnASj/h+ih/Xqx/WkD/u1EyXC0NdnKhtenRATdA
         ypS9+kKXhHfA9Ro/KIBCOhD6HZPvlF6OnNTxxsHRH0PutgoO1eE0YwAil9LizeeJdaMb
         3JW4crwB98iOpgOFQHfPppbCkv+zzESnTMUOOG7CBtyJxPAyfR+Br/rgdgg4aQN5T0Mq
         gv5A/7pMgsQZCR2ORii6rwioqqjJc56oFgAyI/LXdy/X/dqPMI60mNyagz19pEvA7cmp
         hFX29vLG9070JVnBJ/dYa5Q+BW1NnXbM67jIasnt+lU7zXz3D1GANiN7CFb7LLK5ZCkO
         14ng==
X-Gm-Message-State: AOJu0YxeiM7X6wJwDeTw22G7ApLX91pVKbwiaqT2dKb0XLIFTQJUdmbO
	hxhBnQRICkkhM/Qxz34gMnTwhLD4fbBWQNPcqORATa1cTv1mVch0fbdLtXMbGS7E7DpSYDGPUdj
	Wwkeg
X-Gm-Gg: ASbGncssngoMbIU5UpSoyhWEP/MskKH04dWFvnNGSMbnrwjYnsmx/7Jr+Z5T5SIeJcU
	5LpfL8323JGqMELT404A2ZEbpnYwSJNCQ4czCDrNmrzYty1Uedi/KyL/ABAx0msEo6rUQO5FL/E
	/hzVDTBqO3b1d70eGzDZIipCgu/QCRcb21Yb3Xnhdmqaj1V+/7gaiSOTcAM1tCz7/oNitu4rvDg
	LEy+EQWEgUrCe0tyc7WaBvZ5ftKhy2dL4LJolq5bQBvfllx6k4610gQPh5f4xoXH0Y0GU/DYrPZ
	62GRAya2ykjrScGSmk+2UyO5rnCRUbyGuBI0820VpVQp9BiS4PiEqsKCUzIiq5Fb/ouh4Xn6pZP
	KPS22EBHwKL4WzmpkKF5W+/ax
X-Google-Smtp-Source: AGHT+IFb/jz0BthZ+Z/YQ0baZ3psCUhHZOTo012R1k35FNTiqHBqK3W60z9v8M45Gfe9/WL06DMbEQ==
X-Received: by 2002:a05:600c:a105:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-442fda3038amr4765735e9.20.1747338957328;
        Thu, 15 May 2025 12:55:57 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: Use asm_inline for ALTERNATIVE()
Date: Thu, 15 May 2025 20:55:49 +0100
Message-Id: <20250515195549.3703017-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
References: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... when there really are only a few instructions in line.

In some cases, reformat to reduce left-hand margine space.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

v2:
 * New, split out of previous single patch
---
 xen/arch/arm/include/asm/alternative.h    |  4 +--
 xen/arch/arm/include/asm/arm64/flushtlb.h |  4 +--
 xen/arch/arm/include/asm/arm64/io.h       | 43 ++++++++++++++---------
 xen/arch/arm/include/asm/cpuerrata.h      |  8 ++---
 xen/arch/arm/include/asm/cpufeature.h     |  8 ++---
 xen/arch/arm/include/asm/page.h           | 12 ++++---
 xen/arch/arm/include/asm/processor.h      |  7 ++--
 xen/arch/arm/include/asm/sysregs.h        | 10 +++---
 xen/arch/arm/mmu/p2m.c                    |  3 +-
 9 files changed, 58 insertions(+), 41 deletions(-)

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
-- 
2.39.5


