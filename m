Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6849A9FAB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 12:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824087.1238177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3BqZ-0005L8-Gf; Tue, 22 Oct 2024 10:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824087.1238177; Tue, 22 Oct 2024 10:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3BqZ-0005I6-DQ; Tue, 22 Oct 2024 10:10:39 +0000
Received: by outflank-mailman (input) for mailman id 824087;
 Tue, 22 Oct 2024 10:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yutH=RS=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1t3BqY-0005I0-9A
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 10:10:38 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1749ac3-905d-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 12:10:36 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso805633966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 03:10:36 -0700 (PDT)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571ebdsm322361366b.148.2024.10.22.03.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 03:10:35 -0700 (PDT)
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
X-Inumbo-ID: e1749ac3-905d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729591835; x=1730196635; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYXPGw1U0OFZ1dEh+x0cloBQ3vRFUK2rGGbM+Gy0GWc=;
        b=l9969PRQmPFAHXLScoMi9Bs22D0tiG8t4p4cAj32mu5zjsBHmUP7eTym87K4JxgRX2
         YxZU/O4Yk0gavtw+Y85/p1Wy9cgY6oJzGNt3tiVuzbBx1FAeOcOaO03OvSY/hYxvDznX
         2BsTOJYTxtmInYlfuGEvM6Rk7nBDI3ByUCZ2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729591835; x=1730196635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYXPGw1U0OFZ1dEh+x0cloBQ3vRFUK2rGGbM+Gy0GWc=;
        b=cQfKk2FVs5vwoklX80ryqWkzf4dqMg+5vaYKzM1SMlWCaRNYi18qdu/oWJ3RuZBymt
         ppAfVa8Na7qFYCMsELBJaOmu+4cnS25XCsD1YLhG9DyvThxDtp9DJ/+J4yWzaBuZENxU
         Fh5ubetI/rZbwIKWjdkhrNNj0vv10Pdf0VWtvjC6of2YnkjonTH12FqFWjICt4WnRGby
         x0jfAuaiqMhUk6NTq2x/lbGUYIzR3+V2piBB/k+kBVP9wIjRnPde6xh/95+HBMbNIwmu
         maXRee6deEwvT3vBWkzIkwRcess99RsogjITYw94rF3f6csl4e/HoGB3gskRjZ1xpjnh
         s6Cg==
X-Gm-Message-State: AOJu0YxB9Q1biwEtkLTxdkQhWbLgd3VVk3h1KsCqH53riHz+EGLq2gRK
	bMLIh6rjvXXzFCapjlfqopTR5puttBKTQ0szovmiWRLZr+4rBfW7ig5w0UxEYRiO6MvkWTXiHEI
	T7a4=
X-Google-Smtp-Source: AGHT+IGdS3ZoHMXbmw0Hhd/MsrbA0KpU/MrljsWGlZcFPFKZscWl27dVOax1RyjvNy7k7Xvb7L5mjQ==
X-Received: by 2002:a17:907:1c2a:b0:a99:4261:e9f7 with SMTP id a640c23a62f3a-a9a69b84f55mr1240379266b.39.1729591835371;
        Tue, 22 Oct 2024 03:10:35 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
X-Google-Original-From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
To: xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/1] NUMA: Introduce NODE_DATA->node_present_pages(RAM pages)
Date: Tue, 22 Oct 2024 12:10:29 +0200
Message-ID: <20241022101029.967911-1-bernhardkaindl7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bernhard Kaindl <bernhard.kaindl@cloud.com>

Some admin tools like 'xl info -n' like to display the total memory
for each NUMA node. The Xen backend[1] of hwloc comes to mind too.

The total amount of RAM on a NUMA node is not needed by Xen internally:
Xen only uses NODE_DATA->node_spanned_pages, but that can be confusing
for users as it includes memory holes (can be as large as 2GB on x86).

Calculate the RAM per NUMA node by iterating over arch_get_ram_range()
which returns the e820 RAM entries on x86 and update it on memory_add().

Use NODE_DATA->node_present_pages (like in the Linux kernel) to hold
this info and in a later commit, find a way for tools to read it.

[1] hwloc with Xen backend: https://github.com/xenserver-next/hwloc/

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
Changes in v2:
- Remove update of numainfo call, only calculate RAM for each node.
- Calculate RAM based on page boundaries, coding style fixes
Changes in v3:
- Use PFN_UP/DOWN, refactored further to simplify the code, while leaving
  compiler-level optimisations to the compiler's optimisation passes.
---
 xen/arch/x86/x86_64/mm.c |  3 +++
 xen/common/numa.c        | 31 ++++++++++++++++++++++++++++---
 xen/include/xen/numa.h   |  3 +++
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b2a280fba3..66b9bed057 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1334,6 +1334,9 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     share_hotadd_m2p_table(&info);
     transfer_pages_to_heap(&info);
 
+    /* Update the node's present pages (like the total_pages of the system) */
+    NODE_DATA(node)->node_present_pages += epfn - spfn;
+
     return 0;
 
 destroy_m2p:
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 28a09766fa..374132df08 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -4,6 +4,7 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */
 
+#include "xen/pfn.h"
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/mm.h>
@@ -499,15 +500,39 @@ int __init compute_hash_shift(const struct node *nodes,
     return shift;
 }
 
-/* Initialize NODE_DATA given nodeid and start/end */
+/**
+ * @brief Initialize a NUMA node's NODE_DATA given nodeid and start/end addrs.
+ *
+ * This function sets up the boot memory for a given NUMA node by calculating
+ * the node's start and end page frame numbers (PFNs) and determining
+ * the number of present RAM pages within the node's memory range.
+ *
+ * @param nodeid The identifier of the node to initialize.
+ * @param start The starting physical address of the node's memory range.
+ * @param end The ending physical address of the node's memory range.
+ */
 void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
 {
     unsigned long start_pfn = paddr_to_pfn(start);
     unsigned long end_pfn = paddr_to_pfn(end);
+    struct node_data *numa_node = NODE_DATA(nodeid);
+    paddr_t start_ram, end_ram;
+    unsigned long pages = 0;
+    unsigned int idx = 0;
+    int err;
 
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+    numa_node->node_start_pfn = start_pfn;
+    numa_node->node_spanned_pages = end_pfn - start_pfn;
 
+    /* Calculate the number of present RAM pages within the node: */
+    while ( (err = arch_get_ram_range(idx++, &start_ram, &end_ram)) != -ENOENT )
+    {
+        if ( err || start_ram >= end || end_ram <= start )
+            continue;  /* Not RAM (err != 0) or range is outside the node */
+
+        pages += PFN_DOWN(min(end_ram, end)) - PFN_UP(max(start_ram, start));
+    }
+    numa_node->node_present_pages = pages;
     node_set_online(nodeid);
 }
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index fd1511a6fb..c860f3ad1c 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -71,6 +71,7 @@ extern nodeid_t *memnodemap;
 struct node_data {
     unsigned long node_start_pfn;
     unsigned long node_spanned_pages;
+    unsigned long node_present_pages;
 };
 
 extern struct node_data node_data[];
@@ -91,6 +92,7 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
 #define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_present_pages(nid) (NODE_DATA(nid)->node_present_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
@@ -123,6 +125,7 @@ extern void numa_set_processor_nodes_parsed(nodeid_t node);
 extern mfn_t first_valid_mfn;
 
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_present_pages(nid) total_pages
 #define node_start_pfn(nid) mfn_x(first_valid_mfn)
 #define __node_distance(a, b) 20
 
-- 
2.43.0


