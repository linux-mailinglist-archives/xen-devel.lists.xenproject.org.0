Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54923A2D16C
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 00:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884130.1293931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXgB-0003RF-2R; Fri, 07 Feb 2025 23:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884130.1293931; Fri, 07 Feb 2025 23:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgXgA-0003Pn-VO; Fri, 07 Feb 2025 23:22:34 +0000
Received: by outflank-mailman (input) for mailman id 884130;
 Fri, 07 Feb 2025 23:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vKp5=U6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tgXg9-0003Pg-0c
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 23:22:34 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67133701-e5aa-11ef-a073-877d107080fb;
 Sat, 08 Feb 2025 00:22:31 +0100 (CET)
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
X-Inumbo-ID: 67133701-e5aa-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738970549; x=1739229749;
	bh=FTKnzHbiPIj+L145W6EcEVqGw4PZUlQIUKbhhmHY2sc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=bYeqcsZLVgdu2A38/U90aarkxVoxwaZvi3mOoBQzrlCloizj0bwaQnEV9VLpY1jFI
	 wX1593RBQckzouQGX2XHHgu54xitGr9yw3hZlJDtbP7ie85TnXamE44SVVvXXk1PBZ
	 xtoLvMhyw3+5WUZoZbKeBzpj7X8AyDgmIgrU1/jH/xOrmfJ+QxS4QqQIJ1D/aQLLip
	 1cPTFsm37war3quRZmh0al6tTtY5gy87Zs4PFOEY1Uk9ncArSRKzG1lhRvZbZuB0QI
	 lup7kMPPvg8sxi54dtBwx5gVFSDc70yc3FQL+g/lxO6ME4p4yb1rPEtbv/RIRWMfok
	 vmo0H2mcNrG7Q==
Date: Fri, 07 Feb 2025 23:22:22 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/include: introduce resource.h
Message-ID: <20250207231814.3863449-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dd9e7f15f9d72693d67206d41a1587b24c5bdd56
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Move resource definitions to a new architecture-agnostic shared header file=
.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Link to the original patch:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-18-c5d36b31=
d66c@ford.com/
---
---
 xen/common/device-tree/device-tree.c | 21 +----------------
 xen/drivers/passthrough/arm/smmu.c   | 15 +-----------
 xen/include/xen/resource.h           | 34 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 34 deletions(-)
 create mode 100644 xen/include/xen/resource.h

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index d0528c5825..e8f810b2fe 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -24,6 +24,7 @@
 #include <xen/ctype.h>
 #include <asm/setup.h>
 #include <xen/err.h>
+#include <xen/resource.h>
=20
 const void *device_tree_flattened;
 dt_irq_xlate_func dt_irq_xlate;
@@ -535,26 +536,6 @@ int dt_child_n_size_cells(const struct dt_device_node =
*parent)
     return __dt_n_size_cells(parent, true);
 }
=20
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
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 03d22bce1e..aa6a968b57 100644
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
 #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pn=
ame, out))
 #define of_property_read_bool dt_property_read_bool
 #define of_parse_phandle_with_args dt_parse_phandle_with_args
-
-/* Xen: Helpers to get device MMIO and IRQs */
-struct resource
-{
-=09paddr_t addr;
-=09paddr_t size;
-=09unsigned int type;
-};
-
-#define resource_size(res) (res)->size;
-
 #define platform_device dt_device_node
=20
-#define IORESOURCE_MEM 0
-#define IORESOURCE_IRQ 1
-
 static struct resource *platform_get_resource(struct platform_device *pdev=
,
 =09=09=09=09=09      unsigned int type,
 =09=09=09=09=09      unsigned int num)
diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
new file mode 100644
index 0000000000..5d10363128
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
+#define IORESOURCE_UNKNOWN      (~0U)
+
+struct resource {
+    paddr_t addr;
+    paddr_t size;
+    unsigned int type;
+};
+
+#define resource_size(res)      ((res)->size)
+
+#endif /* XEN__RESOURCE_H */
--=20
2.34.1



