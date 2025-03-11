Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6EA5D018
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908968.1316019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k3-00079C-QH; Tue, 11 Mar 2025 19:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908968.1316019; Tue, 11 Mar 2025 19:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k3-000715-Lq; Tue, 11 Mar 2025 19:58:19 +0000
Received: by outflank-mailman (input) for mailman id 908968;
 Tue, 11 Mar 2025 19:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k2-0006Vp-9T
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:18 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc930c6-feb3-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:58:16 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224171d6826so18620055ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:16 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:14 -0700 (PDT)
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
X-Inumbo-ID: 2bc930c6-feb3-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723095; x=1742327895; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=WpuoPihMRMWrkVQBNjGQPnYo/jH2kb+d7qiiBz3VVnnX47fUwlpUzdlYoTdG1C8RPp
         qjjq9C1OajdubFUsehFC1pwmTWieQ2d3CvwRG+O68o2HeAXuvRbbVcdjc/k+LOyGPV6u
         iiOdcLQeP1OXEYUIteISVOkO7vshd/5YSnj0WpBOzEuLW6wVafDcbHpEV1hdAn2Rl2Db
         0jSazE1cUxO1l5VZQcgA0aIA30fNYgNOqCs0Kr5BvPZIjoJSi46hBDZVzgztifKBhGRK
         xn3ErySzKASOj6vZwTHTDaHRfyiq342cyU35VVrpMsSjr3T6psEBCJ5A5DoXH80tCrmH
         D6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723095; x=1742327895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=bSjO5s2LDVUkxIPrR6FjSZ+U5U7owNuA9XsZONcvngUYpGU5VT2B+oL9x5kt+AYjcO
         GRdw2DYY0zuSZ/bHiU0ZIo6Bh5LhEvnuNc8H1N7MLh+4h7DofGPH2cTPFu/18RjmNPZx
         I+wL+QqqOE7q+5sGNBTkaid9ZMPSDHALaQ5uK7PZ7tIhc5UeEICLNuutG5VHey192yCc
         iek9sdX/PTueB/g9ijqAsVEeq/9cBXM6xZsisij4eE2eLusQ4eeHStSjP0Z86sdXNx9d
         Rj9z+m3/0s+ynu+W1yjM+Xv2gD7m8uBeFZnYX87cBmNDrNkHWHszm9FZ5byGEiQln1UL
         YEbA==
X-Forwarded-Encrypted: i=1; AJvYcCVTSuztSLtGOQ7gKij447HK51dFXVdTFGuS25FoCktVoo+JwOpeWIEO/BBL8z3ghv1XInX0WsTN3zA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxwpg99iECUkUKmm7jE574q/Ud4WicFuMjax9RtO3ux6vRvc5hI
	SoKtQo7bYrzWzSsyF2pAwkDGkRdH3UREiIJ5VZ20Q3DwaG9yknJzU8Wkv90jUNM=
X-Gm-Gg: ASbGncvmUJofnjrukt5Oe0rzahbTzypGLtlGO6RqWaRay1Epj+aU3v/c7lt/Bw7hmBg
	QhBS4w6rhmzQjiz1VJo9zH85TCLVC9l84WLhdh/ZUJdgd4lH3HpWLkwuwSidWvxH9P3IWjTTMuV
	1GHhHdOW+TSrSANSSv7dV2up7g0e88Unt/0fSJYEJBc91LvRkg0nzljWyqWXKav3IPb1JCGE0nJ
	j9+s1dYTFfHW48hBHKBYXV/68yrdOyTjmvFml/6K1GcB4cKKf6jLN/pHt9XeWML9Y+VGAhvwvEI
	rmTjrqpwuHkWNQ8Fd7AZCrbzM8IjGO5VGJ2Sk7K6sEag
X-Google-Smtp-Source: AGHT+IGNWEO4mZBHpAmOvbPEdLBPlFyMCMG4ZRJsA2UNTnkEr6ujtHjiyajOo8ag/l99JEaYOKJfOg==
X-Received: by 2002:a05:6a00:190a:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-736aaaad27fmr26132051b3a.16.1741723095319;
        Tue, 11 Mar 2025 12:58:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 04/17] exec/memory_ldst_phys: extract memory_ldst_phys declarations from cpu-all.h
Date: Tue, 11 Mar 2025 12:57:50 -0700
Message-Id: <20250311195803.4115788-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

Move stl_phys_notdirty function as well.
Cached endianness agnostic version rely on st/ld*_p, which is available
through tswap.h.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h              | 29 -----------------------------
 include/exec/memory.h               | 10 ++++++++++
 include/exec/memory_ldst_phys.h.inc |  5 +----
 3 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 0e8205818a4..902ca1f3c7b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,35 +38,6 @@
 #define BSWAP_NEEDED
 #endif
 
-/* MMU memory access macros */
-
-#if !defined(CONFIG_USER_ONLY)
-
-#include "exec/hwaddr.h"
-
-static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
-{
-    address_space_stl_notdirty(as, addr, val,
-                               MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-#define SUFFIX
-#define ARG1         as
-#define ARG1_DECL    AddressSpace *as
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst_phys.h.inc"
-
-/* Inline fast path for direct RAM access.  */
-#define ENDIANNESS
-#include "exec/memory_ldst_cached.h.inc"
-
-#define SUFFIX       _cached
-#define ARG1         cache
-#define ARG1_DECL    MemoryRegionCache *cache
-#define TARGET_ENDIANNESS
-#include "exec/memory_ldst_phys.h.inc"
-#endif
-
 /* page related stuff */
 #include "exec/cpu-defs.h"
 #include "exec/target_page.h"
diff --git a/include/exec/memory.h b/include/exec/memory.h
index d09af58c971..da21e9150b5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -21,6 +21,7 @@
 #include "exec/memattrs.h"
 #include "exec/memop.h"
 #include "exec/ramlist.h"
+#include "exec/tswap.h"
 #include "qemu/bswap.h"
 #include "qemu/queue.h"
 #include "qemu/int128.h"
@@ -2732,6 +2733,12 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
 #define ARG1_DECL    AddressSpace *as
 #include "exec/memory_ldst.h.inc"
 
+static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
+{
+    address_space_stl_notdirty(as, addr, val,
+                               MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
 #define SUFFIX
 #define ARG1         as
 #define ARG1_DECL    AddressSpace *as
@@ -2798,6 +2805,9 @@ static inline void address_space_stb_cached(MemoryRegionCache *cache,
     }
 }
 
+#define ENDIANNESS
+#include "exec/memory_ldst_cached.h.inc"
+
 #define ENDIANNESS   _le
 #include "exec/memory_ldst_cached.h.inc"
 
diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index ecd678610d1..db67de75251 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -19,7 +19,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifdef TARGET_ENDIANNESS
 static inline uint16_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw, SUFFIX)(ARG1, addr,
@@ -55,7 +54,7 @@ static inline void glue(stq_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
     glue(address_space_stq, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
-#else
+
 static inline uint8_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldub, SUFFIX)(ARG1, addr,
@@ -139,9 +138,7 @@ static inline void glue(stq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t va
     glue(address_space_stq_be, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
-#endif
 
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
-#undef TARGET_ENDIANNESS
-- 
2.39.5


