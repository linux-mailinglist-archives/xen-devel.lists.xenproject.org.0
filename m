Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C48A6492
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 09:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706687.1104004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcyr-0004Ow-L1; Tue, 16 Apr 2024 07:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706687.1104004; Tue, 16 Apr 2024 07:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcyr-0004NL-Hr; Tue, 16 Apr 2024 07:11:49 +0000
Received: by outflank-mailman (input) for mailman id 706687;
 Tue, 16 Apr 2024 07:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CynW=LV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rwcyq-0004NA-4Q
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 07:11:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9498eed3-fbc0-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 09:11:45 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85F685D811;
 Tue, 16 Apr 2024 07:11:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C13313931;
 Tue, 16 Apr 2024 07:11:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +UsQFa8kHmYYTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 16 Apr 2024 07:11:43 +0000
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
X-Inumbo-ID: 9498eed3-fbc0-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1713251503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Zu3kW8QNFx8OLYZx8ArErH8TeIxJLq4bIF99YnLcJgg=;
	b=EXTGmEPfMzPfY5eJIZpiMOqN8W608K7D8kST9AeI2hwAqzQ8yZqXeKehReb3IDWMvfJ6kJ
	DBzqAbPILpecAncz5cOyR7YB9xy7HT12cEfPqF1n5aOxWGdZUCNKp9p932On0GJYLtY3Nw
	5p33SGFSq6ZE4tt9/r74UXExUL7Jhrk=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=EXTGmEPf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1713251503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Zu3kW8QNFx8OLYZx8ArErH8TeIxJLq4bIF99YnLcJgg=;
	b=EXTGmEPfMzPfY5eJIZpiMOqN8W608K7D8kST9AeI2hwAqzQ8yZqXeKehReb3IDWMvfJ6kJ
	DBzqAbPILpecAncz5cOyR7YB9xy7HT12cEfPqF1n5aOxWGdZUCNKp9p932On0GJYLtY3Nw
	5p33SGFSq6ZE4tt9/r74UXExUL7Jhrk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: add some macros for asm statements
Date: Tue, 16 Apr 2024 09:11:39 +0200
Message-Id: <20240416071139.11083-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 85F685D811
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+]

Instead of having #ifdefs sprinkled around in x86 code, add some
macros defining constants for asm statements to address differences
between 32- and 64-bit mode.

Modify existing code to use those macros.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/sched.c | 32 +++++++++-----------------------
 include/x86/os.h | 19 +++++++++++--------
 2 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/arch/x86/sched.c b/arch/x86/sched.c
index dabe6fd6..460dea2e 100644
--- a/arch/x86/sched.c
+++ b/arch/x86/sched.c
@@ -60,16 +60,10 @@ void dump_stack(struct thread *thread)
     unsigned long *bottom = (unsigned long *)(thread->stack + STACK_SIZE); 
     unsigned long *pointer = (unsigned long *)thread->sp;
     int count;
-    if(thread == current)
-    {
-#ifdef __i386__    
-        asm("movl %%esp,%0"
-            : "=r"(pointer));
-#else
-        asm("movq %%rsp,%0"
-            : "=r"(pointer));
-#endif
-    }
+
+    if ( thread == current )
+        asm(ASM_MOV" "ASM_SP",%0" : "=r"(pointer));
+
     printk("The stack for \"%s\"\n", thread->name);
     for(count = 0; count < 25 && pointer < bottom; count ++)
     {
@@ -119,20 +113,12 @@ struct thread* arch_create_thread(char *name, void (*function)(void *),
 
 void run_idle_thread(void)
 {
-    /* Switch stacks and run the thread */ 
-#if defined(__i386__)
-    __asm__ __volatile__("mov %0,%%esp\n\t"
-                         "push %1\n\t" 
-                         "ret"                                            
+    /* Switch stacks and run the thread */
+    __asm__ __volatile__("mov %0,"ASM_SP"\n\t"
+                         "push %1\n\t"
+                         "ret"
                          :"=m" (idle_thread->sp)
-                         :"m" (idle_thread->ip));                          
-#elif defined(__x86_64__)
-    __asm__ __volatile__("mov %0,%%rsp\n\t"
-                         "push %1\n\t" 
-                         "ret"                                            
-                         :"=m" (idle_thread->sp)
-                         :"m" (idle_thread->ip));                                                    
-#endif
+                         :"m" (idle_thread->ip));
 }
 
 unsigned long __local_irq_save(void)
diff --git a/include/x86/os.h b/include/x86/os.h
index ee34d784..485d90b8 100644
--- a/include/x86/os.h
+++ b/include/x86/os.h
@@ -77,6 +77,17 @@ int  arch_suspend(void);
 void arch_post_suspend(int canceled);
 void arch_fini(void);
 
+#if defined(__i386__)
+#define __SZ    "l"
+#define __REG   "e"
+#else
+#define __SZ    "q"
+#define __REG   "r"
+#endif
+
+#define ASM_SP  "%%"__REG"sp"
+#define ASM_MOV "mov"__SZ
+
 #ifdef CONFIG_PARAVIRT
 
 /* 
@@ -141,14 +152,6 @@ do {									\
 
 #else
 
-#if defined(__i386__)
-#define __SZ "l"
-#define __REG "e"
-#else
-#define __SZ "q"
-#define __REG "r"
-#endif
-
 #define __cli() asm volatile ( "cli" : : : "memory" )
 #define __sti() asm volatile ( "sti" : : : "memory" )
 
-- 
2.35.3


