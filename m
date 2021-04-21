Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400E7366E0D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114664.218555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDl9-0002Th-EM; Wed, 21 Apr 2021 14:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114664.218555; Wed, 21 Apr 2021 14:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDl9-0002TG-Ao; Wed, 21 Apr 2021 14:23:19 +0000
Received: by outflank-mailman (input) for mailman id 114664;
 Wed, 21 Apr 2021 14:23:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDl7-0002Sw-BO
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:23:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7999c33c-c299-430d-bc2b-59c0ff8eb038;
 Wed, 21 Apr 2021 14:23:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA28FB4D3;
 Wed, 21 Apr 2021 14:23:15 +0000 (UTC)
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
X-Inumbo-ID: 7999c33c-c299-430d-bc2b-59c0ff8eb038
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FvIXCowx2UIw7V4q4GB2nIMWZ/2oM6HHFptc5wvIQ8=;
	b=ay8w0YO2HC27wz0Yo6SJyxWVFYHEuthkRbAM+iqFpR4IwV+diAzeOOV03bvOeDdpWngkLa
	Cp8JS7FVNgbnjZgPvu4rq5OyVVbFPogJ+byPgvO3aXcW4DE1G24sw0c3dZQJtgZiG8xIOt
	D3f8Pw00Ai8p8ooizDG3ilHxePf4tj8=
Subject: [PATCH v2 10/20] lib: move strncmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <d2d821e4-ae56-d659-642a-e93d9cac0ec8@suse.com>
Date: Wed, 21 Apr 2021 16:23:15 +0200
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
@@ -111,27 +111,6 @@ size_t strlcat(char *dest, const char *s
 EXPORT_SYMBOL(strlcat);
 #endif
 
-#ifndef __HAVE_ARCH_STRNCMP
-/**
- * strncmp - Compare two length-limited strings
- * @cs: One string
- * @ct: Another string
- * @count: The maximum number of bytes to compare
- */
-int (strncmp)(const char *cs, const char *ct, size_t count)
-{
-	register signed char __res = 0;
-
-	while (count) {
-		if ((__res = *cs - *ct++) != 0 || !*cs++)
-			break;
-		count--;
-	}
-
-	return __res;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRCHR
 /**
  * strchr - Find the first occurrence of a character in a string
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -16,6 +16,7 @@ lib-y += rbtree.o
 lib-y += sort.o
 lib-y += strcmp.o
 lib-y += strlen.o
+lib-y += strncmp.o
 lib-y += strnlen.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
--- /dev/null
+++ b/xen/lib/strncmp.c
@@ -0,0 +1,34 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strncmp - Compare two length-limited strings
+ * @cs: One string
+ * @ct: Another string
+ * @count: The maximum number of bytes to compare
+ */
+int (strncmp)(const char *cs, const char *ct, size_t count)
+{
+	register signed char __res = 0;
+
+	while (count) {
+		if ((__res = *cs - *ct++) != 0 || !*cs++)
+			break;
+		count--;
+	}
+
+	return __res;
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


