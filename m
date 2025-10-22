Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F84BFB385
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147745.1479931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVF-0007Ru-IK; Wed, 22 Oct 2025 09:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147745.1479931; Wed, 22 Oct 2025 09:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVF-0007QH-Ex; Wed, 22 Oct 2025 09:51:33 +0000
Received: by outflank-mailman (input) for mailman id 1147745;
 Wed, 22 Oct 2025 09:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q51i=47=bounce.vates.tech=bounce-md_30504962.68f8a919.v1-92eae8be8cab4148a34e7f6f293f1524@srs-se1.protection.inumbo.net>)
 id 1vBVVD-0007BN-Pr
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:51:31 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2b547a-af2c-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 11:51:22 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4cs4Dn13rHzDRJHK4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 09:51:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 92eae8be8cab4148a34e7f6f293f1524; Wed, 22 Oct 2025 09:51:21 +0000
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
X-Inumbo-ID: aa2b547a-af2c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761126681; x=1761396681;
	bh=Z19jcW4y7eMkW61Dtah/xs2jKM8h/ya64whHhXGW4tg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QQKlsMZshX+p3vUUNoOYyaGzsBbATBUUuLcQyevFZQ9H4QMKnKpriuGR3lsqu2Nn8
	 I+oItd0zNN9XPet/FoNe96tN8ujlaieqVeiQp4Tq9P5zsCOL2t0Vx7TUsluGPUAimv
	 IYiQa+UUo+NSuHZYU1cEeAnEXSeJw6Vfu+vJ9U7Fg4Qbgc+IT8b3a1ti72L0kbv/Ep
	 ToR7xHvHa2ZydKs0PAf/pE1JhttCC6v1m6ipKSzpIWYsaxlt8qc0XQBLMMQH1QFH+p
	 I7ogEKxYr8G6qvEGIroYP5082GyFK6p1xO9WJ8qyOTbjBkJv1HVVQ1XrJ8WdcC1e7l
	 hnveCPcY09PnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761126681; x=1761387181; i=teddy.astie@vates.tech;
	bh=Z19jcW4y7eMkW61Dtah/xs2jKM8h/ya64whHhXGW4tg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GtRrB25h/64dSYrr2qcV3SFd3O/iXe07gwturj8JBks+cymloCicM9XAqbYb7Rww0
	 PQ1+uWfgt4m7Q9OIa1NflDFV4rF1u/m0ib1UvFEvu0pbwBGtUllPG4lZw5PqTI+tmN
	 pYlHVhBEI9+AEdPME1KK1kAbHhD4KOhE2o5c2Hiq6DWIjYjDOCxV5/2jBwVvROmUfJ
	 4R9VSGuC7bPpfPFnOmTkYp95k30tDMLrmK76rogOdDEnVdxfrzp6mBLNd7aIsMxnYs
	 BMaT6OeBddcWLqewLB2EdzZnIzCmFOEakGlnuXs1PvPVUUjVR8k2a35amyCDwgWq3e
	 zYErOhxSQML9g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/4]=20vtd:=20Move=20(un)map=5Fvtd=5Fdomain=5Fpage=20to=20extern.h?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761126680273
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <74ff3496afcc0a0b747f9ea203d10f51e6b4d00c.1761124632.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761124632.git.teddy.astie@vates.tech>
References: <cover.1761124632.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.92eae8be8cab4148a34e7f6f293f1524?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 09:51:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

These functions are basically wrappers of map_domain_page; move
them to the shared extern.h and make them inline to help with code
generation.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/extern.h  | 13 +++++++++++--
 xen/drivers/passthrough/vtd/x86/vtd.c | 10 ----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index c16583c951..a62310b3e7 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -21,6 +21,7 @@
 #define DRIVERS__PASSTHROUGH__VTD__EXTERN_H
 
 #include "dmar.h"
+#include <xen/domain_page.h>
 #include <xen/keyhandler.h>
 
 #define VTDPREFIX "[VT-D]"
@@ -78,8 +79,6 @@ int __must_check qinval_device_iotlb_sync(struct vtd_iommu *iommu,
 
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
-void *map_vtd_domain_page(u64 maddr);
-void unmap_vtd_domain_page(const void *va);
 int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
                                uint8_t bus, uint8_t devfn,
                                const struct pci_dev *pdev, domid_t domid,
@@ -114,4 +113,14 @@ void quirk_iommu_caps(struct vtd_iommu *iommu);
 bool platform_supports_intremap(void);
 bool platform_supports_x2apic(void);
 
+static inline void *map_vtd_domain_page(u64 maddr)
+{
+    return map_domain_page(_mfn(paddr_to_pfn(maddr)));
+}
+
+static inline void unmap_vtd_domain_page(const void *va)
+{
+    unmap_domain_page(va);
+}
+
 #endif // DRIVERS__PASSTHROUGH__VTD__EXTERN_H
diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthrough/vtd/x86/vtd.c
index 76f12adc23..b0798dc6a1 100644
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -36,13 +36,3 @@
  * 1:1 iommu mappings except xen and unusable regions.
  */
 boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
-
-void *map_vtd_domain_page(u64 maddr)
-{
-    return map_domain_page(_mfn(paddr_to_pfn(maddr)));
-}
-
-void unmap_vtd_domain_page(const void *va)
-{
-    unmap_domain_page(va);
-}
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


