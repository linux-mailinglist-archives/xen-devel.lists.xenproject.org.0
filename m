Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470678817C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590554.922948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmm-0001E1-07; Fri, 25 Aug 2023 08:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590554.922948; Fri, 25 Aug 2023 08:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRml-00012w-GE; Fri, 25 Aug 2023 08:03:15 +0000
Received: by outflank-mailman (input) for mailman id 590554;
 Fri, 25 Aug 2023 08:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmh-0007GZ-Ie
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:11 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4df1a39-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:10 +0200 (CEST)
Received: from MW4PR03CA0255.namprd03.prod.outlook.com (2603:10b6:303:b4::20)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:07 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::8b) by MW4PR03CA0255.outlook.office365.com
 (2603:10b6:303:b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:03:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 01:03:06 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:06 -0500
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
X-Inumbo-ID: d4df1a39-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0J80O5mkwUxvK9/OtW0ThLME+hmLP4Y2mYSFuQ1I5NpprJFE296CTPc0yHU42GagpAl/F7YLsU/4yR6uXd4TgoPo8PYqLVsXx6cKoq2/muVFDAI+d5/PFMJd/fGHSp8yZPj704R7lBtm62SPihIMIQieExi2B1dCka+AQnQ8+VBC/xtBbvrDjuh0LCnOMmMz6ttM9lmG+Is6bk6tz1/drYmJrYSqK7qlUsWTGLx0zW1Q9k6HTPVYaVeKtCDOmGaYPyjYxzrKfc0QygsMRwfRsLk3Pf1+KInF4LxawDTZ8DiJDWWAyWRQMpyVE8uFKOJ2E+t05NRCC+yyePAhTasnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRgubDfFnAvFwagyB0ghhVyfbsrh9DPQoCEwaYuA3Nk=;
 b=MakoNwa62UL+2x6QFtUHTvtaz7795NG5CWtm7dvh2EcfKySCrmtIZuYNZQDmosooyBcyywOFok8C5g8jnKLeO53r2xapmTDHaCXxPFiuLidWSSp6POpW+65IJSKAg4vZO4uU0rrv40lt9iX+/tjFqPgQCiPs/OhWtSM98ZIB8V7TgJKz5qjVZMSWOohdvAiMc1zVjTV0JuquYiDT+ibs5wAvVVkLiq7/eyhvAm58V4bZMy2qa9sNH2UR7kA3LfAoaCaaD5LUa2OzTlgxhssQxIjq0cFr/9QqCBrk8n38xHnsxC469XF1E32A3tJgspRMj4La+URELhOo2W1i0wC7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRgubDfFnAvFwagyB0ghhVyfbsrh9DPQoCEwaYuA3Nk=;
 b=vuH3Tf04k3cUtCoYTKDu72U3B5cNMIxNYZA9sujHGKxHwlg1HYx5I+Wke7KMFN+brUzgLVLEiSQf7Ni7K041uFRiyRPeI2pDxvOuOlM3sMLsB9bXmGalMfa327LNORWIlh98fYcKqggJD9LbuNk7o6oJJHpiK66hAy4vMCeZ0YE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 14/20] common/device_tree: Add rwlock for dt_host
Date: Fri, 25 Aug 2023 01:02:16 -0700
Message-ID: <20230825080222.14247-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ee52d9-2f6c-4647-bf61-08dba541b7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e6bRD0fDwtMPzLm2MFmo+Z9Nr8YBtasXxBrf/RaZ/1ATv5O2btgYpTQfI1tVTyvIfkpgm0YiIsSvKsL8jZyeyHPuJzyTgDx9tyJWhj2f8cVGmW7MB8Z3pLrfHQzWIjozZEnV3w3yj7ymSVpv9eoCNKAYG1Z8aLoM43NBB1GVCrQq+cyQyP/MtvBsw2LeIMGFoXFmcB9pE98IJyw+Fx8W7PetVlL/EGayFgRrw8/uw0nADbxIdaubPFl2YgpQoTkCtd2C1NO/yHzmX54sYB0MhQJ4u5pWQbUPVOtcI8sjpCuzpst6SBqyz77WISOiaJh1BcjwzC3zIMvCtTeJnjLT8kpDrHu5FfRVbjm6b3xyhTz4l2MWUpFcDw1uEBJamMMOH4UXGFJY96wDG9/0JBTdJyNXsqQSiEtkKRMJ1pIJDX6yS3wKFx9uAx+NngevcarijtMOfKrsdRpCkiqDespHAo7PkKEn87eEWh5LUo3iMbtIOaBWQuYs68kHOY4Ltb+aqIMYTc90uzSpLO0y/U95mBXUwWMT+S4oTUJDSDv25K2CsjofN4JGWYWrEnbODwpAKQdNTBYR8AI4vBsc80SqL2bLbGDY8amqVOj7DwDc+y+9TaiqYqj5kDFO7yA3Q4S7isIwTYpTjUQJH0BehUm+4XToR3gAzd3bBNw7kllgI89SxQJV43eJzfk/VCGC/XLCezZkK+ypmrjFTYEJwt5j3sJySVpQz1NFkX/P1xik3j3L553kF9nPYaZObotRbZFteX6VfMrrlYDyofab0haq1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(54906003)(70586007)(70206006)(316002)(6916009)(81166007)(478600001)(40480700001)(26005)(6666004)(82740400003)(41300700001)(86362001)(2906002)(356005)(4326008)(8676002)(8936002)(83380400001)(2616005)(40460700003)(5660300002)(47076005)(44832011)(1076003)(426003)(336012)(36756003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:07.5708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ee52d9-2f6c-4647-bf61-08dba541b7bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813

Dynamic programming ops will modify the dt_host and there might be other
functions which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host during runtime. dt_host
writer will be added in the follow-up patch for device tree overlay
functionalities."

Reason behind adding rwlock instead of spinlock:
   For now, dynamic programming is the sole modifier of dt_host in Xen during
       run time. All other access functions like iommu_release_dt_device() are
       just reading the dt_host during run-time. So, there is a need to protect
       others from browsing the dt_host while dynamic programming is modifying
       it. rwlock is better suitable for this task as spinlock won't be able to
       differentiate between read and write access.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
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
 xen/drivers/passthrough/device_tree.c | 24 ++++++++++++++++++++++--
 xen/include/xen/device_tree.h         |  7 +++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

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
index 3fad65fb69..b81dab5a48 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -62,6 +62,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
     const struct domain_iommu *hd = dom_iommu(d);
     int rc;
 
+    ASSERT(rw_is_locked(&dt_host_lock));
+
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
@@ -114,6 +116,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host_lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -121,10 +125,14 @@ int iommu_release_dt_devices(struct domain *d)
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
 
@@ -134,6 +142,8 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     struct device *dev = dt_to_dev(np);
     int rc;
 
+    ASSERT(rw_is_locked(&dt_host_lock));
+
     if ( !iommu_enabled )
         return 1;
 
@@ -251,6 +261,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
     int ret;
     struct dt_device_node *dev;
 
+    read_lock(&dt_host_lock);
+
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_assign_device:
@@ -294,7 +306,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         spin_unlock(&dtdevs_lock);
 
         if ( d == dom_io )
-            return -EINVAL;
+        {
+            ret = -EINVAL;
+            break;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
@@ -332,7 +347,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         if ( d == dom_io )
-            return -EINVAL;
+        {
+            ret = -EINVAL;
+            break;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
@@ -347,5 +365,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
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


