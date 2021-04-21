Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22315366E2E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114715.218675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDod-0003nT-Ce; Wed, 21 Apr 2021 14:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114715.218675; Wed, 21 Apr 2021 14:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDod-0003n2-9b; Wed, 21 Apr 2021 14:26:55 +0000
Received: by outflank-mailman (input) for mailman id 114715;
 Wed, 21 Apr 2021 14:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDoc-0003mo-4P
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:26:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eea3bb6-d7ab-44e6-845c-621b4b4e187c;
 Wed, 21 Apr 2021 14:26:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 408BDAF65;
 Wed, 21 Apr 2021 14:26:52 +0000 (UTC)
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
X-Inumbo-ID: 4eea3bb6-d7ab-44e6-845c-621b4b4e187c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2H21liw5DO3IL1nQvzkhzYeKaGhal3AQ8PDJbmUMCo=;
	b=XqP2dv9mov/1KCzTSo1Vao8a0tPp7NgMQrVDUIvJR5jYig9xHAd2ROdke6ZI9n/T1Tauu2
	ZnYLhA4Rf7N6krTfb7dFrXfNLyZOGQZdauKb5YxjH3iSuVMDzFOzjs8G5t4edx15tudKEy
	QZYEjB4sMA3miMyLa5I7PJgn59OaJwc=
Subject: [PATCH v2 20/20] lib: move strsep()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <e142b4c6-a816-e3b9-baaf-95f6796b960c@suse.com>
Date: Wed, 21 Apr 2021 16:26:51 +0200
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

--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -40,7 +40,6 @@ obj-y += softirq.o
 obj-y += smp.o
 obj-y += spinlock.o
 obj-y += stop_machine.o
-obj-y += string.o
 obj-y += symbols.o
 obj-y += tasklet.o
 obj-y += time.o
--- a/xen/common/string.c
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- *  linux/lib/string.c
- *
- *  Copyright (C) 1991, 1992  Linus Torvalds
- */
-
-#include <xen/types.h>
-#include <xen/string.h>
-#include <xen/ctype.h>
-
-#ifndef __HAVE_ARCH_STRSEP
-/**
- * strsep - Split a string into tokens
- * @s: The string to be searched
- * @ct: The characters to search for
- *
- * strsep() updates @s to point after the token, ready for the next call.
- *
- * It returns empty tokens, too, behaving exactly like the libc function
- * of that name. In fact, it was stolen from glibc2 and de-fancy-fied.
- * Same semantics, slimmer shape. ;)
- */
-char * strsep(char **s, const char *ct)
-{
-	char *sbegin = *s, *end;
-
-	if (sbegin == NULL)
-		return NULL;
-
-	end = strpbrk(sbegin, ct);
-	if (end)
-		*end++ = '\0';
-	*s = end;
-
-	return sbegin;
-}
-#endif
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * tab-width: 8
- * indent-tabs-mode: t
- * End:
- */
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -25,6 +25,7 @@ lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strpbrk.o
 lib-y += strrchr.o
+lib-y += strsep.o
 lib-y += strspn.o
 lib-y += strstr.o
 lib-$(CONFIG_X86) += xxhash32.o
--- /dev/null
+++ b/xen/lib/strsep.c
@@ -0,0 +1,41 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strsep - Split a string into tokens
+ * @s: The string to be searched
+ * @ct: The characters to search for
+ *
+ * strsep() updates @s to point after the token, ready for the next call.
+ *
+ * It returns empty tokens, too, behaving exactly like the libc function
+ * of that name. In fact, it was stolen from glibc2 and de-fancy-fied.
+ * Same semantics, slimmer shape. ;)
+ */
+char *strsep(char **s, const char *ct)
+{
+	char *sbegin = *s, *end;
+
+	if (sbegin == NULL)
+		return NULL;
+
+	end = strpbrk(sbegin, ct);
+	if (end)
+		*end++ = '\0';
+	*s = end;
+
+	return sbegin;
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


