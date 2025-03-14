Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDBA617B8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914971.1320632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t3-0003sr-0k; Fri, 14 Mar 2025 17:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914971.1320632; Fri, 14 Mar 2025 17:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t2-0003ny-Qb; Fri, 14 Mar 2025 17:31:56 +0000
Received: by outflank-mailman (input) for mailman id 914971;
 Fri, 14 Mar 2025 17:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t1-0000xy-1I
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:55 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 364f078a-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:51 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2232aead377so53466945ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:51 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:49 -0700 (PDT)
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
X-Inumbo-ID: 364f078a-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973509; x=1742578309; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=RPGjC7gs8GTHNpxWHD/FaJX63VphE9wwtO5FlkiiHbgEVnz9ApA3mq2o8jDlbWEaMD
         1h4PJhmP1da/RMK0ngfYJtXlsH8x3vpOdv6f3wVkcAbDZpIDK1+6Kl6EilsNijw9uZdn
         c6pV4HJaLqIapDmCBVNlnVPkxayTO3Jl5wROGcrPW0sOe8dEpI92J3KpbiLh6tBPasmn
         89KTC0A4BbWqaZriobp4iZY/rS3nUdZCVESbWM+O2xQlLJfftgGIWVCLDBZjvLcBD7+2
         2yF/BhBYlAzCY5hmL6Clf3Cwv4soSI1u5c5CkvOXXCqqZKT8ZzWZw4WT0Yv881EFa/mW
         p/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973509; x=1742578309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=RC/9Ph0hO85vneEYSTSxR2R8KfEjsGQ5bXfBdxQWfRbNoiq6s0KopDGsYA64P7XEt8
         T4kEOy+uKDwUZ+NaVuJDlGGDH4sHE94z+nnphiHKLG7JodQDt+e7ZD7b1tSXlR0SBQoM
         Unedok2YcDgh8dLDU1tfICWY5wvA28Vzx+84REI1C/CF5drSuiHrkV1RYk/b7x24RS+X
         1x7ljkzroY0nq7nAzpQSW2NmFotoEykfPFLuUpnM0dAKyHiwQ6ljDPUtWYs17jTkTFrY
         0hdC+o1Zo4Y5wDIIIz0PzcbmyuhBRr5z98jpB/EFy+6sOLfG8V5/n1/WDpCWLvvj0Maz
         ovYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNn2oKb2Ml55R1w6Wwy+zoYyZlBoiWqk7ub7mD5Gi3sMTo+vcTfPS2xcgvuRpzknLXky3cAsVQhzE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2kDItZogCcZrV7d5GH3o6EkTlY0vyxxHKZwYkYC3RnBqfj5sO
	TKkiazoMTAFIQ9AZ+7ti9J4M9xeGXGUq67COC5JZn+f4FS09mpIjc+jQzE6LwKU=
X-Gm-Gg: ASbGncs8AQEPVAM8yRQcjqkxIYXkWH9pEVYbY+M5pWN9QXpH669sh9Ijuzv4F7AZE7Q
	YksuVSmL52jl0UBwgt3OLr1yUgarb5b95qlQcTIMEMhAdrUAJiuroGKr5tMiqhZVKvOxfHxHsjq
	RRxMGtwbJlxShz5uQTChedhPJq+nPdTAUaE0jHAOqSCdkNG/mH/IXZ3qAlJfRAYK+BeVVJ303Uv
	evBrsEfD1d8+7CZGI5hHshL40CjxhZkIV0fO5KDgnaUX8bWCtw+qu/KBbqyrU7ms9t6uTJHZqBJ
	a0X64A4MI46PkiTcfPHmujVCo2YyA15aBBleW25dfjI5
X-Google-Smtp-Source: AGHT+IFQBeqqn3ezA5En8rRFWwDRdkhHWJ51dC4tNWFcY4zpXwmWJXk93HseKx7PQbRLNq1zxfYk9w==
X-Received: by 2002:a05:6a21:1519:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-1f5c10f7d60mr6252806637.7.1741973509576;
        Fri, 14 Mar 2025 10:31:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 04/17] exec/memory_ldst_phys: extract memory_ldst_phys declarations from cpu-all.h
Date: Fri, 14 Mar 2025 10:31:26 -0700
Message-Id: <20250314173139.2122904-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


