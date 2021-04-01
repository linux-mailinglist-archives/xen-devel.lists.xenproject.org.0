Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90D35136B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104343.199501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuXT-0003XL-2l; Thu, 01 Apr 2021 10:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104343.199501; Thu, 01 Apr 2021 10:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuXS-0003Wu-Vb; Thu, 01 Apr 2021 10:26:58 +0000
Received: by outflank-mailman (input) for mailman id 104343;
 Thu, 01 Apr 2021 10:26:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuXR-0003Wf-Km
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:26:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811f562e-6d16-4cd2-afd5-0cf9757c47c1;
 Thu, 01 Apr 2021 10:26:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27128AED7;
 Thu,  1 Apr 2021 10:26:56 +0000 (UTC)
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
X-Inumbo-ID: 811f562e-6d16-4cd2-afd5-0cf9757c47c1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NxQjcpTUPkL0effw4pmC6gwxzyQLMUQ+vwEPhHr3nYI=;
	b=fLUGBvAiPxFNk7QC/qrTxuN05bRy5jsHomCamd/VgNaoU6RfxsFxtSV/vhg8yfRNX3YXR0
	YoTqU/4KtcwEhBJjnASAVDlMlWJAlK7qaR93dn3xh37UDqFKBu9NRRAclWrOVeWwPLwY6u
	ZkFEPSvk0EVfDHTC88Maw77ashJn/vo=
Subject: [PATCH 19/23] lib: move strcasecmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <e48fe298-98d0-8227-b494-401e3431d475@suse.com>
Date: Thu, 1 Apr 2021 12:26:55 +0200
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
@@ -41,21 +41,6 @@ int strnicmp(const char *s1, const char
 }
 #endif
 
-#ifndef __HAVE_ARCH_STRCASECMP
-int (strcasecmp)(const char *s1, const char *s2)
-{
-    int c1, c2;
-
-    do
-    {
-        c1 = tolower(*s1++);
-        c2 = tolower(*s2++);
-    } while ( c1 == c2 && c1 != 0 );
-
-    return c1 - c2;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSPN
 /**
  * strspn - Calculate the length of the initial substring of @s which only
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -14,6 +14,7 @@ lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-y += strcasecmp.o
 lib-y += strchr.o
 lib-y += strcmp.o
 lib-y += strlcat.o
--- /dev/null
+++ b/xen/lib/strcasecmp.c
@@ -0,0 +1,29 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+#include <xen/ctype.h>
+
+int (strcasecmp)(const char *s1, const char *s2)
+{
+    int c1, c2;
+
+    do
+    {
+        c1 = tolower(*s1++);
+        c2 = tolower(*s2++);
+    } while ( c1 == c2 && c1 != 0 );
+
+    return c1 - c2;
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


