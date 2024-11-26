Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314149D9FA1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844052.1259626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tn-0000zd-Jc; Tue, 26 Nov 2024 23:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844052.1259626; Tue, 26 Nov 2024 23:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tn-0000mE-EG; Tue, 26 Nov 2024 23:23:15 +0000
Received: by outflank-mailman (input) for mailman id 844052;
 Tue, 26 Nov 2024 23:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4se-0000At-CO
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:04 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae27bca-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:21:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E9453A41665;
 Tue, 26 Nov 2024 23:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E98C4CED7;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4A42ED66B84;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
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
X-Inumbo-ID: 3ae27bca-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNhZTI3YmNhLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzE3Ljk3MDI5MSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=hhpepZyC6+B98tKRYu7FEASFfIF/3/TSsCfLQMcZ32A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qnzUmTBBnyPw/PBcHJlWArvKyI3BqwPBho6sr0Ljp4rDl716NfDn4W/kR5sa24HeN
	 LfQqL14pYIaW5oKjKa+2wWEQQqLcYQJUaxaX8lFThkeZ4wfrVxqa8riVBoZ+pmXa6G
	 e5DZ+xsajgVkEYhLPPHs2zODp10ZEE9ocsKEsGSx6CBmZRBLJ21xSFiBVJotMKDIci
	 GjXijXXt4ITNwNyav8sKH8kwvnJ4lMB8dPxNL0+/muqV+4hLhgFyb840SKGcF4PKV6
	 WL+APewHdNypUEBBSXUA/yv5fEa67mtK4tUfX8LirE2kXWxb5ury8wvshCHtOYW/jy
	 SbzrPLNILgJtQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:21:53 -0800
Subject: [PATCH 03/36] xen: introduce resource.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-3-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=4665;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=Q8GpN19knhkzccfTAV4prViqD1gvBrGqV7AxMvPxGlg=;
 b=R204wyNJVDFwtxunVQ6uTri4iQAm0/nHG/UG64/jv9N7oGTk83gB3DKrDKESdQQu1IVN9xlm7
 3k8U0eTtjb9DPHLtDbGKT5MQ/HAPZ4KbuEtGVkcnzKJn04P8qSywJYz
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



