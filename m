Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022EC80CB56
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651889.1017750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgeM-0004ep-L2; Mon, 11 Dec 2023 13:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651889.1017750; Mon, 11 Dec 2023 13:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgeM-0004c4-Hw; Mon, 11 Dec 2023 13:48:46 +0000
Received: by outflank-mailman (input) for mailman id 651889;
 Mon, 11 Dec 2023 13:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCgeL-0003yP-79
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:48:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe5c72c7-982b-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:48:41 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 15DB3223E4;
 Mon, 11 Dec 2023 13:48:41 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DFE44138FF;
 Mon, 11 Dec 2023 13:48:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id vD5/NTgTd2WGXAAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 13:48:40 +0000
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
X-Inumbo-ID: fe5c72c7-982b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702302521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mptyI+2MUmEUOVgsCKUKUDyQ+zkn0mcu28+VmTFAif0=;
	b=Uf4SIDrL22ohW4Mkmsi4Ikkh3CzK5tb4BCBkjt1devyV/GC9K/gWaJiBQPRzyiqOIn5pDI
	tl3dckYrZRG2pe+4zQggVq0ehIgKqXSildsiEqFetSqDQgl79rKfpN0YmoZqfFpiLLKZyt
	9xw0xfTxARtzV0ufGg0VGc7q6RnAUFk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702302521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mptyI+2MUmEUOVgsCKUKUDyQ+zkn0mcu28+VmTFAif0=;
	b=Uf4SIDrL22ohW4Mkmsi4Ikkh3CzK5tb4BCBkjt1devyV/GC9K/gWaJiBQPRzyiqOIn5pDI
	tl3dckYrZRG2pe+4zQggVq0ehIgKqXSildsiEqFetSqDQgl79rKfpN0YmoZqfFpiLLKZyt
	9xw0xfTxARtzV0ufGg0VGc7q6RnAUFk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] Mini-OS: drop in_callback variable
Date: Mon, 11 Dec 2023 14:48:26 +0100
Message-Id: <20231211134827.7130-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231211134827.7130-1-jgross@suse.com>
References: <20231211134827.7130-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Uf4SIDrL;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [0.99 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.99
X-Rspamd-Queue-Id: 15DB3223E4
X-Spam-Flag: NO

Now that do_hypervisor_callback() is always called with interrupts off
the in_callback variable meant to handle recursive calls of
do_hypervisor_callback() can be dropped.

As a precaution add a test to do_hypervisor_callback() that interrupts
are really disabled and crash in case this is not true.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 hypervisor.c         |  6 ------
 include/hypervisor.h |  2 --
 sched.c              | 11 -----------
 3 files changed, 19 deletions(-)

diff --git a/hypervisor.c b/hypervisor.c
index 5309daa3..6facce3e 100644
--- a/hypervisor.c
+++ b/hypervisor.c
@@ -37,8 +37,6 @@ EXPORT_SYMBOL(hypercall_page);
     ((sh)->evtchn_pending[idx] &                \
      ~(sh)->evtchn_mask[idx])
 
-int in_callback;
-
 #ifndef CONFIG_PARAVIRT
 extern shared_info_t shared_info;
 
@@ -104,8 +102,6 @@ void do_hypervisor_callback(struct pt_regs *regs)
 
     BUG_ON(!irqs_disabled());
 
-    in_callback = 1;
-   
     vcpu_info->evtchn_upcall_pending = 0;
     /* NB x86. No need for a barrier here -- XCHG is a barrier on x86. */
 #if !defined(__i386__) && !defined(__x86_64__)
@@ -127,8 +123,6 @@ void do_hypervisor_callback(struct pt_regs *regs)
             do_event(port, regs);
         }
     }
-
-    in_callback = 0;
 }
 
 void force_evtchn_callback(void)
diff --git a/include/hypervisor.h b/include/hypervisor.h
index 1d092719..b852a42a 100644
--- a/include/hypervisor.h
+++ b/include/hypervisor.h
@@ -50,6 +50,4 @@ void mask_evtchn(uint32_t port);
 void unmask_evtchn(uint32_t port);
 void clear_evtchn(uint32_t port);
 
-extern int in_callback;
-
 #endif /* __HYPERVISOR_H__ */
diff --git a/sched.c b/sched.c
index e162cb60..3335efa0 100644
--- a/sched.c
+++ b/sched.c
@@ -76,11 +76,6 @@ void schedule(void)
     prev = current;
     local_irq_save(flags); 
 
-    if (in_callback) {
-        printk("Must not call schedule() from a callback\n");
-        BUG();
-    }
-
     do {
         /* Examine all threads.
            Find a runnable thread, but also wake up expired ones and find the
@@ -151,15 +146,12 @@ struct thread* create_thread(char *name, void (*function)(void *), void *data)
 EXPORT_SYMBOL(create_thread);
 
 #ifdef HAVE_LIBC
-static struct _reent callback_reent;
 struct _reent *__getreent(void)
 {
     struct _reent *_reent;
 
     if (!threads_started)
         _reent = _impure_ptr;
-    else if (in_callback)
-        _reent = &callback_reent;
     else
         _reent = &get_current()->reent;
 
@@ -246,9 +238,6 @@ void init_sched(void)
 {
     printk("Initialising scheduler\n");
 
-#ifdef HAVE_LIBC
-    _REENT_INIT_PTR((&callback_reent))
-#endif
     idle_thread = create_thread("Idle", idle_thread_fn, NULL);
 }
 
-- 
2.35.3


