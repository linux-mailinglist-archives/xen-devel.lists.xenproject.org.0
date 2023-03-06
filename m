Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D16AB6E6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506675.779797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5AZ-0007su-EE; Mon, 06 Mar 2023 07:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506675.779797; Mon, 06 Mar 2023 07:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5AZ-0007px-AL; Mon, 06 Mar 2023 07:22:03 +0000
Received: by outflank-mailman (input) for mailman id 506675;
 Mon, 06 Mar 2023 07:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5AX-0006qo-Hi
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:22:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d95adb-bbef-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:22:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 595A81FDAE;
 Mon,  6 Mar 2023 07:22:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2817313A66;
 Mon,  6 Mar 2023 07:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hjGmCJiUBWTZKQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:22:00 +0000
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
X-Inumbo-ID: 95d95adb-bbef-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678087320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1c6Zfhki+3SKicBGrekaC400lL1q73+u27gT8K2e1I=;
	b=tQkzODY4gQLp3rBNok23lHRs6oVgnTkO4SkYYUE7j6MIBddcP2mvnPmafSawpcqUXA31Du
	lGrrHh0uO+W7SwgCt1GPdXnUtS9Em/JZzjz1BlJqNqLgRwe3NnDZv5k9UAOc3+eNQEWWaJ
	J3aeYnHCmji4Ty7VyVukjEAkg+KMfnk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 3/4] tools: get rid of additional min() and max() definitions
Date: Mon,  6 Mar 2023 08:21:39 +0100
Message-Id: <20230306072140.28402-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230306072140.28402-1-jgross@suse.com>
References: <20230306072140.28402-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defining min(), min_t(), max() and max_t() at other places than
xen-tools/common-macros.h isn't needed, as the definitions in said
header can be used instead.

Same applies to BUILD_BUG_ON() in hvmloader.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/firmware/hvmloader/util.h |  8 ++------
 tools/libs/vchan/init.c         |  3 +--
 tools/tests/vhpet/emul.h        | 11 +----------
 tools/tests/vpci/emul.h         | 16 ----------------
 4 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 8d95eab28a..e04990ee97 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -9,6 +9,8 @@
 #include <xen/hvm/hvm_info_table.h>
 #include "e820.h"
 
+#include <xen-tools/common-macros.h>
+
 /* Request un-prefixed values from errno.h. */
 #define XEN_ERRNO(name, value) name = value,
 enum {
@@ -41,12 +43,6 @@ void __assert_failed(const char *assertion, const char *file, int line)
 void __bug(const char *file, int line) __attribute__((noreturn));
 #define BUG() __bug(__FILE__, __LINE__)
 #define BUG_ON(p) do { if (p) BUG(); } while (0)
-#define BUILD_BUG_ON(p) ((void)sizeof(char[1 - 2 * !!(p)]))
-
-#define min_t(type,x,y) \
-        ({ type __x = (x); type __y = (y); __x < __y ? __x: __y; })
-#define max_t(type,x,y) \
-        ({ type __x = (x); type __y = (y); __x > __y ? __x: __y; })
 
 #define MB(mb) (mb##ULL << 20)
 #define GB(gb) (gb##ULL << 30)
diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index 9195bd3b98..021e1f29e1 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -45,6 +45,7 @@
 #include <xen/sys/gntalloc.h>
 #include <xen/sys/gntdev.h>
 #include <libxenvchan.h>
+#include <xen-tools/common-macros.h>
 
 #include "vchan.h"
 
@@ -72,8 +73,6 @@
 #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
 #endif
 
-#define max(a,b) ((a > b) ? a : b)
-
 static int init_gnt_srv(struct libxenvchan *ctrl, int domain)
 {
 	int pages_left = ctrl->read.order >= PAGE_SHIFT ? 1 << (ctrl->read.order - PAGE_SHIFT) : 0;
diff --git a/tools/tests/vhpet/emul.h b/tools/tests/vhpet/emul.h
index 610641ab0c..6af880cd43 100644
--- a/tools/tests/vhpet/emul.h
+++ b/tools/tests/vhpet/emul.h
@@ -114,16 +114,7 @@ enum
     TASKLET_SOFTIRQ,
     NR_COMMON_SOFTIRQS
 };
-/*
- * ..and if you can't take the strict
- * types, you can specify one yourself.
- *
- * Or not use min/max at all, of course.
- */
-#define min_t(type, x, y) \
-    ({ type __x = (x); type __y = (y); __x < __y ? __x : __y; })
-#define max_t(type, x, y) \
-    ({ type __x = (x); type __y = (y); __x > __y ? __x : __y; })
+
 #define offsetof(t, m) ((unsigned long )&((t *)0)->m)
 
 struct domain;
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index 7169a2ea02..8c5bcadd5f 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -106,22 +106,6 @@ typedef union {
 #define BUG() assert(0)
 #define ASSERT_UNREACHABLE() assert(0)
 
-#define min(x, y) ({                    \
-        const typeof(x) tx = (x);       \
-        const typeof(y) ty = (y);       \
-                                        \
-        (void) (&tx == &ty);            \
-        tx < ty ? tx : ty;              \
-})
-
-#define max(x, y) ({                    \
-        const typeof(x) tx = (x);       \
-        const typeof(y) ty = (y);       \
-                                        \
-        (void) (&tx == &ty);            \
-        tx > ty ? tx : ty;              \
-})
-
 #endif
 
 /*
-- 
2.35.3


