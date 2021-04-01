Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461B351365
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104326.199429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuVc-0002si-BF; Thu, 01 Apr 2021 10:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104326.199429; Thu, 01 Apr 2021 10:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuVc-0002sI-7d; Thu, 01 Apr 2021 10:25:04 +0000
Received: by outflank-mailman (input) for mailman id 104326;
 Thu, 01 Apr 2021 10:25:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuVa-0002s8-Va
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:25:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce857047-d00c-4769-9c5d-97dcbe6962e9;
 Thu, 01 Apr 2021 10:25:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B45EAE86;
 Thu,  1 Apr 2021 10:25:01 +0000 (UTC)
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
X-Inumbo-ID: ce857047-d00c-4769-9c5d-97dcbe6962e9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdu1McyqjuuA+MC/um/kTIQJPhtl9yF8EaqHekvmKgo=;
	b=r6/NqASRM1dJYwp/MXnaampOR5t9AvcCQ/kvOT3tlATyaTFwO99W525Cl83vqSo0mRRjaq
	BKmsSK3P+FtfMGcv9DvdS4TeC1+6etDbjKx9/X/NngjkOVjohiG1Woy+lqlSadpj4miVuB
	7LGHkVDYoSHPBpggcEBLaAYTZ5b/6e4=
Subject: [PATCH 13/23] lib: move strncmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <e8355aad-7ea1-619f-dfe5-01b07d899f91@suse.com>
Date: Thu, 1 Apr 2021 12:25:00 +0200
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


