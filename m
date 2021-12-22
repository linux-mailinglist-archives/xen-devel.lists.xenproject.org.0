Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D347D2FC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 14:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250827.432002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01Wm-0007JZ-3Q; Wed, 22 Dec 2021 13:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250827.432002; Wed, 22 Dec 2021 13:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n01Wl-0007HP-WF; Wed, 22 Dec 2021 13:19:32 +0000
Received: by outflank-mailman (input) for mailman id 250827;
 Wed, 22 Dec 2021 13:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCiG=RH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1n01Wk-0006y0-Km
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 13:19:30 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caae597e-6329-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 14:19:29 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 65E3415E433;
 Wed, 22 Dec 2021 08:19:28 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 6031F15E432;
 Wed, 22 Dec 2021 08:19:28 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 10C1315E431;
 Wed, 22 Dec 2021 08:19:24 -0500 (EST)
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
X-Inumbo-ID: caae597e-6329-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=F0PgryYWioSUzsUd3xm/n5rTm
	EZFGYn3xClDnUlKbqc=; b=XITYhVfcDKp5AfVxTFcOc3I8Nt0LGvLRXvsTgNsFi
	vW1pxgQoAAilxHKSPRuF57uAApbO4+ZkV1XjBDnvJjglXM7o04CRfcuPc/6zafO2
	StMjOf4T+GTEbS9afYJQh98PwAe7gtiAJhrKBbQujY9FtLaOuGWJekbfQwKX/qlS
	4Y=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [PATCH 1/1] arm/xen: don't use xen DMA ops when the device is protected by an IOMMU
Date: Wed, 22 Dec 2021 13:18:47 +0000
Message-Id: <20211222131847.2476835-3-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com>
References: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C7EF5AF0-6329-11EC-B4E6-CBA7845BAAA9-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Only Xen is able to know if a device can safely avoid to use xen-swiotlb.
However since Xen links FDT nodes of protected devices to special dummy
xen-iommu node we can use that information to decide whether
xen-swiotlb is needed.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 arch/arm/mm/dma-mapping.c   | 2 +-
 arch/arm/xen/enlighten.c    | 9 +++++++++
 arch/arm64/mm/dma-mapping.c | 2 +-
 include/xen/swiotlb-xen.h   | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index c4b8df2ad328..fc875dd16e0e 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -2280,7 +2280,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma=
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
index 49f566ad9acb..b36659238db3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -66,6 +66,15 @@ static __read_mostly unsigned int xen_events_irq;
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
index 93e87b287556..68248e72e052 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_bas=
e, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, size);
=20
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_initial_domain() && !xen_is_protected_device(dev))
 		dev->dma_ops =3D &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index d5eaf9d682b8..00b2782430fb 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -8,6 +8,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t =
handle,
 			  size_t size, enum dma_data_direction dir);
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
+bool xen_is_protected_device(struct device *dev);
=20
 extern int xen_swiotlb_init(int verbose, bool early);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
--=20
2.25.1


