Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF28B15AE0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 10:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063530.1429235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Rd-0007EH-3s; Wed, 30 Jul 2025 08:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063530.1429235; Wed, 30 Jul 2025 08:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Rd-0007D7-0s; Wed, 30 Jul 2025 08:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1063530;
 Wed, 30 Jul 2025 08:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUWP=2L=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uh2Rb-0006zM-JZ
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 08:45:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 987d4913-6d21-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 10:45:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C0721BC0;
 Wed, 30 Jul 2025 01:45:42 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.73.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098FF3F66E;
 Wed, 30 Jul 2025 01:45:48 -0700 (PDT)
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
X-Inumbo-ID: 987d4913-6d21-11f0-a320-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/5] arm/mpu: Implement setup_frametable_mappings for MPU systems
Date: Wed, 30 Jul 2025 09:45:30 +0100
Message-ID: <f08c240934fc126b651096a315da84d2d8e15197.1753864612.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1753864612.git.hari.limaye@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement the MPU variant of `setup_frametable_mappings`. This function
will be called by `setup_mm` when an implementation for MPU systems is
added in a follow up commit.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
 xen/arch/arm/mpu/mm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index c6891607ec..6a16fa348d 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -168,6 +168,25 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
     return MPUMAP_REGION_NOTFOUND;
 }
 
+/* Map a frame table to cover physical addresses ps through pe */
+void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    mfn_t base_mfn;
+    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
+                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
+    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
+
+    frametable_base_pdx = paddr_to_pdx(ps);
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


