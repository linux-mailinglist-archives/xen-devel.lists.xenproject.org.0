Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9DC73A3B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166871.1493383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YD-0004tT-Lm; Thu, 20 Nov 2025 11:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166871.1493383; Thu, 20 Nov 2025 11:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2YD-0004oA-87; Thu, 20 Nov 2025 11:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1166871;
 Thu, 20 Nov 2025 11:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2SP=54=bounce.vates.tech=bounce-md_30504962.691ef70b.v1-333301a5be55468c8714a95308cc1089@srs-se1.protection.inumbo.net>)
 id 1vM2YA-0001PI-HQ
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:10:06 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 773bb9eb-c601-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 12:10:05 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwcC6CBBzCf9RNt
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:10:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 333301a5be55468c8714a95308cc1089; Thu, 20 Nov 2025 11:10:03 +0000
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
X-Inumbo-ID: 773bb9eb-c601-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763637003; x=1763907003;
	bh=OapH2MHIAp2S9SzCUt8Ia8Mv+id8AIAMINW1iJ5dAfE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Jp2p+1KeTvywnHXgSG0oxl/a8lGjcpFy4rFBghie0PnFIpRiZQt2WTeyhgwqzDJ6F
	 avpDRRFEqFc/SUEyQ2wlZVj0FVpTf4RYBAtBPkcSyY6+7PdQVViToBCCwQjp0HKMJ9
	 ePzbvESK6hKxEz27HGxiDUMVBZS+ctvcXKXFxawAY+oQB+M5USMIG8rBOaJwcnSetp
	 cT9sAvA2wssSrckTqRaTFJQirtUhLOCIL10/2hK61Gyrt/+cVSptA/CaCvN8Wj75Zt
	 BPekcCwXMJOWpXgrMHllpM3QBrbFKUbx3fwtGc15rmXJXZpqactD94qJnfAaM/DjJl
	 IRsU4Zc6Ye+fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763637003; x=1763897503; i=teddy.astie@vates.tech;
	bh=OapH2MHIAp2S9SzCUt8Ia8Mv+id8AIAMINW1iJ5dAfE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uO4O5eVg6yTsY160J+28UUzEm9nDlhADy386XkTaha/1jnjIwd6dbf6QVg9RYngng
	 cgYD3VSNGu1Da16Va2ehHUpwl7bwUX+8wMeJ/xG3TcJnimAZ3uS0dIbmPRcIy5HItu
	 31KGPrUZR1menlWjhGIaXOAN57oyI9rRUYDpfuNuSXnJyS6ncrXvFKr2GQ1OOsE4OV
	 v3kwkXw6vdT+r/6YYTXMqtihg4XYfPZlHCGsO8gAB4ev5vvGZxFddhGA1y261uIorY
	 fU7LnQe0P3aZ6WcdT6meFh8dzKLarsZkAhDv6k04j2x6rQCguwqCUS681g1ggvQTvQ
	 A0camm/PTgl5g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2011/14]=20iommu:=20Introduce=20iommu=5Fget=5Fmax=5Fiova?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763637002749
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <a7541fa86390a281a301942487e2518262524f60.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.333301a5be55468c8714a95308cc1089?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:10:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Provide a way to know what maximum IOVA is usable for DMA.
This will be later used by PV-IOMMU to provide limits to guest.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v7: introduced
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 15 +++++++++++++++
 xen/drivers/passthrough/iommu.c             | 10 ++++++++++
 xen/drivers/passthrough/vtd/iommu.c         |  8 ++++++++
 xen/include/xen/iommu.h                     |  3 +++
 4 files changed, 36 insertions(+)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3d08a925d6..4185e4cd64 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -706,6 +706,20 @@ static void cf_check amd_dump_page_tables(struct domain *d)
     }
 }
 
+static uint64_t cf_check amd_iommu_get_max_iova(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int bits = 12 + hd->arch.amd.paging_mode * 9;
+
+    /* If paging_mode == 6, which indicates 6-level page tables,
+       we have bits == 66 while the GPA space is still 64-bits
+     */
+    if (bits >= 64)
+        return ~0LLU;
+
+    return (1LLU << bits) - 1;
+}
+
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G,
     .init = amd_iommu_domain_init,
@@ -736,6 +750,7 @@ static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .get_reserved_device_memory = amd_iommu_get_reserved_device_memory,
     .dump_page_tables = amd_dump_page_tables,
     .quiesce = amd_iommu_quiesce,
+    .get_max_iova = amd_iommu_get_max_iova,
 };
 
 static const struct iommu_init_ops __initconstrel _iommu_init_ops = {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index feda2e390b..4434a9dcd0 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -1229,6 +1229,16 @@ bool iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
+uint64_t iommu_get_max_iova(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    if ( !hd->platform_ops->get_max_iova )
+        return 0;
+
+    return iommu_call(hd->platform_ops, get_max_iova, d);
+}
+
 #define MAX_EXTRA_RESERVED_RANGES 20
 struct extra_reserved_range {
     unsigned long start;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index a602edd755..af3c6fb178 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2595,6 +2595,13 @@ static int cf_check intel_iommu_remove_devfn(struct domain *d, struct pci_dev *p
     return unapply_context_single(d, drhd->iommu, prev_ctx, pdev->bus, devfn);
 }
 
+static uint64_t cf_check intel_iommu_get_max_iova(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    return (1LLU << agaw_to_width(hd->arch.vtd.agaw)) - 1;
+}
+
 static void cf_check vtd_quiesce(void)
 {
     const struct acpi_drhd_unit *drhd;
@@ -2644,6 +2651,7 @@ static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
     .dump_page_tables = vtd_dump_page_tables,
     .quiesce = vtd_quiesce,
+    .get_max_iova = intel_iommu_get_max_iova,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 8c20f575ee..66951c9809 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -403,6 +403,9 @@ struct iommu_ops {
 #endif
     /* Inhibit all interrupt generation, to be used at shutdown. */
     void (*quiesce)(void);
+
+    /* Get maximum domain device address (IOVA). */
+    uint64_t (*get_max_iova)(struct domain *d);
 };
 
 /*
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


