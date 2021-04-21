Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73E366E00
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114634.218494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDiN-0001r9-Py; Wed, 21 Apr 2021 14:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114634.218494; Wed, 21 Apr 2021 14:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDiN-0001qn-Mq; Wed, 21 Apr 2021 14:20:27 +0000
Received: by outflank-mailman (input) for mailman id 114634;
 Wed, 21 Apr 2021 14:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDiL-0001qS-OI
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:20:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d46683da-66f3-4c43-8f60-c9cf69430d10;
 Wed, 21 Apr 2021 14:20:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 166D2B4D0;
 Wed, 21 Apr 2021 14:20:24 +0000 (UTC)
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
X-Inumbo-ID: d46683da-66f3-4c43-8f60-c9cf69430d10
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hNPv/9z1szKdd0KceZZSiWvREDVh3EkEtocexi/+Dc=;
	b=Id8kVtUTkHiZARNT1JFvqAD2xH1LaSYZwsb0d/lLxkT1oGtjumfNxmJHuzOnxl+5L0B78f
	bbcfbd/SUajksZHOlFmPc/7NsLQ9SuQNLfOIDNH3gRciz+nUOhnBLbRJLbksInc7CsD47/
	+QRwXQwrZWSj2sUhv0+1fk8WVW8aKhU=
Subject: [PATCH v2 06/20] lib: move memchr_inv()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <e967d20b-d75e-1358-65e9-440476d2e21a@suse.com>
Date: Wed, 21 Apr 2021 16:20:23 +0200
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
@@ -311,26 +311,6 @@ char *(strstr)(const char *s1, const cha
 }
 #endif
 
-/**
- * memchr_inv - Find an unmatching character in an area of memory.
- * @s: The memory area
- * @c: The byte that is expected
- * @n: The size of the area.
- *
- * returns the address of the first occurrence of a character other than @c,
- * or %NULL if the whole buffer contains just @c.
- */
-void *memchr_inv(const void *s, int c, size_t n)
-{
-	const unsigned char *p = s;
-
-	while (n--)
-		if ((unsigned char)c != *p++)
-			return (void *)(p - 1);
-
-	return NULL;
-}
-
 /*
  * Local variables:
  * mode: C
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -5,6 +5,7 @@ lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
 lib-y += memchr.o
+lib-y += memchr_inv.o
 lib-y += memcmp.o
 lib-y += memcpy.o
 lib-y += memmove.o
--- /dev/null
+++ b/xen/lib/memchr_inv.c
@@ -0,0 +1,35 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * memchr_inv - Find an unmatching character in an area of memory.
+ * @s: The memory area
+ * @c: The byte that is expected
+ * @n: The size of the area.
+ *
+ * returns the address of the first occurrence of a character other than @c,
+ * or %NULL if the whole buffer contains just @c.
+ */
+void *memchr_inv(const void *s, int c, size_t n)
+{
+	const unsigned char *p = s;
+
+	while (n--)
+		if ((unsigned char)c != *p++)
+			return (void *)(p - 1);
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


