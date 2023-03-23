Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18D6C62DB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 10:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513692.795090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwd-0005Jh-P8; Thu, 23 Mar 2023 09:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513692.795090; Thu, 23 Mar 2023 09:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwd-0005G8-MG; Thu, 23 Mar 2023 09:09:15 +0000
Received: by outflank-mailman (input) for mailman id 513692;
 Thu, 23 Mar 2023 09:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfGwb-0004iI-R1
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 09:09:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611f92b4-c95a-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 10:09:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3ED15C086;
 Thu, 23 Mar 2023 09:09:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB13713596;
 Thu, 23 Mar 2023 09:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5jQjNDgXHGQbPAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 09:09:12 +0000
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
X-Inumbo-ID: 611f92b4-c95a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679562553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NkU+UmJXMS1mAOT7n+HbFjDZMmGhTQh5NhcqjvLW5Rs=;
	b=DBNNT18yqkg5poH1g6gdwVoHcdxb7d824Q2VsU575k/HLFsfW5KGepgYQiPPjEhSUD6Y6Y
	TwFCp5m1UFBH/pkV8cP+7DTdKFyQWxn4tjsRVRBr4hd0mczbybo+N18drzn+9B9osK/rG2
	4W1XfNrYl3AMWWR0OJneSRpvUX9vxzg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v5 2/5] tools: add container_of() macro to xen-tools/common-macros.h
Date: Thu, 23 Mar 2023 10:08:56 +0100
Message-Id: <20230323090859.25240-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323090859.25240-1-jgross@suse.com>
References: <20230323090859.25240-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having 4 identical copies of the definition of a
container_of() macro in different tools header files, add that macro
to xen-tools/common-macros.h and use that instead.

Delete the other copies of that macro.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V5:
- change patch sequence
- use offsetof() definition from tools/tests/x86_emulator/x86-emulate.h
  as template (Jan Beulich)
---
 tools/include/xen-tools/common-macros.h | 5 +++++
 tools/tests/vpci/emul.h                 | 6 ------
 tools/tests/x86_emulator/x86-emulate.h  | 5 -----
 tools/xenstore/list.h                   | 6 ++----
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index a372b9ecf2..76b55bf620 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -76,4 +76,9 @@
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
 
+#define container_of(ptr, type, member) ({              \
+    typeof(((type *)0)->member) *mptr__ = (ptr);        \
+    (type *)((char *)mptr__ - offsetof(type, member));  \
+})
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index d26e00b9d7..8c5bcadd5f 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -29,12 +29,6 @@
 
 #include <xen-tools/common-macros.h>
 
-#define container_of(ptr, type, member) ({                      \
-        typeof(((type *)0)->member) *mptr = (ptr);              \
-                                                                \
-        (type *)((char *)mptr - offsetof(type, member));        \
-})
-
 #define smp_wmb()
 #define prefetch(x) __builtin_prefetch(x)
 #define ASSERT(x) assert(x)
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


