Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8C8D04C1
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 16:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730806.1136029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj5-0005Cv-NY; Mon, 27 May 2024 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730806.1136029; Mon, 27 May 2024 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj5-00058P-Ij; Mon, 27 May 2024 14:53:27 +0000
Received: by outflank-mailman (input) for mailman id 730806;
 Mon, 27 May 2024 14:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uY6H=M6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sBbj4-00056W-LY
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 14:53:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df0196c3-1c38-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 16:53:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 2B1544EE0745;
 Mon, 27 May 2024 16:53:25 +0200 (CEST)
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
X-Inumbo-ID: df0196c3-1c38-11ef-90a1-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 3/4] x86: address violations of MISRA C Rule 8.4
Date: Mon, 27 May 2024 16:53:18 +0200
Message-Id: <cf926194a541d11e02670516a8d337de27836dce.1716814609.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716814609.git.nicola.vetrini@bugseng.com>
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 8.4 states: "A compatible declaration shall be visible when
an object or function with external linkage is defined."

These variables are only referenced from asm modules, so they
need to be extern and there is negligible risk of them being
used improperly without noticing.

As a result, they can be exempted using a comment-based deviation.
No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Adding the asmlinkage macro to variables is not appropriate, as
this pseudo-attribute may expand, for instance, to a different calling
convention in the future (e.g. stdcall)
---
 xen/arch/x86/desc.c | 1 +
 xen/arch/x86/mm.c   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/desc.c b/xen/arch/x86/desc.c
index 39080ca67211..9f639281540a 100644
--- a/xen/arch/x86/desc.c
+++ b/xen/arch/x86/desc.c
@@ -91,6 +91,7 @@ seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
  * References boot_cpu_gdt_table for a short period, until the CPUs switch
  * onto their per-CPU GDTs.
  */
+/* SAF-1-safe */
 const struct desc_ptr boot_gdtr = {
     .limit = LAST_RESERVED_GDT_BYTE,
     .base = (unsigned long)(boot_gdt - FIRST_RESERVED_GDT_ENTRY),
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d968bbbc7315..17987eb5199e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -144,7 +144,7 @@
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap[L1_PAGETABLE_ENTRIES];
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    l1_fixmap_x[L1_PAGETABLE_ENTRIES];
+    l1_fixmap_x[L1_PAGETABLE_ENTRIES]; /* SAF-1-safe */
 
 bool __read_mostly machine_to_phys_mapping_valid;
 
-- 
2.34.1


