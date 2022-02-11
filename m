Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9D4B289E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270531.464847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXPt-00079N-4G; Fri, 11 Feb 2022 15:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270531.464847; Fri, 11 Feb 2022 15:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXPt-000777-15; Fri, 11 Feb 2022 15:00:57 +0000
Received: by outflank-mailman (input) for mailman id 270531;
 Fri, 11 Feb 2022 15:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixe1=S2=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nIXPs-000771-Dg
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:00:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 68c05bdd-8b4b-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 16:00:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 604D4106F;
 Fri, 11 Feb 2022 07:00:53 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82EC93F718;
 Fri, 11 Feb 2022 07:00:52 -0800 (PST)
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
X-Inumbo-ID: 68c05bdd-8b4b-11ec-8f75-fffcc8bd4f1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC PATCH] arm/vgic-v3: provide custom callbacks for pend_lpi_tree radix tree
Date: Fri, 11 Feb 2022 15:00:42 +0000
Message-Id: <20220211150042.11972-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

pend_lpi_tree is a radix tree used to store pending irqs, the tree is
protected by a lock for read/write operations.

Currently the radix tree default function to free items uses the
RCU mechanism, calling call_rcu and deferring the operation.

However every access to the structure is protected by the lock so we
can avoid using the default free function that, by using RCU,
increases memory usage and impacts the predictability of the system.

This commit provides custom callbacks to alloc/free items of the radix
tree and the free function doesn't use the RCU mechanism.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/vgic-v3.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 65bb7991a69b..970747a72012 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1650,6 +1650,18 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
                GUEST_GICV3_RDIST_REGIONS;
 }
 
+static struct radix_tree_node *vgic_v3_radix_tree_node_alloc(void *arg)
+{
+    struct radix_tree_node *node = xmalloc(struct radix_tree_node);
+
+    return node ? node : NULL;
+}
+
+static void vgic_v3_radix_tree_node_free(struct radix_tree_node *elem, void *arg)
+{
+    xfree(elem);
+}
+
 static int vgic_v3_domain_init(struct domain *d)
 {
     struct vgic_rdist_region *rdist_regions;
@@ -1668,6 +1680,14 @@ static int vgic_v3_domain_init(struct domain *d)
     rwlock_init(&d->arch.vgic.pend_lpi_tree_lock);
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
+    /*
+     * pend_lpi_tree is protected by rwlock, so don't use lockless RCU default
+     * management for it and provide callbacks to alloc/free elements.
+     */
+    radix_tree_set_alloc_callbacks(&d->arch.vgic.pend_lpi_tree,
+                                   vgic_v3_radix_tree_node_alloc,
+                                   vgic_v3_radix_tree_node_free, NULL);
+
     /*
      * Domain 0 gets the hardware address.
      * Guests get the virtual platform layout.
-- 
2.17.1


