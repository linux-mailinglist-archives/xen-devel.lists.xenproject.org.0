Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E398A6B762
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923508.1327031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi4-0001rT-Pf; Fri, 21 Mar 2025 09:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923508.1327031; Fri, 21 Mar 2025 09:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi4-0001mA-L2; Fri, 21 Mar 2025 09:30:36 +0000
Received: by outflank-mailman (input) for mailman id 923508;
 Fri, 21 Mar 2025 09:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYdL-0005bg-8p
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73ca7320-0636-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:25:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9980E1FB6D;
 Fri, 21 Mar 2025 09:25:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71747139AA;
 Fri, 21 Mar 2025 09:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zVw7GpIw3WdHGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:38 +0000
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
X-Inumbo-ID: 73ca7320-0636-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tll1MlN0K/PdIjHkU/c7azaHqaqB0dNTwcC3GeOaxx4=;
	b=jN/VqmWmxiDz7s9auX1iDheqDw71OvKlPxSIjsEk3qYOnK2cqbNGFEcpve6sIJ38kFLLZo
	ilvnyToRz2LBVsIQplXIAEuZ948/4JCKRkoMYp/2WGJWZWTUBxqForZYUwROq6ZSCKcqxO
	LPlm1TD1hnyDYppdLkkVL/2uLX9W014=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tll1MlN0K/PdIjHkU/c7azaHqaqB0dNTwcC3GeOaxx4=;
	b=jN/VqmWmxiDz7s9auX1iDheqDw71OvKlPxSIjsEk3qYOnK2cqbNGFEcpve6sIJ38kFLLZo
	ilvnyToRz2LBVsIQplXIAEuZ948/4JCKRkoMYp/2WGJWZWTUBxqForZYUwROq6ZSCKcqxO
	LPlm1TD1hnyDYppdLkkVL/2uLX9W014=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 08/12] kexec: move used pages away for new kernel
Date: Fri, 21 Mar 2025 10:24:47 +0100
Message-ID: <20250321092451.17309-9-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Copying the new kexec kernel must not overwrite any pages still needed
during this process. Those are especially the GDT, IDT and page tables.

Move those to new allocated pages and update any related pointers.

In case the kexec process is cancelled later, don't undo any page table
moves, as the system can just be used with the new layout. By freeing
the original pages there is no memory leaking.

GDT and IDT should be reverted to their original locations, as their
original memory can't be freed due to not being whole pages.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c   | 126 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/kexec.h |   5 ++
 kexec.c         |   6 +++
 3 files changed, 137 insertions(+)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 3ba6d917..a71eb192 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -42,6 +42,7 @@
 #include <mini-os/paravirt.h>
 #include <mini-os/types.h>
 #include <mini-os/lib.h>
+#include <mini-os/kexec.h>
 #include <mini-os/xmalloc.h>
 #include <mini-os/e820.h>
 #include <xen/memory.h>
@@ -923,3 +924,128 @@ unsigned long map_frame_virt(unsigned long mfn)
     return addr;
 }
 EXPORT_SYMBOL(map_frame_virt);
+
+#ifdef CONFIG_KEXEC
+static unsigned long kexec_gdt;
+static unsigned long kexec_idt;
+
+static int move_pt(unsigned long va, unsigned int lvl, bool is_leaf,
+                   pgentry_t *pte, void *par)
+{
+    unsigned long boundary_pfn = *(unsigned long *)par;
+    unsigned long pfn;
+    void *old_pg, *new_pg;
+
+    if ( is_leaf )
+        return 0;
+
+    pfn = (lvl == PAGETABLE_LEVELS + 1) ? PHYS_PFN(*(unsigned long *)pte)
+                                        : pte_to_mfn(*pte);
+    if ( pfn >= boundary_pfn )
+        return 0;
+
+    new_pg = (void *)alloc_page();
+    if ( !new_pg )
+        return ENOMEM;
+    old_pg = pfn_to_virt(pfn);
+    memcpy(new_pg, old_pg, PAGE_SIZE);
+    if ( lvl == PAGETABLE_LEVELS + 1 )
+        *(pgentry_t **)pte = new_pg;
+    else
+        *pte = ((unsigned long)new_pg & PAGE_MASK) | ptdata[lvl].prot;
+
+    tlb_flush();
+
+    free_page(old_pg);
+
+    return 0;
+}
+
+static int move_leaf(unsigned long va, unsigned int lvl, bool is_leaf,
+                     pgentry_t *pte, void *par)
+{
+    unsigned long boundary_pfn = *(unsigned long *)par;
+    unsigned long pfn;
+    void *old_pg, *new_pg;
+
+    if ( !is_leaf )
+        return 0;
+
+    /* No large page support, all pages must be valid. */
+    if ( (*pte & _PAGE_PSE) || !(*pte & _PAGE_PRESENT) )
+        return EINVAL;
+
+    pfn = pte_to_mfn(*pte);
+    if ( pfn >= boundary_pfn )
+        return 0;
+
+    new_pg = (void *)alloc_page();
+    if ( !new_pg )
+        return ENOMEM;
+    old_pg = pfn_to_virt(pfn);
+    memcpy(new_pg, old_pg, PAGE_SIZE);
+    *pte = ((unsigned long)new_pg & PAGE_MASK) | ptdata[lvl].prot;
+
+    invlpg(va);
+
+    free_page(old_pg);
+
+    return 0;
+}
+
+int kexec_move_used_pages(unsigned long boundary, unsigned long kernel,
+                          unsigned long kernel_size)
+{
+    int ret;
+    unsigned long boundary_pfn = PHYS_PFN(boundary);
+
+    kexec_gdt = alloc_page();
+    if ( !kexec_gdt )
+        return ENOMEM;
+    memcpy((char *)kexec_gdt, &gdt, sizeof(gdt));
+    gdt_ptr.base = kexec_gdt;
+    asm volatile("lgdt %0" : : "m" (gdt_ptr));
+
+    kexec_idt = alloc_page();
+    if ( !kexec_idt )
+        return ENOMEM;
+    memcpy((char *)kexec_idt, &idt, sizeof(idt));
+    idt_ptr.base = kexec_idt;
+    asm volatile("lidt %0" : : "m" (idt_ptr));
+
+    /* Top level page table needs special handling. */
+    ret = move_pt(0, PAGETABLE_LEVELS + 1, false, (pgentry_t *)(&pt_base),
+                  &boundary_pfn);
+    if ( ret )
+        return ret;
+    ret = walk_pt(0, ~0UL, move_pt, &boundary_pfn);
+    if ( ret )
+        return ret;
+
+    /* Move new kernel image pages. */
+    ret = walk_pt(kernel, kernel + kernel_size - 1, move_leaf, &boundary_pfn);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+
+void kexec_move_used_pages_undo(void)
+{
+    if ( kexec_gdt )
+    {
+        gdt_ptr.base = (unsigned long)&gdt;
+        asm volatile("lgdt %0" : : "m" (gdt_ptr));
+        free_page((void *)kexec_gdt);
+        kexec_gdt = 0;
+    }
+
+    if ( kexec_idt )
+    {
+        idt_ptr.base = (unsigned long)&idt;
+        asm volatile("lidt %0" : : "m" (idt_ptr));
+        free_page((void *)kexec_idt);
+        kexec_idt = 0;
+    }
+}
+#endif
diff --git a/include/kexec.h b/include/kexec.h
index 7b103dea..411fa013 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -49,4 +49,9 @@ void kexec_set_param_loc(const char *cmdline);
 int kexec_get_entry(const char *cmdline);
 void kexec_get_entry_undo(void);
 
+/* Move used pages away from new kernel area. */
+int kexec_move_used_pages(unsigned long boundary, unsigned long kernel,
+                          unsigned long kernel_size);
+void kexec_move_used_pages_undo(void);
+
 #endif /* _KEXEC_H */
diff --git a/kexec.c b/kexec.c
index 0ef8eb35..16a0030a 100644
--- a/kexec.c
+++ b/kexec.c
@@ -184,11 +184,17 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
         goto err;
     }
 
+    ret = kexec_move_used_pages(kexec_last_addr, (unsigned long)kernel,
+                                kernel_size);
+    if ( ret )
+        goto err;
+
     /* Error exit. */
     ret = ENOSYS;
 
  err:
     unreserve_memory_below();
+    kexec_move_used_pages_undo();
     kexec_get_entry_undo();
 
     return ret;
-- 
2.43.0


