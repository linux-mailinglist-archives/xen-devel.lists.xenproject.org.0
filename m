Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB56AB6E7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506678.779809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5Af-0008O5-NV; Mon, 06 Mar 2023 07:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506678.779809; Mon, 06 Mar 2023 07:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5Af-0008KE-Jx; Mon, 06 Mar 2023 07:22:09 +0000
Received: by outflank-mailman (input) for mailman id 506678;
 Mon, 06 Mar 2023 07:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5Ad-0007Q4-TY
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:22:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99356240-bbef-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 08:22:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 003072236F;
 Mon,  6 Mar 2023 07:22:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBB0113A66;
 Mon,  6 Mar 2023 07:22:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o95zLJ2UBWTiKQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:22:05 +0000
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
X-Inumbo-ID: 99356240-bbef-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678087326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C79P8kJOxeYApeIizL+uptzDQc+yFSzBIoJIgJpxxKk=;
	b=KZe3nEU4pqcafb3HqvK+mxSTHyAxkxBh9K+NfE7PRWdWprlXNu0n3b6eCb2PBwlifPaGDn
	bnOWrfBXeJRWpPmcjfFAeyQSTLkjvcCpXj/2MZBb9D7BARgYuVGLuJ5khVXid204vCViq+
	NV/+1M2hHHDNc3Gc6WWDhcQCjWuWKTs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 4/4] tools: add offsetof() to xen-tools/common-macros.h
Date: Mon,  6 Mar 2023 08:21:40 +0100
Message-Id: <20230306072140.28402-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230306072140.28402-1-jgross@suse.com>
References: <20230306072140.28402-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having multiple files defining offsetof(), add the
definition to tools/include/xen-tools/common-macros.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- don't modify tools/firmware/include/stddef.h (Jan Beulich)
---
 tools/firmware/hvmloader/util.h         | 3 ---
 tools/include/xen-tools/common-macros.h | 4 ++++
 tools/libfsimage/Rules.mk               | 2 ++
 tools/libfsimage/xfs/fsys_xfs.c         | 4 +---
 tools/libs/vchan/init.c                 | 4 ----
 tools/tests/vhpet/emul.h                | 2 --
 6 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index e04990ee97..7249773eeb 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -30,9 +30,6 @@ enum {
 #define SEL_DATA32          0x0020
 #define SEL_CODE64          0x0028
 
-#undef offsetof
-#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
-
 #undef NULL
 #define NULL ((void*)0)
 
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index b046ab48bf..b149be8365 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -80,4 +80,8 @@
     typeof( ((type *)0)->member ) *__mptr = (ptr);        \
     (type *)( (char *)__mptr - offsetof(type,member) );})
 
+#ifndef offsetof
+#define offsetof(a, b) __builtin_offsetof(a, b)
+#endif
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
diff --git a/tools/libfsimage/Rules.mk b/tools/libfsimage/Rules.mk
index cf37d6cb0d..85674f2379 100644
--- a/tools/libfsimage/Rules.mk
+++ b/tools/libfsimage/Rules.mk
@@ -3,6 +3,8 @@ include $(XEN_ROOT)/tools/libfsimage/common.mk
 FSLIB = fsimage.so
 TARGETS += $(FSLIB)
 
+CFLAGS += $(CFLAGS_xeninclude)
+
 .PHONY: all
 all: $(TARGETS)
 
diff --git a/tools/libfsimage/xfs/fsys_xfs.c b/tools/libfsimage/xfs/fsys_xfs.c
index d735a88e55..f562daaef0 100644
--- a/tools/libfsimage/xfs/fsys_xfs.c
+++ b/tools/libfsimage/xfs/fsys_xfs.c
@@ -19,6 +19,7 @@
 
 #include <xenfsimage_grub.h>
 #include "xfs.h"
+#include <xen-tools/common-macros.h>
 
 #define MAX_LINK_COUNT	8
 
@@ -182,9 +183,6 @@ fsb2daddr (xfs_fsblock_t fsbno)
 			 (xfs_agblock_t)(fsbno & mask32lo(xfs.agblklog)));
 }
 
-#undef offsetof
-#define offsetof(t,m)	((size_t)&(((t *)0)->m))
-
 static inline int
 btroot_maxrecs (fsi_file_t *ffi)
 {
diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index 021e1f29e1..ad4cc66d2c 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -69,10 +69,6 @@
 #define MAX_RING_SHIFT 20
 #define MAX_RING_SIZE (1 << MAX_RING_SHIFT)
 
-#ifndef offsetof
-#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-#endif
-
 static int init_gnt_srv(struct libxenvchan *ctrl, int domain)
 {
 	int pages_left = ctrl->read.order >= PAGE_SHIFT ? 1 << (ctrl->read.order - PAGE_SHIFT) : 0;
diff --git a/tools/tests/vhpet/emul.h b/tools/tests/vhpet/emul.h
index 6af880cd43..7b3ee88fb5 100644
--- a/tools/tests/vhpet/emul.h
+++ b/tools/tests/vhpet/emul.h
@@ -115,8 +115,6 @@ enum
     NR_COMMON_SOFTIRQS
 };
 
-#define offsetof(t, m) ((unsigned long )&((t *)0)->m)
-
 struct domain;
 
 struct vcpu
-- 
2.35.3


