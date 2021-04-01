Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA135135A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104313.199393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuU7-0002Rl-9R; Thu, 01 Apr 2021 10:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104313.199393; Thu, 01 Apr 2021 10:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuU7-0002RM-5r; Thu, 01 Apr 2021 10:23:31 +0000
Received: by outflank-mailman (input) for mailman id 104313;
 Thu, 01 Apr 2021 10:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuU5-0002Qp-2l
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:23:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f259c5c-d47e-4d74-96f7-75188448331c;
 Thu, 01 Apr 2021 10:23:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5E6EAE86;
 Thu,  1 Apr 2021 10:23:27 +0000 (UTC)
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
X-Inumbo-ID: 8f259c5c-d47e-4d74-96f7-75188448331c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBbweA3vL9rMSj+WwvAqtgbZp6SBSyR96p37O2EqfpE=;
	b=IQTMtGb9knfLlR5xxb9YeGf2M90KdEeJ9v8Ftz46dP/kUuwkZXjOhWzJkGswOBSTUCJpBJ
	qoLEbyC1jamnFozUKQzTW3yJed1Db/gbrVZZ5GxQNAj0SUeG63ki/MPWA8wZZBH0u96CV8
	NDJGkjmZiVUdEszQX1pKTw9IDzrSbKY=
Subject: [PATCH 10/23] lib: move strlen()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <7e82929a-5eb0-a8a2-ec61-005311d74b44@suse.com>
Date: Thu, 1 Apr 2021 12:23:27 +0200
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
@@ -184,21 +184,6 @@ char *(strrchr)(const char *s, int c)
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRLEN
-/**
- * strlen - Find the length of a string
- * @s: The string to be sized
- */
-size_t (strlen)(const char * s)
-{
-	const char *sc;
-
-	for (sc = s; *sc != '\0'; ++sc)
-		/* nothing */;
-	return sc - s;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRNLEN
 /**
  * strnlen - Find the length of a length-limited string
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-y += strlen.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strlen.c
@@ -0,0 +1,28 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strlen - Find the length of a string
+ * @s: The string to be sized
+ */
+size_t (strlen)(const char * s)
+{
+	const char *sc;
+
+	for (sc = s; *sc != '\0'; ++sc)
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


