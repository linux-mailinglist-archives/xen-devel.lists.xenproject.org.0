Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B10A74B64
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930668.1333329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0t-0007Ye-KR; Fri, 28 Mar 2025 13:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930668.1333329; Fri, 28 Mar 2025 13:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0t-0007TE-C5; Fri, 28 Mar 2025 13:44:47 +0000
Received: by outflank-mailman (input) for mailman id 930668;
 Fri, 28 Mar 2025 13:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0q-0005Dp-Su
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:44 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce7d7fcc-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:44 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1267620f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:43 -0700 (PDT)
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
X-Inumbo-ID: ce7d7fcc-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169484; x=1743774284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cQlbXBh+jcctTBYJ/pIz+f4SLnRiEo7nbWjXEuys/8=;
        b=FKNP22lmX5m2JJvtWLouYNOcz0bESBZ/pR10+FaQLTzStmVgDjqq/RLGeHCHM6DDV5
         kPcpx6xa4TF7U2z4Q/Hu7G7ffUcLMnpaCN3vB3llqkpOjAE2RZNXa139NDeiaKEFf9Ta
         BSeq44pZYn0ePvwm3gU58BawUrxtL9jInlnCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169484; x=1743774284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cQlbXBh+jcctTBYJ/pIz+f4SLnRiEo7nbWjXEuys/8=;
        b=WB1M76qlOJy29NrMBnGUtUUGXhqK224RJFz6vqrQTjQlVJmdvHJ2wySw9r3ZPC0Ltm
         hXufForckHXlpPYAPVAdIwaFJFp/KKhtz3qLiiyntumaUHvN7dP5x47lTn/xlJgWmXEl
         mNV5i/3VyNaEiySABOyUmU1pF9yb0gJjPGGuvVPnMJpvl8Iv8VbQwlVOL09Cp860Ltje
         kcC3dNfoRhJzJEPmOgXypU4OIu483oB+2VPNyMIR6hGQbOsXWbcoCQ0DDvU3/MgumsTr
         JCdvpQd/SSvgb/342rOxAxd+HNGp/SuSfXWbixEYbMVGVQEp/znsnsAR/p9IAragvU0s
         Nx7Q==
X-Gm-Message-State: AOJu0Yy1je+ttiT8VMLZj0b9HtuDRKV0dIJtr11bAF7L3OboOhJB8ebE
	g2KJ/JptTwMxnD5boN5SuB12l957PQldDrL5m/6lH5Hre1BP9T8+S44C/JOqknwm+bisFAfKo3X
	q7ig=
X-Gm-Gg: ASbGncu0JXMUQZmuNWeMoB7opxx/oNkOuyoyfOcDzbuolCJJsHPtOHFVMcD81Zf5W8o
	VxhLGrhRopOxRq7xhc0CTHWAahu+TfDrdWaiMpavvUVGdQ7BQoRLOnKUhvT/7Adw38nZI8tlSqg
	OIOn0DB6lUMZMFA3SSu2KK4fCL/hApZFsboipBJy7XTECbx/d29vUa/SDHeXdsRzZ/WkcH1S9ZK
	WxGWxBmzt1svSIDLow9xLZq8WG6rPfGpzlYHg9hV5JLh4StKw6fh8kb8JFUScK18xpp8dPnAvf4
	hcSFYdE6mipSn5glgDZVU5M4cej3TQ1lHGjA5BN8N7mT1qTLfa1m8VIIpjMCeJhC2uopJ2CWchh
	Fae+jL1nkbejcGt44Iw==
X-Google-Smtp-Source: AGHT+IHfBwU8lMEk844l2Bqv78P9pWpma6JZFdTv9M1m1XCQNrVjdpdQ4irRXoe4H6et0ztnnkknCw==
X-Received: by 2002:a5d:6dad:0:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39ad174b7e9mr6983573f8f.22.1743169483561;
        Fri, 28 Mar 2025 06:44:43 -0700 (PDT)
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
Subject: [PATCH v5 10/16] crypto/vmac: Switch to xen/byteswap.h
Date: Fri, 28 Mar 2025 13:44:21 +0000
Message-Id: <20250328134427.874848-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
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


