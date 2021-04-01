Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5017351367
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104331.199451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuWC-00033q-Tn; Thu, 01 Apr 2021 10:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104331.199451; Thu, 01 Apr 2021 10:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuWC-00033O-Qc; Thu, 01 Apr 2021 10:25:40 +0000
Received: by outflank-mailman (input) for mailman id 104331;
 Thu, 01 Apr 2021 10:25:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuWB-000337-PI
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:25:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 677c0a98-d866-4d9b-8b1c-3e8a1ba29d84;
 Thu, 01 Apr 2021 10:25:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C59AAE86;
 Thu,  1 Apr 2021 10:25:38 +0000 (UTC)
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
X-Inumbo-ID: 677c0a98-d866-4d9b-8b1c-3e8a1ba29d84
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7zV0Im6IiPxLCpobC1iQxqhPYJiA+5gcc1UKfDC95jE=;
	b=qIHew1rsKfuK2G8m4BneQjMHSn9siyKtHP3DEuIQq+5oQ1nJmQe+9C7nowdbf14CV0WPRy
	etbSo5fCeiotdcA1wIInQqazlEfXO1VD0T9Ry7knf37V9+41Dm7TpLxn7KbayQHofmtlsE
	p46FEbFxVz1EMvN4NvzMZGJH7SMAMQ4=
Subject: [PATCH 15/23] lib: move strlcat()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <e4ae348e-dd54-ebbe-6ef8-b47a47fde49e@suse.com>
Date: Thu, 1 Apr 2021 12:25:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

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


