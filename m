Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A95E351369
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104337.199477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuWn-0003HH-HH; Thu, 01 Apr 2021 10:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104337.199477; Thu, 01 Apr 2021 10:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuWn-0003Gp-Df; Thu, 01 Apr 2021 10:26:17 +0000
Received: by outflank-mailman (input) for mailman id 104337;
 Thu, 01 Apr 2021 10:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuWl-0003GV-JZ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:26:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cbf186b-7f8d-4fe7-ba1e-bd29d2d9e1e1;
 Thu, 01 Apr 2021 10:26:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2342DAEA6;
 Thu,  1 Apr 2021 10:26:14 +0000 (UTC)
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
X-Inumbo-ID: 8cbf186b-7f8d-4fe7-ba1e-bd29d2d9e1e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CQlp/3jZ9dRZw9Vi/DgDQTsQjZRZ6m3Z3hDPiBuKzw=;
	b=IAa1jhudL+MvVkyP8zM15xMr+PfcQASoedZ1A6T5vVEAsPmx1hxXIgiJxAucDrI8Yv++mO
	KjPCT+RKtcPfoP+55OZhFppOEYBoA5IFNRTEnsf4kSjpZ4Flo+QGICfOavJ8BbuQPJwUGr
	8q0Jf0PyY7n1Jj9XX3hzXpVzYjrsHqo=
Subject: [PATCH 17/23] lib: move strrchr()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <078a3947-5c1d-c84e-9f57-ad86ea415ec4@suse.com>
Date: Thu, 1 Apr 2021 12:26:13 +0200
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
@@ -56,24 +56,6 @@ int (strcasecmp)(const char *s1, const c
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRRCHR
-/**
- * strrchr - Find the last occurrence of a character in a string
- * @s: The string to be searched
- * @c: The character to search for
- */
-char *(strrchr)(const char *s, int c)
-{
-	const char *p = s + strlen(s);
-
-	for (; *p != (char)c; --p)
-		if (p == s)
-			return NULL;
-
-	return (char *)p;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSPN
 /**
  * strspn - Calculate the length of the initial substring of @s which only
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -21,6 +21,7 @@ lib-y += strlcpy.o
 lib-y += strlen.o
 lib-y += strncmp.o
 lib-y += strnlen.o
+lib-y += strrchr.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strrchr.c
@@ -0,0 +1,31 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strrchr - Find the last occurrence of a character in a string
+ * @s: The string to be searched
+ * @c: The character to search for
+ */
+char *(strrchr)(const char *s, int c)
+{
+	const char *p = s + strlen(s);
+
+	for (; *p != (char)c; --p)
+		if (p == s)
+			return NULL;
+
+	return (char *)p;
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


