Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F223D6C49F0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513370.794251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexH4-0000bz-1F; Wed, 22 Mar 2023 12:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513370.794251; Wed, 22 Mar 2023 12:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexH3-0000Zh-Td; Wed, 22 Mar 2023 12:09:01 +0000
Received: by outflank-mailman (input) for mailman id 513370;
 Wed, 22 Mar 2023 12:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexH2-0000Ws-Ue
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:09:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5391c5e9-c8aa-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 13:08:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F03FF20D4C;
 Wed, 22 Mar 2023 12:08:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADD0613416;
 Wed, 22 Mar 2023 12:08:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jHAFKdrvGmQVTwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:08:58 +0000
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
X-Inumbo-ID: 5391c5e9-c8aa-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679486938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=suOiz4udjcsmoILWLrFfDzQ1cyAZXnKkjPEFbgxcutI=;
	b=Mgx0UeP5T6p24ilFp2nB8LPyQ5/rvGblISqIATSZTzIOv4Bl3RJhjP0CEGxBVW46Jnay/h
	DUr1oe9+K3ynDLWDv4eFiwfMYd9+68PeKBfio3UvWl36lA0BBvhcX6J7ty65pWJei/B3Er
	1QvBiGUNRjYZD7hYkdpEQB6t+mshR0c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 2/5] tools: get rid of additional min() and max() definitions
Date: Wed, 22 Mar 2023 13:08:41 +0100
Message-Id: <20230322120844.19657-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322120844.19657-1-jgross@suse.com>
References: <20230322120844.19657-1-jgross@suse.com>
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
 tools/tests/vpci/Makefile       |  2 +-
 tools/tests/vpci/emul.h         | 16 ----------------
 4 files changed, 4 insertions(+), 25 deletions(-)

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
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 5075bc2be2..62f21f341a 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -11,7 +11,7 @@ run: $(TARGET)
 	./$(TARGET)
 
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(HOSTCC) -g -o $@ vpci.c main.c
+	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
 
 .PHONY: clean
 clean:
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


