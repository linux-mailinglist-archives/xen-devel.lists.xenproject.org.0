Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB685B1E40C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074092.1436825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI5E-0001em-W6; Fri, 08 Aug 2025 08:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074092.1436825; Fri, 08 Aug 2025 08:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI5E-0001ck-Sj; Fri, 08 Aug 2025 08:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1074092;
 Fri, 08 Aug 2025 08:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRAb=2U=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ukI5D-0000bG-Qy
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:04:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2416::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4367dbab-742e-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 10:04:09 +0200 (CEST)
Received: from SJ0PR13CA0158.namprd13.prod.outlook.com (2603:10b6:a03:2c7::13)
 by CH3PR12MB9396.namprd12.prod.outlook.com (2603:10b6:610:1d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 08:04:02 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::c5) by SJ0PR13CA0158.outlook.office365.com
 (2603:10b6:a03:2c7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.9 via Frontend Transport; Fri, 8
 Aug 2025 08:04:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 08:04:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:04:00 -0500
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:59 -0500
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
X-Inumbo-ID: 4367dbab-742e-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5xzeeb+oBemMmfiM60fXAe7XbHLDaEMCBFH4ghVTQYeJ6U9ijcgO7Coc/UJV4CxG3tZO+m+yreH9v9iKhydr3MrSk82aMX/lGRdHHKeIHeTExmJYc0muA9NSmHfqmNjkem0C9uYCwnCB6GYmyyurqB34Sbw+i/dBulKjYBXS8xICn5IZKik0c7QbtdWN1+E1TINPneO8xlvCglCO/GDfrdA28/sTfLAo7azzQ/FphHOfAXohwRoND0BOx5JcrhbaW5OEn0aRHScIxFGc41P3AtzKufDLe/rBcQwcTktqHgIXMTPyKuyFbkJsCEERI9cBayUrn2GQ1mtHPuNldMD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfDBFfGIT5kbUPhIlv/Q2Hfqw+zHQFe3k8qVer8Mvqo=;
 b=RsMDkMWnODg+kJ1Z+yhiY6vAhugfqpUscLlnIHWV27p/4YrnzQN/rwM1d37am9xCFl7zl6uxbXkXWEZBCUs6ChQ0WKd79geLkuVtMWASZ3jS+lWASv9KSQxkjl1pOpNBvcdAkWsXoT6TQJQ7ruhUN+xhNH28P7HtDM3ECB9/XH+DVeixjnlefwuQjnStqg9qDNVgz3MUNaMlAAxvYgS0PtFIjIAvdnmiNj9vl5knOpFwERR974g6awT7p2qfhEia18OSLBDN7pht8O4RQUYQ24cAJWCdDn7hqb5nimc3ns+6g93bYT9y9EMENAuVqGouY+/ctvrmVIMuy91ZKIc0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfDBFfGIT5kbUPhIlv/Q2Hfqw+zHQFe3k8qVer8Mvqo=;
 b=w1rj+svw2ivqG40jPWeP+Tx7Ad4MBtNyi0o48bVDZKe0lBvOaP3RY7/gibas38qmCc4JivMdHSRs03JhNZnoAM7HGfLZ6x7wa386DFaT/WzSiW/abz3pFDKp011WxZsmno0W8ADVvXirw8cYDg2PwqMUDruBfn3FOfrwfxQ6jZ8=
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
Subject: [PATCH v11 5/5] vpci/msix: Implement cleanup function for MSI-X
Date: Fri, 8 Aug 2025 16:03:37 +0800
Message-ID: <20250808080337.28609-6-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CH3PR12MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e51d3b-2d25-4dd7-688e-08ddd6522324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UC9WNEUzVUt0ZGRGQlhkd2c0MXEyU2wrcUoxQ28zNGNOemhvWUNIcGVOYVcr?=
 =?utf-8?B?VU9uWHRYUmtPWTJpNC9SQUlUemJ1eTBJWkRvUVdNSCtTcUROQjZBbXVNdUNv?=
 =?utf-8?B?YkZXbE52dGp0em1jVjRTSmtPOFZHRGZyeGttR21iQTVkRFQwTXJCSHcxSmdp?=
 =?utf-8?B?RXlJemtXTjhMdlJ5WjdmTktSVkdTWmlNL2xnR2VMK0t5N1pQYmNyK3N6QXR0?=
 =?utf-8?B?R1ZXQTcweDk2Y28wTEM3VWJLVnN0dHk4NU5QYVRqZGV6ZWoxVzhMU2hERW5n?=
 =?utf-8?B?VXVibzFnSU9maHlxbDVNL2VQbGdQQzVLdklaS20zN3pSbVZxVGY1NTI3cU9G?=
 =?utf-8?B?VDlWcHhDL0JKd0VPWTBaZzVkZGRycDYwVkgrYzhMZSswTzRWUUR1K3lsaThz?=
 =?utf-8?B?L3pFOTJoS1pNL2JTZEJQUFlvZmpYMDVDVTM5YVE4L0FkMmhobW1YV1RiclFQ?=
 =?utf-8?B?bEllSzZOK0JqMUl3WmJUc2pBQWh6eUhvOVVscm9tQkl0TTNzaFV6d2F1RGdT?=
 =?utf-8?B?b0h5eHZvNXdTUS9sWmRtNWhPNEJDT1dwWk5qT1V3K3FmMk55WVVUSSt6UytE?=
 =?utf-8?B?VktPR1BkdVBYUmMvMi9sQlNOTExoR2RoOGEvZTFEOFBpcVpOWWk0a2ZiU3NP?=
 =?utf-8?B?NnBhNVdsR2xLWGhqVzU0VXRUS1h3SXFRSE9aa1RFd1ZzSzJzS29NZjVUc21j?=
 =?utf-8?B?UWRONE8xaGQzbXAvVnErNk9wb2xBNVJrYmxVaTI2Y25POUF1VmhSZjByVVNL?=
 =?utf-8?B?Z1JzMFhhejZoK2RxdytodFNpSURLTVQ0Um1qdUZhUlpOM25ERTk1eUZKWExO?=
 =?utf-8?B?VUZNcWtzZlFBaHhqcHJra1hnRktRWTA1QkxKVGM4cHRmN0RIREtYNU1vcEl4?=
 =?utf-8?B?Vi9peEhvbCs0NE54emp2cXJRNDZ5a1hPS0JwalRyMjRzRG9Mak42UXY3QUlX?=
 =?utf-8?B?bS9YSS92bkNHcXVuY0pRYW9mSWRLRnFIdWZhTGRISjRCYWxJZ2VScE1GaER1?=
 =?utf-8?B?MDErRmErTHpQRFY3TjlJTmNDRXpYMlB1WDRYejl1VlNpYXBBdE0vVUZodGVE?=
 =?utf-8?B?L2c5VlZ5VlB1ZWVLUjF5SmpsMjgxdlUrem9aQlpCZGRjb1FnYjkrcEtTQllt?=
 =?utf-8?B?cTdkTy9RRllwaWZaMTZIU1BNUFluVDdzeEpHNDllR3UwYWMvNlFDWktKRGNq?=
 =?utf-8?B?amNDLzdUcGEvK3JKRlRNVktMNkJXUGxsVE1Ib0s1Sis0czNFR1cyNVNxSjVs?=
 =?utf-8?B?bEQzUGZFZy9IZ1cyZnBFanhYc2dBcVBxRmF6cWNnTVB5MWVkVmpCU2pib2pC?=
 =?utf-8?B?dTM3aGVhanZDdXVYS3BqRU14OC95NG5WeGh4WDZNS2ltdlhxMyt2aGgvcUo2?=
 =?utf-8?B?MFZ1V0pQZFphclppbEZFQ011Y1o4ZE1FNHhFZGdhdkxTS090RTE0UXU2dmFI?=
 =?utf-8?B?Tk03YjBGdUFCMzcyT2lDcHJEZU5RbzB0NzhCTWRpaWZSZzFNMlp0UStEdU5F?=
 =?utf-8?B?M21yQjdiVjhpNnBkbHRlZ3Q1VmpDemg4MU43S0JoaGdjcUVHRi94UHlEMTlS?=
 =?utf-8?B?Q1BEL1dDMXBUaHBpT0llMkdScmNIckk4a3dJc3lsUForVjdGNXRtV3FUN2d3?=
 =?utf-8?B?VzlYUXRLRDRhWERUMHFyVEhDOWhZSW8wMUdtTXoyLzVJZWVEakdDVEVCcExn?=
 =?utf-8?B?bnJxVzFtWThNOTFiMkt5MzdINzVNbGhvb0RqT2l3UlBpNkFLREQ0WEhlRERM?=
 =?utf-8?B?eEZyUk5MQmwrRGtUMkd4QjdWY0pRTG05ZEkxL0RzdzBqUmFMZXc1RUJtRlBl?=
 =?utf-8?B?MENyK2NFTUMrM1FXQjNCalQ5d1VSWjQvYmFxR01ZcU9YVEJSS2Q4cGxUcy9H?=
 =?utf-8?B?b1dKLzlxOVVBc3k4TUtYbGNlRExBQjBaUnFROEkvUkxobFp3K0dvZy9CYVFM?=
 =?utf-8?B?OUIrOHBnalo2Tkw1bHFENDRvSnlKLzRwTTlJeS9Rb05xaWpMSnBQYnBzSjVj?=
 =?utf-8?B?MW05QnhXdDRURFQxcGpYWGViakIrdTRHZGVLV2tkZlZSd1RKc0U2VkdLWTJr?=
 =?utf-8?Q?M0BzDr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:04:02.0373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e51d3b-2d25-4dd7-688e-08ddd6522324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9396

When MSI-X initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement MSI-X cleanup hook that will be called
to cleanup MSI-X related handlers and free it's associated data when
initialization fails.

Since cleanup function of MSI-X is implemented, delete the open-code
in vpci_deassign_device().

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v10->v11 changes:
* Move calling all cleanup hook in vpci_deassign_device() out of this patch.
* Add hide parameter to cleanup_msix().
* Check hide, if it is false, return directly instead of letting ctrl RO.

v9->v10 changes:
* Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().

v8->v9 changes:
* Modify commit message.
* Call cleanup_msix() in vpci_deassign_device() to remove the open-code to cleanup msix datas.
* In cleanup_msix(), move "list_del(&vpci->msix->next);" above for loop of iounmap msix tables.

v7->v8 changes:
* Given the code in vpci_remove_registers() an error in the removal of
  registers would likely imply memory corruption, at which point it's
  best to fully disable the device. So, Rollback the last two modifications of v7.

v6->v7 changes:
* Change the pointer parameter of cleanup_msix() to be const.
* When vpci_remove_registers() in cleanup_msix() fails, not to return
  directly, instead try to free msix and re-add ctrl handler.
* Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
  init_msix() since we need that every handler realize that msix is NULL
  when msix is freed but handlers are still in there.

v5->v6 changes:
* Change the logic to add dummy handler when !vpci->msix in cleanup_msix().

v4->v5 changes:
* Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
  since cleanup hook is changed to be int.
* Add a read-only register for MSIX Control Register in the end of cleanup_msix().

v3->v4 changes:
* Change function name from fini_msix() to cleanup_msix().
* Change to use XFREE to free vpci->msix.
* In cleanup function, change the sequence of check and remove action according to
  init_msix().

v2->v3 changes:
* Remove unnecessary clean operations in fini_msix().

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msix.c | 47 ++++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c |  8 -------
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..287aafda9157 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,51 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static int cf_check cleanup_msix(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msix_pos = pdev->msix_pos;
+
+    if ( !msix_pos )
+        return 0;
+
+    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    if ( vpci->msix )
+    {
+        list_del(&vpci->msix->next);
+        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+            if ( vpci->msix->table[i] )
+                iounmap(vpci->msix->table[i]);
+
+        XFREE(vpci->msix);
+    }
+
+    if ( !hide )
+        return 0;
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports MSIX by default. So here let the control register of MSIX
+     * be Read-Only is to ensure MSIX disabled.
+     */
+    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
+                           msix_control_reg(msix_pos), 2, NULL);
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -710,7 +755,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
      */
     return vpci_make_msix_hole(pdev);
 }
-REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
+REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3122847524d2..394d75490db9 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -355,18 +355,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
-    if ( pdev->vpci->msix )
-    {
-        list_del(&pdev->vpci->msix->next);
-        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
-            if ( pdev->vpci->msix->table[i] )
-                iounmap(pdev->vpci->msix->table[i]);
-    }
 
     for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
 
-    xfree(pdev->vpci->msix);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
-- 
2.34.1


