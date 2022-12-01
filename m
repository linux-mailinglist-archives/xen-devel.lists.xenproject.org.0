Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D563F515
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451029.708618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mGd-0003nZ-Kg; Thu, 01 Dec 2022 16:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451029.708618; Thu, 01 Dec 2022 16:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mGd-0003ku-I3; Thu, 01 Dec 2022 16:18:31 +0000
Received: by outflank-mailman (input) for mailman id 451029;
 Thu, 01 Dec 2022 16:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mGc-0002as-1T
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:18:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ca708677-7193-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:18:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BA32D6E;
 Thu,  1 Dec 2022 08:18:35 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD0FE3F73B;
 Thu,  1 Dec 2022 08:18:27 -0800 (PST)
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
X-Inumbo-ID: ca708677-7193-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 18/21] xen/arm: iommu: skip the iommu-map property for PCI devices
Date: Thu,  1 Dec 2022 16:02:42 +0000
Message-Id: <f023f8fbace84c83a9026bbc3aaf35173a847e36.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code skip the IOMMUS specific properties for the non PCI devices
when handling the dom0 node but there is no support to skip the IOMMUS
specific properties for the PCI devices.

This patch will add the support to skip the IOMMUS specific properties
for the PCI devices.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8e85fb7854..7cd99a6771 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1112,9 +1112,18 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
      * Use "iommu_node" as an indicator of the master device which properties
      * should be skipped.
      */
-    iommu_node = dt_parse_phandle(node, "iommus", 0);
-    if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
-        iommu_node = NULL;
+    if ( dt_device_type_is_equal(node, "pci") )
+    {
+        iommu_node = dt_parse_phandle(node, "iommu-map", 1);
+        if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
+            iommu_node = NULL;
+    }
+    else
+    {
+        iommu_node = dt_parse_phandle(node, "iommus", 0);
+        if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
+            iommu_node = NULL;
+    }
 
     dt_for_each_property_node (node, prop)
     {
-- 
2.25.1


