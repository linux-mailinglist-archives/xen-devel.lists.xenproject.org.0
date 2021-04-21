Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23D366E13
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114675.218579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDlx-0002i3-1T; Wed, 21 Apr 2021 14:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114675.218579; Wed, 21 Apr 2021 14:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDlw-0002hd-UO; Wed, 21 Apr 2021 14:24:08 +0000
Received: by outflank-mailman (input) for mailman id 114675;
 Wed, 21 Apr 2021 14:24:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDlv-0002hS-Ob
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:24:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d84c05e-1612-47fc-af05-0f30e0f543f0;
 Wed, 21 Apr 2021 14:24:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40AD3B4D0;
 Wed, 21 Apr 2021 14:24:06 +0000 (UTC)
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
X-Inumbo-ID: 9d84c05e-1612-47fc-af05-0f30e0f543f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qptv3sDhy3glLo/iGAHFmZQ2Uu0levQpMb7ZH5gYAjo=;
	b=jmordhoN2zOGSVSBlRXfCeIiB4vdFvR6Hr7ADEqqUi2/h/hIE+Nelryqu1kvDpJhUga3fq
	909PMMrhIBEw2HNspd45ZcLJn/UKrVS9ZowJVJpz9/Wz9lL2gURCMEYrAAzD/IWR6kk6nx
	UeJ/8JeeeJUQV7bdfmNnDsJFm5htCLk=
Subject: [PATCH v2 12/20] lib: move strlcat()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <e4b59a63-ab9a-33a8-df97-2262ced22a6f@suse.com>
Date: Wed, 21 Apr 2021 16:24:05 +0200
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
@@ -56,35 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRLCAT
-/**
- * strlcat - Append a %NUL terminated string into a sized buffer
- * @dest: Where to copy the string to
- * @src: Where to copy the string from
- * @size: size of destination buffer
- *
- * Compatible with *BSD: the result is always a valid
- * NUL-terminated string that fits in the buffer (unless,
- * of course, the buffer size is zero).
- */
-size_t strlcat(char *dest, const char *src, size_t size)
-{
-	size_t slen = strlen(src);
-	size_t dlen = strnlen(dest, size);
-	char *p = dest + dlen;
-
-	while ((p - dest) < size)
-		if ((*p++ = *src++) == '\0')
-			break;
-
-	if (dlen < size)
-		*(p-1) = '\0';
-
-	return slen + dlen;
-}
-EXPORT_SYMBOL(strlcat);
-#endif
-
 #ifndef __HAVE_ARCH_STRCHR
 /**
  * strchr - Find the first occurrence of a character in a string
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -15,6 +15,7 @@ lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
 lib-y += strcmp.o
+lib-y += strlcat.o
 lib-y += strlcpy.o
 lib-y += strlen.o
 lib-y += strncmp.o
--- /dev/null
+++ b/xen/lib/strlcat.c
@@ -0,0 +1,41 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strlcat - Append a %NUL terminated string into a sized buffer
+ * @dest: Where to copy the string to
+ * @src: Where to copy the string from
+ * @size: size of destination buffer
+ *
+ * Compatible with *BSD: the result is always a valid
+ * NUL-terminated string that fits in the buffer (unless,
+ * of course, the buffer size is zero).
+ */
+size_t strlcat(char *dest, const char *src, size_t size)
+{
+	size_t slen = strlen(src);
+	size_t dlen = strnlen(dest, size);
+	char *p = dest + dlen;
+
+	while ((p - dest) < size)
+		if ((*p++ = *src++) == '\0')
+			break;
+
+	if (dlen < size)
+		*(p-1) = '\0';
+
+	return slen + dlen;
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


