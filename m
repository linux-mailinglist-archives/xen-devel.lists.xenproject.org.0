Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94A0366E1D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114686.218615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDmv-00037h-SJ; Wed, 21 Apr 2021 14:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114686.218615; Wed, 21 Apr 2021 14:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDmv-00037J-ON; Wed, 21 Apr 2021 14:25:09 +0000
Received: by outflank-mailman (input) for mailman id 114686;
 Wed, 21 Apr 2021 14:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDmu-000378-A7
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:25:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a525680-f73b-4ea2-836a-3110f4070247;
 Wed, 21 Apr 2021 14:25:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCAD0B4CD;
 Wed, 21 Apr 2021 14:25:06 +0000 (UTC)
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
X-Inumbo-ID: 8a525680-f73b-4ea2-836a-3110f4070247
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8QhvMzXM/i87KvTemiF5H1HaQ7XQjeqnJIEG17bkRhM=;
	b=pUfnmEZN0+1UKyLaoepXW/lcPsD83VUY7OWw8pkI3d/HBH5tRxqb27rTjwHmGFMEWGoWA8
	ghEJ+kQzKpkyGqRv6GdKe8JWHTSDgWWYGEmshycVHVLC4ARpbu0YRSWUmmU8k4dAHKdhLk
	BX0X3sNdyWsht9zTxQwweYBbir4OG30=
Subject: [PATCH v2 15/20] lib: move strstr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <8a44fe36-be00-cfcb-2597-b14b4d4e500c@suse.com>
Date: Wed, 21 Apr 2021 16:25:06 +0200
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
@@ -131,27 +131,6 @@ char * strsep(char **s, const char *ct)
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRSTR
-/**
- * strstr - Find the first substring in a %NUL terminated string
- * @s1: The string to be searched
- * @s2: The string to search for
- */
-char *(strstr)(const char *s1, const char *s2)
-{
-	size_t l1, l2 = strlen(s2);
-
-	if (!l2)
-		return (char *)s1;
-
-	for (l1 = strlen(s1); l1 >= l2; --l1, ++s1)
-		if (!memcmp(s1, s2, l2))
-			return (char *)s1;
-
-	return NULL;
-}
-#endif
-
 /*
  * Local variables:
  * mode: C
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -22,6 +22,7 @@ lib-y += strlen.o
 lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strrchr.o
+lib-y += strstr.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strstr.c
@@ -0,0 +1,34 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strstr - Find the first substring in a %NUL terminated string
+ * @s1: The string to be searched
+ * @s2: The string to search for
+ */
+char *(strstr)(const char *s1, const char *s2)
+{
+	size_t l1, l2 = strlen(s2);
+
+	if (!l2)
+		return (char *)s1;
+
+	for (l1 = strlen(s1); l1 >= l2; --l1, ++s1)
+		if (!memcmp(s1, s2, l2))
+			return (char *)s1;
+
+	return NULL;
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


