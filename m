Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807C35135E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104317.199405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuUQ-0002Yx-KT; Thu, 01 Apr 2021 10:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104317.199405; Thu, 01 Apr 2021 10:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuUQ-0002YR-GE; Thu, 01 Apr 2021 10:23:50 +0000
Received: by outflank-mailman (input) for mailman id 104317;
 Thu, 01 Apr 2021 10:23:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuUP-0002YB-I4
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:23:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59e2009a-f191-4924-ab52-1b2717c39cc9;
 Thu, 01 Apr 2021 10:23:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AD7AAED7;
 Thu,  1 Apr 2021 10:23:48 +0000 (UTC)
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
X-Inumbo-ID: 59e2009a-f191-4924-ab52-1b2717c39cc9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j90++h3cFk0QIuXtJzchPhaTge5uMVq3pz3OcoqtqAs=;
	b=ebPsdQB4HSGKgTai3XRPrGo+eMQXtcbAZIZt9BxS4EYl3absZHxQG6icjnL5RDhQ8fwJji
	9yXRzYmkqNx8BXROayS9GwPh9ZtYsedsECPgeRzSaTok0HZogjEl8YTJRU3QfKxNsIH543
	2yS9bsH6KoCa2lY3k5pImfBgf90tt4I=
Subject: [PATCH 11/23] lib: move strnlen()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <4545723a-44ec-6586-79bd-7b7f8442619b@suse.com>
Date: Thu, 1 Apr 2021 12:23:47 +0200
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
@@ -184,22 +184,6 @@ char *(strrchr)(const char *s, int c)
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRNLEN
-/**
- * strnlen - Find the length of a length-limited string
- * @s: The string to be sized
- * @count: The maximum number of bytes to search
- */
-size_t strnlen(const char * s, size_t count)
-{
-	const char *sc;
-
-	for (sc = s; count-- && *sc != '\0'; ++sc)
-		/* nothing */;
-	return sc - s;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSPN
 /**
  * strspn - Calculate the length of the initial substring of @s which only
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -15,6 +15,7 @@ lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
 lib-y += strlen.o
+lib-y += strnlen.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strnlen.c
@@ -0,0 +1,29 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strnlen - Find the length of a length-limited string
+ * @s: The string to be sized
+ * @count: The maximum number of bytes to search
+ */
+size_t strnlen(const char * s, size_t count)
+{
+	const char *sc;
+
+	for (sc = s; count-- && *sc != '\0'; ++sc)
+		/* nothing */;
+	return sc - s;
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


