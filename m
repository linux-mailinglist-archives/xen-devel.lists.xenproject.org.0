Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA67702707
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534603.831768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTRX-0001Az-VM; Mon, 15 May 2023 08:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534603.831768; Mon, 15 May 2023 08:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTRX-00018C-Rm; Mon, 15 May 2023 08:20:31 +0000
Received: by outflank-mailman (input) for mailman id 534603;
 Mon, 15 May 2023 08:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWdR=BE=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1pyTRW-0000Zb-O6
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:20:30 +0000
Received: from out0-207.mail.aliyun.com (out0-207.mail.aliyun.com
 [140.205.0.207]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 591fb455-f2f9-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 10:20:29 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.T2G7nz7_1684138818) by smtp.aliyun-inc.com;
 Mon, 15 May 2023 16:20:19 +0800
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
X-Inumbo-ID: 591fb455-f2f9-11ed-b229-6b7b168915f2
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047194;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---.T2G7nz7_1684138818;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Juergen Gross" <jgross@suse.com>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
   <xen-devel@lists.xenproject.org>
Subject: [PATCH RFC 2/4] x86/xen: Pin up to VSYSCALL_ADDR when vsyscall page is out of fixmap area
Date: Mon, 15 May 2023 16:19:33 +0800
Message-Id: <a0e2bcde86150831cf8a0da0e94f182668c5cc5e.1684137557.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the vsyscall page is moved out of the fixmap area, then FIXADDR_TOP
would be below the vsyscall page. Therefore, it should be pinned up to
VSYSCALL_ADDR if vsyscall is enabled.

Suggested-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/xen/mmu_pv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index c42c60faa3bb..c1f298c31e64 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -587,6 +587,12 @@ static void xen_p4d_walk(struct mm_struct *mm, p4d_t *p4d,
 	xen_pud_walk(mm, pud, func, last, limit);
 }
 
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
+#define __KERNEL_MAP_TOP	(VSYSCALL_ADDR + PAGE_SIZE)
+#else
+#define __KERNEL_MAP_TOP	FIXADDR_TOP
+#endif
+
 /*
  * (Yet another) pagetable walker.  This one is intended for pinning a
  * pagetable.  This means that it walks a pagetable and calls the
@@ -594,7 +600,7 @@ static void xen_p4d_walk(struct mm_struct *mm, p4d_t *p4d,
  * at every level.  It walks the entire pagetable, but it only bothers
  * pinning pte pages which are below limit.  In the normal case this
  * will be STACK_TOP_MAX, but at boot we need to pin up to
- * FIXADDR_TOP.
+ * __KERNEL_MAP_TOP.
  *
  * We must skip the Xen hole in the middle of the address space, just after
  * the big x86-64 virtual hole.
@@ -609,7 +615,7 @@ static void __xen_pgd_walk(struct mm_struct *mm, pgd_t *pgd,
 
 	/* The limit is the last byte to be touched */
 	limit--;
-	BUG_ON(limit >= FIXADDR_TOP);
+	BUG_ON(limit >= __KERNEL_MAP_TOP);
 
 	/*
 	 * 64-bit has a great big hole in the middle of the address
@@ -797,7 +803,7 @@ static void __init xen_after_bootmem(void)
 #ifdef CONFIG_X86_VSYSCALL_EMULATION
 	SetPagePinned(virt_to_page(level3_user_vsyscall));
 #endif
-	xen_pgd_walk(&init_mm, xen_mark_pinned, FIXADDR_TOP);
+	xen_pgd_walk(&init_mm, xen_mark_pinned, __KERNEL_MAP_TOP);
 }
 
 static void xen_unpin_page(struct mm_struct *mm, struct page *page,
-- 
2.31.1


