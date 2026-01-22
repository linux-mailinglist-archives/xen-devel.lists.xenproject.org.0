Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J5iJML2cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:06:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9164FE3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210695.1522320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viraQ-0007bL-6y; Thu, 22 Jan 2026 10:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210695.1522320; Thu, 22 Jan 2026 10:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viraQ-0007Zt-48; Thu, 22 Jan 2026 10:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1210695;
 Thu, 22 Jan 2026 10:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qG0Y=73=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1viraN-0007Zl-G2
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:06:44 +0000
Received: from out28-101.mail.aliyun.com (out28-101.mail.aliyun.com
 [115.124.28.101]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08fbd6d5-f77a-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 11:06:38 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gCtgiB8_1769076393 cluster:ay29) by smtp.aliyun-inc.com;
 Thu, 22 Jan 2026 18:06:33 +0800
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
X-Inumbo-ID: 08fbd6d5-f77a-11f0-b15e-2bf370ae4941
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769076395; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=+IzdvJQKHxyyb3zk/1TUPey9oqBuebDgXOHFwXWkTQw=;
	b=FeFS8h/I4CvU0AfgwAdQHTmGyoeo0sRtDLr2bvnUbJQtmgBFIxTSbRwJFWidAcqUX1xmR4zICSx2LvwlpZ/uCNHd4Om6ZlJ/O93bHEbSa6SeQUgXcWmwViAxIjTkTsKZsT0QotHD9dZ67gdjzAeFyxZnlQkhICGh7OIA/BCUtyM=
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Uros Bizjak <ubizjak@gmail.com>,
	Brian Gerst <brgerst@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: Build identity mapping page tables dynamically for XENPV
Date: Thu, 22 Jan 2026 18:06:14 +0800
Message-Id: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[antgroup.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[antgroup.com:s=default];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[antgroup.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,oracle.com,gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:houwenlong.hwl@antgroup.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:thuth@redhat.com,m:kas@kernel.org,m:ubizjak@gmail.com,m:brgerst@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[antgroup.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,antgroup.com:email,antgroup.com:dkim,antgroup.com:mid];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8C9164FE3
X-Rspamd-Action: no action

After commit 47ffe0578aee ("x86/pvh: Add 64bit relocation page tables"),
the PVH entry uses a new set of page tables instead of the
preconstructed page tables in head64.S. Since those preconstructed page
tables are only used in XENPV now and XENPV does not actually need the
preconstructed identity page tables directly, they can be filled in
xen_setup_kernel_pagetable(). Therefore, build the identity mapping page
table dynamically to remove the preconstructed page tables and make the
code cleaner.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/include/asm/pgtable_64.h |  2 --
 arch/x86/kernel/head_64.S         | 28 ----------------------------
 arch/x86/xen/mmu_pv.c             |  9 +++++++++
 3 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index f06e5d6a2747..ce45882ccd07 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -19,10 +19,8 @@
 extern p4d_t level4_kernel_pgt[512];
 extern p4d_t level4_ident_pgt[512];
 extern pud_t level3_kernel_pgt[512];
-extern pud_t level3_ident_pgt[512];
 extern pmd_t level2_kernel_pgt[512];
 extern pmd_t level2_fixmap_pgt[512];
-extern pmd_t level2_ident_pgt[512];
 extern pte_t level1_fixmap_pgt[512 * FIXMAP_PMD_NUM];
 extern pgd_t init_top_pgt[];
 
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 21816b48537c..85d4a5094f6b 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -616,38 +616,10 @@ SYM_DATA(early_recursion_flag, .long 0)
 
 	.data
 
-#if defined(CONFIG_XEN_PV) || defined(CONFIG_PVH)
-SYM_DATA_START_PTI_ALIGNED(init_top_pgt)
-	.quad   level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
-	.org    init_top_pgt + L4_PAGE_OFFSET*8, 0
-	.quad   level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
-	.org    init_top_pgt + L4_START_KERNEL*8, 0
-	/* (2^48-(2*1024*1024*1024))/(2^39) = 511 */
-	.quad   level3_kernel_pgt - __START_KERNEL_map + _PAGE_TABLE_NOENC
-	.fill	PTI_USER_PGD_FILL,8,0
-SYM_DATA_END(init_top_pgt)
-
-SYM_DATA_START_PAGE_ALIGNED(level3_ident_pgt)
-	.quad	level2_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
-	.fill	511, 8, 0
-SYM_DATA_END(level3_ident_pgt)
-SYM_DATA_START_PAGE_ALIGNED(level2_ident_pgt)
-	/*
-	 * Since I easily can, map the first 1G.
-	 * Don't set NX because code runs from these pages.
-	 *
-	 * Note: This sets _PAGE_GLOBAL despite whether
-	 * the CPU supports it or it is enabled.  But,
-	 * the CPU should ignore the bit.
-	 */
-	PMDS(0, __PAGE_KERNEL_IDENT_LARGE_EXEC, PTRS_PER_PMD)
-SYM_DATA_END(level2_ident_pgt)
-#else
 SYM_DATA_START_PTI_ALIGNED(init_top_pgt)
 	.fill	512,8,0
 	.fill	PTI_USER_PGD_FILL,8,0
 SYM_DATA_END(init_top_pgt)
-#endif
 
 SYM_DATA_START_PAGE_ALIGNED(level4_kernel_pgt)
 	.fill	511,8,0
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 9fa00c4a8858..7d77c233002b 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -105,6 +105,9 @@ pte_t xen_make_pte_init(pteval_t pte);
 static pud_t level3_user_vsyscall[PTRS_PER_PUD] __page_aligned_bss;
 #endif
 
+static pud_t level3_ident_pgt[PTRS_PER_PUD] __page_aligned_bss;
+static pmd_t level2_ident_pgt[PTRS_PER_PMD] __page_aligned_bss;
+
 /*
  * Protects atomic reservation decrease/increase against concurrent increases.
  * Also protects non-atomic updates of current_pages and balloon lists.
@@ -1773,6 +1776,12 @@ void __init xen_setup_kernel_pagetable(pgd_t *pgd, unsigned long max_pfn)
 	/* Zap identity mapping */
 	init_top_pgt[0] = __pgd(0);
 
+	init_top_pgt[pgd_index(__PAGE_OFFSET_BASE_L4)].pgd =
+		__pa_symbol(level3_ident_pgt) + _KERNPG_TABLE_NOENC;
+	init_top_pgt[pgd_index(__START_KERNEL_map)].pgd =
+		__pa_symbol(level3_kernel_pgt) + _PAGE_TABLE_NOENC;
+	level3_ident_pgt[0].pud = __pa_symbol(level2_ident_pgt) + _KERNPG_TABLE_NOENC;
+
 	/* Pre-constructed entries are in pfn, so convert to mfn */
 	/* L4[273] -> level3_ident_pgt  */
 	/* L4[511] -> level3_kernel_pgt */
-- 
2.31.1


