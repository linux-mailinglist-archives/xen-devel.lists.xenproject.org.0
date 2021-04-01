Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951F351354
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104301.199344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuT6-00022W-0j; Thu, 01 Apr 2021 10:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104301.199344; Thu, 01 Apr 2021 10:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuT5-000225-TR; Thu, 01 Apr 2021 10:22:27 +0000
Received: by outflank-mailman (input) for mailman id 104301;
 Thu, 01 Apr 2021 10:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuT3-00021n-UA
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:22:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fb8832f-be95-4d20-ae58-4b50e73d5c12;
 Thu, 01 Apr 2021 10:22:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CFFAAEA6;
 Thu,  1 Apr 2021 10:22:24 +0000 (UTC)
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
X-Inumbo-ID: 4fb8832f-be95-4d20-ae58-4b50e73d5c12
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1kdSAKEAN16LJljjXzIk1aT1zZrsyx9ENiy36Xyzo4=;
	b=nRlQ+tI8dRA9xfib5Ur7UyMrq1n3GB4VeMrC6gyOVKmf3Zt4PdU4K/t8wvc1PHLd/VBtoS
	F6J1I3Ut7Ddqt8uy5ZlE1jQxTJ8fm5S4cum06Pnu8hG2N6ISsYnOEbti+Bebgk0uBLbC3e
	Uc68mOTctRb8XUG6lKVk5Xz1W7OecHI=
Subject: [PATCH 07/23] lib: move memcmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <b82ffb74-1c76-f5b5-dce5-d90897750b70@suse.com>
Date: Thu, 1 Apr 2021 12:22:23 +0200
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
@@ -311,25 +311,6 @@ char *(strstr)(const char *s1, const cha
 }
 #endif
 
-#ifndef __HAVE_ARCH_MEMCMP
-/**
- * memcmp - Compare two areas of memory
- * @cs: One area of memory
- * @ct: Another area of memory
- * @count: The size of the area.
- */
-int (memcmp)(const void *cs, const void *ct, size_t count)
-{
-	const unsigned char *su1, *su2;
-	int res = 0;
-
-	for( su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
-		if ((res = *su1 - *su2) != 0)
-			break;
-	return res;
-}
-#endif
-
 #ifndef __HAVE_ARCH_MEMCHR
 /**
  * memchr - Find a character in an area of memory.
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,6 +4,7 @@ lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
+lib-y += memcmp.o
 lib-y += memcpy.o
 lib-y += memmove.o
 lib-y += memset.o
--- /dev/null
+++ b/xen/lib/memcmp.c
@@ -0,0 +1,32 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * memcmp - Compare two areas of memory
+ * @cs: One area of memory
+ * @ct: Another area of memory
+ * @count: The size of the area.
+ */
+int (memcmp)(const void *cs, const void *ct, size_t count)
+{
+	const unsigned char *su1, *su2;
+	int res = 0;
+
+	for( su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
+		if ((res = *su1 - *su2) != 0)
+			break;
+	return res;
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


