Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E4351366
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104329.199441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuVz-0002yr-K0; Thu, 01 Apr 2021 10:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104329.199441; Thu, 01 Apr 2021 10:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuVz-0002yK-GQ; Thu, 01 Apr 2021 10:25:27 +0000
Received: by outflank-mailman (input) for mailman id 104329;
 Thu, 01 Apr 2021 10:25:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuVx-0002xc-Dv
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:25:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 036094cf-81b8-4011-b6db-fe890cd78cbc;
 Thu, 01 Apr 2021 10:25:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8D0EB032;
 Thu,  1 Apr 2021 10:25:19 +0000 (UTC)
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
X-Inumbo-ID: 036094cf-81b8-4011-b6db-fe890cd78cbc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XwCcLrzETyMlxHJ7JOlZs5KVV79sUmD+2c2kdGaHMA=;
	b=C2+qIz97TYYRdaJ9CP7uqEwCvbZdml6YmzF5BZWsFZ44auIKOPBkDrUPwA4Yo3E3l0Z1zS
	yi2W7ZvuhJYTywOlHaCsP8f9vtCkja3IZfjAQgn9gpfHI83sWBkrGslU3hTiuPTO0T8ezt
	YR/UJJGm5GWHNuW2LQlTWsgVoYkKrLI=
Subject: [PATCH 14/23] lib: move strlcpy()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <eedc922b-ca4c-bfa0-9f4a-eacc01d56cca@suse.com>
Date: Thu, 1 Apr 2021 12:25:19 +0200
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
@@ -56,32 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRLCPY
-/**
- * strlcpy - Copy a %NUL terminated string into a sized buffer
- * @dest: Where to copy the string to
- * @src: Where to copy the string from
- * @size: size of destination buffer
- *
- * Compatible with *BSD: the result is always a valid
- * NUL-terminated string that fits in the buffer (unless,
- * of course, the buffer size is zero). It does not pad
- * out the result like strncpy() does.
- */
-size_t strlcpy(char *dest, const char *src, size_t size)
-{
-	size_t ret = strlen(src);
-
-	if (size) {
-		size_t len = (ret >= size) ? size-1 : ret;
-		memcpy(dest, src, len);
-		dest[len] = '\0';
-	}
-	return ret;
-}
-EXPORT_SYMBOL(strlcpy);
-#endif
-
 #ifndef __HAVE_ARCH_STRLCAT
 /**
  * strlcat - Append a %NUL terminated string into a sized buffer
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -15,6 +15,7 @@ lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
 lib-y += strcmp.o
+lib-y += strlcpy.o
 lib-y += strlen.o
 lib-y += strncmp.o
 lib-y += strnlen.o
--- /dev/null
+++ b/xen/lib/strlcpy.c
@@ -0,0 +1,38 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strlcpy - Copy a %NUL terminated string into a sized buffer
+ * @dest: Where to copy the string to
+ * @src: Where to copy the string from
+ * @size: size of destination buffer
+ *
+ * Compatible with *BSD: the result is always a valid
+ * NUL-terminated string that fits in the buffer (unless,
+ * of course, the buffer size is zero). It does not pad
+ * out the result like strncpy() does.
+ */
+size_t strlcpy(char *dest, const char *src, size_t size)
+{
+	size_t ret = strlen(src);
+
+	if (size) {
+		size_t len = (ret >= size) ? size-1 : ret;
+		memcpy(dest, src, len);
+		dest[len] = '\0';
+	}
+	return ret;
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


