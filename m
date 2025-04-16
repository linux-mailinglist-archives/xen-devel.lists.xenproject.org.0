Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25EA8B801
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955723.1349395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QB-00081r-0l; Wed, 16 Apr 2025 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955723.1349395; Wed, 16 Apr 2025 11:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QA-0007vP-Ou; Wed, 16 Apr 2025 11:59:14 +0000
Received: by outflank-mailman (input) for mailman id 955723;
 Wed, 16 Apr 2025 11:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q8-0006At-2e
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:12 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b8e1c9-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:11 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so36615465e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:11 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:10 -0700 (PDT)
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
X-Inumbo-ID: 35b8e1c9-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804751; x=1745409551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cQlbXBh+jcctTBYJ/pIz+f4SLnRiEo7nbWjXEuys/8=;
        b=lXXD77ZcIERhAsGh5hG8mK44eQn1UmhgNaNWXEcW/33X5b606jSGwD2LmAZy9ujspc
         O4ZepxM8M0qwliCToB97bpaHWPFSWCFgSUgw5ows5s+L3g5BclYyEIdeS6jQgGkErHti
         ZBa6ok9TQ8E0IdsO40oYMNp/WC7yWspUrSRMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804751; x=1745409551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cQlbXBh+jcctTBYJ/pIz+f4SLnRiEo7nbWjXEuys/8=;
        b=nP7nhembtEy9z6KVg31ncutJREKcZ77NLrggPye2+Ho7UFwGRKmfGrZIMPYlSEXnwg
         0LSvpeVkt3cAD6/sk9aD7ozMla3NQd/6jSQ30kwIwDT4tpXkOVDHnzxM6iVUcXdEXGou
         sRQSGEN7xGGQzJNLviI0UA69MVUtDHEP83IbC6UAAMM7X1DVgGVNEbTvfNcBSEBeGNz1
         Q5xnc2VqHBGGZd+OJ+XPwOkAaQelPit3jaGQRdlBTdigntpKcOXzTtNtgGw2RGIhwD/f
         2i/dptsai/qE/kQZcFruso26oaMhFBGYHtUnXU8CB0rxOP1LdppBiQpyoszIlHUT/2eP
         R21Q==
X-Gm-Message-State: AOJu0YxRLgu9kacbu0X/9kf1uWhKqj0ItfntJjajV1vM8j4HtjiA59Ce
	Nc097ccjeuV2fZVku3FgLqGKL/4iBF9IhHnCCHLAJqHDALCwOf2+h7M++HoaYIcdllgs6pKejtp
	iAYw=
X-Gm-Gg: ASbGncuFMLTzH7B6wrBWSwgIrUhD6NrKTvdN88YoffS1uyXbCLG0ct3B06CjTvzl1UH
	nXTGR9u1F/+dYxf/iKrI0Pd4Knh2jxV2Dlbm9k0PMPI7o7Zi9VP1GmvQLpx3P3GJCBvGWaRI80N
	A3VeOwhdaUj65mdtK6DmDxGOFrWx53qcc8RmAkbD67bIPocwDHqOWDsYmzDJf0zt090FTKEhF+9
	cHcNs7gUydthTvy2OkNlUBQ1h/n26SOFtYNXei69fTrboN2HPNOnCEkRUvk2IMolJLQYuyxFvPF
	LPtf9d/MSLXd5mDpBd0Ud5hOvK3DDijr29+NytF4jFxGbX0VXbjwv6zvEvB003VP1TdxT94Dpj5
	N4voUj31XvMFSPQ==
X-Google-Smtp-Source: AGHT+IEQr/bFhOlIxFrn6N+gU79fSmgCSfPoLHNQh2npqot1KwxFoJoszSP6kTUcs2rVUNWncmcX0Q==
X-Received: by 2002:a05:600c:5102:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-4405d6276cfmr17791185e9.16.1744804750974;
        Wed, 16 Apr 2025 04:59:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Lin Liu <lin.liu@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 09/15] crypto/vmac: Switch to xen/byteswap.h
Date: Wed, 16 Apr 2025 12:58:54 +0100
Message-Id: <20250416115900.2491661-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lin Liu <lin.liu@citrix.com>

This file has its own implementation of swap bytes. Clean up
the code with xen/byteswap.h.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>
---
 xen/crypto/vmac.c | 76 ++---------------------------------------------
 1 file changed, 3 insertions(+), 73 deletions(-)

diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
index 294dd16a52cb..acb4e015f511 100644
--- a/xen/crypto/vmac.c
+++ b/xen/crypto/vmac.c
@@ -8,6 +8,7 @@
 
 /* start for Xen */
 #include <xen/init.h>
+#include <xen/byteswap.h>
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <crypto/vmac.h>
@@ -50,7 +51,6 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
  * MUL64: 64x64->128-bit multiplication
  * PMUL64: assumes top bits cleared on inputs
  * ADD128: 128x128->128-bit addition
- * GET_REVERSED_64: load and byte-reverse 64-bit word  
  * ----------------------------------------------------------------------- */
 
 /* ----------------------------------------------------------------------- */
@@ -68,22 +68,6 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 
 #define PMUL64 MUL64
 
-#define GET_REVERSED_64(p)                                                \
-    ({uint64_t x;                                                         \
-     asm ("bswapq %0" : "=r" (x) : "0"(*(uint64_t *)(p))); x;})
-
-/* ----------------------------------------------------------------------- */
-#elif (__GNUC__ && __i386__)
-/* ----------------------------------------------------------------------- */
-
-#define GET_REVERSED_64(p)                                                \
-    ({ uint64_t x;                                                        \
-    uint32_t *tp = (uint32_t *)(p);                                       \
-    asm  ("bswap %%edx\n\t"                                               \
-          "bswap %%eax"                                                   \
-    : "=A"(x)                                                             \
-    : "a"(tp[1]), "d"(tp[0]));                                            \
-    x; })
 
 /* ----------------------------------------------------------------------- */
 #elif (__GNUC__ && __ppc64__)
@@ -103,37 +87,6 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 
 #define PMUL64 MUL64
 
-#define GET_REVERSED_64(p)                                                \
-    ({ uint32_t hi, lo, *_p = (uint32_t *)(p);                            \
-       asm volatile ("lwbrx %0, %1, %2" : "=r"(lo) : "b%"(0), "r"(_p) );  \
-       asm volatile ("lwbrx %0, %1, %2" : "=r"(hi) : "b%"(4), "r"(_p) );  \
-       ((uint64_t)hi << 32) | (uint64_t)lo; } )
-
-/* ----------------------------------------------------------------------- */
-#elif (__GNUC__ && (__ppc__ || __PPC__))
-/* ----------------------------------------------------------------------- */
-
-#define GET_REVERSED_64(p)                                                \
-    ({ uint32_t hi, lo, *_p = (uint32_t *)(p);                            \
-       asm volatile ("lwbrx %0, %1, %2" : "=r"(lo) : "b%"(0), "r"(_p) );  \
-       asm volatile ("lwbrx %0, %1, %2" : "=r"(hi) : "b%"(4), "r"(_p) );  \
-       ((uint64_t)hi << 32) | (uint64_t)lo; } )
-
-/* ----------------------------------------------------------------------- */
-#elif (__GNUC__ && (__ARMEL__ || __ARM__))
-/* ----------------------------------------------------------------------- */
-
-#define bswap32(v)                                                        \
-({ uint32_t tmp,out;                                                      \
-    asm volatile(                                                         \
-        "eor    %1, %2, %2, ror #16\n"                                    \
-        "bic    %1, %1, #0x00ff0000\n"                                    \
-        "mov    %0, %2, ror #8\n"                                         \
-        "eor    %0, %0, %1, lsr #8"                                       \
-    : "=r" (out), "=&r" (tmp)                                             \
-    : "r" (v));                                                           \
-    out;})
-
 /* ----------------------------------------------------------------------- */
 #elif _MSC_VER
 /* ----------------------------------------------------------------------- */
@@ -154,11 +107,6 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
         (rh) += (ih) + ((rl) < (_il));                               \
     }
 
-#if _MSC_VER >= 1300
-#define GET_REVERSED_64(p) _byteswap_uint64(*(uint64_t *)(p))
-#pragma intrinsic(_byteswap_uint64)
-#endif
-
 #if _MSC_VER >= 1400 && \
     (!defined(__INTEL_COMPILER) || __INTEL_COMPILER >= 1000)
 #define MUL32(i1,i2)    (__emulu((uint32_t)(i1),(uint32_t)(i2)))
@@ -219,24 +167,6 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
     }
 #endif
 
-#ifndef GET_REVERSED_64
-#ifndef bswap64
-#ifndef bswap32
-#define bswap32(x)                                                        \
-  ({ uint32_t bsx = (x);                                                  \
-      ((((bsx) & 0xff000000u) >> 24) | (((bsx) & 0x00ff0000u) >>  8) |    \
-       (((bsx) & 0x0000ff00u) <<  8) | (((bsx) & 0x000000ffu) << 24)); })
-#endif
-#define bswap64(x)                                                        \
-     ({ union { uint64_t ll; uint32_t l[2]; } w, r;                       \
-         w.ll = (x);                                                      \
-         r.l[0] = bswap32 (w.l[1]);                                       \
-         r.l[1] = bswap32 (w.l[0]);                                       \
-         r.ll; })
-#endif
-#define GET_REVERSED_64(p) bswap64(*(uint64_t *)(p)) 
-#endif
-
 /* ----------------------------------------------------------------------- */
 
 #if (VMAC_PREFER_BIG_ENDIAN)
@@ -247,9 +177,9 @@ const uint64_t mpoly = UINT64_C(0x1fffffff1fffffff);  /* Poly key mask     */
 
 #if (VMAC_ARCH_BIG_ENDIAN)
 #  define get64BE(ptr) (*(uint64_t *)(ptr))
-#  define get64LE(ptr) GET_REVERSED_64(ptr)
+#  define get64LE(ptr) bswap64(*(uint64_t *)(ptr))
 #else /* assume little-endian */
-#  define get64BE(ptr) GET_REVERSED_64(ptr)
+#  define get64BE(ptr) bswap64(*(uint64_t *)(ptr))
 #  define get64LE(ptr) (*(uint64_t *)(ptr))
 #endif
 
-- 
2.39.5


