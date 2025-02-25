Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD520A44FD7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895983.1304658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3KL-00069U-B0; Tue, 25 Feb 2025 22:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895983.1304658; Tue, 25 Feb 2025 22:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3KL-00067t-87; Tue, 25 Feb 2025 22:22:57 +0000
Received: by outflank-mailman (input) for mailman id 895983;
 Tue, 25 Feb 2025 22:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3KJ-00067n-Ht
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:22:55 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e01c4f1-f3c7-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 23:22:53 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43948021a45so53713755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:22:53 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm1230085e9.39.2025.02.25.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:22:50 -0800 (PST)
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
X-Inumbo-ID: 0e01c4f1-f3c7-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740522172; x=1741126972; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eayIU0m1ZC4RCNc5zh9jKwjRL5F17ZNM5e8xgM6GYcE=;
        b=Cg3C7Drh8RhsG1BbAhnl6TFZqBSMC015/F3io7IMOZPaV6tp1HX00HT/38pDHVL81S
         5rC9JnnxdvYqe5j1M4SiG7DOkddnYBWFnFMdEvPLIQ3mEB+N8iHzXeMBw6BoVz1jljhn
         gSHgokT6JBZMpLeVYIR0U1PV2ML/COGaDC9Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522172; x=1741126972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eayIU0m1ZC4RCNc5zh9jKwjRL5F17ZNM5e8xgM6GYcE=;
        b=pTB8yGkFUUbYTaY/ondl2QEL5fwZ1a5byiQwcZ1Tr6CNU3RfaRjJxnpkTB+eLYJDKy
         EPStgV8xzq9hYu0kAGkGk72bvZ0lKprz1iSuhg15u2iBt+9UeD4SlEIwKrrFLrUggnqr
         K4YK+wnxbrsl54cWECZDaKV4KSC+DUOWwXg63pb0Ocuh88EpmUpjz6S7lMTsqQmt87Br
         qy6MmjGodpqweFY1gnbsBhNmPzKzDHMZ+Gk9eo3U8i+IcHgZnLUzKqj32g0BwRysWUiK
         h6X0eYkN7sR26kVHDFV2lgGkJ+L/rW6iep/LCzKEu7AwtLfnarcmEk8hBm/r1KmwGUkr
         09Tg==
X-Gm-Message-State: AOJu0YzjTuFHAXd1L7ZciWfv1jWwkAnFQAlByOcqL/lJHBEcu7CfWa+M
	9OlsAMBfTvaGZaJwdbmlpp9HZZ0q+JTMvzA5vxiQsS6Cl7YFlTB8eqcbdUv2LOKBc2bLUlhoNr9
	4
X-Gm-Gg: ASbGncvVJy+wFZr7RZUwpbdCGuQ/0EZ5B4rVgMCoGMSmali8/B4yXBBT7p5Zy3nVxLY
	SQ15EMtDawGQUbGNDqA16ACaLNcHwhb26+lcZoglrdyMnaOI5I4SvxVq6FF505Km4mk2MAt6FfZ
	GMbyhnNi8CCxc9uxWcuzgxE1nQWWvA0Wwmq8h9HrUegAwjaB+KjOK2piyKxQ3/IIDpHya0gnNXV
	rivPHTbeOm7kb0x8DfJChoUk/WGIAh+QcyzCISNM+02FPrVaCFW8O5aBdmyUBS5ObdbD2CfpLWs
	orjC0bBLS3dChqG66kkdAuGijhorlqPxhdmMZe7mLBhVePUjT8byxcEdUrMaE0IohTmPDqPJbTr
	OD2fI0g==
X-Google-Smtp-Source: AGHT+IFBdnL2DxIj7e0MpoMI0w3MkCe6eA5ifob3FdR1wVzpLn18fRTn0RUFDmLgfOXPTtD+zElPQg==
X-Received: by 2002:a05:600c:4450:b0:43a:b0b5:b0 with SMTP id 5b1f17b1804b1-43ab8fd062bmr9361265e9.4.1740522171688;
        Tue, 25 Feb 2025 14:22:51 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/bsearch: Split out of lib.h into it's own header
Date: Tue, 25 Feb 2025 22:20:48 +0000
Message-Id: <20250225222048.1181435-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are currently two users, and lib.h is included everywhere.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

This will marginally improve compile times, but mostly it's about splitting up
lib.h
---
 xen/arch/arm/io.c             |  1 +
 xen/arch/arm/vgic/vgic-mmio.c |  1 +
 xen/include/xen/bsearch.h     | 50 +++++++++++++++++++++++++++++++++++
 xen/include/xen/lib.h         | 43 ------------------------------
 4 files changed, 52 insertions(+), 43 deletions(-)
 create mode 100644 xen/include/xen/bsearch.h

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 96c740d5636c..653428e16c1f 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include <xen/bsearch.h>
 #include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/spinlock.h>
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index bd4caf7fc326..4ad350c21c8b 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -13,6 +13,7 @@
  */
 
 #include <xen/bitops.h>
+#include <xen/bsearch.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <asm/new_vgic.h>
diff --git a/xen/include/xen/bsearch.h b/xen/include/xen/bsearch.h
new file mode 100644
index 000000000000..544fe83e2cfc
--- /dev/null
+++ b/xen/include/xen/bsearch.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_BSEARCH_H
+#define XEN_BSEARCH_H
+
+#include <xen/types.h>
+
+/*
+ * bsearch - binary search an array of elements
+ * @key: pointer to item being searched for
+ * @base: pointer to first element to search
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp: pointer to comparison function
+ *
+ * This function does a binary search on the given array.  The
+ * contents of the array should already be in ascending sorted order
+ * under the provided comparison function.
+ *
+ * Note that the key need not have the same type as the elements in
+ * the array, e.g. key could be a string and the comparison function
+ * could compare the string with the struct's name field.  However, if
+ * the key and elements in the array are of the same type, you can use
+ * the same comparison function for both sort() and bsearch().
+ */
+#ifndef BSEARCH_IMPLEMENTATION
+extern gnu_inline
+#endif
+void *bsearch(const void *key, const void *base, size_t num, size_t size,
+              int (*cmp)(const void *key, const void *elt))
+{
+    size_t start = 0, end = num;
+    int result;
+
+    while ( start < end )
+    {
+        size_t mid = start + (end - start) / 2;
+
+        result = cmp(key, base + mid * size);
+        if ( result < 0 )
+            end = mid;
+        else if ( result > 0 )
+            start = mid + 1;
+        else
+            return (void *)base + mid * size;
+    }
+
+    return NULL;
+}
+
+#endif /* XEN_BSEARCH_H */
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 130f96791f75..7060b5d5b658 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -159,49 +159,6 @@ void cf_check dump_execstate(const struct cpu_user_regs *regs);
 
 void init_constructors(void);
 
-/*
- * bsearch - binary search an array of elements
- * @key: pointer to item being searched for
- * @base: pointer to first element to search
- * @num: number of elements
- * @size: size of each element
- * @cmp: pointer to comparison function
- *
- * This function does a binary search on the given array.  The
- * contents of the array should already be in ascending sorted order
- * under the provided comparison function.
- *
- * Note that the key need not have the same type as the elements in
- * the array, e.g. key could be a string and the comparison function
- * could compare the string with the struct's name field.  However, if
- * the key and elements in the array are of the same type, you can use
- * the same comparison function for both sort() and bsearch().
- */
-#ifndef BSEARCH_IMPLEMENTATION
-extern gnu_inline
-#endif
-void *bsearch(const void *key, const void *base, size_t num, size_t size,
-              int (*cmp)(const void *key, const void *elt))
-{
-    size_t start = 0, end = num;
-    int result;
-
-    while ( start < end )
-    {
-        size_t mid = start + (end - start) / 2;
-
-        result = cmp(key, base + mid * size);
-        if ( result < 0 )
-            end = mid;
-        else if ( result > 0 )
-            start = mid + 1;
-        else
-            return (void *)base + mid * size;
-    }
-
-    return NULL;
-}
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __LIB_H__ */
-- 
2.39.5


