Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECD80CF07
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652286.1018055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChqh-000247-7l; Mon, 11 Dec 2023 15:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652286.1018055; Mon, 11 Dec 2023 15:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChqh-00020l-3v; Mon, 11 Dec 2023 15:05:35 +0000
Received: by outflank-mailman (input) for mailman id 652286;
 Mon, 11 Dec 2023 15:05:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zcs4=HW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rChqf-00020c-MP
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:05:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9e2f5c4-9836-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 16:05:31 +0100 (CET)
Received: from CH5PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:1f1::17)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 15:05:28 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:610:1f1:cafe::3e) by CH5PR03CA0024.outlook.office365.com
 (2603:10b6:610:1f1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 15:05:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 15:05:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 09:05:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 09:05:27 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 11 Dec 2023 09:05:26 -0600
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
X-Inumbo-ID: b9e2f5c4-9836-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7eWvePlw1rD8vIPVYLqLRe7BXjhitnWH4S+rJsSB6t06m47K+YT5YWMLYV+xr6/bd8j7v9FdOpzH7lOej4md/Ljx+J53Jx7aFi9O+UAxROGtZSWDj0EkRmQAA85J2802XXALiMoiUTdx3tVnXuSRUsvRIq/qQsntwfHl0AFNKgb3S5KPdzJ86lOcGU7TEVj5x+shPaorWCn8JrQpj3eNqNajWiW6cUFFEMfpV0dkbaYOglashJVv1QJrI6FwnER+hC9ETLGnOq7E7coMPGE7Mu1OZ0UYRp7RAB6q6NEgjs7NuZv/Ntd+lTEzLRCedKXEq61MgI8sz5efo43iIap7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6ZvA4TdDKNhBzcSXy8oJC5F2iCDXLgeBpL0NTM19/4=;
 b=US5hjk7U7PIDFPTuIuz61pPAgpK1IuYqNO1sb6+Ale5VcvSGx15Q87rjYNZHSS613i8WKzDdSHJVl6Q9KZRC8Ew6KJ67KkKbrkeSLpb7Mcz/TvroD7Q9Qk0/zvUY9LyV29FVZcbpH2qPpU1tulQY31WncHY85zvRqVSwCGXh4uXeGl7I5ejaYG/J+EdXYramZaZr9330xS6n2hkpOzvSyUNpidPhdFqzi5+1oi6wW7GFgrjUWn43repLnDUemNUqtxnAsMFoQAmmkslDGQGG3y1Jgrciv6AvXyvLNKKxBTvw/vMDsTnDvRmr8IjSdNt1/QpAbR+0je8DFUGBEzesPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6ZvA4TdDKNhBzcSXy8oJC5F2iCDXLgeBpL0NTM19/4=;
 b=LH92RD8EkzkZ6Vfs4igiTftz7Mgu2o4FFk987gVDFV7fSNI+LaH9FhP6G6fVltVquLe6fODHxa33dmQzzEnaHGOdjglNS1HLRzsI8J2Sh5MrXy1HGYdnXfxYMsF7MQ1IvPWFof1VtTr64bPJOYtlVg8JanPlva+pmY2pyurs1D4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/pci: fix phantom error path in assign_device()
Date: Mon, 11 Dec 2023 10:05:18 -0500
Message-ID: <20231211150520.299768-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|MN2PR12MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d82003f-8e64-4d34-4df1-08dbfa5a9c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f/JetDioWxfep3qqK9HfoYaCSvk0GPcaAa3Wo966EExuvN1+e/FPGk2m+YPuQ0++LMOnif7Wa/dpn5pTaeW7bBLQBege4/15g5Uwhidq8tSH/jJr98P2e6n/7MmPWP6hj9J4t7RxBe/C1RJtn2RWGGH38kL98rOdGWedGcvI8+TNHkaOLDDYljr5vTENHCWh64gepCwzDVNPSGlriiONPP9Pbud/hJuJGGycrsOKukZ9gHmGor5rWR7d2QdSdWc9dXqeqo13QJnvpkNUDFdI0dgbmF3+BcdsP+yyuHKQNOvEOup8/jWy/C/Jw8p3J/r8tU3WGzQ7oydROfjCwjfIhEbPrB7AbN5IxKOsCjdR+8CWaYDW3iznTWKAu5BZHcTOaq3ZQw5bUHYzieUthff7osSYoKge3jtUIfjDuOUh0tM1SGMKsxl49c1WDFRdrTzTksALkfGMkPwvh3xKaKTR9vJYBcU7dL0BHXbAr8AU58hJmbNKbMMCphjc98QvwG/ASO2TBS7Jph/0/sPKYpkiWX7lYZo4K2r2QbQySFqdLiQ8dXrahCQEAnMZ4RayWkQq2h84ZiRAn0CJhY9f9uFdRBeGGuzvDI8oEWdbqYDOfjxvv1NETKsys7KzrBPB4PQVXh86OoBDj8Gzfim2kLWGLyN1L1Zh3nE45817EvOqvekzRc3MOoFiAAigrNqr0QwycdIbfQslzfUBeCwGNDFcK20Q0PJ0/SY6pNw67RGOK2UOGlKP6mizlEMdbQA98bUIN/9XRa7zHT5+q4efHuVrruJrxGm5V0O4U1xp+xUvHco0ytZQydoFffVYO0zroTs7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(41300700001)(5660300002)(2906002)(2616005)(1076003)(6666004)(36756003)(478600001)(47076005)(81166007)(82740400003)(356005)(426003)(83380400001)(336012)(40480700001)(26005)(8936002)(86362001)(8676002)(4326008)(6916009)(70206006)(54906003)(40460700003)(36860700001)(316002)(70586007)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 15:05:27.7237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d82003f-8e64-4d34-4df1-08dbfa5a9c36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549

Currently if an iommu_call() for a phantom function fails, there is no
indication of the failure. Propagate (but don't return) the error code
from the most recently failed iommu_call() and emit a warning. While
here, add a comment to clarify that the loop keeps iterating even when
failure is encountered.

Fixes: cd7dedad8209 ("passthrough: simplify locking and logging")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Unlike assign_device(), deassign_device() breaks out of the phantom loop
when a failure is encountered and returns the error code. I'm curious
why assign_device() and deassign_device() behave differently? It looks
like it's been that way since
4e9950dc1bd2 ("IOMMU: add phantom function support"). I was initially
inclined to break out of the loop and return the error code in
assign_device(), but adhering to the principle of Chesterton's fence,
I'd first like to understand why this is not currently being done.

I'm aware that I could have avoided introducing a tmp local variable by
using the conditional operator with omitted middle operand:

    rc_nonfatal = iommu_call(...) ?: rc_nonfatal;

However, I explicitly chose not to do this to avoid relying on a GNU
extension in yet another place.
---
 xen/drivers/passthrough/pci.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 28ed8ea8172a..71072efceb7a 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1407,7 +1407,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     struct pci_dev *pdev;
-    int rc = 0;
+    int rc = 0, rc_nonfatal = 0;
 
     if ( !is_iommu_enabled(d) )
         return 0;
@@ -1443,21 +1443,28 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                           pci_to_dev(pdev), flag)) )
         goto done;
 
-    for ( ; pdev->phantom_stride; rc = 0 )
+    while ( pdev->phantom_stride )
     {
+        int tmp;
+
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
+        {
+            devfn -= pdev->phantom_stride; /* Adjust for printing */
             break;
+        }
-        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
-                        pci_to_dev(pdev), flag);
+        tmp = iommu_call(hd->platform_ops, assign_device, d, devfn,
+                         pci_to_dev(pdev), flag);
+        rc_nonfatal = tmp ? tmp : rc_nonfatal;
+        /* Keep iterating even if the iommu call failed. */
     }
 
  done:
-    if ( rc )
+    if ( rc || rc_nonfatal )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
-               d, &PCI_SBDF(seg, bus, devfn), rc);
+               d, &PCI_SBDF(seg, bus, devfn), rc ? rc : rc_nonfatal);
     /* The device is assigned to dom_io so mark it as quarantined */
-    else if ( d == dom_io )
+    if ( !rc && d == dom_io )
         pdev->quarantine = true;
 
     return rc;

base-commit: 1403131596fa77663708f6baa0fee8bf7b95eb5a
-- 
2.43.0


