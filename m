Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2768B05CA2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044267.1414339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfnt-0000MZ-VD; Tue, 15 Jul 2025 13:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044267.1414339; Tue, 15 Jul 2025 13:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfnt-0000JS-S7; Tue, 15 Jul 2025 13:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1044267;
 Tue, 15 Jul 2025 13:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfji-00013q-OR
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db7a5889-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:30:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C49BB1F44F;
 Tue, 15 Jul 2025 13:30:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A80213A68;
 Tue, 15 Jul 2025 13:30:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cEFcJO1XdmhhNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:21 +0000
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
X-Inumbo-ID: db7a5889-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBjjfWuh5HXNSeK9rtf2P0Bn6GxDYqshVshwDQxxP10=;
	b=SELp9Fi10Tbk9XMOnXA92SIxmcPRIOfBbv4HcO8pwQ5nSIo1ynRIK1TbNlLc9gvxKSHmok
	p3AxWHCw/sg6Pkad4Z8ShvyNh/j2WLBtkmti31D32V4J2ytaXUC+bFx219ek0EJNIuS98G
	77Sw0lpIrsq+1lVvgg7tN3boFRv/3Ek=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBjjfWuh5HXNSeK9rtf2P0Bn6GxDYqshVshwDQxxP10=;
	b=SELp9Fi10Tbk9XMOnXA92SIxmcPRIOfBbv4HcO8pwQ5nSIo1ynRIK1TbNlLc9gvxKSHmok
	p3AxWHCw/sg6Pkad4Z8ShvyNh/j2WLBtkmti31D32V4J2ytaXUC+bFx219ek0EJNIuS98G
	77Sw0lpIrsq+1lVvgg7tN3boFRv/3Ek=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 07/14] mini-os: kexec: add support for handing over some memory across kexec
Date: Tue, 15 Jul 2025 15:29:29 +0200
Message-ID: <20250715132936.2798-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[config.mk:url,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Especially for support of Xenstore-stubdom live update some memory must
be handed over to the new kernel without moving it around: as the
9pfs device used for storing and retrieving the state of Xenstore
needs to be kept operational across kexec (it can't be reopened due to
Xenstore not being available without access to the device), the ring
pages need to be accessible via active grants by the backend all the
time.

Add the basic support for that by reserving a pre-defined number of
memory pages at the top of the memory. This memory area will be
handed over to the new kernel via specifying it as a module in
struct hvm_start_info.

The contents of the memory area are described via a generic table of
contents in the last page of the memory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set kexec_mod_start in kexec_check_module()
- remove fallback definition of CONFIG_KEXEC_MODULE_PAGES (Jan Beulich)
- fix mod_ptr->recs_off alignment (Jason Andryuk)
- expand comment at start of kexec.h (Jason Andryuk)
---
 Config.mk             |  2 ++
 arch/x86/kexec.c      | 79 +++++++++++++++++++++++++++++++++++++++++++
 arch/x86/mm.c         | 18 ++++++++++
 arch/x86/setup.c      | 28 +++++++++++++++
 include/kernel.h      |  1 +
 include/kexec.h       | 69 +++++++++++++++++++++++++++++++++++++
 include/x86/arch_mm.h |  1 +
 kexec.c               |  3 ++
 mm.c                  |  6 ++++
 9 files changed, 207 insertions(+)

diff --git a/Config.mk b/Config.mk
index b9675e61..0e4e86d8 100644
--- a/Config.mk
+++ b/Config.mk
@@ -220,6 +220,8 @@ CONFIG-$(lwip) += CONFIG_LWIP
 $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
 $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
 
+CONFIG-val-$(CONFIG_KEXEC) += CONFIG_KEXEC_MODULE_PAGES
+
 $(foreach i,$(CONFIG-val-y),$(eval $(i) ?= 0))
 
 CONFIG-x += CONFIG_LIBXS
diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index b33fbfc1..8c9f8a3c 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -201,10 +201,75 @@ static unsigned long kexec_param_pa;
 static unsigned int kexec_param_size;
 static unsigned long kexec_param_mem;
 
+static struct kexec_module *kexec_check_module(void)
+{
+    unsigned long mod_size;
+    unsigned long mod;
+    struct kexec_module *module_ptr;
+
+    mod = get_module(&mod_size);
+    if ( !mod )
+        return NULL;
+    /* Size must be a multiple of PAGE_SIZE. */
+    if ( mod_size & ~PAGE_MASK )
+        return NULL;
+
+    /* Kexec module description is at start of the last page of the module. */
+    module_ptr = (void *)(mod + mod_size - (unsigned long)PAGE_SIZE);
+
+    /* Check eye catcher. */
+    if ( memcmp(module_ptr->eye_catcher, KEXECMOD_EYECATCHER,
+                sizeof(module_ptr->eye_catcher)) )
+        return NULL;
+    if ( module_ptr->n_pages != (mod_size >> PAGE_SHIFT) - 1 )
+        return NULL;
+
+    kexec_mod_start = mod;
+
+    return module_ptr;
+}
+
+static void get_mod_addr(unsigned long from, unsigned long to)
+{
+    unsigned long size = PFN_PHYS(CONFIG_KEXEC_MODULE_PAGES);
+
+    if ( to - from >= size && to - size > kexec_mod_start )
+        kexec_mod_start = to - size;
+}
+
+#define min(a, b) ((a) < (b) ? (a) : (b))
+void kexec_module(unsigned long start_pfn, unsigned long max_pfn)
+{
+    /* Reuse already existing kexec module. */
+    mod_ptr = kexec_check_module();
+    if ( !mod_ptr && CONFIG_KEXEC_MODULE_PAGES )
+    {
+        max_pfn = min(max_pfn, PHYS_PFN(0xffffffff));
+
+        iterate_memory_range(PFN_PHYS(start_pfn), PFN_PHYS(max_pfn),
+                             get_mod_addr);
+        BUG_ON(!kexec_mod_start);
+
+        mod_ptr = (void *)(kexec_mod_start +
+                           ((CONFIG_KEXEC_MODULE_PAGES - 1) << PAGE_SHIFT));
+        memset(mod_ptr, 0, PAGE_SIZE);
+        memcpy(mod_ptr->eye_catcher, KEXECMOD_EYECATCHER,
+               sizeof(mod_ptr->eye_catcher));
+        mod_ptr->n_pages = CONFIG_KEXEC_MODULE_PAGES - 1;
+        memset(mod_ptr->pg2rec, KEXECMOD_PG_FREE, mod_ptr->n_pages);
+        mod_ptr->recs_off = sizeof(struct kexec_module) +
+                            mod_ptr->n_pages + (mod_ptr->n_pages & 1);
+
+        set_reserved_range(kexec_mod_start, (unsigned long)mod_ptr + PAGE_SIZE);
+    }
+}
+
 void kexec_set_param_loc(const char *cmdline)
 {
     kexec_param_size = sizeof(struct hvm_start_info);
     kexec_param_size += e820_entries * sizeof(struct hvm_memmap_table_entry);
+    if ( mod_ptr )
+        kexec_param_size += sizeof(struct hvm_modlist_entry);
     kexec_param_size += strlen(cmdline) + 1;
 
     kexec_last_addr = (kexec_last_addr + 7) & ~7UL;
@@ -218,6 +283,7 @@ int kexec_get_entry(const char *cmdline)
     void *next;
     struct hvm_start_info *info;
     struct hvm_memmap_table_entry *mmap;
+    struct hvm_modlist_entry *mod;
     unsigned int order;
     unsigned int i;
 
@@ -252,6 +318,19 @@ int kexec_get_entry(const char *cmdline)
     info->memmap_entries = mmap - (struct hvm_memmap_table_entry *)next;
     next = mmap;
 
+    if ( mod_ptr )
+    {
+        mod = next;
+        memset(mod, 0, sizeof(*mod));
+        info->nr_modules = 1;
+        info->modlist_paddr = kexec_param_pa +
+                              (unsigned long)next - kexec_param_mem;
+        mod->paddr = kexec_mod_start;
+        mod->size = PFN_PHYS(mod_ptr->n_pages + 1);
+        mod->cmdline_paddr = 0;
+        next = mod + 1;
+    }
+
     info->cmdline_paddr = kexec_param_pa + (unsigned long)next - kexec_param_mem;
     strcpy(next, cmdline);
 
diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index f60e7d58..ebc85e0d 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -188,6 +188,24 @@ static struct {
     unsigned long size;
 } reserved_range[MAX_RSV_RANGES];
 
+void set_reserved_range(unsigned long start, unsigned long end)
+{
+    unsigned int i;
+
+    for ( i = 0; i < MAX_RSV_RANGES; i++ )
+    {
+        if ( reserved_range[i].size )
+            continue;
+
+        reserved_range[i].start = start;
+        reserved_range[i].size = end - start;
+
+        return;
+    }
+
+    BUG();
+}
+
 void check_memory_range(unsigned long *from, unsigned long *to)
 {
     unsigned int m;
diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 2085ee5c..299ff8c7 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -127,6 +127,13 @@ static void print_start_of_day(void *p)
     printk("    cmd_line: %s\n", cmdline);
     printk("       stack: %p-%p\n", stack, stack + sizeof(stack));
 }
+
+unsigned long get_module(unsigned long *size)
+{
+    *size = start_info_ptr->mod_len;
+
+    return start_info_ptr->mod_start;
+}
 #else
 
 /*
@@ -182,6 +189,27 @@ static void print_start_of_day(void *p)
     printk("       stack: %p-%p\n", stack, stack + sizeof(stack));
     arch_print_memmap();
 }
+
+unsigned long get_module(unsigned long *size)
+{
+    struct hvm_modlist_entry *mod;
+
+    if ( !hvm_start_info_ptr->nr_modules )
+        return 0;
+
+    if ( hvm_start_info_ptr->nr_modules > 1 )
+    {
+        printk("get_module() called with more than 1 module present\n");
+        printk("First module data returned\n");
+    }
+
+    mod = (struct hvm_modlist_entry *)(unsigned long)
+          hvm_start_info_ptr->modlist_paddr;
+
+    *size = mod->size;
+
+    return mod->paddr;
+}
 #endif
 
 /*
diff --git a/include/kernel.h b/include/kernel.h
index 161d7571..e11b04cf 100644
--- a/include/kernel.h
+++ b/include/kernel.h
@@ -10,5 +10,6 @@ void post_suspend(int canceled);
 void do_exit(void) __attribute__((noreturn));
 void arch_do_exit(void);
 void stop_kernel(void);
+unsigned long get_module(unsigned long *size);
 
 #endif /* _KERNEL_H_ */
diff --git a/include/kexec.h b/include/kexec.h
index b89c3000..b38a9f54 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -2,6 +2,72 @@
 #define _KEXEC_H
 #include <mini-os/elf.h>
 
+/*
+ * Kexec module used to hand over memory across kexec().
+ *
+ * This is an ABI which should be modified only in a compatible way.
+ * struct kexec_module is located at the start of the last page of the module.
+ *
+ * The module is usually placed towards the end of memory in order to not
+ * conflict with the load address of the new kernel.  In order to allow for a
+ * resize by the new kernel after kexec(), the admin data described by struct
+ * kexec_module is located at the start of the last page of the module.  This
+ * allows to add additional pages towards lower addresses.
+ *
+ * The kexec module (if configured) is being allocated at boot time in case
+ * no kexec module has been passed to the kernel.  If a kexec module has been
+ * passed to the kernel, it is kept and will be passed on by kexec().
+ *
+ * The module can contain two different kinds of information: records and
+ * pages.
+ *
+ * A component wanting to hand over information to the new kernel needs to
+ * allocate one or more records.  The layout of a record is defined by the
+ * component using it, the layout can be changed only in a compatible way.
+ *
+ * The kexec module can contain records of multiple components.  Each record
+ * type has a unique id which is being used to find the record in the new
+ * kernel instance.
+ *
+ * A record is meant to contain small amounts of information, as all records
+ * need to fit into the last page of the kexec module.  In case more data
+ * needs to be handed over, one or multiple pages can be allocated within the
+ * kexec module.  Module page allocations need to be done with the id of a
+ * previously allocated record, which will usually contain some information
+ * related to the allocated page(s).
+ *
+ * All references within the kexec module are coded as offsets relative to the
+ * start of the last module page.
+ *
+ * All admin data (struct kexec_module, record offset table and records) must
+ * fit into the last page of the module.
+ */
+struct kexec_module {
+    uint8_t eye_catcher[8];
+#define KEXECMOD_EYECATCHER "KexecMem"
+    uint16_t n_pages;       /* Number of allocatable pages in the module.    */
+    uint16_t n_records;     /* Size of record table (max. 255).              */
+#define KEXECMOD_REC_MAX    255
+    uint16_t recs_off;      /* Offset to record table from start of page.    */
+                            /* The record table is an array of               */
+                            /* struct kexec_module_rec.                      */
+    uint8_t pg2rec[];       /* Mapping of module pages to associated module  */
+                            /* record.  Allocated pages are indicated by     */
+                            /* their record number (starting from 0).  Free  */
+                            /* pages have value 255.                         */
+#define KEXECMOD_PG_FREE    255
+};
+
+struct kexec_module_rec {
+    uint16_t offset;        /* Offset to record from start of page.          */
+    uint8_t type;           /* Type of record.                               */
+#define KEXECMOD_REC_NONE   0
+    uint8_t size;           /* Size of record.                               */
+};
+
+extern unsigned long kexec_mod_start;
+extern struct kexec_module *mod_ptr;
+
 /* One element of kexec actions (last element must have action KEXEC_CALL): */
 struct kexec_action {
     enum {
@@ -60,4 +126,7 @@ int kexec_move_used_pages(unsigned long boundary, unsigned long kernel,
                           unsigned long kernel_size);
 void kexec_move_used_pages_undo(void);
 
+/* Check for kexec module and create kexec memory if needed. */
+void kexec_module(unsigned long start_pfn, unsigned long max_pfn);
+
 #endif /* _KEXEC_H */
diff --git a/include/x86/arch_mm.h b/include/x86/arch_mm.h
index a1b975dc..ae56781e 100644
--- a/include/x86/arch_mm.h
+++ b/include/x86/arch_mm.h
@@ -289,6 +289,7 @@ unsigned long alloc_virt_kernel(unsigned n_pages);
 
 void arch_mm_pre_suspend(void);
 void arch_mm_post_suspend(int canceled);
+void set_reserved_range(unsigned long start, unsigned long end);
 
 #ifndef CONFIG_PARAVIRT
 void arch_print_memmap(void);
diff --git a/kexec.c b/kexec.c
index 2607c819..ded29882 100644
--- a/kexec.c
+++ b/kexec.c
@@ -250,3 +250,6 @@ int kexec_add_action(int action, void *dest, void *src, unsigned int len)
 
     return 0;
 }
+
+unsigned long kexec_mod_start;
+struct kexec_module *mod_ptr;
diff --git a/mm.c b/mm.c
index 8c41d2f2..b5e8d801 100644
--- a/mm.c
+++ b/mm.c
@@ -44,6 +44,7 @@
 #include <mini-os/lib.h>
 #include <mini-os/xmalloc.h>
 #include <mini-os/e820.h>
+#include <mini-os/kexec.h>
 
 /*
  * ALLOCATION BITMAP
@@ -503,6 +504,11 @@ void init_mm(void)
     arch_init_mm(&start_pfn, &max_pfn);
     get_max_pages();
 
+#ifdef CONFIG_KEXEC
+    /* To be called after arch_init_mm() and before init_page_allocator(). */
+    kexec_module(start_pfn, max_pfn);
+#endif
+
     /* Now we can initialise the page allocator. */
     init_page_allocator(PFN_PHYS(start_pfn), PFN_PHYS(max_pfn));
     printk("MM: done\n");
-- 
2.43.0


