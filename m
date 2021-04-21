Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF24366DF7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114605.218446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDgt-0000hj-IG; Wed, 21 Apr 2021 14:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114605.218446; Wed, 21 Apr 2021 14:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDgt-0000hD-EP; Wed, 21 Apr 2021 14:18:55 +0000
Received: by outflank-mailman (input) for mailman id 114605;
 Wed, 21 Apr 2021 14:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDgs-0000gq-8w
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:18:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fec5f106-5e72-4f63-a3b6-08936010f98d;
 Wed, 21 Apr 2021 14:18:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7712B4A7;
 Wed, 21 Apr 2021 14:18:52 +0000 (UTC)
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
X-Inumbo-ID: fec5f106-5e72-4f63-a3b6-08936010f98d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FiBwCz4dwAqT37AlnbBbOZ4vWqaWoYHBKFYgRm0agTA=;
	b=RoT/kousnB94ZwZVfCZHkz6zIqAIF94qOdwqe8b8ZGrMs3mrTOFwd0zBBF6etjPu4LEumS
	/MAUd8Y8+tTEfvKc17gcJw77ZMCuuFthejAVH5JM13ch92STSiWm6fF38f3dLJJY9cDwsy
	EeYCzB+7/PkDjRAxmbhBZkkjw/Er8Q4=
Subject: [PATCH v2 02/20] lib: move memcpy()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <0d651bc9-c877-949b-ff04-937f19fa9f89@suse.com>
Date: Wed, 21 Apr 2021 16:18:52 +0200
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
@@ -311,27 +311,6 @@ char *(strstr)(const char *s1, const cha
 }
 #endif
 
-#ifndef __HAVE_ARCH_MEMCPY
-/**
- * memcpy - Copy one area of memory to another
- * @dest: Where to copy to
- * @src: Where to copy from
- * @count: The size of the area.
- *
- * You should not use this function to access IO space, use memcpy_toio()
- * or memcpy_fromio() instead.
- */
-void *(memcpy)(void *dest, const void *src, size_t count)
-{
-	char *tmp = (char *) dest, *s = (char *) src;
-
-	while (count--)
-		*tmp++ = *s++;
-
-	return dest;
-}
-#endif
-
 #ifndef __HAVE_ARCH_MEMMOVE
 /**
  * memmove - Copy one area of memory to another
--- a/xen/include/asm-x86/string.h
+++ b/xen/include/asm-x86/string.h
@@ -1,9 +1,6 @@
 #ifndef __X86_STRING_H__
 #define __X86_STRING_H__
 
-#define __HAVE_ARCH_MEMCPY
-#define memcpy(d, s, n) __builtin_memcpy(d, s, n)
-
 #define __HAVE_ARCH_MEMMOVE
 #define memmove(d, s, n) __builtin_memmove(d, s, n)
 
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,6 +4,7 @@ lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
+lib-y += memcpy.o
 lib-y += memset.o
 lib-y += muldiv64.o
 lib-y += parse-size.o
--- /dev/null
+++ b/xen/lib/memcpy.c
@@ -0,0 +1,34 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * memcpy - Copy one area of memory to another
+ * @dest: Where to copy to
+ * @src: Where to copy from
+ * @count: The size of the area.
+ *
+ * You should not use this function to access IO space, use memcpy_toio()
+ * or memcpy_fromio() instead.
+ */
+void *(memcpy)(void *dest, const void *src, size_t count)
+{
+	char *tmp = (char *) dest, *s = (char *) src;
+
+	while (count--)
+		*tmp++ = *s++;
+
+	return dest;
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


