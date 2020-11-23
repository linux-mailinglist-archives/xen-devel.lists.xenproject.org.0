Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B432C0EB8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34653.65836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDg3-0006yN-2I; Mon, 23 Nov 2020 15:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34653.65836; Mon, 23 Nov 2020 15:22:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDg2-0006xw-Uv; Mon, 23 Nov 2020 15:22:50 +0000
Received: by outflank-mailman (input) for mailman id 34653;
 Mon, 23 Nov 2020 15:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDg1-0006xj-Ve
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:22:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 542f9c41-7242-4cec-abaf-df9059b01856;
 Mon, 23 Nov 2020 15:22:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E2D3B01E;
 Mon, 23 Nov 2020 15:22:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDg1-0006xj-Ve
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:22:50 +0000
X-Inumbo-ID: 542f9c41-7242-4cec-abaf-df9059b01856
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 542f9c41-7242-4cec-abaf-df9059b01856;
	Mon, 23 Nov 2020 15:22:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606144968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fmfCVpbzWpimEPZJkVHrvDAFBSfAhhMSPnv3DhM26s=;
	b=cAP4j0Jlb/yiQ5VcN3xmT3RACuC6QRyEliTufHXhlkCWrOFQixEZmfxEvq3Msqin4xANcX
	83rnHESxwcz5adoXjHz5Sw01QyysMAwr73SWc+rdvz+bt36DKPg4i6Zw0XsTegqmD+l1Sl
	ubM2RYM0QTAwHx7mh9zBLlZju+VKhUA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6E2D3B01E;
	Mon, 23 Nov 2020 15:22:48 +0000 (UTC)
Subject: [PATCH v3 5/8] lib: move init_constructors()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Message-ID: <c67ca263-8a82-d0c8-e6e1-6afdeeb9df8c@suse.com>
Date: Mon, 23 Nov 2020 16:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... into its own CU, for being unrelated to other things in
common/lib.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/lib.c | 14 --------------
 xen/lib/Makefile |  1 +
 xen/lib/ctors.c  | 25 +++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 14 deletions(-)
 create mode 100644 xen/lib/ctors.c

diff --git a/xen/common/lib.c b/xen/common/lib.c
index 6cfa332142a5..f5ca179a0af4 100644
--- a/xen/common/lib.c
+++ b/xen/common/lib.c
@@ -1,6 +1,5 @@
 #include <xen/lib.h>
 #include <xen/types.h>
-#include <xen/init.h>
 #include <asm/byteorder.h>
 
 /*
@@ -423,19 +422,6 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 #endif
 }
 
-typedef void (*ctor_func_t)(void);
-extern const ctor_func_t __ctors_start[], __ctors_end[];
-
-void __init init_constructors(void)
-{
-    const ctor_func_t *f;
-    for ( f = __ctors_start; f < __ctors_end; ++f )
-        (*f)();
-
-    /* Putting this here seems as good (or bad) as any other place. */
-    BUILD_BUG_ON(sizeof(size_t) != sizeof(ssize_t));
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 99f857540c99..72c72fffecf2 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_X86) += x86/
 
+lib-y += ctors.o
 lib-y += ctype.o
 lib-y += list-sort.o
 lib-y += parse-size.o
diff --git a/xen/lib/ctors.c b/xen/lib/ctors.c
new file mode 100644
index 000000000000..5bdc591cd50a
--- /dev/null
+++ b/xen/lib/ctors.c
@@ -0,0 +1,25 @@
+#include <xen/init.h>
+#include <xen/lib.h>
+
+typedef void (*ctor_func_t)(void);
+extern const ctor_func_t __ctors_start[], __ctors_end[];
+
+void __init init_constructors(void)
+{
+    const ctor_func_t *f;
+    for ( f = __ctors_start; f < __ctors_end; ++f )
+        (*f)();
+
+    /* Putting this here seems as good (or bad) as any other place. */
+    BUILD_BUG_ON(sizeof(size_t) != sizeof(ssize_t));
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */


