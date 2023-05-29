Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6217141F0
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 04:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540434.842183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3SU2-0005zv-Dg; Mon, 29 May 2023 02:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540434.842183; Mon, 29 May 2023 02:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3SU2-0005xm-AM; Mon, 29 May 2023 02:19:42 +0000
Received: by outflank-mailman (input) for mailman id 540434;
 Mon, 29 May 2023 02:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x08u=BS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q3SU1-0005T2-FR
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 02:19:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4433fca7-fdc7-11ed-b231-6b7b168915f2;
 Mon, 29 May 2023 04:19:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10EC0139F;
 Sun, 28 May 2023 19:20:25 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75E293F64C;
 Sun, 28 May 2023 19:19:37 -0700 (PDT)
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
X-Inumbo-ID: 4433fca7-fdc7-11ed-b231-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 02/17] xen/arm: implement helpers to get and update NUMA status
Date: Mon, 29 May 2023 10:19:06 +0800
Message-Id: <20230529021921.2606623-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529021921.2606623-1-Henry.Wang@arm.com>
References: <20230529021921.2606623-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

NUMA has one global and one implementation specific switches. For
ACPI NUMA implementation, Xen has acpi_numa, so we introduce
device_tree_numa for device tree NUMA implementation. And use
enumerations to indicate init, off and on status.

arch_numa_disabled will get device_tree_numa status, but for
arch_numa_setup we have not provided boot arguments to setup
device_tree_numa. So we just return -EINVAL in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. Rename the first entry of enum dt_numa_status as DT_NUMA_DEFAULT.
2. Make enum dt_numa_status device_tree_numa as __ro_after_init and
   assign it explicitly to DT_NUMA_DEFAULT.
3. Update the year in copyright to 2023.
4. Don't move the x86 numa_disabled() and make Arm's numa_disabled()
   a static inline function for !CONFIG_NUMA.
v1 -> v2:
1. Use arch_numa_disabled to replace numa_enable_with_firmware.
2. Introduce enumerations for device tree numa status.
3. Use common numa_disabled, drop Arm version numa_disabled.
4. Introduce arch_numa_setup for Arm.
5. Rename bad_srat to numa_bad.
6. Add numa_enable_with_firmware helper.
7. Add numa_disabled helper.
8. Refine commit message.
---
 xen/arch/arm/include/asm/numa.h | 17 +++++++++++
 xen/arch/arm/numa.c             | 50 +++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 7d6ae36a19..83f60ad05b 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -22,6 +22,8 @@ typedef u8 nodeid_t;
  */
 #define NR_NODE_MEMBLKS NR_MEM_BANKS
 
+extern bool numa_disabled(void);
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
@@ -39,6 +41,21 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+static inline bool numa_disabled(void)
+{
+    return true;
+}
+
+static inline bool arch_numa_unavailable(void)
+{
+    return true;
+}
+
+static inline bool arch_numa_broken(void)
+{
+    return true;
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
new file mode 100644
index 0000000000..eb5d0632cb
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Arm Architecture support layer for NUMA.
+ *
+ * Copyright (C) 2023 Arm Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/numa.h>
+
+enum dt_numa_status {
+    DT_NUMA_DEFAULT,
+    DT_NUMA_ON,
+    DT_NUMA_OFF,
+};
+
+static enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
+
+void __init numa_fw_bad(void)
+{
+    printk(KERN_ERR "NUMA: device tree numa info table not used.\n");
+    device_tree_numa = DT_NUMA_OFF;
+}
+
+bool __init arch_numa_unavailable(void)
+{
+    return device_tree_numa != DT_NUMA_ON;
+}
+
+bool arch_numa_disabled(void)
+{
+    return device_tree_numa == DT_NUMA_OFF;
+}
+
+int __init arch_numa_setup(const char *opt)
+{
+    return -EINVAL;
+}
-- 
2.25.1


