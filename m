Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA683AB3062
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 09:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980925.1367319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uENNG-0007pf-0c; Mon, 12 May 2025 07:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980925.1367319; Mon, 12 May 2025 07:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uENNF-0007nT-U7; Mon, 12 May 2025 07:14:53 +0000
Received: by outflank-mailman (input) for mailman id 980925;
 Mon, 12 May 2025 07:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZfZw=X4=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1uENNE-0007nN-I3
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 07:14:52 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8028dd-2f00-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 09:14:51 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 09:14:50 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Mon, 12 May 2025 09:14:50 +0200
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
X-Inumbo-ID: cb8028dd-2f00-11f0-9eb5-5ba50f476ded
From: John Ernberg <john.ernberg@actia.se>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Christoph
 Hellwig" <hch@infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v2] xen: swiotlb: Wire up map_resource callback
Thread-Topic: [PATCH v2] xen: swiotlb: Wire up map_resource callback
Thread-Index: AQHbww2MQ91Fme3GEU6/lmK+Crf+Dw==
Date: Mon, 12 May 2025 07:14:50 +0000
Message-ID: <20250512071440.3726697-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.35]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453617466
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

When running Xen on iMX8QXP, an Arm SoC without IOMMU, DMA performed via
its eDMA v3 DMA engine fail with a mapping error.

The eDMA performs DMA between RAM and MMIO space, and it's the MMIO side
that cannot be mapped.

MMIO->RAM DMA access cannot be bounce buffered if it would straddle a page
boundary and on Xen the MMIO space is 1:1 mapped for Arm, and x86 PV Dom0.
Cases where MMIO space is not 1:1 mapped, such as x86 PVH Dom0, requires an
IOMMU present to deal with the mapping.

Considering the above the map_resource callback can just be wired to the
existing dma_direct_map_resource() function.

There is nothing to do for unmap so the unmap callback is not needed.

Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

v2:
 - Just use dma_direct_map_resource() directly (Stefano Stabellini)
 - Incorporate some of the discussion and explanations from v1 into the
    commit message (Stefano, Christoph)
 - General English improvements in the commit message.
 - Just this patch now, 1/2 in the previous set was applied

v1: (series) https://lore.kernel.org/xen-devel/20250502114043.1968976-1-joh=
n.ernberg@actia.se/
---
 drivers/xen/swiotlb-xen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index ef56a2500ed6..da1a7d3d377c 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -426,4 +426,5 @@ const struct dma_map_ops xen_swiotlb_dma_ops =3D {
 	.alloc_pages_op =3D dma_common_alloc_pages,
 	.free_pages =3D dma_common_free_pages,
 	.max_mapping_size =3D swiotlb_max_mapping_size,
+	.map_resource =3D dma_direct_map_resource,
 };
--=20
2.49.0

