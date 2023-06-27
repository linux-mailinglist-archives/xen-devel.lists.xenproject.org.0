Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79D73F635
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555901.868101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Z2-0000Lw-A3; Tue, 27 Jun 2023 07:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555901.868101; Tue, 27 Jun 2023 07:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Z2-0000I6-6k; Tue, 27 Jun 2023 07:56:40 +0000
Received: by outflank-mailman (input) for mailman id 555901;
 Tue, 27 Jun 2023 07:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4+f=CP=citrix.com=prvs=535d699d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qE3Z0-0008EH-Bw
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:56:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2351cd2f-14c0-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 09:56:35 +0200 (CEST)
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
X-Inumbo-ID: 2351cd2f-14c0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687852596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF6+MO8uRCqSL2DrFswTeiveqvFOb1H6UCIU4GeCi+k=;
  b=ID0vt8raTQrK7znBArIqamxjI2dz+ivQuK1r4OxRFDCNJNf81eoruraf
   fjO4sqaJTzYOP+5dVG0Q36lt1s4v+KCYznoA4OI2lwsyYvPjnBqocyl+U
   mudhIXa9cyjIpV6kawKkm6G7yZZ5c8jCYlBDyR/q60gD4KBpjvp9ez1Cb
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007169
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dl2UWqAVKAkIVRVW/w7kw5YqxClBgxIJ4kV8jS/XYbTApDgn02QBz
 2AXUT3UP/eLZGX2Kd13aIu/9U1XvpXQn4M1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1C4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyLwtB2gXr
 /0idhc1Zwusnfnn+7zmY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XRHZ0KxxjJz
 o7A133WXxEkLsCw8jrf1Cnro6jGtCjBXp1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYB2r+n51nBj3Spr4LQUw8uzgzNWySu6QYRTIehZpe04FnBq/haJYCST0Kpo
 3QP3cOZ6YgmB5aHnj2AW+UJEbSg4d6KNTTdhRhkGJxJ3z+q/Xikf4xZ/jBlDEhsO8cAPzTuZ
 Sf7vgdc54RSPT2pcLVwaIKyDOwlyKHhEZLuUfW8RsFHZJFqaAac/SZGf0eIw2f3nU4jkKcyN
 I2ad8nqBnEfYYx71De/Xfwa15cxzzgiwnneQ5/6yRmqy7uYazieTrJtGEGJZO0j8KTCqgza9
 d9FPuOA1hpEXevxJCLQ9OYuwUsidCZhQ8qs8ooOK7DFe1A9cI08NxPP6YF7IYpsxv5UrLnvx
 nimdVVDmWHx2FSSfG1mdUtfhKPTsYdX9CxrYnxxZAbyhRDPcq70sv5BKsJfka0PsbU6kKUqF
 6Rtl9CoWKwnd9jRx9gKgXARRqRGfQ/juw+BNjHNjNMXL885HFyhFjMJk2LSGMgy4smf75FWT
 0WIjF+zfHb6b10K4DzqQPyu1UitmnMWhfh/WUDFSvEKJhWzoNA2d3Wg0adpSy3pFfkk7mHAv
 zt6/D9C/bWdy2PL2IehaV+4Q3eBTLIlQxsy85jz5reqLyjKlldPMqcZONtkiQv1DTuukI37P
 LU98h0JGKFf9Lq8m9YmQukDIGNXz4eHmoK2OSw+QymQPgXwU+M9SpREtOEW3pBwKnZikVPec
 iqyFhNyZd1l5OuN/IYtGTcY
IronPort-HdrOrdr: A9a23:S+hlBa4Sx2du2tLjMwPXwPLXdLJyesId70hD6qkXc203TiX4ra
 CTdZEgviMc5wx/ZJhNo7y90cq7IE80l6QFhLX5VI3KNGOKhILCFu9fBOXZslrdMhy72ulB1b
 pxN4hSYeeAa2SS9fyKgjVQyuxQpOW6zA==
X-Talos-CUID: 9a23:DWPtTm+/WLEwxpVg8uKVv3xOQMYsKyfc9in3G0ajJnxyGYabFHbFrQ==
X-Talos-MUID: 9a23:/EgCkwvHh68B5MyQoM2nnR4/NPly/4uVCBorytIj/MCtPhZ2JGLI
X-IronPort-AV: E=Sophos;i="6.01,161,1684814400"; 
   d="scan'208";a="113007169"
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
Subject: [PATCH v2 3/3] xen/types: Rework stdint vs __{u,s}$N types
Date: Tue, 27 Jun 2023 08:56:18 +0100
Message-ID: <20230627075618.1180248-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xen uses the stdint types.  Rearrange the types headers to define the
compatibility __{u,s}$N types in terms of the stdint types, not the other way
around.

All all supported compilers on architectures other than x86 support the stdint
__*_TYPE__ macros.  Move these into a new xen/stdint.h to avoid them being
duplicated in each architecture.

For the compilers which don't support the __*_TYPE__ macros, synthesize
appropriate alternatives.

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
index 000000000000..4cf82790f196
--- /dev/null
+++ b/xen/include/xen/stdint.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_STDINT_H__
+#define __XEN_STDINT_H__
+
+#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
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
+#else
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


