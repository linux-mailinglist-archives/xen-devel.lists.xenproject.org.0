Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEF828F40
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665022.1035214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1n-0000pg-D5; Tue, 09 Jan 2024 21:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665022.1035214; Tue, 09 Jan 2024 21:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK1n-0000nC-9S; Tue, 09 Jan 2024 21:52:55 +0000
Received: by outflank-mailman (input) for mailman id 665022;
 Tue, 09 Jan 2024 21:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK1l-0007gG-Q1
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:52:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ef8d12a-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:52:51 +0100 (CET)
Received: from BYAPR07CA0040.namprd07.prod.outlook.com (2603:10b6:a03:60::17)
 by CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:52:48 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::35) by BYAPR07CA0040.outlook.office365.com
 (2603:10b6:a03:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 21:52:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:52:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:52:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 9 Jan
 2024 13:52:47 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:52:41 -0600
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
X-Inumbo-ID: 6ef8d12a-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+5HlEFy3MHOeNhPCqMISwTSFG+joYrrsH3bAScNRWY2tK7knWBpdY85nUn5RKi/IxdYcIlE+uvcsRdoj0F3pFGYL30obtjwFlCFyI3zT5lgaUuFO7w9h3JNYcn1pNRclIP76BFMgQ/6jCIXqxecVpvniLC5iT6JYty5NQ2daI/cXllcDsm6CYgU2CUjg3HiYGUrWF/rHl0Zu4e7l67w7ZXdFApB0brBIz5Oq5ZkE/fnfnJLSngxgFE4pP6vqPItRX8ET9ZpMIHEaYphpBwVCKOy4niTJtINxm3sV2eVItyyXrKsZa9lY3RyWOhcuOpq8xyMYQFweid+3FNGyC0QpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyiyI3xsKrX/cnHhNKfE69AhVBubvl5XKQMwzn7dWtQ=;
 b=oDqZs4HAfGnLUBIiU8+mlX3jy8LMVYynhTEqpfbNoJbfftZk0AIZLa2ypplgqxmBFXCzKbyedbjBfKy2xedPA28A4JxHn+DHDQZmbB+zj2IcONFZaxHKUp08difWJILrV1oa9aEGP1/e8i+HHdqKbUfVA4v313kTt/7oWW5FnERIi5Oz78tTFPiNlI9rN4eN/BhF7QbatOYnIf9r8D60OFcr9SO02D9XGKzEeTajr+7AbBm+LegfcvYUaOsO+Esurl7s6/8HQs+WJn60kXq1WpKX/DO3vvK6ZsRyMm9RlCtu1DXxXcNFxYKvm7UDLl2bWaWBRMv07ByZrUvyB2GFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyiyI3xsKrX/cnHhNKfE69AhVBubvl5XKQMwzn7dWtQ=;
 b=u25+q2Rm6peMsIxRMQfyGhyvoinGKCFhRHvZsGRVcZkwhp0d2A4t5zx4+j8vBGBTUqsirq/OvH67ANWHR80sGT+JphmEKxLYpweVqIJr69VYluA0kJ8QR4Nv2T4+bpSIRyF+EWXd47ZCsBkJvUkiYgG1YiTBUlb/LBrC3BjMecQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 04/15] vpci/header: rework exit path in init_header()
Date: Tue, 9 Jan 2024 16:51:19 -0500
Message-ID: <20240109215145.430207-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dade6b8-1008-45d0-2504-08dc115d5214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VilKMBb0cRVOBScucQf2T6cJBYRyCR89ZC7Dhbn3mZK9wbyiVcfTZyX5whMr5aGUyrKUoVMYYEScDwUKgLv57Ivnw0U8HpOfdCAMEr+weooOF9IVxRlVISaWT7bnF+nPsgnry2DdLSlH5bRQtVuJ7PDEmLgjpQLoSlbC/gMqC+4jNyQCHDfI7wBGeA6Zep+8TllYkRiRl2ktsSze0N8SPElq3sBdiMWjqHzLiUEH1d6NaXicVxrb5J0GoFKOnyys0rf5MuAoW+Uf4YLQfsEFHaSIp7Vev4F1Hvvbrmu+T0rj3PWwM2MLbv+Qzq4FM5fWHnIhOyW464gQrvGPKoIUnEZjghJH5zZaJ+W6TpKRcDGtCgR5O9vwwBQSphAv4nyOwVOzz2G5tCKUNi80he49IP/qNaqEoRZmpc7aMIDFpwUiPv0aQGryVEY3agsJ2FFe7XjtpV1ylFqmdyx0aYpO0WLRejNW4/dSETAAzA11NMIWNm86tnbj1YVpqagOAI6v7Q6LmdUsYxJ1hm+Z4mGkJWipswtcKsU0J13BPpdRTkdPFC3atNJeenWQYOthTXWj5mzhDvvkEjrsekibmAKfkgO3cA570cS/yToOXauG8e6irlvnMvYBvxhqM0stHikPbU7xHmNCyYD48vPw6zF7PiaIBD0tNwEI+kZl52BpJj9jc+i5I+Y/m9SnuNAuK/0c+tE00QikhBVIT/88AnTuZusl0Hta6sp5GCOoyt/j2rfa1NR0EsQ2loISKIYnCPI9vjzTvDHI5QFVHq+8zIx7Ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(2906002)(478600001)(36860700001)(5660300002)(6666004)(81166007)(4326008)(44832011)(356005)(41300700001)(8936002)(316002)(70206006)(70586007)(54906003)(36756003)(6916009)(8676002)(2616005)(86362001)(426003)(26005)(336012)(1076003)(83380400001)(47076005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:52:48.5200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dade6b8-1008-45d0-2504-08dc115d5214
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Introduce "fail" label in init_header() function to have the centralized
error return path. This is the pre-requirement for the future changes
in this function.

This patch does not introduce functional changes.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v12:
- s/init_bars/init_header/
- Re-order tags
- Fixup scissors line
In v11:
- Do not remove empty line between "goto fail;" and "continue;"
In v10:
- Added Roger's A-b tag.
In v9:
- New in v9
---
 xen/drivers/vpci/header.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 2f2d98ada012..803fe4bb99a6 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -656,10 +656,7 @@ static int cf_check init_header(struct pci_dev *pdev)
             rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
                                    4, &bars[i]);
             if ( rc )
-            {
-                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-                return rc;
-            }
+                goto fail;
 
             continue;
         }
@@ -679,10 +676,7 @@ static int cf_check init_header(struct pci_dev *pdev)
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
 
         if ( size == 0 )
         {
@@ -697,10 +691,7 @@ static int cf_check init_header(struct pci_dev *pdev)
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
                                &bars[i]);
         if ( rc )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
     }
 
     /* Check expansion ROM. */
@@ -722,6 +713,10 @@ static int cf_check init_header(struct pci_dev *pdev)
     }
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+
+ fail:
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    return rc;
 }
 REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
 
-- 
2.43.0


