Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4337E818607
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656668.1025026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvQ-0003vL-0P; Tue, 19 Dec 2023 11:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656668.1025026; Tue, 19 Dec 2023 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvP-0003ou-Q8; Tue, 19 Dec 2023 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 656668;
 Tue, 19 Dec 2023 11:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvO-0003Hq-LH
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b79e041-9e5e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:06:06 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 8DD474EE0C8D;
 Tue, 19 Dec 2023 12:06:06 +0100 (CET)
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
X-Inumbo-ID: 9b79e041-9e5e-11ee-98eb-6d05b1d4d9a1
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
Subject: [PATCH v2 1/6] xen/arm: address violations of MISRA C:2012 Rule 11.8
Date: Tue, 19 Dec 2023 12:05:09 +0100
Message-Id: <cb398c5819310d2dc3413c4ceee685ed23ec7cf3.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
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

Drop redundant cast to preserve const qualifier.

No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Changes in v2:
- drop redundant cast on fdt
---
 xen/arch/arm/bootfdt.c                 | 6 +++---
 xen/arch/arm/include/asm/alternative.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index f496a8cf94..1cbac3cb2a 100644
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
+    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
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


