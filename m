Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FABAFC2DF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 08:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035973.1408446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1xo-0003bS-0r; Tue, 08 Jul 2025 06:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035973.1408446; Tue, 08 Jul 2025 06:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1xn-0003YB-Te; Tue, 08 Jul 2025 06:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1035973;
 Tue, 08 Jul 2025 06:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uZ1xm-0003U3-0w
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 06:37:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1236dfdc-5bc6-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 08:37:51 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B81021167;
 Tue,  8 Jul 2025 06:37:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52BED13A68;
 Tue,  8 Jul 2025 06:37:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /ITUEr+8bGhPNAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 08 Jul 2025 06:37:51 +0000
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
X-Inumbo-ID: 1236dfdc-5bc6-11f0-b894-0df219b8e170
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 2/2] x86: don't use a memory page for mapping the shared info page
Date: Tue,  8 Jul 2025 08:37:38 +0200
Message-ID: <20250708063738.18994-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708063738.18994-1-jgross@suse.com>
References: <20250708063738.18994-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7B81021167
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00

There is no need to use a populated memory page for mapping the shared
info page at that location. Just use an allocated virtual address for
the shared info page. For PVH allocate an unused pfn.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c     |  7 -------
 arch/x86/setup.c  | 15 ++++++++-------
 arch/x86/x86_32.S |  7 +------
 arch/x86/x86_64.S |  7 +------
 hypervisor.c      | 15 +++++++++++----
 5 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 3f5c7ea7..78d614a6 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -497,7 +497,6 @@ static void build_pagetable(unsigned long *start_pfn, unsigned long *max_pfn)
 /*
  * Mark portion of the address space read only.
  */
-extern struct shared_info shared_info;
 
 struct change_readonly_par {
     unsigned long etext;
@@ -519,12 +518,6 @@ static int change_readonly_func(unsigned long va, unsigned int lvl,
     if ( va + (1UL << ptdata[lvl].shift) > ro->etext )
         return 1;
 
-    if ( va == (unsigned long)&shared_info )
-    {
-        printk("skipped %lx\n", va);
-        return 0;
-    }
-
     newval = ro->readonly ? (*pte & ~_PAGE_RW) : (*pte | _PAGE_RW);
 
 #ifdef CONFIG_PARAVIRT
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 299ff8c7..8fd55c51 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -47,8 +47,6 @@ shared_info_t *HYPERVISOR_shared_info;
  */
 char stack[2*STACK_SIZE];
 
-extern char shared_info[PAGE_SIZE];
-
 static inline void fpu_init(void) {
 	asm volatile("fninit");
 }
@@ -76,18 +74,21 @@ static void set_info_ptr(start_info_t *ptr)
 
 #define hpc_init()
 
+static unsigned long shared_info_va;
+
 shared_info_t *map_shared_info(void)
 {
     int rc;
-    unsigned long pa = start_info_ptr->shared_info;
 
-    if ( (rc = HYPERVISOR_update_va_mapping((unsigned long)shared_info,
-                                            __pte(pa | 7), UVMF_INVLPG)) )
+    if ( !shared_info_va )
+        shared_info_va = alloc_virt_kernel(1);
+    rc = map_frame_rw(shared_info_va, PHYS_PFN(start_info_ptr->shared_info));
+    if ( rc )
     {
         printk("Failed to map shared_info!! rc=%d\n", rc);
         do_exit();
     }
-    return (shared_info_t *)shared_info;
+    return (shared_info_t *)shared_info_va;
 }
 
 void unmap_shared_info(void)
@@ -95,7 +96,7 @@ void unmap_shared_info(void)
     int rc;
     pte_t nullpte = { };
 
-    if ( (rc = HYPERVISOR_update_va_mapping((unsigned long)shared_info,
+    if ( (rc = HYPERVISOR_update_va_mapping(shared_info_va,
                                             nullpte, UVMF_INVLPG)) )
     {
         printk("Failed to unmap shared_info page!! rc=%d\n", rc);
diff --git a/arch/x86/x86_32.S b/arch/x86/x86_32.S
index 3de00277..5d891164 100644
--- a/arch/x86/x86_32.S
+++ b/arch/x86/x86_32.S
@@ -36,13 +36,8 @@ _start:
 stack_start:
 	.long stack+(2*__STACK_SIZE), __KERNEL_SS
 
-.globl shared_info, hypercall_page
-        /* Unpleasant -- the PTE that maps this page is actually overwritten */
-        /* to map the real shared-info page! :-)                             */
         .align __PAGE_SIZE
-shared_info:
-        .fill __PAGE_SIZE,1,0
-
+.globl hypercall_page
 hypercall_page:
         .fill __PAGE_SIZE,1,0
 
diff --git a/arch/x86/x86_64.S b/arch/x86/x86_64.S
index 7529c02e..09b93e39 100644
--- a/arch/x86/x86_64.S
+++ b/arch/x86/x86_64.S
@@ -33,13 +33,8 @@ _start:
 stack_start:
         .quad stack+(2*__STACK_SIZE)
 
-.globl shared_info, hypercall_page
-        /* Unpleasant -- the PTE that maps this page is actually overwritten */
-        /* to map the real shared-info page! :-)                             */
         .align __PAGE_SIZE
-shared_info:
-        .fill __PAGE_SIZE,1,0
-
+.globl hypercall_page
 hypercall_page:
         .fill __PAGE_SIZE,1,0
 
diff --git a/hypervisor.c b/hypervisor.c
index 6476d658..519a4680 100644
--- a/hypervisor.c
+++ b/hypervisor.c
@@ -27,8 +27,10 @@
 
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
+#include <mini-os/e820.h>
 #include <mini-os/hypervisor.h>
 #include <mini-os/events.h>
+#include <mini-os/mm.h>
 #include <xen/memory.h>
 
 EXPORT_SYMBOL(hypercall_page);
@@ -37,7 +39,8 @@ EXPORT_SYMBOL(hypercall_page);
     ((sh)->evtchn_pending[idx] & ~(sh)->evtchn_mask[idx])
 
 #ifndef CONFIG_PARAVIRT
-extern shared_info_t shared_info;
+static unsigned long shinfo_pfn;
+static unsigned long shinfo_va;
 
 int hvm_get_parameter(int idx, uint64_t *value)
 {
@@ -69,14 +72,16 @@ shared_info_t *map_shared_info(void)
 {
     struct xen_add_to_physmap xatp;
 
+    shinfo_pfn = e820_get_reserved_pfns(1);
     xatp.domid = DOMID_SELF;
     xatp.idx = 0;
     xatp.space = XENMAPSPACE_shared_info;
-    xatp.gpfn = virt_to_pfn(&shared_info);
+    xatp.gpfn = shinfo_pfn;
     if ( HYPERVISOR_memory_op(XENMEM_add_to_physmap, &xatp) != 0 )
         BUG();
+    shinfo_va = map_frame_virt(shinfo_pfn);
 
-    return &shared_info;
+    return (shared_info_t *)shinfo_va;
 }
 
 void unmap_shared_info(void)
@@ -84,9 +89,11 @@ void unmap_shared_info(void)
     struct xen_remove_from_physmap xrtp;
 
     xrtp.domid = DOMID_SELF;
-    xrtp.gpfn = virt_to_pfn(&shared_info);
+    xrtp.gpfn = shinfo_pfn;
     if ( HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &xrtp) != 0 )
         BUG();
+    unmap_frames(shinfo_va, 1);
+    e820_put_reserved_pfns(shinfo_pfn, 1);
 }
 #endif
 
-- 
2.43.0


