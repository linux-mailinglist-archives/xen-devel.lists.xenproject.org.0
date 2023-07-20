Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D075AC59
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 12:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566533.885473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRDD-0005sF-Co; Thu, 20 Jul 2023 10:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566533.885473; Thu, 20 Jul 2023 10:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRDD-0005ps-AF; Thu, 20 Jul 2023 10:48:47 +0000
Received: by outflank-mailman (input) for mailman id 566533;
 Thu, 20 Jul 2023 10:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2HW=DG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMRDC-0005pm-3t
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 10:48:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff889a9a-26ea-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 12:48:44 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.218.169])
 by support.bugseng.com (Postfix) with ESMTPSA id AA7504EE0C89;
 Thu, 20 Jul 2023 12:48:42 +0200 (CEST)
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
X-Inumbo-ID: ff889a9a-26ea-11ee-b23a-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] x86/mtrr: address violations of MISRA C:2012 Rule 8.3 on parameter types
Date: Thu, 20 Jul 2023 12:48:36 +0200
Message-Id: <76dba3f8a6a7bc12f15a9e4fc8c73826a08e4b5c.1689849810.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter types of function declarations to be consistent with
the ones used in the corresponding definitions,
thus addressing violations of MISRA C:2012 Rule 8.3 ("All declarations
of an object or function shall use the same names and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/mtrr.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index e4f6ca6048..5d57a596ea 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -59,9 +59,10 @@ extern int mtrr_del_page(int reg, unsigned long base, unsigned long size);
 extern int mtrr_get_type(const struct mtrr_state *m, paddr_t pa,
                          unsigned int order);
 extern void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi);
-extern u32 get_pat_flags(struct vcpu *v, u32 gl1e_flags, paddr_t gpaddr,
-                  paddr_t spaddr, uint8_t gmtrr_mtype);
-extern unsigned char pat_type_2_pte_flags(unsigned char pat_type);
+extern uint32_t get_pat_flags(struct vcpu *v, uint32_t gl1e_flags,
+                              paddr_t gpaddr, paddr_t spaddr,
+															uint8_t gmtrr_mtype);
+extern uint8_t pat_type_2_pte_flags(uint8_t pat_type);
 extern int hold_mtrr_updates_on_aps;
 extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
-- 
2.34.1


