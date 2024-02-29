Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F586CCF1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687196.1070274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKW-00011Q-2a; Thu, 29 Feb 2024 15:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687196.1070274; Thu, 29 Feb 2024 15:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKV-0000vn-Rg; Thu, 29 Feb 2024 15:28:15 +0000
Received: by outflank-mailman (input) for mailman id 687196;
 Thu, 29 Feb 2024 15:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKT-00087e-KT
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26a97bd9-d717-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:28:13 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 2112C4EE074F;
 Thu, 29 Feb 2024 16:28:12 +0100 (CET)
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
X-Inumbo-ID: 26a97bd9-d717-11ee-afd8-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Rahul Singh <rahul.singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 06/10] arm/smmu: address some violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:27:58 +0100
Message-Id: <8bbf294d832b973648e84e5d837b1878a84f7645.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/arm/smmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 625ed0e41961..83196057a937 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -242,7 +242,7 @@ struct arm_smmu_xen_device {
 	struct iommu_group *group;
 };
 
-#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->iommu)
+#define dev_archdata(dev) ((struct arm_smmu_xen_device *)(dev)->iommu)
 #define dev_iommu_domain(dev) (dev_archdata(dev)->domain)
 #define dev_iommu_group(dev) (dev_archdata(dev)->group)
 
@@ -627,7 +627,7 @@ struct arm_smmu_master_cfg {
 };
 #define INVALID_SMENDX			-1
 #define for_each_cfg_sme(cfg, i, idx, num) \
-	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
+	for (i = 0; idx = (cfg)->smendx[i], (i) < (num); ++(i))
 
 struct arm_smmu_master {
 	struct device_node		*of_node;
-- 
2.34.1


