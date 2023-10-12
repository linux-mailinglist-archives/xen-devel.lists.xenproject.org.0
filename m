Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF97C7175
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615842.957365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcX-0007Sj-VG; Thu, 12 Oct 2023 15:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615842.957365; Thu, 12 Oct 2023 15:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcX-0007PS-RO; Thu, 12 Oct 2023 15:29:05 +0000
Received: by outflank-mailman (input) for mailman id 615842;
 Thu, 12 Oct 2023 15:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqxcW-0006QI-Iq
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:29:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 134e2440-6914-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 17:29:04 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CB0064EE0748;
 Thu, 12 Oct 2023 17:29:02 +0200 (CEST)
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
X-Inumbo-ID: 134e2440-6914-11ee-98d4-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-next v2 4/8] x86_64/mm: express macro CNT using LOWEST_BIT
Date: Thu, 12 Oct 2023 17:28:48 +0200
Message-Id: <eb05327a3af71c883c3ff5ed3b4501a8859403d3.1697123806.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697123806.git.nicola.vetrini@bugseng.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various definitions of macro CNT (and the related BUILD_BUG_ON)
can be rewritten using LOWEST_BIT, encapsulating a violation of
MISRA C:2012 Rule 10.1.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/x86_64/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index c3ebb777144a..0eb7b71124f5 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -351,9 +351,9 @@ static int setup_compat_m2p_table(struct mem_hotadd_info *info)
                 ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) );

 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (LOWEST_BIT(sizeof(*frame_table)) / \
              sizeof(*compat_machine_to_phys_mapping))
-    BUILD_BUG_ON((sizeof(*frame_table) & -sizeof(*frame_table)) % \
+    BUILD_BUG_ON(LOWEST_BIT(sizeof(*frame_table)) % \
                  sizeof(*compat_machine_to_phys_mapping));

     for ( i = smap; i < emap; i += (1UL << (L2_PAGETABLE_SHIFT - 2)) )
@@ -410,10 +410,10 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
     va = RO_MPT_VIRT_START + smap * sizeof(*machine_to_phys_mapping);

 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned long))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (LOWEST_BIT(sizeof(*frame_table)) / \
              sizeof(*machine_to_phys_mapping))

-    BUILD_BUG_ON((sizeof(*frame_table) & -sizeof(*frame_table)) % \
+    BUILD_BUG_ON(LOWEST_BIT(sizeof(*frame_table)) % \
                  sizeof(*machine_to_phys_mapping));

     i = smap;
@@ -539,7 +539,7 @@ void __init paging_init(void)
     mpt_size  = (max_page * BYTES_PER_LONG) + (1UL << L2_PAGETABLE_SHIFT) - 1;
     mpt_size &= ~((1UL << L2_PAGETABLE_SHIFT) - 1UL);
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned long))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (LOWEST_BIT(sizeof(*frame_table)) / \
              sizeof(*machine_to_phys_mapping))
     BUILD_BUG_ON((sizeof(*frame_table) & ~sizeof(*frame_table)) % \
                  sizeof(*machine_to_phys_mapping));
@@ -666,7 +666,7 @@ void __init paging_init(void)
         mpt_size = 0;

 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
-#define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
+#define CNT (LOWEST_BIT(sizeof(*frame_table)) / \
              sizeof(*compat_machine_to_phys_mapping))
     BUILD_BUG_ON((sizeof(*frame_table) & ~sizeof(*frame_table)) % \
                  sizeof(*compat_machine_to_phys_mapping));
--
2.34.1

