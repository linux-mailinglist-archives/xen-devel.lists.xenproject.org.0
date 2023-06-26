Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105F73D691
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555104.866896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5u-0005gV-99; Mon, 26 Jun 2023 03:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555104.866896; Mon, 26 Jun 2023 03:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5t-0005Sx-Fg; Mon, 26 Jun 2023 03:40:49 +0000
Received: by outflank-mailman (input) for mailman id 555104;
 Mon, 26 Jun 2023 03:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2t-0000HH-NL
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ce34796e-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A525B1FB;
 Sun, 25 Jun 2023 20:38:25 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE5633F64C;
 Sun, 25 Jun 2023 20:37:38 -0700 (PDT)
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
X-Inumbo-ID: ce34796e-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 49/52] xen/mpu: enable device passthrough in MPU system
Date: Mon, 26 Jun 2023 11:34:40 +0800
Message-Id: <20230626033443.2943270-50-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to enable device passthrough in MPU system, we only need to
provide p2m_mmio_direct_dev permission set up.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/mpu/p2m.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index e21b76813d..a68a06105f 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -185,11 +185,15 @@ static void p2m_set_permission(pr_t *region, p2m_type_t t)
         region->prbar.reg.ap = AP_RO_ALL;
         break;
 
+    case p2m_mmio_direct_dev:
+        region->prbar.reg.xn = XN_P2M_ENABLED;
+        region->prbar.reg.ap = AP_RW_ALL;
+        break;
+
     case p2m_max_real_type:
         BUG();
         break;
 
-    case p2m_mmio_direct_dev:
     case p2m_mmio_direct_nc:
     case p2m_mmio_direct_c:
     case p2m_iommu_map_ro:
@@ -233,6 +237,11 @@ static inline pr_t region_to_p2m_entry(mfn_t smfn, unsigned long nr_mfn,
         prlar.reg.ai = MT_NORMAL;
         break;
 
+    case p2m_mmio_direct_dev:
+        prbar.reg.sh = LPAE_SH_OUTER;
+        prlar.reg.ai = MT_DEVICE_nGnRE;
+        break;
+
     default:
         panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m type in MPU system\n");
         break;
-- 
2.25.1


