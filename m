Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D96DE49C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519773.806775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUN-0005nl-1T; Tue, 11 Apr 2023 19:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519773.806775; Tue, 11 Apr 2023 19:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUM-0005gq-Ej; Tue, 11 Apr 2023 19:17:10 +0000
Received: by outflank-mailman (input) for mailman id 519773;
 Tue, 11 Apr 2023 19:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUK-0004Ta-Pp
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe59::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 739189b0-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:08 +0200 (CEST)
Received: from MW3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:303:2b::22)
 by BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 19:17:05 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::4a) by MW3PR05CA0017.outlook.office365.com
 (2603:10b6:303:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.27 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:03 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:03 -0500
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
X-Inumbo-ID: 739189b0-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnOWGfhR+alOXtb1kEbH7mY9GHTUEb4Fh/Fq5W+ejuEBGScgkN+8M1kOzS1mFU4cA3rfTYuCUVidDnhaZwcIb3yH4MUbng3sDhlaGnQNs2bLeLWU+QLALHyOh6CCJhJQ35Fv0tfwvwbfL/RVHk4qdplIJ6NK9iWXfIv59MjOsILUtV/+MaRpY9HuwnDQh1R2S+1WxwGgc2i6+DPVMRL9v6qFUU46v4NtKiUIhGPHgtmRxH0AoZsyJEY9Kjj3m1REYDdpCUA4+p4qwj21PDv3c+9WAoLdNmEiTWZ1c2zIcG7SesZD2zVy+jc545NHBmf4mtQzOAGaAOrGiljWyw30fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOQW4Omju1dTUno8ADGoDg+I28lOLIV01naa3ZWrW1o=;
 b=AfQz2DOlaIMvQKAfoj502N6k0Jzk3taYs6o6qwigXCHpwW9phuQL1ITtRk4IU4J3E9NW7amG3/ALbGXLT5qtSR/E78kmN0/SGnoIuH3ZklgOvT69Vgiste+lkcBBzOTpqZnmNqJHaI8nvqy9GkgQxNOezhqE18ZkBNOVddwf1TgIaJuwB4/MVqX7ZryKA4OXdowle9i35wq0g55QFrE2CaAXwmnFk7yQ5C72gzfecJg05Z8FViqa9a0TieJdOuPJzwaF3XJoql9riQPR7cpExcFwxk7tSvAArFJhJxJ0qDJhDi7kFBDo9XCjVSBw5u7OLEOkT5yS6dCv/wG+WRmLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOQW4Omju1dTUno8ADGoDg+I28lOLIV01naa3ZWrW1o=;
 b=yxZPsIxPbBZxAQRHbKz6JQv92aqGSLAVhz9iyCR72zNrtSEZDD/8sdBXFUVIUlg8q8cq3Nz60IlR1Gp2e7TcV6+htFinDnkGslGbL1h/edwWvv6KV5dmwrIBDYGlYaMPQ0QtCijJ0IRHkCLQQn4cHAy94E8McblhaOHAsSIB5ng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 12/17] common/device_tree: Add rwlock for dt_host
Date: Tue, 11 Apr 2023 12:16:13 -0700
Message-ID: <20230411191636.26926-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|BN9PR12MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5bf8b1-3ea5-4fb3-321a-08db3ac1561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QhfFyki35SJbRekBupI7TtH1V3WKYpDwoOfoHKrgY+p0KezPSeQt3siAWShc/QMBXA+1E2Alz5IVPwpto5fOu0pPF3dg1ZSOaysK/53rpx8PXrCDgOKlLGXLzMl8nR5wlJhLoHzmvG5bzi9shRnWClX6oAJRfKsSZqE0A27pLeOMJFcig7YwOd73TTCH37VmFh46V9uY66e3pWOZlm2pVv9ABTpMJaVcnRqtq4BgYqR9JGyCzuZB7H+vxmxoUyKdi97Z+bfAdJJsOVB7yamKBwyS9FLGOG0h8OnvnH8/3VudTqh0TaoRqhhZ/tSALeKw7cxetA1NkG8gKfCuzfpd1NtSfEbHB452W64YVPYrmtr7OrMaw4uga/aqEPeRRmt+eJ6TC1BXum2xBhu0eofYNTIYXg6SROb8t0CxYbPKCVGfqeu9h/XgTaLv5SGd9MTUR/3R8aENWmMrHhHESYCIj9aTFP0KjIV9WgU6hcZ2Ovhx3N6sVjA4W7XY3cwbsif9JTp08qjzIFanvRRZ011vcEKrCxhDKupQ9WbDjejzxoo35ggY0btzTNQDAYe83SgaIc0SH516ef74Kb1MN+zPK+Ozu3pZtoeYCOOPjp4tS+ZqjZjKTs/Pi3VJ7go13Q4q04+vWqTU1Jzarorqoku8E5LYWnFcWulNlnjo1UB6k8qMLAZqBSt3LAjT4QccAqgXz8W3GGqRfz8aLuVruJQvuzgBavv9/PZa4GCONwDeNHg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(478600001)(40480700001)(47076005)(36756003)(83380400001)(86362001)(40460700003)(81166007)(356005)(82740400003)(426003)(2616005)(2906002)(316002)(1076003)(336012)(36860700001)(54906003)(44832011)(26005)(186003)(8676002)(8936002)(6666004)(6916009)(82310400005)(41300700001)(5660300002)(70586007)(4326008)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:04.9504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5bf8b1-3ea5-4fb3-321a-08db3ac1561d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5257

 Dynamic programming ops will modify the dt_host and there might be other
 function which are browsing the dt_host at the same time. To avoid the race
 conditions, adding rwlock for browsing the dt_host during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c              |  3 +++
 xen/drivers/passthrough/device_tree.c | 39 +++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |  6 +++++
 3 files changed, 48 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 507b4ac5b6..b330e6a013 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2098,6 +2098,9 @@ void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    /* Init r/w lock for host device tree. */
+    rwlock_init(&dt_host->lock);
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index a77a217f3d..74f994b9da 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -112,6 +112,8 @@ int iommu_release_dt_devices(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    read_lock(&dt_host->lock);
+
     list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
     {
         rc = iommu_deassign_dt_device(d, dev);
@@ -119,10 +121,14 @@ int iommu_release_dt_devices(struct domain *d)
         {
             dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
                     dt_node_full_name(dev), d->domain_id);
+
+            read_unlock(&dt_host->lock);
             return rc;
         }
     }
 
+    read_unlock(&dt_host->lock);
+
     return 0;
 }
 
@@ -259,11 +265,15 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
 
         spin_lock(&dtdevs_lock);
 
+        read_lock(&dt_host->lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
         {
+            read_unlock(&dt_host->lock);
+
             spin_unlock(&dtdevs_lock);
 
             break;
@@ -272,6 +282,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
         if ( ret )
         {
+            read_unlock(&dt_host->lock);
+
             spin_unlock(&dtdevs_lock);
 
             break;
@@ -287,6 +299,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                 ret = -EINVAL;
             }
 
+            read_unlock(&dt_host->lock);
+
             spin_unlock(&dtdevs_lock);
 
             break;
@@ -295,22 +309,31 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         spin_unlock(&dtdevs_lock);
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
         {
             printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
                    dt_node_full_name(dev));
+
+            read_unlock(&dt_host->lock);
             break;
         }
 
         ret = iommu_assign_dt_device(d, dev);
 
         if ( ret )
+        {
             printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
                    " to dom%u failed (%d)\n",
                    dt_node_full_name(dev), d->domain_id, ret);
+        }
+
+        read_unlock(&dt_host->lock);
         break;
 
     case XEN_DOMCTL_deassign_device:
@@ -322,25 +345,41 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( domctl->u.assign_device.flags )
             break;
 
+        read_lock(&dt_host->lock);
+
         ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
                                     domctl->u.assign_device.u.dt.size,
                                     &dev);
         if ( ret )
+        {
+            read_unlock(&dt_host->lock);
             break;
+        }
 
         ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+
         if ( ret )
+        {
+            read_unlock(&dt_host->lock);
             break;
+        }
 
         if ( d == dom_io )
+        {
+            read_unlock(&dt_host->lock);
             return -EINVAL;
+        }
 
         ret = iommu_deassign_dt_device(d, dev);
 
         if ( ret )
+        {
             printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
                    " to dom%u failed (%d)\n",
                    dt_node_full_name(dev), d->domain_id, ret);
+        }
+
+        read_unlock(&dt_host->lock);
         break;
 
     default:
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 998f972ebc..b7272bbccc 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -18,6 +18,7 @@
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
+#include <xen/rwlock.h>
 
 #define DEVICE_TREE_MAX_DEPTH 16
 
@@ -106,6 +107,11 @@ struct dt_device_node {
     struct list_head domain_list;
 
     struct device dev;
+
+    /*
+     * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
+     */
+    rwlock_t lock;
 };
 
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
-- 
2.17.1


