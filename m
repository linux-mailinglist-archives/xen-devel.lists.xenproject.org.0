Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177878F7C9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594220.927518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGY-0004ek-Fe; Fri, 01 Sep 2023 05:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594220.927518; Fri, 01 Sep 2023 05:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGY-0004dA-9S; Fri, 01 Sep 2023 05:00:18 +0000
Received: by outflank-mailman (input) for mailman id 594220;
 Fri, 01 Sep 2023 05:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwGW-0001Hn-D0
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:16 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fda6b53-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:14 +0200 (CEST)
Received: from CYZPR12CA0019.namprd12.prod.outlook.com (2603:10b6:930:8b::27)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 05:00:11 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8b:cafe::46) by CYZPR12CA0019.outlook.office365.com
 (2603:10b6:930:8b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:08 -0500
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
X-Inumbo-ID: 6fda6b53-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzlIMWOg0FP4cgVpARgUZWqyRITroDg2UPYnZiyhYfcZhMpAg5Mg199WN4FmtGA4zMBBsrGvZwGxKQR/BwKtbv1vBvK7nU8CAEwamqbqpeBrC8KMsBxzBuQUfnCx9fuaLByBe/mLZ4SSIJuFToXWStvju0vyOxFIFz9W17eKVxvohxN6GD2gN58xMgwis3IFbh4YAOzv0XU3BMxLpSVpapC1lQok5xGuo+ch+WTWl9jbJjFvhysd7uh7MsYL5ciZGf0gr1X3aDQplE4tU2g1meXp3BLBV5FvuPGonE49YEGp8r/6dZMmdGhyjNoL7wLqiNE94FXgEAu6iV6HE8gSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zd6P0fZ6k3o3WMUNghQi6mMI+CPAIsveeO98Isieabc=;
 b=UvAL820KC35RbZejaLdh6STcCwpMlr5QaAes+9ak/Inf6gCioWpR6zBHHDz9faPp85bmYpWM/AFB835fK7v7fwjyPE/RDYiZ3RZxelj2/940TSc2z2wXOwgcyVB74clXg48V/fjpDY2RBvAcjVAdbdoht1tsgxdx1GmjA84CY18M/rfn6ELLeYmqpEvM8hfZz7eQqhMBxdc+W9bWJwgJk40Rsj0nz84o68Ja9HEGl86/L5Ip6zkauxl/Z/5h5kvT4cqwEDH1GmBvIVMpJFllAW1MUzITY/Il9M3y2MNy4ld6n3/k5VXal4lEznfTajHUMIcrc53kH+Z69uij2d/Ejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd6P0fZ6k3o3WMUNghQi6mMI+CPAIsveeO98Isieabc=;
 b=2UmqsIQlpyIvfucEbQ6vvCKIuPuLY63DVdZ7PD8GVTWIHIJJn7Xlih6BG4xyAwIo2Si0QwIC3L3lLJ00UqRQKl6aB/lYRr4cQMYbc6GAh9MbvdMR3tWCHXwVTpBNaCEztnTAP3bGHmWndQbJuttP1tet08pQplb7/x9OF12eUis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/5] xen/pci: update PCI_STATUS_* constants
Date: Fri, 1 Sep 2023 00:57:30 -0400
Message-ID: <20230901045742.235975-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901045742.235975-1-stewart.hildebrand@amd.com>
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 8671c735-8bbf-46ae-0024-08dbaaa851c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5tf0om0kWnVBHXxoscfu1/afuAUO7NgASO06LKNuf6UTwA7OMk3nAH+20dz2EW0ahk5sqS+wHblXGD45hRjx1JBe/9kjOSzemLFPG+G9zYoCxHnB9/vjWg2sM+0QsjSRbwpXuAGrVGYFaQvwosjAqNR5naBO3OsqZyWsPtyFQ9mMZAfwKfDMfPcTUR9xWDMN/mR0BMMAauSeepzY15YBP9UfCgGFsoRBMGA0uEXCNaiMQxo/YVF0/GELu0VPJJ1n1wFCpMMh09x059/JpuP8IG17cMhhB6MVwiVtL3GgKjoYu2EmVG6ReyY4ejE6Q6r7Sr+t4mAEh44DTGDe/ysDqfENFjf5dxPLITfkhCM+Dafz1pjmMfIf+JybDlVeiTxDSWw5D+CN7VLXLOPrRUYlEorELa6aNbhL1PGEfSqwtl5syrsJEi8cTvWMYz3+wdK53i3rLdUiUTGtKD8ryk9mz890GltyuOWyVD2Ox6nHhDhZ4z5pszgaG0+MSOeXOY9/NNEiYrPOuaU3ybRWeXcQv4ntBpch0cGaSPQSnulagBO7OPBtKXEkZQ+395jKmjbpgdQYcOOXVNd3KErwRd8h4ttnApVktlRzFW0FmXCQyX44J8IgNiRFwiFpolNOYdoGeRDp4R3W6EDn7psglAnRwU1HuUc1DJv9Y6Vn+6HM6jMJ6xbptjb/eWQrXrQA4vQvs1vYVcmqKVjSwHJDo+xFIc2hal1ZQxIl0mfpltlwd8f7g2LDaiZE/vCyLOGx4h8prhN/XkIl5D1/PgJ/SJYz0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(82310400011)(451199024)(186009)(1800799009)(36840700001)(46966006)(40470700004)(6666004)(36860700001)(82740400003)(356005)(40480700001)(81166007)(478600001)(47076005)(54906003)(316002)(41300700001)(70206006)(70586007)(86362001)(40460700003)(2906002)(5660300002)(426003)(6916009)(36756003)(4744005)(336012)(2616005)(1076003)(44832011)(26005)(8676002)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:10.5121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8671c735-8bbf-46ae-0024-08dbaaa851c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344

Interrupt status introduced in PCI 2.3
Immediate readiness introduced in PCIe 4.0

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* new patch
---
 xen/include/xen/pci_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index a90aff1712ba..84b18736a85d 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -50,6 +50,8 @@
 #define  PCI_COMMAND_INTX_DISABLE 0x400 /* INTx Emulation Disable */
 
 #define PCI_STATUS		0x06	/* 16 bits */
+#define  PCI_STATUS_IMM_READY	0x01	/* Immediate Readiness */
+#define  PCI_STATUS_INTERRUPT	0x08	/* Interrupt status */
 #define  PCI_STATUS_CAP_LIST	0x10	/* Support Capability List */
 #define  PCI_STATUS_66MHZ	0x20	/* Support 66 Mhz PCI 2.1 bus */
 #define  PCI_STATUS_UDF		0x40	/* Support User Definable Features [obsolete] */
-- 
2.42.0


