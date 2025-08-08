Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05169B1E40A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074091.1436806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI58-0000yY-Me; Fri, 08 Aug 2025 08:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074091.1436806; Fri, 08 Aug 2025 08:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI58-0000mY-Ct; Fri, 08 Aug 2025 08:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1074091;
 Fri, 08 Aug 2025 08:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRAb=2U=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ukI57-0000NJ-9h
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:04:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f29db0e-742e-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 10:04:04 +0200 (CEST)
Received: from SJ0PR13CA0210.namprd13.prod.outlook.com (2603:10b6:a03:2c3::35)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:03:58 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::b9) by SJ0PR13CA0210.outlook.office365.com
 (2603:10b6:a03:2c3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.8 via Frontend Transport; Fri, 8
 Aug 2025 08:03:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 08:03:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:57 -0500
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:56 -0500
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
X-Inumbo-ID: 3f29db0e-742e-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVD+rExi1qyn4QuulvuawVC37J7wQvzVpLfMD/7XjQtZyp6jUlQUL25HJZk7svywGtQbaiwzASfmQfvnb/6DtR+bROtclIqaPX2YMM2a0sZaHna8zLOcxTvbg1lWY1+DzEg0QKy0Df28p0sTO6ezfCK3pzlv0uQW4NbbllpKpNfP18JrRY4v3OxsfWZjwu0R3VqRJA7egoufdZ5An0a75CmVyhYNbR/SGD+T/H7dCSMddS+JNmYMoDfnOxLNtGkfBbUMxwFLellzoVimoXNVxCdTh6wIr9qQp+Ad3qt8iK3CHkzuJ57z2mI65SSjRmmAb6YXvvryTCh+FmnSVy+1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBv3jlSFwccpU8t5cui6kDODepuc2n9RRMkKvA1OlLw=;
 b=HeivYsUPpJ7uJJd8WHqPFTKsOKXDUw+yDg0ndmWIVznSMPj6kobLxLbxyKckk+h7kNMqqNFVFU0VKSD/QiY9j0wT6KH2ZagwjCzpAkaU8umNRY4MXy2x5/NouoEkuf3amg+a4em0Y4Iv1ew56XRv7CoiUiMJNKqb5BI0m5n7YvY27PWGZJrpav8RZfU1aai8jQjtfkrhlQuSEzf6LpJYE2+zMv/csveVLd1R4ZjZSnkFQtJLPZsCycZCte/tjBVMRoaUE3wUPan9Y+0lUhyp0LGhyYsHuMmgLLArA8TuZxIAxV0l1VrqWSZzAXhEV1lG+Fw9qEr7do18iKOkynR7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBv3jlSFwccpU8t5cui6kDODepuc2n9RRMkKvA1OlLw=;
 b=QG7TrbY+nOiOtk+g4nVhNqbVOjBXHgE28rLy6MT1Jxv+AcjktcSuhcn1Tb1hsXYAg04pHYawstpQlyY/4V/vYZvIYWWscAWpDdBtz2LdE6nmlFxY5WSg/OcJ5xZSiCeIgmYOPUvvsY4GFjjMnt1fPUR7zJU0LSarTvcTO1hDxAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v11 3/5] vpci/rebar: Implement cleanup function for Rebar
Date: Fri, 8 Aug 2025 16:03:35 +0800
Message-ID: <20250808080337.28609-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808080337.28609-1-Jiqian.Chen@amd.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB05.amd.com
 (10.181.40.146)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: a104aeef-552e-437c-623b-08ddd65220cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzZEc3VqVFdPZml1QWhsRWZoZFowcG9YeWYzdDhwMDBQOVhtTU5MbEkxYkZH?=
 =?utf-8?B?NlNkM0c5eWhQNnlEZ3JUV0laNmM1cDdqQzNFNUFiaHdFYUVObGdXSUZGYTBZ?=
 =?utf-8?B?RUt1TVhuZUhqMGNTdGkvcjVoem1VU05leXlXaElUbHBpSDF6bzBrTXJFaDlJ?=
 =?utf-8?B?d0ZMb2d3NlJmdzExMXA3YTlGek5SVWJXaVFUQXVGSzFVdjc0M2lhcHJ3Nkho?=
 =?utf-8?B?dGs0ODJ1aWV0SHE2N2hJejRDTW5yaFpicjJMM3p5UlQ3b0w5Yyt2ejV2M1ZV?=
 =?utf-8?B?RjcwSEdTc1o3WTdIdUlQazFWNG5EdGRYbUJtSUQ2M2pINVJ1Yk9RWmF2Y0g0?=
 =?utf-8?B?MDhDdEsvS1puU0x5dDMrUU9hTnhQNUxicVlhdENVZy9SVk4vQzhDZERNUGRr?=
 =?utf-8?B?NFV2U3lia1M1NXY5SHhNMGxhUWpqcUFlN3dzcU8wTmdDSWROUU5IYisyM1RS?=
 =?utf-8?B?WnVtRXJmTTZUTFlJTWkwNmhvVURMTDNGQ2lZaTBOOGFKc2dFS1pHTzF4VDhU?=
 =?utf-8?B?cmtvL1RLbkpkc0dBa3ZTWklCTmV2eExqVk9WaS93anZSVUZVM1FJUHkvVk1R?=
 =?utf-8?B?TmRvL3BTU2UwSzZmYXVSaThmMUp1VC81dE05WHlKYmU4RXI0Yi9zaHh0dDlm?=
 =?utf-8?B?eGZHRldBY20weW1TUkd2TzFEdi9ubDRmMzg1MEt5MTdaU0ZuVkE3ZG5yMlBN?=
 =?utf-8?B?Y3ptMktxMkx5TkpRRzYrYzlieE1abG82RmNIbXdZUFVwMCsxZ0hwck44TXJm?=
 =?utf-8?B?QnJoazJQWG1hTmlnVEtpQm9BQVNtTzFqZzU0QWhFSlRZOEF1SzlRVkl0N0pa?=
 =?utf-8?B?bUtubW1kdjhjd3FsaUVKMnpCbUNuWURoUm4vbWVNemtGNnRJN21BeU03cXNM?=
 =?utf-8?B?d0MyZjNYZExaTEJ5SytkUERSQ29mbUdMRnpnUUl4Zzd4K1k1YTRMVEhaVkpY?=
 =?utf-8?B?eEdLSEg2cTNXcWFHdUVSeHhQTk1vTnBMN1BQVkppV1l3R25jYUJRaXlEUTc4?=
 =?utf-8?B?Zk4wTVo5aVdJbUROQStKU0FuRUUwekRNL0R0bFg4OU5HZlRRbXE3VDVhbkxB?=
 =?utf-8?B?SmJXaW9HajNBYStRWEswdUxVNHBjL1RVRXFEL0hhZnJHbDZjckpISlhhbzdm?=
 =?utf-8?B?UU5GL250Wm1GSkRhZDVRTk10OW9KL003UDdNNFFZRTBYYzZHdHRlVDNmNURB?=
 =?utf-8?B?U3EzOWJEZzNIbTVXUDhKQjFBSkY3ZVVLZEMzdVhPbG9JZU42ZXJHa1NSVEV2?=
 =?utf-8?B?Z25ieXJtNzUxdDlweStBamV2d1BkdzBEcWFUaCsyV3A4WHNHcVdhcUxZcXZp?=
 =?utf-8?B?cFUrbnVZN0VFT0w5ZndBV2lsc0lqK2ZzakNWZjVwMWJVdnUyUzZ6NXprZUlS?=
 =?utf-8?B?NlZOakhLWWk0VzkyRGNSajZEUnN0b3VvMTFOa0hEU09oMkF5QlhxdUNUcHJS?=
 =?utf-8?B?UHJMalkxVXpuMUdldDRuZXFTakUwUzFTM2w4aHJmVUQrbnJ2blR5Q0Q0enhI?=
 =?utf-8?B?YjBXTEI5QVdWd3plQnI1YzZocytLNE9Na05IcXUza3hhQU1BRTIwR2xteXBU?=
 =?utf-8?B?cXROOUNvajNYNEtBMjJyR01LbVVUdTN0V3JJc1BvL0drTlJyd2RMcUZTWWtX?=
 =?utf-8?B?RkhuQXdzdFR6cXFaWDEwMkFJajFDTUhMVis2OHFIa05FVW5yTWllSWUwaCtM?=
 =?utf-8?B?V0s3aDU5dmtXdk9QTGtvTmI2M2dZdXlDSnBhcjd0dzUxM1JvVS9WT0JPNCtp?=
 =?utf-8?B?Qll5SCs5bnZoYVJEMlNwVEQvMFdKQzFhbW5nZUp3aFd0OFh3bERoWmM5L0NU?=
 =?utf-8?B?RFl6bWVSbWhXc0lGWUxzTjRBUXExeEJTcU5rRFE1bTY0cDdJSXV0MHMzQlF6?=
 =?utf-8?B?ZlNmNzFrUmxtNlNRczk3WTdpOTNQanBET0NyQjE1ZzFOUmE4Q3JKRnd5Q3BR?=
 =?utf-8?B?S0RJUTVFbWFxYTUySU9Ic01UR094UWFnRm5OME44WmFaeEowOTJwWnhKOUdZ?=
 =?utf-8?B?bkdOZS80VmZuYkhkK20wSHM4UEV0ODU2WjlqNzRzQ0tnRkZCRnBxMTRyc3l2?=
 =?utf-8?Q?CNQCVt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:03:58.1254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a104aeef-552e-437c-623b-08ddd65220cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

When Rebar initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement Rebar cleanup hook that will be called to
cleanup Rebar related handlers and free it's associated data when
initialization fails.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v10->v11 changes:
* Add ASSERT_UNREACHABLE() when vpci_remove_registers() fails
* When hide == true, add handlers to let Rebar ctrl be RO.
* Remove Roger's Reviewed-by since patch change.

v9->v10 changes:
v8->v9 changes:
No.

v7->v8 changes:
* Add Roger's Reviewed-by.

v6->v7 changes:
* Change the pointer parameter of cleanup_rebar() to be const.
* Print error when vpci_remove_registers() fail in cleanup_rebar().

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar" since cleanup hook is changed to be int.

v3->v4 changes:
* Change function name from fini_rebar() to cleanup_rebar().
* Change the error number to be E2BIG and ENXIO in init_rebar().

v2->v3 changes:
* Use fini_rebar() to remove all register instead of in the failure path of init_rebar();

v1->v2 changes:
* Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/rebar.c | 66 +++++++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 3c18792d9bcd..91d5369d75e2 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -49,6 +49,57 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
     bar->guest_addr = bar->addr;
 }
 
+static int cf_check cleanup_rebar(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
+                               PCI_REBAR_CTRL(nbars - 1));
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    if ( !hide )
+        return 0;
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports Rebar by default. So here let the control register of Rebar
+     * be Read-Only is to ensure Rebar disabled.
+     */
+    for ( unsigned int i = 0; i < nbars; i++ )
+    {
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, NULL,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, NULL);
+        if ( rc )
+        {
+            printk(XENLOG_ERR
+                   "%pd %pp: fail to add Rebar ctrl handler rc=%d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
     uint32_t ctrl;
@@ -80,7 +131,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -E2BIG;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,7 +139,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            return -ENXIO;
         }
 
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
@@ -97,14 +148,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
                    pdev->domain, &pdev->sbdf, index, rc);
-            /*
-             * Ideally we would hide the ReBar capability on error, but code
-             * for doing so still needs to be written. Use continue instead
-             * to keep any already setup register hooks, as returning an
-             * error will cause the hardware domain to get unmediated access
-             * to all device registers.
-             */
-            continue;
+            return rc;
         }
 
         bar->resizable_sizes =
@@ -118,7 +162,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_EXTCAP(REBAR, init_rebar, NULL);
+REGISTER_VPCI_EXTCAP(REBAR, init_rebar, cleanup_rebar);
 
 /*
  * Local variables:
-- 
2.34.1


