Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121532C0EBA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34670.65860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDgn-0007FM-Oe; Mon, 23 Nov 2020 15:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34670.65860; Mon, 23 Nov 2020 15:23:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDgn-0007Ev-JC; Mon, 23 Nov 2020 15:23:37 +0000
Received: by outflank-mailman (input) for mailman id 34670;
 Mon, 23 Nov 2020 15:23:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDgl-0007EG-Ha
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:23:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa93e399-45c3-45b4-8d0d-19fd44d70e05;
 Mon, 23 Nov 2020 15:23:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EA1BAF9E;
 Mon, 23 Nov 2020 15:23:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDgl-0007EG-Ha
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:23:35 +0000
X-Inumbo-ID: fa93e399-45c3-45b4-8d0d-19fd44d70e05
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa93e399-45c3-45b4-8d0d-19fd44d70e05;
	Mon, 23 Nov 2020 15:23:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606145013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23oE8NeUoAj9T9FiFgiIcEmaLzXlZefKvQvHgfauRUg=;
	b=RjjNqObEtvRblsBMrTgZSuG0MDW0CYjNGXDJYciTv0qRDsjQc6MB8CuUscfPDTs8PqsRS7
	VMjqLrLI+cRjq9sYcX7TICbCz6H1sAmT5xXSR8ZBWmk/2xtKmWHywazV64NPJwOK14/Do+
	ntGtkPwlSvQeuBaxNuLPcCqfFZwKVNo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2EA1BAF9E;
	Mon, 23 Nov 2020 15:23:33 +0000 (UTC)
Subject: [PATCH v3 7/8] lib: move bsearch code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <0b676274-e7a0-9591-ddc9-7c7d5c0e1e2d@suse.com>
Date: Mon, 23 Nov 2020 16:23:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Convert this code to an inline function (backed by an instance in an
archive in case the compiler decides against inlining), which results
in not having it in x86 final binaries. This saves a little bit of dead
code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/Makefile        |  1 -
 xen/common/bsearch.c       | 51 --------------------------------------
 xen/include/xen/compiler.h |  1 +
 xen/include/xen/lib.h      | 42 ++++++++++++++++++++++++++++++-
 xen/lib/Makefile           |  1 +
 xen/lib/bsearch.c          | 13 ++++++++++
 6 files changed, 56 insertions(+), 53 deletions(-)
 delete mode 100644 xen/common/bsearch.c
 create mode 100644 xen/lib/bsearch.c

diff --git a/xen/common/Makefile b/xen/common/Makefile
index d65c9fe9cb4e..e8ce23acea67 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
-obj-y += bsearch.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
diff --git a/xen/common/bsearch.c b/xen/common/bsearch.c
deleted file mode 100644
index 7090930aab5c..000000000000
--- a/xen/common/bsearch.c
+++ /dev/null
@@ -1,51 +0,0 @@
-/*
- * A generic implementation of binary search for the Linux kernel
- *
- * Copyright (C) 2008-2009 Ksplice, Inc.
- * Author: Tim Abbott <tabbott@ksplice.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; version 2.
- */
-
-#include <xen/lib.h>
-
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
-void *bsearch(const void *key, const void *base, size_t num, size_t size,
-	      int (*cmp)(const void *key, const void *elt))
-{
-	size_t start = 0, end = num;
-	int result;
-
-	while (start < end) {
-		size_t mid = start + (end - start) / 2;
-
-		result = cmp(key, base + mid * size);
-		if (result < 0)
-			end = mid;
-		else if (result > 0)
-			start = mid + 1;
-		else
-			return (void *)base + mid * size;
-	}
-
-	return NULL;
-}
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index c0e0ee9f27be..2b7acdf3b188 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -12,6 +12,7 @@
 
 #define inline        __inline__
 #define always_inline __inline__ __attribute__ ((__always_inline__))
+#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
 #define noinline      __attribute__((__noinline__))
 
 #define noreturn      __attribute__((__noreturn__))
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index a9679c913d5c..48429b69b8df 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -204,8 +204,48 @@ void dump_execstate(struct cpu_user_regs *);
 
 void init_constructors(void);
 
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
 void *bsearch(const void *key, const void *base, size_t num, size_t size,
-              int (*cmp)(const void *key, const void *elt));
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
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index b0fe8c72acf5..f12dab7a737a 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_X86) += x86/
 
+lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
diff --git a/xen/lib/bsearch.c b/xen/lib/bsearch.c
new file mode 100644
index 000000000000..149f7feafd1f
--- /dev/null
+++ b/xen/lib/bsearch.c
@@ -0,0 +1,13 @@
+/*
+ * A generic implementation of binary search for the Linux kernel
+ *
+ * Copyright (C) 2008-2009 Ksplice, Inc.
+ * Author: Tim Abbott <tabbott@ksplice.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; version 2.
+ */
+
+#define BSEARCH_IMPLEMENTATION
+#include <xen/lib.h>


