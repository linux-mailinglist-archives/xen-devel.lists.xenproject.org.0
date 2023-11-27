Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B57F9D69
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641720.1000520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yo8-0000Y6-9o; Mon, 27 Nov 2023 10:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641720.1000520; Mon, 27 Nov 2023 10:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yo8-0000WG-6Z; Mon, 27 Nov 2023 10:25:40 +0000
Received: by outflank-mailman (input) for mailman id 641720;
 Mon, 27 Nov 2023 10:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yo6-0000Co-VX
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:25:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ea601b5-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:25:38 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A651121B08;
 Mon, 27 Nov 2023 10:25:36 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BEF0132A6;
 Mon, 27 Nov 2023 10:25:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id LxsHHaBuZGWJfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:36 +0000
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
X-Inumbo-ID: 4ea601b5-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJU+VtDFhLX4cjANmjzlM4a1Q5rxASlVJ6nflK0YN+k=;
	b=j1vwIKyjbJyvqjZ1t4HjsJ+Y4aFWtuR+uZAUGsRof411x235iZX+VltoGc9Yt6/58fc0IK
	IA6RNDtFW6+LWlI/jxYTdRRRH4T5TSigWnGRRKFkau9gwY7fv7NhMLkYyQUlXtxotTXHSu
	TBVslUVKLc6cBgShiznv2EcZYduj/uI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 02/32] Mini-OS: explicitly mark symbols to be visible for apps
Date: Mon, 27 Nov 2023 11:24:53 +0100
Message-Id: <20231127102523.28003-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****************
X-Spam-Score: 16.50
X-Spamd-Result: default: False [16.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,minios-config.mk:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add an EXPORT_SYMBOL() macro to explicitly mark a symbol to be visible
for an app or library linked with Mini-OS. This prepares hiding all
other symbols from external components, avoiding any problems with
duplicate symbol names.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 .gitignore       |  1 +
 Makefile         |  3 ++-
 include/export.h | 10 ++++++++++
 include/lib.h    |  1 +
 4 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 include/export.h

diff --git a/.gitignore b/.gitignore
index abef46b2..bacf787e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -16,3 +16,4 @@ mini-os.gz
 minios-config.mk
 mini-os-debug
 mini-os-debug.gz
+syms
diff --git a/Makefile b/Makefile
index 85c6db75..588496cb 100644
--- a/Makefile
+++ b/Makefile
@@ -166,10 +166,11 @@ $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
 
 $(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
 	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
+	$(OBJCOPY) --dump-section .export_symbol=$(OBJ_DIR)/syms $@
 
 $(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
 	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
-	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* -G _start $@.o $@.o
+	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* -G _start --remove-section=.export_symbol $@.o $@.o
 	$(LD) $(LDFLAGS) $(LDFLAGS_FINAL) $@.o $(EXTRA_OBJS) -o $@-debug
 	strip -s $@-debug -o $@
 	gzip -n -f -9 -c $@-debug >$@-debug.gz
diff --git a/include/export.h b/include/export.h
new file mode 100644
index 00000000..7140ac68
--- /dev/null
+++ b/include/export.h
@@ -0,0 +1,10 @@
+#ifndef _EXPORT_H_
+#define _EXPORT_H_
+
+/* Mark a symbol to be visible for apps and libs. */
+#define EXPORT_SYMBOL(sym)          \
+    asm(".section .export_symbol\n" \
+        ".ascii \""#sym"\\n\"\n"    \
+        ".previous\n")
+
+#endif /* _EXPORT_H_ */
diff --git a/include/lib.h b/include/lib.h
index dd68985a..abd4e9ab 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -53,6 +53,7 @@
 #include <stddef.h>
 #include <xen/xen.h>
 #include <xen/event_channel.h>
+#include <mini-os/export.h>
 #include "gntmap.h"
 
 #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
-- 
2.35.3


