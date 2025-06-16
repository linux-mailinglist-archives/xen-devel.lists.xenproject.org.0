Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B69ADAB20
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016981.1394006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YL-0005mL-UK; Mon, 16 Jun 2025 08:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016981.1394006; Mon, 16 Jun 2025 08:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YL-0005jB-ON; Mon, 16 Jun 2025 08:50:53 +0000
Received: by outflank-mailman (input) for mailman id 1016981;
 Mon, 16 Jun 2025 08:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5Uy-0007jR-7j
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:47:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85a4ee03-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:47:23 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53FAB21203;
 Mon, 16 Jun 2025 08:47:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BCF7139E2;
 Mon, 16 Jun 2025 08:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +Cs4BRvaT2hAQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:47:23 +0000
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
X-Inumbo-ID: 85a4ee03-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/MeYSsGBJ27+vnobz1RvxbDTqVako7BAJOkWTQLl8E=;
	b=GXDjXMGo+0jyW1vB1crqi8s5c4HCfFeRis9b1zeJ45ctD3I/jEBpSePWxd+6dr05WO8bUM
	VEC11DAu0zCijo+VAjliNqxmux25hCpMVsyRzX9BKg1AZCzDfzQo0X5u7N+MYSqwgsPhF1
	kfjYWesKAEyZNk9NLbamW9ewCBDyygM=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GXDjXMGo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/MeYSsGBJ27+vnobz1RvxbDTqVako7BAJOkWTQLl8E=;
	b=GXDjXMGo+0jyW1vB1crqi8s5c4HCfFeRis9b1zeJ45ctD3I/jEBpSePWxd+6dr05WO8bUM
	VEC11DAu0zCijo+VAjliNqxmux25hCpMVsyRzX9BKg1AZCzDfzQo0X5u7N+MYSqwgsPhF1
	kfjYWesKAEyZNk9NLbamW9ewCBDyygM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 11/12] mini-os: kexec: add kexec callback functionality
Date: Mon, 16 Jun 2025 10:46:18 +0200
Message-ID: <20250616084619.11112-12-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 53FAB21203
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,amd.com:email]
X-Spam-Score: -3.01
X-Spam-Level: 

Add a kexec_call() macro which will provide the capability to register
a function for being called when doing a kexec() call. The called
functions will be called with a boolean parameter "undo" indicating
whether a previous call needs to be undone due to a failure during
kexec().

The related loop to call all callbacks is added to kexec().

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/minios-x86.lds.S |  8 ++++++++
 include/kexec.h           |  6 ++++++
 kexec.c                   | 13 +++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/x86/minios-x86.lds.S b/arch/x86/minios-x86.lds.S
index 8a1db7d4..8c6e0a60 100644
--- a/arch/x86/minios-x86.lds.S
+++ b/arch/x86/minios-x86.lds.S
@@ -58,6 +58,14 @@ SECTIONS
         }
         PROVIDE (__fini_array_end = .);
 
+#if defined(CONFIG_KEXEC)
+        PROVIDE (__kexec_array_start = .);
+        .kexec_array : {
+                *(.kexec_array)
+        }
+        PROVIDE (__kexec_array_end = .);
+#endif
+
         .ctors : {
                 __CTOR_LIST__ = .;
                 *(.ctors)
diff --git a/include/kexec.h b/include/kexec.h
index 411fa013..b89c3000 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -18,6 +18,12 @@ struct kexec_action {
 
 extern char _kexec_start[], _kexec_end[];
 extern struct kexec_action kexec_actions[KEXEC_MAX_ACTIONS];
+extern unsigned long __kexec_array_start[], __kexec_array_end[];
+
+typedef int(*kexeccall_t)(bool undo);
+#define kexec_call(func)                                                   \
+    static kexeccall_t __kexeccall_##func __attribute__((__used__))        \
+                       __attribute__((__section__(".kexec_array"))) = func
 
 extern unsigned long kexec_last_addr;
 
diff --git a/kexec.c b/kexec.c
index 1ef7ce84..f42aa8ad 100644
--- a/kexec.c
+++ b/kexec.c
@@ -167,6 +167,7 @@ static int analyze_kernel(void *kernel, unsigned long size)
 int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 {
     int ret;
+    unsigned long *func;
 
     ret = analyze_kernel(kernel, kernel_size);
     if ( ret )
@@ -190,6 +191,18 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     if ( ret )
         goto err;
 
+    for ( func = __kexec_array_start; func < __kexec_array_end; func++ )
+    {
+        ret = ((kexeccall_t)(*func))(false);
+        if ( ret )
+        {
+            for ( func--; func >= __kexec_array_start; func-- )
+                ((kexeccall_t)(*func))(true);
+
+            goto err;
+        }
+    }
+
     /* Error exit. */
     ret = ENOSYS;
 
-- 
2.43.0


