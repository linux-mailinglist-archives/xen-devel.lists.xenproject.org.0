Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F441351368
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104335.199464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuWa-0003Bm-7i; Thu, 01 Apr 2021 10:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104335.199464; Thu, 01 Apr 2021 10:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuWa-0003BN-4c; Thu, 01 Apr 2021 10:26:04 +0000
Received: by outflank-mailman (input) for mailman id 104335;
 Thu, 01 Apr 2021 10:26:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuWY-00039I-FF
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:26:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02ab72af-98ca-4dc6-a62f-7c7dc437c736;
 Thu, 01 Apr 2021 10:25:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 525B3AEA6;
 Thu,  1 Apr 2021 10:25:57 +0000 (UTC)
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
X-Inumbo-ID: 02ab72af-98ca-4dc6-a62f-7c7dc437c736
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFsPHBSFCRbpswM140dIBX+K0lYDWe8o/0ZUhNbUxao=;
	b=sGJ4tbmKIwfb/xiCiCgT6875Pw/IKeNIwYR5si/L2whCsOoKqVFH1PA4xmzr4ohBkZ064U
	j+3tXw6o3Hyon76EnJ5IIg2TECUlaApHLOhDcMbl+OeKrqdikZDTzZSZfiWgWES9/c4t/T
	94hpE5DenHFl9dCJp3cKyAp22WQT8jM=
Subject: [PATCH 16/23] lib: move strchr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <d855bf46-4431-0c90-6999-81743e7553e1@suse.com>
Date: Thu, 1 Apr 2021 12:25:56 +0200
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
@@ -56,21 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRCHR
-/**
- * strchr - Find the first occurrence of a character in a string
- * @s: The string to be searched
- * @c: The character to search for
- */
-char *(strchr)(const char *s, int c)
-{
-	for(; *s != (char) c; ++s)
-		if (*s == '\0')
-			return NULL;
-	return (char *) s;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRRCHR
 /**
  * strrchr - Find the last occurrence of a character in a string
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-y += strchr.o
 lib-y += strcmp.o
 lib-y += strlcat.o
 lib-y += strlcpy.o
--- /dev/null
+++ b/xen/lib/strchr.c
@@ -0,0 +1,28 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strchr - Find the first occurrence of a character in a string
+ * @s: The string to be searched
+ * @c: The character to search for
+ */
+char *(strchr)(const char *s, int c)
+{
+	for(; *s != (char) c; ++s)
+		if (*s == '\0')
+			return NULL;
+	return (char *) s;
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


