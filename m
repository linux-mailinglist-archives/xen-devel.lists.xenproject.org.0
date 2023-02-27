Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E26A4645
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502751.774715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdu-0004Fy-12; Mon, 27 Feb 2023 15:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502751.774715; Mon, 27 Feb 2023 15:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdt-0004Bq-U4; Mon, 27 Feb 2023 15:42:21 +0000
Received: by outflank-mailman (input) for mailman id 502751;
 Mon, 27 Feb 2023 15:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWfds-00034v-To
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:42:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517cd902-b6b5-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:42:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00CA91FD63;
 Mon, 27 Feb 2023 15:42:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFEFC13912;
 Mon, 27 Feb 2023 15:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gfKoLVrP/GOwLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 15:42:18 +0000
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
X-Inumbo-ID: 517cd902-b6b5-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677512539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4YWfk5My0zrpM/pObahciTKOWepQnXUCCFFrc1nZeeQ=;
	b=YpcS6Y5moX0AY9fwb7/NHlagQD0CqMilkF98tapMM6nsaeTDfo3PuN8aeSqbvO4FnWw/aw
	yJyJFVRTOCFtWKHphvf+LaqTPWAIFB33Wox6U9pyqk8Fd6i+vY7ofUN88jSBkdR7h0XOxY
	P84fqA8k4sUG5QYVL1nlmpoKbJ72WWY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 4/4] tools: add offsetof() to xen-tools/common-macros.h
Date: Mon, 27 Feb 2023 16:41:53 +0100
Message-Id: <20230227154153.31080-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230227154153.31080-1-jgross@suse.com>
References: <20230227154153.31080-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having multiple files defining offsetof(), add the
definition to tools/include/xen-tools/common-macros.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/firmware/hvmloader/util.h         | 3 ---
 tools/firmware/include/stddef.h         | 4 ++--
 tools/include/xen-tools/common-macros.h | 4 ++++
 tools/libfsimage/Rules.mk               | 2 ++
 tools/libfsimage/xfs/fsys_xfs.c         | 4 +---
 tools/libs/vchan/init.c                 | 4 ----
 tools/tests/vhpet/emul.h                | 2 --
 7 files changed, 9 insertions(+), 14 deletions(-)

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
 
diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
index c7f974608a..0afb426a6d 100644
--- a/tools/firmware/include/stddef.h
+++ b/tools/firmware/include/stddef.h
@@ -1,10 +1,10 @@
 #ifndef _STDDEF_H_
 #define _STDDEF_H_
 
+#include <xen-tools/common-macros.h>
+
 typedef __SIZE_TYPE__ size_t;
 
 #define NULL ((void*)0)
 
-#define offsetof(t, m) __builtin_offsetof(t, m)
-
 #endif
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 3e73b33c91..15399e9b88 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -79,4 +79,8 @@
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


