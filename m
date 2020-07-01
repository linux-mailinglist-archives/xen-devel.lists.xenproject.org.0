Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A7210AE3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 14:17:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqbfQ-00058r-TV; Wed, 01 Jul 2020 12:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2yc=AM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqbfP-00058k-Kn
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 12:16:43 +0000
X-Inumbo-ID: b8f40f48-bb94-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8f40f48-bb94-11ea-8496-bc764e2007e4;
 Wed, 01 Jul 2020 12:16:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA5A5ADE1;
 Wed,  1 Jul 2020 12:16:41 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH v2 1/2] xen/xenbus: avoid large structs and arrays on the stack
Date: Wed,  1 Jul 2020 14:16:37 +0200
Message-Id: <20200701121638.19840-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701121638.19840-1-jgross@suse.com>
References: <20200701121638.19840-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xenbus_map_ring_valloc() and its sub-functions are putting quite large
structs and arrays on the stack. This is problematic at runtime, but
might also result in build failures (e.g. with clang due to the option
-Werror,-Wframe-larger-than=... used).

Fix that by moving most of the data from the stack into a dynamically
allocated struct. Performance is no issue here, as
xenbus_map_ring_valloc() is used only when adding a new PV device to
a backend driver.

While at it move some duplicated code from pv/hvm specific mapping
functions to the single caller.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- shorten internal function names (Boris Ostrovsky)
---
 drivers/xen/xenbus/xenbus_client.c | 161 +++++++++++++++--------------
 1 file changed, 83 insertions(+), 78 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 040d2a43e8e3..9f8372079ecf 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -69,11 +69,27 @@ struct xenbus_map_node {
 	unsigned int   nr_handles;
 };
 
+struct map_ring_valloc {
+	struct xenbus_map_node *node;
+
+	/* Why do we need two arrays? See comment of __xenbus_map_ring */
+	union {
+		unsigned long addrs[XENBUS_MAX_RING_GRANTS];
+		pte_t *ptes[XENBUS_MAX_RING_GRANTS];
+	};
+	phys_addr_t phys_addrs[XENBUS_MAX_RING_GRANTS];
+
+	struct gnttab_map_grant_ref map[XENBUS_MAX_RING_GRANTS];
+	struct gnttab_unmap_grant_ref unmap[XENBUS_MAX_RING_GRANTS];
+
+	unsigned int idx;	/* HVM only. */
+};
+
 static DEFINE_SPINLOCK(xenbus_valloc_lock);
 static LIST_HEAD(xenbus_valloc_pages);
 
 struct xenbus_ring_ops {
-	int (*map)(struct xenbus_device *dev,
+	int (*map)(struct xenbus_device *dev, struct map_ring_valloc *info,
 		   grant_ref_t *gnt_refs, unsigned int nr_grefs,
 		   void **vaddr);
 	int (*unmap)(struct xenbus_device *dev, void *vaddr);
@@ -449,12 +465,32 @@ int xenbus_map_ring_valloc(struct xenbus_device *dev, grant_ref_t *gnt_refs,
 			   unsigned int nr_grefs, void **vaddr)
 {
 	int err;
+	struct map_ring_valloc *info;
+
+	*vaddr = NULL;
+
+	if (nr_grefs > XENBUS_MAX_RING_GRANTS)
+		return -EINVAL;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->node = kzalloc(sizeof(*info->node), GFP_KERNEL);
+	if (!info->node) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	err = ring_ops->map(dev, info, gnt_refs, nr_grefs, vaddr);
 
-	err = ring_ops->map(dev, gnt_refs, nr_grefs, vaddr);
 	/* Some hypervisors are buggy and can return 1. */
 	if (err > 0)
 		err = GNTST_general_error;
 
+ out:
+	kfree(info->node);
+	kfree(info);
 	return err;
 }
 EXPORT_SYMBOL_GPL(xenbus_map_ring_valloc);
@@ -466,12 +502,10 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 			     grant_ref_t *gnt_refs,
 			     unsigned int nr_grefs,
 			     grant_handle_t *handles,
-			     phys_addr_t *addrs,
+			     struct map_ring_valloc *info,
 			     unsigned int flags,
 			     bool *leaked)
 {
-	struct gnttab_map_grant_ref map[XENBUS_MAX_RING_GRANTS];
-	struct gnttab_unmap_grant_ref unmap[XENBUS_MAX_RING_GRANTS];
 	int i, j;
 	int err = GNTST_okay;
 
@@ -479,23 +513,22 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 		return -EINVAL;
 
 	for (i = 0; i < nr_grefs; i++) {
-		memset(&map[i], 0, sizeof(map[i]));
-		gnttab_set_map_op(&map[i], addrs[i], flags, gnt_refs[i],
-				  dev->otherend_id);
+		gnttab_set_map_op(&info->map[i], info->phys_addrs[i], flags,
+				  gnt_refs[i], dev->otherend_id);
 		handles[i] = INVALID_GRANT_HANDLE;
 	}
 
-	gnttab_batch_map(map, i);
+	gnttab_batch_map(info->map, i);
 
 	for (i = 0; i < nr_grefs; i++) {
-		if (map[i].status != GNTST_okay) {
-			err = map[i].status;
-			xenbus_dev_fatal(dev, map[i].status,
+		if (info->map[i].status != GNTST_okay) {
+			err = info->map[i].status;
+			xenbus_dev_fatal(dev, info->map[i].status,
 					 "mapping in shared page %d from domain %d",
 					 gnt_refs[i], dev->otherend_id);
 			goto fail;
 		} else
-			handles[i] = map[i].handle;
+			handles[i] = info->map[i].handle;
 	}
 
 	return GNTST_okay;
@@ -503,19 +536,19 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
  fail:
 	for (i = j = 0; i < nr_grefs; i++) {
 		if (handles[i] != INVALID_GRANT_HANDLE) {
-			memset(&unmap[j], 0, sizeof(unmap[j]));
-			gnttab_set_unmap_op(&unmap[j], (phys_addr_t)addrs[i],
+			gnttab_set_unmap_op(&info->unmap[j],
+					    info->phys_addrs[i],
 					    GNTMAP_host_map, handles[i]);
 			j++;
 		}
 	}
 
-	if (HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, unmap, j))
+	if (HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, info->unmap, j))
 		BUG();
 
 	*leaked = false;
 	for (i = 0; i < j; i++) {
-		if (unmap[i].status != GNTST_okay) {
+		if (info->unmap[i].status != GNTST_okay) {
 			*leaked = true;
 			break;
 		}
@@ -566,21 +599,12 @@ static int xenbus_unmap_ring(struct xenbus_device *dev, grant_handle_t *handles,
 	return err;
 }
 
-struct map_ring_valloc_hvm
-{
-	unsigned int idx;
-
-	/* Why do we need two arrays? See comment of __xenbus_map_ring */
-	phys_addr_t phys_addrs[XENBUS_MAX_RING_GRANTS];
-	unsigned long addrs[XENBUS_MAX_RING_GRANTS];
-};
-
 static void xenbus_map_ring_setup_grant_hvm(unsigned long gfn,
 					    unsigned int goffset,
 					    unsigned int len,
 					    void *data)
 {
-	struct map_ring_valloc_hvm *info = data;
+	struct map_ring_valloc *info = data;
 	unsigned long vaddr = (unsigned long)gfn_to_virt(gfn);
 
 	info->phys_addrs[info->idx] = vaddr;
@@ -589,39 +613,28 @@ static void xenbus_map_ring_setup_grant_hvm(unsigned long gfn,
 	info->idx++;
 }
 
-static int xenbus_map_ring_valloc_hvm(struct xenbus_device *dev,
-				      grant_ref_t *gnt_ref,
-				      unsigned int nr_grefs,
-				      void **vaddr)
+static int xenbus_map_ring_hvm(struct xenbus_device *dev,
+			       struct map_ring_valloc *info,
+			       grant_ref_t *gnt_ref,
+			       unsigned int nr_grefs,
+			       void **vaddr)
 {
-	struct xenbus_map_node *node;
+	struct xenbus_map_node *node = info->node;
 	int err;
 	void *addr;
 	bool leaked = false;
-	struct map_ring_valloc_hvm info = {
-		.idx = 0,
-	};
 	unsigned int nr_pages = XENBUS_PAGES(nr_grefs);
 
-	if (nr_grefs > XENBUS_MAX_RING_GRANTS)
-		return -EINVAL;
-
-	*vaddr = NULL;
-
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
-	if (!node)
-		return -ENOMEM;
-
 	err = alloc_xenballooned_pages(nr_pages, node->hvm.pages);
 	if (err)
 		goto out_err;
 
 	gnttab_foreach_grant(node->hvm.pages, nr_grefs,
 			     xenbus_map_ring_setup_grant_hvm,
-			     &info);
+			     info);
 
 	err = __xenbus_map_ring(dev, gnt_ref, nr_grefs, node->handles,
-				info.phys_addrs, GNTMAP_host_map, &leaked);
+				info, GNTMAP_host_map, &leaked);
 	node->nr_handles = nr_grefs;
 
 	if (err)
@@ -641,11 +654,13 @@ static int xenbus_map_ring_valloc_hvm(struct xenbus_device *dev,
 	spin_unlock(&xenbus_valloc_lock);
 
 	*vaddr = addr;
+	info->node = NULL;
+
 	return 0;
 
  out_xenbus_unmap_ring:
 	if (!leaked)
-		xenbus_unmap_ring(dev, node->handles, nr_grefs, info.addrs);
+		xenbus_unmap_ring(dev, node->handles, nr_grefs, info->addrs);
 	else
 		pr_alert("leaking %p size %u page(s)",
 			 addr, nr_pages);
@@ -653,7 +668,6 @@ static int xenbus_map_ring_valloc_hvm(struct xenbus_device *dev,
 	if (!leaked)
 		free_xenballooned_pages(nr_pages, node->hvm.pages);
  out_err:
-	kfree(node);
 	return err;
 }
 
@@ -676,40 +690,30 @@ int xenbus_unmap_ring_vfree(struct xenbus_device *dev, void *vaddr)
 EXPORT_SYMBOL_GPL(xenbus_unmap_ring_vfree);
 
 #ifdef CONFIG_XEN_PV
-static int xenbus_map_ring_valloc_pv(struct xenbus_device *dev,
-				     grant_ref_t *gnt_refs,
-				     unsigned int nr_grefs,
-				     void **vaddr)
+static int xenbus_map_ring_pv(struct xenbus_device *dev,
+			      struct map_ring_valloc *info,
+			      grant_ref_t *gnt_refs,
+			      unsigned int nr_grefs,
+			      void **vaddr)
 {
-	struct xenbus_map_node *node;
+	struct xenbus_map_node *node = info->node;
 	struct vm_struct *area;
-	pte_t *ptes[XENBUS_MAX_RING_GRANTS];
-	phys_addr_t phys_addrs[XENBUS_MAX_RING_GRANTS];
 	int err = GNTST_okay;
 	int i;
 	bool leaked;
 
-	*vaddr = NULL;
-
-	if (nr_grefs > XENBUS_MAX_RING_GRANTS)
-		return -EINVAL;
-
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
-	if (!node)
-		return -ENOMEM;
-
-	area = alloc_vm_area(XEN_PAGE_SIZE * nr_grefs, ptes);
+	area = alloc_vm_area(XEN_PAGE_SIZE * nr_grefs, info->ptes);
 	if (!area) {
 		kfree(node);
 		return -ENOMEM;
 	}
 
 	for (i = 0; i < nr_grefs; i++)
-		phys_addrs[i] = arbitrary_virt_to_machine(ptes[i]).maddr;
+		info->phys_addrs[i] =
+			arbitrary_virt_to_machine(info->ptes[i]).maddr;
 
 	err = __xenbus_map_ring(dev, gnt_refs, nr_grefs, node->handles,
-				phys_addrs,
-				GNTMAP_host_map | GNTMAP_contains_pte,
+				info, GNTMAP_host_map | GNTMAP_contains_pte,
 				&leaked);
 	if (err)
 		goto failed;
@@ -722,6 +726,8 @@ static int xenbus_map_ring_valloc_pv(struct xenbus_device *dev,
 	spin_unlock(&xenbus_valloc_lock);
 
 	*vaddr = area->addr;
+	info->node = NULL;
+
 	return 0;
 
 failed:
@@ -730,11 +736,10 @@ static int xenbus_map_ring_valloc_pv(struct xenbus_device *dev,
 	else
 		pr_alert("leaking VM area %p size %u page(s)", area, nr_grefs);
 
-	kfree(node);
 	return err;
 }
 
-static int xenbus_unmap_ring_vfree_pv(struct xenbus_device *dev, void *vaddr)
+static int xenbus_unmap_ring_pv(struct xenbus_device *dev, void *vaddr)
 {
 	struct xenbus_map_node *node;
 	struct gnttab_unmap_grant_ref unmap[XENBUS_MAX_RING_GRANTS];
@@ -798,12 +803,12 @@ static int xenbus_unmap_ring_vfree_pv(struct xenbus_device *dev, void *vaddr)
 }
 
 static const struct xenbus_ring_ops ring_ops_pv = {
-	.map = xenbus_map_ring_valloc_pv,
-	.unmap = xenbus_unmap_ring_vfree_pv,
+	.map = xenbus_map_ring_pv,
+	.unmap = xenbus_unmap_ring_pv,
 };
 #endif
 
-struct unmap_ring_vfree_hvm
+struct unmap_ring_hvm
 {
 	unsigned int idx;
 	unsigned long addrs[XENBUS_MAX_RING_GRANTS];
@@ -814,19 +819,19 @@ static void xenbus_unmap_ring_setup_grant_hvm(unsigned long gfn,
 					      unsigned int len,
 					      void *data)
 {
-	struct unmap_ring_vfree_hvm *info = data;
+	struct unmap_ring_hvm *info = data;
 
 	info->addrs[info->idx] = (unsigned long)gfn_to_virt(gfn);
 
 	info->idx++;
 }
 
-static int xenbus_unmap_ring_vfree_hvm(struct xenbus_device *dev, void *vaddr)
+static int xenbus_unmap_ring_hvm(struct xenbus_device *dev, void *vaddr)
 {
 	int rv;
 	struct xenbus_map_node *node;
 	void *addr;
-	struct unmap_ring_vfree_hvm info = {
+	struct unmap_ring_hvm info = {
 		.idx = 0,
 	};
 	unsigned int nr_pages;
@@ -887,8 +892,8 @@ enum xenbus_state xenbus_read_driver_state(const char *path)
 EXPORT_SYMBOL_GPL(xenbus_read_driver_state);
 
 static const struct xenbus_ring_ops ring_ops_hvm = {
-	.map = xenbus_map_ring_valloc_hvm,
-	.unmap = xenbus_unmap_ring_vfree_hvm,
+	.map = xenbus_map_ring_hvm,
+	.unmap = xenbus_unmap_ring_hvm,
 };
 
 void __init xenbus_ring_ops_init(void)
-- 
2.26.2


