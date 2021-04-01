Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745735136A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104341.199489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuX8-0003PS-QR; Thu, 01 Apr 2021 10:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104341.199489; Thu, 01 Apr 2021 10:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuX8-0003Oz-Mk; Thu, 01 Apr 2021 10:26:38 +0000
Received: by outflank-mailman (input) for mailman id 104341;
 Thu, 01 Apr 2021 10:26:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuX6-0003Ob-9q
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:26:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7d08cfe-1552-42ff-bcc2-153e05ca75a5;
 Thu, 01 Apr 2021 10:26:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7342AEAE;
 Thu,  1 Apr 2021 10:26:34 +0000 (UTC)
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
X-Inumbo-ID: a7d08cfe-1552-42ff-bcc2-153e05ca75a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z8DfS5OHynFArmQHJ/930SfzIBU1VIyvdrzD+YeXk8=;
	b=Y0eyErH7fv+/zGHrXkC8sVM7VlNzapc1eFJpkUCvGBbk2xhxC6bGEZpbwoavXDaWa4tSZ8
	6mKoZjZWNgY/UJPeSXOpB/iM0CKMoIacWLNSYFKRqcGSL/Wpb1w3gSBKEx4KHw24kUW7Mr
	k7X1xmXHsbDAGXV4viWVgG3YicHtknI=
Subject: [PATCH 18/23] lib: move strstr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <168ae189-b247-af8f-a351-6e4df7e3c19f@suse.com>
Date: Thu, 1 Apr 2021 12:26:34 +0200
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
@@ -131,27 +131,6 @@ char * strsep(char **s, const char *ct)
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRSTR
-/**
- * strstr - Find the first substring in a %NUL terminated string
- * @s1: The string to be searched
- * @s2: The string to search for
- */
-char *(strstr)(const char *s1, const char *s2)
-{
-	size_t l1, l2 = strlen(s2);
-
-	if (!l2)
-		return (char *)s1;
-
-	for (l1 = strlen(s1); l1 >= l2; --l1, ++s1)
-		if (!memcmp(s1, s2, l2))
-			return (char *)s1;
-
-	return NULL;
-}
-#endif
-
 /*
  * Local variables:
  * mode: C
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -22,6 +22,7 @@ lib-y += strlen.o
 lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strrchr.o
+lib-y += strstr.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strstr.c
@@ -0,0 +1,34 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strstr - Find the first substring in a %NUL terminated string
+ * @s1: The string to be searched
+ * @s2: The string to search for
+ */
+char *(strstr)(const char *s1, const char *s2)
+{
+	size_t l1, l2 = strlen(s2);
+
+	if (!l2)
+		return (char *)s1;
+
+	for (l1 = strlen(s1); l1 >= l2; --l1, ++s1)
+		if (!memcmp(s1, s2, l2))
+			return (char *)s1;
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


