Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA674AFEA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 13:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560456.876382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjkK-0007ep-Jv; Fri, 07 Jul 2023 11:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560456.876382; Fri, 07 Jul 2023 11:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHjkK-0007bN-Go; Fri, 07 Jul 2023 11:35:32 +0000
Received: by outflank-mailman (input) for mailman id 560456;
 Fri, 07 Jul 2023 11:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfgb=CZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qHjkI-0007b9-SP
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 11:35:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e816511-1cba-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 13:35:28 +0200 (CEST)
Received: from DM6PR02CA0147.namprd02.prod.outlook.com (2603:10b6:5:332::14)
 by DS0PR12MB9274.namprd12.prod.outlook.com (2603:10b6:8:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 11:35:24 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::50) by DM6PR02CA0147.outlook.office365.com
 (2603:10b6:5:332::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Fri, 7 Jul 2023 11:35:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 11:35:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 06:35:22 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jul 2023 06:35:21 -0500
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
X-Inumbo-ID: 5e816511-1cba-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxfzvCKG+Zx440jCHSSo0SbU6Xb615XwCPLyQvWDqLMIPGwpDQv2z7IV7TBfwcQHQebULrNSKtGaZuw5JEcTtUtpBMyfKeiYSIebhEiRNlGPYO9vU3MS0xhIiqwJ8CJE2ty7T2ZrSTB8DPLRUStqDHuv3LKOtTyt4e5CxJSirWEPmFmRPs42QF3HfIfX2o3RwaIFf6y4h2n5fDPIamJwFKinIpvD36PQfiIm0TlTqo5yRlLqoHoEzL4XXD28bVFMqAL0u5CJU5UikwWqESsjzMB0HffB4KtOIqTxP+6KmHUDKSPaRLk25mKys8l344l0zfkUoGRUANLgWLHgRvjupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+toFDaRSBfCS38slBFO2OskFD6oNPXp01PvW1Wj0lNU=;
 b=jkzUihk9dvtwyRgF2w4Ue9dMNT7C2tL93qGhokz8C5/Hi9n7EgR4fAehouir0msu23PFfawSCDD6MVHybBLqJyqPS0LOR/NStNBMBRdVCrRryQ7AHDM7WM0yKmXcmZi2cwP+BxdYDrjsDKELxIb8Pla5iZtzcPmwqS60gRC7TTV6Aymf6jjLVCZ5O8pvbpwvykV2QtTIu382fQ0Crg/ZJzLWoPKmMZrcgPZP/shFIkG1pOxxHttqDDJdXhycv/cGjRw42U5o/CBXmRdWq7kMX7CzOJpzc/h7unqMMYm2CcaLDjNdtWRidh9xoT6NcQTTSqJEGs9expDZpfK9Nhcq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+toFDaRSBfCS38slBFO2OskFD6oNPXp01PvW1Wj0lNU=;
 b=l2NCqxCSWV5o8je7BtiakAjR2QoYlEQWDdtn9cIGFbso7dC1qijaXBLwZ62T3BTqLh5ArdzqHzppLCV5/qfW0WYXDxJml+Np4Xy8OWoygQG3Sl/5Rx71UTluKZ5/2e/N4A3IbvFEBWiij1iJK1fEFVDsK+lzF2QX4gvMf604vjI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <wl@xen.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v1] xen/drivers: ns16550: Fix the return logic for pci_uart_config()
Date: Fri, 7 Jul 2023 12:35:18 +0100
Message-ID: <20230707113518.141489-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT062:EE_|DS0PR12MB9274:EE_
X-MS-Office365-Filtering-Correlation-Id: 2342386b-ed0e-4ff2-670c-08db7ede4064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Onc2pSqnChgPLpXOFQlV+smTkTCgjALAe61F7MqRkkU2HLCAh38nEfRZxeVZM5c/tLJn9NkuV9LWX1ZnIT7h7iqW/F9NFS1TpVJ9S30cPkx8/2efEo/DgAT3k9tsZwdSlmoWD4r5wbXogQ7F5t0fh+yA6IfmST+uKggjVMf/yyYBh47aomXBbKZ/dhw3QKbmEi9Tn7tRnXT7u79oiMrqCsEbKSRHLWnDOZnwhjcyk7Wvj0zY62qmwOOSpx6IS5N+Ux2LhZFRYkRu12n1w46tSfL2vorsuqeNdRhcBVulu350l3pSZKo48XCZ+owLjzgoOMJUH9C62Djo14qCj+CcsKuRFrW8oPnqLf35hiUG3E/lGSCZ+8VBoeTxP5LoYFiK0CtacETkawpVgIbpaNQEfRrf2PMxHrhp+bL35zjFbeoWsb0lrDI3rmC/bTBrn2lre76/FNuizkUHPssCYordxahY+O8cLYHZ7imilgqRb+sIM5B/4fpJ372lvdy76J67lDQEP9RiCI3ahDpfwumXfnVxijlvvtTXdp4sshbVtuJal2YhW2Thm9GQKADKaryUE63je8A2aZZBsuYI82+7C8le/Z4/jTtoHfvHMPx6qUZuJKJkyFppZwfU/mJ4CtOtQe/hr4Zs+xWzvckUK0yH+plbQNxNvNYXR6SmjIVZTfeBkjmLPA66Ne+4ASU+GpX3jvnv5TVJAXQgNIHA8RDTugXRKmbeBHbysSMJPJnj27lR5s00wMorlipirS6eKns
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(6666004)(478600001)(70586007)(54906003)(1076003)(26005)(186003)(966005)(70206006)(336012)(2906002)(82310400005)(41300700001)(316002)(6916009)(4326008)(5660300002)(8936002)(8676002)(81166007)(356005)(82740400003)(86362001)(36756003)(103116003)(47076005)(36860700001)(2616005)(83380400001)(426003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 11:35:23.0437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2342386b-ed0e-4ff2-670c-08db7ede4064
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9274

pci_uart_config() should return 0 when it probes the correct uart device and
sets the properties of "struct ns16550". Else, it should return -ENODEV.
Also before returning -ENODEV, it should restore the value of uart->io_base.

The callers should check if pci_uart_config() has returned 0 (for success) or
not.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
This was based on a discussion "[XEN v4 04/11] xen/drivers: ns16550: Use paddr_t for io_base/io_size"

https://patchew.org/Xen/20230321140357.24094-1-ayan.kumar.halder@amd.com/20230321140357.24094-5-ayan.kumar.halder@amd.com/

 xen/drivers/char/ns16550.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 212a9c49ae..5a35498a06 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1342,13 +1342,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
         }
     }
 
-    if ( !skip_amt )
-        return -1;
-
-    /* No AMT found, fallback to the defaults. */
     uart->io_base = orig_base;
 
-    return 0;
+    return -ENODEV;
 }
 
 static void enable_exar_enhanced_bits(const struct ns16550 *uart)
@@ -1527,13 +1523,13 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
         if ( strncmp(conf, "pci", 3) == 0 )
         {
-            if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
+            if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
                 return true;
             conf += 3;
         }
         else if ( strncmp(conf, "amt", 3) == 0 )
         {
-            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
+            if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
                 return true;
             conf += 3;
         }
@@ -1642,13 +1638,17 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
         case device:
             if ( strncmp(param_value, "pci", 3) == 0 )
             {
-                pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com);
-                dev_set = true;
+                if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
+                    dev_set = true;
+                else
+                    return false;
             }
             else if ( strncmp(param_value, "amt", 3) == 0 )
             {
-                pci_uart_config(uart, 0, uart - ns16550_com);
-                dev_set = true;
+                if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
+                    dev_set = true;
+                else
+                    return false;
             }
             break;
 
-- 
2.25.1


