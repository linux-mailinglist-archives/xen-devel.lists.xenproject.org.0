Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B7351362
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104320.199416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuUm-0002gL-TZ; Thu, 01 Apr 2021 10:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104320.199416; Thu, 01 Apr 2021 10:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuUm-0002fv-QH; Thu, 01 Apr 2021 10:24:12 +0000
Received: by outflank-mailman (input) for mailman id 104320;
 Thu, 01 Apr 2021 10:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuUl-0002fc-07
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:24:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ce87208-548f-49a6-90ca-36c4304d5841;
 Thu, 01 Apr 2021 10:24:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68116AED7;
 Thu,  1 Apr 2021 10:24:09 +0000 (UTC)
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
X-Inumbo-ID: 9ce87208-548f-49a6-90ca-36c4304d5841
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NE7O51HBJ2kdFYFTIPJPJoUwkO79zqoySamP2nD1/Go=;
	b=E84cAT4Yqg1Gf6SKjQef8xh6xzWV+j2HJbYS/kPrH9y6E0819qvAtThuQ6tkhcHT9dv5yn
	VDu7pyMoUSo9Zy6Qed+wTfOlp7hjnAeA34eKcwKOHJbt9YuivQUy2NEd5CNTWn9CbUm0VK
	MtkniYyrLZfDRYCigd2gVp4nPIYvjw0=
Subject: [PATCH 12/23] lib: move strcmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <0b66b9ff-72c0-b645-87a7-13883e046d1f@suse.com>
Date: Thu, 1 Apr 2021 12:24:08 +0200
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
@@ -111,25 +111,6 @@ size_t strlcat(char *dest, const char *s
 EXPORT_SYMBOL(strlcat);
 #endif
 
-#ifndef __HAVE_ARCH_STRCMP
-/**
- * strcmp - Compare two strings
- * @cs: One string
- * @ct: Another string
- */
-int (strcmp)(const char *cs, const char *ct)
-{
-	register signed char __res;
-
-	while (1) {
-		if ((__res = *cs - *ct++) != 0 || !*cs++)
-			break;
-	}
-
-	return __res;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRNCMP
 /**
  * strncmp - Compare two length-limited strings
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-y += strcmp.o
 lib-y += strlen.o
 lib-y += strnlen.o
 lib-$(CONFIG_X86) += xxhash32.o
--- /dev/null
+++ b/xen/lib/strcmp.c
@@ -0,0 +1,32 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strcmp - Compare two strings
+ * @cs: One string
+ * @ct: Another string
+ */
+int (strcmp)(const char *cs, const char *ct)
+{
+	register signed char __res;
+
+	while (1) {
+		if ((__res = *cs - *ct++) != 0 || !*cs++)
+			break;
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


