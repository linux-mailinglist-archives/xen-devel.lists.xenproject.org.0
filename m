Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA667313E05
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 19:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83034.153750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9BbN-0002ei-3Q; Mon, 08 Feb 2021 18:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83034.153750; Mon, 08 Feb 2021 18:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9BbN-0002eJ-0M; Mon, 08 Feb 2021 18:49:37 +0000
Received: by outflank-mailman (input) for mailman id 83034;
 Mon, 08 Feb 2021 18:49:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9BbM-0002dz-52
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 18:49:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c44e7bbf-4292-451f-813e-4dd408d60eb7;
 Mon, 08 Feb 2021 18:49:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6DA464E73;
 Mon,  8 Feb 2021 18:49:33 +0000 (UTC)
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
X-Inumbo-ID: c44e7bbf-4292-451f-813e-4dd408d60eb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612810174;
	bh=x3jT2WCNesc6xdYA2+YmBtliItPWwumDdnPHxTeTnlk=;
	h=From:To:Cc:Subject:Date:From;
	b=eh9dMUAYisypWCgBOwzHM2vf/y9QoxFtA5lIEib9mKE+OuwvWvHDp0T5yEL3mSuHb
	 +Kc+Iuemxh6KO3fWkKg60XwLJh9n/i5wDJXe9NLFvUzwewI08zozSFXg0gQumN5Flb
	 wXBJ6jLMb7ZgsP0vwFYnH2M1yjCgXKLGJWJ+dhDKFYoto6vSFOTmBh4N6UxGYpuoRk
	 fzMDGKOTq/dgeisZr/Bj1DQcKVthDInE+6Y9LCElUgCMnPOMWSDO9D6KJxlkfPWNJb
	 x0ZwmlmpnlS6Anh4nbhFw/DlEPHtlw3OXyqvrGGBytsNt2utR7cmLhzflnQOC1nK0h
	 gye6MzoNk4Srw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: lucmiccio@gmail.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Rahul.Singh@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Date: Mon,  8 Feb 2021 10:49:32 -0800
Message-Id: <20210208184932.23468-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
The offending chunk is:

 #define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && need_iommu(d))
+    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))

On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
directly mapped and IOMMU is enabled for the domain, like the old check
did, but the new check is always false.

In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
need_sync is set as:

    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
        hd->need_sync = !iommu_use_hap_pt(d);

iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
P2M. It is true on ARM. need_sync means that you have a separate IOMMU
page-table and it needs to be updated for every change. need_sync is set
to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
which is wrong.

As a consequence, when using PV network from a domU on a system where
IOMMU is on from Dom0, I get:

(XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
[   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK

The fix is to go back to something along the lines of the old
implementation of gnttab_need_iommu_mapping.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Fixes: 91d4eca7add
Backport: 4.12+

---

Given the severity of the bug, I would like to request this patch to be
backported to 4.12 too, even if 4.12 is security-fixes only since Oct
2020.

For the 4.12 backport, we can use iommu_enabled() instead of
is_iommu_enabled() in the implementation of gnttab_need_iommu_mapping.

Changes in v2:
- improve commit message
- add is_iommu_enabled(d) to the check
---
 xen/include/asm-arm/grant_table.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
index 6f585b1538..0ce77f9a1c 100644
--- a/xen/include/asm-arm/grant_table.h
+++ b/xen/include/asm-arm/grant_table.h
@@ -89,7 +89,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
     (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
 
 #define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
+    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
 
 #endif /* __ASM_GRANT_TABLE_H__ */
 /*
-- 
2.17.1


