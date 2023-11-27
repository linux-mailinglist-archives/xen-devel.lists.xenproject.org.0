Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813517F9D68
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641730.1000563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YoN-0001ur-CK; Mon, 27 Nov 2023 10:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641730.1000563; Mon, 27 Nov 2023 10:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YoN-0001r5-8B; Mon, 27 Nov 2023 10:25:55 +0000
Received: by outflank-mailman (input) for mailman id 641730;
 Mon, 27 Nov 2023 10:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YoM-0000Co-DD
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:25:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f39661-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:25:53 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3930321B08;
 Mon, 27 Nov 2023 10:25:53 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F484132A6;
 Mon, 27 Nov 2023 10:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id kz+JArFuZGWXfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:53 +0000
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
X-Inumbo-ID: 57f39661-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 05/32] Mini-OS: add EXPORT_SYMBOL() instances to sched.c
Date: Mon, 27 Nov 2023 11:24:56 +0100
Message-Id: <20231127102523.28003-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *********************
X-Spamd-Bar: +++++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
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
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 21.50
X-Rspamd-Queue-Id: 3930321B08
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to sched.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 arch/x86/sched.c | 5 +++++
 sched.c          | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/sched.c b/arch/x86/sched.c
index e7b6954e..dabe6fd6 100644
--- a/arch/x86/sched.c
+++ b/arch/x86/sched.c
@@ -142,11 +142,13 @@ unsigned long __local_irq_save(void)
     local_irq_save(flags);
     return flags;
 }
+EXPORT_SYMBOL(__local_irq_save);
 
 void __local_irq_restore(unsigned long flags)
 {
     local_irq_restore(flags);
 }
+EXPORT_SYMBOL(__local_irq_restore);
 
 unsigned long __local_save_flags(void)
 {
@@ -155,13 +157,16 @@ unsigned long __local_save_flags(void)
     local_save_flags(flags);
     return flags;
 }
+EXPORT_SYMBOL(__local_save_flags);
 
 void __local_irq_disable(void)
 {
     local_irq_disable();
 }
+EXPORT_SYMBOL(__local_irq_disable);
 
 void __local_irq_enable(void)
 {
     local_irq_enable();
 }
+EXPORT_SYMBOL(__local_irq_enable);
diff --git a/sched.c b/sched.c
index 6f89ea4d..e162cb60 100644
--- a/sched.c
+++ b/sched.c
@@ -128,6 +128,7 @@ void schedule(void)
         }
     }
 }
+EXPORT_SYMBOL(schedule);
 
 struct thread* create_thread(char *name, void (*function)(void *), void *data)
 {
@@ -147,6 +148,7 @@ struct thread* create_thread(char *name, void (*function)(void *), void *data)
     local_irq_restore(flags);
     return thread;
 }
+EXPORT_SYMBOL(create_thread);
 
 #ifdef HAVE_LIBC
 static struct _reent callback_reent;
@@ -184,6 +186,7 @@ struct _reent *__getreent(void)
 #endif
     return _reent;
 }
+EXPORT_SYMBOL(__getreent);
 #endif
 
 void exit_thread(void)
@@ -205,12 +208,14 @@ void exit_thread(void)
         printk("schedule() returned!  Trying again\n");
     }
 }
+EXPORT_SYMBOL(exit_thread);
 
 void block(struct thread *thread)
 {
     thread->wakeup_time = 0LL;
     clear_runnable(thread);
 }
+EXPORT_SYMBOL(block);
 
 void msleep(uint32_t millisecs)
 {
@@ -219,12 +224,14 @@ void msleep(uint32_t millisecs)
     clear_runnable(thread);
     schedule();
 }
+EXPORT_SYMBOL(msleep);
 
 void wake(struct thread *thread)
 {
     thread->wakeup_time = 0LL;
     set_runnable(thread);
 }
+EXPORT_SYMBOL(wake);
 
 void idle_thread_fn(void *unused)
 {
-- 
2.35.3


