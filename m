Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF577EE7A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585062.916094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDs-0004X1-Ih; Thu, 17 Aug 2023 00:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585062.916094; Thu, 17 Aug 2023 00:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDs-0004NO-AO; Thu, 17 Aug 2023 00:50:48 +0000
Received: by outflank-mailman (input) for mailman id 585062;
 Thu, 17 Aug 2023 00:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4H-0002YP-FC
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6afca5e-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:51 +0200 (CEST)
Received: from SN4PR0501CA0057.namprd05.prod.outlook.com
 (2603:10b6:803:41::34) by DM4PR12MB7645.namprd12.prod.outlook.com
 (2603:10b6:8:107::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 00:40:44 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::a2) by SN4PR0501CA0057.outlook.office365.com
 (2603:10b6:803:41::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:36 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:35 -0500
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
X-Inumbo-ID: b6afca5e-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hevRedi/HuvpbuYXgNJq0iGgLB1N99aAi0qJASATrvYuRLURGh5seYbaA2/yeFHaXQBJ684jwKmBgsAIB9EO0auzOfy1/k0mIk3BgEMLURg36wB10VSJQiTrHxUPNgAgp2vvoapdeV22BhzJadkiiurK5Yy5Naq7HL9hioWUHE3B6hpxun9/+7MlP9LPrQDMxiRfOMuMuYCs6vSf5JCD5SC1cZX+uh/aj5o1FNd1iNzhinA6S2CAjCrJm3++cI9iypOEioFC44KbmDxlGXUzE9M3AWzkbX9c8RTNE9r3bivIpxW5bAi4zVvLysXZqpeCxUWq7sAy3vD3cUK5svxVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIyUzT1AUXykQrgYpXKigDmIsrdrXXxfGP25yLD3dds=;
 b=WOICDTJwv/fZMYQxINixdg/BUBvxrQYkXgdT55+G5EQ9OAcw4qMoNAZS9zbaCN0w3H+4pVb3daKNmFJidyWxiTEku8Wxg1Wd/I+sLDwZKfrHQK8yxLU7XN28wPgEJj8w89QC33Qvj+TCxg5c0LJ8rX6qaxVvn1sT96J6UAxqAp/A+VvZdWAfBvDi1JgxSJFrh2NbUdks6Njfpj67Z2GElzw6Mmn1KBuP2zwDx+vvPJfQyGBWnt3L9e2XkoCBoI9Tvb+Rym/h1Sdy25G+/JiwPqHmjrXXjio80+dm6BUKoRaJPmYlq6saQ9YVf2zEl0/WsxHcV5TS7q79ZTkGu+DOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIyUzT1AUXykQrgYpXKigDmIsrdrXXxfGP25yLD3dds=;
 b=paG7YLbAUw504iHfl0J0G0REvjLbDVozU0hidGz5m89Oq70R0lx9JSsnPhbzYwuBEpKOApbSWYmjSgjssqCv97Rcb8Ob3xAeNZtb5Me1AsCYShWwgvjZX6lULnDls/dU+zspZUNLSMjgS3fwevOZvwQE2DgH7DHjxRyA76QudV0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
Date: Wed, 16 Aug 2023 17:39:37 -0700
Message-ID: <20230817003947.3849-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2e4355-fa3c-4628-e975-08db9eba972f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ukkm6xQFFEApv6YtCS8yz6S4udYrNG/qxgK+562VGWvF2L3ykL2CoXSBninxVBxr8JU7RM0J4QFCOG0jr4tpOpY9JMtXEPpNoAF2aBheUzFQHl+6o6OVfjg0YphmiBJk/Dd20IHw3fAq64sOT0lO/1mvBWvjKZt2dq+riS2NAMfKaEKML85dT/FMCX0RAY60g0gIbqdi1WzSmbC8kMADQ6Wr+NsEn6TmwZDwfr+Yum9otlKk//5LBiybkjxj6/00v2Uet0IXJ9rUUjvV9SBZO1Bzuoti6CpPYogQ3ZDGAnw5u+Afrqm5bg3/rswJIU0eJ3+uuyUVTW7TsNfN0+1nmvoCbZcGJlcZYQoQsjY8Vw+H9A434/vczA7Q3otNMD48ov9/C6Zsdr8cU4gA/oANEnSF/F+T0rEZY7vQ16eLlo4Zob3ucKqCCZ78Mj6UoODEHmYw2uQKbQv19pWAGhEDv+dldMz24mo0uploEVEsn0oqKfKMF+HjNHhcR2tekdb49xlMpKaZDGp7INF0OXsxTB4JaxEVbksnYFMkLw0ekeSdSwW8JXS3oOf7Qms/fCus4swszJzqdkfjLR/gjXDp3Y6dQEbSla39H4hp7MhUaZ6wz3IC4yMUunZJuBqlWBpk2sGy2NQwFbiPQNs2tJaYSQWV6I+AWkSRnVCHnZr7Bk/yDf42eC9M/Pq3QLeWxHuZMopVxpP8Bs+dKB/4bqrIQB/IbAKme6KtPcsV11siDhOOyAI4Ud46JuBfh0dg0ftvq74fcDeUP1AHe64d1/aS2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(47076005)(336012)(426003)(83380400001)(2906002)(36860700001)(70586007)(70206006)(54906003)(6916009)(316002)(478600001)(44832011)(2616005)(5660300002)(26005)(1076003)(41300700001)(4326008)(8936002)(8676002)(36756003)(86362001)(82740400003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:44.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2e4355-fa3c-4628-e975-08db9eba972f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645

Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
Remove static type so this can also be used by SMMU drivers to check if the
device is being used before removing.

Moving spin_lock to caller was done to prevent the concurrent access to
iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
patches in this series introduces node add/remove feature.

Also, caller is required hold the correct lock so moved the function prototype
to a private header.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Update commit message.
    Add ASSERT().
---
---
 xen/drivers/passthrough/device_tree.c | 26 +++++++++++++++++++++----
 xen/include/xen/iommu-private.h       | 28 +++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/xen/iommu-private.h

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50c..5796ee1f93 100644
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
@@ -83,16 +84,16 @@ fail:
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
+    ASSERT(spin_is_locked(&dtdevs_lock));
+
     if ( !dt_device_is_protected(dev) )
         return 0;
 
-    spin_lock(&dtdevs_lock);
     assigned = !list_empty(&dev->domain_list);
-    spin_unlock(&dtdevs_lock);
 
     return assigned;
 }
@@ -213,27 +214,44 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( (d && d->is_dying) || domctl->u.assign_device.flags )
             break;
 
+        /*
+         * To ensure that the dev doesn't disappear between the time we look it
+         * up with dt_find_node_by_gpath() and we check the assignment later.
+         */
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
index 0000000000..bb5c94e7a6
--- /dev/null
+++ b/xen/include/xen/iommu-private.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/iommu-private.h
+ */
+#ifndef __XEN_IOMMU_PRIVATE_H__
+#define __XEN_IOMMU_PRIVATE_H__
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <xen/device_tree.h>
+
+/*
+ * Checks if dt_device_node is assigned to a domain or not. This function
+ * expects to be called with dtdevs_lock acquired by caller.
+ */
+bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
+#endif
+
+#endif /* __XEN_IOMMU_PRIVATE_H__ */
+
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


