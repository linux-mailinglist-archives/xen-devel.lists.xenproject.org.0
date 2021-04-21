Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B168C366E0C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114660.218542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDku-0002Nq-5P; Wed, 21 Apr 2021 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114660.218542; Wed, 21 Apr 2021 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDku-0002NQ-1i; Wed, 21 Apr 2021 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 114660;
 Wed, 21 Apr 2021 14:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDks-0002MI-Bm
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:23:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4347b79d-625e-44e1-b82a-e6cbfdd24b24;
 Wed, 21 Apr 2021 14:22:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEB12B4DA;
 Wed, 21 Apr 2021 14:22:56 +0000 (UTC)
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
X-Inumbo-ID: 4347b79d-625e-44e1-b82a-e6cbfdd24b24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2DVYdfxyAMF+b+0oBREdJVxrIb85Ue9nsEafhsVnbY=;
	b=rmwtaRcRU2+aEdA3K40YlM7uhrDJfsU3cxMgPTX2WPN5uWwpx/Indj5hEO4GfZZgR8C3R4
	VReTu2zhAST3Mk8l/hw4J8tOM3SvCXdtIj4oz5n6itfdRteUC90syytvOnyjQRatrA199p
	Fi+8RWzlFtzcjXxlkAy+H3j4BZL813I=
Subject: [PATCH v2 09/20] lib: move strcmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <6fa3ce3e-30bb-c429-caef-64a66717cb13@suse.com>
Date: Wed, 21 Apr 2021 16:22:56 +0200
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


