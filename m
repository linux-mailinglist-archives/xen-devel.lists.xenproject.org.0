Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7742EA1E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 09:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209801.366355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHcr-0000IG-Qa; Fri, 15 Oct 2021 07:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209801.366355; Fri, 15 Oct 2021 07:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHcr-0000Ft-NS; Fri, 15 Oct 2021 07:27:33 +0000
Received: by outflank-mailman (input) for mailman id 209801;
 Fri, 15 Oct 2021 07:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCqZ=PD=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mbHcr-0000Fn-1U
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 07:27:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12563e6c-b76b-44f5-b486-98341f19b5b9;
 Fri, 15 Oct 2021 07:27:30 +0000 (UTC)
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
X-Inumbo-ID: 12563e6c-b76b-44f5-b486-98341f19b5b9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634282850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G17h/67QdOusbfGQ+sz1UjeNH3vHEsbkQv5h0AgCDVo=;
  b=dLKXlI7b4kkc/zohWYIvkUqulCEg19PW7GsJUVsS23DMkK+DgXcqZ/H3
   Sj1QwHaX6lSQr4oRR4tQ3QwWk77RGrQ6AFkZu3DWse0yE2T1RaehVfh4j
   tZnwItgi/6c+WMFzcd++kOlLhvASZ9m0lz29doYXMr2WIZIDBxRzAttm1
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2rii4GPjgz2KYojilzVWsjmYgpchkTqBq3ssPa/EXXXVQ4lieqFDqlJpZcxgepz2H/Sf+GCmJw
 LU+TzuGNyXy0/ob4q7zRh4547ClC/YwlR1G8naGs7q60KVLDYWVCuwkU+fvWLu3OlHqNc68iOo
 N2ZtvrLl/ycAkFPin9IKYpZOQI12EoMnokGiHCgOkKJawSwr3Jagh/t80Q6T06usiO7zg02NWN
 1R6JUrWzkTkPiXcuoYCR+IGaOLn1VpUp+uCnoDYk4+dKD6bkK9g5dORG7W4J0YdCI5fbza1qIB
 IkVVsVf1ZxdhzeLPQlhgV9bl
X-SBRS: 5.1
X-MesageID: 55294408
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vZkcJKksef0+p8jPt1pajGvo5gwlIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDG/Xbv2PYzGkeYt0YIi+oR5Q7Z+Gz9dkTVds/3s8ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tc12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NYcpIebeVwWBL3j3+05UEVfCg11H6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBM3qOsUbu2xIxjDFF/c2B5vERs0m4PcFgW1h2pwWTZ4yY
 eI+OAJqa0zyXiFsPwk9L80vsNuBpUDWJmgwRFW9+vNsvjm7IBZK+LvqNsDcdpqVRMFWtkGCr
 2nC8iLyBRRyHN6CzTuI9Fq8i+mJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/vXAjhovKyQWGiq3L6epjOvOgAYNWYHIyQDSGM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6ir3kvnJ4j1vExx4r89HTE3zW1ipPrQVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJfGsrhfZX2ZvGnUGr9VReD2jxqQGGSE2QYHInU3y9i6F5dPl6hr6zZiOFwhDM8AfTL4C
 KM4kVIMvMENVJdGgKkeXm5QNyjI5fS/fTgGfqqNBjarXnSXXFTalM2JTRTBt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNHsyhlE78jOPOPiD9pVI53L2mNb1RAESs+129z
 jqiH5HSl0U3vBPWM0E7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4Pr7I+k6QtF
 KdYIq1twJ1nE1z6xtjUVrGlxKQKSfhhrV7m0/ONbGdtcph+aRbO/9O4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFcotJZUHh0Il2MCit3PU5FN4BdEfYzTyA2
 gfIXRpB/bvRo5U4+cXijLyfq9v7CPN3G0dXRjGJ7bu/OSTA0HCkxItMDLSBcTzHDTum86S+f
 +RFifr7NaRfzlpNtoN9FZdtzL4/uISz9+MLkFw8ESySPVqxC75mLn2X5uV1t/VAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSBhXAPLLZxN495k
 +4ttNRPtl66gxsudN2HkjpV5yKHKXlZC/crsZQTAYnKjAs3yw4dPcyAW3GuuJzfOc9RNkQKI
 yOPgPuQjrtR8UPObn4vGCWfxuFan5kP5EhHwVJqy45lQTYZaivbBCFszAk=
IronPort-HdrOrdr: A9a23:nyS6E6qx96seHCkZA94/1IkaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55294408"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
	<andrew.cooper3@citrix.com>, <George.Dunlap@eu.citrix.com>,
	<ian.jackson@eu.citrix.com>, <jbeulich@suse.com>, <konrad.wilk@oracle.com>,
	<wl@xen.org>, <roger.pau@citrix.com>, Lin Liu <lin.liu@citrix.com>
Subject: [PATCH 1/1] xen/include/xen/byteorder: Re-implement bswap/swab with compiler builtin functions
Date: Fri, 15 Oct 2021 07:26:17 +0000
Message-ID: <ed4f3f82cc2989ebf52425aead420014fbe00bf7.1634282259.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634282259.git.lin.liu@citrix.com>
References: <cover.1634282259.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Current implementation of bswap/swab is overhaul which involves
byte operations, compilers has builtin functions can help to
simply the implementation
* GCC: https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
* Clang: https://clang.llvm.org/docs/LanguageExtensions.html

This commit replace the implementation with compiler builtins

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
 xen/arch/arm/arm64/lib/find_next_bit.c    |   8 +-
 xen/include/asm-x86/byteorder.h           |  25 ----
 xen/include/xen/byteorder/big_endian.h    |  12 --
 xen/include/xen/byteorder/little_endian.h |  12 --
 xen/include/xen/byteorder/swab.h          | 164 ++--------------------
 5 files changed, 19 insertions(+), 202 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/find_next_bit.c b/xen/arch/arm/arm64/lib/find_next_bit.c
index 17cb176266..c03eb9d175 100644
--- a/xen/arch/arm/arm64/lib/find_next_bit.c
+++ b/xen/arch/arm/arm64/lib/find_next_bit.c
@@ -167,9 +167,9 @@ EXPORT_SYMBOL(find_first_zero_bit);
 static inline unsigned long ext2_swabp(const unsigned long * x)
 {
 #if BITS_PER_LONG == 64
-	return (unsigned long) __swab64p((u64 *) x);
+	return (unsigned long) swab64p((u64 *) x);
 #elif BITS_PER_LONG == 32
-	return (unsigned long) __swab32p((u32 *) x);
+	return (unsigned long) swab32p((u32 *) x);
 #else
 #error BITS_PER_LONG not defined
 #endif
@@ -179,9 +179,9 @@ static inline unsigned long ext2_swabp(const unsigned long * x)
 static inline unsigned long ext2_swab(const unsigned long y)
 {
 #if BITS_PER_LONG == 64
-	return (unsigned long) __swab64((u64) y);
+	return (unsigned long) swab64((u64) y);
 #elif BITS_PER_LONG == 32
-	return (unsigned long) __swab32((u32) y);
+	return (unsigned long) swab32((u32) y);
 #else
 #error BITS_PER_LONG not defined
 #endif
diff --git a/xen/include/asm-x86/byteorder.h b/xen/include/asm-x86/byteorder.h
index 1f77e502a5..9c26b815b9 100644
--- a/xen/include/asm-x86/byteorder.h
+++ b/xen/include/asm-x86/byteorder.h
@@ -4,31 +4,6 @@
 #include <asm/types.h>
 #include <xen/compiler.h>
 
-static inline __attribute_const__ __u32 ___arch__swab32(__u32 x)
-{
-    asm("bswap %0" : "=r" (x) : "0" (x));
-    return x;
-}
-
-static inline __attribute_const__ __u64 ___arch__swab64(__u64 val)
-{ 
-    union { 
-        struct { __u32 a,b; } s;
-        __u64 u;
-    } v;
-    v.u = val;
-    asm("bswapl %0 ; bswapl %1 ; xchgl %0,%1" 
-        : "=r" (v.s.a), "=r" (v.s.b) 
-        : "0" (v.s.a), "1" (v.s.b)); 
-    return v.u;
-} 
-
-/* Do not define swab16.  Gcc is smart enough to recognize "C" version and
-   convert it into rotation or exhange.  */
-
-#define __arch__swab64(x) ___arch__swab64(x)
-#define __arch__swab32(x) ___arch__swab32(x)
-
 #define __BYTEORDER_HAS_U64__
 
 #include <xen/byteorder/little_endian.h>
diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
index 40eb80a390..4d43d9b7b8 100644
--- a/xen/include/xen/byteorder/big_endian.h
+++ b/xen/include/xen/byteorder/big_endian.h
@@ -11,18 +11,6 @@
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
 
-#define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
-#define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
-#define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
-#define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
 #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
index 4955632793..29b0bd2d5c 100644
--- a/xen/include/xen/byteorder/little_endian.h
+++ b/xen/include/xen/byteorder/little_endian.h
@@ -11,18 +11,6 @@
 #include <xen/types.h>
 #include <xen/byteorder/swab.h>
 
-#define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
-#define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
-#define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
-#define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
 #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
 #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
 #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
diff --git a/xen/include/xen/byteorder/swab.h b/xen/include/xen/byteorder/swab.h
index b7e30f0503..babdbe2387 100644
--- a/xen/include/xen/byteorder/swab.h
+++ b/xen/include/xen/byteorder/swab.h
@@ -10,166 +10,32 @@
  *    to clean up support for bizarre-endian architectures.
  */
 
-/* casts are necessary for constants, because we never know how for sure
- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
- */
-#define ___swab16(x)                                    \
-({                                                      \
-    __u16 __x = (x);                                    \
-    ((__u16)(                                           \
-        (((__u16)(__x) & (__u16)0x00ffU) << 8) |        \
-        (((__u16)(__x) & (__u16)0xff00U) >> 8) ));      \
-})
-
-#define ___swab32(x)                                            \
-({                                                              \
-    __u32 __x = (x);                                            \
-    ((__u32)(                                                   \
-        (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |          \
-        (((__u32)(__x) & (__u32)0x0000ff00UL) <<  8) |          \
-        (((__u32)(__x) & (__u32)0x00ff0000UL) >>  8) |          \
-        (((__u32)(__x) & (__u32)0xff000000UL) >> 24) ));        \
-})
+#define __swab16(x)  (__builtin_bswap16(x))
 
-#define ___swab64(x)                                                       \
-({                                                                         \
-    __u64 __x = (x);                                                       \
-    ((__u64)(                                                              \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(__x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(__x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0xff00000000000000ULL) >> 56) ));   \
-})
+#define __swab32(x)  (__builtin_bswap32(x))                                         \
 
-#define ___constant_swab16(x)                   \
-    ((__u16)(                                   \
-        (((__u16)(x) & (__u16)0x00ffU) << 8) |  \
-        (((__u16)(x) & (__u16)0xff00U) >> 8) ))
-#define ___constant_swab32(x)                           \
-    ((__u32)(                                           \
-        (((__u32)(x) & (__u32)0x000000ffUL) << 24) |    \
-        (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |    \
-        (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |    \
-        (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))
-#define ___constant_swab64(x)                                            \
-    ((__u64)(                                                            \
-        (__u64)(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56) ))
-
-/*
- * provide defaults when no architecture-specific optimization is detected
- */
-#ifndef __arch__swab16
-#  define __arch__swab16(x) ({ __u16 __tmp = (x) ; ___swab16(__tmp); })
-#endif
-#ifndef __arch__swab32
-#  define __arch__swab32(x) ({ __u32 __tmp = (x) ; ___swab32(__tmp); })
-#endif
-#ifndef __arch__swab64
-#  define __arch__swab64(x) ({ __u64 __tmp = (x) ; ___swab64(__tmp); })
-#endif
+#define __swab64(x)  (__builtin_bswap64(x))                                                     \
 
-#ifndef __arch__swab16p
-#  define __arch__swab16p(x) __arch__swab16(*(x))
+#ifndef __swab16p
+#  define __swab16p(x) __swab16(*(x))
 #endif
-#ifndef __arch__swab32p
-#  define __arch__swab32p(x) __arch__swab32(*(x))
+#ifndef __swab32p
+#  define __swab32p(x) __swab32(*(x))
 #endif
-#ifndef __arch__swab64p
-#  define __arch__swab64p(x) __arch__swab64(*(x))
+#ifndef __swab64p
+#  define __swab64p(x) __swab64(*(x))
 #endif
 
-#ifndef __arch__swab16s
-#  define __arch__swab16s(x) do { *(x) = __arch__swab16p((x)); } while (0)
+#ifndef __swab16s
+#  define __swab16s(x) do { *(x) = __swab16p((x)); } while (0)
 #endif
-#ifndef __arch__swab32s
-#  define __arch__swab32s(x) do { *(x) = __arch__swab32p((x)); } while (0)
+#ifndef __swab32s
+#  define __swab32s(x) do { *(x) = __swab32p((x)); } while (0)
 #endif
-#ifndef __arch__swab64s
-#  define __arch__swab64s(x) do { *(x) = __arch__swab64p((x)); } while (0)
+#ifndef __swab64s
+#  define __swab64s(x) do { *(x) = __swab64p((x)); } while (0)
 #endif
 
-
-/*
- * Allow constant folding
- */
-#if defined(__GNUC__) && defined(__OPTIMIZE__)
-#  define __swab16(x) \
-(__builtin_constant_p((__u16)(x)) ? \
- ___swab16((x)) : \
- __fswab16((x)))
-#  define __swab32(x) \
-(__builtin_constant_p((__u32)(x)) ? \
- ___swab32((x)) : \
- __fswab32((x)))
-#  define __swab64(x) \
-(__builtin_constant_p((__u64)(x)) ? \
- ___swab64((x)) : \
- __fswab64((x)))
-#else
-#  define __swab16(x) __fswab16(x)
-#  define __swab32(x) __fswab32(x)
-#  define __swab64(x) __fswab64(x)
-#endif /* OPTIMIZE */
-
-
-static inline __attribute_const__ __u16 __fswab16(__u16 x)
-{
-    return __arch__swab16(x);
-}
-static inline __u16 __swab16p(const __u16 *x)
-{
-    return __arch__swab16p(x);
-}
-static inline void __swab16s(__u16 *addr)
-{
-    __arch__swab16s(addr);
-}
-
-static inline __attribute_const__ __u32 __fswab32(__u32 x)
-{
-    return __arch__swab32(x);
-}
-static inline __u32 __swab32p(const __u32 *x)
-{
-    return __arch__swab32p(x);
-}
-static inline void __swab32s(__u32 *addr)
-{
-    __arch__swab32s(addr);
-}
-
-#ifdef __BYTEORDER_HAS_U64__
-static inline __attribute_const__ __u64 __fswab64(__u64 x)
-{
-#  ifdef __SWAB_64_THRU_32__
-    __u32 h = x >> 32;
-        __u32 l = x & ((1ULL<<32)-1);
-        return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
-#  else
-    return __arch__swab64(x);
-#  endif
-}
-static inline __u64 __swab64p(const __u64 *x)
-{
-    return __arch__swab64p(x);
-}
-static inline void __swab64s(__u64 *addr)
-{
-    __arch__swab64s(addr);
-}
-#endif /* __BYTEORDER_HAS_U64__ */
-
 #define swab16 __swab16
 #define swab32 __swab32
 #define swab64 __swab64
-- 
2.27.0


