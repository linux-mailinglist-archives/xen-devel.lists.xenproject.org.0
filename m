Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A376A4643
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502747.774704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdp-0003r1-Lt; Mon, 27 Feb 2023 15:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502747.774704; Mon, 27 Feb 2023 15:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdp-0003oq-Ib; Mon, 27 Feb 2023 15:42:17 +0000
Received: by outflank-mailman (input) for mailman id 502747;
 Mon, 27 Feb 2023 15:42:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWfdn-00034v-KP
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:42:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e1b024a-b6b5-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:42:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 54C3E1FD63;
 Mon, 27 Feb 2023 15:42:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C60C13912;
 Mon, 27 Feb 2023 15:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /XSRBVXP/GOiLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 15:42:13 +0000
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
X-Inumbo-ID: 4e1b024a-b6b5-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677512533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1c6Zfhki+3SKicBGrekaC400lL1q73+u27gT8K2e1I=;
	b=ToNLji9L1Vcxn1NbOwijP6BP0hp0B0QRVgwFHq1qvKvwqOpH36YtV+L6dl3BlXDhv99iqA
	eLnLPGBfSCyRjcAmDIKAIL7YybmcAjT/k1QVk24E3bHjjhyyOYHfxQBNmM+jUCtbVDJg91
	S0cRYrIrnz8n4GwDFISgh0j5QM/ripA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/4] tools: get rid of additional min() and max() definitions
Date: Mon, 27 Feb 2023 16:41:52 +0100
Message-Id: <20230227154153.31080-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230227154153.31080-1-jgross@suse.com>
References: <20230227154153.31080-1-jgross@suse.com>
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


