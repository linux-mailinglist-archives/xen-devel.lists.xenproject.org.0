Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A47F0AB0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636353.991748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uR4-0007n2-Ts; Mon, 20 Nov 2023 02:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636353.991748; Mon, 20 Nov 2023 02:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uR4-0007lC-Pu; Mon, 20 Nov 2023 02:54:54 +0000
Received: by outflank-mailman (input) for mailman id 636353;
 Mon, 20 Nov 2023 02:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uR3-0007WE-M1
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:54:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2d04534a-8750-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 03:54:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FDB61042;
 Sun, 19 Nov 2023 18:55:37 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D254F3F6C4;
 Sun, 19 Nov 2023 18:54:47 -0800 (PST)
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
X-Inumbo-ID: 2d04534a-8750-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 01/17] xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
Date: Mon, 20 Nov 2023 10:54:15 +0800
Message-Id: <20231120025431.14845-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

As a memory range described in device tree cannot be split across
multiple nodes. And it is very likely than if you have more than
64 nodes, you may need a lot more than 2 regions per node. So the
default NR_NODE_MEMBLKS value (MAX_NUMNODES * 2) makes no sense
on Arm.

So, for Arm, we would just define NR_NODE_MEMBLKS as an alias to
NR_MEM_BANKS. And in the future NR_MEM_BANKS will be user-configurable
via kconfig, but for now leave NR_MEM_BANKS as 128 on Arm. This
avoids having different way to define the value based NUMA vs non-NUMA.

Further discussions can be found here[1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg02322.html

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v6:
- Rebase on top of staging without code changes
---
 xen/arch/arm/include/asm/numa.h | 19 ++++++++++++++++++-
 xen/include/xen/numa.h          |  9 +++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e2bee2bd82..7d6ae36a19 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -3,9 +3,26 @@
 
 #include <xen/mm.h>
 
+#include <asm/setup.h>
+
 typedef u8 nodeid_t;
 
-#ifndef CONFIG_NUMA
+#ifdef CONFIG_NUMA
+
+/*
+ * It is very likely that if you have more than 64 nodes, you may
+ * need a lot more than 2 regions per node. So, for Arm, we would
+ * just define NR_NODE_MEMBLKS as an alias to NR_MEM_BANKS.
+ * And in the future NR_MEM_BANKS will be bumped for new platforms,
+ * but for now leave NR_MEM_BANKS as it is on Arm. This avoid to
+ * have different way to define the value based NUMA vs non-NUMA.
+ *
+ * Further discussions can be found here:
+ * https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg02322.html
+ */
+#define NR_NODE_MEMBLKS NR_MEM_BANKS
+
+#else
 
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 287e81ff66..3e215db1ca 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -13,7 +13,16 @@
 #define MAX_NUMNODES 1
 #endif
 
+/*
+ * Some architectures may have different considerations for
+ * number of node memory blocks. They can define their
+ * NR_NODE_MEMBLKS in asm/numa.h to reflect their architectural
+ * implementation. If the arch does not have specific implementation,
+ * the following default NR_NODE_MEMBLKS will be used.
+ */
+#ifndef NR_NODE_MEMBLKS
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
+#endif
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


