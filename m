Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE324AEA221
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026655.1401865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIh-0004k0-7Z; Thu, 26 Jun 2025 15:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026655.1401865; Thu, 26 Jun 2025 15:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIh-0004hT-4E; Thu, 26 Jun 2025 15:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1026655;
 Thu, 26 Jun 2025 15:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zZyX=ZJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUoIf-00046W-GI
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:14:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328ed4bb-52a0-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:14:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B1B721160;
 Thu, 26 Jun 2025 15:14:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2092C13188;
 Thu, 26 Jun 2025 15:14:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YfNXBrxjXWgAOwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 26 Jun 2025 15:14:04 +0000
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
X-Inumbo-ID: 328ed4bb-52a0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aD+bS4T0OmGOE8GUbzM6J/43FA2KaMdcwiETXcLbNs=;
	b=Gh60U7kudqIgV5k0t2pBSXmrOQTQhVd0Nyfa78osydhR2c9FGpfyZImZAvxheY4jXNK3UW
	hUsDVZ01RSkJetiY+ABDjGAdAB9k1Z0pZ8TXC9qYDAv4ztl/lJ7AWX7MVShbWGXrpAabHb
	6ClmhVS+oJBFJavLn8Mg9cNpO2Qf0O8=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Gh60U7ku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aD+bS4T0OmGOE8GUbzM6J/43FA2KaMdcwiETXcLbNs=;
	b=Gh60U7kudqIgV5k0t2pBSXmrOQTQhVd0Nyfa78osydhR2c9FGpfyZImZAvxheY4jXNK3UW
	hUsDVZ01RSkJetiY+ABDjGAdAB9k1Z0pZ8TXC9qYDAv4ztl/lJ7AWX7MVShbWGXrpAabHb
	6ClmhVS+oJBFJavLn8Mg9cNpO2Qf0O8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 3/3] stubdom/grub: swap start_info usage with start_info_ptr
Date: Thu, 26 Jun 2025 17:13:44 +0200
Message-ID: <20250626151344.6971-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626151344.6971-1-jgross@suse.com>
References: <20250626151344.6971-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4B1B721160
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01
X-Spam-Level: 

Now that Mini-OS is exporting start_info_ptr, use that instead of the
tedious start_info macro.

Note that the Mini-OS macro still needs to be undefined, but now it can
be done right at the top of kexec.c.

Undo the previous move of the "other" start_info into a dedicated
function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 stubdom/grub/kexec.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index b423e856a4..92646ad8cd 100644
--- a/stubdom/grub/kexec.c
+++ b/stubdom/grub/kexec.c
@@ -34,6 +34,8 @@
 
 #include "mini-os.h"
 
+#undef start_info
+
 #if 0
 #define DEBUG(fmt, ...) printk(fmt, ## __VA_ARGS__)
 #else
@@ -86,10 +88,10 @@ static void do_exchange(struct xc_dom_image *dom, xen_pfn_t target_pfn, xen_pfn_
     xen_pfn_t source_pfn;
     xen_pfn_t target_mfn;
 
-    for (source_pfn = 0; source_pfn < start_info.nr_pages; source_pfn++)
+    for (source_pfn = 0; source_pfn < start_info_ptr->nr_pages; source_pfn++)
         if (dom->pv_p2m[source_pfn] == source_mfn)
             break;
-    ASSERT(source_pfn < start_info.nr_pages);
+    ASSERT(source_pfn < start_info_ptr->nr_pages);
 
     target_mfn = dom->pv_p2m[target_pfn];
 
@@ -209,8 +211,6 @@ static void tpm_hash2pcr(struct xc_dom_image *dom, char *cmdline)
 	shutdown_tpmfront(tpm);
 }
 
-static void call_start_info_hook(struct xc_dom_image *dom);
-
 void kexec(void *kernel, long kernel_size, void *module, long module_size, char *cmdline, unsigned long flags)
 {
     struct xc_dom_image *dom;
@@ -242,8 +242,8 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     xc_dom_module_mem(dom, module, module_size, NULL);
 
     dom->flags = flags;
-    dom->console_evtchn = start_info.console.domU.evtchn;
-    dom->xenstore_evtchn = start_info.store_evtchn;
+    dom->console_evtchn = start_info_ptr->console.domU.evtchn;
+    dom->xenstore_evtchn = start_info_ptr->store_evtchn;
 
     tpm_hash2pcr(dom, cmdline);
 
@@ -279,7 +279,7 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
         errnum = ERR_EXEC_FORMAT;
         goto out;
     }
-    dom->total_pages = start_info.nr_pages;
+    dom->total_pages = start_info_ptr->nr_pages;
 
     /* equivalent of arch_setup_meminit */
     dom->p2m_size = dom->total_pages;
@@ -306,7 +306,7 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     }
 
     /* Equivalent of xc_dom_boot_image */
-    dom->shared_info_mfn = PHYS_PFN(start_info.shared_info);
+    dom->shared_info_mfn = PHYS_PFN(start_info_ptr->shared_info);
 
     if (!xc_dom_compat_check(dom)) {
         printk("xc_dom_compat_check failed\n");
@@ -315,8 +315,8 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     }
 
     /* Move current console, xenstore and boot MFNs to the allocated place */
-    do_exchange(dom, dom->console_pfn, start_info.console.domU.mfn);
-    do_exchange(dom, dom->xenstore_pfn, start_info.store_mfn);
+    do_exchange(dom, dom->console_pfn, start_info_ptr->console.domU.mfn);
+    do_exchange(dom, dom->xenstore_pfn, start_info_ptr->store_mfn);
     DEBUG("virt base at %llx\n", virt_base);
     DEBUG("bootstack_pfn %lx\n", dom->bootstack_pfn);
     _boot_target = virt_base + PFN_PHYS(dom->bootstack_pfn);
@@ -332,7 +332,8 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
         }
 
     /* start info page */
-    call_start_info_hook(dom);
+    if ( dom->arch_hooks->start_info )
+        dom->arch_hooks->start_info(dom);
 
     xc_dom_log_memory_footprint(dom);
 
@@ -371,7 +372,7 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     DEBUG("boot page mfn %lx\n", boot_page_mfn);
     _boot_page_entry = PFN_PHYS(boot_page_mfn) | L1_PROT;
     DEBUG("boot page entry %llx\n", _boot_page_entry);
-    _boot_oldpdmfn = virt_to_mfn(start_info.pt_base);
+    _boot_oldpdmfn = virt_to_mfn(start_info_ptr->pt_base);
     DEBUG("boot old pd mfn %lx\n", _boot_oldpdmfn);
     DEBUG("boot pd virt %lx\n", dom->pgtables_seg.vstart);
     _boot_pdmfn = dom->pv_p2m[PHYS_PFN(dom->pgtables_seg.vstart - virt_base)];
@@ -384,12 +385,12 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
     DEBUG("boot start %lx\n", _boot_start);
 
     /* Keep only useful entries */
-    for (nr_m2p_updates = pfn = 0; pfn < start_info.nr_pages; pfn++)
+    for (nr_m2p_updates = pfn = 0; pfn < start_info_ptr->nr_pages; pfn++)
         if (dom->pv_p2m[pfn] != pfn_to_mfn(pfn))
             nr_m2p_updates++;
 
     m2p_updates = malloc(sizeof(*m2p_updates) * nr_m2p_updates);
-    for (i = pfn = 0; pfn < start_info.nr_pages; pfn++)
+    for (i = pfn = 0; pfn < start_info_ptr->nr_pages; pfn++)
         if (dom->pv_p2m[pfn] != pfn_to_mfn(pfn)) {
             m2p_updates[i].ptr = PFN_PHYS(dom->pv_p2m[pfn]) | MMU_MACHPHYS_UPDATE;
             m2p_updates[i].val = pfn;
@@ -431,11 +432,3 @@ out:
     allocated = 0;
     xc_interface_close(xc_handle );
 }
-
-/* No references to start_info of Mini-OS after this function. */
-static void call_start_info_hook(struct xc_dom_image *dom)
-{
-#undef start_info
-    if ( dom->arch_hooks->start_info )
-        dom->arch_hooks->start_info(dom);
-}
-- 
2.43.0


