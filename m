Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF385812FC0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654522.1021504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWI-0001WT-Hr; Thu, 14 Dec 2023 12:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654522.1021504; Thu, 14 Dec 2023 12:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWI-0001Od-C2; Thu, 14 Dec 2023 12:08:50 +0000
Received: by outflank-mailman (input) for mailman id 654522;
 Thu, 14 Dec 2023 12:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWG-0000tI-KV
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88302c32-9a79-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 13:08:46 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id B01994EE0742;
 Thu, 14 Dec 2023 13:08:45 +0100 (CET)
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
X-Inumbo-ID: 88302c32-9a79-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 2/9] xen/arm: address violations of MISRA C:2012 Rule 11.8
Date: Thu, 14 Dec 2023 13:07:44 +0100
Message-Id: <1ad7937f9aa2086e76a87c8edf8105bd4476bf39.1702555387.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Add missing const qualifiers in casts.
The variables are originally const-qualified.
There's no reason to drop the qualifiers.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/arm/bootfdt.c                 | 6 +++---
 xen/arch/arm/include/asm/alternative.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index f496a8cf94..e7948ea3e8 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -377,7 +377,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-start property has invalid length %d\n", len);
         return -EINVAL;
     }
-    start = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
+    start = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
 
     prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
     if ( !prop )
@@ -390,7 +390,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         printk("linux,initrd-end property has invalid length %d\n", len);
         return -EINVAL;
     }
-    end = dt_read_paddr((void *)&prop->data, dt_size_to_cells(len));
+    end = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
 
     if ( start >= end )
     {
@@ -541,7 +541,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
 
     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
 
-    ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+    ret = device_tree_for_each_node((const void *)fdt, 0, early_scan_node, NULL);
     if ( ret )
         panic("Early FDT parsing failed (%d)\n", ret);
 
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index d3210e82f9..c7632668b6 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -20,7 +20,7 @@ struct alt_instr {
 };
 
 /* Xen: helpers used by common code. */
-#define __ALT_PTR(a,f)		((void *)&(a)->f + (a)->f)
+#define __ALT_PTR(a,f)		((const void *)&(a)->f + (a)->f)
 #define ALT_ORIG_PTR(a)		__ALT_PTR(a, orig_offset)
 #define ALT_REPL_PTR(a)		__ALT_PTR(a, repl_offset)
 
-- 
2.40.0


