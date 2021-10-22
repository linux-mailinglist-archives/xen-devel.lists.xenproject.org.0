Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803CE4375B0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214954.373891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds63-00084q-3p; Fri, 22 Oct 2021 10:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214954.373891; Fri, 22 Oct 2021 10:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds62-0007zU-U5; Fri, 22 Oct 2021 10:48:22 +0000
Received: by outflank-mailman (input) for mailman id 214954;
 Fri, 22 Oct 2021 10:48:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds61-00063m-Sc
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21720d4b-1c5e-4ff2-abb1-670f19cdc7f6;
 Fri, 22 Oct 2021 10:48:07 +0000 (UTC)
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
X-Inumbo-ID: 21720d4b-1c5e-4ff2-abb1-670f19cdc7f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bfisxychtO/D4CCkbsgtm3RJ+Fi6Cv0nOU8o5cia1XU=;
  b=BcJzWJPeRZQgwteUcwD8rFvKcckb+Gx5UYJSCD1P7/G5YoBea8xEvjWI
   L91EPz1G6pFi5YeF84PryIHSYN/Bp66ofrHcjZtZAAJ2cNkUlt1fVinnu
   mZQXUFUiZV3ZK+RXAEY6xv7dNaexbmvGtltR88UVezCk/ZXzLlSFf9yxi
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cE3i5g0JyT38eH7D6JiAjqPsCSe1+kOq1dm5/wDz28TF8TagMmd0W9E9YOUmGFQ3UKXIbCpIba
 gKCXuaIhx0x7XPoq/zDzvNsIuqzjWoDdBLnlUPrqf6vLHkro4f4QRNK/xmclcOKSknCYoE1a4K
 x3hzLZyenWSRW4JrhXVGbzmWVeKHcSKAjdTtayf5k1JsI5rbO6Pk9yOBSpwpSp7dWNZNbWO7+H
 8oiB7JbhunwacKZiLP65PeTtxiViUAl27srwWVTGZwro6HqLPBQECu1Z1lbMFsvQxd2rkjLNks
 iZfvCyv0+LXCC4+Q2hptAIvr
X-SBRS: 5.1
X-MesageID: 55807252
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:88jFLaO2xRsFxBrvrR0hkMFynXyQoLVcMsEvi/4bfWQNrUom0WcAy
 GEeXTqFM/2JM2X0ft1wb43n/EJSvJCAmt9mGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ug5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozvS3Ml19
 c0Uj7qfECFwGqTKmfsSXTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/Yu1tgIInLdTDN4IDoHBwizreCJ7KRLieHvWSuoUFhl/cgOhEE6/8S
 epGcQZyRzKeTV4XfUY0GJYXybLAan7XLGQD9QP9SbAMy3PI0AV73bzpMdzUUt+HX8NYmgCfv
 G2u12bkBhAXMvSPxDzD9Wij7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3E20TPHtUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhT3pejEREHdbXwkrFC1cx9DloZ48gDuaG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2nz/saRH2bZ8i2SBzj/tlooO+ZJcqTxsQCDhcusOrp1WbVoU
 JIsoMOZ8PwVRa+EkCiAUY3h95n4uq7bblUwbbNpdqTNFghBGVb/Iui8AxkkfS+F1/ronxezP
 Cc/XisKvPdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxXMjzy0zxh0yvxuU
 Xt+TSpKJSxGYUiA5GHuL9rxLJdxnnxurY8tbcCTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4EX/ZmPy53CbWkCgGOqNZ7BQlTcRATWMCnw+QKJ7XrClc3Rwkc5wr5nOpJl3pNxP8OyI8lP
 xiVBydl9bYIrSSWcFvQMik+MO+HsFQWhStTABHA9G2AgxALCbtDJo9GH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:YzSfE6ljPtNM2bxtlocEAke+QtfpDfIW3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE8Qr5OUtQ4uxoV5PwIk80maQb3WBVB8bHYOCEghrPEGgB1/qB/9SIIUSXnYQxuZ
 uIMZIOb+EYZWIK9foSizPZLz9P+re6GdiT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55807252"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/7] crypto/vmac: Simplify code with byteswap.h
Date: Fri, 22 Oct 2021 10:47:23 +0000
Message-ID: <97aca2e39ff1eefdab1e0b3440929958e4b99892.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This file has its own implementation of swap bytes. Clean up
the code with xen/byteswap.h.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
---
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


