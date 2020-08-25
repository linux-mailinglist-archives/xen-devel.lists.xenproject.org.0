Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3789251568
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 11:32:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAVJC-00070g-7S; Tue, 25 Aug 2020 09:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xb/y=CD=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1kAVJA-00070V-4Y
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 09:32:00 +0000
X-Inumbo-ID: a5cd986e-30c8-45ff-8816-4ac12da5bbf7
Received: from mx2.mailbox.org (unknown [2001:67c:2050:104:0:2:25:2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5cd986e-30c8-45ff-8816-4ac12da5bbf7;
 Tue, 25 Aug 2020 09:31:57 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 6FD60A122C;
 Tue, 25 Aug 2020 11:31:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id A4EriVCwAZSC; Tue, 25 Aug 2020 11:31:54 +0200 (CEST)
From: Simon Leiner <simon@leiner.me>
To: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	jgross@suse.com
Cc: julien@xen.org
Subject: [PATCH 1/2] xen/xenbus: Fix granting of vmalloc'd memory
Date: Tue, 25 Aug 2020 11:31:52 +0200
Message-Id: <20200825093153.35500-1-simon@leiner.me>
In-Reply-To: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.90 / 15.00 / 15.00
X-Rspamd-Queue-Id: D3883CC9
X-Rspamd-UID: afe8fb
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

On some architectures (like ARM), virt_to_gfn cannot be used for
vmalloc'd memory because of its reliance on virt_to_phys. This patch
introduces a check for vmalloc'd addresses and obtains the PFN using
vmalloc_to_pfn in that case.

Signed-off-by: Simon Leiner <simon@leiner.me>
---
 drivers/xen/xenbus/xenbus_client.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 786fbb7d8be0..907bcbb93afb 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -379,8 +379,14 @@ int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
 	int i, j;
 
 	for (i = 0; i < nr_pages; i++) {
-		err = gnttab_grant_foreign_access(dev->otherend_id,
-						  virt_to_gfn(vaddr), 0);
+		unsigned long gfn;
+
+		if (is_vmalloc_addr(vaddr))
+			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr));
+		else
+			gfn = virt_to_gfn(vaddr);
+
+		err = gnttab_grant_foreign_access(dev->otherend_id, gfn, 0);
 		if (err < 0) {
 			xenbus_dev_fatal(dev, err,
 					 "granting access to ring page");
-- 
2.24.3 (Apple Git-128)


