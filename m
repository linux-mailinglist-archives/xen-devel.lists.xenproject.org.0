Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC19A93F4B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 23:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959413.1351778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5suQ-0004pK-J3; Fri, 18 Apr 2025 21:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959413.1351778; Fri, 18 Apr 2025 21:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5suQ-0004mL-Ff; Fri, 18 Apr 2025 21:06:02 +0000
Received: by outflank-mailman (input) for mailman id 959413;
 Fri, 18 Apr 2025 21:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+zk=XE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5suO-0004mE-VW
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 21:06:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed4b72c0-1c98-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 23:05:59 +0200 (CEST)
Received: from SA9PR10CA0024.namprd10.prod.outlook.com (2603:10b6:806:a7::29)
 by MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Fri, 18 Apr
 2025 21:05:54 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:a7:cafe::e4) by SA9PR10CA0024.outlook.office365.com
 (2603:10b6:806:a7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 21:05:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 21:05:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 16:05:53 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 16:05:52 -0500
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
X-Inumbo-ID: ed4b72c0-1c98-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i22Uep4FZxKgqRRVYa2R4Dv+9VQhUTwQj1gBV9rdxHUWwb4lk4OiBQ45JiT+UGD8YV1inq0uS6uOEJYombvFrn+KrGi7qnm8z4jP6D/Nq4BFUoO1dn/hGqwgPMprsHAvnmlD3ufyOXkw6DAI5nBfNAAinwcdxwSCg48Y1prX1rEEgaAMBZCt4ss3sziuNwH7t+4tpIOwTik5v2aerdEp6hU3DxbAN5k+kBuExUKc4X1kg7Y2PB1BGtlbX4DuTWmfwawztS3G6gVUqkVWBCM/o+jsKULSb8/aBwECCim/tR5rXh5UHE0HR8WD6/5vZlXt+koAKq53yos5W8Pt3UFDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+1E+txCtmQHoDz+MpR924cVPxE/ZGUWJsLMeLMmJ1s=;
 b=ozwNbtvn1dUFhIrLuM5vo1K9Qx9XMD+X7Kn+U7iW62D0DJUjQLUGZGaRq0LmF0VGihUjldEEfNfEznFoXypkPalo2svuTmLqGl3lIbwLeOIZEUXmJh5m5XyiJYstw/Rdkild+GDDSzrg3Gy1Vxa3t7wrTcz1/NecZb2BVhZ/equcm1cO6xqJk5dBqD8Hl5yrlkhTCwERqn9IwOkJp2761lCl39hZQu8+Vvf3zdBwziWz3E+l7F57ZVZOa+g6qcYeOTubWGiWOuF8LA9TJDxnjtVWgS8MEz952gKP3FsbhpHio4UY8npSgDjOiywDHif2pxTw7hwe2DJRwmMVgMrF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+1E+txCtmQHoDz+MpR924cVPxE/ZGUWJsLMeLMmJ1s=;
 b=ZnKACodau5x6KECUh5ZBjec4eOiYt0gHeyhahUIh39HQZ7bXXQzDrnH5n1/pgu3JRZK4a9sevbsJJ82IPSAEOEfBkkpA5bYEWiZLRu7egs1DY1aob29S84Vi7ZBMpSV2zJRHwT/UWMRb0qvg9l7iqfr1/D2oArLOSjcf5uZPz/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/2] tools/libxl: Skip invalid IRQs
Date: Fri, 18 Apr 2025 17:05:49 -0400
Message-ID: <20250418210550.542456-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418210550.542456-1-jason.andryuk@amd.com>
References: <20250418210550.542456-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|MN0PR12MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: f279a8c7-1756-4df0-b7d1-08dd7ebcce53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UccTCNmmVFOswf6T6VJJ17L3dDlcmffGREZxO9HDBZKe2Of5k6Hg/aEYDbI2?=
 =?us-ascii?Q?4XEc3EYlOJc/bBLhxk49W9ozBQAlqDzW9YIo71rjAD3q3KD5UT7KRNJsaMty?=
 =?us-ascii?Q?MdkCwiJVsly683eANCbzkbV/M+9ial6N5BGPncGKf/vULAbqfsGcdBZKCu0k?=
 =?us-ascii?Q?yBHQSFyZLM8U02YvtfRf8oS2OtFUErhJrtIoYwzLo3JolFzAYVLuOaUcyrlr?=
 =?us-ascii?Q?d/VEAhsMdAWu+YsKOgm2FoYpNFDYM6FZ2wMBrqEukvk+toZqgRTsQw5T93aR?=
 =?us-ascii?Q?Ql2xoR6YamSBqih10VMw39gM7XAMU+zp5WHugzPxux7gauXeQigBB4mbCIm5?=
 =?us-ascii?Q?TxtYVtXSxjNp/su1/PHs/rsJVjWdF3HWCiooeJapNJZ65LB/yQLsvF+gNxEA?=
 =?us-ascii?Q?jeA7XpIRhyZcguH1um7HvsDGl9/pT0gofkPuTLJVmNBkXmmvoXclKoTzSKHw?=
 =?us-ascii?Q?AjQw1YEvePoObrK5GjBcx3gYkYk6B08RMFTuISdEI403gY3pg839LrmHkGg1?=
 =?us-ascii?Q?WKVBQYlOfBC/ouh5Puf7VVN1G92QFMD2geYfd69Ygtf9fTc2RjWGJlRpf2gC?=
 =?us-ascii?Q?C0FrZG6hsnCizHedZGQJR7QBl0IFV2P/bVrtG1rHncwNiUC1SZMHiA7+sJP5?=
 =?us-ascii?Q?qd62cfrU3vCtTpymvUqvdCDOI5zj7y98f33EkWezA02ymCTk7gGL5WHYcrPu?=
 =?us-ascii?Q?RsQ45wV0wCOEsvFkmY4FvJNLOsmdgxVTe0JLS65aNte89VEaelXn9ZgFS8dc?=
 =?us-ascii?Q?mEkfkvJMxxqfLGMngb7y/3KJ/8Vb1xbTzqypbGtyxnz79cNgeX8StF5pVWbm?=
 =?us-ascii?Q?6brorWWO2gTp/fI9P/QG9OK9V9Pih4NaJpg3AljA8fI/9dLzzIrYh41a1FUz?=
 =?us-ascii?Q?zCiHvvjak5a0aW4GVmXIigx1uSAPIKVKEZSTzNiDnT9yirPbV2sM7C/C51Db?=
 =?us-ascii?Q?fk2m/wbw2UwVK6+AduTDTo+5mKAurI3CKE60qprSv2kpPCS1ARy48CmuN46b?=
 =?us-ascii?Q?m02wjfwGJEutnwZ7DxKEMgfiYqmYQh6M9SduqLRCa53TDNk0sBHJxkuHBLGW?=
 =?us-ascii?Q?zil0oG888/ztcJJgklTQHtqDWtruD5ZaFHfZqn1n/pkbKokon+HroeDec6UF?=
 =?us-ascii?Q?0eGli4U1iwAlTATZudOmO9ZYTk/Vwgj8QMILVUJZVhUhe77ai1keXUx1dhJ5?=
 =?us-ascii?Q?veYnA04WOaR49SIJZ3YywgCQhKo9hlclqvGnYfcslVceQZJNbWLGSbVrsAxd?=
 =?us-ascii?Q?l9CO/4MgzUiBYHQkpSqxBTBg0kNYC0K4DEZMmWYg6vOXG9G7mfnS43rLpShT?=
 =?us-ascii?Q?iHewqPyltQfzoyo2kQltcOCL0xnPAPb5IsbRCzSB4/SZz0sOjiRKkAHNQrAS?=
 =?us-ascii?Q?98iX+GkzdyzU0ChqVhQmTuoalnT0Szd4wqSq5JN0WXUcvUDrIAP3yXu/14ZT?=
 =?us-ascii?Q?lSgsbpueDyRFQAYgq0UgfK2A5Ztb2VDVXpEGrAvSY6r0Bqc8ALJ5g0GeuZP/?=
 =?us-ascii?Q?JnVKO6K/J9CDa8zaWwDfgGJvupuBad7HMHGP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 21:05:53.6241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f279a8c7-1756-4df0-b7d1-08dd7ebcce53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5786

A PCI device's irq field is an 8-bit number.  A value of 0xff indicates
that the device IRQ is not connected.  Additionally, the Linux ACPI code
can convert these 0xff values to IRQ_NOTCONNECTED(0x80000000) because
"0x80000000 is guaranteed to be outside the available range of
interrupts and easy to distinguish from other possible incorrect
values."  When the hypercall to assign that IRQ fails, device
passthrough as a whole fails.

Add checking for a valid IRQ and skip the IRQ handling for PCI devices
outside that range.  This allows for passthrough of devices without
legacy IRQs.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Remove () from around fscanf()
---
 tools/libs/light/libxl_pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1647fd6f47..6ddcdef6ad 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -26,6 +26,9 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
+/* PCI Interrupt Line is an 8-bit value, 0xff means disconnected. */
+#define PCI_IRQ_LINE_LIMIT     0xff
+
 static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
     unsigned int value;
@@ -1495,7 +1498,7 @@ static void pci_add_dm_done(libxl__egc *egc,
             LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
             goto out_no_irq;
         }
-        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        if (fscanf(f, "%u", &irq) == 1 && irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
             r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
             if (r < 0) {
                 LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -2257,7 +2260,7 @@ skip_bar:
             goto skip_legacy_irq;
         }
 
-        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        if (fscanf(f, "%u", &irq) == 1 && irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
             rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
             if (rc < 0) {
                 /*
-- 
2.49.0


