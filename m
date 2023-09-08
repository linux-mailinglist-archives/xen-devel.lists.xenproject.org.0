Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C18798A99
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 18:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598078.932592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeE5-0006YB-Oe; Fri, 08 Sep 2023 16:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598078.932592; Fri, 08 Sep 2023 16:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeE5-0006Vt-Kz; Fri, 08 Sep 2023 16:20:57 +0000
Received: by outflank-mailman (input) for mailman id 598078;
 Fri, 08 Sep 2023 16:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8cQz=EY=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qeeE4-0005vx-Az
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 16:20:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af5fac43-4e63-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 18:20:54 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fef56f7248so23746055e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Sep 2023 09:20:54 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bce18000000b003feee8d8011sm5574352wmc.41.2023.09.08.09.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 09:20:53 -0700 (PDT)
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
X-Inumbo-ID: af5fac43-4e63-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694190054; x=1694794854; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6wE+Q6YPhjgRGDUDttaAAhWjDOLXM9ZsbpkHij4TSA=;
        b=jwk3vVjwzUxByXybHEWPNX/3lDDjDWBjQHyfjz2Ko591E4NpvYTNcskng4EJ3f8EML
         7dXEfCJ/iKtioFl7sICe8tK6JpBTqREwY/H+ztYOjrUuNPFCF1AUInv9mvPth2E+jUJ3
         IUATI6QltvbnlzQ/GZYdYdPhoZ7ZY23JM0OrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694190054; x=1694794854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6wE+Q6YPhjgRGDUDttaAAhWjDOLXM9ZsbpkHij4TSA=;
        b=ZLkbGo0zOp8aUf6AStWPxdmmCf3a0nW63ei2XJ/uxKyDgYQJTFAfUlhZ5RCr/ZQ4cr
         RozgQ1rxUwx93E0wpBmOP1tl7BobCv1LIBUyjsrbIQLDuDz8P3JwJjp+cj4vZpBhqudL
         euuNCe088I6/ger6m1T/iMYMFcIDT7JE4eYd8xRJp43juayk8gEJMF5InJgQuwt8gkN0
         1+Pi7YKV/Bi/juiX28UgqLhdIJKKbPkg7I/s79VavjKgL+jHQU18ueAOj+RIz6RCmZrP
         3YVebaDzQohtYL8w5tGU+a6hnImflI/Gazf+eZQ+MYCWb0Y8R+JnEJsIVza/juN1gE8p
         Z7jQ==
X-Gm-Message-State: AOJu0YymcUhgsVMPFTo4xukL0ZSH6guCFfbeL/72MdP2ASRYS3j2gchG
	GZWxhVkFBS4FlXt6diVGlyTdX8lKO/NFkGqgGfihkA==
X-Google-Smtp-Source: AGHT+IHpKLXmgdlDykh/Lnsr/L+EHgmoX4EoZJ5vI1LnOskXlwZ4GNncyfTrAy2rVtqS5OLbNIXq3g==
X-Received: by 2002:a7b:c8c4:0:b0:402:8c7e:3fc4 with SMTP id f4-20020a7bc8c4000000b004028c7e3fc4mr2417637wml.30.1694190054134;
        Fri, 08 Sep 2023 09:20:54 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/2] coverage: update gcov info for newer versions of gcc
Date: Fri,  8 Sep 2023 17:20:32 +0100
Message-ID: <f6495eb4c02f6539c5b95d2850d4a834f2ea94e8.1694189143.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694189143.git.javi.merino@cloud.com>
References: <cover.1694189143.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shamelessly copy changes to gcov_info structures from linux so that we
can capture coverage for xen built with newer compilers.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 xen/common/coverage/gcc_4_7.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index ddbc9f4bb0..8f6e287474 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -24,14 +24,23 @@
 #define GCOV_COUNTERS 9
 #elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
 #define GCOV_COUNTERS 10
-#elif GCC_VERSION >= 70000
+#elif GCC_VERSION >= 70000 && GCC_VERSION < 100000
 #define GCOV_COUNTERS 9
+#elif GCC_VERSION >= 100000
+#define GCOV_COUNTERS 8
 #else
 #error "Wrong version of GCC used to compile gcov"
 #endif
 
 #define GCOV_TAG_FUNCTION_LENGTH        3
 
+#if GCC_VERSION >= 120000
+/* Since GCC 12.1, sizes are in BYTES and not in WORDS (4B). */
+#define GCOV_UNIT_SIZE 4
+#else
+#define GCOV_UNIT_SIZE 1
+#endif
+
 static struct gcov_info *gcov_info_head;
 
 /**
@@ -89,6 +98,10 @@ struct gcov_info {
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
@@ -161,13 +174,18 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
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
@@ -182,7 +200,7 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
             /* Counter record. */
             pos += gcov_store_uint32(buffer, pos,
                                      GCOV_TAG_FOR_COUNTER(ct_idx));
-            pos += gcov_store_uint32(buffer, pos, ci_ptr->num * 2);
+            pos += gcov_store_uint32(buffer, pos, ci_ptr->num * 2 * GCOV_UNIT_SIZE);
 
             for ( cv_idx = 0; cv_idx < ci_ptr->num; cv_idx++ )
                 pos += gcov_store_uint64(buffer, pos, ci_ptr->values[cv_idx]);
-- 
2.41.0


