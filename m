Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C16366E24
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114706.218650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDnv-0003ZX-Qw; Wed, 21 Apr 2021 14:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114706.218650; Wed, 21 Apr 2021 14:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDnv-0003Z7-Nn; Wed, 21 Apr 2021 14:26:11 +0000
Received: by outflank-mailman (input) for mailman id 114706;
 Wed, 21 Apr 2021 14:26:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDnu-0003Ys-Cn
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:26:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 888cad03-6053-4b2d-acb0-378bef7832e2;
 Wed, 21 Apr 2021 14:26:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFD2CB4D3;
 Wed, 21 Apr 2021 14:26:08 +0000 (UTC)
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
X-Inumbo-ID: 888cad03-6053-4b2d-acb0-378bef7832e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ikAXGR+d4BQ68yH7iPulr9qDYJtJu1Q/hYMFGUEDmQ=;
	b=h9YVw9owsJSwRLAOuwbARKv1fN5XXz07GXtO75c3x9FV8uOXtHa/5VNdPPxxFkhPVq+O0A
	fQCN26olM7rWvOnEjNa1c1B3kYlRgfb4CfylivRzVjGUQxL3papNGHOGXqoYgWT6/r1PZF
	7nlyFKtoXqFUtN/K8JZn8Dwm0hl3+0k=
Subject: [PATCH v2 18/20] lib: move strspn()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <901b2b75-c042-febf-b0cf-a6e7f806b26a@suse.com>
Date: Wed, 21 Apr 2021 16:26:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Allow the function to be individually linkable, discardable, and
overridable. In fact the function is unused at present, and hence will
now get omitted from the final binaries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/string.c
+++ b/xen/common/string.c
@@ -8,33 +8,6 @@
 #include <xen/string.h>
 #include <xen/ctype.h>
 
-#ifndef __HAVE_ARCH_STRSPN
-/**
- * strspn - Calculate the length of the initial substring of @s which only
- * 	contain letters in @accept
- * @s: The string to be searched
- * @accept: The string to search for
- */
-size_t strspn(const char *s, const char *accept)
-{
-	const char *p;
-	const char *a;
-	size_t count = 0;
-
-	for (p = s; *p != '\0'; ++p) {
-		for (a = accept; *a != '\0'; ++a) {
-			if (*p == *a)
-				break;
-		}
-		if (*a == '\0')
-			return count;
-		++count;
-	}
-
-	return count;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRPBRK
 /**
  * strpbrk - Find the first occurrence of a set of characters
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -24,6 +24,7 @@ lib-y += strncasecmp.o
 lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strrchr.o
+lib-y += strspn.o
 lib-y += strstr.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
--- /dev/null
+++ b/xen/lib/strspn.c
@@ -0,0 +1,40 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strspn - Calculate the length of the initial substring of @s which only
+ * 	contain letters in @accept
+ * @s: The string to be searched
+ * @accept: The string to search for
+ */
+size_t strspn(const char *s, const char *accept)
+{
+	const char *p;
+	const char *a;
+	size_t count = 0;
+
+	for (p = s; *p != '\0'; ++p) {
+		for (a = accept; *a != '\0'; ++a) {
+			if (*p == *a)
+				break;
+		}
+		if (*a == '\0')
+			return count;
+		++count;
+	}
+
+	return count;
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


