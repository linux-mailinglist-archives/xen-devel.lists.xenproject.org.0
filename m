Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7747B0DF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 17:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249864.430335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCF-0006tl-4H; Mon, 20 Dec 2021 16:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249864.430335; Mon, 20 Dec 2021 16:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCE-0006pF-Pn; Mon, 20 Dec 2021 16:07:30 +0000
Received: by outflank-mailman (input) for mailman id 249864;
 Mon, 20 Dec 2021 16:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzLCC-00055w-9i
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 16:07:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8682008-61ae-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 17:07:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27F6D1F3A0;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F143313D6B;
 Mon, 20 Dec 2021 16:07:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2BiUOTaqwGEUTAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Dec 2021 16:07:18 +0000
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
X-Inumbo-ID: e8682008-61ae-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640016439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cvjzn61nlQz/5cNRGk/V3qCPy6sEZi3f9w8y3gbMdqw=;
	b=b9kSDOD54CjbEdJV0hisvDcPiih19/6ZkGnbHGHR3e43ywtVC4E7DbvckDK2pby5sfe7dg
	CoxJj6F1lFGjiywDODLGuE3h32KgsGtOC6OY2CQd24DyzVA4V4VYA8GXSAnQByvl7lwxEz
	ag3iL+3lDG3nsoXlzpQSjLuE0N0kTS0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 01/10] mini-os: split e820 map handling into new source file
Date: Mon, 20 Dec 2021 17:07:07 +0100
Message-Id: <20211220160716.4159-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211220160716.4159-1-jgross@suse.com>
References: <20211220160716.4159-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce e820.c containing all the E820 memory map handling.

No functional change.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 Makefile       |   1 +
 arch/arm/mm.c  |   8 ----
 arch/x86/mm.c  |  70 +----------------------------
 e820.c         | 119 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/e820.h |   6 +++
 5 files changed, 128 insertions(+), 76 deletions(-)
 create mode 100644 e820.c

diff --git a/Makefile b/Makefile
index 4b76b55..06b60fc 100644
--- a/Makefile
+++ b/Makefile
@@ -41,6 +41,7 @@ src-$(CONFIG_TPMFRONT) += tpmfront.c
 src-$(CONFIG_TPM_TIS) += tpm_tis.c
 src-$(CONFIG_TPMBACK) += tpmback.c
 src-y += daytime.c
+src-y += e820.c
 src-y += events.c
 src-$(CONFIG_FBFRONT) += fbfront.c
 src-y += gntmap.c
diff --git a/arch/arm/mm.c b/arch/arm/mm.c
index f806c9f..9068166 100644
--- a/arch/arm/mm.c
+++ b/arch/arm/mm.c
@@ -7,14 +7,6 @@
 #include <lib.h>
 
 uint32_t physical_address_offset;
-struct e820entry e820_map[1] = {
-    {
-        .addr = 0,
-        .size = ULONG_MAX - 1,
-        .type = E820_RAM
-    }
-};
-unsigned e820_entries = 1;
 
 unsigned long allocate_ondemand(unsigned long n, unsigned long alignment)
 {
diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 8ba14a5..8df93da 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -64,15 +64,6 @@ extern char stack[];
 extern void page_walk(unsigned long va);
 
 #ifdef CONFIG_PARAVIRT
-struct e820entry e820_map[1] = {
-    {
-        .addr = 0,
-        .size = ULONG_MAX - 1,
-        .type = E820_RAM
-    }
-};
-unsigned e820_entries = 1;
-
 void arch_mm_preinit(void *p)
 {
     start_info_t *si = p;
@@ -112,25 +103,11 @@ desc_ptr idt_ptr =
     .base = (unsigned long)&idt,
 };
 
-struct e820entry e820_map[E820_MAX];
-unsigned e820_entries;
-
-static char *e820_types[E820_TYPES] = {
-    [E820_RAM]      = "RAM",
-    [E820_RESERVED] = "Reserved",
-    [E820_ACPI]     = "ACPI",
-    [E820_NVS]      = "NVS",
-    [E820_UNUSABLE] = "Unusable",
-    [E820_PMEM]     = "PMEM"
-};
-
 void arch_mm_preinit(void *p)
 {
     long ret;
     domid_t domid = DOMID_SELF;
-    struct xen_memory_map memmap;
-    int i;
-    unsigned long pfn, max = 0;
+    unsigned long max;
 
     pt_base = page_table_base;
     first_free_pfn = PFN_UP(to_phys(&_end));
@@ -142,53 +119,10 @@ void arch_mm_preinit(void *p)
     }
     last_free_pfn = ret;
 
-    memmap.nr_entries = E820_MAX;
-    set_xen_guest_handle(memmap.buffer, e820_map);
-    ret = HYPERVISOR_memory_op(XENMEM_memory_map, &memmap);
-    if ( ret < 0 )
-    {
-        xprintk("could not get memory map\n");
-        do_exit();
-    }
-    e820_entries = memmap.nr_entries;
-
-    for ( i = 0; i < e820_entries; i++ )
-    {
-        if ( e820_map[i].type != E820_RAM )
-            continue;
-        pfn = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
-        if ( pfn > max )
-            max = pfn;
-    }
-
+    max = e820_get_maxpfn();
     if ( max < last_free_pfn )
         last_free_pfn = max;
 }
-
-void arch_print_memmap(void)
-{
-    int i;
-    unsigned long from, to;
-    char *type;
-    char buf[12];
-
-    printk("Memory map:\n");
-    for ( i = 0; i < e820_entries; i++ )
-    {
-        if ( e820_map[i].type >= E820_TYPES || !e820_types[e820_map[i].type] )
-        {
-            snprintf(buf, sizeof(buf), "%8x", e820_map[i].type);
-            type = buf;
-        }
-        else
-        {
-            type = e820_types[e820_map[i].type];
-        }
-        from = e820_map[i].addr;
-        to = from + e820_map[i].size - 1;
-        printk("%012lx-%012lx: %s\n", from, to, type);
-    }
-}
 #endif
 
 /*
diff --git a/e820.c b/e820.c
new file mode 100644
index 0000000..2165280
--- /dev/null
+++ b/e820.c
@@ -0,0 +1,119 @@
+/* -*-  Mode:C; c-basic-offset:4; tab-width:4 -*-
+ *
+ * (C) 2021 - Juergen Gross, SUSE Software Solutions Germany GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <mini-os/types.h>
+#include <mini-os/lib.h>
+#include <mini-os/console.h>
+#include <mini-os/os.h>
+#include <mini-os/posix/limits.h>
+#include <mini-os/e820.h>
+#include <xen/memory.h>
+
+#ifdef CONFIG_E820_TRIVIAL
+struct e820entry e820_map[1] = {
+    {
+        .addr = 0,
+        .size = ULONG_MAX - 1,
+        .type = E820_RAM
+    }
+};
+
+unsigned e820_entries = 1;
+
+static void e820_get_memmap(void)
+{
+}
+
+#else
+struct e820entry e820_map[E820_MAX];
+unsigned e820_entries;
+
+static char *e820_types[E820_TYPES] = {
+    [E820_RAM]      = "RAM",
+    [E820_RESERVED] = "Reserved",
+    [E820_ACPI]     = "ACPI",
+    [E820_NVS]      = "NVS",
+    [E820_UNUSABLE] = "Unusable",
+    [E820_PMEM]     = "PMEM"
+};
+
+static void e820_get_memmap(void)
+{
+    long ret;
+    struct xen_memory_map memmap;
+
+    memmap.nr_entries = E820_MAX;
+    set_xen_guest_handle(memmap.buffer, e820_map);
+    ret = HYPERVISOR_memory_op(XENMEM_memory_map, &memmap);
+    if ( ret < 0 )
+    {
+        xprintk("could not get memory map\n");
+        do_exit();
+    }
+    e820_entries = memmap.nr_entries;
+}
+
+void arch_print_memmap(void)
+{
+    int i;
+    unsigned long from, to;
+    char *type;
+    char buf[12];
+
+    printk("Memory map:\n");
+    for ( i = 0; i < e820_entries; i++ )
+    {
+        if ( e820_map[i].type >= E820_TYPES || !e820_types[e820_map[i].type] )
+        {
+            snprintf(buf, sizeof(buf), "%8x", e820_map[i].type);
+            type = buf;
+        }
+        else
+        {
+            type = e820_types[e820_map[i].type];
+        }
+        from = e820_map[i].addr;
+        to = from + e820_map[i].size - 1;
+        printk("%012lx-%012lx: %s\n", from, to, type);
+    }
+}
+#endif
+
+unsigned long e820_get_maxpfn(void)
+{
+    int i;
+    unsigned long pfn, max = 0;
+
+    e820_get_memmap();
+
+    for ( i = 0; i < e820_entries; i++ )
+    {
+        if ( e820_map[i].type != E820_RAM )
+            continue;
+        pfn = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
+        if ( pfn > max )
+            max = pfn;
+    }
+
+    return max;
+}
diff --git a/include/e820.h b/include/e820.h
index 920551c..af2129f 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -24,6 +24,10 @@
 #ifndef __E820_HEADER
 #define __E820_HEADER
 
+#if defined(__arm__) || defined(__aarch64__) || defined(CONFIG_PARAVIRT)
+#define CONFIG_E820_TRIVIAL
+#endif
+
 /* PC BIOS standard E820 types and structure. */
 #define E820_RAM          1
 #define E820_RESERVED     2
@@ -45,4 +49,6 @@ struct __packed e820entry {
 extern struct e820entry e820_map[];
 extern unsigned e820_entries;
 
+unsigned long e820_get_maxpfn(void);
+
 #endif /*__E820_HEADER*/
-- 
2.26.2


