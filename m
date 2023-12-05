Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBC80539C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647702.1011268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU25-0000lV-7T; Tue, 05 Dec 2023 11:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647702.1011268; Tue, 05 Dec 2023 11:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU25-0000fj-46; Tue, 05 Dec 2023 11:56:09 +0000
Received: by outflank-mailman (input) for mailman id 647702;
 Tue, 05 Dec 2023 11:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDPQ=HQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAU23-0000Kl-NX
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:56:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 446a8958-9365-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:56:04 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-46-48-173.retail.telecomitalia.it [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 158004EE074F;
 Tue,  5 Dec 2023 12:56:04 +0100 (CET)
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
X-Inumbo-ID: 446a8958-9365-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/6] x86/page: address violations of MISRA C:2012 Rule 8.2
Date: Tue,  5 Dec 2023 12:55:53 +0100
Message-Id: <626f8040804d8f7dbdcde57725ac4eab895f295c.1701764980.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701764980.git.federico.serafini@bugseng.com>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/page.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 93a7b368ac..350d1fb110 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -232,8 +232,8 @@ typedef struct { u64 pfn; } pagetable_t;
 #define pagetable_from_paddr(p) pagetable_from_pfn((p)>>PAGE_SHIFT)
 #define pagetable_null()        pagetable_from_pfn(0)
 
-void clear_page_sse2(void *);
-void copy_page_sse2(void *, const void *);
+void clear_page_sse2(void *pg);
+void copy_page_sse2(void *to, const void *from);
 
 #define clear_page(_p)      clear_page_sse2(_p)
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
@@ -303,7 +303,7 @@ extern l3_pgentry_t l3_bootmap[L3_PAGETABLE_ENTRIES];
 extern l2_pgentry_t l2_directmap[4*L2_PAGETABLE_ENTRIES];
 extern l1_pgentry_t l1_fixmap[L1_PAGETABLE_ENTRIES];
 void paging_init(void);
-void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t);
+void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e);
 #endif /* !defined(__ASSEMBLY__) */
 
 #define _PAGE_NONE     _AC(0x000,U)
-- 
2.34.1


