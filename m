Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC07F9D66
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641719.1000510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yo7-0000H2-3T; Mon, 27 Nov 2023 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641719.1000510; Mon, 27 Nov 2023 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yo6-0000De-Vc; Mon, 27 Nov 2023 10:25:38 +0000
Received: by outflank-mailman (input) for mailman id 641719;
 Mon, 27 Nov 2023 10:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yo5-0000Co-Ja
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:25:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c37c0a3-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:25:35 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23457202A5;
 Mon, 27 Nov 2023 10:25:31 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EDAFA132A6;
 Mon, 27 Nov 2023 10:25:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id O/zJOJpuZGV+fgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:30 +0000
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
X-Inumbo-ID: 4c37c0a3-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 01/32] Mini-OS: link kernel separately
Date: Mon, 27 Nov 2023 11:24:52 +0100
Message-Id: <20231127102523.28003-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++++++++++++++
X-Spam-Score: 18.90
X-Rspamd-Server: rspamd1
X-Spam-Level: ******************
X-Rspamd-Queue-Id: 23457202A5
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [18.90 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(5.10)[100.00%];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,ens-lyon.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Add an additional link step with linking all Mini-OS kernel binaries
into a single object file.

This is done in preparation of hiding Mini-OS internal symbols before
linking the kernel with libraries and an application.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7ee181a2..85c6db75 100644
--- a/Makefile
+++ b/Makefile
@@ -164,8 +164,11 @@ endif
 $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
 	$(CPP) $(ASFLAGS) -P $< -o $@
 
-$(OBJ_DIR)/$(TARGET): $(OBJS) $(APP_O) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
-	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(APP_O) $(OBJS) $(LDARCHLIB) $(LDLIBS) -o $@.o
+$(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
+	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
+
+$(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
+	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
 	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* -G _start $@.o $@.o
 	$(LD) $(LDFLAGS) $(LDFLAGS_FINAL) $@.o $(EXTRA_OBJS) -o $@-debug
 	strip -s $@-debug -o $@
-- 
2.35.3


