Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E2A5B7C9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907017.1314332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvR-0001Ae-OJ; Tue, 11 Mar 2025 04:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907017.1314332; Tue, 11 Mar 2025 04:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvR-00017Z-Ky; Tue, 11 Mar 2025 04:09:05 +0000
Received: by outflank-mailman (input) for mailman id 907017;
 Tue, 11 Mar 2025 04:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvQ-0000fJ-3J
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:04 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90d95c1f-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:03 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-224341bbc1dso60930655ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:03 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:01 -0700 (PDT)
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
X-Inumbo-ID: 90d95c1f-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666142; x=1742270942; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZg0/as8vJD+8Um7sy7JKxAjMVLEtPUz9ZnXYeX+5Ko=;
        b=GE9FmSt5ZO/Lj56jkZSR0M/n+RBZQzPPAvseRCmGMDWaF0Zd1kJ34SQZQoSN2tF1OK
         wA0Dlr3P31b8NEsoh3nbyHbi/COX7gbuJo1rv86j8BgRPdarLMVfXG2ZtRBSoHbk8yrp
         y1Z6ICivtslL/N8XB5ViZkACgdhYGeqIiwwuW9Fgo/J6PrOdSF/N03IJ33KPJHfUoK1j
         gcHQL0OZFBmI8YAeUmyH7c6sCqBwujsqd62lcVGD1V8fT0HBkHAzWEeokBkl8GcQDQbW
         kRdRY4+8rw+vyIsrkbaCUk5fmqGYFz1YCc4htQ6ifR4BqgiOXd98Bn3JTIVDw8ydtG2g
         ytGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666142; x=1742270942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZg0/as8vJD+8Um7sy7JKxAjMVLEtPUz9ZnXYeX+5Ko=;
        b=n4MjXwcO7r8Q/NhCWGp7cjZMhcvhHnO5i+D0y5SNFQpfm8DkB9+jB4WbHinAIHqYrH
         Xo+UQ5DWrM1IQLDlcCCeWhmBfFNQbBZQxjHrDayJAH2sqm4+UO8csierW5yDw/Fiy9bT
         zgb3HXoWmkyq/PAirzh5FcK2YGYk0dICbKI+GeqKZ0mGePIIqdAynAMGDPvF7WeZm/eW
         f3ypkfukcq2a1vi3AUV2iupKon60sBGi19BbW1HyaAqLmVNQKUEhavBeZ2HTqBJe9biA
         LQiWbRUtsoALJQOu9Xjv9DxUnk/ZtyKiqAkSCN0DJXmNpuyhDG4vqX6JW2Or57jaKKHD
         BdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc9flUOnjr3qA8eqlPRI6qoGLHd2PyXVIupSdcMW1A/vP7Y4e39tHo385yvjuA3Ko+JaPDvpbHpMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdetYUS8Mz5s0krYoBWBYWzLcX3SeXS0ioe9uV0JBW1BYT93QB
	BJYrsxSi44y08hMNQZgx94+It8DMJCAKvt5hSuq79K4qYKfYKbdaigeYIuv6AWg=
X-Gm-Gg: ASbGncvRkozWCM/AOGo6DqBVfkyWlaikUUAkueWBDkSJX7aEucY1u4NZoPYxkkz082r
	Ir2Rh/ezqLm0H4M/P/ET1h9bc18Dhq7b0cOgCJtg76yaUuZrlljUmiXvnzf8kVNG1ljXTDwg7OS
	syO9LR/XyWuVxuvrPa2gmWbAyos8mSNKYB2B2Duo0jTdDsOtdMx/5iOZrxwGk0jXO/80bTk74VI
	VjNQZiwsYRhhiTjb1dj2A6YyACCzotAyxV4LkewyNtOYwGq8JK2lgJCyRGZcncPfXrDO53ncqPo
	tmk/JrVwJvYvT+ZFzJNdSVW8gCKlt+/xTGjfT6uxMBvF
X-Google-Smtp-Source: AGHT+IEv6pfYhMlZcVFtUT8KTCc1zYGaqiUcLOn7dx2sPDPFPmpFWZtYBaUHHMwx5Ykg9mMF6L42zQ==
X-Received: by 2002:a05:6a21:7002:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-1f58cb1bea7mr3411754637.16.1741666141836;
        Mon, 10 Mar 2025 21:09:01 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 04/16] exec/memory_ldst_phys: extract memory_ldst_phys declarations from cpu-all.h
Date: Mon, 10 Mar 2025 21:08:26 -0700
Message-Id: <20250311040838.3937136-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are now accessible through exec/memory.h instead, and we make sure
all variants are available for common or target dependent code.

Move stl_phys_notdirty function as well.
Cached endianness agnostic version rely on st/ld*_p, which is available
through tswap.h.

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
index 78c4e0aec8d..ff3a06e6ced 100644
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


