Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA8A6B770
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923633.1327130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYjO-0007G9-FR; Fri, 21 Mar 2025 09:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923633.1327130; Fri, 21 Mar 2025 09:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYjO-0007EP-CS; Fri, 21 Mar 2025 09:31:58 +0000
Received: by outflank-mailman (input) for mailman id 923633;
 Fri, 21 Mar 2025 09:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYdY-0005O8-C6
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc910a9-0636-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:25:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6464821D73;
 Fri, 21 Mar 2025 09:25:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A62B139AA;
 Fri, 21 Mar 2025 09:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hQrTDKMw3WdiGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:55 +0000
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
X-Inumbo-ID: 7dc910a9-0636-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQe3NFl9NcYNQIAbCkFgkSlVK4W9Vi1C+SAHqrE0njI=;
	b=rVMNk08qj8xr248VPAaqoUDnb3UN031wvyAVRy62mdY6oL37SgxFKyxcUmYmDAY9GZkwL4
	UfoosWMhcQN4IeM7ERad686Tg8/QjFpJTEIEHZbD2XgI+4IMeh644EX5ilgUe7+1H6Ch/W
	YHJDLawq5zEnu3VCyqOLBcMApjkbyN0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rVMNk08q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQe3NFl9NcYNQIAbCkFgkSlVK4W9Vi1C+SAHqrE0njI=;
	b=rVMNk08qj8xr248VPAaqoUDnb3UN031wvyAVRy62mdY6oL37SgxFKyxcUmYmDAY9GZkwL4
	UfoosWMhcQN4IeM7ERad686Tg8/QjFpJTEIEHZbD2XgI+4IMeh644EX5ilgUe7+1H6Ch/W
	YHJDLawq5zEnu3VCyqOLBcMApjkbyN0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 11/12] kexec: add kexec callback functionality
Date: Fri, 21 Mar 2025 10:24:50 +0100
Message-ID: <20250321092451.17309-12-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6464821D73
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Add a kexec_call() macro which will provide the capability to register
a function for being called when doing a kexec() call. The called
functions will be called with a boolean parameter "undo" indicating
whether a previous call needs to be undone due to a failure during
kexec().

The related loop to call all callbacks is added to kexec().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/minios-x86.lds.S |  8 ++++++++
 arch/x86/mm.c             |  3 ++-
 include/kexec.h           |  6 ++++++
 kexec.c                   | 13 +++++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/x86/minios-x86.lds.S b/arch/x86/minios-x86.lds.S
index 83ec41ce..35356b34 100644
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
diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index f4419d95..26ede6f4 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -529,7 +529,8 @@ void change_readonly(bool readonly)
 #endif
     }
 
-    printk("setting %p-%p readonly\n", &_text, &_erodata);
+    printk("setting %p-%p %s\n", &_text, &_erodata,
+           readonly ? "readonly" : "writable");
     walk_pt(start_address, ro.etext, change_readonly_func, &ro);
 
 #ifdef CONFIG_PARAVIRT
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
index 2992f58f..2db876e8 100644
--- a/kexec.c
+++ b/kexec.c
@@ -168,6 +168,7 @@ static int analyze_kernel(void *kernel, unsigned long size)
 int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 {
     int ret;
+    unsigned long *func;
 
     ret = analyze_kernel(kernel, kernel_size);
     if ( ret )
@@ -191,6 +192,18 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
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


