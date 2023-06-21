Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C2739155
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 23:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553144.863531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC57i-0006TQ-Cw; Wed, 21 Jun 2023 21:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553144.863531; Wed, 21 Jun 2023 21:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC57i-0006QH-AF; Wed, 21 Jun 2023 21:12:18 +0000
Received: by outflank-mailman (input) for mailman id 553144;
 Wed, 21 Jun 2023 21:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC57f-0006QB-R7
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 21:12:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 497cb7fa-1078-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 23:12:12 +0200 (CEST)
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
X-Inumbo-ID: 497cb7fa-1078-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687381932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O8AEz7JfrhOSqym56+0EwnNE503UhvYripUFGrNGdFo=;
  b=df+pUpwWxMlsqOzayuvApKBCS8ysTwCFuiKWCYJov2zBH2+jdBTC/RUc
   IBrA2B3w8XfLlyCGNF+sqwfwhBBOQf4VPCLmR2Z2W1ExbdW+yqNdmq9JV
   tDRscRpmNj/W5cSJdknXEW3KJVOIZihARYwaX3eYMzGMVmPigFzU+C8sP
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114088574
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ZKYUAq1PxnnOMNlBgPbD5f52kn2cJEfYwER7XKvMYLTBsI5bpzAOy
 2QcXzyOO/6KMzTxL9x0bYTko0oGusLSy9ZjTgM+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJkPKgX1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJXhEq
 MA4AgAxYBWarsWRmIq+drJwiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJwJxhbI+
 z2al4j/KiwlF5uP0WDGyUi9nbHkghHQVrM9OKLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Vna15rqS6zSoNkA9L3IGZCICZRsI5Z/kuo5bpizIStFvAauklOrfEDv7w
 y2JhCUmjrBVhskOv42x8ErbmTuqqt7MRxQs+wTMdmu/60VyY4vNT4Ws6EPH5PdaaoiDR1+Kv
 WMshMSVqusJCPmlniuHSvQAB7Gt6vOMNhXThFduG98q8DHF03Wke4ZX4j13OkZyGskBcD7tJ
 kTUvGt545teP2CrbOl0fpi2AMQpyoDvEN3kUrbfad8mSoN4cgac4Ch1ZEm4xWn1jE82nKcwO
 JGWfNytC3lcAqNipBKqX+oUy6QswAgkzHvPQor2yRum17eTfn+TRvEON17mRvo+5q6evAKT+
 d9QMcKQwj1VTeLlby/Yt4UUKDg3wWMTXM6s7ZYNL6jaf1QgQTt6YxPM/V8/U6h8lflpts34w
 n+4Q2Z/7wLHgEGcNQrfPxiPd4jTsYZDQWMTZHJ8Yg32iyZ/Me5D/49EKcJpIOBPGPhLiKctE
 qJbI5jo7uFnEGyvxtgLUXXqQGWOnjyPjBnGASeqaSNXk3VIF12QoY+MkucCGUAz4suLWSgW+
 efIOvvzG8ZreuibJJ++hAiT512wp2MBv+l5QlHFJNJeEG21rtg1cHOr1K9vfppdQfkm+td8/
 1zNafv/jbOXy7LZDfGT3fzUx2tXO7UW8rVm85nzsu/taHiyEpuLyo5cSueYFQ0xp0utkJhOk
 d59lqmmWNVexQYijmaJO+ozpU7Iz4e19uAyI8UNNCmjUmlH/Zs6fSbfhpAV6vIWrlKb0CPvM
 n+yFhBhEe3hEKvY/JQ5fWLJsszrOSkopwTv
IronPort-HdrOrdr: A9a23:TmjusqDWiKuytRnlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:1sPCRW7cxExjegfE9tss0FceR/wFWE3hwnLJCmifUV5sdOaJRgrF
X-Talos-MUID: 9a23:2TjnlAUF+nFfgM7q/ALTp3ZyLJ0r2J6/Ex4mjqcttfirGTMlbg==
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="114088574"
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
Subject: [PATCH 2/2] xen/types: Rework stdint vs __{u,s}$N types
Date: Wed, 21 Jun 2023 22:12:00 +0100
Message-ID: <20230621211200.4132989-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
References: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xen uses the stdint types.  Rearrange the types headers to define the
compatibility __{u,s}$N types in terms of the stdint types, not the other way
around.

All all supported compilers on architectures other than x86 support the stdint
__*_TYPE__ macros.  Move these into the common types.h to avoid them being
duplicated in each architecture.

For x86 on obsolete compilers, synthesize appropriate types.

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

I've left the non __ types alone for now.  They're complicated mostly by ARM
having differing ideas of what a paddr_t is.

A different option would be to sort out the stdint types ahead of including
<asm/types.h>, which can either be done by introducing a <asm/stdint.h> or
upping the minimum compiler version for x86; a task which is massively
overdue.
---
 xen/arch/arm/include/asm/types.h   | 19 -------------------
 xen/arch/riscv/include/asm/types.h | 19 -------------------
 xen/arch/x86/include/asm/types.h   | 21 +++++++++------------
 xen/include/xen/types.h            | 28 +++++++++++++++++-----------
 4 files changed, 26 insertions(+), 61 deletions(-)

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
index 2d56aed66782..a5d4f6e9587a 100644
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -1,18 +1,15 @@
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
+#ifndef __INT8_TYPE__ /* GCC <= 4.4 */
+# define __INT8_TYPE__     signed  char
+# define __UINT8_TYPE__  unsigned  char
+# define __INT16_TYPE__           short
+# define __UINT16_TYPE__ unsigned short
+# define __INT32_TYPE__             int
+# define __UINT32_TYPE__ unsigned   int
+# define __INT64_TYPE__            long
+# define __UINT64_TYPE__ unsigned  long
 #endif
 
 typedef signed char s8;
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 8b22a02eeaa4..4083f1bf18b0 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -11,6 +11,15 @@ typedef signed long ssize_t;
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 
+typedef __INT8_TYPE__        int8_t;
+typedef __UINT8_TYPE__      uint8_t;
+typedef __INT16_TYPE__      int16_t;
+typedef __UINT16_TYPE__    uint16_t;
+typedef __INT32_TYPE__      int32_t;
+typedef __UINT32_TYPE__    uint32_t;
+typedef __INT64_TYPE__      int64_t;
+typedef __UINT64_TYPE__    uint64_t;
+
 #define BITS_TO_LONGS(bits) \
     (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
 #define DECLARE_BITMAP(name,bits) \
@@ -39,17 +48,14 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
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


