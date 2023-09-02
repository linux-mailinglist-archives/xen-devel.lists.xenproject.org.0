Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA119790AD5
	for <lists+xen-devel@lfdr.de>; Sun,  3 Sep 2023 06:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594834.928332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qcfBh-0001HE-9j; Sun, 03 Sep 2023 04:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594834.928332; Sun, 03 Sep 2023 04:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qcfBh-0001F4-0j; Sun, 03 Sep 2023 04:58:17 +0000
Received: by outflank-mailman (input) for mailman id 594834;
 Sat, 02 Sep 2023 15:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M48F=ES=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qcSKJ-0000OF-Vf
 for xen-devel@lists.xenproject.org; Sat, 02 Sep 2023 15:14:19 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60a65840-49a3-11ee-9b0d-b553b5be7939;
 Sat, 02 Sep 2023 17:14:17 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso2591444f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 02 Sep 2023 08:14:14 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (public.devonshire.individualpubs.co.uk. [82.68.35.2])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a5d5392000000b0031c6e1ea4c7sm8865297wrv.90.2023.09.02.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 08:14:13 -0700 (PDT)
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
X-Inumbo-ID: 60a65840-49a3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693667654; x=1694272454; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2xRYdOEDKtBVaBOyq800sv45VxEh+Q5jz1wP+SEtns=;
        b=IbvnhKEN3c/UHaxWwmjhGGNgZRRSMIMIVsKWOeIS9XHHc6ElY6zlBTgyy/4qdye7DA
         ZY3h/LSzcUFbanSyUqXlVdthd4s8xRrB5Td38GokhU+PKHaTc8kx5Uh63YT1xM1AcTQp
         7dTQMSKRxZ51yqxxUuGiR9sdnytdV7IIRLBK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693667654; x=1694272454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2xRYdOEDKtBVaBOyq800sv45VxEh+Q5jz1wP+SEtns=;
        b=OW9vy/Ziq6q4QUbQOURaKfGk7zmA8AZWqvOoV+sg3OTDb45Ic130kGv9gOB2YczWDc
         Kens3M5R3J1LeX52VBaa6K6IaeVaLjFITi9E3s0qIsZGJKd1L+liZCFNPNQhnKMcMCMq
         lZrh/c9tWdvFiKIB0Hf6z69L1YZHlS65KGvMH/BYOzehJfpdBR8W4GX3g7/tqwWcpy9j
         UHsrED9jYCAV2TEGmuVDSskVhnUQQIQK/ckSUcGWD3wwJV4cI0SQhtZfk8NUoa94Xk6v
         r98kEQ/AyJzeq3ImKZYKTOdhXpZqNCmZt35svr6Pgr+OVjtGbgvrwWFC+XZ65kB1a1zq
         CHgw==
X-Gm-Message-State: AOJu0Yz3GI5KAJMyQdyNphI4ERHM5aAOPwCAwOFOrJDDN7f/ufRAU1wY
	XEEOBQBXr3gWQrNMXbF2iY0BXvjhL1e8oV0u+YU=
X-Google-Smtp-Source: AGHT+IEx4I+vRQr9iEUXOVs7mumFUKLLBV786SNLznYsc880MLZpDjbkh3myjbsMMYY14Wr+g/IrYA==
X-Received: by 2002:adf:f30d:0:b0:317:eee2:6fba with SMTP id i13-20020adff30d000000b00317eee26fbamr3685517wro.40.1693667653866;
        Sat, 02 Sep 2023 08:14:13 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Javi Merino <javi.merino@cloud.com>
Subject: [PATCH] coverage: update gcov info for newer versions of gcc
Date: Sat,  2 Sep 2023 16:11:56 +0100
Message-ID: <20230902151351.10325-1-javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shamelessly copy changes to gcov_info structures from linux so that we
can capture coverage for xen built with newer compilers.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

This doesn't solve all the problems with coverage as Xen still crashes
when trying to reset/read coverage[0]. Still, it's a step forward.

[0] https://gitlab.com/xen-project/xen/-/issues/168

 xen/common/coverage/Makefile  |  4 +++-
 xen/common/coverage/gcc_10.c  | 31 +++++++++++++++++++++++++++++++
 xen/common/coverage/gcc_12.c  | 32 ++++++++++++++++++++++++++++++++
 xen/common/coverage/gcc_4_7.c | 14 ++++++++++++--
 xen/common/coverage/gcc_4_9.c |  1 +
 xen/common/coverage/gcc_5.c   |  1 +
 xen/common/coverage/gcc_7.c   |  3 ++-
 7 files changed, 82 insertions(+), 4 deletions(-)
 create mode 100644 xen/common/coverage/gcc_10.c
 create mode 100644 xen/common/coverage/gcc_12.c

diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
index 63f98c71d6..75d05909f8 100644
--- a/xen/common/coverage/Makefile
+++ b/xen/common/coverage/Makefile
@@ -5,7 +5,9 @@ obj-y += $(call cc-ifversion,-lt,0407, \
 		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
 		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
 		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
-		gcc_5.o, gcc_7.o))))
+		gcc_5.o, $(call cc-ifversion,-lt,1000, \
+		gcc_7.o,  $(call cc-ifversion,-lt,1200, \
+		gcc_10.o, gcc_12.o))))))
 else
 obj-y += llvm.o
 endif
diff --git a/xen/common/coverage/gcc_10.c b/xen/common/coverage/gcc_10.c
new file mode 100644
index 0000000000..f03f5c0f21
--- /dev/null
+++ b/xen/common/coverage/gcc_10.c
@@ -0,0 +1,31 @@
+/*
+ *  This code provides functions to handle gcc's profiling data format
+ *  introduced with gcc 10.
+ *
+ *  For a better understanding, refer to gcc source:
+ *  gcc/gcov-io.h
+ *  libgcc/libgcov.c
+ *
+ *  Uses gcc-internal data definitions.
+ */
+
+#include "gcov.h"
+
+#if GCC_VERSION < 100000 || GCC_VERSION > 120000
+#error "Wrong version of GCC used to compile gcov"
+#endif
+
+#define GCOV_COUNTERS 8
+#define GCOV_UNIT_SIZE 1
+
+#include "gcc_4_7.c"
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/coverage/gcc_12.c b/xen/common/coverage/gcc_12.c
new file mode 100644
index 0000000000..a551b6a51b
--- /dev/null
+++ b/xen/common/coverage/gcc_12.c
@@ -0,0 +1,32 @@
+/*
+ *  This code provides functions to handle gcc's profiling data format
+ *  introduced with gcc 12.
+ *
+ *  For a better understanding, refer to gcc source:
+ *  gcc/gcov-io.h
+ *  libgcc/libgcov.c
+ *
+ *  Uses gcc-internal data definitions.
+ */
+
+#include "gcov.h"
+
+#if GCC_VERSION < 120000
+#error "Wrong version of GCC used to compile gcov"
+#endif
+
+#define GCOV_COUNTERS 8
+/* Since GCC 12.1, sizes are in BYTES and not in WORDS (4B). */
+#define GCOV_UNIT_SIZE 4
+
+#include "gcc_4_7.c"
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index 25b4a8bcdc..bf99062fcb 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -27,6 +27,7 @@
 #  error "Wrong version of GCC used to compile gcov"
 # endif
 #define GCOV_COUNTERS 8
+#define GCOV_UNIT_SIZE 1
 #endif
 
 #define GCOV_TAG_FUNCTION_LENGTH        3
@@ -88,6 +89,10 @@ struct gcov_info {
     unsigned int version;
     struct gcov_info *next;
     unsigned int stamp;
+#if (GCC_VERSION >= 120000)
+    /*  GCC 12.1 introduced a checksum field */
+    unsigned int checksum;
+#endif
     const char *filename;
     void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int);
     unsigned int n_functions;
@@ -160,13 +165,18 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
     pos += gcov_store_uint32(buffer, pos, info->version);
     pos += gcov_store_uint32(buffer, pos, info->stamp);
 
+#if (GCC_VERSION >= 120000)
+    /* Use zero as checksum of the compilation unit. */
+    pos += gcov_store_uint32(buffer, pos, 0);
+#endif
+
     for ( fi_idx = 0; fi_idx < info->n_functions; fi_idx++ )
     {
         fi_ptr = info->functions[fi_idx];
 
         /* Function record. */
         pos += gcov_store_uint32(buffer, pos, GCOV_TAG_FUNCTION);
-        pos += gcov_store_uint32(buffer, pos, GCOV_TAG_FUNCTION_LENGTH);
+        pos += gcov_store_uint32(buffer, pos, GCOV_TAG_FUNCTION_LENGTH * GCOV_UNIT_SIZE);
         pos += gcov_store_uint32(buffer, pos, fi_ptr->ident);
         pos += gcov_store_uint32(buffer, pos, fi_ptr->lineno_checksum);
         pos += gcov_store_uint32(buffer, pos, fi_ptr->cfg_checksum);
@@ -181,7 +191,7 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
             /* Counter record. */
             pos += gcov_store_uint32(buffer, pos,
                                      GCOV_TAG_FOR_COUNTER(ct_idx));
-            pos += gcov_store_uint32(buffer, pos, ci_ptr->num * 2);
+            pos += gcov_store_uint32(buffer, pos, ci_ptr->num * 2 * GCOV_UNIT_SIZE);
 
             for ( cv_idx = 0; cv_idx < ci_ptr->num; cv_idx++ )
                 pos += gcov_store_uint64(buffer, pos, ci_ptr->values[cv_idx]);
diff --git a/xen/common/coverage/gcc_4_9.c b/xen/common/coverage/gcc_4_9.c
index dcea961936..ded89ab9d2 100644
--- a/xen/common/coverage/gcc_4_9.c
+++ b/xen/common/coverage/gcc_4_9.c
@@ -19,6 +19,7 @@
 #endif
 
 #define GCOV_COUNTERS 9
+#define GCOV_UNIT_SIZE 1
 
 #include "gcc_4_7.c"
 
diff --git a/xen/common/coverage/gcc_5.c b/xen/common/coverage/gcc_5.c
index 6e0d276f3b..fe39053311 100644
--- a/xen/common/coverage/gcc_5.c
+++ b/xen/common/coverage/gcc_5.c
@@ -19,6 +19,7 @@
 #endif
 
 #define GCOV_COUNTERS 10
+#define GCOV_UNIT_SIZE 1
 
 #include "gcc_4_7.c"
 
diff --git a/xen/common/coverage/gcc_7.c b/xen/common/coverage/gcc_7.c
index 3962eb4c76..edfdc9fa44 100644
--- a/xen/common/coverage/gcc_7.c
+++ b/xen/common/coverage/gcc_7.c
@@ -11,11 +11,12 @@
 
 #include "gcov.h"
 
-#if GCC_VERSION < 70000
+#if GCC_VERSION < 70000 || GCC_VERSION >= 100000
 #error "Wrong version of GCC used to compile gcov"
 #endif
 
 #define GCOV_COUNTERS 9
+#define GCOV_UNIT_SIZE 1
 
 #include "gcc_4_7.c"
 
-- 
2.41.0


