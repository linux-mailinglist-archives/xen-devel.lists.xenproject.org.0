Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9F5211F7
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325339.547912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuR-0006ZT-5O; Tue, 10 May 2022 10:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325339.547912; Tue, 10 May 2022 10:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuQ-0006Tt-Vl; Tue, 10 May 2022 10:16:02 +0000
Received: by outflank-mailman (input) for mailman id 325339;
 Tue, 10 May 2022 10:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkLT=VS=citrix.com=prvs=122513738=lin.liu@srs-se1.protection.inumbo.net>)
 id 1noMuO-000561-Ih
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:16:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ed209b0-d04a-11ec-a406-831a346695d4;
 Tue, 10 May 2022 12:15:59 +0200 (CEST)
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
X-Inumbo-ID: 2ed209b0-d04a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652177758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBx5VXViH2N+eGGpOUcQCz2z12c6GtTDSfMwDmCLLRQ=;
  b=gwBvgm3VJ/R45JGo/aVGhZ+ohl1fRCfMbZioevIqAhmV6lrU0x3jws5a
   BpIyc7tpz+LNkyyS7zZ0WfQcQVQ6qg3hPa8EfokGissi649zJzNQgYwQc
   FqL5FvFSwKuqq7Iw3/RJzoZ/PEDPhMdgJp0i2AwZ6HXLWYJI5VWYtIUqI
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70351037
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KqtWoK58/i/gMmkLaNnoBAxRtPjHchMFZxGqfqrLsTDasY5as4F+v
 jMXCmiDbKyDazf1f4sibti19xkOvZWEx4I2Sgc+rCE9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgW1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS8Thx1P7HQoN4fUgRhA2J7J51gxZLIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsbu3cmyTDEJf0nXYrCU+PB4towMDIY2ZgVQK+GP
 JVxhTxHZkXgYT5iKn0uNcgjpb2Ull/neRFCtwfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyNsGbyDeD2mKhgKnIhyyTcJ0WPK218LhtmlL77lIUDBoaRF6qu86Tg0S1W89cA
 0EM8y9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YXiQ7KuOpDW+fy0cN3YfZDQsRBEApdLkpekOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7gckQi6Sn4Wj9gTOxn4iKSxQFwDj6UTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW5fTgGfqqNBjarXnSWXFXelByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1m3pnnzqMFcCnl0nPPV+iiJm9E+xtDbdzRrphsPPsTPv9r
 b6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIx7yg1
 izsBSdlJK/X2CSvxfOiMSgzNtsCnP9X8BoGAMDbFQz2hCJ/Md3/vM/ytfIfJNEayQCq9tYsJ
 9FtRilKKq0npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:GBFz3K8Uk8EIMM93lWFuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70351037"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/6] xen: implement byteswap
Date: Tue, 10 May 2022 06:15:19 -0400
Message-ID: <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1652170719.git.lin.liu@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

swab() is massively over complicated and can be simplified by builtins.
The compilers provide builtin function to swap bytes.
* gcc:   https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
* clang: https://clang.llvm.org/docs/LanguageExtensions.html
This patch simplify swab() with builtins and fallback for old compilers.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Changes in v3:
- Check __has_builtin instead of GNUC version 

Changes in v2:
- Add fallback for compilers without __builtin_bswap
- Implement with plain C instead of macros
---
 xen/arch/arm/include/asm/byteorder.h | 14 ++-----
 xen/arch/x86/include/asm/byteorder.h | 34 ++---------------
 xen/include/xen/byteorder.h          | 56 ++++++++++++++++++++++++++++
 xen/include/xen/byteswap.h           | 44 ++++++++++++++++++++++
 xen/include/xen/compiler.h           | 12 ++++++
 5 files changed, 120 insertions(+), 40 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 create mode 100644 xen/include/xen/byteswap.h

diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
index 9c712c4788..622eeaba07 100644
--- a/xen/arch/arm/include/asm/byteorder.h
+++ b/xen/arch/arm/include/asm/byteorder.h
@@ -1,16 +1,10 @@
 #ifndef __ASM_ARM_BYTEORDER_H__
 #define __ASM_ARM_BYTEORDER_H__
 
-#define __BYTEORDER_HAS_U64__
+#ifndef __BYTE_ORDER__
+   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#endif
 
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_ARM_BYTEORDER_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
index 1f77e502a5..82aadee7bd 100644
--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -1,36 +1,10 @@
 #ifndef __ASM_X86_BYTEORDER_H__
 #define __ASM_X86_BYTEORDER_H__
 
-#include <asm/types.h>
-#include <xen/compiler.h>
+#ifndef __BYTE_ORDER__
+   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#endif
 
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
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_X86_BYTEORDER_H__ */
diff --git a/xen/include/xen/byteorder.h b/xen/include/xen/byteorder.h
new file mode 100644
index 0000000000..2ec434e6a6
--- /dev/null
+++ b/xen/include/xen/byteorder.h
@@ -0,0 +1,56 @@
+#ifndef __XEN_BYTEORDER_H__
+#define __XEN_BYTEORDER_H__
+
+#include <xen/byteswap.h>
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+
+# ifndef __LITTLE_ENDIAN
+#  define __LITTLE_ENDIAN 1234
+# endif
+
+# ifndef __LITTLE_ENDIAN_BITFIELD
+#  define __LITTLE_ENDIAN_BITFIELD
+# endif
+
+# define cpu_to_le64(x) (x)
+# define le64_to_cpu(x) (x)
+# define cpu_to_le32(x) (x)
+# define le32_to_cpu(x) (x)
+# define cpu_to_le16(x) (x)
+# define le16_to_cpu(x) (x)
+# define cpu_to_be64(x) bswap64(x)
+# define be64_to_cpu(x) bswap64(x)
+# define cpu_to_be32(x) bswap32(x)
+# define be32_to_cpu(x) bswap32(x)
+# define cpu_to_be16(x) bswap16(x)
+# define be16_to_cpu(x) bswap16(x)
+
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+
+# ifndef __BIG_ENDIAN
+#  define __BIG_ENDIAN 4321
+# endif
+
+# ifndef __BIG_ENDIAN_BITFIELD
+#  define __BIG_ENDIAN_BITFIELD
+# endif
+
+# define cpu_to_le64(x) bswap64(x)
+# define le64_to_cpu(x) bswap64(x)
+# define cpu_to_le32(x) bswap32(x)
+# define le32_to_cpu(x) bswap32(x)
+# define cpu_to_le16(x) bswap16(x)
+# define le16_to_cpu(x) bswap16(x)
+# define cpu_to_be64(x) (x)
+# define be64_to_cpu(x) (x)
+# define cpu_to_be32(x) (x)
+# define be32_to_cpu(x) (x)
+# define cpu_to_be16(x) (x)
+# define be16_to_cpu(x) (x)
+
+#else
+# error "Unknown Endianness"
+#endif /* __BYTE_ORDER__ */
+
+#endif /* __XEN_BYTEORDER_H__ */
diff --git a/xen/include/xen/byteswap.h b/xen/include/xen/byteswap.h
new file mode 100644
index 0000000000..0dd5567557
--- /dev/null
+++ b/xen/include/xen/byteswap.h
@@ -0,0 +1,44 @@
+#ifndef __XEN_BYTESWAP_H__
+#define __XEN_BYTESWAP_H__
+
+#include <xen/types.h>
+#include <xen/lib.h>
+
+#if !__has_builtin(__builtin_bswap16)
+static always_inline uint16_t __builtin_bswap16(uint16_t val)
+{
+    return ((val & 0x00FF) << 8) | ((val & 0xFF00) >> 8);
+}
+#endif
+
+#if !__has_builtin(__builtin_bswap32)
+static always_inline uint32_t __builtin_bswap32(uint32_t val)
+{
+    return ((val & 0x000000FF) << 24) |
+           ((val & 0x0000FF00) <<  8) |
+           ((val & 0x00FF0000) >>  8) |
+           ((val & 0xFF000000) >> 24);
+}
+#endif
+
+#if !__has_builtin(__builtin_bswap64)
+static always_inline uint64_t __builtin_bswap64(uint64_t val)
+{
+    return ((val & 0x00000000000000FF) << 56) |
+           ((val & 0x000000000000FF00) << 40) |
+           ((val & 0x0000000000FF0000) << 24) |
+           ((val & 0x00000000FF000000) <<  8) |
+           ((val & 0x000000FF00000000) >>  8) |
+           ((val & 0x0000FF0000000000) >> 24) |
+           ((val & 0x00FF000000000000) >> 40) |
+           ((val & 0xFF00000000000000) >> 56);
+}
+#endif
+
+#define bswap16(x) __builtin_bswap16(x)
+#define bswap32(x) __builtin_bswap32(x)
+#define bswap64(x) __builtin_bswap64(x)
+
+#define bswap_ul(x) PASTE(bswap,BITS_PER_LONG)(x)
+
+#endif /* __XEN_BYTESWAP_H__ */
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 933aec09a9..05b1b8b24d 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -185,4 +185,16 @@
 # define CLANG_DISABLE_WARN_GCC_COMPAT_END
 #endif
 
+#ifndef __has_builtin
+/*
+ * Backwards compatibility for GCC < 10.
+ * All supported versions of Clang support __has_builtin
+ * */
+#define __has_builtin(x) GCC_has ## x
+
+#define GCC_has__builtin_bswap16 (CONFIG_GCC_VERSION >= 40800)
+#define GCC_has__builtin_bswap32 (CONFIG_GCC_VERSION >= 40400)
+#define GCC_has__builtin_bswap64 (CONFIG_GCC_VERSION >= 40400)
+#endif
+
 #endif /* __LINUX_COMPILER_H */
-- 
2.27.0


