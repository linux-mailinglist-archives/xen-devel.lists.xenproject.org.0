Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028C69506D9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 15:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776271.1186438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrn2-0005vn-GB; Tue, 13 Aug 2024 13:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776271.1186438; Tue, 13 Aug 2024 13:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdrn2-0005sB-C4; Tue, 13 Aug 2024 13:42:20 +0000
Received: by outflank-mailman (input) for mailman id 776271;
 Tue, 13 Aug 2024 13:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k7wN=PM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sdrn0-0004yQ-Sh
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 13:42:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db783807-5979-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 15:42:18 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DF50227F2;
 Tue, 13 Aug 2024 13:42:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71D5113ABD;
 Tue, 13 Aug 2024 13:42:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4odAGrliu2bcGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 13 Aug 2024 13:42:17 +0000
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
X-Inumbo-ID: db783807-5979-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723556537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNUXKUrwLG6oWojlY/a5gaayfmUKTp/EVDucqgND6/g=;
	b=RCaHpQhbdwAQB+BWDqRXK5sPErDQgbeCf5c9+8uhLu+szl9StsyrD0m9ajm7gIpZr4ROGY
	Wt5t7qSdSgjkXjvGUO+AYjB8owPF6rSQJNUslMpuXaF9J36IxYYKWeJ33bHf/faLMjehUf
	PMHfwQw/r2L28gTvaMft0OSfI3tfRM0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RCaHpQhb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723556537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNUXKUrwLG6oWojlY/a5gaayfmUKTp/EVDucqgND6/g=;
	b=RCaHpQhbdwAQB+BWDqRXK5sPErDQgbeCf5c9+8uhLu+szl9StsyrD0m9ajm7gIpZr4ROGY
	Wt5t7qSdSgjkXjvGUO+AYjB8owPF6rSQJNUslMpuXaF9J36IxYYKWeJ33bHf/faLMjehUf
	PMHfwQw/r2L28gTvaMft0OSfI3tfRM0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/3] mini-os: mm: convert set_readonly() to use walk_pt()
Date: Tue, 13 Aug 2024 15:41:58 +0200
Message-ID: <20240813134158.580-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813134158.580-1-jgross@suse.com>
References: <20240813134158.580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DF50227F2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 

Instead of having another copy of a page table walk in set_readonly(),
just use walk_pt().

As it will be needed later anyway, split out the TLB flushing into a
dedicated function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- clear count after doing an mmu_update call (Samuel Thibault)
- do final mmu_update call from set_readonly() if needed (Samuel Thibault)
---
 arch/x86/mm.c | 124 +++++++++++++++++++++++---------------------------
 1 file changed, 56 insertions(+), 68 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 84a6d7f0..85827d93 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -402,92 +402,80 @@ static void build_pagetable(unsigned long *start_pfn, unsigned long *max_pfn)
  * Mark portion of the address space read only.
  */
 extern struct shared_info shared_info;
-static void set_readonly(void *text, void *etext)
-{
-    unsigned long start_address =
-        ((unsigned long) text + PAGE_SIZE - 1) & PAGE_MASK;
-    unsigned long end_address = (unsigned long) etext;
-    pgentry_t *tab = pt_base, page;
-    unsigned long mfn = pfn_to_mfn(virt_to_pfn(pt_base));
-    unsigned long offset;
-    unsigned long page_size = PAGE_SIZE;
+
+struct set_readonly_par {
+    unsigned long etext;
 #ifdef CONFIG_PARAVIRT
-    int count = 0;
-    int rc;
+    unsigned int count;
 #endif
+};
 
-    printk("setting %p-%p readonly\n", text, etext);
+static int set_readonly_func(unsigned long va, unsigned int lvl, bool is_leaf,
+                             pgentry_t *pte, void *par)
+{
+    struct set_readonly_par *ro = par;
 
-    while ( start_address + page_size <= end_address )
-    {
-        tab = pt_base;
-        mfn = pfn_to_mfn(virt_to_pfn(pt_base));
+    if ( !is_leaf )
+        return 0;
 
-#if defined(__x86_64__)
-        offset = l4_table_offset(start_address);
-        page = tab[offset];
-        mfn = pte_to_mfn(page);
-        tab = to_virt(mfn_to_pfn(mfn) << PAGE_SHIFT);
-#endif
-        offset = l3_table_offset(start_address);
-        page = tab[offset];
-        mfn = pte_to_mfn(page);
-        tab = to_virt(mfn_to_pfn(mfn) << PAGE_SHIFT);
-        offset = l2_table_offset(start_address);        
-        if ( !(tab[offset] & _PAGE_PSE) )
-        {
-            page = tab[offset];
-            mfn = pte_to_mfn(page);
-            tab = to_virt(mfn_to_pfn(mfn) << PAGE_SHIFT);
+    if ( va + (1UL << ptdata[lvl].shift) > ro->etext )
+        return 1;
 
-            offset = l1_table_offset(start_address);
-        }
+    if ( va == (unsigned long)&shared_info )
+    {
+        printk("skipped %lx\n", va);
+        return 0;
+    }
 
-        if ( start_address != (unsigned long)&shared_info )
-        {
 #ifdef CONFIG_PARAVIRT
-            mmu_updates[count].ptr = 
-                ((pgentry_t)mfn << PAGE_SHIFT) + sizeof(pgentry_t) * offset;
-            mmu_updates[count].val = tab[offset] & ~_PAGE_RW;
-            count++;
+    mmu_updates[ro->count].ptr = virt_to_mach(pte);
+    mmu_updates[ro->count].val = *pte & ~_PAGE_RW;
+    ro->count++;
+
+    if ( ro->count == L1_PAGETABLE_ENTRIES )
+    {
+         ro->count = 0;
+         if ( HYPERVISOR_mmu_update(mmu_updates, ro->count, NULL,
+                                    DOMID_SELF) < 0 )
+             BUG();
+    }
 #else
-            tab[offset] &= ~_PAGE_RW;
+    *pte &= ~_PAGE_RW;
 #endif
-        }
-        else
-            printk("skipped %lx\n", start_address);
 
-        start_address += page_size;
+    return 0;
+}
 
 #ifdef CONFIG_PARAVIRT
-        if ( count == L1_PAGETABLE_ENTRIES || 
-             start_address + page_size > end_address )
-        {
-            rc = HYPERVISOR_mmu_update(mmu_updates, count, NULL, DOMID_SELF);
-            if ( rc < 0 )
-            {
-                printk("ERROR: set_readonly(): PTE could not be updated\n");
-                do_exit();
-            }
-            count = 0;
-        }
+static void tlb_flush(void)
+{
+    mmuext_op_t op = { .cmd = MMUEXT_TLB_FLUSH_ALL };
+    int count;
+
+    HYPERVISOR_mmuext_op(&op, 1, &count, DOMID_SELF);
+}
 #else
-        if ( start_address == (1UL << L2_PAGETABLE_SHIFT) )
-            page_size = 1UL << L2_PAGETABLE_SHIFT;
+static void tlb_flush(void)
+{
+    write_cr3((unsigned long)pt_base);
+}
 #endif
-    }
+
+static void set_readonly(void *text, void *etext)
+{
+    struct set_readonly_par setro = { .etext = (unsigned long)etext };
+    unsigned long start_address = PAGE_ALIGN((unsigned long)text);
+
+    printk("setting %p-%p readonly\n", text, etext);
+    walk_pt(start_address, setro.etext, set_readonly_func, &setro);
 
 #ifdef CONFIG_PARAVIRT
-    {
-        mmuext_op_t op = {
-            .cmd = MMUEXT_TLB_FLUSH_ALL,
-        };
-        int count;
-        HYPERVISOR_mmuext_op(&op, 1, &count, DOMID_SELF);
-    }
-#else
-    write_cr3((unsigned long)pt_base);
+    if ( setro.count &&
+         HYPERVISOR_mmu_update(mmu_updates, setro.count, NULL, DOMID_SELF) < 0)
+        BUG();
 #endif
+
+    tlb_flush();
 }
 
 /*
-- 
2.43.0


