Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60681258A61
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 10:34:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD1ja-00025B-8q; Tue, 01 Sep 2020 08:33:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD1jY-00024y-Rp
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 08:33:40 +0000
X-Inumbo-ID: 83b8b49d-14c7-4fd7-9b67-b262278d4bf3
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83b8b49d-14c7-4fd7-9b67-b262278d4bf3;
 Tue, 01 Sep 2020 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598949219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6iM96sKC3C3LFxia9GepOmTF8WrPh0TXy/mfmfh0JwA=;
 b=FUK+n5r1lfcarAhLXc5VkjPV6a2jeqJalm9P/Rixhc2Qew1FmnzR9ot5
 dfwwLiNSr/2A1zgwo0FcWiKIlrgABHRZPihEbxGV/tDh/1bYkzJI069xC
 qoOy97oUGIgzDAQz5LHw66WXUaFnjo8LXMqsqC1VNrUMXPwbFern2o9m9 s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vRg+LZIhKqLHKOzIxg/UtuKM3UO+ewPtHYKtiaBQiVZ3/RbjmNoq9zMilEk72NCOOEj+tvMJS5
 Vwf39QCUkFYl6ahM6kmVJWAMG3QbkTMv48Uvnuws2K1TqKJFtkz9qIE+VbhtvPWIhXmR46ozLx
 5SmQHK+oH6exmvf2mOPf9HxfaAZQTLcPzuoQPra/lFiQZ8biOLFvWA0yfokf4Wv+F9m2l2GuTD
 jCtRqQdlxUxD+3BYmfTLPjwKMAU604YPHv95HoBkxmiYe7Rsnl5RCid02c07hWiYkpfvVZqmya
 Ftw=
X-SBRS: 2.7
X-MesageID: 26050349
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26050349"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ira Weiny <ira.weiny@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dan Williams
 <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, "Dave
 Jiang" <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar
 K.V" <aneesh.kumar@linux.ibm.com>, Johannes Thumshirn <jthumshirn@suse.de>,
 Logan Gunthorpe <logang@deltatee.com>, Juergen Gross <jgross@suse.com>,
 <linux-nvdimm@lists.01.org>, <xen-devel@lists.xenproject.org>,
 <linux-mm@kvack.org>
Subject: [PATCH v5 2/3] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
Date: Tue, 1 Sep 2020 10:33:25 +0200
Message-ID: <20200901083326.21264-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901083326.21264-1-roger.pau@citrix.com>
References: <20200901083326.21264-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
being used by non DAX devices.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
---
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: linux-nvdimm@lists.01.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-mm@kvack.org
---
 drivers/dax/device.c     | 2 +-
 include/linux/memremap.h | 9 ++++-----
 mm/memremap.c            | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 4c0af2eb7e19..1e89513f3c59 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -429,7 +429,7 @@ int dev_dax_probe(struct device *dev)
 		return -EBUSY;
 	}
 
-	dev_dax->pgmap.type = MEMORY_DEVICE_DEVDAX;
+	dev_dax->pgmap.type = MEMORY_DEVICE_GENERIC;
 	addr = devm_memremap_pages(dev, &dev_dax->pgmap);
 	if (IS_ERR(addr))
 		return PTR_ERR(addr);
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 5f5b2df06e61..e5862746751b 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -46,11 +46,10 @@ struct vmem_altmap {
  * wakeup is used to coordinate physical address space management (ex:
  * fs truncate/hole punch) vs pinned pages (ex: device dma).
  *
- * MEMORY_DEVICE_DEVDAX:
+ * MEMORY_DEVICE_GENERIC:
  * Host memory that has similar access semantics as System RAM i.e. DMA
- * coherent and supports page pinning. In contrast to
- * MEMORY_DEVICE_FS_DAX, this memory is access via a device-dax
- * character device.
+ * coherent and supports page pinning. This is for example used by DAX devices
+ * that expose memory using a character device.
  *
  * MEMORY_DEVICE_PCI_P2PDMA:
  * Device memory residing in a PCI BAR intended for use with Peer-to-Peer
@@ -60,7 +59,7 @@ enum memory_type {
 	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
 	MEMORY_DEVICE_FS_DAX,
-	MEMORY_DEVICE_DEVDAX,
+	MEMORY_DEVICE_GENERIC,
 	MEMORY_DEVICE_PCI_P2PDMA,
 };
 
diff --git a/mm/memremap.c b/mm/memremap.c
index 03e38b7a38f1..006dace60b1a 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -216,7 +216,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			return ERR_PTR(-EINVAL);
 		}
 		break;
-	case MEMORY_DEVICE_DEVDAX:
+	case MEMORY_DEVICE_GENERIC:
 		need_devmap_managed = false;
 		break;
 	case MEMORY_DEVICE_PCI_P2PDMA:
-- 
2.28.0


