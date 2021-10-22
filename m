Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1004375AD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214949.373831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5p-0006Ca-36; Fri, 22 Oct 2021 10:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214949.373831; Fri, 22 Oct 2021 10:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5o-000672-Va; Fri, 22 Oct 2021 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 214949;
 Fri, 22 Oct 2021 10:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds5n-00063s-Ot
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 899cacfa-3325-11ec-83b2-12813bfff9fa;
 Fri, 22 Oct 2021 10:48:06 +0000 (UTC)
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
X-Inumbo-ID: 899cacfa-3325-11ec-83b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFE0UJWngehF/A2SEsMzjIMw1cebKLctc7j7VVKm2kg=;
  b=DYDcyYc2cqpGUHTxjTE64aII/dVtmZZvJfdO814hzVxBmtIrZIXti2ht
   h7sLs9lHr4po4BlJ4HNgnW7yfTb28HlQ/4pc5e+WiqjWERIR4p1x5UXU/
   JkI6VtslI/kJjMk5UJANpf/r67ZejCG/uYWmCA8Zq9DOn1WdA9GIRM+Qy
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9ODWXCtlXJsgGAcpdr47VuOgrNDlPEua4piplJW1s+UBl/uFlNhmUT04tLNIP0bkikNn7t5Hmt
 4gjBemsZz5YwqZs+MV3N+qbVlE7KNlcga3fIwiA/LmmCdwUVAQtshXMHFR/9jTCKEKOngq9zj0
 +kQAsiW/SEmaInkPqRIWCiPmzfjqxzYVjiozt8hqofY1qpjMBaXQi/7dLsMOnt/PjrCsCYCuJU
 qCM0mNQNOlXATNqHUPSzpZGv+DW05yM1JTgTEu3NJlqtdwzl9Vyd8Yv2Fi+CvDIq0/+2jbSFT1
 sSITJLNRVutURWfvnG5j84wI
X-SBRS: 5.1
X-MesageID: 55807250
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sA+ND6AXIj/COxVW/63kw5YqxClBgxIJ4kV8jS/XYbTApD120jUFn
 zNNCmyFa/yJNmrxe91yb9m3/R4HsZWHnYI3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500g7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/m3LKgu1N5
 Ot3s4WSFzkXYJ3clac9akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTTuhqwMAiMeHgPZ8Fu2EmxjbcZRojac2eE/2Vv4IAtNs2rpBVAez8O
 88dUgtiLznyeAUMPXc6LqtryY9EgVGgKmYF+Tp5v5Ef+HPPxQZ81LzsNtv9edGQQ8hR2EGCq
 Qru/Xn9AxwcHMySz3yC6H3ErvDLtTP2XsQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa9VOpZsnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8vXTxJBUpAVE4YzYmEzU7venzrcITt0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2G30+MCYJuIhzkCOBDj9t1ImDGKwT9XwsQCz0BpWEGqOorBtV
 lA/kM+C8PtGM5iJkCGcKAnmNOD0v6jbWNEwbFgGInXAy9hP0yL8FWyzyGsnTKuMDiriUWW1C
 KM0kVgJjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwPhLAgzmywBB3zPBX1
 XKnnSCEVypy5UNPl2Leegvg+eVzmnBWKZ37FfgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3Cyed1/SMy07NNsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:lQQukavz14qfGMCrNNHCFY4O7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55807250"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/7] xen: implement byteswap.h
Date: Fri, 22 Oct 2021 10:47:22 +0000
Message-ID: <89afdafa9020ab77b9d662bd5c8f7b2d31e53c5c.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

swab() is massively over complicated and can be simplified by builtins.
The compilers provide builtin function to swap bytes.
* gcc:   https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
* clang: https://clang.llvm.org/docs/LanguageExtensions.html
This patch simplify swab() with builtins and fallback for old compilers.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Changes in v2:
- Add fallback for compilers without __builtin_bswap
- Implement with plain C instead of macros
---
 xen/include/xen/byteswap.h | 93 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/compiler.h | 12 +++++
 2 files changed, 105 insertions(+)
 create mode 100644 xen/include/xen/byteswap.h

diff --git a/xen/include/xen/byteswap.h b/xen/include/xen/byteswap.h
new file mode 100644
index 0000000000..848a4bbaee
--- /dev/null
+++ b/xen/include/xen/byteswap.h
@@ -0,0 +1,93 @@
+#ifndef _BYTESWAP_H
+#define _BYTESWAP_H
+
+#include <xen/types.h>
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
+#define bswap_ul(x) bswap##BITS_PER_LONG(x)
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+
+#  ifndef __LITTLE_ENDIAN
+#    define __LITTLE_ENDIAN 1234
+#  endif
+
+#  ifndef __LITTLE_ENDIAN_BITFIELD
+#    define __LITTLE_ENDIAN_BITFIELD
+#  endif
+
+#  define cpu_to_le64(x) (x)
+#  define le64_to_cpu(x) (x)
+#  define cpu_to_le32(x) (x)
+#  define le32_to_cpu(x) (x)
+#  define cpu_to_le16(x) (x)
+#  define le16_to_cpu(x) (x)
+#  define cpu_to_be64(x) bswap64(x)
+#  define be64_to_cpu(x) bswap64(x)
+#  define cpu_to_be32(x) bswap32(x)
+#  define be32_to_cpu(x) bswap32(x)
+#  define cpu_to_be16(x) bswap16(x)
+#  define be16_to_cpu(x) bswap16(x)
+
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+
+#  ifndef __BIG_ENDIAN
+#    define __BIG_ENDIAN 4321
+#  endif
+
+#  ifndef __BIG_ENDIAN_BITFIELD
+#    define __BIG_ENDIAN_BITFIELD
+#  endif
+
+#  define cpu_to_le64(x) bswap64(x)
+#  define le64_to_cpu(x) bswap64(x)
+#  define cpu_to_le32(x) bswap32(x)
+#  define le32_to_cpu(x) bswap32(x)
+#  define cpu_to_le16(x) bswap16(x)
+#  define le16_to_cpu(x) bswap16(x)
+#  define cpu_to_be64(x) (x)
+#  define be64_to_cpu(x) (x)
+#  define cpu_to_be32(x) (x)
+#  define be32_to_cpu(x) (x)
+#  define cpu_to_be16(x) (x)
+#  define be16_to_cpu(x) (x)
+
+#else
+#  error "Unknown Endianness"
+#endif /* __BYTE_ORDER__ */
+
+#endif /* _LINUX_BITOPS_H */
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 696c7eb89e..68f28082a5 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -179,4 +179,16 @@
 # define CLANG_DISABLE_WARN_GCC_COMPAT_END
 #endif
 
+#if (!defined(__clang__) && (__GNUC__ < 10))
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


