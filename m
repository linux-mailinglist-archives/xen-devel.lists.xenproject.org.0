Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA579333C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596002.929822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA8-0001rB-IV; Wed, 06 Sep 2023 01:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596002.929822; Wed, 06 Sep 2023 01:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA8-0001bR-6F; Wed, 06 Sep 2023 01:16:56 +0000
Received: by outflank-mailman (input) for mailman id 596002;
 Wed, 06 Sep 2023 01:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA5-00079K-2y
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:53 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e88::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eeae674-4c53-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:16:51 +0200 (CEST)
Received: from MN2PR19CA0007.namprd19.prod.outlook.com (2603:10b6:208:178::20)
 by DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:48 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::5e) by MN2PR19CA0007.outlook.office365.com
 (2603:10b6:208:178::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:45 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:45 -0500
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
X-Inumbo-ID: 0eeae674-4c53-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjq62g6wiENr6dvlbk1lgsrMkn3idpyQylg2gaWbMrlsFmt9uaqOv0d+oNJpG3BfyGKVL62GotCHpuMshPW/iaWZ8zFIc3UGgHhc0sXmBoFI6CG+zl+N1W2BKURoG6eTc5lnGvu1eYal7sMAnW41uJ5ccSuMYdIP9FFGm/YP/T3mLkSGnxliMQBWCDhcimTdwGXuzHIyAZsHs6MEdEFV5apLdORcOUdstayZyJu5OnWzxM0ojUG2EosyigXGOJ6dvH7lDFBwycJKWEe7uHJgFy6o9htaz57TU18wgLUMqGFiCAQgOc2AgD1DpTYEg6uFnmytZTB6D2gQeXHwjOYaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUEVYKXF5gyGWM9LJIJFFbZLDptuiHcthAk8QZxHgHI=;
 b=MHn1QGy0lsG2IqtvB4m/BFc6fuQCBGgWi4TxpfimSUYr6qJ3tb5No6ouRlf+23f11Ru6/EBG3QqMRKb1dfGJXDIJVDytUN4gm83KAb0Pc9cQzumfXPfnjkvrateQh3AvQ2zzfp8RE914MxbCIT4V5WaYpj/Yd4NA1BzwWr1cENesiPIsQxYwKbZG/+578npL+Pjxsh8rHlgOHQpn6ggx6xkmICrlzsco4L+shrb+CLDDDWnbiJ8izRJCTntWdJFDoyDW2UmUkjnNuTI/Dqv5TmnGoKTVI4gu5QGfROlMoLPidEwRHXKETXcovGYdBEXbgbjlyI7plYebxeCE09q0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUEVYKXF5gyGWM9LJIJFFbZLDptuiHcthAk8QZxHgHI=;
 b=Dn8JDe3aw+JfSt1AHbzFgMlurP1U+fRmg3CZNcG0z+hw34zMcc4xrEGzIbbDmSEsqoj1lNk2gRbsZ/AgL9HuKrdIpFAR0g6UZrzE4qH7v3q2iYFOt9Yh96pqw9EOHNw6V3ei8psKOUb3HzUdCwYl9doCIlh5XK6YMSGdzz5mOJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 14/20] common/device_tree: Add rwlock for dt_host
Date: Tue, 5 Sep 2023 18:16:24 -0700
Message-ID: <20230906011631.30310-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DS0PR12MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b72af36-97d0-4b52-0054-08dbae76f138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fj7k17JM76pkQz7LTYOUtBk41o2BpO0xvF/BjofovlgrRo3LkDVU3x7qON9Xz9U7sUMoMDJQxWo2/62DZX9/G+2KgwdJ6N42fMmd9Ecf7ffSvXO525e6qn/prAch39h21IHea2zdL0/1OsZAMr1cQfq9WTUuhRBpJ8YynGqa+vLFGbI6DCemx8gguOVioPUskWgSD1vmVkgNlrhIz+LEw6laLDuJU5oyGATMs422qY64H9uVNYI8v+t4Vkk2VKgQfVe0hw9iuDqALCXe0jTtf0SeHvXxnXbI68PNEJW4+McjVcVzUUOO/9AgyR5/iZESa5OAL17TTs5pUchu89UBfuEf/IG5rG8pqW1cZAWX7DNDVBVvva5A42wxv85M3pVjH0DkHHkgcF+3AHyrsgaLHd4pe/ZI3+Zceod7PPTazwit9fuTDjEvRM84gVuMfzQ5nbKHWvD3vH2Zmvf7wxXBcuYYyeWTb5Mvrq/vf+ssijfW2lJySrBbWuR9z4dtElym8LC5xDEdclRvHDjgaQiswfKdSMx4nzQSDW9bWevz6HdjmxIzNhaXtle0MlpC1Siv3+0SVKRHUwiL5nrYk3VrbGjbn/6SBweRrkP1Z8wWV8j2ddQXSpvzN9tRYAtF9YXe9O6ILEPMLnUyl4EZvJm6QZbIqcAFWssXHKPumpDUiVrRnnDy5oDHs7VWChsIVWxtU7L/x0MJbjfg/VoMOWa806H9rqccBNnqk2rmT59DjPVcwgfSLJ+e11lqWf1FhkBHEPOhut5S+tDj1Y2GSCGeMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(83380400001)(40460700003)(336012)(426003)(36756003)(81166007)(356005)(2906002)(36860700001)(70206006)(47076005)(82740400003)(40480700001)(54906003)(41300700001)(316002)(6916009)(70586007)(86362001)(6666004)(478600001)(8936002)(8676002)(4326008)(5660300002)(2616005)(1076003)(44832011)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:47.8785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b72af36-97d0-4b52-0054-08dbae76f138
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534

Dynamic programming ops will modify the dt_host and there might be other
functions which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host during runtime. dt_host
writer will be added in the follow-up patch for device tree overlay
functionalities.

Reason behind adding rwlock instead of spinlock:
    For now, dynamic programming is the sole modifier of dt_host in Xen during
    run time. All other access functions like iommu_release_dt_device() are
    just reading the dt_host during run-time. So, there is a need to protect
    others from browsing the dt_host while dynamic programming is modifying
    it. rwlock is better suitable for this task as spinlock won't be able to
    differentiate between read and write access.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v11:
    Update check state >= active for checking dt_host_lock to be locked
Changes from v10:
    Add ASSERT for iommu_assign_dt_device() and iommu_add_dt_device().
Changes from v9:
    Update commit message and fix indentation.
    Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().
    Fix code styles.
    Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
        device-tree.c
Changes from v7:
    Keep one lock for dt_host instead of lock for each node under dt_host.
---
---
 xen/common/device_tree.c              |  1 +
 xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++--
 xen/include/xen/device_tree.h         |  7 +++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index f38f51ec0b..b1c2952951 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
 struct dt_device_node *dt_host;
 /* Interrupt controller node*/
 const struct dt_device_node *dt_interrupt_controller;
+DEFINE_RWLOCK(dt_host_lock);
 
 /**
  * struct dt_alias_prop - Alias property in 'aliases' node
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 80f6efc606..075fb25a37 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -31,6 +31,8 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
     int rc = -EBUSY;
     struct domain_iommu *hd = dom_iommu(d);
 
+    ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
+
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
@@ -62,6 +64,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
     const struct domain_iommu *hd = dom_iommu(d);
     int rc;
 
+    ASSERT(rw_is_locked(&dt_host_lock));
+
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
@@ -113,6 +117,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host_lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -120,10 +126,14 @@ int iommu_release_dt_devices(struct domain *d)
         {
             dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
                     dt_node_full_name(dev), d->domain_id);
+            read_unlock(&dt_host_lock);
+
             return rc;
         }
     }
 
+    read_unlock(&dt_host_lock);
+
     return 0;
 }
 
@@ -133,6 +143,8 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     struct device *dev = dt_to_dev(np);
     int rc;
 
+    ASSERT(rw_is_locked(&dt_host_lock));
+
     if ( !iommu_enabled )
         return 1;
 
@@ -177,6 +189,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     struct device *dev = dt_to_dev(np);
     int rc = 1, index = 0;
 
+    ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
+
     if ( !iommu_enabled )
         return 1;
 
@@ -249,6 +263,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
     int ret;
     struct dt_device_node *dev;
 
+    read_lock(&dt_host_lock);
+
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_assign_device:
@@ -289,7 +305,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         }
 
         if ( d == dom_io )
-            return -EINVAL;
+        {
+            ret = -EINVAL;
+            break;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
@@ -327,7 +346,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         if ( d == dom_io )
-            return -EINVAL;
+        {
+            ret = -EINVAL;
+            break;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
@@ -342,5 +364,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         break;
     }
 
+    read_unlock(&dt_host_lock);
+
     return ret;
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 44d315c8ba..a262bba2ed 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -18,6 +18,7 @@
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
+#include <xen/rwlock.h>
 
 #define DEVICE_TREE_MAX_DEPTH 16
 
@@ -218,6 +219,12 @@ extern struct dt_device_node *dt_host;
  */
 extern const struct dt_device_node *dt_interrupt_controller;
 
+/*
+ * Lock that protects r/w updates to unflattened device tree i.e. dt_host during
+ * runtime. Lock may not be taken for boot only code.
+ */
+extern rwlock_t dt_host_lock;
+
 /**
  * Find the interrupt controller
  * For the moment we handle only one interrupt controller: the first
-- 
2.17.1


