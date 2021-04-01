Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1635134C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104291.199309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuRc-0001ev-5Y; Thu, 01 Apr 2021 10:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104291.199309; Thu, 01 Apr 2021 10:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuRc-0001eV-2D; Thu, 01 Apr 2021 10:20:56 +0000
Received: by outflank-mailman (input) for mailman id 104291;
 Thu, 01 Apr 2021 10:20:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuRa-0001eO-T3
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:20:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9035512-b6ab-4b7c-a279-ff6205c89325;
 Thu, 01 Apr 2021 10:20:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A61DAE86;
 Thu,  1 Apr 2021 10:20:53 +0000 (UTC)
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
X-Inumbo-ID: d9035512-b6ab-4b7c-a279-ff6205c89325
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/o0dWVTmD5cz4sBu9wV/IeNaEozXqujf7L4dzcBth8=;
	b=aK2cPZfJgJb2HHd8yK6Jibspp8y4aisZQvoNWVYGymyoY6ijt9wLNdxwTyIKvZFxtLdv+o
	QAQaUex2GZ995R2gecrbyNVqqtRv070ZYy3hKGAbZLLDGUvPh2lPDnCSlqPCCFXnDMV7CQ
	QMxhhTKl3tEQLQYc0kf41ZKztgCB/7g=
Subject: [PATCH 04/23] lib: move memset()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <ab7672d5-974e-476c-aef9-ecfee8f0112f@suse.com>
Date: Thu, 1 Apr 2021 12:20:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

By moving the function into an archive, x86 doesn't need to announce
anymore that is has its own implementation - symbol resolution by the
linker will now guarantee that the generic function remains unused, and
the forwarding to the compiler built-in gets done by the common header
anyway.

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


