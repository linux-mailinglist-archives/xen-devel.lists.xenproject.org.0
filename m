Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521D761AC6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569715.890708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOIXB-0008Ov-1h; Tue, 25 Jul 2023 13:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569715.890708; Tue, 25 Jul 2023 13:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOIXA-0008MV-Tq; Tue, 25 Jul 2023 13:57:04 +0000
Received: by outflank-mailman (input) for mailman id 569715;
 Tue, 25 Jul 2023 13:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1im=DL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOIXA-0008Lz-14
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:57:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214e52a4-2af3-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 15:57:02 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.93.75])
 by support.bugseng.com (Postfix) with ESMTPSA id 11B7B4EE0739;
 Tue, 25 Jul 2023 15:57:00 +0200 (CEST)
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
X-Inumbo-ID: 214e52a4-2af3-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v3] device_tree: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Tue, 25 Jul 2023 15:56:44 +0200
Message-Id: <982ad65413e08e8c10ef035cb8246ba7277ff01b.1690292999.git.federico.serafini@bugseng.com>
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
Changes in v3:
  - use parameter name 'dev' instead of 'device'.
---
Changes in v2:
  - improved consistency in parameter renaming.
---
 xen/common/device_tree.c      | 16 ++++++++--------
 xen/include/xen/device_tree.h | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0677193ab3..0522fdf976 100644
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
index c2eada7489..1d79e23b28 100644
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
@@ -622,12 +622,12 @@ unsigned int dt_number_of_irq(const struct dt_device_node *device);
 
 /**
  * dt_number_of_address - Get the number of addresses for a device
- * @device: the device whose number of address is to be retrieved
+ * @dev: the device whose number of address is to be retrieved
  *
  * Return the number of address for this device or 0 if there is no
  * address or an error occurred.
  */
-unsigned int dt_number_of_address(const struct dt_device_node *device);
+unsigned int dt_number_of_address(const struct dt_device_node *dev);
 
 /**
  * dt_device_get_irq - Resolve an interrupt for a device
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


