Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E3366E17
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114677.218590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDmI-0002or-Ac; Wed, 21 Apr 2021 14:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114677.218590; Wed, 21 Apr 2021 14:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDmI-0002oT-7b; Wed, 21 Apr 2021 14:24:30 +0000
Received: by outflank-mailman (input) for mailman id 114677;
 Wed, 21 Apr 2021 14:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDmG-0002oH-U6
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:24:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id feb0e4c1-2b53-405a-80f1-ccfdac92d2b6;
 Wed, 21 Apr 2021 14:24:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C15B6B4D5;
 Wed, 21 Apr 2021 14:24:26 +0000 (UTC)
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
X-Inumbo-ID: feb0e4c1-2b53-405a-80f1-ccfdac92d2b6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta/mZ1J82vj5/njhIij2ZDZGYO0U9Eh6iVWMMmSf2Hc=;
	b=mQQW/hnM6g7wVezvow6KwkOfMjTW4xX9c95THs01wF5RLNiaXDOrPp7vwvBhG4noXyLonW
	+ac+oz9S/nIHSE1CBN8Ury5ALBJLuS/SyQzFGwt3bgosWPHyCbUw/7SzJ8HULTiVGdWZd0
	j4kfoCDxfSfeQoDnaV95EMbHT30SlAk=
Subject: [PATCH v2 13/20] lib: move strchr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <92e18a3e-bc49-e197-2254-be86c281dbe2@suse.com>
Date: Wed, 21 Apr 2021 16:24:26 +0200
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
@@ -56,21 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRCHR
-/**
- * strchr - Find the first occurrence of a character in a string
- * @s: The string to be searched
- * @c: The character to search for
- */
-char *(strchr)(const char *s, int c)
-{
-	for(; *s != (char) c; ++s)
-		if (*s == '\0')
-			return NULL;
-	return (char *) s;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRRCHR
 /**
  * strrchr - Find the last occurrence of a character in a string
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-y += strchr.o
 lib-y += strcmp.o
 lib-y += strlcat.o
 lib-y += strlcpy.o
--- /dev/null
+++ b/xen/lib/strchr.c
@@ -0,0 +1,28 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strchr - Find the first occurrence of a character in a string
+ * @s: The string to be searched
+ * @c: The character to search for
+ */
+char *(strchr)(const char *s, int c)
+{
+	for(; *s != (char) c; ++s)
+		if (*s == '\0')
+			return NULL;
+	return (char *) s;
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


