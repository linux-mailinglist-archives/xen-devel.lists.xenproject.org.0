Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08608B1E40B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074090.1436796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI58-0000nN-5T; Fri, 08 Aug 2025 08:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074090.1436796; Fri, 08 Aug 2025 08:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI58-0000hf-0J; Fri, 08 Aug 2025 08:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1074090;
 Fri, 08 Aug 2025 08:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRAb=2U=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ukI56-0000NJ-Up
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:04:04 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2406::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f881b32-742e-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 10:04:04 +0200 (CEST)
Received: from SJ0PR13CA0206.namprd13.prod.outlook.com (2603:10b6:a03:2c3::31)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Fri, 8 Aug
 2025 08:04:00 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::e6) by SJ0PR13CA0206.outlook.office365.com
 (2603:10b6:a03:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.8 via Frontend Transport; Fri, 8
 Aug 2025 08:03:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 08:03:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:59 -0500
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:57 -0500
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
X-Inumbo-ID: 3f881b32-742e-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJrBX/zGQfApatTe+tVlk7YokxMY+bESiR8r/zleobIFu59ygifi3qPfG2chc2zejc7DmIsZIKGl91LWymBPNRNq/4LIXQNRbKSLNcrl/QBeFckGq7oL7OzyHKkgSKQED99bSvWd/iyLQ0ZFo/IUNozsICcQos7PUPCwSG1n5xaovRYEPB5EULJAWL2/6MIS/sgSATc4S79AW4mrWzd1s36hTmaux48qxGLuhlr8NtH4RkhN+O7abIEEUaEbrTnuSlCasw8B2gUb6RMi9KyvFM8OZ8lqJEsHnbdOu2bZfH9+vwy6A6AKlqOorVRZ4FMHOt0gC3C8igswfVnr6ajDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18PN0RiKa9jBkMT8VyeUB7eM6IqgO1+zMKS0ZzYFsYg=;
 b=J8OgN29dBWIjlHsAfIqdQEPCfOUfWT6dsVji4/A9yhZ2HON+/D6YFdlsAt+6+fpirYWQuaEEx/8jYIba/1KRe9ewOW0pxukxt5J6+DMXgRPfaFmuabny5SxGsNfTOdhNlrZWNQMWhEHt5uTyt0Jl8wO6A+kSiijQc5m1ok5GK+3tFc0bt2pC/jNAsHIytqf1boSLtukXrZXgn3kYcgUpoUP+iMkUkxOYrsERwbgvU//rJW36gAT0aSq0LKjrZoE3XQbLlnabeTvvKBvHWSAVlWsXtkO4XDlLODyQt2bHDrX4Z/C0VaSIx52m1fo9Fi+o5CINYh1PEy5EF+bLJ+XcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18PN0RiKa9jBkMT8VyeUB7eM6IqgO1+zMKS0ZzYFsYg=;
 b=AtxupAHSNXUHiggVIaPeyJu0D65KIrNI3v6UJdZ/9G/KkqBrqajruagU9aLflWvo0PWoOYJ6szhpEUcFSXJXAFa28CHyJ+kB2SbhKO/k9KsTOjqapdFvcwNS5qhB5ds0VllkCFFB9oUaoQzDUxiOfF/Gv1vbCOaXIzPZD7E46JE=
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
Subject: [PATCH v11 4/5] vpci/msi: Implement cleanup function for MSI
Date: Fri, 8 Aug 2025 16:03:36 +0800
Message-ID: <20250808080337.28609-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a84b56-2370-4f14-9997-08ddd65221bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUpNS0crWmRvejBGOUJQRFhCc0ZFUWQ1RG9EUXFUWXhqaVAyazcvNWFFblpK?=
 =?utf-8?B?MjJhTHBTZTdhWXgvN2JNVDBwNVJaczRpWEJrZWVUZ1pZU2FkTGJFSkxVQy9L?=
 =?utf-8?B?MWhBVTRDdzk2cGJka09yOFNOdkVtS0haQ1lBOVVPSk5VSmxYVXlyZU13UUtG?=
 =?utf-8?B?QVpkQkxTK3Q0MERkZXh2ZW9ETjY5K0VhUTVKN2RpWUV6RHJqaXhjQ2EwcHJv?=
 =?utf-8?B?VUJjSExKVmtSMk82M2hHdzRndm9BWlFMb1ZpN2ZSTjJ1WlVTZE5PTlhHODNS?=
 =?utf-8?B?ZnlLK3Y5ZVNNanViaS9aaUhPVElVSzVBbGZCU1hKU3k3Slg3cnZ1SHRZOHVV?=
 =?utf-8?B?REF3OU1tNGZ0Uml6TWtrK0YvOW5waG0xV3F3UkFrRUsrcU13M0VpTCt2cXha?=
 =?utf-8?B?N2lKN0U5eU1WNm9pUkRMZXg1K3paRlZ0cjFrTlBXcjVNQTlWN0N5QkJ2SWV2?=
 =?utf-8?B?TUhZckxGNUsxczR3WU41TXJNNEF3eEplWnV2UkpjTTd4dEFxTW1RRlZqbisx?=
 =?utf-8?B?Z3BVSW5PTGk4Wk5Hd1QrVnJVUDVlb1ZzVTZraEJocHhnQW96RERQcm45d29w?=
 =?utf-8?B?OGMxUm5UTXZ1NDRiWUN4RGlITUYvOC9iNThCREZsUWRLQ0dvZWNibHlEelRE?=
 =?utf-8?B?TjNVTnltdlY0WVgvbFdUczBMQi93MGw4QlVNRC9DK1BFV2hrQ2pvMDdtM1Jh?=
 =?utf-8?B?ejJxd3Zocm8xMFpnZzVncElKNi9ocHc5TVlZZEg2ZGZhN1BhczF0L3dnQ0oy?=
 =?utf-8?B?TEFIcUhHVmZtUURRQkJwdEh6elJ3R0tZajdta1lOempUbFFPbU81OHpFamto?=
 =?utf-8?B?QkdhUjVIbmdaQXJQaDV3QWtHVkcvRzBSeEt2eUZWUDF5c0t4UjZaT3lXZ0ln?=
 =?utf-8?B?c0p6dnRrS1NaVTk1Z0FUZWVpS2FlMTBGVVNTT0R5TXJhRkljM3lGS0VwYkF2?=
 =?utf-8?B?ZTdaQTFnTHp0M2xQZjIyOUdKWVNwa2syaVlwS0dpNnpLTjlXcGR6WGZvS2Fs?=
 =?utf-8?B?ekdzdE5zNTVKWFlCamtncnRFT1NSWGkrU0VPYXpRaVAwcWh1K3VYSmtISFpq?=
 =?utf-8?B?YVhjVEpiVW16bUZYWHpJZVJaQXRZSW95WGdRL1FnaEZHZTN3MnBUeEYrV2E1?=
 =?utf-8?B?TzV4UkRDNVdlTGFWbDdQOG9LV0N6ZEFyc3VVY1ZvSFhXZEdBeUh2VjU5Yysz?=
 =?utf-8?B?QTR1WDM4YzVmdVc3OWV4bkF1dFdJd0V5dk9qN0R2SHhycU9kUFhmc2ZEemhH?=
 =?utf-8?B?cHhVWVNZUHk2U280dzhRZ1hkS2lpUlpXbkVPVFVXanpTTHU4dFducGd0aU1t?=
 =?utf-8?B?QXlGRHJkUG9yaVMxUzVmVkRYY2xHTDZMZjE3RjVjM2pyZkxra2VIOEFJVGY4?=
 =?utf-8?B?MDJNUUtoK0Myc3A1U3JiWkZzclY5UmRKWTBHRXprTE5reDRQMC9BZTM3bFRD?=
 =?utf-8?B?T0ZDY3hhOHRwSE5CSlN0U09PNnEvZEthcUY1WWVPc1lFRGhYK1pLYzZ6TjIw?=
 =?utf-8?B?N0dnMGlRdVNUV010eVlHNndUNDRLVXY5V28va0c4ZFpaVmhCWE5aSitZcDA0?=
 =?utf-8?B?algvYjdkQ0RzcWNxN2czSWlDOGUxeWN5My8zbU14bGZodUc1NHQ5Szd6eVcw?=
 =?utf-8?B?UUVjdFFkNFB4VTlsc0cwdVdmZm9Vamh2TEJTZFFYcVZOU1FlcVdLbWFxUU5R?=
 =?utf-8?B?eEVNdEV3S1ppdmI3QjRhMCswQ1VENGxGYlRIT2R2WDkvcUpxQThqSWd2ek1K?=
 =?utf-8?B?N0JHdnZ6V1ZKeFhoUkxjT0JtNi9iWnZqWGVXWnZIc25xdlBZTlNPOFpCK1JD?=
 =?utf-8?B?ZjJPRkZkd1NOVy84MXpRRkl2b2R0VUpkMGxsd0ovMEo1aW92N2NWditWNEdO?=
 =?utf-8?B?czZWRUV6NE9KU21XSm43Ynhod01aLzVlKzZiZElOTWZvUkJuaHpSZTZzN2VE?=
 =?utf-8?B?N20vM2lzMXJmbHJJRXdIZlJMd1lqWDFyaXVLclhYMDVkeFczcFRsNGQzcWx5?=
 =?utf-8?B?aEk5b0pTSytnOTRQd0dySWdYRWhhZ2JFbkEvRWlIOUYwcUlxSytuaVpGdHZh?=
 =?utf-8?Q?GCJwQ2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:03:59.7000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a84b56-2370-4f14-9997-08ddd65221bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139

When MSI initialization fails, vPCI hides the capability, but
removing handlers and datas won't be performed until the device is
deassigned. So, implement MSI cleanup hook that will be called to
cleanup MSI related handlers and free it's associated data when
initialization fails.

Since cleanup function of MSI is implemented, delete the open-code
in vpci_deassign_device().

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v10->v11 changes:
* Add hide paratemer to cleanup_msi().
* Check hide, if false return directly instead of letting ctrl RO.
* Delete xfree(pdev->vpci->msi); in vpci_deassign_device().
* Remove Roger's Reviewed-by since patch change.

v9->v10 changes:
No.

v8->v9 changes:
* Add Roger's Reviewed-by.

v7->v8 changes:
* Add a comment to describe why "-2" in cleanup_msi().
* Given the code in vpci_remove_registers() an error in the removal of
  registers would likely imply memory corruption, at which point it's
  best to fully disable the device. So, Rollback the last two modifications of v7.

v6->v7 changes:
* Change the pointer parameter of cleanup_msi() to be const.
* When vpci_remove_registers() in cleanup_msi() fails, not to return
  directly, instead try to free msi and re-add ctrl handler.
* Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
  init_msi() since we need that every handler realize that msi is NULL
  when msi is free but handlers are still in there.

v5->v6 changes:
No.

v4->v5 changes:
* Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
  since cleanup hook is changed to be int.
* Add a read-only register for MSI Control Register in the end of cleanup_msi.

v3->v4 changes:
* Change function name from fini_msi() to cleanup_msi().
* Remove unnecessary comment.
* Change to use XFREE to free vpci->msi.

v2->v3 changes:
* Remove all fail path, and use fini_msi() hook instead.
* Change the method to calculating the size of msi registers.

v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array
  to record registered registers.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msi.c  | 49 ++++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/vpci.c |  1 -
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index c3eba4e14870..6ab45b9ba655 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,53 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static int cf_check cleanup_msi(const struct pci_dev *pdev, bool hide)
+{
+    int rc;
+    unsigned int end;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+    const unsigned int ctrl = msi_control_reg(msi_pos);
+
+    if ( !msi_pos || !vpci->msi )
+        return 0;
+
+    if ( vpci->msi->masking )
+        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
+    else
+        /*
+         * "-2" here is to cut the reserved 2 bytes of Message Data when
+         * there is no masking support.
+         */
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+        ASSERT_UNREACHABLE();
+        return rc;
+    }
+
+    XFREE(vpci->msi);
+
+    if ( !hide )
+        return 0;
+
+    /*
+     * The driver may not traverse the capability list and think device
+     * supports MSI by default. So here let the control register of MSI
+     * be Read-Only is to ensure MSI disabled.
+     */
+    rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
+    if ( rc )
+        printk(XENLOG_ERR "%pd %pp: fail to add MSI ctrl handler rc=%d\n",
+               pdev->domain, &pdev->sbdf, rc);
+
+    return rc;
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -270,7 +317,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_CAP(MSI, init_msi, NULL);
+REGISTER_VPCI_CAP(MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6ecb70052b93..3122847524d2 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -367,7 +367,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
         rangeset_destroy(pdev->vpci->header.bars[i].mem);
 
     xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
-- 
2.34.1


