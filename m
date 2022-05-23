Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D9531168
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335919.560163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P8-0005gP-UI; Mon, 23 May 2022 14:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335919.560163; Mon, 23 May 2022 14:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P8-0005dJ-QV; Mon, 23 May 2022 14:51:30 +0000
Received: by outflank-mailman (input) for mailman id 335919;
 Mon, 23 May 2022 14:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt9P6-0004UK-Hj
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:51:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d17a142d-daa7-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 16:51:27 +0200 (CEST)
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
X-Inumbo-ID: d17a142d-daa7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653317487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PIpXZNS/tomnFn9AY0+D+Gnk6UU+fhiL/46ZWzyvQm8=;
  b=MGRhAP5OXJt6xl8G2bK6la+M9DHKvTaWzwkhH4xkWey3xb4dmw+2u+KA
   HeSOAzAS3zSO7TCbT5xeZckeWmhePcSLlzu4o2kSqbx/pkccnae273QjZ
   fuvcbQ4xg64EViT8NbYzzvqum2M28hd++otTvakhfJ6ngVr1Yva9jir+I
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74471696
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ofaYo6s6elBj5PFadrhYDeEoHOfnVEZeMUV32f8akzHdYApBsoF/q
 tZmKTiGPv/eMTb1c9F1PoS/oUoHsMeEn4U2SAs5qis9QnkS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi83BqnmnO4lSSJDGn1wJ5Jk35GWeEig5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllkzDefCfc7aZvCX7/L9ZlT2zJYasVmQqqCO
 JNHOGQHgBLoWz1gOnctJpUEvqTxi2bbahlHuXLKnP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqum+vOkCXTSI8UUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsRDNbdMYvssNwQDUwz
 0KIhPvgHzkpu7qQIU9x7Z/N82n0Y3JMazZfO2lUFmPp/uUPvqktthblStxbCpWuh4H7Aw7S5
 B7b9Rgh0uB7YdEw60mrwbzWq2vy+8OTFV5lvV+/snGNtV0gOtP8D2C8wR2CtKsbct7EJrWUl
 CJc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2dDB0wWir8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66JNYASPsQoLlferEmCgHJ8OEi0zSARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrcyC2Mq
 oY3H5bbkH13DbyhChQ7BKZOdDjm21BgXcCowyGWH8beSjdb9JYJUqCIkeJ5JtE8xcy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQisLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:JlnEpqrzAzBKtB1aWuE10fsaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrCMc6QxhI03I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdWSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="74471696"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: [PATCH v5 2/6] crypto/vmac: Simplify code with byteswap
Date: Mon, 23 May 2022 10:50:47 -0400
Message-ID: <7ba7fbb253220fd35d343490108245471ef4e735.1653314499.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653314499.git.lin.liu@citrix.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This file has its own implementation of swap bytes. Clean up
the code with xen/byteswap.h.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
----
 xen/crypto/vmac.c | 76 ++---------------------------------------------
 1 file changed, 3 insertions(+), 73 deletions(-)

diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
index 294dd16a52..acb4e015f5 100644
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
2.27.0


