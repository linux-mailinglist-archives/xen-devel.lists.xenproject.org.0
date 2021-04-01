Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA90351351
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104298.199333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuSU-0001uL-O0; Thu, 01 Apr 2021 10:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104298.199333; Thu, 01 Apr 2021 10:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuSU-0001tv-KS; Thu, 01 Apr 2021 10:21:50 +0000
Received: by outflank-mailman (input) for mailman id 104298;
 Thu, 01 Apr 2021 10:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuST-0001tl-ED
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:21:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74a238bc-faa6-4588-a8a9-7155f24fd142;
 Thu, 01 Apr 2021 10:21:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B82A5AEA6;
 Thu,  1 Apr 2021 10:21:47 +0000 (UTC)
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
X-Inumbo-ID: 74a238bc-faa6-4588-a8a9-7155f24fd142
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlwL2DZgk5QMsxjKNY14U9Y4Ed0W95Lps/NjFQlhkyk=;
	b=kaDKC3HL34Id+gFUhxYyLvm99yhF4rXxMW7FIMhuxPTmBQiRmF3wmZ6EAe/0VgSE1bg0k7
	sjlZn/fYs59zGaFD57At7atwibjezKifjFh5+D1MSUMYqwwwNMrJkAm95y3awCiDl9JBV6
	rbnSbyOADKk+T2dJVYMBvg5oGLClW34=
Subject: [PATCH 06/23] lib: move memmove()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <36449347-69e8-b963-597f-c9359207cf57@suse.com>
Date: Thu, 1 Apr 2021 12:21:47 +0200
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
@@ -311,36 +311,6 @@ char *(strstr)(const char *s1, const cha
 }
 #endif
 
-#ifndef __HAVE_ARCH_MEMMOVE
-/**
- * memmove - Copy one area of memory to another
- * @dest: Where to copy to
- * @src: Where to copy from
- * @count: The size of the area.
- *
- * Unlike memcpy(), memmove() copes with overlapping areas.
- */
-void *(memmove)(void *dest, const void *src, size_t count)
-{
-	char *tmp, *s;
-
-	if (dest <= src) {
-		tmp = (char *) dest;
-		s = (char *) src;
-		while (count--)
-			*tmp++ = *s++;
-		}
-	else {
-		tmp = (char *) dest + count;
-		s = (char *) src + count;
-		while (count--)
-			*--tmp = *--s;
-		}
-
-	return dest;
-}
-#endif
-
 #ifndef __HAVE_ARCH_MEMCMP
 /**
  * memcmp - Compare two areas of memory
--- a/xen/include/asm-x86/string.h
+++ b/xen/include/asm-x86/string.h
@@ -1,9 +1,6 @@
 #ifndef __X86_STRING_H__
 #define __X86_STRING_H__
 
-#define __HAVE_ARCH_MEMMOVE
-#define memmove(d, s, n) __builtin_memmove(d, s, n)
-
 #endif /* __X86_STRING_H__ */
 /*
  * Local variables:
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -5,6 +5,7 @@ lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
 lib-y += memcpy.o
+lib-y += memmove.o
 lib-y += memset.o
 lib-y += muldiv64.o
 lib-y += parse-size.o
--- /dev/null
+++ b/xen/lib/memmove.c
@@ -0,0 +1,42 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * memmove - Copy one area of memory to another
+ * @dest: Where to copy to
+ * @src: Where to copy from
+ * @count: The size of the area.
+ *
+ * Unlike memcpy(), memmove() copes with overlapping areas.
+ */
+void *(memmove)(void *dest, const void *src, size_t count)
+{
+	char *tmp, *s;
+
+	if (dest <= src) {
+		tmp = (char *) dest;
+		s = (char *) src;
+		while (count--)
+			*tmp++ = *s++;
+	} else {
+		tmp = (char *) dest + count;
+		s = (char *) src + count;
+		while (count--)
+			*--tmp = *--s;
+	}
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


