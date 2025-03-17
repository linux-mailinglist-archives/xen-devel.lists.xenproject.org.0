Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCEFA65CAD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917740.1322586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFII-0007Jf-Qb; Mon, 17 Mar 2025 18:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917740.1322586; Mon, 17 Mar 2025 18:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFII-0007Fi-Kg; Mon, 17 Mar 2025 18:34:34 +0000
Received: by outflank-mailman (input) for mailman id 917740;
 Mon, 17 Mar 2025 18:34:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIG-0006uj-NW
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:32 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76a7a811-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:31 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2239c066347so99589355ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:30 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:29 -0700 (PDT)
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
X-Inumbo-ID: 76a7a811-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236469; x=1742841269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=bN9fZZZM183D0k2xkDDebS2LedkOj+ArNIJotQJEyqUMoNN6eXdsJmzvL/5BsrfMu8
         ntn3iHkWIm9UPZpjrhihhyDWH2YqCIXWWp+xi3vbPsJVwwyB1tRc3dldkawUKvjqN7CN
         +YffPP7qL95Ss489MHDMijv0z7ZvYt80mu00PQPmI3WVXgoCgG2sOwnMwvWn+8iNO1zL
         qmVEMQrWlWCPNyuxLy9uMuuXj5rhQYq5FBM2lHG4/JkJa0Z8Y2jhKCoyjfjjbU/e2++T
         Ct22kVU1uRRojc4nx68uYHYo2X86tWD+W2IA5UXO5cPJGuMQOSCCoFDUvR9nlzx5n4/W
         lbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236469; x=1742841269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6OuFeXnonCJBRRaCKlE2hD3nLeAbwsquVgoLJADjfc=;
        b=mYx0EhjAb9Ls2FaLKLLKQwO2YCk1CrO0rVZOEFcCGkjGHjOcoiXILwQ0mKbSr+wRE3
         ohi7kB0qwzcCD7dd9gH63yX5cl2kBtmZ/iKaWcVRTKUnCjt1lpAM7htAhHVTCdih91tu
         xqf57KkOM/3eMXaVKTvWl4J/dB30njdpDZxRnzmkJGVkCo8sppcns2tY44L8TRtk4EP4
         oXTpUQRaIYHykA2GCf8gHk4m8H6DETYZ4KrMYxCVIRZm3/MOOe8YXw66eVKNz6dLW6qI
         3ZP5wKMhBoBgKyV9ERR7wORpJJGq4SQjsFujKs8CXDEyRiLv555Hp11ivwjXffA7wo1e
         CTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj+G1psEb+GEob1kMy5HVNAFa2ESbmxgAL45KbDDUtW1voHlcjXAeJTD//NU4ZX1xKxPXRidlLywA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOmXws10BY9X+W7yLd+3Kl6LUisfkclIFktFPwLTjgnS4nVhm5
	efqhxCkM+7PjtEjVq3aqjvuE2v2BMm1XtTzc0fgfg7GObarS8OS3jGfI5CkQqj4=
X-Gm-Gg: ASbGncvHCL+TQZMUcCUu5gF91Img3zBdhHCA5366K1tzcYiIEJO5sUtXLW9ATypyBhO
	74Elkmu3MINB+6fQ6Gv6IgroaRr0jDQxB14FwmGhDA2gwkAICUVdKDfC9zU+a7rIzmRgVD4DlQ4
	vLiNstBl/wMH8Q72lNPZ6wO0JUheLkCkgkveKZktqQjiScyNReobXc8dwH8yL8TkEo9C5mUX1Qu
	Dp2nBg4nAHicfd+Ll1n88cQUyMh18J2iuoE68yLsxBXF6Ka0dFB5PcSToc/G6xfOZm2Oxis1etN
	63jyLTBm+6znOIBVRe1L76okd6zQ2nyaBHihHlPCEeaC
X-Google-Smtp-Source: AGHT+IEuktxGhHzx6xs3EGzvKgpAVns4GkbvMlee+9okZ79gnYJTq9xN+P/LP5FdgPO0zhqsq/U9Fw==
X-Received: by 2002:a05:6a00:1916:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-7372240f242mr14927867b3a.16.1742236469458;
        Mon, 17 Mar 2025 11:34:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 04/18] exec/memory_ldst_phys: extract memory_ldst_phys declarations from cpu-all.h
Date: Mon, 17 Mar 2025 11:34:03 -0700
Message-Id: <20250317183417.285700-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


