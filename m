Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E071F753
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542799.847176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4sya-0003l7-UU; Fri, 02 Jun 2023 00:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542799.847176; Fri, 02 Jun 2023 00:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syZ-0003Z8-Nl; Fri, 02 Jun 2023 00:49:07 +0000
Received: by outflank-mailman (input) for mailman id 542799;
 Fri, 02 Jun 2023 00:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syU-00018B-AB
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42edd0b9-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:59 +0200 (CEST)
Received: from DM6PR06CA0028.namprd06.prod.outlook.com (2603:10b6:5:120::41)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Fri, 2 Jun 2023 00:48:54 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::16) by DM6PR06CA0028.outlook.office365.com
 (2603:10b6:5:120::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:54 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:52 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:51 -0500
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
X-Inumbo-ID: 42edd0b9-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1dreupGVujvSg/z+Wqao6TRb24z6Eo5sPR42CqhbGe2reI8sJ9DUnie7v4Jp/Vk3coLPf7VWT941Vj+GoCvX9VuOlUfBzWbOLJD2EeN+bMpDWF6xfB/1kFeVYNVj6kb3Y952Oqc4VRfbfpXHFtUEqoaOq4pTNV4EoJl6/QbyAhvmiK5FHdoSHAKO6slyV135DRYpy7NTxKSvYcHan2vjeDoUaffcCy+BZ/MKGpoPWaXDCzC/GclrnEKmKr8Sd7F49z+havEQ85ZCrB55efaQKDs+Pxhu0t50RIsE3iDJlOn8i2eYYaknkqcATt7A4W99EfGYpeD/u1jMyYTWhg9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBab6IziVUb8VqAgLKyxqLfCTUlQNBsFeFHWzmZz53Q=;
 b=lUCbA0cVQvu+JGz77SuhGKpUuFxm0vMmT1xi+oLSf7TwkcbrOSZpRZZ/YiR/7apFYlKRPmbHMzFOoC5ETcLzwvlTnFQJ90ipKWBDDUJjQAhUiEA61+dn/IJyJV7qRhrFwVLkuomcDCoyJ+wEzyIgHwzVASSKWcOABvJK4eLjueJUU+VoqECDrIPIEmoxPwjEOHestXj7K9DvIt4ZiFTOtwFACnJV/xKxyD06J9YlyWNgClxcLIRaURXZ9lLvZ2ugxJ+em9+LMKGQunLreVuaux3hcv/VSwjKpbIdRtMdkenkv+1aCOKl6f/MHzFl1j7HsIUNQow+iNukm3yvR+yIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBab6IziVUb8VqAgLKyxqLfCTUlQNBsFeFHWzmZz53Q=;
 b=4uc+/KsJhACoD8vcNwCd5CEbLUxco53XCTLFNFkQIxIoXwo6amGGz9fYYpZcxGvxXC+lpNHfw61koA3Mouf7DBHO2w06GGFLfRDBaHdFVciIVCqYIJ+eUMS0PONUa7Vy49uJFdKp0M+Xw0lcDBF4FnrwdjbPijfdJxlaVuskeR8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Thu, 1 Jun 2023 17:48:14 -0700
Message-ID: <20230602004824.20731-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT052:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: c22cd97e-2869-4017-2b83-08db630323f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2figlig/kEBWEXIlqMT7DFbL03nzTvTlqiYQPY3FY3AWx0nTwM6Y8NcETmvUuHbj3bVC6obAdyaYdJhzDX5dFDkdApkZ2+PZn7sInpguOK+EmBCB7mXPW4H3YuPGUJDmX89+vDBKGPDLt2ZfPFngDO2XMy2blHWKWIcm64k/wbohEXN0MxTpPZ7uzbTOfwqBElb/bobXYsaTqlrUqbNpmBUhxXigbh6jkWu1B4fdw8/f3DW98vmbBcLjFnpl2QlCej3utnOCFWNKit1G2oZWs1LbNQsM3QNdx3ceIX0JBImiGvM1DFuYbEBDTu73fho80uWrqqEJ/ivbeRgPytvN78J1jqtloHPwoOcsvf3OlaeF22Uft3lSYjbJbSnu9f7RTNBua7MXDzEttMvAr8vAgv/5UKcsB38MFSmiwjtGDwSc48MOdXVPQCYgiwjfaXnfBCwZStaTf6dXzCi/y9k+LFFjSqR8adJwKNGiqai7burq7LV/L5bru9ZnkXQzfYFonehQdH992ErjzWC7iRA/MySpBc2JPe317SdRlPvJy4sieeZZaP6QxAXP3x7xeDvaLF14tp/1wQo7hL7RpJlPkIAw/nGHzAzLMfqrwZBqj5raTsvuX7tz21cxlK1jAUQTR6ewPT9bPgiY7A/YeXHHHuw+lDtujOUOyeVc11x7e53cVJrZa4WVgJHJlwn8uAt07Yg1Gr+mibnkNaq7GCvZjtxPbvCw/h+gBXQBxTe5DjLFk1rvvkxKSYsWlf43YWIeYHZsA4PiKCWye431AXK9Rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(54906003)(40460700003)(478600001)(44832011)(8676002)(8936002)(5660300002)(36756003)(86362001)(2906002)(81166007)(4326008)(6916009)(356005)(70586007)(70206006)(82310400005)(316002)(40480700001)(82740400003)(41300700001)(426003)(336012)(83380400001)(1076003)(26005)(2616005)(36860700001)(186003)(6666004)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:54.1270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22cd97e-2869-4017-2b83-08db630323f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
Remove static type so this can also be used by SMMU drivers to check if the
device is being used before removing.

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v6:
    Created a private header and moved iommu_dt_device_is_assigned() to header.
---
 xen/drivers/passthrough/device_tree.c | 20 ++++++++++++++++----
 xen/include/xen/iommu-private.h       | 27 +++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/xen/iommu-private.h

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50c..52e370db01 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -18,6 +18,7 @@
 #include <xen/device_tree.h>
 #include <xen/guest_access.h>
 #include <xen/iommu.h>
+#include <xen/iommu-private.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xsm/xsm.h>
@@ -83,16 +84,14 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -213,27 +212,40 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( (d && d->is_dying) || domctl->u.assign_device.flags )
             break;
 
+        spin_lock(&dtdevs_lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
             break;
+        }
 
         ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
         if ( ret )
+        {
+            spin_unlock(&dtdevs_lock);
             break;
+        }
 
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
         {
-            if ( iommu_dt_device_is_assigned(dev) )
+
+            if ( iommu_dt_device_is_assigned_locked(dev) )
             {
                 printk(XENLOG_G_ERR "%s already assigned.\n",
                        dt_node_full_name(dev));
                 ret = -EINVAL;
             }
+
+            spin_unlock(&dtdevs_lock);
             break;
         }
 
+        spin_unlock(&dtdevs_lock);
+
         if ( d == dom_io )
             return -EINVAL;
 
diff --git a/xen/include/xen/iommu-private.h b/xen/include/xen/iommu-private.h
new file mode 100644
index 0000000000..5615decaff
--- /dev/null
+++ b/xen/include/xen/iommu-private.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+ /*
+ * xen/iommu-private.h
+ *
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ * Written by Vikram Garhwal <vikram.garhwal@amd.com>
+ *
+ */
+#ifndef __XEN_IOMMU_PRIVATE_H__
+#define __XEN_IOMMU_PRIVATE_H__
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <xen/device_tree.h>
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
+#endif
+
+#endif /* __XEN_IOMMU_PRIVATE_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


