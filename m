Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66443AA70C5
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 13:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974588.1362408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAolH-0004Ia-Qm; Fri, 02 May 2025 11:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974588.1362408; Fri, 02 May 2025 11:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAolH-0004G9-LP; Fri, 02 May 2025 11:40:59 +0000
Received: by outflank-mailman (input) for mailman id 974588;
 Fri, 02 May 2025 11:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uekI=XS=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1uAolG-0004Db-K0
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 11:40:58 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ff52dca-274a-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 13:40:57 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
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
X-Inumbo-ID: 4ff52dca-274a-11f0-9eb4-5ba50f476ded
From: John Ernberg <john.ernberg@actia.se>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, John Ernberg
	<john.ernberg@actia.se>, "stable@kernel.org" <stable@kernel.org>
Subject: [PATCH 1/2] xen: swiotlb: Use swiotlb bouncing if kmalloc allocation
 demands it
Thread-Topic: [PATCH 1/2] xen: swiotlb: Use swiotlb bouncing if kmalloc
 allocation demands it
Thread-Index: AQHbu1cQNcuPrbmRHEK42QDjG7hf6w==
Date: Fri, 2 May 2025 11:40:55 +0000
Message-ID: <20250502114043.1968976-2-john.ernberg@actia.se>
References: <20250502114043.1968976-1-john.ernberg@actia.se>
In-Reply-To: <20250502114043.1968976-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.35]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453667460
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Xen swiotlb support was missed when the patch set starting with
4ab5f8ec7d71 ("mm/slab: decouple ARCH_KMALLOC_MINALIGN from
ARCH_DMA_MINALIGN") was merged.

When running Xen on iMX8QXP, a SoC without IOMMU, the effect was that USB
transfers ended up corrupted when there was more than one URB inflight at
the same time.

Add a call to dma_kmalloc_needs_bounce() to make sure that allocations too
small for DMA get bounced via swiotlb.

Closes: https://lore.kernel.org/linux-usb/ab2776f0-b838-4cf6-a12a-c208eb6aa=
d59@actia.se/
Fixes: 4ab5f8ec7d71 ("mm/slab: decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA=
_MINALIGN")
Cc: stable@kernel.org # v6.5+
Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

It's impossible to pick an exact fixes tag since this driver was missed
in the flagged patch set. I picked one I felt gave a decent enough picture
for someone coming across this later.
---
 drivers/xen/swiotlb-xen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 1f65795cf5d7..ef56a2500ed6 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -217,6 +217,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *d=
ev, struct page *page,
 	 * buffering it.
 	 */
 	if (dma_capable(dev, dev_addr, size, true) &&
+	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
 	    !range_straddles_page_boundary(phys, size) &&
 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
 		!is_swiotlb_force_bounce(dev))
--=20
2.49.0

