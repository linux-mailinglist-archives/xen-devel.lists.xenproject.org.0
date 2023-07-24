Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6E75EDF3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568496.887847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNr70-0004c1-Oh; Mon, 24 Jul 2023 08:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568496.887847; Mon, 24 Jul 2023 08:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNr70-0004Yk-Kx; Mon, 24 Jul 2023 08:40:14 +0000
Received: by outflank-mailman (input) for mailman id 568496;
 Mon, 24 Jul 2023 08:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixEc=DK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qNr6z-0004Ye-3y
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:40:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a58172-29fd-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:40:08 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.162.140.144])
 by support.bugseng.com (Postfix) with ESMTPSA id EFA724EE0737;
 Mon, 24 Jul 2023 10:40:09 +0200 (CEST)
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
X-Inumbo-ID: b1a58172-29fd-11ee-8612-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2] device_tree: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Mon, 24 Jul 2023 10:40:02 +0200
Message-Id: <502a92e9b53960a6b78fabb48d354cbb5bc1750c.1690187572.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus addressing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - improved consistency in parameter renaming.
---
 xen/common/device_tree.c      | 24 ++++++++++++------------
 xen/include/xen/device_tree.h | 16 ++++++++--------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0677193ab3..d52531dc9f 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -85,11 +85,11 @@ struct dt_bus
     unsigned int (*get_flags)(const __be32 *addr);
 };
 
-void dt_get_range(const __be32 **cell, const struct dt_device_node *np,
+void dt_get_range(const __be32 **cellp, const struct dt_device_node *np,
                   u64 *address, u64 *size)
 {
-    *address = dt_next_cell(dt_n_addr_cells(np), cell);
-    *size = dt_next_cell(dt_n_size_cells(np), cell);
+    *address = dt_next_cell(dt_n_addr_cells(np), cellp);
+    *size = dt_next_cell(dt_n_size_cells(np), cellp);
 }
 
 void dt_set_cell(__be32 **cellp, int size, u64 val)
@@ -993,9 +993,9 @@ int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
 }
 
 int dt_for_each_range(const struct dt_device_node *dev,
-                      int (*cb)(const struct dt_device_node *,
+                      int (*cb)(const struct dt_device_node *dev,
                                 uint64_t addr, uint64_t length,
-                                void *),
+                                void *data),
                       void *data)
 {
     const struct dt_device_node *parent = NULL;
@@ -1164,7 +1164,7 @@ unsigned int dt_number_of_irq(const struct dt_device_node *device)
     return (intlen / intsize);
 }
 
-unsigned int dt_number_of_address(const struct dt_device_node *dev)
+unsigned int dt_number_of_address(const struct dt_device_node *device)
 {
     const __be32 *prop;
     u32 psize;
@@ -1173,20 +1173,20 @@ unsigned int dt_number_of_address(const struct dt_device_node *dev)
     int onesize, na, ns;
 
     /* Get parent & match bus type */
-    parent = dt_get_parent(dev);
+    parent = dt_get_parent(device);
     if ( parent == NULL )
         return 0;
 
     bus = dt_match_bus(parent);
     if ( !bus )
         return 0;
-    bus->count_cells(dev, &na, &ns);
+    bus->count_cells(device, &na, &ns);
 
     if ( !DT_CHECK_COUNTS(na, ns) )
         return 0;
 
     /* Get "reg" or "assigned-addresses" property */
-    prop = dt_get_property(dev, bus->addresses, &psize);
+    prop = dt_get_property(device, bus->addresses, &psize);
     if ( prop == NULL )
         return 0;
 
@@ -1197,9 +1197,9 @@ unsigned int dt_number_of_address(const struct dt_device_node *dev)
 }
 
 int dt_for_each_irq_map(const struct dt_device_node *dev,
-                        int (*cb)(const struct dt_device_node *,
-                                  const struct dt_irq *,
-                                  void *),
+                        int (*cb)(const struct dt_device_node *dev,
+                                  const struct dt_irq *dt_irq,
+                                  void *data),
                         void *data)
 {
     const struct dt_device_node *ipar, *tnode, *old = NULL;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index c2eada7489..8d88159f76 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -538,7 +538,7 @@ bool_t dt_machine_is_compatible(const char *compat);
  * Returns a node pointer with refcount incremented, use
  * of_node_put() on it when done.
  */
-struct dt_device_node *dt_find_node_by_name(struct dt_device_node *node,
+struct dt_device_node *dt_find_node_by_name(struct dt_device_node *from,
                                             const char *name);
 
 /**
@@ -639,7 +639,7 @@ unsigned int dt_number_of_address(const struct dt_device_node *device);
  * device-tree node. It's the high level pendant to dt_device_get_raw_irq().
  */
 int dt_device_get_irq(const struct dt_device_node *device, unsigned int index,
-                      struct dt_irq *irq);
+                      struct dt_irq *out_irq);
 
 /**
  * dt_device_get_raw_irq - Resolve an interrupt for a device without translation
@@ -652,7 +652,7 @@ int dt_device_get_irq(const struct dt_device_node *device, unsigned int index,
  */
 int dt_device_get_raw_irq(const struct dt_device_node *device,
                           unsigned int index,
-                          struct dt_raw_irq *irq);
+                          struct dt_raw_irq *out_irq);
 
 /**
  * dt_irq_translate - Translate an irq
@@ -668,9 +668,9 @@ int dt_irq_translate(const struct dt_raw_irq *raw, struct dt_irq *out_irq);
  * @data: Caller data passed to callback
  */
 int dt_for_each_irq_map(const struct dt_device_node *dev,
-                        int (*cb)(const struct dt_device_node *,
-                                  const struct dt_irq *,
-                                  void *),
+                        int (*cb)(const struct dt_device_node *dev,
+                                  const struct dt_irq *dt_irq,
+                                  void *data),
                         void *data);
 
 /**
@@ -680,9 +680,9 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
  * @data: Caller data passed to callback
  */
 int dt_for_each_range(const struct dt_device_node *dev,
-                      int (*cb)(const struct dt_device_node *,
+                      int (*cb)(const struct dt_device_node *dev,
                                 uint64_t addr, uint64_t length,
-                                void *),
+                                void *data),
                       void *data);
 
 /**
-- 
2.34.1


