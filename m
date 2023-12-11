Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD280C422
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651527.1017217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcN6-00029D-H5; Mon, 11 Dec 2023 09:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651527.1017217; Mon, 11 Dec 2023 09:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcN6-00026K-BM; Mon, 11 Dec 2023 09:14:40 +0000
Received: by outflank-mailman (input) for mailman id 651527;
 Mon, 11 Dec 2023 09:14:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCcN4-0001ce-UI
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:14:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5729684-9805-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:14:38 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 88D164EE0741;
 Mon, 11 Dec 2023 10:14:36 +0100 (CET)
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
X-Inumbo-ID: b5729684-9805-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
Date: Mon, 11 Dec 2023 10:14:29 +0100
Message-Id: <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702285639.git.nicola.vetrini@bugseng.com>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Such declaration is needed because a compatible declaration
is not visible in xen/common/page_alloc.c, where the variable
is defined. That variable can't yet be static because of the lack of
support from ARM and PPC for NUMA.

On the occasion, use drop a use of u8.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Having this declaration essentially sidesteps the current impossibility
of having a static variable, as described in the comments in
ARM and PCC's asm/numa.h.

Changes in v3:
- Drop redundant declarations of first_valid_mfn in asm/numa.h for Arm and PPC.
---
 xen/arch/arm/include/asm/numa.h | 8 ++++----
 xen/arch/ppc/include/asm/numa.h | 7 +++----
 xen/include/xen/mm.h            | 2 ++
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e2bee2bd8223..44b689f67db8 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -2,8 +2,9 @@
 #define __ARCH_ARM_NUMA_H
 
 #include <xen/mm.h>
+#include <xen/types.h>
 
-typedef u8 nodeid_t;
+typedef uint8_t nodeid_t;
 
 #ifndef CONFIG_NUMA
 
@@ -12,10 +13,9 @@ typedef u8 nodeid_t;
 #define node_to_cpumask(node)   (cpu_online_map)
 
 /*
- * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
- * is required because the dummy helpers are using it.
+ * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
+ * this is required because the dummy helpers are using it.
  */
-extern mfn_t first_valid_mfn;
 
 /* XXX: implement NUMA support */
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/numa.h
index 7fdf66c3da74..152305ebe446 100644
--- a/xen/arch/ppc/include/asm/numa.h
+++ b/xen/arch/ppc/include/asm/numa.h
@@ -1,8 +1,8 @@
 #ifndef __ASM_PPC_NUMA_H__
 #define __ASM_PPC_NUMA_H__
 
-#include <xen/types.h>
 #include <xen/mm.h>
+#include <xen/types.h>
 
 typedef uint8_t nodeid_t;
 
@@ -11,10 +11,9 @@ typedef uint8_t nodeid_t;
 #define node_to_cpumask(node)   (cpu_online_map)
 
 /*
- * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
- * is required because the dummy helpers are using it.
+ * TODO: define here first_valid_mfn as static when NUMA is supported on PPC,
+ * this is required because the dummy helpers are using it.
  */
-extern mfn_t first_valid_mfn;
 
 /* XXX: implement NUMA support */
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3d9b2d05a5c8..a13a9a46ced7 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -118,6 +118,8 @@ int destroy_xen_mappings(unsigned long s, unsigned long e);
 /* Retrieve the MFN mapped by VA in Xen virtual address space. */
 mfn_t xen_map_to_mfn(unsigned long va);
 
+extern mfn_t first_valid_mfn;
+
 /*
  * Create only non-leaf page table entries for the
  * page range in Xen virtual address space.
-- 
2.34.1

