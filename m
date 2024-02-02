Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE03847702
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 19:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675158.1050382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVxtS-0004j8-BR; Fri, 02 Feb 2024 18:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675158.1050382; Fri, 02 Feb 2024 18:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVxtS-0004gl-8r; Fri, 02 Feb 2024 18:04:02 +0000
Received: by outflank-mailman (input) for mailman id 675158;
 Fri, 02 Feb 2024 18:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j24o=JL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rVxtR-0004gf-H9
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 18:04:01 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70fe4910-c1f5-11ee-8a44-1f161083a0e0;
 Fri, 02 Feb 2024 19:04:00 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d07b400bb8so21920131fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 10:04:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05651c02c600b002cd38676699sm320976ljo.66.2024.02.02.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 10:03:58 -0800 (PST)
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
X-Inumbo-ID: 70fe4910-c1f5-11ee-8a44-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706897039; x=1707501839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQoMHnNRwfrV1WDYdAHoQ/fdY6iq16m3Egnrg7QaF4I=;
        b=EKS3dSktXbdcO+KTcZ+T9gsmgDuE6dcxZs0sBOFaAklKN+IPTA3FG7/Kq9g/T3Hfbc
         njbtlvoJ9968S7AvcTRDNgxIIhv7D4lhnX2bzZDG+FHKTKyxWv3/f9giaGIgS6OUsV37
         UHujl2nOuquWOnJNXe7PlZlYHp8ySEW7c6UenaxoruXxYM6yhjhbnxS1lvC8iFo4G8+/
         m3nkU2gDOCXUjYISrsP3pfkOvd+Yc+DZ85NhzZREbJ4oCfSt6V4W6mje6irl3WSX41jf
         3RtqsQNe5fYijixATS9cQBLRbgSi3fKv+UrhRBJWPmZwCHqa/cAM2oVrSnkZBe+sMomK
         asUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897039; x=1707501839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQoMHnNRwfrV1WDYdAHoQ/fdY6iq16m3Egnrg7QaF4I=;
        b=ZwtHAeoyoB+Gni/xBrAkxozDOmhLTARzvoTdrjNNVfH/Y3iZ6UNLp7jidK9NKgTdpa
         2FFGZDy5PIuHovn31nWZ5u2aaas+DpFfO0uqAVQOh5zQFw8kjeIn7fXwSMDL0k+prPA1
         0rbLLu/TWaGCyhCen03yH2exq0eT6wg1sIlnskqndd5u3RRNlagic0ky59Ma1dQi20Tm
         dqb89ixfNUyMp1TKez/Y5lpfmvRv6WLBEVK8AFUwjmE93+kB61h3098xhFAIkXd795jv
         P5ZjbgbfF4/nelEH3iFqJ7YtUhmoxZseTworbzk+bGXUMXs59558dJa84dqjri+kE1yq
         3clg==
X-Gm-Message-State: AOJu0Yz+5ohkRP0MjmNIa6a3xeMkqIj09pyc+h2QKAKcV3hGOlR7iMPK
	luTeHc0rgISGzqLapoV2GITjucC0AMOga1CnEhHS8WB/90ryO3WoCMF13Tft
X-Google-Smtp-Source: AGHT+IE9l26f3+lWXxhPxw2mzeVtif1AaEHf3ekzfXdffsH9qKf35KINSLIXrZIgblGynA93ntyIaA==
X-Received: by 2002:a2e:a401:0:b0:2ce:5524:1d96 with SMTP id p1-20020a2ea401000000b002ce55241d96mr3801118ljn.51.1706897039259;
        Fri, 02 Feb 2024 10:03:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVoOrtM8tvvooUGcNo0U0Rqg7CTOyeHo6fqDTDv28q12SHxtQT3P+5MbAxpBHKgNXYVvTV2+emUk6LroTzp41qINuPIbFNJluR1Raa8QIkeCM7yH9ez8t/oF5BaLV2P96Q2pq16R93mbLBAFqftBTWzNJ+rZqItcCGHMRNzLKndJaq/K+WSmE3fzAJ6MmdZVwUI/chmDRmnRVEYQKlv9tTP+XMSYebbZ/0jmPNSLxYXF+ay4k/j4yLb3bUtUh+p3qyccU9O0kTwxYHTXTbqEqPk1Dx+VJuHqA2WXwGX6bkZDvhyQ6S7DvY5vY5vUK2Icf0o+9rPghDuAuqGSUMf4qXR/Ki9olhsVTmafoF0OIMBW5Vgv5XLoIrsWdyY5Pqmajx5lJpwSxavy31eY3YqLwqVZ4PIKzUNDaEi9Ou7rL1TGG8wEfCp/efTYpL8b5jwPz1Z0or4XweUvubD8dxOVmAyFBb8wsjX1Z9n0mlI+eQfh/S63gokxHY2f+YkZKRagA==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(), ASSERT_UNREACHABLE() to xen/bug.h
Date: Fri,  2 Feb 2024 20:03:56 +0200
Message-ID: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the macros mentioned in the commit subject to their appropriate
locations.
Additionally, eliminate the dependency of xen/lib.h from xen/bug.h and
include "xen/bug.h" in files where xen/bug.h macros are utilized.

Most of the changes were made because a file requires macros from xen/bug.h,
except for some files for Arm which require definitions of BUG_OPCODE,
BUG_INSTR, BUG_FN_REG.

xen/lib.h was added to list-sort.c ( otherwise compilation errors related
to {d}printk occur during compilation of list-sort.c. ) as xen/lib.h was
removed from xen/list.h. Since nothing in xen/list.h depends on xen/lib.h
functionality and only xen/bug.h is needed.

cpufeature.h requires the inclusion of <xen/cache.h>;
otherwise, the following error will occur:
ld: common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
multiple definitions of `__cacheline_aligned';

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/arm32/insn.c                |  3 ++-
 xen/arch/arm/arm64/cpufeature.c          |  1 +
 xen/arch/arm/arm64/insn.c                |  1 +
 xen/arch/arm/cpufeature.c                |  1 +
 xen/arch/arm/include/asm/arm32/cmpxchg.h |  1 +
 xen/arch/arm/include/asm/arm64/cmpxchg.h |  2 ++
 xen/arch/arm/include/asm/regs.h          |  2 +-
 xen/arch/arm/include/asm/vgic.h          |  1 +
 xen/arch/ppc/include/asm/time.h          |  2 +-
 xen/arch/x86/bitops.c                    |  2 +-
 xen/arch/x86/include/asm/cpufeature.h    |  1 +
 xen/arch/x86/include/asm/system.h        |  2 +-
 xen/arch/x86/include/asm/x86_64/page.h   |  2 ++
 xen/arch/x86/x86_emulate/private.h       |  1 +
 xen/common/efi/common-stub.c             |  2 +-
 xen/common/version.c                     |  1 +
 xen/include/public/hvm/save.h            |  2 +-
 xen/include/xen/bug.h                    | 19 +++++++++++++++++++
 xen/include/xen/cpumask.h                |  1 +
 xen/include/xen/device_tree.h            |  1 +
 xen/include/xen/lib.h                    | 19 -------------------
 xen/include/xen/list.h                   |  2 +-
 xen/include/xen/livepatch.h              |  2 ++
 xen/include/xen/mm.h                     |  1 +
 xen/include/xen/param.h                  |  1 +
 xen/lib/list-sort.c                      |  1 +
 xen/xsm/flask/ss/ebitmap.h               |  1 +
 27 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/arm32/insn.c b/xen/arch/arm/arm32/insn.c
index 49953a042a..2a62bb9cce 100644
--- a/xen/arch/arm/arm32/insn.c
+++ b/xen/arch/arm/arm32/insn.c
@@ -13,8 +13,9 @@
   * You should have received a copy of the GNU General Public License
   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
   */
-#include <xen/lib.h>
 #include <xen/bitops.h>
+#include <xen/bug.h>
+#include <xen/lib.h>
 #include <xen/sizes.h>
 #include <asm/insn.h>
 
diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index b4656ff4d8..864413d9cc 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -69,6 +69,7 @@
  *   KVM guests.
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
 #include <asm/sysregs.h>
diff --git a/xen/arch/arm/arm64/insn.c b/xen/arch/arm/arm64/insn.c
index 22f2bdebd5..773c3749d1 100644
--- a/xen/arch/arm/arm64/insn.c
+++ b/xen/arch/arm/arm64/insn.c
@@ -18,6 +18,7 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index f43d5cb338..ef77473bf8 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 ARM Ltd.
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/smp.h>
diff --git a/xen/arch/arm/include/asm/arm32/cmpxchg.h b/xen/arch/arm/include/asm/arm32/cmpxchg.h
index 37b2d64eb6..8455eb7cc3 100644
--- a/xen/arch/arm/include/asm/arm32/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm32/cmpxchg.h
@@ -1,6 +1,7 @@
 #ifndef __ASM_ARM32_CMPXCHG_H
 #define __ASM_ARM32_CMPXCHG_H
 
+#include <xen/bug.h>
 #include <xen/prefetch.h>
 
 extern void __bad_xchg(volatile void *ptr, int size);
diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
index 031fa6d92a..f160e8e7bc 100644
--- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM64_CMPXCHG_H
 #define __ASM_ARM64_CMPXCHG_H
 
+#include <xen/bug.h>
+
 extern void __bad_xchg(volatile void *ptr, int size);
 
 static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index f998aedff5..0d9f239a77 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -5,7 +5,7 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/lib.h>
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <public/xen.h>
 #include <asm/current.h>
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 922779ce14..79b73a0dbb 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -22,6 +22,7 @@
 #include <asm/new_vgic.h>
 #else
 
+#include <xen/bug.h>
 #include <xen/radix-tree.h>
 #include <xen/rbtree.h>
 
diff --git a/xen/arch/ppc/include/asm/time.h b/xen/arch/ppc/include/asm/time.h
index aa9dda82a3..f23eec173e 100644
--- a/xen/arch/ppc/include/asm/time.h
+++ b/xen/arch/ppc/include/asm/time.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_PPC_TIME_H__
 #define __ASM_PPC_TIME_H__
 
-#include <xen/lib.h>
+#include <xen/bug.h>
 #include <asm/processor.h>
 #include <asm/regs.h>
 
diff --git a/xen/arch/x86/bitops.c b/xen/arch/x86/bitops.c
index f6ee71512c..720ab32362 100644
--- a/xen/arch/x86/bitops.c
+++ b/xen/arch/x86/bitops.c
@@ -1,6 +1,6 @@
 
 #include <xen/bitops.h>
-#include <xen/lib.h>
+#include <xen/bug.h>
 
 unsigned int __find_first_bit(
     const unsigned long *addr, unsigned int size)
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 896483a900..be16492c68 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -6,6 +6,7 @@
 #ifndef __ASM_I386_CPUFEATURE_H
 #define __ASM_I386_CPUFEATURE_H
 
+#include <xen/cache.h>
 #include <xen/const.h>
 #include <asm/cpuid.h>
 
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 6e40a03cb3..debf6bfa17 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -1,8 +1,8 @@
 #ifndef __ASM_SYSTEM_H
 #define __ASM_SYSTEM_H
 
-#include <xen/lib.h>
 #include <xen/bitops.h>
+#include <xen/bug.h>
 #include <asm/cpufeature.h>
 #include <asm/x86-defns.h>
 
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index f49e10475f..19ca64d792 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -19,6 +19,8 @@ static inline unsigned long canonicalise_addr(unsigned long addr)
         return addr & ~CANONICAL_MASK;
 }
 
+#include <xen/bug.h>
+
 #include <xen/types.h>
 
 #include <xen/pdx.h>
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 33f2870508..0fa26ba00a 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -8,6 +8,7 @@
 
 #ifdef __XEN__
 
+# include <xen/bug.h>
 # include <xen/kernel.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
index 5a91fe28cc..77f138a6c5 100644
--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -1,6 +1,6 @@
+#include <xen/bug.h>
 #include <xen/efi.h>
 #include <xen/errno.h>
-#include <xen/lib.h>
 
 bool efi_enabled(unsigned int feature)
 {
diff --git a/xen/common/version.c b/xen/common/version.c
index e807ef4de0..80869430fc 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -1,3 +1,4 @@
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 #include <xen/errno.h>
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index ff0048e5f8..5561495b27 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -51,7 +51,7 @@ struct hvm_save_descriptor {
     struct __HVM_SAVE_TYPE_##_x { _type t; char c[_code]; char cpt[2];};  \
     struct __HVM_SAVE_TYPE_COMPAT_##_x { _ctype t; }
 
-# include <xen/lib.h> /* BUG() */
+# include <xen/bug.h> /* BUG() */
 # define DECLARE_HVM_SAVE_TYPE(_x, _code, _type)                         \
     static inline int __HVM_SAVE_FIX_COMPAT_##_x(void *h, uint32_t size) \
         { BUG(); return -1; }                                            \
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 4bd0be5088..7c150b7032 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -16,6 +16,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/compiler.h>
 #include <xen/macros.h>
 #include <xen/types.h>
 
@@ -127,6 +128,24 @@ static void always_inline run_in_exception_handler(
 } while ( false )
 #endif
 
+#define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
+#define WARN_ON(p)  ({                  \
+    bool ret_warn_on_ = (p);            \
+                                        \
+    if ( unlikely(ret_warn_on_) )       \
+        WARN();                         \
+    unlikely(ret_warn_on_);             \
+})
+
+#ifndef NDEBUG
+#define ASSERT(p) \
+    do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
+#define ASSERT_UNREACHABLE() assert_failed("unreachable")
+#else
+#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
+#define ASSERT_UNREACHABLE() do { } while (0)
+#endif
+
 #ifdef CONFIG_GENERIC_BUG_FRAME
 
 /*
diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index 145e140481..46e75d54ba 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -55,6 +55,7 @@
  * for_each_present_cpu(cpu)		for-loop cpu over cpu_present_map
  */
 
+#include <xen/bug.h>
 #include <xen/bitmap.h>
 #include <xen/kernel.h>
 #include <xen/random.h>
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 94a836cb4e..6fe2fa8b21 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -14,6 +14,7 @@
 #include <asm/device.h>
 #include <public/xen.h>
 #include <public/device_tree_defs.h>
+#include <xen/bug.h>
 #include <xen/kernel.h>
 #include <xen/string.h>
 #include <xen/types.h>
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 1793be5b6b..4c755cc275 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -5,31 +5,12 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/bug.h>
 #include <xen/inttypes.h>
 #include <xen/stdarg.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/string.h>
 
-#define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
-#define WARN_ON(p)  ({                  \
-    bool ret_warn_on_ = (p);            \
-                                        \
-    if ( unlikely(ret_warn_on_) )       \
-        WARN();                         \
-    unlikely(ret_warn_on_);             \
-})
-
-#ifndef NDEBUG
-#define ASSERT(p) \
-    do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
-#define ASSERT_UNREACHABLE() assert_failed("unreachable")
-#else
-#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
-#define ASSERT_UNREACHABLE() do { } while (0)
-#endif
-
 #define __ACCESS_ONCE(x) ({                             \
             (void)(typeof(x))0; /* Scalar typecheck. */ \
             (volatile typeof(x) *)&(x); })
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index dc5a8c461b..b5eab3a1eb 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -7,7 +7,7 @@
 #ifndef __XEN_LIST_H__
 #define __XEN_LIST_H__
 
-#include <xen/lib.h>
+#include <xen/bug.h>
 #include <asm/system.h>
 
 /*
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 45df4bba4f..ad0eae28bd 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -18,6 +18,8 @@ struct xen_sysctl_livepatch_op;
 
 #ifdef CONFIG_LIVEPATCH
 
+#include <xen/lib.h>
+
 /*
  * We use alternative and exception table code - which by default are __init
  * only, however we need them during runtime. These macros allows us to build
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3d9b2d05a5..bb29b352ec 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -61,6 +61,7 @@
 #ifndef __XEN_MM_H__
 #define __XEN_MM_H__
 
+#include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/mm-frame.h>
 #include <xen/types.h>
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 9170455cde..d8471ffe18 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -1,6 +1,7 @@
 #ifndef _XEN_PARAM_H
 #define _XEN_PARAM_H
 
+#include <xen/bug.h>
 #include <xen/hypfs.h>
 #include <xen/init.h>
 #include <xen/lib.h>
diff --git a/xen/lib/list-sort.c b/xen/lib/list-sort.c
index de1af2ef8b..251764804c 100644
--- a/xen/lib/list-sort.c
+++ b/xen/lib/list-sort.c
@@ -15,6 +15,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/list_sort.h>
 
diff --git a/xen/xsm/flask/ss/ebitmap.h b/xen/xsm/flask/ss/ebitmap.h
index bb43de891d..7b2da8179a 100644
--- a/xen/xsm/flask/ss/ebitmap.h
+++ b/xen/xsm/flask/ss/ebitmap.h
@@ -15,6 +15,7 @@
 #define _SS_EBITMAP_H_
 
 #include <xen/bitmap.h>
+#include <xen/bug.h>
 
 #define EBITMAP_UNIT_NUMS	((32 - sizeof(void *) - sizeof(u32))	\
 					/ sizeof(unsigned long))
-- 
2.43.0


