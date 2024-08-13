Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326319506D6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 15:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776270.1186427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrn1-0005eD-4G; Tue, 13 Aug 2024 13:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776270.1186427; Tue, 13 Aug 2024 13:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrn0-0005cK-V8; Tue, 13 Aug 2024 13:42:18 +0000
Received: by outflank-mailman (input) for mailman id 776270;
 Tue, 13 Aug 2024 13:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k7wN=PM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sdrmy-0005YO-Uj
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 13:42:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d813d5c8-5979-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 15:42:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E7B0203B9;
 Tue, 13 Aug 2024 13:42:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D699513ABD;
 Tue, 13 Aug 2024 13:42:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E+DcMrNiu2bUGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 13 Aug 2024 13:42:11 +0000
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
X-Inumbo-ID: d813d5c8-5979-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723556532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSPiqOW7akL0nRnyX8VpLZ5Z1GRvi01pTr8QTeeTzVI=;
	b=IMcdZoJ2H/dtByOc/sPV/fLdIor8zw/ZlNS0Drsh1zShfE85oWIC3Ase3eGraVcMxTpNu1
	5JW0P2J1KSzJJ2l9GI1qLTz/Y5ihm9o//Lgyk2AztbZJYdXqDpOUuaRMtOgCUe/tKpCV//
	zQP2bWdRQ1v8YA6VmVMO4/CDJv2gDD0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IMcdZoJ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723556532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSPiqOW7akL0nRnyX8VpLZ5Z1GRvi01pTr8QTeeTzVI=;
	b=IMcdZoJ2H/dtByOc/sPV/fLdIor8zw/ZlNS0Drsh1zShfE85oWIC3Ase3eGraVcMxTpNu1
	5JW0P2J1KSzJJ2l9GI1qLTz/Y5ihm9o//Lgyk2AztbZJYdXqDpOUuaRMtOgCUe/tKpCV//
	zQP2bWdRQ1v8YA6VmVMO4/CDJv2gDD0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
Date: Tue, 13 Aug 2024 15:41:57 +0200
Message-ID: <20240813134158.580-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813134158.580-1-jgross@suse.com>
References: <20240813134158.580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 0E7B0203B9
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO

Instead of open coding a page table walk, use walk_pt() in need_pgt().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add comment and ASSERT() (Samuel Thibault)
---
 arch/x86/mm.c | 72 +++++++++++++++++++++------------------------------
 1 file changed, 30 insertions(+), 42 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 9849b985..84a6d7f0 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -523,57 +523,45 @@ static pgentry_t *get_pgt(unsigned long va)
  * return a valid PTE for a given virtual address. If PTE does not exist,
  * allocate page-table pages.
  */
-pgentry_t *need_pgt(unsigned long va)
+static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
+                         pgentry_t *pte, void *par)
 {
+    pgentry_t **result = par;
     unsigned long pt_mfn;
-    pgentry_t *tab;
     unsigned long pt_pfn;
-    unsigned offset;
+    unsigned int idx;
 
-    tab = pt_base;
-    pt_mfn = virt_to_mfn(pt_base);
+    if ( !is_leaf )
+        return 0;
 
-#if defined(__x86_64__)
-    offset = l4_table_offset(va);
-    if ( !(tab[offset] & _PAGE_PRESENT) )
-    {
-        pt_pfn = virt_to_pfn(alloc_page());
-        if ( !pt_pfn )
-            return NULL;
-        new_pt_frame(&pt_pfn, pt_mfn, offset, L3_FRAME);
-    }
-    ASSERT(tab[offset] & _PAGE_PRESENT);
-    pt_mfn = pte_to_mfn(tab[offset]);
-    tab = mfn_to_virt(pt_mfn);
-#endif
-    offset = l3_table_offset(va);
-    if ( !(tab[offset] & _PAGE_PRESENT) ) 
-    {
-        pt_pfn = virt_to_pfn(alloc_page());
-        if ( !pt_pfn )
-            return NULL;
-        new_pt_frame(&pt_pfn, pt_mfn, offset, L2_FRAME);
-    }
-    ASSERT(tab[offset] & _PAGE_PRESENT);
-    pt_mfn = pte_to_mfn(tab[offset]);
-    tab = mfn_to_virt(pt_mfn);
-    offset = l2_table_offset(va);
-    if ( !(tab[offset] & _PAGE_PRESENT) )
+    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
     {
-        pt_pfn = virt_to_pfn(alloc_page());
-        if ( !pt_pfn )
-            return NULL;
-        new_pt_frame(&pt_pfn, pt_mfn, offset, L1_FRAME);
+        /*
+         * The PTE is not addressing a page table (is_leaf is true). If we are
+         * either at the lowest level or we have a valid large page, we don't
+         * need to allocate a page table.
+         */
+        ASSERT(lvl == L1_FRAME || (*pte & _PAGE_PSE));
+        *result = pte;
+        return 1;
     }
-    ASSERT(tab[offset] & _PAGE_PRESENT);
-    if ( tab[offset] & _PAGE_PSE )
-        return &tab[offset];
 
-    pt_mfn = pte_to_mfn(tab[offset]);
-    tab = mfn_to_virt(pt_mfn);
+    pt_mfn = virt_to_mfn(pte);
+    pt_pfn = virt_to_pfn(alloc_page());
+    if ( !pt_pfn )
+        return -1;
+    idx = idx_from_va_lvl(va, lvl);
+    new_pt_frame(&pt_pfn, pt_mfn, idx, lvl - 1);
 
-    offset = l1_table_offset(va);
-    return &tab[offset];
+    return 0;
+}
+
+pgentry_t *need_pgt(unsigned long va)
+{
+    pgentry_t *tab = NULL;
+
+    walk_pt(va, va, need_pgt_func, &tab);
+    return tab;
 }
 EXPORT_SYMBOL(need_pgt);
 
-- 
2.43.0


