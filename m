Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E650AE03F5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019962.1396427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDb3-0002TG-HT; Thu, 19 Jun 2025 11:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019962.1396427; Thu, 19 Jun 2025 11:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDb3-0002Qy-EQ; Thu, 19 Jun 2025 11:38:21 +0000
Received: by outflank-mailman (input) for mailman id 1019962;
 Thu, 19 Jun 2025 11:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDb2-0001ot-Bc
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e555dc00-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:38:18 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75DFA1F38D;
 Thu, 19 Jun 2025 11:38:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45125136CC;
 Thu, 19 Jun 2025 11:38:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Xpc1D6r2U2hjbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:18 +0000
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
X-Inumbo-ID: e555dc00-4d01-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7iU8G8KB8ff9iK1iRznz/sdoVaMREHLMXYxPjB0hj4=;
	b=JU0g8i4NjM0Qn9aAyZ4vguZqi6Ro4/zU7IWxryoabJw91KRD4dWnaGFMGyDS1ehQtHE5+U
	Oo2R2IWiB6rUjNam/KNqdt0PjB/P77sPfbF5bDAxeIaayXD601uc1BsYB+1k4Iiv1cdPLr
	eIpV7yRC0O/dontmnMW78PJEk4DE7Gg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750333098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7iU8G8KB8ff9iK1iRznz/sdoVaMREHLMXYxPjB0hj4=;
	b=JU0g8i4NjM0Qn9aAyZ4vguZqi6Ro4/zU7IWxryoabJw91KRD4dWnaGFMGyDS1ehQtHE5+U
	Oo2R2IWiB6rUjNam/KNqdt0PjB/P77sPfbF5bDAxeIaayXD601uc1BsYB+1k4Iiv1cdPLr
	eIpV7yRC0O/dontmnMW78PJEk4DE7Gg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 2/6] setup: drop parameter from map_shared_info()
Date: Thu, 19 Jun 2025 13:38:00 +0200
Message-ID: <20250619113804.32694-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619113804.32694-1-jgross@suse.com>
References: <20250619113804.32694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80

The parameter of map_shared_info() is evaluated in PV mode only, and it
is always the pointer to the initial struct start_info from boot time.

By setting start_info_ptr a little bit earlier the PV variant of
map_shared_info() can just use start_info_ptr instead of a parameter.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/arm/setup.c     |  2 +-
 arch/x86/setup.c     | 12 ++++++------
 hypervisor.c         |  2 +-
 include/hypervisor.h |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/setup.c b/arch/arm/setup.c
index 3d112fae..1bcfa689 100644
--- a/arch/arm/setup.c
+++ b/arch/arm/setup.c
@@ -38,7 +38,7 @@ void arch_init(void *dtb_pointer, uint32_t physical_offset)
     device_tree = dtb_pointer;
 
     /* Map shared_info page */
-    HYPERVISOR_shared_info = map_shared_info(NULL);
+    HYPERVISOR_shared_info = map_shared_info();
 
     get_console(NULL);
     get_xenbus(NULL);
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index e30eb065..1bdf9509 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -79,11 +79,10 @@ static inline void sse_init(void) {
 #ifdef CONFIG_PARAVIRT
 #define hpc_init()
 
-shared_info_t *map_shared_info(void *p)
+shared_info_t *map_shared_info(void)
 {
     int rc;
-    start_info_t *si = p;
-    unsigned long pa = si->shared_info;
+    unsigned long pa = start_info_ptr->shared_info;
 
     if ( (rc = HYPERVISOR_update_va_mapping((unsigned long)shared_info,
                                             __pte(pa | 7), UVMF_INVLPG)) )
@@ -185,6 +184,8 @@ arch_init(void *par)
 {
 	static char hello[] = "Bootstrapping...\n";
 
+	start_info_ptr = par;
+
 	hpc_init();
 	(void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(hello), hello);
 
@@ -206,7 +207,7 @@ arch_init(void *par)
 	get_cmdline(par);
 
 	/* Grab the shared_info pointer and put it in a safe place. */
-	HYPERVISOR_shared_info = map_shared_info(par);
+	HYPERVISOR_shared_info = map_shared_info();
 
 	/* print out some useful information  */
 	print_start_of_day(par);
@@ -214,7 +215,6 @@ arch_init(void *par)
 #ifdef CONFIG_PARAVIRT
 	memcpy(&start_info, par, sizeof(start_info));
 #endif
-	start_info_ptr = (start_info_t *)par;
 
 	start_kernel();
 }
@@ -253,7 +253,7 @@ void arch_post_suspend(int canceled)
     }
 #endif
 
-    HYPERVISOR_shared_info = map_shared_info((void*) start_info_ptr);
+    HYPERVISOR_shared_info = map_shared_info();
 #ifndef CONFIG_PARAVIRT
     xen_callback_vector();
 #endif
diff --git a/hypervisor.c b/hypervisor.c
index ba535556..6476d658 100644
--- a/hypervisor.c
+++ b/hypervisor.c
@@ -65,7 +65,7 @@ int hvm_set_parameter(int idx, uint64_t value)
     return HYPERVISOR_hvm_op(HVMOP_set_param, &xhv);
 }
 
-shared_info_t *map_shared_info(void *p)
+shared_info_t *map_shared_info(void)
 {
     struct xen_add_to_physmap xatp;
 
diff --git a/include/hypervisor.h b/include/hypervisor.h
index b852a42a..aef142d1 100644
--- a/include/hypervisor.h
+++ b/include/hypervisor.h
@@ -42,7 +42,7 @@ extern union start_info_union start_info_union;
 int hvm_get_parameter(int idx, uint64_t *value);
 int hvm_set_parameter(int idx, uint64_t value);
 #endif
-shared_info_t *map_shared_info(void *p);
+shared_info_t *map_shared_info(void);
 void unmap_shared_info(void);
 void force_evtchn_callback(void);
 void do_hypervisor_callback(struct pt_regs *regs);
-- 
2.43.0


