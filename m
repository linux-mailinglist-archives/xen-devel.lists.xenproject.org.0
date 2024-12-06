Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490DE9E665F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849412.1264046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9y-0005HF-GO; Fri, 06 Dec 2024 04:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849412.1264046; Fri, 06 Dec 2024 04:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9y-00058M-2y; Fri, 06 Dec 2024 04:41:46 +0000
Received: by outflank-mailman (input) for mailman id 849412;
 Fri, 06 Dec 2024 04:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9v-0004Ka-Li
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 617d6426-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01D9E5C72FC;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71ACCC4CEDD;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5CBE77171;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 617d6426-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=hhpepZyC6+B98tKRYu7FEASFfIF/3/TSsCfLQMcZ32A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FgEft6ym49ftHh+ywRhew+yV7ooUsjJ9GgX7qlng7oFqZExFwgdQbJ3OZGbP2k1o8
	 hqWhBr48KvJajYXUC7s9kLqnORDaBpK0U5DsgE2yh8EUwvu7IWA4n9vf4y8pVWeHuL
	 X0CNBMStmy163XE1QJQFbGSxnnzsiXE71hONAyET4ME7Jkfu4Y5PxY9DYQZi3ceIlX
	 DUpDL78EXSQQxAzrVuEnY8ntTxHi4qhT0SXyQi334r+gmzvcqqV1ccgWwUuMKyjk+o
	 Pf3N/SWiluN7VWPNThRC5ZB/bZ7FQAaFJaZWxzOL40fb6RU3SYMUULqSO3AtNoUJbS
	 6BhwXmARPGSWg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:31 -0800
Subject: [PATCH v2 01/35] xen: introduce resource.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=4665;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=Q8GpN19knhkzccfTAV4prViqD1gvBrGqV7AxMvPxGlg=;
 b=pLKcxFd8odpX59gNXWYl0zBIJnHXlKMAZidA2yu9BapqleSET916m7mHU6Mvl0DNg3hQZIYM4
 LVm76T+Dh3WCEayzQHVnI0ba7CbQu+O/yHEdwB8NsPJgJQ3XptYWOIA
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Move resource definitions to a new architecture-agnostic shared header file.

It will be used in follow on NS8250 emulator code to describe legacy
PC COM resources.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/device-tree/device-tree.c | 21 +------------------
 xen/drivers/passthrough/arm/smmu.c   | 15 +-------------
 xen/include/xen/resource.h           | 40 ++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index d0528c5825651f7cc9ebca0c949229c9083063c6..e8f810b2fe10890c033ed3a9d4ca627010ad019b 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -24,6 +24,7 @@
 #include <xen/ctype.h>
 #include <asm/setup.h>
 #include <xen/err.h>
+#include <xen/resource.h>
 
 const void *device_tree_flattened;
 dt_irq_xlate_func dt_irq_xlate;
@@ -535,26 +536,6 @@ int dt_child_n_size_cells(const struct dt_device_node *parent)
     return __dt_n_size_cells(parent, true);
 }
 
-/*
- * These are defined in Linux where much of this code comes from, but
- * are currently unused outside this file in the context of Xen.
- */
-#define IORESOURCE_BITS         0x000000ff      /* Bus-specific bits */
-
-#define IORESOURCE_TYPE_BITS    0x00001f00      /* Resource type */
-#define IORESOURCE_IO           0x00000100      /* PCI/ISA I/O ports */
-#define IORESOURCE_MEM          0x00000200
-#define IORESOURCE_REG          0x00000300      /* Register offsets */
-#define IORESOURCE_IRQ          0x00000400
-#define IORESOURCE_DMA          0x00000800
-#define IORESOURCE_BUS          0x00001000
-
-#define IORESOURCE_PREFETCH     0x00002000      /* No side effects */
-#define IORESOURCE_READONLY     0x00004000
-#define IORESOURCE_CACHEABLE    0x00008000
-#define IORESOURCE_RANGELENGTH  0x00010000
-#define IORESOURCE_SHADOWABLE   0x00020000
-
 /*
  * Default translator (generic bus)
  */
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 03d22bce1e497e41834c273f9048b98dcbd48a54..aa6a968b574dce7cc753e8070fad3a6e585cd9e7 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -50,6 +50,7 @@
 #include <xen/rbtree.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
+#include <xen/resource.h>
 #include <asm/atomic.h>
 #include <asm/device.h>
 #include <asm/io.h>
@@ -70,22 +71,8 @@
 #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
 #define of_property_read_bool dt_property_read_bool
 #define of_parse_phandle_with_args dt_parse_phandle_with_args
-
-/* Xen: Helpers to get device MMIO and IRQs */
-struct resource
-{
-	paddr_t addr;
-	paddr_t size;
-	unsigned int type;
-};
-
-#define resource_size(res) (res)->size;
-
 #define platform_device dt_device_node
 
-#define IORESOURCE_MEM 0
-#define IORESOURCE_IRQ 1
-
 static struct resource *platform_get_resource(struct platform_device *pdev,
 					      unsigned int type,
 					      unsigned int num)
diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
new file mode 100644
index 0000000000000000000000000000000000000000..4962e17da8387b7f324317482b19cc9fe71433fc
--- /dev/null
+++ b/xen/include/xen/resource.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * System resource description.
+ *
+ * Reference:
+ *   include/linux/ioport.h
+ */
+#if !defined(XEN__RESOURCE_H)
+#define XEN__RESOURCE_H
+
+#define IORESOURCE_BITS         0x000000FFU      /* Bus-specific bits */
+
+#define IORESOURCE_TYPE_BITS    0x00001F00U      /* Resource type */
+#define IORESOURCE_IO           0x00000100U      /* PCI/ISA I/O ports */
+#define IORESOURCE_MEM          0x00000200U
+#define IORESOURCE_REG          0x00000300U      /* Register offsets */
+#define IORESOURCE_IRQ          0x00000400U
+#define IORESOURCE_DMA          0x00000800U
+#define IORESOURCE_BUS          0x00001000U
+
+#define IORESOURCE_PREFETCH     0x00002000U      /* No side effects */
+#define IORESOURCE_READONLY     0x00004000U
+#define IORESOURCE_CACHEABLE    0x00008000U
+#define IORESOURCE_RANGELENGTH  0x00010000U
+#define IORESOURCE_SHADOWABLE   0x00020000U
+
+#define IORESOURCE_UNKNOWN      (~0U)
+
+struct resource {
+    paddr_t addr;
+    paddr_t size;
+    unsigned int type;
+};
+
+#define resource_size(res) (res)->size;
+
+#define foreach_resource(res) \
+    for (; res && res->type != IORESOURCE_UNKNOWN; res++)
+
+#endif /* #if !defined(XEN__RESOURCE_H) */

-- 
2.34.1



