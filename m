Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886667F0AB9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636376.991838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRu-0004AK-QH; Mon, 20 Nov 2023 02:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636376.991838; Mon, 20 Nov 2023 02:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRu-000479-Jh; Mon, 20 Nov 2023 02:55:46 +0000
Received: by outflank-mailman (input) for mailman id 636376;
 Mon, 20 Nov 2023 02:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRX-00081B-1U
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3f039905-8750-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 03:55:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9773E1042;
 Sun, 19 Nov 2023 18:56:07 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F2F0F3F6C4;
 Sun, 19 Nov 2023 18:55:18 -0800 (PST)
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
X-Inumbo-ID: 3f039905-8750-11ee-98df-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 09/17] xen/arm: introduce a helper to parse device tree NUMA distance map
Date: Mon, 20 Nov 2023 10:54:23 +0800
Message-Id: <20231120025431.14845-10-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

A NUMA aware device tree will provide a "distance-map" node to
describe distance between any two nodes. This patch introduce a
new helper to parse this distance map.

Note that, since the NUMA device tree binding does not explicitly
specify the range of valid node distance, hence rather than
rejecting node distance values >= 0xff, saturate the distance at
0xfe, while keeping 0xff for NUMA_NO_DISTANCE, so overall we can
keep things consistent with ACPI.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5 -> v6:
- Rebase on top of staging without code changes.
v1 -> v5:
- Fix coding style (printk variable type and label indented) and
  in-code comment.
- Check the from/to range to avoid the side-effect of the 8-bit
  truncation by numa_set_distance().
- The distance map default value is now NUMA_NO_DISTANCE, update
  the logic accordingly and add in-code comment as a note.
- Get rid of useless braces.
- Use new NUMA status helper.
- Use PRIu32 to replace u in print messages.
- Fix opposite = __node_distance(to, from).
- disable dtb numa info table when we find an invalid data in dtb.
---
 xen/arch/arm/numa-dt.c | 116 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/xen/arch/arm/numa-dt.c b/xen/arch/arm/numa-dt.c
index cebc7e4300..2fb6663e08 100644
--- a/xen/arch/arm/numa-dt.c
+++ b/xen/arch/arm/numa-dt.c
@@ -151,3 +151,119 @@ static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
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
+
+        if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+        {
+            printk(XENLOG_WARNING "NUMA: invalid nodes: from=%u to=%u MAX=%u\n",
+                   from, to, MAX_NUMNODES);
+            goto invalid_data;
+        }
+
+        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
+             (from != to && distance <= NUMA_LOCAL_DISTANCE) )
+        {
+            printk(XENLOG_WARNING
+                   "NUMA: Invalid distance: NODE#%u->NODE#%u:%u\n",
+                   from, to, distance);
+            goto invalid_data;
+        }
+
+        printk(XENLOG_INFO "NUMA: distance: NODE#%u->NODE#%u:%u\n",
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
+                 * is it the special case that they hijack the device tree
+                 * to support their rare machines?
+                 */
+                printk(XENLOG_WARNING
+                       "Un-matched bi-direction! NODE#%u->NODE#%u:%u, NODE#%u->NODE#%u:%u\n",
+                       from, to, distance, to, from, opposite);
+            }
+
+            /* Opposite way distance was set before, just set this way */
+            numa_set_distance(from, to, distance);
+        }
+    }
+
+    return 0;
+
+ invalid_data:
+    numa_fw_bad();
+    return -EINVAL;
+}
-- 
2.25.1


