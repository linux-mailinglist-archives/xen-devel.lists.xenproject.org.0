Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ADD74145C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 16:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556508.869093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEWYg-0003eS-PJ; Wed, 28 Jun 2023 14:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556508.869093; Wed, 28 Jun 2023 14:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEWYg-0003bk-MN; Wed, 28 Jun 2023 14:54:14 +0000
Received: by outflank-mailman (input) for mailman id 556508;
 Wed, 28 Jun 2023 14:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKaW=CQ=citrix.com=prvs=53677329f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qEWYf-0003be-5r
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 14:54:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a28ed2de-15c3-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 16:54:10 +0200 (CEST)
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
X-Inumbo-ID: a28ed2de-15c3-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687964050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QwT7e436gD/rR6Mf07LsXwBWFj0yrd1gB8rRc4oOkAM=;
  b=MEqUgtu+SVZi4l6cHbgJCUB8ME6xE2DfiVuQhrlerv0VMe0B6bP1bLCV
   +JXDw3Hr6gIH2AQxBfM+nzM6yF+u7TRJJK72vRo2H0T6AFKJX8bcekfxN
   NzZ2iAHua/pEeFuZ7UQHtD+o9uc/wTSMJ4EGS1EKNiDF2RA7PmkXIqPq+
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114894457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8C1Sb6zu6sIRcgthEZh6t+cawSrEfRIJ4+MujC+fZmUNrF6WrkUDz
 TBND27QO/3bYjDzL9knPtjjoBtTuJ+Dz4VqTgdl+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRgP6AT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUtA+
 qcVDgAUVwC4jsCM5ei4VcU3g9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMwhbJ+
 j6boAwVBDkqJYHPyTWs90iAn8PIlyfDUblRBZCno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85jrxSdJkHL+wn8fCMzj6y
 DCXrwAzn7wWy8UM0s2T913dnyiloJSPSwcv/xjWRUqs9AY/b4mgD6Sh7VnA8f9BNsCXVFCHt
 3kfs9eS56YFCpTlvCaKSu8cEaqp4/uAOTv0jltmHp1n/DOok1aoeoZW5zNyLVloKe4LfDboZ
 AnYvgY5zJhXMXixbK4xYJ+rDM8qzq/IGtHsV/SSZd1LCrBqfQmO5z1nfk+X93rkiFQri6w5N
 padfMu2DHAVT69gyVKeW/8Q2KUwwSYW32rLWZfhwhKo0LyTaWSUT7hDO1yLBsgj66mJuhnSt
 dxWOM2D0Rx3WvDxeSTR/sgYKlViEJQgLcmo8YoNLLfFe1c4Xjh7UJc93I/NZaRPkasOm8H45
 0itYUZ68n+lhmLrcgCVPyULhKzUYXpvkZ4qFXVybQn5gCh5PdvHALQ3LMVuI+R+nAB35bstF
 qReJZ3dahhaYm6fkwnxe6URu2CLmP6DoQuVdxSobzEkF3KLb1yYo4S0FucDGcRnM8ZWiSfdi
 +f6vu8jacBfLzmO9e6PAB5V83u/vGIGhMV5VFbSL99YdS3EqdY6dHGt06dqeJlUcH0vIwd2M
 S7MX3/0QsGX+ecIHCTh3/jY/+9F7cMgdqalI4UrxenvbnSLloZS6YRBTPyJbVjguJDcoc2fi
 RFu56ikapUvxQ8a27eQ5p43lcrSEfOz/e4FpumldV2XB2mW5kRIeSLdhpkU7fESnNe0e2KeA
 yqyxzWTAp3RUOuNLbLbDFNNgjirvR3MpgTv0A==
IronPort-HdrOrdr: A9a23:82FkNq/0YdjAoj4jimluk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3AYvtStGnc+L7EYXljqF3pmITBDxPXOVfTwyzdBX+?=
 =?us-ascii?q?hMHZSQZ+vbAWT548/ltU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9K1xvg7ZOceCO5SxmpctvfJ9xoxY8vn+CE8klK8?=
 =?us-ascii?q?qouWDPyhIMgzenRmoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114894457"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>
Subject: [PATCH v2.5 3/3] xen/types: Rework stdint vs __{u,s}$N types
Date: Wed, 28 Jun 2023 15:54:03 +0100
Message-ID: <20230628145403.3630-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
References: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xen uses the stdint types.  Rearrange the types headers to define the
compatibility __{u,s}$N types in terms of the stdint types, not the other way
around.

All supported compilers on architectures other than x86 support the stdint
__*_TYPE__ macros.  Move these into a new xen/stdint.h to avoid them being
duplicated in each architecture.  For the very old x86 compilers, synthesize
suitable types using GCC internals.

This cleanup has the side effect of removing all use of the undocumented
__signed__ GCC keyword.  This is a vestigial remnant of `gcc -traditional`
mode for dialetcs of C prior to the introduction of the signed keyword.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Timothy Pearson <tpearson@raptorengineering.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>

v2.5:
 * Get the #ifdef-ary the right way around
v2:
 * Introduce xen/stdint.h as discussed at XenSummit
---
 xen/arch/arm/include/asm/types.h   | 19 -----------------
 xen/arch/riscv/include/asm/types.h | 19 -----------------
 xen/arch/x86/include/asm/types.h   | 14 -------------
 xen/include/xen/stdint.h           | 33 ++++++++++++++++++++++++++++++
 xen/include/xen/types.h            | 20 ++++++++----------
 5 files changed, 42 insertions(+), 63 deletions(-)
 create mode 100644 xen/include/xen/stdint.h

diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
index fb6618ef247f..545a5e9d1175 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -1,25 +1,6 @@
 #ifndef __ARM_TYPES_H__
 #define __ARM_TYPES_H__
 
-typedef __signed__ char __s8;
-typedef unsigned char __u8;
-
-typedef __signed__ short __s16;
-typedef unsigned short __u16;
-
-typedef __signed__ int __s32;
-typedef unsigned int __u32;
-
-#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
-#if defined(CONFIG_ARM_32)
-typedef __signed__ long long __s64;
-typedef unsigned long long __u64;
-#elif defined (CONFIG_ARM_64)
-typedef __signed__ long __s64;
-typedef unsigned long __u64;
-#endif
-#endif
-
 typedef signed char s8;
 typedef unsigned char u8;
 
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
index 0c0ce78c8f6e..93a680a8f323 100644
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,25 +1,6 @@
 #ifndef __RISCV_TYPES_H__
 #define __RISCV_TYPES_H__
 
-typedef __signed__ char __s8;
-typedef unsigned char __u8;
-
-typedef __signed__ short __s16;
-typedef unsigned short __u16;
-
-typedef __signed__ int __s32;
-typedef unsigned int __u32;
-
-#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
-#if defined(CONFIG_RISCV_32)
-typedef __signed__ long long __s64;
-typedef unsigned long long __u64;
-#elif defined (CONFIG_RISCV_64)
-typedef __signed__ long __s64;
-typedef unsigned long __u64;
-#endif
-#endif
-
 typedef signed char s8;
 typedef unsigned char u8;
 
diff --git a/xen/arch/x86/include/asm/types.h b/xen/arch/x86/include/asm/types.h
index 2d56aed66782..c9d257716551 100644
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -1,20 +1,6 @@
 #ifndef __X86_TYPES_H__
 #define __X86_TYPES_H__
 
-typedef __signed__ char __s8;
-typedef unsigned char __u8;
-
-typedef __signed__ short __s16;
-typedef unsigned short __u16;
-
-typedef __signed__ int __s32;
-typedef unsigned int __u32;
-
-#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
-typedef __signed__ long __s64;
-typedef unsigned long __u64;
-#endif
-
 typedef signed char s8;
 typedef unsigned char u8;
 
diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
new file mode 100644
index 000000000000..8c8a5899373a
--- /dev/null
+++ b/xen/include/xen/stdint.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_STDINT_H__
+#define __XEN_STDINT_H__
+
+#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
+
+/*
+ * Define the types using GCC internal notation.  Clang understands this too.
+ * https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
+ */
+typedef   signed __attribute__((__mode__(QI)))     int8_t;
+typedef unsigned __attribute__((__mode__(QI)))    uint8_t;
+typedef   signed __attribute__((__mode__(HI)))    int16_t;
+typedef unsigned __attribute__((__mode__(HI)))   uint16_t;
+typedef   signed __attribute__((__mode__(SI)))    int32_t;
+typedef unsigned __attribute__((__mode__(SI)))   uint32_t;
+typedef   signed __attribute__((__mode__(DI)))    int64_t;
+typedef unsigned __attribute__((__mode__(DI)))   uint64_t;
+
+#else
+
+typedef __INT8_TYPE__        int8_t;
+typedef __UINT8_TYPE__      uint8_t;
+typedef __INT16_TYPE__      int16_t;
+typedef __UINT16_TYPE__    uint16_t;
+typedef __INT32_TYPE__      int32_t;
+typedef __UINT32_TYPE__    uint32_t;
+typedef __INT64_TYPE__      int64_t;
+typedef __UINT64_TYPE__    uint64_t;
+
+#endif
+
+#endif /* __XEN_STDINT_H__ */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 8b22a02eeaa4..c873c81ccf06 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -2,6 +2,7 @@
 #define __TYPES_H__
 
 #include <xen/stdbool.h>
+#include <xen/stdint.h>
 
 #include <asm/types.h>
 
@@ -39,17 +40,14 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
 
-typedef         __u8            uint8_t;
-typedef         __s8            int8_t;
-
-typedef         __u16           uint16_t;
-typedef         __s16           int16_t;
-
-typedef         __u32           uint32_t;
-typedef         __s32           int32_t;
-
-typedef         __u64           uint64_t;
-typedef         __s64           int64_t;
+typedef uint8_t         __u8;
+typedef int8_t          __s8;
+typedef uint16_t        __u16;
+typedef int16_t         __s16;
+typedef uint32_t        __u32;
+typedef int32_t         __s32;
+typedef uint64_t        __u64;
+typedef int64_t         __s64;
 
 typedef __u16 __le16;
 typedef __u16 __be16;
-- 
2.30.2


