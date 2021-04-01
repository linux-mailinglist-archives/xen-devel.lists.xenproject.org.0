Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF135136D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104351.199525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuYF-0003mu-OG; Thu, 01 Apr 2021 10:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104351.199525; Thu, 01 Apr 2021 10:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuYF-0003mS-Kk; Thu, 01 Apr 2021 10:27:47 +0000
Received: by outflank-mailman (input) for mailman id 104351;
 Thu, 01 Apr 2021 10:27:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuYD-0003m8-SO
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:27:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd0f8501-bf0b-47ff-b6d4-a846ea0fdb10;
 Thu, 01 Apr 2021 10:27:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BCDEAED7;
 Thu,  1 Apr 2021 10:27:44 +0000 (UTC)
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
X-Inumbo-ID: bd0f8501-bf0b-47ff-b6d4-a846ea0fdb10
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nM+SAR2VDtnfWZt6Cj4esRpAm2vc6rPFnc2zt/YNybg=;
	b=iG6kGnwhMHT1Ry4Y660ojHxK6QtEzq9Fc/RoUKRR02U4ZgSxTLIftFVWB6qAaEjjoJ061S
	1eANE+OCSlJHbbXROPO2rS9FgoDRb72jy4CLIZL28RhWMM2MYjO8h2bUNWfG1D3ulx9GhV
	SrnuhvFkygUCWSrEEfPYu1eo5kVbkWc=
Subject: [PATCH 21/23] lib: move strspn()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <8d5d06fe-7e8b-6275-caa0-bc14c7dbd21f@suse.com>
Date: Thu, 1 Apr 2021 12:27:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In fact the function is unused at present, and hence will now get
omitted from the final binaries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/string.c
+++ b/xen/common/string.c
@@ -8,33 +8,6 @@
 #include <xen/string.h>
 #include <xen/ctype.h>
 
-#ifndef __HAVE_ARCH_STRSPN
-/**
- * strspn - Calculate the length of the initial substring of @s which only
- * 	contain letters in @accept
- * @s: The string to be searched
- * @accept: The string to search for
- */
-size_t strspn(const char *s, const char *accept)
-{
-	const char *p;
-	const char *a;
-	size_t count = 0;
-
-	for (p = s; *p != '\0'; ++p) {
-		for (a = accept; *a != '\0'; ++a) {
-			if (*p == *a)
-				break;
-		}
-		if (*a == '\0')
-			return count;
-		++count;
-	}
-
-	return count;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRPBRK
 /**
  * strpbrk - Find the first occurrence of a set of characters
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -24,6 +24,7 @@ lib-y += strncasecmp.o
 lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strrchr.o
+lib-y += strspn.o
 lib-y += strstr.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
--- /dev/null
+++ b/xen/lib/strspn.c
@@ -0,0 +1,40 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strspn - Calculate the length of the initial substring of @s which only
+ * 	contain letters in @accept
+ * @s: The string to be searched
+ * @accept: The string to search for
+ */
+size_t strspn(const char *s, const char *accept)
+{
+	const char *p;
+	const char *a;
+	size_t count = 0;
+
+	for (p = s; *p != '\0'; ++p) {
+		for (a = accept; *a != '\0'; ++a) {
+			if (*p == *a)
+				break;
+		}
+		if (*a == '\0')
+			return count;
+		++count;
+	}
+
+	return count;
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


