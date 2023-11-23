Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628607F5967
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639368.996675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64HG-0005D3-KF; Thu, 23 Nov 2023 07:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639368.996675; Thu, 23 Nov 2023 07:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64HG-0005A4-F9; Thu, 23 Nov 2023 07:37:34 +0000
Received: by outflank-mailman (input) for mailman id 639368;
 Thu, 23 Nov 2023 07:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64HF-0004g4-9g
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:37:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 292770ab-89d3-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 08:37:31 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 0DBED4EE0C8F;
 Thu, 23 Nov 2023 08:37:31 +0100 (CET)
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
X-Inumbo-ID: 292770ab-89d3-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v5 3/3] x86_64/mm: express macro CNT using ISOLATE_LSB
Date: Thu, 23 Nov 2023 08:37:18 +0100
Message-Id: <9c9af1a6aeef1120541d110810dd15eb0f96d7ab.1700724350.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700724350.git.nicola.vetrini@bugseng.com>
References: <cover.1700724350.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various definitions of macro CNT (and the related BUILD_BUG_ON)
can be rewritten using ISOLATE_LSB, encapsulating a violation of
MISRA C:2012 Rule 10.1.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
- Changed macro name
Changes in v5:
- Add A-by
- Changed macro name.
---
 xen/arch/x86/x86_64/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index c3ebb777144a..b2a280fba369 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -351,9 +351,9 @@ static int setup_compat_m2p_table(struct mem_hotadd_info *info)
                 ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) );
 
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (ISOLATE_LSB(sizeof(*frame_table)) / \
              sizeof(*compat_machine_to_phys_mapping))
-    BUILD_BUG_ON((sizeof(*frame_table) & -sizeof(*frame_table)) % \
+    BUILD_BUG_ON(ISOLATE_LSB(sizeof(*frame_table)) % \
                  sizeof(*compat_machine_to_phys_mapping));
 
     for ( i = smap; i < emap; i += (1UL << (L2_PAGETABLE_SHIFT - 2)) )
@@ -410,10 +410,10 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
     va = RO_MPT_VIRT_START + smap * sizeof(*machine_to_phys_mapping);
 
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned long))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (ISOLATE_LSB(sizeof(*frame_table)) / \
              sizeof(*machine_to_phys_mapping))
 
-    BUILD_BUG_ON((sizeof(*frame_table) & -sizeof(*frame_table)) % \
+    BUILD_BUG_ON(ISOLATE_LSB(sizeof(*frame_table)) % \
                  sizeof(*machine_to_phys_mapping));
 
     i = smap;
@@ -539,7 +539,7 @@ void __init paging_init(void)
     mpt_size  = (max_page * BYTES_PER_LONG) + (1UL << L2_PAGETABLE_SHIFT) - 1;
     mpt_size &= ~((1UL << L2_PAGETABLE_SHIFT) - 1UL);
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned long))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (ISOLATE_LSB(sizeof(*frame_table)) / \
              sizeof(*machine_to_phys_mapping))
     BUILD_BUG_ON((sizeof(*frame_table) & ~sizeof(*frame_table)) % \
                  sizeof(*machine_to_phys_mapping));
@@ -666,7 +666,7 @@ void __init paging_init(void)
         mpt_size = 0;
 
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (ISOLATE_LSB(sizeof(*frame_table)) / \
              sizeof(*compat_machine_to_phys_mapping))
     BUILD_BUG_ON((sizeof(*frame_table) & ~sizeof(*frame_table)) % \
                  sizeof(*compat_machine_to_phys_mapping));
-- 
2.34.1


