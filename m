Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36FAA70C7
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 13:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974589.1362421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAolK-0004ig-WB; Fri, 02 May 2025 11:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974589.1362421; Fri, 02 May 2025 11:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAolK-0004g5-TB; Fri, 02 May 2025 11:41:02 +0000
Received: by outflank-mailman (input) for mailman id 974589;
 Fri, 02 May 2025 11:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uekI=XS=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1uAolJ-0004fV-OM
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 11:41:01 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fb32e48-274a-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 13:40:56 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 13:40:56 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Fri, 2 May 2025 13:40:56 +0200
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
X-Inumbo-ID: 4fb32e48-274a-11f0-9ffb-bf95429c2676
From: John Ernberg <john.ernberg@actia.se>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
Thread-Topic: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
Thread-Index: AQHbu1cR+sKkXAZoXEOAUfrcrER15w==
Date: Fri, 2 May 2025 11:40:56 +0000
Message-ID: <20250502114043.1968976-3-john.ernberg@actia.se>
References: <20250502114043.1968976-1-john.ernberg@actia.se>
In-Reply-To: <20250502114043.1968976-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.35]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453667460
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Needed by the eDMA v3 DMA engine found in iommu-less SoCs such as iMX8QXP
to be able to perform DMA operations as a Xen Hardware Domain, which needs
to be able to do DMA in MMIO space.

The callback implementation is basically the same as the one for direct
mapping of resources, except this also takes into account Xen page
mappings.

There is nothing to do for unmap, just like with direct, so the unmap
callback is not needed.

Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

I originally exported dma_direct_map_resource() and used that which
appeared to work, but it felt like not checking Xen page mappings wasn't
fully correct and I went with this. But if dma_direct_map_resource() is
the correct approach here then I can submit that isntead.
---
 drivers/xen/swiotlb-xen.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index ef56a2500ed6..0f02fdd9128d 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -285,6 +285,20 @@ static void xen_swiotlb_unmap_page(struct device *hwde=
v, dma_addr_t dev_addr,
 					   attrs, pool);
 }
=20
+static dma_addr_t xen_swiotlb_map_resource(struct device *dev, phys_addr_t=
 phys,
+					   size_t size, enum dma_data_direction dir,
+					   unsigned long attrs)
+{
+	dma_addr_t dev_addr =3D xen_phys_to_dma(dev, phys);
+
+	BUG_ON(dir =3D=3D DMA_NONE);
+
+	if (!dma_capable(dev, dev_addr, size, false))
+		return DMA_MAPPING_ERROR;
+
+	return dev_addr;
+}
+
 static void
 xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
@@ -426,4 +440,5 @@ const struct dma_map_ops xen_swiotlb_dma_ops =3D {
 	.alloc_pages_op =3D dma_common_alloc_pages,
 	.free_pages =3D dma_common_free_pages,
 	.max_mapping_size =3D swiotlb_max_mapping_size,
+	.map_resource =3D xen_swiotlb_map_resource,
 };
--=20
2.49.0

