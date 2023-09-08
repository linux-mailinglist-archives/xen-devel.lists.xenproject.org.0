Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE3798A97
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 18:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598077.932581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeE2-0006Gs-H5; Fri, 08 Sep 2023 16:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598077.932581; Fri, 08 Sep 2023 16:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeE2-0006El-E6; Fri, 08 Sep 2023 16:20:54 +0000
Received: by outflank-mailman (input) for mailman id 598077;
 Fri, 08 Sep 2023 16:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8cQz=EY=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qeeE0-0006Dr-N1
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 16:20:52 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad82f35e-4e63-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 18:20:51 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401da71b85eso24135955e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Sep 2023 09:20:51 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bce18000000b003feee8d8011sm5574352wmc.41.2023.09.08.09.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 09:20:50 -0700 (PDT)
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
X-Inumbo-ID: ad82f35e-4e63-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694190051; x=1694794851; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOfLOXf8yDOC8XjMaviIU41n1ePC1cU7Y3evBR4kK7U=;
        b=K8mdn5Q94CNNnx2T8A6ViyRSfG/oVqGYMbGdZPc+CEFx3gQo/2gf54EKOkvy14ol32
         pmp6dQwMDTCcIzb5L6Y7zglAiS9axfKTc5TXczo7Olwpha9q3bMAvzOwJrIVpO5KZupy
         d6BQRHEOQo7KjKlALJBVSV8hYo1LUHXagmoPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694190051; x=1694794851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOfLOXf8yDOC8XjMaviIU41n1ePC1cU7Y3evBR4kK7U=;
        b=IShzHfP3NLw9AVva6/TWmD0VqkccWpU6Li7MP1DG2zjat2czu4c/iQPhn+p/7wcNZU
         Tcsge+REsYiIKJLE2TSkXHLyTMprbKWh+mYK+MmDGeSG4J5p9eo72ZdhVPG+q3Ac7AmF
         /fzkqMEGPe9+aCWV35EH3YElATB+TA2he3Hehl3ZaZSNU+MLSkqb+lHjQQvHleUU/7l4
         u+yItmyf7CdNZA5S5+XPXNDX7C1Gj3aILSLCXPJC+VdR0po/SgQMqVq9KgzjNijWpqp2
         ziyCByva0uviHb14fU7zJGoZRgH00uOlKEq/TjBPh4W5FA8h26ZDoaB5oqEDgEDMs5u3
         70tw==
X-Gm-Message-State: AOJu0Yz/I3CwvDEopT3WXLPejNb6NBBzi24WQQcZWGsGgoCktmqjvF19
	zNJMsUoPTb7PBwR7JjO8/KTmclFaPvaBbFQ5seYp4g==
X-Google-Smtp-Source: AGHT+IFLGgaR3GaQNT/hO3YT4Jx265RaO4F39ZDC5SpvsBK3M3KAx7cJhbueYwfpjTdAt+JecgOvpA==
X-Received: by 2002:a05:600c:2249:b0:3fe:111a:d1d9 with SMTP id a9-20020a05600c224900b003fe111ad1d9mr2578357wmm.25.1694190050831;
        Fri, 08 Sep 2023 09:20:50 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the number of gcov counters depending on the gcc version
Date: Fri,  8 Sep 2023 17:20:31 +0100
Message-ID: <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694189143.git.javi.merino@cloud.com>
References: <cover.1694189143.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current structure of choosing the correct file based on the
compiler version makes us make 33 line files just to define a
constant.  The changes after gcc 4.7 are minimal, just the number of
counters.

Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
remove a lot of the boilerplate and keep the logic of choosing the
GCOV_COUNTER in gcc_4_7.c.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 xen/common/coverage/Makefile  |  6 +-----
 xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
 xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
 xen/common/coverage/gcc_5.c   | 33 ---------------------------------
 xen/common/coverage/gcc_7.c   | 30 ------------------------------
 5 files changed, 10 insertions(+), 109 deletions(-)
 delete mode 100644 xen/common/coverage/gcc_4_9.c
 delete mode 100644 xen/common/coverage/gcc_5.c
 delete mode 100644 xen/common/coverage/gcc_7.c

diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
index 63f98c71d6..d729afc9c7 100644
--- a/xen/common/coverage/Makefile
+++ b/xen/common/coverage/Makefile
@@ -1,11 +1,7 @@
 obj-y += coverage.o
 ifneq ($(CONFIG_CC_IS_CLANG),y)
 obj-y += gcov_base.o gcov.o
-obj-y += $(call cc-ifversion,-lt,0407, \
-		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
-		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
-		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
-		gcc_5.o, gcc_7.o))))
+obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
 else
 obj-y += llvm.o
 endif
diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index 25b4a8bcdc..ddbc9f4bb0 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -18,15 +18,16 @@
 
 #include "gcov.h"
 
-/*
- * GCOV_COUNTERS will be defined if this file is included by other
- * source files.
- */
-#ifndef GCOV_COUNTERS
-# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
-#  error "Wrong version of GCC used to compile gcov"
-# endif
+#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
 #define GCOV_COUNTERS 8
+#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
+#define GCOV_COUNTERS 9
+#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
+#define GCOV_COUNTERS 10
+#elif GCC_VERSION >= 70000
+#define GCOV_COUNTERS 9
+#else
+#error "Wrong version of GCC used to compile gcov"
 #endif
 
 #define GCOV_TAG_FUNCTION_LENGTH        3
diff --git a/xen/common/coverage/gcc_4_9.c b/xen/common/coverage/gcc_4_9.c
deleted file mode 100644
index dcea961936..0000000000
--- a/xen/common/coverage/gcc_4_9.c
+++ /dev/null
@@ -1,33 +0,0 @@
-/*
- *  This code provides functions to handle gcc's profiling data format
- *  introduced with gcc 4.7.
- *
- *  For a better understanding, refer to gcc source:
- *  gcc/gcov-io.h
- *  libgcc/libgcov.c
- *
- *  Uses gcc-internal data definitions.
- *
- *  Imported from Linux and modified for Xen by
- *    Wei Liu <wei.liu2@citrix.com>
- */
-
-#include "gcov.h"
-
-#if !(GCC_VERSION >= 40900 && GCC_VERSION < 50000)
-#error "Wrong version of GCC used to compile gcov"
-#endif
-
-#define GCOV_COUNTERS 9
-
-#include "gcc_4_7.c"
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/coverage/gcc_5.c b/xen/common/coverage/gcc_5.c
deleted file mode 100644
index 6e0d276f3b..0000000000
--- a/xen/common/coverage/gcc_5.c
+++ /dev/null
@@ -1,33 +0,0 @@
-/*
- *  This code provides functions to handle gcc's profiling data format
- *  introduced with gcc 5.
- *
- *  For a better understanding, refer to gcc source:
- *  gcc/gcov-io.h
- *  libgcc/libgcov.c
- *
- *  Uses gcc-internal data definitions.
- *
- *  Imported from Linux and modified for Xen by
- *    Wei Liu <wei.liu2@citrix.com>
- */
-
-#include "gcov.h"
-
-#if GCC_VERSION < 50000 || GCC_VERSION >= 70000
-#error "Wrong version of GCC used to compile gcov"
-#endif
-
-#define GCOV_COUNTERS 10
-
-#include "gcc_4_7.c"
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/coverage/gcc_7.c b/xen/common/coverage/gcc_7.c
deleted file mode 100644
index 3962eb4c76..0000000000
--- a/xen/common/coverage/gcc_7.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- *  This code provides functions to handle gcc's profiling data format
- *  introduced with gcc 7.
- *
- *  For a better understanding, refer to gcc source:
- *  gcc/gcov-io.h
- *  libgcc/libgcov.c
- *
- *  Uses gcc-internal data definitions.
- */
-
-#include "gcov.h"
-
-#if GCC_VERSION < 70000
-#error "Wrong version of GCC used to compile gcov"
-#endif
-
-#define GCOV_COUNTERS 9
-
-#include "gcc_4_7.c"
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.41.0


