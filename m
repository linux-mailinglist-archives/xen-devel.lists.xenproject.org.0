Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECEE270294
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 18:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJJaq-0007Nw-Ry; Fri, 18 Sep 2020 16:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EJp8=C3=casper.srs.infradead.org=batv+1a7941a35ce833a0e493+6235+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kJJao-0007Np-Sd
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 16:50:38 +0000
X-Inumbo-ID: 02b8b164-554f-4728-a4ff-5a972c158df2
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b8b164-554f-4728-a4ff-5a972c158df2;
 Fri, 18 Sep 2020 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UxCKXqRP/rysmc9RNpHAJ/UIhdxbXkB6cd/t5AXU7G8=; b=cpCprZwn/AafJTn6MHEbaradk7
 t/YIiBsf+ylm0zuSEvtQJJqSQ4lNxxXz65sGW+WcamVSPFNTyaoIwTXkXKE1Gh8glqiczJV2J/0Ze
 AVJM1fdUpkGwFGrNF3JaNgerTd951R06BJgp654l8tPfJvNhcQADyo0X3aR/tXbEiIykkE5RGf7JZ
 MoFxDTuhrUAHst0ZL1cwk7zQeYAxZD/azM9vvST9VjX3BCCT8szgChY0L89mIBv5In3yssxZv0ghd
 4HxI47BxGE8GM2KL7O1rUjcNzYDg8CUmEmG0sOKSEV9Ie0eW0pyXfXTlmZP3sAtzT00mzvFELhMt9
 62Kb7LMA==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJJag-0007nv-Hp; Fri, 18 Sep 2020 16:50:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: [PATCH 5/6] xen/xenbus: use apply_to_page_range directly in
 xenbus_map_ring_pv
Date: Fri, 18 Sep 2020 18:37:23 +0200
Message-Id: <20200918163724.2511-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918163724.2511-1-hch@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Replacing alloc_vm_area with get_vm_area_caller + apply_page_range
allows to fill put the phys_addr values directly instead of doing
another loop over all addresses.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/xenbus/xenbus_client.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 2690318ad50f48..fd80e318b99cc7 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -73,16 +73,13 @@ struct map_ring_valloc {
 	struct xenbus_map_node *node;
 
 	/* Why do we need two arrays? See comment of __xenbus_map_ring */
-	union {
-		unsigned long addrs[XENBUS_MAX_RING_GRANTS];
-		pte_t *ptes[XENBUS_MAX_RING_GRANTS];
-	};
+	unsigned long addrs[XENBUS_MAX_RING_GRANTS];
 	phys_addr_t phys_addrs[XENBUS_MAX_RING_GRANTS];
 
 	struct gnttab_map_grant_ref map[XENBUS_MAX_RING_GRANTS];
 	struct gnttab_unmap_grant_ref unmap[XENBUS_MAX_RING_GRANTS];
 
-	unsigned int idx;	/* HVM only. */
+	unsigned int idx;
 };
 
 static DEFINE_SPINLOCK(xenbus_valloc_lock);
@@ -686,6 +683,14 @@ int xenbus_unmap_ring_vfree(struct xenbus_device *dev, void *vaddr)
 EXPORT_SYMBOL_GPL(xenbus_unmap_ring_vfree);
 
 #ifdef CONFIG_XEN_PV
+static int map_ring_apply(pte_t *pte, unsigned long addr, void *data)
+{
+	struct map_ring_valloc *info = data;
+
+	info->phys_addrs[info->idx++] = arbitrary_virt_to_machine(pte).maddr;
+	return 0;
+}
+
 static int xenbus_map_ring_pv(struct xenbus_device *dev,
 			      struct map_ring_valloc *info,
 			      grant_ref_t *gnt_refs,
@@ -694,18 +699,15 @@ static int xenbus_map_ring_pv(struct xenbus_device *dev,
 {
 	struct xenbus_map_node *node = info->node;
 	struct vm_struct *area;
-	int err = GNTST_okay;
-	int i;
-	bool leaked;
+	bool leaked = false;
+	int err = -ENOMEM;
 
-	area = alloc_vm_area(XEN_PAGE_SIZE * nr_grefs, info->ptes);
+	area = get_vm_area(XEN_PAGE_SIZE * nr_grefs, VM_IOREMAP);
 	if (!area)
 		return -ENOMEM;
-
-	for (i = 0; i < nr_grefs; i++)
-		info->phys_addrs[i] =
-			arbitrary_virt_to_machine(info->ptes[i]).maddr;
-
+	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
+				XEN_PAGE_SIZE * nr_grefs, map_ring_apply, info))
+		goto failed;
 	err = __xenbus_map_ring(dev, gnt_refs, nr_grefs, node->handles,
 				info, GNTMAP_host_map | GNTMAP_contains_pte,
 				&leaked);
-- 
2.28.0


