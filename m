Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD9B14A3E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062195.1427850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfr8-00016B-EU; Tue, 29 Jul 2025 08:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062195.1427850; Tue, 29 Jul 2025 08:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfr8-00012e-A7; Tue, 29 Jul 2025 08:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1062195;
 Tue, 29 Jul 2025 08:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugfr6-0000jP-PT
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:38:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c9c7187-6c57-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 10:38:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B54E21A28;
 Tue, 29 Jul 2025 08:38:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FAB313A8A;
 Tue, 29 Jul 2025 08:38:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +7dGBo6IiGi3PwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 08:38:38 +0000
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
X-Inumbo-ID: 6c9c7187-6c57-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753778318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLWigXSSvWCPOHny9+80GIZMDELoRcydrTbBzab8nks=;
	b=VJ/nTw/y8gGPwyZVPt78qGyt956qY5elh2dfL0Wk5z8YGPbL8C7qvnsTnBR69MT3qf7YSo
	NWbcLDrh64TsdxG+RJcxDUfsJIsMSP+B2dQplHs9HiwTPTfBjbs5FqsRnJQ9R5sV8slOmq
	lvuCVGwfvwyjqbA/y83/pd4vHLttA9s=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="VJ/nTw/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753778318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLWigXSSvWCPOHny9+80GIZMDELoRcydrTbBzab8nks=;
	b=VJ/nTw/y8gGPwyZVPt78qGyt956qY5elh2dfL0Wk5z8YGPbL8C7qvnsTnBR69MT3qf7YSo
	NWbcLDrh64TsdxG+RJcxDUfsJIsMSP+B2dQplHs9HiwTPTfBjbs5FqsRnJQ9R5sV8slOmq
	lvuCVGwfvwyjqbA/y83/pd4vHLttA9s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 1/2] mm: provide a way to do very early page table allocations
Date: Tue, 29 Jul 2025 10:38:28 +0200
Message-ID: <20250729083829.11038-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729083829.11038-1-jgross@suse.com>
References: <20250729083829.11038-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4B54E21A28
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Add a small pool of statically allocated memory pages to be handed out
for very early page table allocations.

This will make it possible to do virtual allocations e.g. for mapping
the shared info page.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add comment (Jan Beulich)
- drop N_PT in favor of ARRAY_SIZE() (Jan Beulich)
- use 2-dimensional array (Jan Beulich)
---
 arch/x86/mm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index ebc85e0d..fd808884 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -640,13 +640,20 @@ void change_readonly(bool readonly)
 /*
  * return a valid PTE for a given virtual address. If PTE does not exist,
  * allocate page-table pages.
+ * Provide a small pool for allocating some page tables very early. Those are
+ * needed currently for mapping the shared info page, so 2 pages ought to be
+ * enough. Add one spare page anyway.
  */
+static char early_pt[4][PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
+static unsigned int n_early_pt = ARRAY_SIZE(early_pt);
+
 static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
                          pgentry_t *pte, void *par)
 {
     pgentry_t **result = par;
     unsigned long pt_mfn;
     unsigned long pt_pfn;
+    unsigned long pt_addr;
     unsigned int idx;
 
     if ( !is_leaf )
@@ -665,7 +672,11 @@ static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
     }
 
     pt_mfn = virt_to_mfn(pte);
-    pt_pfn = virt_to_pfn(alloc_page());
+    if ( n_early_pt )
+        pt_addr = (unsigned long)early_pt[--n_early_pt];
+    else
+        pt_addr = alloc_page();
+    pt_pfn = virt_to_pfn(pt_addr);
     if ( !pt_pfn )
         return -1;
     idx = idx_from_va_lvl(va, lvl);
-- 
2.43.0


