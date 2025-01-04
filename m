Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DAA011AF
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864882.1276172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtTN-0003MG-D0; Sat, 04 Jan 2025 02:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864882.1276172; Sat, 04 Jan 2025 02:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtTN-0003JN-84; Sat, 04 Jan 2025 02:01:05 +0000
Received: by outflank-mailman (input) for mailman id 864882;
 Sat, 04 Jan 2025 02:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQt-0005Ax-Sy
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e823437-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5B9F5C6378;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC5DAC4CEDE;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B72ABE77199;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5e823437-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=pZ5j5wlBPTG0Ro4TQWWchJcQ0lQWJtDiDgixm3j4y6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sb8BufUAfvJHF+HrR1YXHs6FJn2FKtHyqwvGAO49pNVSOb0IEFVaKR1y6va1Rly1U
	 E/skfQ/W9Enf/posXj8Bnq/Bmgywh3KWM0CwDIQZBM4+CO5tNEFfSaTUaqsCR0+Ysr
	 RHKLAvZuMvInx1xqFKhj1mi7MZwtgdx0RtMRiCsEQNGQAOWThAysUULKCbZOrMFmSM
	 I0tPlQr2U1x6DCoYakTWNxEA9NTWi3elpMpbfNnxYMB8f4cKKBe/twOGsws5KvTjhr
	 dA9WdxhyLULlI0Lt3NdDjEoj31sUM8h3+mfMOYSlQtlKdOXpYxo6ULIljvRrNO+TLO
	 t45fQV88ThCeg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:24 -0800
Subject: [PATCH v3 18/24] xen/include: introduce resource.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-18-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=4529;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=/P+5vP8U8ti5w5xPLZtVwxfiABIGoHWoOC2zq7CuRN4=;
 b=FQXcMfLgv4oy0lSh4nZAJJfZwlJFq4kmqFTwWUf1GKQJhh19eTVM2pPOzhN85YG6ZA/bi410l
 y/VJ3oanYN0A5a4cG4PypCJds9z7yDwWwR35ly14MCgXf/rH3H7TbzZ
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Move common resource definitions to a new architecture-agnostic shared header
file.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
It will be used in follow on NS8250 emulator code to describe legacy
PC COM resources.
---
---
 xen/common/device-tree/device-tree.c | 21 +--------------------
 xen/drivers/passthrough/arm/smmu.c   | 15 +--------------
 xen/include/xen/resource.h           | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 34 deletions(-)

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
index 0000000000000000000000000000000000000000..4512658133defe8dc62d87192ffd19ad94b63c3b
--- /dev/null
+++ b/xen/include/xen/resource.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * System resource description.
+ */
+#ifndef XEN__RESOURCE_H
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
+#define IORESOURCE_UNKNOWN      ( ~0U )
+
+struct resource {
+    paddr_t addr;
+    paddr_t size;
+    unsigned int type;
+};
+
+#define resource_size(res)      ( (res)->size )
+
+#endif /* XEN__RESOURCE_H */

-- 
2.34.1



