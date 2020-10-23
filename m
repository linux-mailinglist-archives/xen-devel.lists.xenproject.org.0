Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5B296CA5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 12:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10840.28959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVu9N-00017w-6r; Fri, 23 Oct 2020 10:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10840.28959; Fri, 23 Oct 2020 10:18:21 +0000
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
	id 1kVu9N-00017W-3Z; Fri, 23 Oct 2020 10:18:21 +0000
Received: by outflank-mailman (input) for mailman id 10840;
 Fri, 23 Oct 2020 10:18:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVu9L-00017F-GR
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:18:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb9262d6-4b1a-40e3-8b2a-c5fae1855b95;
 Fri, 23 Oct 2020 10:18:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4078ABD1;
 Fri, 23 Oct 2020 10:18:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVu9L-00017F-GR
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:18:19 +0000
X-Inumbo-ID: eb9262d6-4b1a-40e3-8b2a-c5fae1855b95
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb9262d6-4b1a-40e3-8b2a-c5fae1855b95;
	Fri, 23 Oct 2020 10:18:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603448298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hiYMWegp/VfyOCwZBfvaVvgad/gyWFZAtZKLyIpg09Y=;
	b=rd7FfW8aL3ICa21jysoMfzvGKWMD5ytujfcJa3P95iXA4EWJHRnp6Xzpxzz8vRusGl2EXZ
	5Jrx5/r4QDrjK3l9P1DdNs/bXfMzD86hjEN3q2Ko52Mq0RXxgjbxBUqQbJ54vtrG+mKV2w
	w40cSPEFAnqC9r3ZhrAdujL94BuYouQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E4078ABD1;
	Fri, 23 Oct 2020 10:18:17 +0000 (UTC)
Subject: [PATCH v2 5/8] lib: move init_constructors()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Message-ID: <c7b091f4-b2a4-965e-3a1a-de26f45f0d5d@suse.com>
Date: Fri, 23 Oct 2020 12:18:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... into its own CU, for being unrelated to other things in
common/lib.c. For now it gets compiled into built_in.o rather than
lib.a, as it gets used unconditionally by Arm's as well as x86'es
{,__}start_xen(). But this could be changed in principle, the more that
there typically aren't any constructors anyway. Then again it's just
__init code anyway.

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
index 99f857540c99..ba1fb7bcdee2 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,3 +1,4 @@
+obj-y += ctors.o
 obj-$(CONFIG_X86) += x86/
 
 lib-y += ctype.o
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
-- 
2.22.0



