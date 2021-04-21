Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEA366DFC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114621.218459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDhR-0000qM-Rp; Wed, 21 Apr 2021 14:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114621.218459; Wed, 21 Apr 2021 14:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDhR-0000pw-Nx; Wed, 21 Apr 2021 14:19:29 +0000
Received: by outflank-mailman (input) for mailman id 114621;
 Wed, 21 Apr 2021 14:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDhP-0000pn-WC
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:19:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9f37bc2-d12e-4e4e-9f66-14e3e0d0ac09;
 Wed, 21 Apr 2021 14:19:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DEF2B4A7;
 Wed, 21 Apr 2021 14:19:26 +0000 (UTC)
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
X-Inumbo-ID: d9f37bc2-d12e-4e4e-9f66-14e3e0d0ac09
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4R2Kmdij+h7UMUrUU26n2n0qiNSiY0BDhxk21aCtqCI=;
	b=bNKJ+PNDRzGe6beV8YHwPrAavJRdDodGVVVAJEOOgCxUJWLIEsypNxa2npUXjO995SYdKs
	7jjk/R2u3blnPbtLHfi5/8UTFmUHHlZyKIP6q7aBqGA935G0+o2LNDlUMqSPwdTPZsvVuN
	uUXANBw9o1HfAKGsmJn6poxD1zaz50g=
Subject: [PATCH v2 03/20] lib: move memmove()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <2eb9714b-3506-1216-1ce8-35ea000a37da@suse.com>
Date: Wed, 21 Apr 2021 16:19:25 +0200
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


