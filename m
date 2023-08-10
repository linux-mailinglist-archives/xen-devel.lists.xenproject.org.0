Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3777811B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 21:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582180.911815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6y-0004y7-Qy; Thu, 10 Aug 2023 19:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582180.911815; Thu, 10 Aug 2023 19:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6y-0004ux-Nn; Thu, 10 Aug 2023 19:14:20 +0000
Received: by outflank-mailman (input) for mailman id 582180;
 Thu, 10 Aug 2023 19:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFdC=D3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qUB6x-0004qN-5X
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 19:14:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1987dcad-37b2-11ee-b284-6b7b168915f2;
 Thu, 10 Aug 2023 21:14:17 +0200 (CEST)
Received: from CH0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:610:e4::34)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 19:14:10 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:610:e4:cafe::79) by CH0PR03CA0209.outlook.office365.com
 (2603:10b6:610:e4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 19:14:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 19:14:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:14:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 14:14:08 -0500
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
X-Inumbo-ID: 1987dcad-37b2-11ee-b284-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuvnqIb/Lo+1HHUQsz+GLNW7b3fYKuThTtzLoi6MSmleFvcriK5cc769dD2rY+Q563RvdXO6tjpeU1A7pdwWnzCiSNtGxJnSqGO0I5lMJpA3JV/0lNYxIVQ2yFZ147s8wb/t4rhFs9SdoaYG64+ddPoUZeTb71IuAZtLzpTtkroWGXi31ygJkB3YqP3YJaIpF2XJ/G8YqrDk2yZdrtsrIJlq0S3piPu+mO6NxyDf/J70tAu5lrxxVM8nQy8jkZ5TUbMxMjE/NlLlcaygtTZSkxCnocoQ+tCgS2Nx5fFCLF5hneINw49KPReBus1k4UL0b9avK2GX86+CcST2b0TCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lytXEfn42x+yZhPe84LRwE9cDWxa0qd6RBGQUU59Ly0=;
 b=g4dRTSGvgsMDqTRw0FGBQGlxzce8Gje880i5DUj/oLLOH64+LurECP3u6ebezPzuKcHur5jeRYV7+HF7qrtqa6fB4dyzO2Iiz+W2U8l5C14iQN1bBP57rqrWBbqTWShoGtuUJ40eCWT02xUFrIiTQZKcxSREDuuR7FzqhjGaa/P0yMwvX5xA0rwJcJGGSTG8PRYB4cIl82d3YmVC3/PvbK0Tr5mKludxyTjUVxpT+HTuF5nb7QfmXzghxqq9/NTCGvPD2dejm22AHynmPPeUVdKHG1A7q+8nYLIg9cnHpJvgwKUGRHooTH4jJsd0mH05/3N5LZqOUGelgWCHcF7aVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lytXEfn42x+yZhPe84LRwE9cDWxa0qd6RBGQUU59Ly0=;
 b=zCkQI4fKYKW9VVsFhh/GW4nMeSgOjMrP28lZArTepRyxoYYT4vE0rWunevw8vwlLesMuLdY7PmdADbNAUd6viT9PAwyMk3fbDTjDX1vo05wTaIWOYZvzkqNFhzCXynwKScvuvvWXAys3Y08zxbP8cbTfU8o1/Oco2l9XuaRkueM=
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
Subject: [PATCH v1 3/3] xen/vpci: header: filter PCI capabilities
Date: Thu, 10 Aug 2023 15:12:59 -0400
Message-ID: <20230810191312.644235-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810191312.644235-1-stewart.hildebrand@amd.com>
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e943005-87f0-423d-d03a-08db99d5f9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EwROm0Lbzsr56+VaUvR7rQPESxbMiOqRULxVl7GoRBE2pD61dGhhYSAeUNKWjN7WH7qDndzcU0Sm/RakmAYVW4ox3rndqLs39STuYsxwT4BpIAkaHPqNaVY8wjEgS7RK/vWzEBBuETb/HZAVMayeE/M0VsnC/GX7+j/xXf0m6BxkGHWb+iLgOzdBDx2uFSzBevvA6PbMuBDteOkrzecANCs4z7eOdWgvtjSfPcHFds9yRK59oRjga8EowIwlWU/Gz+HU/IEtwAitjuWLXaTuh4t1vsrZndSQeYRRKXmqSE9LmHOgMQkZ8on/b6xLX5kHEiIvgIAdRm0ic6FCvDHlOz2005D0Lyx/exP0qnlSQI7LhBUPYlkAwuWpLAvmSK/C/TjbqlsXgYpLK0/JgO6/oA18C3rbzJtkZfE+NG9n1bcnP8jwnWUODJfvqwplaCd2cBXaJHFBvAppW/9XsU2Y/ACD4q8r5pyRlaOcAOSWGxvfuiih/141XXsTvUemFM/ZLpaFpcOHM+yoXWLPKF89wJ5INJtyfJ5IVhYPplMdvPrkiUAa+YERi/wces660K4GYNy9VB5Pd0aL6KR6GBtt0biqiTQLtm6HFQ1ZlQnRJzpwMBireaV+SZbj6DObeDguBSG9RZisHy2iMbbgmzUW9PyLdS+qf/FqFsIfvee+TSqh3j2l34gmDTM17Gy16jYpClLsxHfswcvmxShyvX1ud0H2Kf+dxv/zR5e0lLZvCmOesSbb7X3XvJSVv1AFluHpovcmwfajrMMTX/33XJQXow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(1800799006)(451199021)(82310400008)(186006)(36840700001)(40470700004)(46966006)(8676002)(8936002)(1076003)(26005)(41300700001)(40460700003)(36860700001)(36756003)(47076005)(426003)(2906002)(356005)(2616005)(81166007)(86362001)(82740400003)(44832011)(336012)(6916009)(70206006)(70586007)(4326008)(54906003)(478600001)(5660300002)(40480700001)(6666004)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 19:14:09.9684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e943005-87f0-423d-d03a-08db99d5f9cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

Xen vPCI only supports virtualizing the MSI and MSI-X capabilities, so all other
PCI capabilities should be hidden from a domU for now. We parse the physical PCI
capabilities linked list and add vPCI register handlers for the next elements,
inserting our own next value, thus presenting a modified linked list to the
domU.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---

If there are no capabilities to be exposed to the guest, a future status
register handler likely would want to mask the PCI_STATUS_CAP_LIST bit. I'm
thinking we could track this in struct vpci_header as follows:

vpci.h:
     struct vpci_header {
         ...
+        bool mask_cap_list : 1;
     } header;

header.c:init_bars():
         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                PCI_CAPABILITY_LIST, 1,
                                (void *)(uintptr_t)next);
         if ( rc )
             return rc;

+        if ( !next )
+            header->mask_cap_list = true;
+
         for ( ttl = 48; ttl > 0; ttl-- )
         {
             uint8_t pos;
---
 xen/drivers/vpci/header.c | 78 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 60f7049e3498..cb1304fa1eed 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -513,6 +513,36 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static uint8_t vpci_find_next_cap(pci_sbdf_t sbdf, uint8_t pos)
+{
+    uint8_t id;
+    int ttl;
+
+    if ( pos < 0x40 )
+        pos = pci_conf_read8(sbdf, PCI_CAPABILITY_LIST);
+    else
+        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
+
+    for ( ttl = 48; ttl > 0; ttl-- )
+    {
+        if ( pos < 0x40 )
+            break;
+
+        pos &= ~3;
+        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
+
+        if ( id == 0xff )
+            break;
+
+        if ( id == PCI_CAP_ID_MSI ||
+             id == PCI_CAP_ID_MSIX )
+            return pos;
+
+        pos = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_NEXT);
+    }
+    return 0;
+}
+
 static int cf_check init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -544,6 +574,54 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( (pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST)
+             == 0 )
+        {
+            /* RAZ/WI */
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1, NULL);
+            if ( rc )
+                return rc;
+        }
+        else
+        {
+            /* Only expose capabilities to the guest that vPCI can handle. */
+            uint8_t next, ttl;
+
+            next = vpci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST);
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                   PCI_CAPABILITY_LIST, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            for ( ttl = 48; ttl > 0; ttl-- )
+            {
+                uint8_t pos;
+
+                if ( !next )
+                    break;
+
+                pos = next;
+                next = vpci_find_next_cap(pdev->sbdf, pos);
+
+                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
+                                       pos + PCI_CAP_LIST_ID, 1, NULL);
+                if ( rc )
+                    return rc;
+
+                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                       pos + PCI_CAP_LIST_NEXT, 1,
+                                       (void *)(uintptr_t)next);
+                if ( rc )
+                    return rc;
+            }
+        }
+    }
+
     if ( pdev->ignore_bars )
         return 0;
 
-- 
2.41.0


