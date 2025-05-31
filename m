Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5159AC9B14
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 14:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002021.1382055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjG-00008a-Af; Sat, 31 May 2025 12:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002021.1382055; Sat, 31 May 2025 12:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjG-00006K-7m; Sat, 31 May 2025 12:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1002021;
 Sat, 31 May 2025 12:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L58R=YP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uLLjF-0008IU-Hf
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 12:54:25 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:2409::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 604ca8b1-3e1e-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 14:54:24 +0200 (CEST)
Received: from IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::16)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Sat, 31 May
 2025 12:54:18 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::7b) by IA4P220CA0007.outlook.office365.com
 (2603:10b6:208:558::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Sat,
 31 May 2025 12:54:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 12:54:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:17 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 31 May 2025 07:54:16 -0500
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
X-Inumbo-ID: 604ca8b1-3e1e-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjVMj59ue9T0HRhKhQPy//JQjNo64M8o5RSIJWXi/m/j2ii+XeWv3gB4QIKrd7pUL/FbqD7A5u+/Yf8HAJKbVSnI+AQ2vM1F7a45tEViCjEHIA4+oe+PqX9Qw/4NcvLUu7zDq8zYM7Ui7UF+VX+E0ZnuMyyTOymk6QWOe8xpiFUH+si78B9xwfxCEBu27eNllOy0loqgHFf/FOx5mT5aCdTYCPY28oPLYkx9nnXFZ+J06aWkJZMcV1E2SZDiCvgepCGgYlWSUjMzZtOvbtwINp5IqVNfdVPg5NSC6sRvN6VKZCSMHd5q1zF5ELzna29kQyNk35RaLOrqlbtGYnUUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8T8GqrveNE1OlycZlEksUxncr6lhVzWwzvdzZ1VRls=;
 b=V6pcRJ3l3fFJvG1rK7kr8zpDi6MuK2QxvwtiWLOygi9SyE+EXXV91R6OLWgoP+le8xH3CmH1yV6KTQbSNFubIm8w8r+6a85AV0Mhnn6ikwCAuW10noatIXiwLgYE+alPXvyXuB3FXNU4KJ4lZowXEyvrN+UqpxWA5LBupeUM19zvXr2yh3ukPFjDVjtjG8Dwdh+2URoVneitLEncqrDC2DiOtf+mbE5jyq0/ocWodv4FVKUhX78W/9CprgMlmXHZWqLOx073hKVCGEh0OXKBAo+kE6vXR05d9GAYINFZE8PFEPhZVPb4vMATaH3eUlBWAbEdsjmDMwkQPA6c9QTLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8T8GqrveNE1OlycZlEksUxncr6lhVzWwzvdzZ1VRls=;
 b=ApNosnu17zQEKHcoIjgT7xQO2Al7+dYXHPgGE6xqvknje3k+ycpIUMLU1ovANTYvxTCnpfSo/RU5dEOn54GjPQt+a2f+JKTXX3KLok1PnBbYzSGRubGO1RRQ3MbScNvQG322Dzin36qfgD4Ufx9k6MrLtyNggbAWDdpVLal0qT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 1/5] vpci: const-ify some pdev instances
Date: Sat, 31 May 2025 08:53:59 -0400
Message-ID: <20250531125405.268984-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531125405.268984-1-stewart.hildebrand@amd.com>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe736c3-f081-4db0-6e7b-08dda0424128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A91mWcmeILaReVai66cqdmuURSesgh0Cs7/pZor5VGqKXSF//kZgHRyzSvcC?=
 =?us-ascii?Q?sMlINnIKC2mnmB8zgxJ588MvCxO7FzNfE4R3BrkT3tUTd+H6ScmLvAOVUHD1?=
 =?us-ascii?Q?92w0vnR1Ns4sZDEqUHZMYy7+ypz6qGFNwux9dRmwhMENplASEz90Yx8cJPun?=
 =?us-ascii?Q?8jH2EZnjuUDlg/FhcttTWWxaakq5RlIeiHhu2OpV0zbJAnMZjMcHygdKiD/D?=
 =?us-ascii?Q?yuRqrAUTwqCnWt15jZnOHB6nWfkXTRd1svHVmqx5h/0hH+vi6hHxGLjOn38x?=
 =?us-ascii?Q?cSMVsgbHVOrzjnDJj7O/gfool7696YE1A6apKFK1Y5NOAi5dBntrRjnlWLyR?=
 =?us-ascii?Q?aCHQky5jMJHBIBCNUYmqXDSNjKFUyuRCOxJF0//vo1QAeYnnw8FR+kDBt606?=
 =?us-ascii?Q?zuhtSThVE3PbEOgqtpV51UNEjusAuT8tsMvLbcFcKZK/guI/y1afBwVFxqcn?=
 =?us-ascii?Q?lLrHfKF3bKVNTedRHDsoaG4K4G/y64Q9os0/Q7YUqdl2OZt5WrZX1hJnQeVl?=
 =?us-ascii?Q?I59/ZncLphEnxygssslQU7kNpxYJzeqR2amczD0NmRmdiNAbNwv/H35l+vGH?=
 =?us-ascii?Q?cvBGvlsSlDOAoda1bbhDu97UpIgpRLv3dO8zQQhGROEFe/Sq53l1GiwAsDq+?=
 =?us-ascii?Q?uMh/fFem6olbd7AL0So68er37vMBkycwomq1E89z68GYwwyedQpbh9k18STE?=
 =?us-ascii?Q?2c7zWWRvOeGuvoNCA7d+EDGQfZMMto9VGz/AC0jCkWtKi6xs5RdEuQJmyTqU?=
 =?us-ascii?Q?zNpDZbReXKUFj0OD1Zys7hn2doaFQLFJrew8C0MqkQhagA4hYpbpt7brLGG1?=
 =?us-ascii?Q?7BIUoGw7Ihv7yzdv4Nx9mq+QaU2slmY76+/5cS2H6GPZNT/c7C5XrPRCLjcp?=
 =?us-ascii?Q?rbA0Q4MJmJvbMkLKNLMaoV/63wdcI+LNfV9fgDOiTEqHxKHiiy9qTy6prqCm?=
 =?us-ascii?Q?GBdwpVu5mHnylTwl2qL51x4PkZtORbeRMQLwl+LXvg6h+2SWKO/ownd8DJjs?=
 =?us-ascii?Q?bUc6aZpMuNMfHQu/wrBPFObYqZgMJssQInfb/7+aoqdifLu+FihD4j+Jr5Qt?=
 =?us-ascii?Q?KZIg75ZiBaTd+WINKeR7d74TRQGaSfUPvZdn0N9uOzk9cElJsRoqwXBsiSZo?=
 =?us-ascii?Q?1KmRiqHJG2j3Pzop8AI58lEGArMWrxzl8RMi3LuatQ2fF+kh/1JShzyzlHPp?=
 =?us-ascii?Q?PIuMb1XQHzOZlwWQVxI1G5j+3MUof0puC7Z72U8wv64C7L/zEJ+7IxRPaZDQ?=
 =?us-ascii?Q?t0d4GGggkN4WW7QlO5zzukU4v1wp9yIRIiU+Zzv7giszQpfeKH0AzprRzRne?=
 =?us-ascii?Q?6yvTrwBRfqiUztihQlJ/7w7eSEpsTaidKUb+DowyOBiVYvEL/hNs+gitGpPn?=
 =?us-ascii?Q?c3zX1HFp2dyxNlsyFNWxH6JuaTQuiC2Rb/CxVfEryQSfGr9kjpgInClhC8Z+?=
 =?us-ascii?Q?iREh7wEYC0ATvxojAnY+DvayIDflRhn6xv0Ey47GQCDSC8v7+UDMbkCPyhUO?=
 =?us-ascii?Q?gbru/VYSMvqvlHk0jBbnNVtPSOAHagA7ngDy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:54:17.7509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe736c3-f081-4db0-6e7b-08dda0424128
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163

Since 622bdd962822 ("vpci/header: handle p2m range sets per BAR"), a
non-const pdev is no longer needed for error handling in
vpci_process_pending(). Const-ify pdev in vpci_process_pending(),
defer_map(), and struct vpci_vcpu.

Get rid of const-removal workaround in modify_bars().

Take the opportunity to remove an unused parameter in defer_map().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This is prerequisite for ("vpci: use separate rangeset for BAR
unmapping") in order to call defer_map() with a const pdev.
---
 xen/drivers/vpci/header.c | 16 ++++------------
 xen/include/xen/vpci.h    |  2 +-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1f48f2aac64e..e42c8efa2302 100644
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
@@ -450,11 +449,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
             if ( tmp == pdev )
             {
-                /*
-                 * Need to store the device so it's not constified and defer_map
-                 * can modify it in case of error.
-                 */
-                dev = tmp;
                 if ( !rom_only )
                     /*
                      * If memory decoding is toggled avoid checking against the
@@ -507,8 +501,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         d = dom_xen;
     }
 
-    ASSERT(dev);
-
     if ( system_state < SYS_STATE_active )
     {
         /*
@@ -523,7 +515,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         return apply_map(pdev->domain, pdev, cmd);
     }
 
-    defer_map(dev->domain, dev, cmd, rom_only);
+    defer_map(pdev, cmd, rom_only);
 
     return 0;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 475981cb8155..27eebdcef170 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -194,7 +194,7 @@ struct vpci {
 
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct pci_dev *pdev;
+    const struct pci_dev *pdev;
     uint16_t cmd;
     bool rom_only : 1;
 };
-- 
2.49.0


