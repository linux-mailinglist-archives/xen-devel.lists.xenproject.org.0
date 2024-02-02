Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10DA847B95
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675216.1050513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1BY-0005rO-4Z; Fri, 02 Feb 2024 21:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675216.1050513; Fri, 02 Feb 2024 21:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1BY-0005pC-1G; Fri, 02 Feb 2024 21:34:56 +0000
Received: by outflank-mailman (input) for mailman id 675216;
 Fri, 02 Feb 2024 21:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1BW-0004Ae-4G
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:34:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e56c383d-c212-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 22:34:52 +0100 (CET)
Received: from BY3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:254::16)
 by IA1PR12MB8538.namprd12.prod.outlook.com (2603:10b6:208:455::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 21:34:46 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::d9) by BY3PR05CA0011.outlook.office365.com
 (2603:10b6:a03:254::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Fri, 2 Feb 2024 21:34:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 2 Feb 2024 21:34:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:34:44 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:34:38 -0600
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
X-Inumbo-ID: e56c383d-c212-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYxAPDVpiu3L0g27UXvfFoylhEbrW5YA12f7RZDgiUpmXE++LL+vqScpw9813n1J9x6u0Zpc416QwxFxlDgAki9LfurMdQojXtC/2VOFkOY7mbAFqMkIGd5Zv8GHDT2gZfAlDwl610GnH2Ue7WLwOSdB+yIlmXCXbvSfIKUxFCRWuWq2MhudgnH2FLA/7gNJhmyuwTSdLKqZ7rShKCszihaHEcbvxxpWt+cEYliV3k5/KJo0mbcK02zj6GjUDPZH45lNGU98EFW4SjOeiu0uHLEGkVjYvwMX06QFZdyDNLXw2IuZ76x4TQzdXlfYw7c1lo/G+6BgLpfwgk2dhuq8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyiyI3xsKrX/cnHhNKfE69AhVBubvl5XKQMwzn7dWtQ=;
 b=OAB+PaOIGfo6v7aGYnYFcZIxCz93zKegteOCTUKtvEQdO9SkU7qIKXg5SJvMvGBXGdoEwc7KBWFX+djcSu1XeXQa4QocQMIjtCOwLWMGFyFhgS0WYGtr5RtDcuHmi/Knw3pntAQnCSQ7SvZoM2NXKRAVKJs7AnuBaEiDXBRz/I3KlBdqian6ms2TE6yBpv/qZBrlc6MEpYtoLDgMfP7lC9xmVu51qeB8odIV70z7auwYxWaP5DUdqAOPYS8u9XqtmDUH32ZvBnytXN5ogcZf38aXYGWbX+UmIj+ZcLewRr9FJ7j3Cm73djceg3EiqzEH4CLdXMGqrx5DtCcdhWzBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyiyI3xsKrX/cnHhNKfE69AhVBubvl5XKQMwzn7dWtQ=;
 b=uDtqpQb/VaXETn246NN0JRJyTTvuJ5fAfdsCYKKPhSNniYLqH5GzUhFC4FwGGeTvDKv93FR7X3j4kdHbBxmO1tPX2Kj/qZY2Upg8D9PmKuZ81kIBDBHWBgWzLWnzjxkdVK5HjWg9dMTICsh6XjYTYV/ioOeluxu957pKIiATDrQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v13 04/14] vpci/header: rework exit path in init_header()
Date: Fri, 2 Feb 2024 16:33:08 -0500
Message-ID: <20240202213321.1920347-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|IA1PR12MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: a80af3f4-acae-4c13-479e-08dc2436c68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WSVPJi+gJuL0p7fuaFgh2pUAQxR1q+zSDOX14sKPtYT9STdwb1haXULoO0MxVrNvTmSl7XJX+VYKjhgHXmtyEjKJIWkNFO38IqR9unjkLgmceh0+o7nPyHvnZt4MMHkseOjj2eoABDYJurjF7HtFCBfFhOAdnL116KhIoYnwxjNzbcyzUnD85LJBZIVlryvyzLAl1K8JXF3ri7S1vCZSpWZZ01cgNLmdcFwUP41+YoCtz/donRhqlMV8rpmRBjImUkDPrr7M7T75D8fWeVNMdbMNb5AfvcYF9i+z9FxSundpSzxX3KsbXr0Kl8GjKVDwKCFbFJCLkRppBh13a4uGi2m79fg/6LXFwwsypAyslXCDGVcIO96a0uYMPTJ02+34WSLxHUQNp9vYTTLkGoSGz2jLAXTrM0PrtwYVsrzxswSvpoQyh0Jp3sslALJnDs2yEmaWJ0CBXLfDIcWjn14WYIoqHEKSHHrK/8IlZb7Lf3A9TpVgmHH5qYp2dne5KO+oNvoJgLrHCVU9g6avsr5/B/dsRHNHBxWazJ8ENEJ7C0ujJRe1YP6TzRpVsuY5XvkYB/7quK3LEmZulbkIMLVPY3UnhIbDHV8n3YLs5KDZoetsHXXFZ4lp5nXzbqUxHF6T47EuUvbmnmt/RQ7IcgrWNu/t2uzP2RZHllZxyrmgEucHnUBEe0pLA7ZfA8OOegxYwmWWKpwcgBFFrXwuLcPhT+vy6EZ65x+9iw9C/iux+fVe0jicGO8SAEl9RGSL0hyVVUCBF/d+rzNj1+9GMNbcgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(8676002)(426003)(336012)(2616005)(4326008)(1076003)(26005)(5660300002)(478600001)(41300700001)(6916009)(8936002)(36756003)(316002)(44832011)(86362001)(54906003)(70206006)(70586007)(6666004)(2906002)(82740400003)(81166007)(47076005)(36860700001)(356005)(83380400001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:34:45.6368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80af3f4-acae-4c13-479e-08dc2436c68b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8538

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


