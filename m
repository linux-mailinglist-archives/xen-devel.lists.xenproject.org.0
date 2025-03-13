Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FFA5FBFD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912886.1319097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaa-0001TM-OI; Thu, 13 Mar 2025 16:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912886.1319097; Thu, 13 Mar 2025 16:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaa-0001Pf-Ip; Thu, 13 Mar 2025 16:39:20 +0000
Received: by outflank-mailman (input) for mailman id 912886;
 Thu, 13 Mar 2025 16:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaZ-0000Wn-9p
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:19 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b30244ab-0029-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:39:15 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-225b5448519so23154885ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:17 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:15 -0700 (PDT)
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
X-Inumbo-ID: b30244ab-0029-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883956; x=1742488756; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=nlDlFNaXPwUQ9bca5ZtTmmM2Mr+TvmcY5rjkpAoAddd/HwM8TEAcpSKHFcC49mC3Wq
         msks4lSIcPxqkZdRmacAI8ABSlbP7UfM0cGv80sAsNuhaiS7i3McgFBXPbn8LnSydUg9
         Sl1rsN7gviAbh2ol2QN2lJbHOsnir8Ox3o6flbjauV5g4GDeRdNWwpBVkm1qBizZU+PH
         F1FGlCuEdY/KNp8v5dSQzDz5bpZdZeHH1d6mj+tqKPN+uRU/3PSVomIyeVQaRJHICjEw
         Q3SGIMaji0wnVwDNpUJ2HtDD3KdL7PzBggtHEhmMboE1ObAY7tMrCzM6X5zXc1tIYZUM
         CWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883956; x=1742488756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=lwK1DLY8Ezrfm8gklX8RtQuHWOva43MBwIzNwnEHeExt1GLCTAXDR8BMbuBejvN8Jl
         6/ZVIUoSw676MMqmYsLFVFtPmMUWFdCiRT4z0cp/NytrwvXHmcqwXTRRWd1svv3yyYON
         48vgMEYi+slWtHHyc2i2C48RjcikesshZHZ60cRbwlyh/TzcMqLjRV/alL9H2k/l9aQM
         LongZAs6xP105Lh5J20tcU20xz1r3cM/DTYO7qRiLGDI+UN/gZ6grtJlRAZObyAshIdE
         /HatGNmLSPeaNRw6nLmgPu+vwKH3H+skXz98xx2qrecVe47ccpsVMJM5yVm00s8rAQSY
         0SuA==
X-Forwarded-Encrypted: i=1; AJvYcCVZR2CTAkSvRa+hjAmrghpjX4VC1NnXiaRtMmtHACKjTuQzpCG40qiFHVqsMf3JK44TQ3HOasZzA8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxQOV5d1CBoSrUI5TTT/g5//QkotwIc6e51S/JSZTzYlVp1NAP
	O4MKH37QEXkI7cU4tA+T0z0BcPG077g6AbczzLSUatxRfg1q5F8N2hsOktKgdSc=
X-Gm-Gg: ASbGncujfYIju3Z+FBQXFYvvdSAU5Yr1lpAQWipS26LJ4BWGrlr0p9PUfIu6wI0sAeX
	ItEM/tjNT4T0W8Lci4JAGzwoFLgCmc1TO2DzI3Zw6F9XmW06nrLkP8mjjgzcKgtSBPKpE6piuWW
	E8QBxRo8IJtnN9jmMFlcVg43Y1PLHU0ZkZ8jtNp3B3G2BppNMHJ+UYZTWI06DGutUf/+HdGfAnU
	x0+td1Zisltr3fXf6ReBAOKLnjdOYv+sTM6W7xJA6qzPPwGD6awMfySjKMXu1pD/bT2pvX1q6FV
	lEVUE6UW8bOHpKGcykx3zwO/YPEEkWYjE9nqra+SZrS1
X-Google-Smtp-Source: AGHT+IFAP0qoR6ylfmeu0A0f1WgQyrtvhvjwp1bL3Fn8cTt6DHZC87LNZvbpID5iZRw0pqfiPur+Vg==
X-Received: by 2002:a17:90b:5688:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-3014e842f8emr264471a91.8.1741883956066;
        Thu, 13 Mar 2025 09:39:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 04/17] exec/memory_ldst_phys: extract memory_ldst_phys declarations from cpu-all.h
Date: Thu, 13 Mar 2025 09:38:50 -0700
Message-Id: <20250313163903.1738581-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


