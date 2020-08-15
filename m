Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023E2450E8
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 13:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6uAM-0005Y5-1o; Sat, 15 Aug 2020 11:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6uAL-0005Y0-A5
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 11:16:01 +0000
X-Inumbo-ID: dd838711-5613-43cc-99de-5935b60c0053
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd838711-5613-43cc-99de-5935b60c0053;
 Sat, 15 Aug 2020 11:15:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08C5FB73B;
 Sat, 15 Aug 2020 11:16:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>
Subject: [PATCH] mini-os: correct memory access rights for pvh mode
Date: Sat, 15 Aug 2020 13:15:57 +0200
Message-Id: <20200815111557.29564-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When running as a PVH guest the memory access rights are not set
correctly: _PAGE_USER should not be set and CR0.WP should be set.
Especially CR0.WP is important in order to let the allocate on
demand feature work, as it requires a page fault when writing to a
read-only page.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/x86_hvm.S    |  2 +-
 include/x86/arch_mm.h | 18 ++++++++++++------
 include/x86/os.h      |  1 +
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/x86/x86_hvm.S b/arch/x86/x86_hvm.S
index 6e8ad98..42a5f02 100644
--- a/arch/x86/x86_hvm.S
+++ b/arch/x86/x86_hvm.S
@@ -20,7 +20,7 @@ _start:
 #endif /* __x86_64__ */
 
         mov %cr0, %eax
-        or $X86_CR0_PG, %eax
+        or $(X86_CR0_PG | X86_CR0_WP), %eax
         mov %eax, %cr0
 
         lgdt gdt_ptr
diff --git a/include/x86/arch_mm.h b/include/x86/arch_mm.h
index cbbeb21..ffbec5a 100644
--- a/include/x86/arch_mm.h
+++ b/include/x86/arch_mm.h
@@ -171,17 +171,23 @@ typedef unsigned long pgentry_t;
 #define _PAGE_PSE      CONST(0x080)
 #define _PAGE_GLOBAL   CONST(0x100)
 
+#ifdef CONFIG_PARAVIRT
+#define PAGE_USER _PAGE_USER
+#else
+#define PAGE_USER CONST(0)
+#endif
+
 #if defined(__i386__)
 #define L1_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED)
 #define L1_PROT_RO (_PAGE_PRESENT|_PAGE_ACCESSED)
-#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY |_PAGE_USER)
+#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY |PAGE_USER)
 #define L3_PROT (_PAGE_PRESENT)
 #elif defined(__x86_64__)
-#define L1_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_USER)
-#define L1_PROT_RO (_PAGE_PRESENT|_PAGE_ACCESSED|_PAGE_USER)
-#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_USER)
-#define L3_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_USER)
-#define L4_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_USER)
+#define L1_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|PAGE_USER)
+#define L1_PROT_RO (_PAGE_PRESENT|_PAGE_ACCESSED|PAGE_USER)
+#define L2_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|PAGE_USER)
+#define L3_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|PAGE_USER)
+#define L4_PROT (_PAGE_PRESENT|_PAGE_RW|_PAGE_ACCESSED|_PAGE_DIRTY|PAGE_USER)
 #endif /* __i386__ || __x86_64__ */
 
 /* flags for ioremap */
diff --git a/include/x86/os.h b/include/x86/os.h
index a73b63e..46a824d 100644
--- a/include/x86/os.h
+++ b/include/x86/os.h
@@ -27,6 +27,7 @@
 #define MSR_EFER          0xc0000080
 #define _EFER_LME         8             /* Long mode enable */
 
+#define X86_CR0_WP        0x00010000    /* Write protect */
 #define X86_CR0_PG        0x80000000    /* Paging */
 #define X86_CR4_PAE       0x00000020    /* enable physical address extensions */
 #define X86_CR4_OSFXSR    0x00000200    /* enable fast FPU save and restore */
-- 
2.26.2


