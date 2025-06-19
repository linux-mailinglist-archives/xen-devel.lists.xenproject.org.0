Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981DFAE03F9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019971.1396452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDbE-0003Ma-54; Thu, 19 Jun 2025 11:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019971.1396452; Thu, 19 Jun 2025 11:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDbE-0003Kb-1H; Thu, 19 Jun 2025 11:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1019971;
 Thu, 19 Jun 2025 11:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDbC-00024Q-Od
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec22576f-4d01-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 13:38:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6D1021167;
 Thu, 19 Jun 2025 11:38:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9369C136CC;
 Thu, 19 Jun 2025 11:38:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2acoIrX2U2hsbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:29 +0000
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
X-Inumbo-ID: ec22576f-4d01-11f0-a30c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAZCg+rbfuFhOY9Ie1hCPmXCmFyEVH0iN6dKrSsrr9A=;
	b=UlSupCBty164s4CUAm/vTsyKp/eEua2pc959kIgjS9STIlMOhCgls7fOQIwjGxTVg+3K3f
	7Pv5AWFTSkKUxRnj++U7ZO7jYFgdMsHtlAS4QOHcHDNoPGW9yoLCNolsOseKSg6JvewZ9K
	PkvbBdj+514ZuOehxhaa035Ex7muHHw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAZCg+rbfuFhOY9Ie1hCPmXCmFyEVH0iN6dKrSsrr9A=;
	b=UlSupCBty164s4CUAm/vTsyKp/eEua2pc959kIgjS9STIlMOhCgls7fOQIwjGxTVg+3K3f
	7Pv5AWFTSkKUxRnj++U7ZO7jYFgdMsHtlAS4QOHcHDNoPGW9yoLCNolsOseKSg6JvewZ9K
	PkvbBdj+514ZuOehxhaa035Ex7muHHw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 4/6] console: drop parameter from get_console()
Date: Thu, 19 Jun 2025 13:38:02 +0200
Message-ID: <20250619113804.32694-5-jgross@suse.com>
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

The parameter of get_console() is used only when running in PV mode,
and it always has the same value.

Drop the parameter and use start_info_ptr directly in the PV variant
of get_console().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/arm/setup.c  |  2 +-
 arch/x86/setup.c  |  2 +-
 console.c         | 10 +++++-----
 include/console.h |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/setup.c b/arch/arm/setup.c
index 1bcfa689..161d137d 100644
--- a/arch/arm/setup.c
+++ b/arch/arm/setup.c
@@ -40,7 +40,7 @@ void arch_init(void *dtb_pointer, uint32_t physical_offset)
     /* Map shared_info page */
     HYPERVISOR_shared_info = map_shared_info();
 
-    get_console(NULL);
+    get_console();
     get_xenbus(NULL);
 
     gic_init();
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 4e2f0749..2b314aa2 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -193,7 +193,7 @@ arch_init(void *par)
 
 	/* WARN: don't do printk before here, it uses information from
 	   shared_info. Use xprintk instead. */
-	get_console(par);
+	get_console();
 	get_xenbus(par);
 	get_cmdline(par);
 
diff --git a/console.c b/console.c
index a4c50371..48c5be43 100644
--- a/console.c
+++ b/console.c
@@ -197,15 +197,15 @@ uint32_t console_evtchn;
 static struct consfront_dev* resume_xen_console(struct consfront_dev *dev);
 
 #ifdef CONFIG_PARAVIRT
-void get_console(void *p)
+void get_console(void)
 {
-    start_info_t *si = p;
+    start_info_t *si = start_info_ptr;
 
     console_ring = mfn_to_virt(si->console.domU.mfn);
     console_evtchn = si->console.domU.evtchn;
 }
 #else
-void get_console(void *p)
+void get_console(void)
 {
     uint64_t v = -1;
 
@@ -411,9 +411,9 @@ void xencons_ring_resume(struct consfront_dev *dev)
     if ( dev )
     {
 #if CONFIG_PARAVIRT
-        get_console(start_info_ptr);
+        get_console();
 #else
-        get_console(0);
+        get_console();
 #endif
         resume_xen_console(dev);
     }
diff --git a/include/console.h b/include/console.h
index d216d247..326e993b 100644
--- a/include/console.h
+++ b/include/console.h
@@ -76,7 +76,7 @@ void xprintk(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));
 void xencons_rx(char *buf, unsigned len, struct pt_regs *regs);
 void xencons_tx(void);
 
-void get_console(void *p);
+void get_console(void);
 void init_console(void);
 void console_print(struct consfront_dev *dev, const char *data, int length);
 void fini_consfront(struct consfront_dev *dev);
-- 
2.43.0


