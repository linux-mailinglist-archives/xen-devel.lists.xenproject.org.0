Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32106942F85
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768595.1179476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8wc-00046d-Vw; Wed, 31 Jul 2024 13:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768595.1179476; Wed, 31 Jul 2024 13:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8wc-00044M-Rv; Wed, 31 Jul 2024 13:00:42 +0000
Received: by outflank-mailman (input) for mailman id 768595;
 Wed, 31 Jul 2024 13:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q60C=O7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZ8wb-0003KO-4j
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:00:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e35a8783-4f3c-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:00:40 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16A1921B61;
 Wed, 31 Jul 2024 13:00:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA8ED13297;
 Wed, 31 Jul 2024 13:00:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MN3LM3c1qmb5WAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jul 2024 13:00:39 +0000
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
X-Inumbo-ID: e35a8783-4f3c-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722430840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YykKbfS2IJgdkLFFy5acGGcdbHS6FrMXXxAPIolzhxo=;
	b=kda6Ht6lVqFoJ4aXkKYbYjrHIHDfJufboK/HmgvGZMikS/y3QTjMtOYt8GD/q2mJ5gCKPz
	Vfqy3lygv1CAqPI7Xx+n3rSw3Bssy4VJHhEmy3zqfxbvMFFRp8G917U5bk+EYMmtwsViCH
	4YQo/5C/eXy43bpjCoOTnyBarwyQ3NM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722430840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YykKbfS2IJgdkLFFy5acGGcdbHS6FrMXXxAPIolzhxo=;
	b=kda6Ht6lVqFoJ4aXkKYbYjrHIHDfJufboK/HmgvGZMikS/y3QTjMtOYt8GD/q2mJ5gCKPz
	Vfqy3lygv1CAqPI7Xx+n3rSw3Bssy4VJHhEmy3zqfxbvMFFRp8G917U5bk+EYMmtwsViCH
	4YQo/5C/eXy43bpjCoOTnyBarwyQ3NM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
Date: Wed, 31 Jul 2024 15:00:25 +0200
Message-ID: <20240731130026.8467-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731130026.8467-1-jgross@suse.com>
References: <20240731130026.8467-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.60

Instead of open coding a page table walk, use walk_pt() in need_pgt().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c | 66 +++++++++++++++++++--------------------------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index cc4d41e9..accde291 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -518,57 +518,39 @@ static pgentry_t *get_pgt(unsigned long va)
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
+    idx = (va >> ptdata[lvl].shift) & (ptdata[lvl].entries - 1);
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


