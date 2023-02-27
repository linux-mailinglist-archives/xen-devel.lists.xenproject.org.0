Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090056A4640
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502745.774695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdi-0003QO-Ad; Mon, 27 Feb 2023 15:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502745.774695; Mon, 27 Feb 2023 15:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdi-0003Mn-6T; Mon, 27 Feb 2023 15:42:10 +0000
Received: by outflank-mailman (input) for mailman id 502745;
 Mon, 27 Feb 2023 15:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWfdg-0002o3-Iz
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:42:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ac2dfa5-b6b5-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:42:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B14B0219ED;
 Mon, 27 Feb 2023 15:42:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 763B513912;
 Mon, 27 Feb 2023 15:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6Z+QG0/P/GOaLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 15:42:07 +0000
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
X-Inumbo-ID: 4ac2dfa5-b6b5-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677512527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmPvDiKPc8fkjb5bC8ZuNmcnqo6DotzNARfC8zrr0bE=;
	b=B1Y3ANN2XOIZx+NtezMI3FnOUMphvlhyjY1K7T2VbEO58d5c726lbJ7HoOR8whOw27IPkd
	m84zhstbNKatlWsxs4tlIeYcgYIVK+H/N1SDUogv7EeKHkFj6S9hjHjizqZsx6k06AasaS
	41zvzcF7i/k+uNHIt80d5W4NbG+Dw6Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 2/4] tools: add container_of() macro to xen-tools/common-macros.h
Date: Mon, 27 Feb 2023 16:41:51 +0100
Message-Id: <20230227154153.31080-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230227154153.31080-1-jgross@suse.com>
References: <20230227154153.31080-1-jgross@suse.com>
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
 tools/tests/vhpet/emul.h                | 3 ---
 tools/tests/vpci/emul.h                 | 6 +-----
 tools/tests/x86_emulator/x86-emulate.h  | 5 -----
 tools/xenstore/list.h                   | 6 ++----
 5 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index f39cd96008..3e73b33c91 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -75,4 +75,8 @@
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
 
+#define container_of(ptr, type, member) ({                \
+    typeof( ((type *)0)->member ) *__mptr = (ptr);        \
+    (type *)( (char *)__mptr - offsetof(type,member) );})
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
diff --git a/tools/tests/vhpet/emul.h b/tools/tests/vhpet/emul.h
index dfeb10f74e..610641ab0c 100644
--- a/tools/tests/vhpet/emul.h
+++ b/tools/tests/vhpet/emul.h
@@ -125,9 +125,6 @@ enum
 #define max_t(type, x, y) \
     ({ type __x = (x); type __y = (y); __x > __y ? __x : __y; })
 #define offsetof(t, m) ((unsigned long )&((t *)0)->m)
-#define container_of(ptr, type, member) ({              \
-        typeof( ((type *)0)->member ) *__mptr = (ptr);  \
-        (type *)( (char *)__mptr - offsetof(type,member) ); })
 
 struct domain;
 
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


