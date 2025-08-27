Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371ECB387DF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 18:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096535.1451199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJCn-0005Dy-J6; Wed, 27 Aug 2025 16:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096535.1451199; Wed, 27 Aug 2025 16:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJCn-0005BS-GW; Wed, 27 Aug 2025 16:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1096535;
 Wed, 27 Aug 2025 16:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrvt=3H=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1urJCm-0004w9-Db
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 16:41:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9c5b60cd-8364-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 18:40:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78A6B152B;
 Wed, 27 Aug 2025 09:40:50 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.64.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8546B3F738;
 Wed, 27 Aug 2025 09:40:57 -0700 (PDT)
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
X-Inumbo-ID: 9c5b60cd-8364-11f0-aeb2-fb57b961d000
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/5] arm/mpu: Implement setup_frametable_mappings for MPU systems
Date: Wed, 27 Aug 2025 17:35:09 +0100
Message-ID: <99af1bac04c89a0c912f7f9c7e134ce79049e2a3.1756312498.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1756312498.git.hari.limaye@arm.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement the MPU variant of `setup_frametable_mappings`. This function
will be called by `setup_mm` when an implementation for MPU systems is
added in a follow up commit.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v1:
- Align ps and pe to page size
- Add sanity checking for frametable size, as in MMU version
- Add Michal's R-b
---
 xen/arch/arm/mpu/mm.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index c6891607ec..3f155b7db2 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -168,6 +168,39 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
     return MPUMAP_REGION_NOTFOUND;
 }
 
+/* Map a frame table to cover physical addresses ps through pe */
+void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    mfn_t base_mfn;
+    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
+    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
+
+    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(aligned_pe), -1)) -
+                            mfn_to_pdx(maddr_to_mfn(aligned_ps)) + 1;
+    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
+
+    /*
+     * The size of paddr_t should be sufficient for the complete range of
+     * physical address.
+     */
+    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
+    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
+              ps, pe);
+
+    frametable_base_pdx = paddr_to_pdx(aligned_ps);
+    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
+
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
+    frame_table = (struct page_info *)mfn_to_virt(mfn_x(base_mfn));
+
+    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
+    memset(&frame_table[nr_pdxs], -1,
+           frametable_size - (nr_pdxs * sizeof(struct page_info)));
+}
+
 /*
  * Allocate an entry for a new EL2 MPU region in the bitmap xen_mpumap_mask.
  * @param idx   Set to the index of the allocated EL2 MPU region on success.
-- 
2.34.1


