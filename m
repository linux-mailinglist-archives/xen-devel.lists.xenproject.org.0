Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E686C49F4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513369.794241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexGz-0000F0-OW; Wed, 22 Mar 2023 12:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513369.794241; Wed, 22 Mar 2023 12:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexGz-0000Bg-LQ; Wed, 22 Mar 2023 12:08:57 +0000
Received: by outflank-mailman (input) for mailman id 513369;
 Wed, 22 Mar 2023 12:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexGy-0008Jp-MQ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:08:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5029a5c1-c8aa-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:08:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B9C433AA9;
 Wed, 22 Mar 2023 12:08:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1CD513416;
 Wed, 22 Mar 2023 12:08:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r4l8NdTvGmQITwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:08:52 +0000
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
X-Inumbo-ID: 5029a5c1-c8aa-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679486933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9SZJQ2l/SM9CqHAOm4kp4DfYnJzxAm8/FClRZGJjyA=;
	b=kjvVR+o58cgjc2f86NVx3+wlIrZTByTz/BM4TxpCu7lSNps+Y3hasEPHDhQFrLF6sUYQVD
	g352pkTHLRSSb8aqS68iUGoRliKyfnsAIaalS1r3dhUKmNqTPDY+6WJqdAwGxWMcyN0qmX
	fREQWn2xJcRaQpeHUJ7MMAj+FS9H5+o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v4 1/5] tools: add container_of() macro to xen-tools/common-macros.h
Date: Wed, 22 Mar 2023 13:08:40 +0100
Message-Id: <20230322120844.19657-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230322120844.19657-1-jgross@suse.com>
References: <20230322120844.19657-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having 4 identical copies of the definition of a
container_of() macro in different tools header files, add that macro
to xen-tools/common-macros.h and use that instead.

Delete the other copies of that macro.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
There is a similar macro CONTAINER_OF() defined in
tools/include/xentoolcore_internal.h, which allows to not only use a
type for the 2nd parameter, but a variable, too.
I'd like to get rid of that macro as well, but there are lots of use
cases especially in libxl. Any thoughts regarding that macro?
I could either:
- don't touch it at all
- enhance container_of() like CONTAINER_OF() and replace all use cases
  of CONTAINER_OF() with container_of()
- replace the few CONTAINER_OF() users outside libxl with container_of()
  and define CONTAINER_OF() in e.g. libxl_internal.h
- replace all CONTAINER_OF() use cases with container_of(), including
  the change from (.., var, ..) to (.., type, ...).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/xen-tools/common-macros.h | 4 ++++
 tools/tests/vpci/emul.h                 | 6 +-----
 tools/tests/x86_emulator/x86-emulate.h  | 5 -----
 tools/xenstore/list.h                   | 6 ++----
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index a372b9ecf2..b046ab48bf 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -76,4 +76,8 @@
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
 
+#define container_of(ptr, type, member) ({                \
+    typeof( ((type *)0)->member ) *__mptr = (ptr);        \
+    (type *)( (char *)__mptr - offsetof(type,member) );})
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index f03e3a56d1..7169a2ea02 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -27,11 +27,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 
-#define container_of(ptr, type, member) ({                      \
-        typeof(((type *)0)->member) *mptr = (ptr);              \
-                                                                \
-        (type *)((char *)mptr - offsetof(type, member));        \
-})
+#include <xen-tools/common-macros.h>
 
 #define smp_wmb()
 #define prefetch(x) __builtin_prefetch(x)
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 46d4e43cea..1af986f78d 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -56,11 +56,6 @@
 
 #define cf_check /* No Control Flow Integriy checking */
 
-#define container_of(ptr, type, member) ({             \
-    typeof(((type *)0)->member) *mptr__ = (ptr);       \
-    (type *)((char *)mptr__ - offsetof(type, member)); \
-})
-
 #define AC_(n,t) (n##t)
 #define _AC(n,t) AC_(n,t)
 
diff --git a/tools/xenstore/list.h b/tools/xenstore/list.h
index b17d13e0ec..a464a38b61 100644
--- a/tools/xenstore/list.h
+++ b/tools/xenstore/list.h
@@ -3,6 +3,8 @@
 /* Taken from Linux kernel code, but de-kernelized for userspace. */
 #include <stddef.h>
 
+#include <xen-tools/common-macros.h>
+
 #undef LIST_HEAD_INIT
 #undef LIST_HEAD
 #undef INIT_LIST_HEAD
@@ -15,10 +17,6 @@
 #define LIST_POISON1  ((void *) 0x00100100)
 #define LIST_POISON2  ((void *) 0x00200200)
 
-#define container_of(ptr, type, member) ({			\
-        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
-        (type *)( (char *)__mptr - offsetof(type,member) );})
-
 /*
  * Simple doubly linked list implementation.
  *
-- 
2.35.3


