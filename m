Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7D268918
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:17:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlYD-0004c0-UO; Mon, 14 Sep 2020 10:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlYC-0004bY-Gy
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:17:32 +0000
X-Inumbo-ID: a58e72c6-9f15-463d-8589-e88cccf70568
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a58e72c6-9f15-463d-8589-e88cccf70568;
 Mon, 14 Sep 2020 10:17:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22E30B265;
 Mon, 14 Sep 2020 10:17:36 +0000 (UTC)
Subject: [PATCH 5/9] lib: move parse_size_and_unit()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Message-ID: <823c1802-9a61-4059-c6a8-61f5c2fad12c@suse.com>
Date: Mon, 14 Sep 2020 12:17:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... into its own CU, to build it into an archive.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/lib.c     | 39 ----------------------------------
 xen/lib/Makefile     |  1 +
 xen/lib/parse-size.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 39 deletions(-)
 create mode 100644 xen/lib/parse-size.c

diff --git a/xen/common/lib.c b/xen/common/lib.c
index a224efa8f6e8..6cfa332142a5 100644
--- a/xen/common/lib.c
+++ b/xen/common/lib.c
@@ -423,45 +423,6 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 #endif
 }
 
-unsigned long long parse_size_and_unit(const char *s, const char **ps)
-{
-    unsigned long long ret;
-    const char *s1;
-
-    ret = simple_strtoull(s, &s1, 0);
-
-    switch ( *s1 )
-    {
-    case 'T': case 't':
-        ret <<= 10;
-        /* fallthrough */
-    case 'G': case 'g':
-        ret <<= 10;
-        /* fallthrough */
-    case 'M': case 'm':
-        ret <<= 10;
-        /* fallthrough */
-    case 'K': case 'k':
-        ret <<= 10;
-        /* fallthrough */
-    case 'B': case 'b':
-        s1++;
-        break;
-    case '%':
-        if ( ps )
-            break;
-        /* fallthrough */
-    default:
-        ret <<= 10; /* default to kB */
-        break;
-    }
-
-    if ( ps != NULL )
-        *ps = s1;
-
-    return ret;
-}
-
 typedef void (*ctor_func_t)(void);
 extern const ctor_func_t __ctors_start[], __ctors_end[];
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 764f3624b5f9..99f857540c99 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_X86) += x86/
 
 lib-y += ctype.o
 lib-y += list-sort.o
+lib-y += parse-size.o
diff --git a/xen/lib/parse-size.c b/xen/lib/parse-size.c
new file mode 100644
index 000000000000..ec980cadfff3
--- /dev/null
+++ b/xen/lib/parse-size.c
@@ -0,0 +1,50 @@
+#include <xen/lib.h>
+
+unsigned long long parse_size_and_unit(const char *s, const char **ps)
+{
+    unsigned long long ret;
+    const char *s1;
+
+    ret = simple_strtoull(s, &s1, 0);
+
+    switch ( *s1 )
+    {
+    case 'T': case 't':
+        ret <<= 10;
+        /* fallthrough */
+    case 'G': case 'g':
+        ret <<= 10;
+        /* fallthrough */
+    case 'M': case 'm':
+        ret <<= 10;
+        /* fallthrough */
+    case 'K': case 'k':
+        ret <<= 10;
+        /* fallthrough */
+    case 'B': case 'b':
+        s1++;
+        break;
+    case '%':
+        if ( ps )
+            break;
+        /* fallthrough */
+    default:
+        ret <<= 10; /* default to kB */
+        break;
+    }
+
+    if ( ps != NULL )
+        *ps = s1;
+
+    return ret;
+}
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
-- 
2.22.0



