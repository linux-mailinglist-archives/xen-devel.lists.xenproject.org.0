Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B94AD1EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 08:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267539.461291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHKaL-0008SK-OH; Tue, 08 Feb 2022 07:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267539.461291; Tue, 08 Feb 2022 07:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHKaL-0008QU-KJ; Tue, 08 Feb 2022 07:06:45 +0000
Received: by outflank-mailman (input) for mailman id 267539;
 Tue, 08 Feb 2022 07:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=co3W=SX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHKaJ-0008AS-KA
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 07:06:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab0a14c1-88ad-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 08:06:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DE5C21106;
 Tue,  8 Feb 2022 07:06:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C09B613B7F;
 Tue,  8 Feb 2022 07:06:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id APeoLYEWAmKxHgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Feb 2022 07:06:41 +0000
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
X-Inumbo-ID: ab0a14c1-88ad-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644304002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3JYUku98qeZg6VOnInB3O+12NYpmiH94/YoTHJL2nY=;
	b=e3dxfCJaE87YJujX3F8bFRkPyXU/qA/bzF08wB6YXTUTKBRgV1aoYKGfA+O+4W+fbD9DDV
	pBwIbabSpdcJoe2SHv4MiEBy+4+FeYOqr/UlYSAlwVzJPn8hM2WGplgESwOgiO3NtGX8mf
	4Q/rGZ7Wl4dslBsX3wl4jxbBahcZWGs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 3/5] tools/libs/toolcore: replace _xentoolcore_list.h with _xen_list.h
Date: Tue,  8 Feb 2022 08:06:36 +0100
Message-Id: <20220208070638.5909-4-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208070638.5909-1-jgross@suse.com>
References: <20220208070638.5909-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove generating _xentoolcore_list.h and use the common _xen_list.h
instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
v3:
- fix build (Anthony PERARD)
---
 .gitignore                           | 1 -
 tools/include/xentoolcore_internal.h | 4 ++--
 tools/libs/toolcore/Makefile         | 8 --------
 tools/libs/toolcore/handlereg.c      | 8 ++++----
 4 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3f9d55ba87..afe78c787c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -227,7 +227,6 @@ tools/hotplug/NetBSD/rc.d/xencommons
 tools/hotplug/NetBSD/rc.d/xendriverdomain
 tools/include/acpi
 tools/include/_libxl*.h
-tools/include/_xentoolcore_list.h
 tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
diff --git a/tools/include/xentoolcore_internal.h b/tools/include/xentoolcore_internal.h
index 04f5848f09..deccefd612 100644
--- a/tools/include/xentoolcore_internal.h
+++ b/tools/include/xentoolcore_internal.h
@@ -27,7 +27,7 @@
 #include <stddef.h>
 
 #include "xentoolcore.h"
-#include "_xentoolcore_list.h"
+#include "_xen_list.h"
 
 /*---------- active handle registration ----------*/
 
@@ -87,7 +87,7 @@ typedef int Xentoolcore__Restrict_Callback(Xentoolcore__Active_Handle*,
 
 struct Xentoolcore__Active_Handle {
     Xentoolcore__Restrict_Callback *restrict_callback;
-    XENTOOLCORE_LIST_ENTRY(Xentoolcore__Active_Handle) entry;
+    XEN_LIST_ENTRY(Xentoolcore__Active_Handle) entry;
 };
 
 void xentoolcore__register_active_handle(Xentoolcore__Active_Handle*);
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index ed4ae00694..9c013b2879 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
-AUTOINCS := $(XEN_INCLUDE)/_xentoolcore_list.h
 
 LIBHEADER := xentoolcore.h
 
@@ -12,10 +11,3 @@ SRCS-y	+= handlereg.c
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 PKG_CONFIG_DESC := Central support for Xen Hypervisor userland libraries
-
-$(LIB_OBJS): $(AUTOINCS)
-$(PIC_OBJS): $(AUTOINCS)
-
-$(XEN_INCLUDE)/_xentoolcore_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=xentoolcore >$(notdir $@).new
-	$(call move-if-changed,$(notdir $@).new,$@)
diff --git a/tools/libs/toolcore/handlereg.c b/tools/libs/toolcore/handlereg.c
index baec55e2a4..b43cb0e8ac 100644
--- a/tools/libs/toolcore/handlereg.c
+++ b/tools/libs/toolcore/handlereg.c
@@ -31,7 +31,7 @@
 #include <assert.h>
 
 static pthread_mutex_t handles_lock = PTHREAD_MUTEX_INITIALIZER;
-static XENTOOLCORE_LIST_HEAD(, Xentoolcore__Active_Handle) handles;
+static XEN_LIST_HEAD(, Xentoolcore__Active_Handle) handles;
 
 static void lock(void) {
     int e = pthread_mutex_lock(&handles_lock);
@@ -45,13 +45,13 @@ static void unlock(void) {
 
 void xentoolcore__register_active_handle(Xentoolcore__Active_Handle *ah) {
     lock();
-    XENTOOLCORE_LIST_INSERT_HEAD(&handles, ah, entry);
+    XEN_LIST_INSERT_HEAD(&handles, ah, entry);
     unlock();
 }
 
 void xentoolcore__deregister_active_handle(Xentoolcore__Active_Handle *ah) {
     lock();
-    XENTOOLCORE_LIST_REMOVE(ah, entry);
+    XEN_LIST_REMOVE(ah, entry);
     unlock();
 }
 
@@ -60,7 +60,7 @@ int xentoolcore_restrict_all(domid_t domid) {
     Xentoolcore__Active_Handle *ah;
 
     lock();
-    XENTOOLCORE_LIST_FOREACH(ah, &handles, entry) {
+    XEN_LIST_FOREACH(ah, &handles, entry) {
         r = ah->restrict_callback(ah, domid);
         if (r) goto out;
     }
-- 
2.34.1


