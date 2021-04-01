Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171C351371
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104355.199537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuYg-0003uU-1N; Thu, 01 Apr 2021 10:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104355.199537; Thu, 01 Apr 2021 10:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuYf-0003u4-TJ; Thu, 01 Apr 2021 10:28:13 +0000
Received: by outflank-mailman (input) for mailman id 104355;
 Thu, 01 Apr 2021 10:28:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuYd-0003tJ-KD
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:28:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1478dab0-275f-40ce-b15b-7c79bc5c64d5;
 Thu, 01 Apr 2021 10:28:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2140FAEAE;
 Thu,  1 Apr 2021 10:28:06 +0000 (UTC)
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
X-Inumbo-ID: 1478dab0-275f-40ce-b15b-7c79bc5c64d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDElynrA860OZeILtOTuJZZOjvaOuLrkyPrL9SlIZ48=;
	b=ih/DV0qn6PP0h4TaCI//rSw68v1Ey73GM+SKB8rNMyrkhGldQClNBDWKqERbdB7Vmyq9G1
	KHw3dSAn+zrM2oiT/Vmj7HD/WYP7+tbgZowuwOMR1uvw39ZoIN42weLROytxkY1Pwc5Jt4
	U8CZ/H72u8RQlA+qtMu9j2q/vO+vKyE=
Subject: [PATCH 22/23] lib: move strpbrk()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <8a492d52-7c2b-f926-9ba2-8e57ec0bbc97@suse.com>
Date: Thu, 1 Apr 2021 12:28:05 +0200
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
@@ -8,26 +8,6 @@
 #include <xen/string.h>
 #include <xen/ctype.h>
 
-#ifndef __HAVE_ARCH_STRPBRK
-/**
- * strpbrk - Find the first occurrence of a set of characters
- * @cs: The string to be searched
- * @ct: The characters to search for
- */
-char * strpbrk(const char * cs,const char * ct)
-{
-	const char *sc1,*sc2;
-
-	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
-		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
-			if (*sc1 == *sc2)
-				return (char *) sc1;
-		}
-	}
-	return NULL;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSEP
 /**
  * strsep - Split a string into tokens
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -23,6 +23,7 @@ lib-y += strlen.o
 lib-y += strncasecmp.o
 lib-y += strncmp.o
 lib-y += strnlen.o
+lib-y += strpbrk.o
 lib-y += strrchr.o
 lib-y += strspn.o
 lib-y += strstr.o
--- /dev/null
+++ b/xen/lib/strpbrk.c
@@ -0,0 +1,33 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+
+/**
+ * strpbrk - Find the first occurrence of a set of characters
+ * @cs: The string to be searched
+ * @ct: The characters to search for
+ */
+char *strpbrk(const char * cs,const char * ct)
+{
+	const char *sc1,*sc2;
+
+	for( sc1 = cs; *sc1 != '\0'; ++sc1) {
+		for( sc2 = ct; *sc2 != '\0'; ++sc2) {
+			if (*sc1 == *sc2)
+				return (char *) sc1;
+		}
+	}
+	return NULL;
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


