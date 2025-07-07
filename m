Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67346AFBB33
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 20:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035750.1408101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYqxh-0000fv-LN; Mon, 07 Jul 2025 18:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035750.1408101; Mon, 07 Jul 2025 18:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYqxh-0000dl-IV; Mon, 07 Jul 2025 18:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1035750;
 Mon, 07 Jul 2025 18:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cN17=ZU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uYqxf-0000df-MB
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 18:53:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2416::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c978a99-5b63-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 20:53:06 +0200 (CEST)
Received: from CH0PR03CA0312.namprd03.prod.outlook.com (2603:10b6:610:118::21)
 by SJ0PR12MB6687.namprd12.prod.outlook.com (2603:10b6:a03:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 18:52:59 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::aa) by CH0PR03CA0312.outlook.office365.com
 (2603:10b6:610:118::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 18:52:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 18:52:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 13:52:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 13:52:58 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 13:52:57 -0500
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
X-Inumbo-ID: 9c978a99-5b63-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sbn8U4nyOhzKnxAdncvdk/95vB3wLU4WA2uCHnji2gZXPTwqpM2V1pjQqQZ9wxSRvfimByc0ci79/otfW7OCxSll2yiffZ1b69niJuPQZUQvuuc/WaWpKEcuDCnCRXtl+tIjDe+6yBjGXT3gci7gnlRkTE7B8eE6NfHQCUS7UCubuataICRVh3lBMuuf919z9FM9GL8mCvMPBXnYRBJGePAXySRbx/p4gyLE0lZwe8G/vuqrBGOhTeac2mUkKT1aQkSJtZ3u/05v13Nhd6X6IqRgfNOhkkV04dxICFdAGbwM1oAlE9TSrvnnJfUSyQ/hfbERGPaDMRzaNZYKX8UFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rta20UqROBVjD7DQDoGoPFb/hARMkiuKa01BXFtWgLo=;
 b=SXCQZB3R3Av/mI4/wN544Kj3lkqQdSX0hb20nyLG/brAMoQNKGOWB07CKeb0eXbTm+r1/e7gvw0xUS2P59v6exeocS9ittN8kX4m3LBhu7HQu6kTNgkN+t7cJD1NTEpxGyVTYk5YLNB+J97apG83GJK1VcIVdQ6JWb31Mjjns92hxH1C9edppZd5bzyloCSO3XZF58Hvo8jE3xzMqlSo5+crN48/xOMHVwTSGBdUiH5zZwa+kLnisQPfJ6SL+Vbupr65c1F5xwptXt7Xo7KyTfCYB/GmKvoAXMMTFGPCkX/dqZXo1dPeOuDzegbYuSKTyzQJTYf71b6s74yUWfI12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rta20UqROBVjD7DQDoGoPFb/hARMkiuKa01BXFtWgLo=;
 b=J9cV5csvXScSz1I+y+5E5KlD/QECxpjjvehha53iQRHD8le6NwvzrBQDIzRCgFAPqwvoyWAz1IbRD7nScNwImxSrKRCYbf3AKksKPxgHK+SFz/pKuEQD+nkjcOH+NJLjOJ8OywW9n6pfYW/erAJUhQVcMDAiFrcH3cpdu9XiYlQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] vpci: const-ify some pdev instances
Date: Mon, 7 Jul 2025 14:52:51 -0400
Message-ID: <20250707185256.40086-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|SJ0PR12MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: 12165d2a-2346-4b0e-5367-08ddbd877e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWdDQk51REFneGJQSXQzMTcyNjVXc1h4VDRxNWVOdXJja3d3ejBjWklMWUFt?=
 =?utf-8?B?Wno1TENBQnNZejRrZWdkQ1J3U0lIYUpOZFAwVXIvTDUyK0tiWEVEVjdsNE9W?=
 =?utf-8?B?Skw3TENUN0dTSHZ0K1VaL1lyT0FFdjkvMmltK3RwRHVjdys2UlVDTTNXbmFJ?=
 =?utf-8?B?dDVVNGhBeHBLU2R0Sm9lRkJzckZmN0Mzc2dJUGdvZWdiSVhZT3VpbDRZYVo4?=
 =?utf-8?B?cXg3OUFXazNYTUtMWTdpS0x5Z0h4dU5IVnQwWWwvaXdIUVVPN1pWNlJxNmlY?=
 =?utf-8?B?L1JBSU1sbm43WHZKOERyOW1iZlcyc2svQmpHc0prbVVHa05CQWVwZ05FKzdR?=
 =?utf-8?B?OUwvaU4xeE1iazVFSWhXbWJIL0UwTVVBUGN0Mk9scVo1b3pXN1dnY0VWQ1Az?=
 =?utf-8?B?cjRJZlE4UElMVitMWmVYN20wSTZkUXp0TXJRQnV6S2Evc0VSc1AxSFhJZytv?=
 =?utf-8?B?Nm82UTNsZnJWczViTXB1VmcyOWFJb3g2V1RZZ0k5VFlsRFhacGxhZDNYbDh0?=
 =?utf-8?B?c0dNQ0tJVU5oeDN5TzFrS2VVR2QzL29pUUpPMjJiWk51RUhLWmQydnl2cXhh?=
 =?utf-8?B?Ump3c2VGTTB6YmFwUzJuSWJJZm9HWFVvSy9pcDcrb09US1YxZVdTQ0YrKzF1?=
 =?utf-8?B?OEZkMytxbURLbmZDd08zczdtK2sybVlmUkN5WHhqTnpPVVFHUXZRN3d6SEN1?=
 =?utf-8?B?ZzhqSHo1bHVGa2JOM0E3VEFVeXVRWWhYNjZTR0x6bHpNSHQxYnp5aWhHVGE2?=
 =?utf-8?B?bW5ETUdYb1huTENKUTlLaUE4NXJUUGFtZThBSmVsY1FZdEV3bnZzeUx0UG5X?=
 =?utf-8?B?Z3FlaUhMRnE2eFU3aFlONGpoSzdwTGFBVGRacHROZlNLa1VlaXdEWHRwbk44?=
 =?utf-8?B?QkJ5a0oyY0h3OXJyWnRTK0NJSngxUTVDajVxRTFTV3NjTjc4L3RvcWcrc0Rz?=
 =?utf-8?B?Y1plWXFsOFRHd3RHRDMvdVVTT3pVSHArMGpoUVNnb3c3Q3I5TmV6ZXhXdERh?=
 =?utf-8?B?OHJXZncxeCt6VHVZUTMyUHVXZHR3RkFURTQwcjFZRkZzd1ErdjJMbE1MOUxj?=
 =?utf-8?B?ZjhaRjBKWlNzMElzVHdFcDBKQ24yN3ljaGowcXVlSzU5aEw1NWVlOUQrcktH?=
 =?utf-8?B?aUt6dm9FUlRMUytkZGpzdC9ubG56b3Q2TnJtOFFrWjAxanZMRmRyM3h2TnN0?=
 =?utf-8?B?Y0diTDNETDhqejlkVVdhMmpLVUg3Ri9uVUhFajllVE1xLzExYnlKZTJSWWZD?=
 =?utf-8?B?R1BjZW5zTkFyVkl3UzVpUHJiWkVGYTBUUkFzL2p4SVhRT2lsS0tNSFlyQmNO?=
 =?utf-8?B?VEpBVDVYV2VIOHpldk5YY1EwbUNhNGd0bHdDUzY3SXNleTlPU3ZBVEw5TFhw?=
 =?utf-8?B?M1JrZW05ZjNNWXl4VXQxcVMyU2JjZ0JteGtwTXRMT0pTQXRPY0hpdXp1WU1m?=
 =?utf-8?B?Vjg1NEJFb2x4ekZZdVhVRnlDM0l4VG1BYXcvaGNad2E2b3dDNndUTGphRjht?=
 =?utf-8?B?NlErWXRYNGxSSDdXVVdEdUM0MWRQa2s3VzlMdlNLOWxYcUFzb0Y3TGJ3ZEZU?=
 =?utf-8?B?RzBXQ0YwOTlxZVZHZjk5cExCMjZibDJtQkFscmp2S3ZuQ3l0NDJVUkVydUFx?=
 =?utf-8?B?S2pQMEhmdUg2L1pTc215OU8reHo5Z3pmZGR2bTU4RHc2eGhsQ0lDd0Rnc1hQ?=
 =?utf-8?B?eVI3anFrSzc5WGN4bk9tSkIwblZhcndYanVUL0FRbHlYRjZ3ZzE1bE5Pb0wz?=
 =?utf-8?B?WlVNdzd3WUZIby9RV21sNWRHanM1bXhOWG1OYzZuOHNkU3dkeHM0Ni85bHZ4?=
 =?utf-8?B?SEpkMTVaUnRMU2dOczc0cGtHUU9aQ3dKeXdwMnpCaXJnWnhLSjNWQW9pak5s?=
 =?utf-8?B?Nzd1bElBVzNZeXdQb2dLdHkvWVJsb0JyMkZ4QWJDZVVBcGN0Nzh6MDk0ZTlK?=
 =?utf-8?B?OUZ0MXkrTXZETGVwNjNvYnFZWm0vMWpQd2xKS2xpWG4vaHFZUTlDQTRLV2F1?=
 =?utf-8?B?em9HYy91L2dleUNwU21Qcm5rM2g1RyttUFFUdXZhM240WGwwOTVUS0pQMEJS?=
 =?utf-8?B?elh0NFBMVlZROVhndWduYitKNGlhS1ZpeTJRdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 18:52:59.0520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12165d2a-2346-4b0e-5367-08ddbd877e25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6687

Since 622bdd962822 ("vpci/header: handle p2m range sets per BAR"), a
non-const pdev is no longer needed for error handling in
vpci_process_pending(). Const-ify pdev in vpci_process_pending(),
defer_map(), and struct vpci_vcpu.

Get rid of const-removal workaround in modify_bars().

Take the opportunity to remove an unused parameter in defer_map().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v1->v2:
* join two conditions into one
* add Roger's R-b
* split from series

v1: https://lore.kernel.org/xen-devel/20250531125405.268984-2-stewart.hildebrand@amd.com/
---
 xen/drivers/vpci/header.c | 29 +++++++++--------------------
 xen/include/xen/vpci.h    |  2 +-
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d26cbba08ee1..bb76e707992c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -175,7 +175,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    struct pci_dev *pdev = v->vpci.pdev;
+    const struct pci_dev *pdev = v->vpci.pdev;
     struct vpci_header *header = NULL;
     unsigned int i;
 
@@ -283,8 +283,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     return rc;
 }
 
-static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      uint16_t cmd, bool rom_only)
+static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr = current;
 
@@ -308,7 +307,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
-    struct pci_dev *tmp, *dev = NULL;
+    struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
     unsigned int i, j;
@@ -448,21 +447,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                  */
                 continue;
 
-            if ( tmp == pdev )
-            {
+            if ( tmp == pdev && !rom_only )
                 /*
-                 * Need to store the device so it's not constified and defer_map
-                 * can modify it in case of error.
+                 * If memory decoding is toggled avoid checking against the
+                 * same device, or else all regions will be removed from the
+                 * memory map in the unmap case.
                  */
-                dev = tmp;
-                if ( !rom_only )
-                    /*
-                     * If memory decoding is toggled avoid checking against the
-                     * same device, or else all regions will be removed from the
-                     * memory map in the unmap case.
-                     */
-                    continue;
-            }
+                continue;
 
             for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
@@ -507,8 +498,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         d = dom_xen;
     }
 
-    ASSERT(dev);
-
     if ( system_state < SYS_STATE_active )
     {
         /*
@@ -523,7 +512,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         return apply_map(pdev->domain, pdev, cmd);
     }
 
-    defer_map(dev->domain, dev, cmd, rom_only);
+    defer_map(pdev, cmd, rom_only);
 
     return 0;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index fc8d5b470b0b..6a481a4e89d3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -196,7 +196,7 @@ struct vpci {
 
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct pci_dev *pdev;
+    const struct pci_dev *pdev;
     uint16_t cmd;
     bool rom_only : 1;
 };

base-commit: 05c574feeb00990b31bb472ef93b43a30a07fd33
-- 
2.49.0


