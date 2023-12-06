Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D88074BC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 17:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649348.1013760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuaw-0005rh-KQ; Wed, 06 Dec 2023 16:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649348.1013760; Wed, 06 Dec 2023 16:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuaw-0005pU-Hj; Wed, 06 Dec 2023 16:17:54 +0000
Received: by outflank-mailman (input) for mailman id 649348;
 Wed, 06 Dec 2023 16:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx6I=HR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAuau-0005nJ-Dd
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 16:17:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe60fdb8-9452-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 17:17:47 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A763D21EEF;
 Wed,  6 Dec 2023 16:17:46 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B156133DD;
 Wed,  6 Dec 2023 16:17:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id l2E5HKqecGXLMAAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 06 Dec 2023 16:17:46 +0000
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
X-Inumbo-ID: fe60fdb8-9452-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701879466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VZ4xKBMd5ayiHf5kFN/DgbMlCW/LdmUe8a4BA198re8=;
	b=pOPDdqWxQr709YaP+j9PMD1VRpCCqdpDx7gFpJ0UrY+OB+Hoo3ffNQohFLQ7RJEe4B5ld5
	5d9SYP6FrsWtBHaWTtlnYw6PaX0ILRyvzRU4XGuQvfWjyNMcA7sAluA3D+CiL49z78lBTM
	7mz7TX0AvUn5ON20miAott6GXTlsMkk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: don't use objcopy --dump-section
Date: Wed,  6 Dec 2023 17:17:44 +0100
Message-Id: <20231206161744.2508-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 9.97
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *********
X-Spamd-Result: default: False [9.97 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.07)[99.92%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

The objcopy option "--dump-section" isn't supported in binutils before
version 2.25, which are still supported by the Xen build system.

Avoid that by using the "-O binary" format together with
"--only-section". This requires to set the "alloc" section flag.

Fixes: 33411a11f848 ("Mini-OS: hide all symbols not exported via EXPORT_SYMBOLS()")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 456aed0b..6c8df8b5 100644
--- a/Makefile
+++ b/Makefile
@@ -166,7 +166,9 @@ $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
 
 $(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
 	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
-	$(OBJCOPY) --dump-section .export_symbol=$(OBJ_DIR)/syms $@
+	# The following would be neat, but isn't supported in binutils < 2.25
+	# $(OBJCOPY) --dump-section .export_symbol=$(OBJ_DIR)/syms $@
+	$(OBJCOPY) --set-section-flags .export_symbol=alloc -O binary --only-section=.export_symbol $@ $(OBJ_DIR)/syms
 	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* --keep-global-symbols=$(OBJ_DIR)/syms --remove-section=.export_symbol $@ $@
 
 $(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
-- 
2.35.3


