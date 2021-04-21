Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09E366E05
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114647.218519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDjz-00028q-Ew; Wed, 21 Apr 2021 14:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114647.218519; Wed, 21 Apr 2021 14:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDjz-00028R-B8; Wed, 21 Apr 2021 14:22:07 +0000
Received: by outflank-mailman (input) for mailman id 114647;
 Wed, 21 Apr 2021 14:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDjy-00028K-Hw
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:22:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3bb62b6-9a44-4c09-ac87-6e0aec27326b;
 Wed, 21 Apr 2021 14:22:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6060B4D2;
 Wed, 21 Apr 2021 14:22:04 +0000 (UTC)
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
X-Inumbo-ID: f3bb62b6-9a44-4c09-ac87-6e0aec27326b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619014925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+n1hqpE+sLl3vHGQjm07YiejYA4S+f1I/11X4roUSw=;
	b=GWdvtYx/UY98X7otMWxLgJo2F/xrKGnUu4cIBfb+GQU6aeAGiH4LY6jt8wW0BzgUNkgHK9
	WTApM+F+O1Cr/l/VYTRhc/+iQqeoP8HnD/LdILiXI/lnoy5/A/Z3sAGe/ywLJqX5RR/0q9
	aS88jkeo8zJKJjnBlMho1hT6xHzY46k=
Subject: [PATCH v2 07/20] lib: move strlen()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
Message-ID: <96f1217c-d6fb-d83b-741a-2565890ca43c@suse.com>
Date: Wed, 21 Apr 2021 16:22:04 +0200
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


