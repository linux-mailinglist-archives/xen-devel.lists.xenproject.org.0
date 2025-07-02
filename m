Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18006AF0D96
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030378.1404024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsaY-0008KI-2P; Wed, 02 Jul 2025 08:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030378.1404024; Wed, 02 Jul 2025 08:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsaX-0008Ik-VD; Wed, 02 Jul 2025 08:13:05 +0000
Received: by outflank-mailman (input) for mailman id 1030378;
 Wed, 02 Jul 2025 08:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsaW-00082Y-5q
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 605beaf1-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:13:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43E542118B;
 Wed,  2 Jul 2025 08:13:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BC0E13A24;
 Wed,  2 Jul 2025 08:13:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xWhYBQ/qZGjzSAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:03 +0000
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
X-Inumbo-ID: 605beaf1-571c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4f9gptLjJY0e6N/f33d13mKNX3TplFpE0BIUSgd+yE=;
	b=t7MrFrm0/HDLCcTybXibhpoWM5oUKjxCEPNzzq6FlaGy9g287RDAAaGKRhOfuz2J1d4Nsz
	HlEVo9DAmC4CYgobgxUXDP8yIIKBVI/jflTHT9ifNgMXRd+oNQ7SzFgK7epfaW6t+cBJ/u
	o/UOoVYCb0s09NU/ULlKtIvzbfzAs/s=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=t7MrFrm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4f9gptLjJY0e6N/f33d13mKNX3TplFpE0BIUSgd+yE=;
	b=t7MrFrm0/HDLCcTybXibhpoWM5oUKjxCEPNzzq6FlaGy9g287RDAAaGKRhOfuz2J1d4Nsz
	HlEVo9DAmC4CYgobgxUXDP8yIIKBVI/jflTHT9ifNgMXRd+oNQ7SzFgK7epfaW6t+cBJ/u
	o/UOoVYCb0s09NU/ULlKtIvzbfzAs/s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 01/19] setup: add global pointer for struct hvm_start_info
Date: Wed,  2 Jul 2025 10:12:36 +0200
Message-ID: <20250702081254.14383-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 43E542118B
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01
X-Spam-Level: 

Similar to start_info_ptr for PV provide hvm_start_info_ptr for PVH.

Add a generic function to set the pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/setup.c     | 20 +++++++++++++++++---
 include/hypervisor.h |  3 +++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index ed28d940..2085ee5c 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -69,6 +69,11 @@ static inline void sse_init(void) {
 start_info_t *start_info_ptr;
 EXPORT_SYMBOL(start_info_ptr);
 
+static void set_info_ptr(start_info_t *ptr)
+{
+    start_info_ptr = ptr;
+}
+
 #define hpc_init()
 
 shared_info_t *map_shared_info(void)
@@ -123,6 +128,17 @@ static void print_start_of_day(void *p)
     printk("       stack: %p-%p\n", stack, stack + sizeof(stack));
 }
 #else
+
+/*
+ * This pointer holds a reference to the hvm_start_info struct.
+ */
+struct hvm_start_info *hvm_start_info_ptr;
+
+static void set_info_ptr(struct hvm_start_info *ptr)
+{
+    hvm_start_info_ptr = ptr;
+}
+
 static void hpc_init(void)
 {
     uint32_t eax, ebx, ecx, edx, base;
@@ -176,9 +192,7 @@ arch_init(void *par)
 {
 	static char hello[] = "Bootstrapping...\n";
 
-#ifdef CONFIG_PARAVIRT
-	start_info_ptr = par;
-#endif
+	set_info_ptr(par);
 
 	hpc_init();
 	(void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(hello), hello);
diff --git a/include/hypervisor.h b/include/hypervisor.h
index d199f039..93f1247f 100644
--- a/include/hypervisor.h
+++ b/include/hypervisor.h
@@ -33,6 +33,9 @@ extern start_info_t *start_info_ptr;
 
 #define start_info (*start_info_ptr)
 #else
+#include <xen/arch-x86/hvm/start_info.h>
+
+extern struct hvm_start_info *hvm_start_info_ptr;
 int hvm_get_parameter(int idx, uint64_t *value);
 int hvm_set_parameter(int idx, uint64_t value);
 #endif
-- 
2.43.0


