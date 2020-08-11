Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E9241913
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 11:45:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5QqI-0004ku-Lc; Tue, 11 Aug 2020 09:45:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrfz=BV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5QqH-0004ko-Ev
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 09:45:13 +0000
X-Inumbo-ID: 621529f1-5d2c-4d06-a56d-5b34a6765aa6
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 621529f1-5d2c-4d06-a56d-5b34a6765aa6;
 Tue, 11 Aug 2020 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597139113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21LnmuTUq2pHs9BEPTKLR7uvR8pjWH5GPd9gh/+wq5s=;
 b=XPVyTsCIi7ERlJvK6jizi2Gwd6Jq7ranaauMOUbU3U6gkl69e9ibVj6s
 SHxXHUEJmRrppjEj5gKoaYSi0euz5wGki48egFCVY1WaCjg3F8pFoeYc7
 UQdOa0whIIrSWiSYnEZ2K/5mTPcC7uary52wI8JcsL9hHU3UKltzNLttc s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VY5VVlCFQoEMbraTS/yrZS8UqVt0ps8DLejYExspGKQRXdGYHx6bGA2Os+p4H57m0KVTnf4ETo
 A58Ud1v5xBKk0UreNYyFdq6SOXG5m2ohZ6VYo+8IFfkxaK9rYzAj92qOdySbmyuAGHFC6CHXLu
 pXAvt/6qNEzVNM41g+QN7omxDcX9rY9EwY9KUczeMlcriiFjpFoZyR6P++og5Yj3lXRWZomi+9
 8ny1E/KACaSD//Ufem6d3bKnm3jAVxF0h5A6pbWvkWT6anOcvbn8mKJ39nPavZd99plNPTlG1/
 IjQ=
X-SBRS: 2.7
X-MesageID: 24242470
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,460,1589256000"; d="scan'208";a="24242470"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
Date: Tue, 11 Aug 2020 11:44:46 +0200
Message-ID: <20200811094447.31208-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811094447.31208-1-roger.pau@citrix.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
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
Cc: Dave Jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Johannes Thumshirn <jthumshirn@suse.de>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>, "Aneesh
 Kumar K.V" <aneesh.kumar@linux.ibm.com>, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
being used by non DAX devices.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
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


