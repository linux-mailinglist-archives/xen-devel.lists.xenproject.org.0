Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A59366DFE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114629.218481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDi0-0001Qo-Hb; Wed, 21 Apr 2021 14:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114629.218481; Wed, 21 Apr 2021 14:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDi0-0001PN-E8; Wed, 21 Apr 2021 14:20:04 +0000
Received: by outflank-mailman (input) for mailman id 114629;
 Wed, 21 Apr 2021 14:20:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDhz-0001IQ-HO
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:20:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e7d62fd-09e3-4208-ad9c-2218983a4961;
 Wed, 21 Apr 2021 14:20:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11B76B4D2;
 Wed, 21 Apr 2021 14:20:02 +0000 (UTC)
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
X-Inumbo-ID: 8e7d62fd-09e3-4208-ad9c-2218983a4961
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMbNhxvtMq9ZbvXRz7K3D0FtL1970oZAtxN+hjxjzs4=;
	b=EUS0ZLZr56tjgYiJxWjYk/08qI0ufPHLI2Pl4Boo14WdDZS3BLanwY/I4CtlBce05GfZsT
	siFoNCbyUuD7D7y0cS5Rww2VkUWv9CYH009c9soHCW3Htocj3nKk6mKCgV3tvMzdvboc+3
	cLxN0APDV1U9MD4XCnndNI/Cpw8EhRo=
Subject: [PATCH v2 05/20] lib: move memchr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <50a77bf7-e35b-be24-9cc3-a1691e7c7f90@suse.com>
Date: Wed, 21 Apr 2021 16:20:01 +0200
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
@@ -311,28 +311,6 @@ char *(strstr)(const char *s1, const cha
 }
 #endif
 
-#ifndef __HAVE_ARCH_MEMCHR
-/**
- * memchr - Find a character in an area of memory.
- * @s: The memory area
- * @c: The byte to search for
- * @n: The size of the area.
- *
- * returns the address of the first occurrence of @c, or %NULL
- * if @c is not found
- */
-void *(memchr)(const void *s, int c, size_t n)
-{
-	const unsigned char *p = s;
-
-	while (n--)
-		if ((unsigned char)c == *p++)
-			return (void *)(p - 1);
-
-	return NULL;
-}
-#endif
-
 /**
  * memchr_inv - Find an unmatching character in an area of memory.
  * @s: The memory area
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,6 +4,7 @@ lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
+lib-y += memchr.o
 lib-y += memcmp.o
 lib-y += memcpy.o
 lib-y += memmove.o
--- /dev/null
+++ b/xen/lib/memchr.c
@@ -0,0 +1,35 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * memchr - Find a character in an area of memory.
+ * @s: The memory area
+ * @c: The byte to search for
+ * @n: The size of the area.
+ *
+ * returns the address of the first occurrence of @c, or %NULL
+ * if @c is not found
+ */
+void *(memchr)(const void *s, int c, size_t n)
+{
+	const unsigned char *p = s;
+
+	while (n--)
+		if ((unsigned char)c == *p++)
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


