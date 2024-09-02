Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC99688F0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787950.1197412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Av-000115-CP; Mon, 02 Sep 2024 13:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787950.1197412; Mon, 02 Sep 2024 13:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Av-0000y5-41; Mon, 02 Sep 2024 13:32:57 +0000
Received: by outflank-mailman (input) for mailman id 787950;
 Mon, 02 Sep 2024 13:32:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl7As-0000fj-RZ
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 13:32:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dba3bc97-692f-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 15:32:54 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso355546266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 06:32:54 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm562333666b.135.2024.09.02.06.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:32:51 -0700 (PDT)
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
X-Inumbo-ID: dba3bc97-692f-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725283973; x=1725888773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lp4Hjg94tKrZYICmOS2HvNx6IWTgN7ERFoJhbNxt2hw=;
        b=GvSIQAgS67EKP8o1MJr7Ue8tuFw4XaHaCQfRxDyFC5VLn+GCBQB0Cd6j/nbkFdtGax
         32K4mZ7u1dG+dFgX3EOjaZwO/7zgW6btoe58URyUK9UD9/HXurhoeLLzeZFfhH4PkBNx
         r0NapU3/FLHq/zdBqv/jbjiyodpp6JuZx+F2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283973; x=1725888773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp4Hjg94tKrZYICmOS2HvNx6IWTgN7ERFoJhbNxt2hw=;
        b=ChCNEhuuTdtyJ90UmdLDapc6LQ38CoQytfQA/M9Yn29K2zb6kO837b8H5UjVd7sxiV
         iInruN4I01D5AvWVMNEnwRi+xx0xA5UxgQQd5vbZOlNFX1vBCPNavlkONaYGKHopAUrh
         NzNQIaO/Fb/bvEq1kiLVVIjHIFDvG4IeYHxNJX4Y3UozvcbE/CdL5l7oBBDu9xR1yiFD
         2Mm/DQhYiGLoEjT5jjJZGEPl002qTTueU4y+rHURUDyS9/tcrGamXx/ugyBVXY5FY1kU
         k8i7cllmu+ARCYI+zOV+lM9ziHdgPDw06P9vIPu+FZ6RMMacKXhNVLGeNmTTDiYf7hSP
         c3Tw==
X-Gm-Message-State: AOJu0YzZo6PEz32mpwpjYmcA/8a9CWDYuTlUkQyK4wY+A2QZhgr80Mjg
	r7BYxFe5ISN+LymiWiD4rxx8Ah17+IZXAXmGYW4i41CQPTlXXHx1tVO3Aw/AnleHiMOi+2x5Xgv
	4
X-Google-Smtp-Source: AGHT+IF7L5H0cHoI7pyXW0UG3zW0dzJJJBgyMRjpGl+dI8EV9R2woi6ZucqStzp/m2yDzuNf64DR5A==
X-Received: by 2002:a17:906:6a03:b0:a77:e48d:bc8 with SMTP id a640c23a62f3a-a8a1d2c8219mr13502066b.21.1725283972059;
        Mon, 02 Sep 2024 06:32:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 2/4] x86/boot: Use <xen/macros.h>
Date: Mon,  2 Sep 2024 14:32:30 +0100
Message-Id: <20240902133232.3302839-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... rather than opencoding locally.

This involve collecting various macros scattered around Xen (min()/max()
macros from kernel.h, and _p() from lib.h) and moving them into macros.h

In reloc.c, replace ALIGN_UP() with ROUNDUP().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/cmdline.c |  4 ++++
 xen/arch/x86/boot/defs.h    | 19 ----------------
 xen/arch/x86/boot/reloc.c   | 11 +++++-----
 xen/include/xen/kernel.h    | 36 +-----------------------------
 xen/include/xen/lib.h       |  2 --
 xen/include/xen/macros.h    | 44 +++++++++++++++++++++++++++++++++++++
 6 files changed, 55 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index 28a47da7ab02..b7375d106678 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -31,6 +31,7 @@ asm (
     );
 
 #include <xen/kconfig.h>
+#include <xen/macros.h>
 #include <xen/types.h>
 
 #include "defs.h"
@@ -50,6 +51,9 @@ typedef struct __packed {
 #endif
 } early_boot_opts_t;
 
+/* Avoid pulling in all of ctypes.h for this. */
+#define tolower(c)	((c) | 0x20)
+
 /*
  * Space and TAB are obvious delimiters. However, I am
  * adding "\n" and "\r" here too. Just in case when
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index cf9a80d116f3..4d519ac4f5ea 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -24,23 +24,4 @@
 #define __packed	__attribute__((__packed__))
 #define __stdcall	__attribute__((__stdcall__))
 
-#define ALIGN_UP(arg, align) \
-                (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
-
-#define min(x,y) ({ \
-        const typeof(x) _x = (x);       \
-        const typeof(y) _y = (y);       \
-        (void) (&_x == &_y);            \
-        _x < _y ? _x : _y; })
-
-#define max(x,y) ({ \
-        const typeof(x) _x = (x);       \
-        const typeof(y) _y = (y);       \
-        (void) (&_x == &_y);            \
-        _x > _y ? _x : _y; })
-
-#define _p(val)		((void *)(unsigned long)(val))
-
-#define tolower(c)	((c) | 0x20)
-
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index ac8b58b69581..eb9902d73fd9 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -26,6 +26,7 @@ asm (
     "    jmp  reloc                    \n"
     );
 
+#include <xen/macros.h>
 #include <xen/types.h>
 
 #include "defs.h"
@@ -76,7 +77,7 @@ static uint32_t alloc;
 
 static uint32_t alloc_mem(uint32_t bytes)
 {
-    return alloc -= ALIGN_UP(bytes, 16);
+    return alloc -= ROUNDUP(bytes, 16);
 }
 
 static void zero_mem(uint32_t s, uint32_t bytes)
@@ -202,11 +203,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     zero_mem(ptr, sizeof(*mbi_out));
 
     /* Skip Multiboot2 information fixed part. */
-    ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
+    ptr = ROUNDUP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
 
     /* Get the number of modules. */
     for ( tag = _p(ptr); (uint32_t)tag - mbi_in < mbi_fix->total_size;
-          tag = _p(ALIGN_UP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
+          tag = _p(ROUNDUP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
     {
         if ( tag->type == MULTIBOOT2_TAG_TYPE_MODULE )
             ++mbi_out->mods_count;
@@ -227,11 +228,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
     }
 
     /* Skip Multiboot2 information fixed part. */
-    ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
+    ptr = ROUNDUP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
 
     /* Put all needed data into mbi_out. */
     for ( tag = _p(ptr); (uint32_t)tag - mbi_in < mbi_fix->total_size;
-          tag = _p(ALIGN_UP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
+          tag = _p(ROUNDUP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
     {
         switch ( tag->type )
         {
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index bc2440b5f96e..c5b6cc977772 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -5,43 +5,9 @@
  * 'kernel.h' contains some often-used function prototypes etc
  */
 
+#include <xen/macros.h>
 #include <xen/types.h>
 
-/*
- * min()/max() macros that also do
- * strict type-checking.. See the
- * "unnecessary" pointer comparison.
- */
-#define min(x,y) ({ \
-        const typeof(x) _x = (x);       \
-        const typeof(y) _y = (y);       \
-        (void) (&_x == &_y);            \
-        _x < _y ? _x : _y; })
-
-#define max(x,y) ({ \
-        const typeof(x) _x = (x);       \
-        const typeof(y) _y = (y);       \
-        (void) (&_x == &_y);            \
-        _x > _y ? _x : _y; })
-
-/*
- * ..and if you can't take the strict
- * types, you can specify one yourself.
- *
- * Or not use min/max at all, of course.
- */
-#define min_t(type,x,y) \
-        ({ type __x = (x); type __y = (y); __x < __y ? __x: __y; })
-#define max_t(type,x,y) \
-        ({ type __x = (x); type __y = (y); __x > __y ? __x: __y; })
-
-/*
- * pre-processor, array size, and bit field width suitable variants;
- * please don't use in "normal" expressions.
- */
-#define MIN(x,y) ((x) < (y) ? (x) : (y))
-#define MAX(x,y) ((x) > (y) ? (x) : (y))
-
 /**
  * container_of - cast a member of a structure out to the containing structure
  *
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 394319c81863..e884a02ee8ce 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -57,8 +57,6 @@ static inline void
 debugtrace_printk(const char *fmt, ...) {}
 #endif
 
-/* Allows us to use '%p' as general-purpose machine-word format char. */
-#define _p(_x) ((void *)(unsigned long)(_x))
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
 
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 44d723fd121a..19caaa8026ea 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -101,6 +101,50 @@
  */
 #define sizeof_field(type, member) sizeof(((type *)NULL)->member)
 
+/* Cast an arbitrary integer to a pointer. */
+#define _p(x) ((void *)(unsigned long)(x))
+
+/*
+ * min()/max() macros that also do strict type-checking..
+ */
+#define min(x, y)                               \
+    ({                                          \
+        const typeof(x) _x = (x);               \
+        const typeof(y) _y = (y);               \
+        (void)(&_x == &_y); /* typecheck */     \
+        _x < _y ? _x : _y;                      \
+    })
+#define max(x, y)                               \
+    ({                                          \
+        const typeof(x) _x = (x);               \
+        const typeof(y) _y = (y);               \
+        (void)(&_x == &_y); /* typecheck */     \
+        _x > _y ? _x : _y;                      \
+    })
+
+/*
+ * ..and if you can't take the strict types, you can specify one yourself.
+ */
+#define min_t(type, x, y)                       \
+    ({                                          \
+        type __x = (x);                         \
+        type __y = (y);                         \
+        __x < __y ? __x: __y;                   \
+    })
+#define max_t(type, x, y)                       \
+    ({                                          \
+        type __x = (x);                         \
+        type __y = (y);                         \
+        __x > __y ? __x: __y;                   \
+    })
+
+/*
+ * pre-processor, array size, and bit field width suitable variants;
+ * please don't use in "normal" expressions.
+ */
+#define MIN(x, y) ((x) < (y) ? (x) : (y))
+#define MAX(x, y) ((x) > (y) ? (x) : (y))
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __MACROS_H__ */
-- 
2.39.2


