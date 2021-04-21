Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBC366E1A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114682.218603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDme-0002xR-Ja; Wed, 21 Apr 2021 14:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114682.218603; Wed, 21 Apr 2021 14:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDme-0002wy-Fu; Wed, 21 Apr 2021 14:24:52 +0000
Received: by outflank-mailman (input) for mailman id 114682;
 Wed, 21 Apr 2021 14:24:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDmc-0002wc-Og
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:24:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd2df82c-3b11-4ca6-887a-cab46643fff1;
 Wed, 21 Apr 2021 14:24:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DAB9AF65;
 Wed, 21 Apr 2021 14:24:49 +0000 (UTC)
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
X-Inumbo-ID: dd2df82c-3b11-4ca6-887a-cab46643fff1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2D22MGhvbC7x5CodaleCmbDoeONjuiqLIbZE1iqDYk=;
	b=q76qnLu3ns85impPYj76blrulor0DQ4UeXkLZLLQ/FcON3gec5Oul5km4Usf4yaQKjueHu
	c0ddaYBQYyG4L1DhD0R14wxZLJaoTz4tct6QcTkSxKfeGVIutbuo4+UxMg2D54EutALDQX
	tj7djIbMlmxCFFPSdiSgRMKuzSxU+Yg=
Subject: [PATCH v2 14/20] lib: move strrchr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <b6dc2e15-98ec-8c9e-b20a-d1d29e0c1f49@suse.com>
Date: Wed, 21 Apr 2021 16:24:49 +0200
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
@@ -56,24 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRRCHR
-/**
- * strrchr - Find the last occurrence of a character in a string
- * @s: The string to be searched
- * @c: The character to search for
- */
-char *(strrchr)(const char *s, int c)
-{
-	const char *p = s + strlen(s);
-
-	for (; *p != (char)c; --p)
-		if (p == s)
-			return NULL;
-
-	return (char *)p;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSPN
 /**
  * strspn - Calculate the length of the initial substring of @s which only
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -21,6 +21,7 @@ lib-y += strlcpy.o
 lib-y += strlen.o
 lib-y += strncmp.o
 lib-y += strnlen.o
+lib-y += strrchr.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strrchr.c
@@ -0,0 +1,31 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strrchr - Find the last occurrence of a character in a string
+ * @s: The string to be searched
+ * @c: The character to search for
+ */
+char *(strrchr)(const char *s, int c)
+{
+	const char *p = s + strlen(s);
+
+	for (; *p != (char)c; --p)
+		if (p == s)
+			return NULL;
+
+	return (char *)p;
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


