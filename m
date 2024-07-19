Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304D937A39
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 17:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761132.1171128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUpyp-0004RW-TO; Fri, 19 Jul 2024 15:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761132.1171128; Fri, 19 Jul 2024 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUpyp-0004O0-QI; Fri, 19 Jul 2024 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 761132;
 Fri, 19 Jul 2024 15:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sUpyo-0004Nb-78
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 15:57:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bd167b6-45e7-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 17:57:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB79721195;
 Fri, 19 Jul 2024 15:57:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79FEE13808;
 Fri, 19 Jul 2024 15:57:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4DMvHM+MmmaMDwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 19 Jul 2024 15:57:03 +0000
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
X-Inumbo-ID: 8bd167b6-45e7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721404624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=njpne1O7ESlKbpj2bubjPeYyxpHa6RmoveMWlnfX5zU=;
	b=fs1dzQMkHOadYC4nCcDWjH3kCol2VQPjBs+vKmAp62Pep/8zpd9EC4/XtQNa5xuGugfYaq
	Z98SxV0e7AqBitl1YAdPTjKXFFD0+Pi0B4iMjwNwSr04poOotup659Lr8K1lPB0axgVzc7
	6Dmv2NKYmchhlt31d7Gwfr4JARpc75E=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=WfMSsv4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721404623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=njpne1O7ESlKbpj2bubjPeYyxpHa6RmoveMWlnfX5zU=;
	b=WfMSsv4AzLpQsDqFAn3i1AbfDS1OnUe11A8FOR+i3tQeZ1WGMb4qrg4EhVljXdXPMFdamw
	6zCeZdtOLMMCFSWaJwJS2GrGBffaLH7E+yRTijCHv89FHR5jRVz5m6aBl2uOACXWV00H6L
	8xgtlgRNZzhXlCapbOVue2lwCti0zck=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] Mini-OS: add some macros for asm statements
Date: Fri, 19 Jul 2024 17:57:01 +0200
Message-ID: <20240719155701.18856-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: AB79721195
X-Spam-Score: 0.19
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /

Instead of having #ifdefs sprinkled around in x86 code, add some
macros defining constants for asm statements to address differences
between 32- and 64-bit mode.

Modify existing code to use those macros.

While at it convert the assembler parts of run_idle_thread() to a more
sane variant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- addressed comments by Andrew Cooper
---
 arch/x86/sched.c | 34 ++++++++++------------------------
 include/x86/os.h | 18 ++++++++++--------
 2 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/arch/x86/sched.c b/arch/x86/sched.c
index dabe6fd6..42805f9f 100644
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
+        asm("mov %%"ASM_SP",%0" : "=r"(pointer));
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
-                         :"=m" (idle_thread->sp)
-                         :"m" (idle_thread->ip));                          
-#elif defined(__x86_64__)
-    __asm__ __volatile__("mov %0,%%rsp\n\t"
-                         "push %1\n\t" 
-                         "ret"                                            
-                         :"=m" (idle_thread->sp)
-                         :"m" (idle_thread->ip));                                                    
-#endif
+    /* Switch stacks and run the thread */
+    asm volatile ("mov %[sp], %%"ASM_SP"\n\t"
+                  "jmp *%[ip]\n\t"
+                  :
+                  : [sp] "m" (idle_thread->sp),
+                    [ip] "m" (idle_thread->ip));
 }
 
 unsigned long __local_irq_save(void)
diff --git a/include/x86/os.h b/include/x86/os.h
index ee34d784..0095be13 100644
--- a/include/x86/os.h
+++ b/include/x86/os.h
@@ -61,6 +61,16 @@
 #define TRAP_deferred_nmi     31
 #define TRAP_xen_callback     32
 
+#if defined(__i386__)
+#define __SZ    "l"
+#define __REG   "e"
+#else
+#define __SZ    "q"
+#define __REG   "r"
+#endif
+
+#define ASM_SP  __REG"sp"
+
 /* Everything below this point is not included by assembler (.S) files. */
 #ifndef __ASSEMBLY__
 
@@ -141,14 +151,6 @@ do {									\
 
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
2.43.0


