Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980607DE347
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 16:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626508.976797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDGF-0007jl-VF; Wed, 01 Nov 2023 15:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626508.976797; Wed, 01 Nov 2023 15:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDGF-0007hP-Rf; Wed, 01 Nov 2023 15:36:03 +0000
Received: by outflank-mailman (input) for mailman id 626508;
 Wed, 01 Nov 2023 15:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyDGE-0007ME-9q
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 15:36:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b445bd5-78cc-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 16:35:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 65CAA1F750;
 Wed,  1 Nov 2023 15:35:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A5421348D;
 Wed,  1 Nov 2023 15:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gFjwDF9wQmWEKgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 15:35:59 +0000
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
X-Inumbo-ID: 5b445bd5-78cc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698852959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdJzNUIeOTqnBBADOh6ziT+aqXcEEZQBJXfEa7G7Ok4=;
	b=GKmnK/ypPIlRFjePhy8AUE5xv8okyjsRq1RzQCPaqXV2Ue2tk6nUr2WZpoWfQCVlvQHYQM
	leQuVZmhiRiRQXcd9fvvWeG6vgxfUYr1a5Q9kfps8/HO1BcD9xYMrzfh8YI8A8Asa4kX2+
	VSOnmSlnxcoOsZidJ+zlHxUOULC2tQQ=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] Mini-OS: link kernel separately
Date: Wed,  1 Nov 2023 16:35:50 +0100
Message-Id: <20231101153551.11733-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101153551.11733-1-jgross@suse.com>
References: <20231101153551.11733-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional link step with linking all Mini-OS kernel binaries
into a single object file.

This is done in preparation of hiding Mini-OS internal symbols before
linking the kernel with libraries and an application.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


