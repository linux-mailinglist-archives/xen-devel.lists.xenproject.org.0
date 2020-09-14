Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7964268910
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlX1-0004Ow-2z; Mon, 14 Sep 2020 10:16:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHlX0-0004Op-4V
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:16:18 +0000
X-Inumbo-ID: a2f0d0e5-936b-4c15-91b9-034bdf0af1e6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2f0d0e5-936b-4c15-91b9-034bdf0af1e6;
 Mon, 14 Sep 2020 10:16:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EE27B269;
 Mon, 14 Sep 2020 10:16:22 +0000 (UTC)
Subject: [PATCH 2/9] lib: split _ctype[] into its own object, under lib/
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Message-ID: <32aa6869-824c-8d8c-a7ca-9e50e6a89240@suse.com>
Date: Mon, 14 Sep 2020 12:16:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is, besides for tidying, in preparation of then starting to use an
archive rather than an object file for generic library code which
arch-es (or even specific configurations within a single arch) may or
may not need.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Makefile     |  3 ++-
 xen/Rules.mk     |  2 +-
 xen/common/lib.c | 29 -----------------------------
 xen/lib/Makefile |  1 +
 xen/lib/ctype.c  | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 42 insertions(+), 31 deletions(-)
 create mode 100644 xen/lib/ctype.c

diff --git a/xen/Makefile b/xen/Makefile
index bf0c804d4352..73bdc326c549 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -331,6 +331,7 @@ _clean: delete-unfresh-files
 	$(MAKE) $(clean) include
 	$(MAKE) $(clean) common
 	$(MAKE) $(clean) drivers
+	$(MAKE) $(clean) lib
 	$(MAKE) $(clean) xsm
 	$(MAKE) $(clean) crypto
 	$(MAKE) $(clean) arch/arm
@@ -414,7 +415,7 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
 	  echo ""; \
 	  echo "#endif") <$< >$@
 
-SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers test
+SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
     ( find include/asm-$(TARGET_ARCH) -name '*.h' -print; \
       find include -name 'asm-*' -prune -o -name '*.h' -print; \
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 891c94e6ad00..333e19bec343 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -36,7 +36,7 @@ TARGET := $(BASEDIR)/xen
 # Note that link order matters!
 ALL_OBJS-y               += $(BASEDIR)/common/built_in.o
 ALL_OBJS-y               += $(BASEDIR)/drivers/built_in.o
-ALL_OBJS-$(CONFIG_X86)   += $(BASEDIR)/lib/built_in.o
+ALL_OBJS-y               += $(BASEDIR)/lib/built_in.o
 ALL_OBJS-y               += $(BASEDIR)/xsm/built_in.o
 ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
diff --git a/xen/common/lib.c b/xen/common/lib.c
index b2b799da44c5..a224efa8f6e8 100644
--- a/xen/common/lib.c
+++ b/xen/common/lib.c
@@ -1,37 +1,8 @@
-
-#include <xen/ctype.h>
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <asm/byteorder.h>
 
-/* for ctype.h */
-const unsigned char _ctype[] = {
-    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 0-7 */
-    _C,_C|_S,_C|_S,_C|_S,_C|_S,_C|_S,_C,_C,         /* 8-15 */
-    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 16-23 */
-    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 24-31 */
-    _S|_SP,_P,_P,_P,_P,_P,_P,_P,                    /* 32-39 */
-    _P,_P,_P,_P,_P,_P,_P,_P,                        /* 40-47 */
-    _D,_D,_D,_D,_D,_D,_D,_D,                        /* 48-55 */
-    _D,_D,_P,_P,_P,_P,_P,_P,                        /* 56-63 */
-    _P,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U,      /* 64-71 */
-    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 72-79 */
-    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 80-87 */
-    _U,_U,_U,_P,_P,_P,_P,_P,                        /* 88-95 */
-    _P,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L,      /* 96-103 */
-    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 104-111 */
-    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 112-119 */
-    _L,_L,_L,_P,_P,_P,_P,_C,                        /* 120-127 */
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 128-143 */
-    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 144-159 */
-    _S|_SP,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,   /* 160-175 */
-    _P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,       /* 176-191 */
-    _U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,       /* 192-207 */
-    _U,_U,_U,_U,_U,_U,_U,_P,_U,_U,_U,_U,_U,_U,_U,_L,       /* 208-223 */
-    _L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,       /* 224-239 */
-    _L,_L,_L,_L,_L,_L,_L,_P,_L,_L,_L,_L,_L,_L,_L,_L};      /* 240-255 */
-
 /*
  * A couple of 64 bit operations ported from FreeBSD.
  * The code within the '#if BITS_PER_LONG == 32' block below, and no other
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 7019ca00e8fd..53b1da025e0d 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1 +1,2 @@
+obj-y += ctype.o
 obj-$(CONFIG_X86) += x86/
diff --git a/xen/lib/ctype.c b/xen/lib/ctype.c
new file mode 100644
index 000000000000..7b233a335fdf
--- /dev/null
+++ b/xen/lib/ctype.c
@@ -0,0 +1,38 @@
+#include <xen/ctype.h>
+
+/* for ctype.h */
+const unsigned char _ctype[] = {
+    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 0-7 */
+    _C,_C|_S,_C|_S,_C|_S,_C|_S,_C|_S,_C,_C,         /* 8-15 */
+    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 16-23 */
+    _C,_C,_C,_C,_C,_C,_C,_C,                        /* 24-31 */
+    _S|_SP,_P,_P,_P,_P,_P,_P,_P,                    /* 32-39 */
+    _P,_P,_P,_P,_P,_P,_P,_P,                        /* 40-47 */
+    _D,_D,_D,_D,_D,_D,_D,_D,                        /* 48-55 */
+    _D,_D,_P,_P,_P,_P,_P,_P,                        /* 56-63 */
+    _P,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U|_X,_U,      /* 64-71 */
+    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 72-79 */
+    _U,_U,_U,_U,_U,_U,_U,_U,                        /* 80-87 */
+    _U,_U,_U,_P,_P,_P,_P,_P,                        /* 88-95 */
+    _P,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L|_X,_L,      /* 96-103 */
+    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 104-111 */
+    _L,_L,_L,_L,_L,_L,_L,_L,                        /* 112-119 */
+    _L,_L,_L,_P,_P,_P,_P,_C,                        /* 120-127 */
+    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 128-143 */
+    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                /* 144-159 */
+    _S|_SP,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,   /* 160-175 */
+    _P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,       /* 176-191 */
+    _U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,       /* 192-207 */
+    _U,_U,_U,_U,_U,_U,_U,_P,_U,_U,_U,_U,_U,_U,_U,_L,       /* 208-223 */
+    _L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,       /* 224-239 */
+    _L,_L,_L,_L,_L,_L,_L,_P,_L,_L,_L,_L,_L,_L,_L,_L};      /* 240-255 */
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



