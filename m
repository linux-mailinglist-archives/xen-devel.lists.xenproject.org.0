Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29E530C6E
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335654.559823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k4-0002fV-1e; Mon, 23 May 2022 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335654.559823; Mon, 23 May 2022 09:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k3-0002e5-R5; Mon, 23 May 2022 09:52:47 +0000
Received: by outflank-mailman (input) for mailman id 335654;
 Mon, 23 May 2022 09:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4k2-0002dq-JR
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17077772-da7e-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 11:52:44 +0200 (CEST)
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
X-Inumbo-ID: 17077772-da7e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JBHSAD2WTCaM2SftEiZKTTucLKJZ7SWdUx1sAhYs8n4=;
  b=QxBqD4z7V4hIPZGm2gS6+hxvm+wdFn6vbFnKD6expCN1NQZ/p8Zr1ddt
   StbtK/lW4Og1OR2Nwamk0ZwfYQ9yjegIAEkkO18IFrjZObIAAnt65NdBm
   wBeUU7oI/YjU7b38c8ZvjCal+IO3Xk7O412sXvTt/wwHkWtaCEBr2C4A8
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71787716
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+h2RBK/CFFOuVFq8qCFsDrUDtX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zQaWGDSO/7ZZzPzfNt+PY7g9x8Cup7cx4JjTwBt+y88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3ILiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnayeaxU5BfDjodYidEVILy9SDfB//KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIcevDdkzCzxBvc6W5HTBa7N4Le02R9v358eQqmHO
 aL1bxJgSRn/WR9IamxMEY09kvanuF64QSFx/Qf9Sa0fvDGIkV0ZPKLWGNjfd8GORM5Vtl2Fv
 W+A9GP8ajkYKdiexDyt4n+qwOjVkkvTR4Y6BLC+sPlwjzW7+GsXDxEHUEqhltOwgEW+RtF3J
 lQd/2wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Q3+H6q2dqz/0PCEPNHIDfgcNVw5D6N7myLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0jo+wZx57m0mn1vBXwtqTHYj5o3wHICzfNAhxCWGK1W2C5wQGFsK0ad9bJFQPpU
 GsswJbHsr1XZX2ZvGnUGbhWQun0jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOUS9joYyjS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9iY
 s3HLZr1Vy5DWcyLKQZaoM9EjNcWKt0WnzuPFfgXMTz5uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlSRVBiXMCeg5EGLYarf1s5cFzN/teMmNvNjaQ+x/QL/goJl
 1ngMnJlJK3X3i2WdV7QMyk8AF4tNL4mxU8G0eUXFQ7A8xAejUyHsM/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:9Qjl8a7Y7RYnTc1JxwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71787716"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/6] xen: implement byteswap
Date: Mon, 23 May 2022 05:52:17 -0400
Message-ID: <89b15afe026a84748ac0d9ca28e8608085454e78.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653295437.git.lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

swab() is massively over complicated and can be simplified
by re-implementing using compiler builtins.
The compilers provide builtin function to swap bytes.
* gcc:   https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
* clang: https://clang.llvm.org/docs/LanguageExtensions.html
This patch introduces a new byteswapping infrastructure in
terms of compiler builtins and bswapXX(), so the swab() infrastructure
can be retired.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
Changes in v4:
- Move `PASTE` definition to xen/compiler.h to support tools
- Revert emacs magics

Changes in v3:
- Check __has_builtin instead of GNUC version 

Changes in v2:
- Add fallback for compilers without __builtin_bswap
- Implement with plain C instead of macros
---
 xen/arch/arm/include/asm/byteorder.h |  6 ++-
 xen/arch/x86/include/asm/byteorder.h | 34 ++---------------
 xen/include/xen/byteorder.h          | 56 ++++++++++++++++++++++++++++
 xen/include/xen/byteswap.h           | 44 ++++++++++++++++++++++
 xen/include/xen/compiler.h           | 24 ++++++++++++
 xen/include/xen/lib.h                |  4 --
 6 files changed, 132 insertions(+), 36 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 create mode 100644 xen/include/xen/byteswap.h

diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
index 9c712c4788..b6a33b23c0 100644
--- a/xen/arch/arm/include/asm/byteorder.h
+++ b/xen/arch/arm/include/asm/byteorder.h
@@ -1,9 +1,11 @@
 #ifndef __ASM_ARM_BYTEORDER_H__
 #define __ASM_ARM_BYTEORDER_H__
 
-#define __BYTEORDER_HAS_U64__
+#ifndef __BYTE_ORDER__
+   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#endif
 
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_ARM_BYTEORDER_H__ */
 /*
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
index 0000000000..d2e371fbe7
--- /dev/null
+++ b/xen/include/xen/byteswap.h
@@ -0,0 +1,44 @@
+#ifndef __XEN_BYTESWAP_H__
+#define __XEN_BYTESWAP_H__
+
+#include <xen/types.h>
+#include <xen/compiler.h>
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
index 933aec09a9..ae029afa14 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -185,4 +185,28 @@
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
+#ifndef __ORDER_LITTLE_ENDIAN__
+# define __ORDER_LITTLE_ENDIAN__ 1234
+#endif
+
+#ifndef __ORDER_BIG_ENDIAN__
+# define __ORDER_BIG_ENDIAN__ 4321
+#endif
+
+/* Indirect macros required for expanded argument pasting. */
+#define PASTE_(a, b) a ## b
+#define PASTE(a, b) PASTE_(a, b)
+
 #endif /* __LINUX_COMPILER_H */
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index aab1fc7c4a..ebf2193569 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -15,10 +15,6 @@
 #define count_args(args...) \
     count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
 
-/* Indirect macros required for expanded argument pasting. */
-#define PASTE_(a, b) a ## b
-#define PASTE(a, b) PASTE_(a, b)
-
 #define __STR(...) #__VA_ARGS__
 #define STR(...) __STR(__VA_ARGS__)
 
-- 
2.27.0


