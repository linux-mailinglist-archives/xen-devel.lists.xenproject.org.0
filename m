Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA93AE0415
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020030.1396470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDdr-000686-LF; Thu, 19 Jun 2025 11:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020030.1396470; Thu, 19 Jun 2025 11:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDdr-00065I-Hk; Thu, 19 Jun 2025 11:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1020030;
 Thu, 19 Jun 2025 11:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDbJ-0001ot-BS
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef7b71d0-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:38:35 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CAAE1F38D;
 Thu, 19 Jun 2025 11:38:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48108136CC;
 Thu, 19 Jun 2025 11:38:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Mbp1D7v2U2h3bgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:35 +0000
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
X-Inumbo-ID: ef7b71d0-4d01-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eszOXMsGlkE+H8zrsAa6Rle4nZFAVUiFkelGTk1DgeI=;
	b=l5z/LV3TOCWcbEgfUI8RB3O/gLtmfV+XUy8xNe1+ny6/t1zBTJ6U2AUIkz6plJwGdJ9yml
	d+GcgeWtmuka2hE7W44+/msbobLK6FsbpkjyguP5tavYMIhjxgR09jOVgLLbk+4skMWmUz
	jDr8dhPls+hgLm2MekfH1PqhJ0ZLllc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eszOXMsGlkE+H8zrsAa6Rle4nZFAVUiFkelGTk1DgeI=;
	b=l5z/LV3TOCWcbEgfUI8RB3O/gLtmfV+XUy8xNe1+ny6/t1zBTJ6U2AUIkz6plJwGdJ9yml
	d+GcgeWtmuka2hE7W44+/msbobLK6FsbpkjyguP5tavYMIhjxgR09jOVgLLbk+4skMWmUz
	jDr8dhPls+hgLm2MekfH1PqhJ0ZLllc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 5/6] xenbus: drop parameter from get_xenbus()
Date: Thu, 19 Jun 2025 13:38:03 +0200
Message-ID: <20250619113804.32694-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619113804.32694-1-jgross@suse.com>
References: <20250619113804.32694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80

The parameter of get_xenbus() is used only when running in PV mode,
and it always has the same value.

Drop the parameter and use start_info_ptr directly in the PV variant
of get_xenbus().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/arm/setup.c |  2 +-
 arch/x86/setup.c |  2 +-
 include/xenbus.h |  4 ++--
 xenbus.c         | 13 +++++--------
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm/setup.c b/arch/arm/setup.c
index 161d137d..e918a064 100644
--- a/arch/arm/setup.c
+++ b/arch/arm/setup.c
@@ -41,7 +41,7 @@ void arch_init(void *dtb_pointer, uint32_t physical_offset)
     HYPERVISOR_shared_info = map_shared_info();
 
     get_console();
-    get_xenbus(NULL);
+    get_xenbus();
 
     gic_init();
 
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 2b314aa2..590f51a8 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -194,7 +194,7 @@ arch_init(void *par)
 	/* WARN: don't do printk before here, it uses information from
 	   shared_info. Use xprintk instead. */
 	get_console();
-	get_xenbus(par);
+	get_xenbus();
 	get_cmdline(par);
 
 	/* Grab the shared_info pointer and put it in a safe place. */
diff --git a/include/xenbus.h b/include/xenbus.h
index 542ee456..21da05e2 100644
--- a/include/xenbus.h
+++ b/include/xenbus.h
@@ -12,7 +12,7 @@ extern struct xenstore_domain_interface *xenstore_buf;
 
 /* Initialize the XenBus system. */
 void init_xenbus(void);
-void get_xenbus(void *p);
+void get_xenbus(void);
 #else
 #define xenbus_evtchn ~0
 #define xenstore_buf NULL
@@ -20,7 +20,7 @@ void get_xenbus(void *p);
 static inline void init_xenbus(void)
 {
 }
-static inline void get_xenbus(void *p)
+static inline void get_xenbus(void)
 {
 }
 #endif
diff --git a/xenbus.c b/xenbus.c
index 43fdebd7..8225ed4b 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -74,15 +74,15 @@ uint32_t xenbus_evtchn;
 EXPORT_SYMBOL(xenbus_evtchn);
 
 #ifdef CONFIG_PARAVIRT
-void get_xenbus(void *p)
+void get_xenbus(void)
 {
-    start_info_t *si = p;
+    start_info_t *si = start_info_ptr;
 
     xenbus_evtchn = si->store_evtchn;
     xenstore_buf = mfn_to_virt(si->store_mfn);
 }
 #else
-void get_xenbus(void *p)
+void get_xenbus(void)
 {
     uint64_t v;
 
@@ -468,11 +468,8 @@ void resume_xenbus(int canceled)
     struct write_req req[2];
     struct xsd_sockmsg *rep;
 
-#ifdef CONFIG_PARAVIRT
-    get_xenbus(start_info_ptr);
-#else
-    get_xenbus(0);
-#endif
+    get_xenbus();
+
     unmask_evtchn(xenbus_evtchn);
 
     if ( !canceled )
-- 
2.43.0


