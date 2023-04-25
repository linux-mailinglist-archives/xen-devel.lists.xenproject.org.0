Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2616EDD71
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 09:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525783.817241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDZo-0001ru-At; Tue, 25 Apr 2023 07:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525783.817241; Tue, 25 Apr 2023 07:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDZo-0001pl-5W; Tue, 25 Apr 2023 07:59:04 +0000
Received: by outflank-mailman (input) for mailman id 525783;
 Tue, 25 Apr 2023 07:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prDYU-00053E-1l
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 07:57:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id da1d13b8-e33e-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 09:57:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18621D75;
 Tue, 25 Apr 2023 00:58:24 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C25383F587;
 Tue, 25 Apr 2023 00:57:37 -0700 (PDT)
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
X-Inumbo-ID: da1d13b8-e33e-11ed-b223-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree NUMA distance map
Date: Tue, 25 Apr 2023 15:56:47 +0800
Message-Id: <20230425075655.4037980-10-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230425075655.4037980-1-Henry.Wang@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

A NUMA aware device tree will provide a "distance-map" node to
describe distance between any two nodes. This patch introduce a
new helper to parse this distance map.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v3 -> v4:
1. The distance map default value is now NUMA_NO_DISTANCE, update
   the logic accordingly and add in-code comment as a note.
v2 -> v3:
1. No change.
v1 -> v2:
1. Get rid of useless braces.
2. Use new NUMA status helper.
3. Use PRIu32 to replace u in print messages.
4. Fix opposite = __node_distance(to, from).
5. disable dtb numa info table when we find an invalid data
   in dtb.
---
 xen/arch/arm/numa_device_tree.c | 108 ++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 38f5e93d1d..9d9d09273e 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -151,3 +151,111 @@ invalid_data:
     numa_fw_bad();
     return -EINVAL;
 }
+
+/* Parse NUMA distance map v1 */
+static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
+{
+    const struct fdt_property *prop;
+    const __be32 *matrix;
+    unsigned int i, entry_count;
+    int len;
+
+    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "NUMA: No distance-matrix property in distance-map\n");
+        goto invalid_data;
+    }
+
+    if ( len % sizeof(__be32) != 0 )
+    {
+        printk(XENLOG_WARNING
+               "distance-matrix in node is not a multiple of u32\n");
+        goto invalid_data;
+    }
+
+    entry_count = len / sizeof(__be32);
+    if ( entry_count == 0 )
+    {
+        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
+        goto invalid_data;
+    }
+
+    matrix = (const __be32 *)prop->data;
+    for ( i = 0; i + 2 < entry_count; i += 3 )
+    {
+        unsigned int from, to, distance, opposite;
+
+        from = dt_next_cell(1, &matrix);
+        to = dt_next_cell(1, &matrix);
+        distance = dt_next_cell(1, &matrix);
+        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
+             (from != to && distance <= NUMA_LOCAL_DISTANCE) )
+        {
+            printk(XENLOG_WARNING
+                   "NUMA: Invalid distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
+                   from, to, distance);
+            goto invalid_data;
+        }
+
+        printk(XENLOG_INFO "NUMA: distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
+               from, to, distance);
+
+        /* Get opposite way distance */
+        opposite = __node_distance(to, from);
+        /* The default value in node_distance_map is NUMA_NO_DISTANCE */
+        if ( opposite == NUMA_NO_DISTANCE )
+        {
+            /* Bi-directions are not set, set both */
+            numa_set_distance(from, to, distance);
+            numa_set_distance(to, from, distance);
+        }
+        else
+        {
+            /*
+             * Opposite way distance has been set to a different value.
+             * It may be a firmware device tree bug?
+             */
+            if ( opposite != distance )
+            {
+                /*
+                 * In device tree NUMA distance-matrix binding:
+                 * https://www.kernel.org/doc/Documentation/devicetree/bindings/numa.txt
+                 * There is a notes mentions:
+                 * "Each entry represents distance from first node to
+                 *  second node. The distances are equal in either
+                 *  direction."
+                 *
+                 * That means device tree doesn't permit this case.
+                 * But in ACPI spec, it cares to specifically permit this
+                 * case:
+                 * "Except for the relative distance from a System Locality
+                 *  to itself, each relative distance is stored twice in the
+                 *  matrix. This provides the capability to describe the
+                 *  scenario where the relative distances for the two
+                 *  directions between System Localities is different."
+                 *
+                 * That means a real machine allows such NUMA configuration.
+                 * So, place a WARNING here to notice system administrators,
+                 * is it the specail case that they hijack the device tree
+                 * to support their rare machines?
+                 */
+                printk(XENLOG_WARNING
+                       "Un-matched bi-direction! NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32", NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
+                       from, to, distance, to, from, opposite);
+            }
+
+            /* Opposite way distance has been set, just set this way */
+            numa_set_distance(from, to, distance);
+        }
+    }
+
+    return 0;
+
+invalid_data:
+    numa_fw_bad();
+    return -EINVAL;
+}
-- 
2.25.1


