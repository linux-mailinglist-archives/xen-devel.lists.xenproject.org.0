Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F819AE18ED
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 12:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020805.1396947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZ1w-0007yW-LP; Fri, 20 Jun 2025 10:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020805.1396947; Fri, 20 Jun 2025 10:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZ1w-0007wz-I9; Fri, 20 Jun 2025 10:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1020805;
 Fri, 20 Jun 2025 10:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0sw=ZD=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uSZ1v-0007f1-CS
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 10:31:31 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b90f4a70-4dc1-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 12:31:29 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 5C96880C0884; Fri, 20 Jun 2025 16:01:26 +0530 (IST)
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
X-Inumbo-ID: b90f4a70-4dc1-11f0-a30e-13f23c93f187
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug output
Date: Fri, 20 Jun 2025 16:01:23 +0530
Message-Id: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Fix typo in source comment ("you can found" -> "which can be found").
- Add dsb(sy) after IMCTR write to ensure flush is complete before polling.
- Add dev_info() log in ipmmu_device_reset() to indicate the number of disabled contexts.

These changes improve memory operation ordering, code readability, and runtime traceability
for IPMMU on R-Car Gen3/Gen4 SoCs

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index d828d9cf6a..dac0dd6d46 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -13,7 +13,7 @@
  *
  * Based on Linux's IPMMU-VMSA driver from Renesas BSP:
  *    drivers/iommu/ipmmu-vmsa.c
- * you can found at:
+ * which can be found at:
  *    url: git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git
  *    branch: v4.14.75-ltsi/rcar-3.9.6
  *    commit: e206eb5b81a60e64c35fbc3a999b1a0db2b98044
@@ -433,6 +433,8 @@ static void ipmmu_tlb_invalidate(struct ipmmu_vmsa_domain *domain)
     data |= IMCTR_FLUSH;
     ipmmu_ctx_write_all(domain, IMCTR, data);
 
+    /* Force IMCTR write to complete before polling to avoid false completion check. */
+    dsb(sy);
     ipmmu_tlb_sync(domain);
 }
 
@@ -780,6 +782,8 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
     /* Disable all contexts. */
     for ( i = 0; i < mmu->num_ctx; ++i )
         ipmmu_ctx_write(mmu, i, IMCTR, 0);
+
+    dev_info(mmu->dev, "Reset completed, disabled %u contexts\n", mmu->num_ctx);
 }
 
 /* R-Car Gen3/Gen4 SoCs product and cut information. */
-- 
2.34.1


