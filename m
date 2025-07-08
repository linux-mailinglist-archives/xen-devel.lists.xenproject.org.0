Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59705AFC2DC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 08:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035971.1408431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1xc-0003AS-ML; Tue, 08 Jul 2025 06:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035971.1408431; Tue, 08 Jul 2025 06:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1xc-00037h-JZ; Tue, 08 Jul 2025 06:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1035971;
 Tue, 08 Jul 2025 06:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uZ1xb-0002pb-S0
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 06:37:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f335bb9-5bc6-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 08:37:46 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E83BF1F393;
 Tue,  8 Jul 2025 06:37:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE0FC13A68;
 Tue,  8 Jul 2025 06:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h6/+LLm8bGhGNAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Jul 2025 06:37:45 +0000
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
X-Inumbo-ID: 0f335bb9-5bc6-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751956665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XaZCtOmxWZ4bchm6r7N9WhOaU6PIDyHDuampVATjIrE=;
	b=oFFrplB2fUkdVy4vsi4s+FPh2TnplrEOFA2H7Xm22aXDq3IXING/fmexWuQnJw0ujRfqbe
	x/I9nHofkS6McLMoey0hueleuGXaLrZaGDZxO46N38tAE/FgJmJZm+9yZdqeoikQ7PLcE4
	5ENvIvR5bi80Rp+rOUXUkiwTVV+25eg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751956665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XaZCtOmxWZ4bchm6r7N9WhOaU6PIDyHDuampVATjIrE=;
	b=oFFrplB2fUkdVy4vsi4s+FPh2TnplrEOFA2H7Xm22aXDq3IXING/fmexWuQnJw0ujRfqbe
	x/I9nHofkS6McLMoey0hueleuGXaLrZaGDZxO46N38tAE/FgJmJZm+9yZdqeoikQ7PLcE4
	5ENvIvR5bi80Rp+rOUXUkiwTVV+25eg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 1/2] mm: provide a way to do very early page table allocations
Date: Tue,  8 Jul 2025 08:37:37 +0200
Message-ID: <20250708063738.18994-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708063738.18994-1-jgross@suse.com>
References: <20250708063738.18994-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80

Add a small pool of statically allocated memory pages to be handed out
for very early page table allocations.

This will make it possible to do virtual allocations e.g. for mapping
the shared info page.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index bdff38fd..3f5c7ea7 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -640,12 +640,17 @@ void change_readonly(bool readonly)
  * return a valid PTE for a given virtual address. If PTE does not exist,
  * allocate page-table pages.
  */
+#define N_PTS 4
+static char early_pt[PAGE_SIZE * N_PTS] __attribute__((aligned(PAGE_SIZE)));
+static unsigned long n_early_pt = N_PTS;
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
@@ -664,7 +669,16 @@ static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
     }
 
     pt_mfn = virt_to_mfn(pte);
-    pt_pfn = virt_to_pfn(alloc_page());
+    if ( n_early_pt )
+    {
+        n_early_pt--;
+        pt_addr = (unsigned long)&early_pt[n_early_pt * PAGE_SIZE];
+    }
+    else
+    {
+        pt_addr = alloc_page();
+    }
+    pt_pfn = virt_to_pfn(pt_addr);
     if ( !pt_pfn )
         return -1;
     idx = idx_from_va_lvl(va, lvl);
-- 
2.43.0


