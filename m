Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A4206F83
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 10:55:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo19y-0003hF-9b; Wed, 24 Jun 2020 08:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iWQw=AF=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jo19x-0003hA-5e
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 08:53:33 +0000
X-Inumbo-ID: 2daee40e-b5f8-11ea-bca7-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::616])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2daee40e-b5f8-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 08:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhBCJlFL0qCYPofSqUZjCuASsIY8SNhmxd0XoBAGdPXScd8pybfZAZgWBdjNbb6kBnDCIoOnB4fgP/JXNJIraRuVQdEDZbO6BlxQeKwpo/ztlNIXNpB4xnT2gwSYy35be+np8/Ky9UzapjMPHY6/4tI850YiKkdUI45pSYaQqM9YV74z+7aWGZYlHobIlxmZnsQvQfKksNZ05rRiHocRmI5h0WbhBmGarXCyb+UKh0dJpQ5sVJC8gkXoOjJlfpClPFkzUyvQwETLO/qZGCkBsFFcyWstFBkC4nWxiKhdQVRVI9A2SaEDgjlQEiW3qc9NZs5tJD/mq865VWlnXGpmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P0H34ZpXj3sa+FcMN/vj5YDCEarbvC4lpBt0odIAMc=;
 b=aBHplI/p8ECd7vw/0CR2lGXkSXPd/K2Pi/OfYdbK+b60WCIgYBQmbZN8NQ/UKyMmhYHOpwpMKDLViUsQ7Q0iLq/gcr3UiXGqPFKafO6ypjLSVv09NUD6VzUC+F2dEw/AT1b0X9mfuWmbhyuSS0snN3JIbYQ3QucUSQuUPeasysQWAEpd+3E27QH/Vc1i7o3G6BQP4TFaGuXcMp87tKJPzj5CnCUuW8T7YUmdt646F10EWryTnEK/JVw5b/F6/HcRV89FWhoGgIr99afKeKiXJiy9+S2juXflzDfNKWLXVoL/gbzitJQJe2TWIFqQKDdVGYnyuWw0i0/Bc7ClCCdqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P0H34ZpXj3sa+FcMN/vj5YDCEarbvC4lpBt0odIAMc=;
 b=Y8FEFl+xC3Vd+34xiqj3CGCsjpoqTWfFYnpZX34Sjy+fJa2jaEguECPvWREM6rWNn0XyfaxeE0D2cofLpWHP0mcmbllQG84DLZ2BaumeYa9g0kZLjQtmsw7TuOayD3OE+Jfz2zrPopJXq/KCTt1UG0qdQ6/uA/psHixhIIBNd5U=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2712.eurprd04.prod.outlook.com (2603:10a6:4:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Wed, 24 Jun
 2020 08:53:29 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 08:53:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 konrad.wilk@oracle.com, mst@redhat.com, jasowang@redhat.com
Subject: [PATCH] xen: introduce xen_vring_use_dma
Date: Wed, 24 Jun 2020 17:17:32 +0800
Message-Id: <20200624091732.23944-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by
 SG2PR06CA0246.apcprd06.prod.outlook.com (2603:1096:4:ac::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Wed, 24 Jun 2020 08:53:25 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1363182-65a2-4f59-943f-08d8181c10b1
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB271252F24E2615C533F09A9388950@DB6PR0402MB2712.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mpAvUN3MAvpE2dBNOq1hIK19nSFJtezhFUd0V3Z/4upNlCblRi6Wl0e+TsYY+0bcpel05AhPBC40biYbeksMfGUZ7ylBlnVj/+dwpz+mw1yIsyVE+JV5Q6e/wcqqMBaSHtpXuEAxSuy87MNi/vUXcoL6B69Xeo08zkDX/vPaUTEKDZxxpnYueXjkPI5scjccjkMgso8/h34PDNQdE+voqiSduplvtLrrt03kI8pepZn9ZXUGBK1YDzjv038Z2SI95EYzxWguf14NoJbXQ0g6HlLQhl/AkHtmkbiXWOec9GUDUkArn5wSmWik8cMsoJu5Q5fIM6NpnFZp8ynJ5YVHMPCHnrbBasCbfsI5CwmXpB2a5dkGw67yD6QB1fpC4IMw7CCZYeaNmpzyl1MHm7ZcmUWqia3ltq1nFXhLt5XNpJfAEQV8SB/UMmToq2JMaF9jdhpL7vlkebimVzk22Z85w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(6506007)(8936002)(26005)(6486002)(956004)(1076003)(6666004)(478600001)(5660300002)(4326008)(186003)(316002)(16526019)(52116002)(66946007)(6512007)(7416002)(2616005)(2906002)(83380400001)(66476007)(66556008)(86362001)(44832011)(36756003)(8676002)(966005)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OG8lcvpOfKsePRZSpoqPiKfOjSlfZR+WMFE/egKtYI2yfBBl+8ol0HEjayqHDHtp+KkCYMoGVThhpiOL3IfBJIY6oA2IH6mFpajCzEFm2q5Lhr3MyEw4EL3V5qGE0y2tBMh6eXqc/20VXATJ8R6HoRM9yubs4tsuDB17UfcFKNBE5pSAhXR7+rYw79VOkUFVs+FeeWRnheHkvvDYffaWxm3/ROFVmM2G802KEITO2U8dK27em+C6QX8o1W4te8lKcZ3nfFB+L0si/9u6oQRHHx0eSgUE/8zRumRyNlc9dIXjeDDxqceDTTZb1QuhbDEx5/fSBKjgZJdtYuveMNif3uIZxwD4kp3uxquQUYxhPqfQuwrU3rGIo7iiwR9ADrJRZ1xV42hf5seolGQPXIyEGMYLn5j9ZbW203l6Q0My3YSLJS5lcYZzrjdWxtIl2+HgbHMPP/nfqQN57SoV+uY2U5DcEk290bT9B2kpif/8je8Xj/hpsS2jEe4oF8BC9Hpr
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1363182-65a2-4f59-943f-08d8181c10b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 08:53:29.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brJo6ak5M+QkoxRVepy34lWLh9fsrJGapTz3/dUz1YVi14IcgHD4cB3AmBsLTLXbtydlTOyte1wX94/BlqOoFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2712
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
Cc: Peng Fan <peng.fan@nxp.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Export xen_swiotlb for all platforms using xen swiotlb

Use xen_swiotlb to determine when vring should use dma APIs to map the
ring: when xen_swiotlb is enabled the dma API is required. When it is
disabled, it is not required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 This is a modified version from Stefano's patch
 https://lore.kernel.org/patchwork/patch/1033801/#1222404
 Note: This is not to address rpmsg virtio issue, this is
 to let DomU virtio not using xen swiotlb could use non dma vring
 on ARM64 platforms.

 arch/arm/xen/mm.c                      | 1 +
 arch/x86/include/asm/xen/swiotlb-xen.h | 2 --
 arch/x86/xen/pci-swiotlb-xen.c         | 2 --
 drivers/virtio/virtio_ring.c           | 2 +-
 drivers/xen/swiotlb-xen.c              | 3 +++
 include/xen/swiotlb-xen.h              | 6 ++++++
 include/xen/xen.h                      | 6 ++++++
 7 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index d40e9e5fc52b..6a493ea087f0 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -139,6 +139,7 @@ static int __init xen_mm_init(void)
 	struct gnttab_cache_flush cflush;
 	if (!xen_initial_domain())
 		return 0;
+	xen_swiotlb = 1;
 	xen_swiotlb_init(1, false);
 
 	cflush.op = 0;
diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 6b56d0d45d15..bb5ce02b4e20 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -3,12 +3,10 @@
 #define _ASM_X86_SWIOTLB_XEN_H
 
 #ifdef CONFIG_SWIOTLB_XEN
-extern int xen_swiotlb;
 extern int __init pci_xen_swiotlb_detect(void);
 extern void __init pci_xen_swiotlb_init(void);
 extern int pci_xen_swiotlb_init_late(void);
 #else
-#define xen_swiotlb (0)
 static inline int __init pci_xen_swiotlb_detect(void) { return 0; }
 static inline void __init pci_xen_swiotlb_init(void) { }
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 33293ce01d8d..071fbe0e1a91 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -18,8 +18,6 @@
 #endif
 #include <linux/export.h>
 
-int xen_swiotlb __read_mostly;
-
 /*
  * pci_xen_swiotlb_detect - set xen_swiotlb to 1 if necessary
  *
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a2de775801af..768afd79f67a 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -252,7 +252,7 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
 	 * the DMA API if we're a Xen guest, which at least allows
 	 * all of the sensible Xen configurations to work correctly.
 	 */
-	if (xen_domain())
+	if (xen_vring_use_dma())
 		return true;
 
 	return false;
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b6d27762c6f8..25747e72e6fe 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -40,6 +40,9 @@
 
 #include <trace/events/swiotlb.h>
 #define MAX_DMA_BITS 32
+
+int xen_swiotlb __read_mostly;
+
 /*
  * Used to do a quick range check in swiotlb_tbl_unmap_single and
  * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index ffc0d3902b71..235babcde848 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -12,4 +12,10 @@ void xen_dma_sync_for_device(dma_addr_t handle, phys_addr_t paddr, size_t size,
 extern int xen_swiotlb_init(int verbose, bool early);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
+#ifdef CONFIG_SWIOTLB_XEN
+extern int xen_swiotlb;
+#else
+#define xen_swiotlb (0)
+#endif
+
 #endif /* __LINUX_SWIOTLB_XEN_H */
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 19a72f591e2b..c51c46f5d739 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,4 +52,10 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
+#include <xen/swiotlb-xen.h>
+static inline int xen_vring_use_dma(void)
+{
+	return !!xen_swiotlb;
+}
+
 #endif	/* _XEN_XEN_H */
-- 
2.16.4


