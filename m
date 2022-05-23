Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10E530C6B
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335658.559857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k6-0003Qt-Bc; Mon, 23 May 2022 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335658.559857; Mon, 23 May 2022 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k6-0003Ip-6l; Mon, 23 May 2022 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 335658;
 Mon, 23 May 2022 09:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4k4-0002dp-3K
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 182efc9e-da7e-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 11:52:45 +0200 (CEST)
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
X-Inumbo-ID: 182efc9e-da7e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PIpXZNS/tomnFn9AY0+D+Gnk6UU+fhiL/46ZWzyvQm8=;
  b=CzZPOP/xt3g7MVprCG/6/Q6FBMqKgUlrOx/69ekjQmRVXp3PqvZ69z0a
   mjxFjYN7VE5VJP4r/A//mdoaDoWEdp6AaKK5aTDDzniGnu40srDrJk+F4
   1KIzeCIZ3imrWpJgqCM842/eJ/X40WhDrEA450qaJj8MDtBUJzED7zFhL
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74445149
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LmU+9auhBGPlsTlAxMhLRG8udufnVEdeMUV32f8akzHdYApBsoF/q
 tZmKWCBM/2LYDake9l1atm2o0tXupLXzNNkHgZkqS8zQy1H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8ZGIfXo/Q5bSJXKC4kE790wJn6eymg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllkzDefCfc7aZvCX7/L9ZlT2zJYasVmQqqCO
 5dANWsHgBLoeB5EPmUQK8oEsdyhgHr5TxdBlxWxnP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqum+vOkCXTSI8UUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsRDNbdMYvssNwQDUwz
 0KIhPvgHzkpu7qQIU9x7Z/N82n0Y3JMazZfO2lUFmPp/uUPvqkDqDjUdcZHLpW6tdKvNyPC+
 xa39nkh0uB7YdEw60mrwbzWq2vy+8OTFV5lvV+/snGNtV0gOtP8D2C8wR2CtKsbct7EJrWUl
 CJc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2dDB0wWir8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66JNYASPsQoLlferEmCgHJ8OEi0zSARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrcyC2Mq
 oY3H5bbkH13DbyhChQ7BKZOdDjm21BgXcCowyGWH8beSjdb9JYJUK+Aneh7ItU690mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:iFmkQqolqa4LfMCLd2rCiLgaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="74445149"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: [PATCH v4 2/6] crypto/vmac: Simplify code with byteswap
Date: Mon, 23 May 2022 05:52:18 -0400
Message-ID: <da0314745a32d3db4efca6d12e65b0477c08e504.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653295437.git.lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
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


