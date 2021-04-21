Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D006366DF6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114603.218435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDga-0000al-7r; Wed, 21 Apr 2021 14:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114603.218435; Wed, 21 Apr 2021 14:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDga-0000aM-4a; Wed, 21 Apr 2021 14:18:36 +0000
Received: by outflank-mailman (input) for mailman id 114603;
 Wed, 21 Apr 2021 14:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDgZ-0000aE-8R
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:18:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89c86038-d41f-4c3e-9bb8-30afb418ba75;
 Wed, 21 Apr 2021 14:18:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABC4CB4CD;
 Wed, 21 Apr 2021 14:18:33 +0000 (UTC)
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
X-Inumbo-ID: 89c86038-d41f-4c3e-9bb8-30afb418ba75
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/d26MLtHBgPluR/30xU7WDm4VyvrZB+0UEUOK8FBrMQ=;
	b=PZUXF+9zIQL0NUDj7+a+2L+tpZgCdGe+PoIJaKFlUyLnMzM5LBK5lOd0Y3T+broKMY9ebm
	24e0n76jF7fd7jrQMCgNow3OhKDH1NhpISnmjsFQGZdJD/bzm2N3BVb4wAUk+8bV85B4vI
	yKIV+bjgfFOyD3Pq5PO33yqphVrqSGA=
Subject: [PATCH v2 01/20] lib: move memset()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <48444e14-5c38-efc2-b9d8-2802678c0639@suse.com>
Date: Wed, 21 Apr 2021 16:18:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

By moving the function into an archive, x86 doesn't need to announce
anymore that is has its own implementation - symbol resolution by the
linker will now guarantee that the generic function remains unused, and
the forwarding to the compiler built-in gets done by the common header
anyway.

Allow the function to be individually linkable, discardable, and
overridable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/string.c
+++ b/xen/common/string.c
@@ -311,26 +311,6 @@ char *(strstr)(const char *s1, const cha
 }
 #endif
 
-#ifndef __HAVE_ARCH_MEMSET
-/**
- * memset - Fill a region of memory with the given value
- * @s: Pointer to the start of the area.
- * @c: The byte to fill the area with
- * @count: The size of the area.
- *
- * Do not use memset() to access IO space, use memset_io() instead.
- */
-void *(memset)(void *s, int c, size_t count)
-{
-	char *xs = (char *) s;
-
-	while (count--)
-		*xs++ = c;
-
-	return s;
-}
-#endif
-
 #ifndef __HAVE_ARCH_MEMCPY
 /**
  * memcpy - Copy one area of memory to another
--- a/xen/include/asm-x86/string.h
+++ b/xen/include/asm-x86/string.h
@@ -7,9 +7,6 @@
 #define __HAVE_ARCH_MEMMOVE
 #define memmove(d, s, n) __builtin_memmove(d, s, n)
 
-#define __HAVE_ARCH_MEMSET
-#define memset(s, c, n) __builtin_memset(s, c, n)
-
 #endif /* __X86_STRING_H__ */
 /*
  * Local variables:
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,6 +4,7 @@ lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
+lib-y += memset.o
 lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
--- /dev/null
+++ b/xen/lib/memset.c
@@ -0,0 +1,33 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * memset - Fill a region of memory with the given value
+ * @s: Pointer to the start of the area.
+ * @c: The byte to fill the area with
+ * @count: The size of the area.
+ *
+ * Do not use memset() to access IO space, use memset_io() instead.
+ */
+void *(memset)(void *s, int c, size_t count)
+{
+	char *xs = (char *) s;
+
+	while (count--)
+		*xs++ = c;
+
+	return s;
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


