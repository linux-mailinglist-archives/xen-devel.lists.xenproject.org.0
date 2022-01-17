Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27D4908E6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 13:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258171.444329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9RM4-0007mX-GP; Mon, 17 Jan 2022 12:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258171.444329; Mon, 17 Jan 2022 12:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9RM4-0007kO-Cu; Mon, 17 Jan 2022 12:43:24 +0000
Received: by outflank-mailman (input) for mailman id 258171;
 Mon, 17 Jan 2022 12:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dQ8=SB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1n9RM2-0007E9-57
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 12:43:22 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d18e35f-7793-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 13:43:21 +0100 (CET)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 24B6710CFB5;
 Mon, 17 Jan 2022 07:43:20 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 1DA1210CFB4;
 Mon, 17 Jan 2022 07:43:20 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 8609810CFB3;
 Mon, 17 Jan 2022 07:43:19 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 0d18e35f-7793-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=1Y9jeSy+H7oeySABufDfja5st
	9AviOj1ziyeeSJthVY=; b=VWyMejs5a88+TkTlBowB84FC9rpPD/V5BTX3fnLdx
	qqqCrHy/SmTMi9aUkUQkmSbcH5wSklQswbRrkq0umtxv6b4ixYShUzHXOYeY82CS
	CJmiseBGMr34WtpO5oTYs3qFiKO0HSeF+1ZzBtdAi/5QXfm5XZB3OwzuBeFFyW5x
	Bc=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] arm/xen: don't use xen DMA ops when the device is protected by an IOMMU
Date: Mon, 17 Jan 2022 12:32:51 +0000
Message-Id: <20220117123251.140867-3-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 0C8633E6-7793-11EC-8825-5E84C8D8090B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Only Xen is able to know if a device can safely avoid to use xen-swiotlb.
However since Xen links FDT nodes of protected devices to special dummy
xen-iommu node we can use that information to decide whether
xen-swiotlb is needed.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
Changelog:

v3: rebased over master & documented DT binding
    https://lists.xenproject.org/archives/html/xen-devel/2021-12/msg01755=
.html

v2: re-use common iommu dt bindings to let guests know which devices are =
protected:
    https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00073=
.html

 arch/arm/mm/dma-mapping.c   | 2 +-
 arch/arm/xen/enlighten.c    | 9 +++++++++
 arch/arm64/mm/dma-mapping.c | 2 +-
 include/xen/swiotlb-xen.h   | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 4b61541853ea..73495f0b0a4d 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -2286,7 +2286,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma=
_base, u64 size,
 	set_dma_ops(dev, dma_ops);
=20
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_initial_domain() && !xen_is_protected_device(dev))
 		dev->dma_ops =3D &xen_swiotlb_dma_ops;
 #endif
 	dev->archdata.dma_ops_setup =3D true;
diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 7619fbffcea2..0c2f0b77c8b9 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -63,6 +63,15 @@ static __read_mostly unsigned int xen_events_irq;
 uint32_t xen_start_flags;
 EXPORT_SYMBOL(xen_start_flags);
=20
+bool xen_is_protected_device(struct device *dev)
+{
+	struct fwnode_handle *fwnode =3D
+		fwnode_find_reference(dev_fwnode(dev), "iommus", 0) ;
+	if (IS_ERR(fwnode))
+		return false;
+	return of_device_is_compatible(to_of_node(fwnode), "xen,iommu-el2-v1");
+}
+
 int xen_unmap_domain_gfn_range(struct vm_area_struct *vma,
 			       int nr, struct page **pages)
 {
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 6719f9efea09..2f2b5921bf68 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_bas=
e, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
=20
 #ifdef CONFIG_XEN
-	if (xen_swiotlb_detect())
+	if (xen_swiotlb_detect() && !xen_is_protected_device(dev))
 		dev->dma_ops =3D &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index b3e647f86e3e..f3d805f2246f 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -9,6 +9,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t =
handle,
 			  size_t size, enum dma_data_direction dir);
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
+bool xen_is_protected_device(struct device *dev);
=20
 int xen_swiotlb_init(void);
 void __init xen_swiotlb_init_early(void);
--=20
2.25.1


