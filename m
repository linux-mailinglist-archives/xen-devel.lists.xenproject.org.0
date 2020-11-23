Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A692C0EB7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:22:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34647.65824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDff-0006rW-Nj; Mon, 23 Nov 2020 15:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34647.65824; Mon, 23 Nov 2020 15:22:27 +0000
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
	id 1khDff-0006r7-KX; Mon, 23 Nov 2020 15:22:27 +0000
Received: by outflank-mailman (input) for mailman id 34647;
 Mon, 23 Nov 2020 15:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDff-0006r0-1K
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:22:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b20ca46-c071-4c66-af73-a01d9b8724bb;
 Mon, 23 Nov 2020 15:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52C8CAFD8;
 Mon, 23 Nov 2020 15:22:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDff-0006r0-1K
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:22:27 +0000
X-Inumbo-ID: 8b20ca46-c071-4c66-af73-a01d9b8724bb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8b20ca46-c071-4c66-af73-a01d9b8724bb;
	Mon, 23 Nov 2020 15:22:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606144945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAAsFxAwY1+LMn7V37iA5/bcKSLQ7I5O5Ww6wo1JjgI=;
	b=eLAR4Po6k9wxgEstIlr7BI75HvZw2KPCxVJw8xQ6BECGmLTNvihsJFNuSCqBvPq5q5o9KK
	ZrCGzdDy//vGRg/OZB4Ze+bIPSF2oCBccHRLptBa6nLUuPBkFJkAZ0aQjtEW+NJrfCEWVe
	pwfsznhTU1/M3SzQqlYzXclBYv7Lr7Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 52C8CAFD8;
	Mon, 23 Nov 2020 15:22:25 +0000 (UTC)
Subject: [PATCH v3 4/8] lib: move parse_size_and_unit()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <489b3707-9e9c-184b-3e1f-1d28fd1fb0ee@suse.com>
Date: Mon, 23 Nov 2020 16:22:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... into its own CU, to build it into an archive.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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


