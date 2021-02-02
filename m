Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A748D30C8A4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 18:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80683.147748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zvW-00026X-IG; Tue, 02 Feb 2021 17:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80683.147748; Tue, 02 Feb 2021 17:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zvW-00026C-Ey; Tue, 02 Feb 2021 17:57:22 +0000
Received: by outflank-mailman (input) for mailman id 80683;
 Tue, 02 Feb 2021 17:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1l6zvV-000267-5h
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 17:57:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1l6zvU-0002dh-MJ; Tue, 02 Feb 2021 17:57:20 +0000
Received: from host86-190-149-163.range86-190.btcentralplus.com
 ([86.190.149.163] helo=ubuntu.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1l6zvU-0006HU-Ac; Tue, 02 Feb 2021 17:57:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=U9LFyj567L8ODDmpt5H9dtpTYleJRBeis5xuYap+UEk=; b=IUMNPYDqTYI1m8BX1jWz/P2whH
	oNjab1nTmbSWf0fqWGhwZLs6Uc9oaLgtwwALS9GMpNWg813Ba3WGqoY7+YjCijfTBCWYjCI1WyMsn
	cso0MzQS3/uM9+n28VjVJBo9A0oF72aK2lv2qOP7xALJK5tiE97jvyjlF+mJbRox/L1U=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v3] xen-blkback: fix compatibility bug with single page rings
Date: Tue,  2 Feb 2021 17:56:59 +0000
Message-Id: <20210202175659.18452-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid
inconsistent xenstore 'ring-page-order' set by malicious blkfront"), the
behaviour of xen-blkback when connecting to a frontend was:

- read 'ring-page-order'
- if not present then expect a single page ring specified by 'ring-ref'
- else expect a ring specified by 'ring-refX' where X is between 0 and
  1 << ring-page-order

This was correct behaviour, but was broken by the afforementioned commit to
become:

- read 'ring-page-order'
- if not present then expect a single page ring (i.e. ring-page-order = 0)
- expect a ring specified by 'ring-refX' where X is between 0 and
  1 << ring-page-order
- if that didn't work then see if there's a single page ring specified by
  'ring-ref'

This incorrect behaviour works most of the time but fails when a frontend
that sets 'ring-page-order' is unloaded and replaced by one that does not
because, instead of reading 'ring-ref', xen-blkback will read the stale
'ring-ref0' left around by the previous frontend will try to map the wrong
grant reference.

This patch restores the original behaviour.

Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: "Roger Pau Monné" <roger.pau@citrix.com>
---
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>

v3:
 - Whitespace fix

v2:
 - Remove now-spurious error path special-case when nr_grefs == 1
---
 drivers/block/xen-blkback/common.h |  1 +
 drivers/block/xen-blkback/xenbus.c | 38 +++++++++++++-----------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index b0c71d3a81a0..bda5c815e441 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -313,6 +313,7 @@ struct xen_blkif {
 
 	struct work_struct	free_work;
 	unsigned int 		nr_ring_pages;
+	bool			multi_ref;
 	/* All rings for this device. */
 	struct xen_blkif_ring	*rings;
 	unsigned int		nr_rings;
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 9860d4842f36..6c5e9373e91c 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -998,14 +998,17 @@ static int read_per_ring_refs(struct xen_blkif_ring *ring, const char *dir)
 	for (i = 0; i < nr_grefs; i++) {
 		char ring_ref_name[RINGREF_NAME_LEN];
 
-		snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
+		if (blkif->multi_ref)
+			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
+		else {
+			WARN_ON(i != 0);
+			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref");
+		}
+
 		err = xenbus_scanf(XBT_NIL, dir, ring_ref_name,
 				   "%u", &ring_ref[i]);
 
 		if (err != 1) {
-			if (nr_grefs == 1)
-				break;
-
 			err = -EINVAL;
 			xenbus_dev_fatal(dev, err, "reading %s/%s",
 					 dir, ring_ref_name);
@@ -1013,18 +1016,6 @@ static int read_per_ring_refs(struct xen_blkif_ring *ring, const char *dir)
 		}
 	}
 
-	if (err != 1) {
-		WARN_ON(nr_grefs != 1);
-
-		err = xenbus_scanf(XBT_NIL, dir, "ring-ref", "%u",
-				   &ring_ref[0]);
-		if (err != 1) {
-			err = -EINVAL;
-			xenbus_dev_fatal(dev, err, "reading %s/ring-ref", dir);
-			return err;
-		}
-	}
-
 	err = -ENOMEM;
 	for (i = 0; i < nr_grefs * XEN_BLKIF_REQS_PER_PAGE; i++) {
 		req = kzalloc(sizeof(*req), GFP_KERNEL);
@@ -1129,10 +1120,15 @@ static int connect_ring(struct backend_info *be)
 		 blkif->nr_rings, blkif->blk_protocol, protocol,
 		 blkif->vbd.feature_gnt_persistent ? "persistent grants" : "");
 
-	ring_page_order = xenbus_read_unsigned(dev->otherend,
-					       "ring-page-order", 0);
-
-	if (ring_page_order > xen_blkif_max_ring_order) {
+	err = xenbus_scanf(XBT_NIL, dev->otherend, "ring-page-order", "%u",
+			   &ring_page_order);
+	if (err != 1) {
+		blkif->nr_ring_pages = 1;
+		blkif->multi_ref = false;
+	} else if (ring_page_order <= xen_blkif_max_ring_order) {
+		blkif->nr_ring_pages = 1 << ring_page_order;
+		blkif->multi_ref = true;
+	} else {
 		err = -EINVAL;
 		xenbus_dev_fatal(dev, err,
 				 "requested ring page order %d exceed max:%d",
@@ -1141,8 +1137,6 @@ static int connect_ring(struct backend_info *be)
 		return err;
 	}
 
-	blkif->nr_ring_pages = 1 << ring_page_order;
-
 	if (blkif->nr_rings == 1)
 		return read_per_ring_refs(&blkif->rings[0], dev->otherend);
 	else {
-- 
2.17.1


