Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0004E366E1E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114692.218627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDnH-0003H6-9W; Wed, 21 Apr 2021 14:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114692.218627; Wed, 21 Apr 2021 14:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDnH-0003Gg-5x; Wed, 21 Apr 2021 14:25:31 +0000
Received: by outflank-mailman (input) for mailman id 114692;
 Wed, 21 Apr 2021 14:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDnF-0003Ew-JL
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:25:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acedf932-278d-4352-b1f6-14c048ce1ed4;
 Wed, 21 Apr 2021 14:25:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13106B4CD;
 Wed, 21 Apr 2021 14:25:27 +0000 (UTC)
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
X-Inumbo-ID: acedf932-278d-4352-b1f6-14c048ce1ed4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmQ/c7gIzOZRlLH5fn36bOJsiqI2Th1uZDRwEg8ZZNY=;
	b=CEEei5MJcJLUjt4oUg8/clwINple8IwJTULy2r+bZYZxZ/GbYtbp9gL5DR4sxCVuc9Emio
	RqqZCJJt/MSsTtiAecObp7mBC0mAgTsd8CjKh0LWfNxBxC5V3eI5Db178VhlERQHJ/E+KN
	TOCXAwX0NRpL5ogPr7Evim28A+Z7eog=
Subject: [PATCH v2 16/20] lib: move strcasecmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <a8657b94-5c9b-f6fd-2d04-db1e0871e65e@suse.com>
Date: Wed, 21 Apr 2021 16:25:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Allow the function to be individually linkable, discardable, and
overridable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/string.c
+++ b/xen/common/string.c
@@ -41,21 +41,6 @@ int strnicmp(const char *s1, const char
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRCASECMP
-int (strcasecmp)(const char *s1, const char *s2)
-{
-    int c1, c2;
-
-    do
-    {
-        c1 = tolower(*s1++);
-        c2 = tolower(*s2++);
-    } while ( c1 == c2 && c1 != 0 );
-
-    return c1 - c2;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSPN
 /**
  * strspn - Calculate the length of the initial substring of @s which only
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-y += strcasecmp.o
 lib-y += strchr.o
 lib-y += strcmp.o
 lib-y += strlcat.o
--- /dev/null
+++ b/xen/lib/strcasecmp.c
@@ -0,0 +1,29 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+#include <xen/ctype.h>
+
+int (strcasecmp)(const char *s1, const char *s2)
+{
+    int c1, c2;
+
+    do
+    {
+        c1 = tolower(*s1++);
+        c2 = tolower(*s2++);
+    } while ( c1 == c2 && c1 != 0 );
+
+    return c1 - c2;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */


