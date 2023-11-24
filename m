Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2E7F75DB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640725.999357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Wi7-0002v7-Io; Fri, 24 Nov 2023 13:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640725.999357; Fri, 24 Nov 2023 13:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Wi7-0002t4-G3; Fri, 24 Nov 2023 13:59:11 +0000
Received: by outflank-mailman (input) for mailman id 640725;
 Fri, 24 Nov 2023 13:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6Wi6-0002rA-6T
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:59:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3039d44-8ad1-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:59:08 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E45861FDD9;
 Fri, 24 Nov 2023 13:59:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BBF50139E8;
 Fri, 24 Nov 2023 13:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id TSCSLCqsYGURGwAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 24 Nov 2023 13:59:06 +0000
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
X-Inumbo-ID: a3039d44-8ad1-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH] Mini-OS: explicitly mark symbols to be visible for apps
Date: Fri, 24 Nov 2023 14:59:03 +0100
Message-Id: <20231124135903.16621-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *********************
X-Spamd-Bar: +++++++++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [21.50 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mini-os.map:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 21.50
X-Rspamd-Queue-Id: E45861FDD9
X-Spam-Flag: NO

Add an EXPORT_SYMBOL() macro to explicitly mark a symbol to be visible
for an app or library linked with Mini-OS. This enables to hide all
other symbols from external components, avoiding any problems with
duplicate symbol names.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Based on top of my previous series "Mini-OS: hide mini-os internal
symbols".
This is a RFC as an alternative to the map file containing all
visible symbol names. It would add more code churn, but it has the
large benefit of declaring visibility of a symbol at the place
where it is defined, reducing the chance to miss a proper symbol
visibility definition.
This patch is including an example for the do_exit() function in
order to prove the viability of the approach.
In case this idea is approved, I'd setup a patch series replacing
the second patch of above series with this patch (minus the do_exit()
example) and the scattered EXPORT_SYMBOL() instances.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile      | 3 ++-
 include/lib.h | 6 ++++++
 kernel.c      | 1 +
 mini-os.map   | 1 -
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d4768110..5dbad8ce 100644
--- a/Makefile
+++ b/Makefile
@@ -166,7 +166,8 @@ $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
 
 $(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds mini-os.map
 	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
-	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* --keep-global-symbols=mini-os.map $@ $@
+	$(OBJCOPY) --dump-section .export_symbol=syms mini-os-kern.o
+	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* --keep-global-symbols=mini-os.map --keep-global-symbols=syms --remove-section=.export_symbol $@ $@
 
 $(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
 	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
diff --git a/include/lib.h b/include/lib.h
index dd68985a..24fd0186 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -64,6 +64,12 @@
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
 #endif
 
+#define EXPORT_SYMBOL(sym)                    \
+    extern typeof(sym) sym;                   \
+    asm(".section \".export_symbol\",\"a\"\n" \
+        "\t.ascii \""#sym"\n\"\n"             \
+        ".previous")
+
 #ifdef HAVE_LIBC
 #include <sys/queue.h>
 #include <sys/stat.h>
diff --git a/kernel.c b/kernel.c
index 1f97d8dd..29eed535 100644
--- a/kernel.c
+++ b/kernel.c
@@ -199,3 +199,4 @@ void do_exit(void)
         HYPERVISOR_sched_op(SCHEDOP_shutdown, &sched_shutdown);
     }
 }
+EXPORT_SYMBOL(do_exit);
diff --git a/mini-os.map b/mini-os.map
index 58a3a0ee..90f02edf 100644
--- a/mini-os.map
+++ b/mini-os.map
@@ -69,7 +69,6 @@ close
 closedir
 closelog
 connect
-do_exit
 dup
 dup2
 err
-- 
2.35.3


