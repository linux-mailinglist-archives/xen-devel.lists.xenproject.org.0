Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9738CEAA3
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729747.1135022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8n-0007qh-8j; Fri, 24 May 2024 20:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729747.1135022; Fri, 24 May 2024 20:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8n-0007mt-5M; Fri, 24 May 2024 20:03:49 +0000
Received: by outflank-mailman (input) for mailman id 729747;
 Fri, 24 May 2024 20:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8l-000773-Ln
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba408386-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:46 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6265d3ccbdso119940266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:46 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:44 -0700 (PDT)
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
X-Inumbo-ID: ba408386-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581025; x=1717185825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaUcCJcK4BqMwPMepfH6t6Qsv4SxK/nVUJrRoe6o34w=;
        b=mcHmkHjUoslQCFVUUDVK61dolAGHbnYX1FUg2gGl/K3AJY6Nw6Kggp2e0+AsUSYZRs
         oSfwJz6/aP0o3Wmqmvpfpc2EE669FIYhXACVEgM641/p8Q460Pn38PKfKYska7TungVt
         gYmSp9V66Kdn2T2JUjQzlX9p2x/ESKoY1FO7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581025; x=1717185825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaUcCJcK4BqMwPMepfH6t6Qsv4SxK/nVUJrRoe6o34w=;
        b=OJ9gibelfdSO8X4kgtWJoEF0hU9FKEz/oclUvDmNaidzEQ78iwpAoIGMLzveRBST+2
         EEHFnrdGBdwHQ6XZ1SrkUX+8dAADAG4AueRkBn50jIAYpNnNkPjdlsmHx+rZP2kV7l1a
         rg5doEm/6KKUDYXkbDA4uHLCf/xvN/fqEU726MZxRYTwpmnIjQ+WU5yQ3NkKlrhfT9sg
         po4fGjPpeJMX3TqHRxwsy0XehJvbyfeF4f+A5sZ6Rk0JM7J6cACCjZmZPBRXJIhD4/Ar
         2Es3AK9cHxz/TC4UoquMkUUiCnSD+fAbLAXkOTOMep0XLBgmSwZ0IWPlKCmusVH1zfkb
         vw0A==
X-Gm-Message-State: AOJu0Yzne5SbKxM73+nUpfrd7YFGFiOhci0D0cNYa028m1NIo7RpHyA0
	KXnpbWIT2UEx8r+cfpRwkG5C7LSOJVxW8ShhDKB/zNy1CTTwSxbDlRZi5VeK+XOGW3OYYgPN6+r
	M3g4=
X-Google-Smtp-Source: AGHT+IEBtxw2KlfDn/D6rOsVW7w/BH+oTZGKvt35ZLp5TbEGg+n73+jDyDgG5CyxaxQOKjliu8EmvQ==
X-Received: by 2002:a17:906:1d4c:b0:a5c:e2ea:ba59 with SMTP id a640c23a62f3a-a62642dab49mr169622666b.29.1716581025156;
        Fri, 24 May 2024 13:03:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 02/13] xen/bitops: Cleanup ahead of rearrangements
Date: Fri, 24 May 2024 21:03:27 +0100
Message-Id: <20240524200338.1232391-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * Rename __attribute_pure__ to just __pure before it gains users.
 * Introduce __constructor which is going to be used in lib/, and is
   unconditionally cf_check.
 * Identify the areas of xen/bitops.h which are a mess.
 * Introduce xen/boot-check.h as helpers for compile and boot time testing.
   This provides a statement of the ABI, and a confirmation that arch-specific
   implementations behave as expected.

Sadly Clang 7 and older isn't happy with the compile time checks.  Skip them,
and just rely on the runtime checks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * Break macros out into a header as they're going to be used elsewhere too
 * Use panic() rather than BUG_ON() to be more helpful when something fails
 * Brackets in HIDE()
 * Alignment adjustments
 * Skip COMPILE_CHECK() for Clang < 8
---
 xen/include/xen/bitops.h     | 13 ++++++--
 xen/include/xen/boot-check.h | 60 ++++++++++++++++++++++++++++++++++++
 xen/include/xen/compiler.h   |  3 +-
 3 files changed, 72 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/xen/boot-check.h

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index e3c5a4ccf321..9b40f20381a2 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -1,5 +1,7 @@
-#ifndef _LINUX_BITOPS_H
-#define _LINUX_BITOPS_H
+#ifndef XEN_BITOPS_H
+#define XEN_BITOPS_H
+
+#include <xen/compiler.h>
 #include <xen/types.h>
 
 /*
@@ -103,8 +105,13 @@ static inline int generic_flsl(unsigned long x)
  * Include this here because some architectures need generic_ffs/fls in
  * scope
  */
+
+/* --------------------- Please tidy above here --------------------- */
+
 #include <asm/bitops.h>
 
+/* --------------------- Please tidy below here --------------------- */
+
 #ifndef find_next_bit
 /**
  * find_next_bit - find the next set bit in a memory region
@@ -294,4 +301,4 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
 
 #define BIT_WORD(nr) ((nr) / BITS_PER_LONG)
 
-#endif
+#endif /* XEN_BITOPS_H */
diff --git a/xen/include/xen/boot-check.h b/xen/include/xen/boot-check.h
new file mode 100644
index 000000000000..250f9a40d3b0
--- /dev/null
+++ b/xen/include/xen/boot-check.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Helpers for boot-time checks of basic logic, including confirming that
+ * examples which should be calculated by the compiler are.
+ */
+#ifndef XEN_BOOT_CHECK_H
+#define XEN_BOOT_CHECK_H
+
+#include <xen/lib.h>
+
+/* Hide a value from the optimiser. */
+#define HIDE(x)                                                         \
+    ({ typeof(x) _x = (x); asm volatile ( "" : "+r" (_x) ); _x; })
+
+/*
+ * Check that fn(val) can be calcuated by the compiler, and that it gives the
+ * expected answer.
+ *
+ * Clang < 8 can't fold constants through static inlines, causing this to
+ * fail.  Simply skip it for incredibly old compilers.
+ */
+#if !CONFIG_CC_IS_CLANG || CONFIG_CLANG_VERSION >= 80000
+#define COMPILE_CHECK(fn, val, res)                                     \
+    do {                                                                \
+        typeof(fn(val)) real = fn(val);                                 \
+                                                                        \
+        if ( !__builtin_constant_p(real) )                              \
+            asm ( ".error \"'" STR(fn(val)) "' not compile-time constant\"" ); \
+        else if ( real != res )                                         \
+            asm ( ".error \"Compile time check '" STR(fn(val) == res) "' failed\"" ); \
+    } while ( 0 )
+#else
+#define COMPILE_CHECK(fn, val, res)
+#endif
+
+/*
+ * Check that Xen's runtime logic for fn(val) gives the expected answer.  This
+ * requires using HIDE() to prevent the optimiser from collapsing the logic
+ * into a constant.
+ */
+#define RUNTIME_CHECK(fn, val, res)                     \
+    do {                                                \
+        typeof(fn(val)) real = fn(HIDE(val));           \
+                                                        \
+        if ( real != res )                              \
+            panic("%s: %s(%s) expected %u, got %u\n",   \
+                  __func__, #fn, #val, real, res);      \
+    } while ( 0 )
+
+/*
+ * Perform compiletime and runtime checks for fn(val) == res.
+ */
+#define CHECK(fn, val, res)                     \
+    do {                                        \
+        COMPILE_CHECK(fn, val, res);            \
+        RUNTIME_CHECK(fn, val, res);            \
+    } while ( 0 )
+
+#endif /* XEN_BOOT_CHECK_H */
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 179ff23e62c5..444bf80142c7 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -86,7 +86,8 @@
 #define inline inline __init
 #endif
 
-#define __attribute_pure__  __attribute__((__pure__))
+#define __constructor       __attribute__((__constructor__)) cf_check
+#define __pure              __attribute__((__pure__))
 #define __attribute_const__ __attribute__((__const__))
 #define __transparent__     __attribute__((__transparent_union__))
 
-- 
2.30.2


