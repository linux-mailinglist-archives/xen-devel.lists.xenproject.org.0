Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7977E90D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 20:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584856.915729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLcY-0005fY-Fc; Wed, 16 Aug 2023 18:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584856.915729; Wed, 16 Aug 2023 18:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLcY-0005d8-CR; Wed, 16 Aug 2023 18:51:54 +0000
Received: by outflank-mailman (input) for mailman id 584856;
 Wed, 16 Aug 2023 18:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5U+O=EB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qWLcW-000576-Se
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 18:51:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f60ba681-3c65-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 20:51:52 +0200 (CEST)
Received: from CY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:930:17::27)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 18:51:48 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::4d) by CY5PR17CA0028.outlook.office365.com
 (2603:10b6:930:17::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Wed, 16 Aug 2023 18:51:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 16 Aug 2023 18:51:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 13:51:46 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 13:51:46 -0500
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
X-Inumbo-ID: f60ba681-3c65-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1KD1Rh8713mgbnz4N82Vy8UJcoxYbs8j1RICDsd1f/0XDq7jFwGiPbDmDzgbVsq8hPxSdHYevnMUItU6cQgg9UMEWFv0n22zYeI1r3cRtkEYcCx3INvciKxoQkugbTDwprTJgGD5fHeRHF2FoB69sYV9kbidTC3Gqcc8DofDJ4j0UfjKHtWnwP0fFGymHJhqqfhfbdAuvMp4qz9cem32ktsq6xkm5zSUJ7E4Nalakx+Ppu5dCfuPIDz1HvwBV4EzYzx0zh+1O06mqLJlOyaQIqTXsXsrECicH58bUZwgQrYvru9sfMq/OxekfRcRbltyquojogNcdwH/ESxximrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUV5SZfYUs2RFem9ruC9kFS6lhh6QPi95iyU+XcQnCM=;
 b=f6Y2xpPz1Rmw6zWR1ISFz0phDQx+SBeuwiE8mpdhZY6btInjYzYRyaI+hZ1eSwcyyxdrv6gi8wlL7XnEMzQFe8pIp/pjpZ0glqp4q7rjzUlPM1ZViurgOnGpIjpskwERJGQIocaGDAMZHvOEkYj2mmFYFmcHJQBHKRc9dLaiovkiVaBP3cwq/QiafI49kMFNSRZ1iusymjYKdKioNp9HQ7vlWiDMDQ90xqD65KRIVfrti/mDyoiwMT3kqFt6Iqt6XRq/VlNHQKUo3/G3/IfLUkBZ95+8caevpaOfzA78+lG1SwYJwsG+ZxNX014nxHN2+Je1X5ww/OuQ7tx2mFbhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUV5SZfYUs2RFem9ruC9kFS6lhh6QPi95iyU+XcQnCM=;
 b=vtHVvTx1eHfoK6fbWlJqFQ8/aSyRQrHQL7xjkc9eSUkCWrLuRCtvbEXaksp4HwlsfdZZ78onhqIZegFZyDEEpRRusch0p++jmOFSnm4dhy46pn9ZWGd/zJQpBl52qnc77NATGsKMaB5E2It0AMLCRjChsLUoljiAo3JzJBDzyXU=
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
Subject: [RFC PATCH v2 2/2] xen/vpci: header: avoid cast for value passed to vpci_read_val
Date: Wed, 16 Aug 2023 14:50:29 -0400
Message-ID: <20230816185035.82994-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816185035.82994-1-stewart.hildebrand@amd.com>
References: <20230816185035.82994-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cbac96-559f-497b-346c-08db9e89d828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0vfzvIiO6ewYW8fhzOvYP0BAT4aJUueAuV0a69K4C4I8DY/0ah5lxY4jd8LstmM7a2lPr3ArO9sLYfKIqSSgjU6NcfaAxljh3g1hlCR/LJB5y5K0Wx9akG4kVnWn7fi0yXbHVlspWUI7vzpUfq/aLIU/jzbi7L2WLOKpfmPJMkY9rCQvTcrH7hWxpHIP/5MykPnWpGL82ExxqEjj0MKdEpRwRARU0OUc7o8J0amkyPNHl3JGmhLTMO2FLw2f3Tp72Dqw87LcVPi3emLWMeAFYtiqWPu2FVolLUP9eWtiVMgW7nFa0Uquj2mzr9YttzTsODj5y3kBD4NgRt8YsKdeG25U2sfSMNu/MHQehduw2vgX5rA8onsHVDCovAUwot0pfFsI+SAAwquJkiUCsolS0B6BRJ8XTFnDa4Ro2ix3RMMHRw3O6XLKGTREx6AzrMFhWiK2NU14NTNeh15tveUclpR/XnP44crU236zA7vIyhCCoaNmhyxJq4v14MZUZywVEEVUDrjtrDKGYpDhoPmuOlpl2DnG/7rE1A6WSuQwZ2btnJK6HIpurKs2zEH1GQh1n84Fv13CENaBr/oXxNVF3Vvefts0tRNc6gearPms7W2arIBneuYeGJYXkEePApg+AIGUs4SPrOxiGt2oWa9YoDHnUbpRpnLWjGwf/VkxRH2CAFw0rVbjuUHtT7lIGTuDaw5o2SauVgwUhEytWpU/PjaDDqPwMK7jVnt54GfEiAKTUeFaCh4u7j5JUkIU8pTs81KCmko1lT4ySFUOVrHNsg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(83380400001)(86362001)(40480700001)(478600001)(426003)(336012)(36756003)(2616005)(6666004)(1076003)(26005)(44832011)(5660300002)(36860700001)(41300700001)(356005)(54906003)(82740400003)(316002)(81166007)(70206006)(70586007)(6916009)(8676002)(8936002)(4326008)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:51:47.6185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cbac96-559f-497b-346c-08db9e89d828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

The only purpose of this is to give an idea of what it might look like to
introduce a new memory allocation in order to get rid of the casts for the value
passed to vpci_read_val. If this is deemed preferable vs the casts, I will
squash it for the next version of the series.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* new patch
---
 xen/drivers/vpci/header.c | 13 ++++++++++---
 xen/drivers/vpci/vpci.c   |  8 +++++++-
 xen/include/xen/vpci.h    |  3 +++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec5947300198..ae269a0b4bbc 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -571,14 +571,19 @@ static int cf_check init_bars(struct pci_dev *pdev)
         {
             /* Only expose capabilities to the guest that vPCI can handle. */
             uint8_t next;
-            int ttl = 48;
+            int ttl = 48, i = 0;
+
+            header->caps_list = xzalloc_array(uint8_t, ttl);
+            if ( !header->caps_list )
+                return -ENOMEM;
 
             next = pci_find_next_cap(pdev->sbdf, PCI_CAPABILITY_LIST,
                                      vpci_cap_supported, &ttl);
 
+            header->caps_list[i] = next;
             rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                    PCI_CAPABILITY_LIST, 1,
-                                   (void *)(uintptr_t)next);
+                                   &header->caps_list[i]);
             if ( rc )
                 return rc;
 
@@ -594,9 +599,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
                 if ( rc )
                     return rc;
 
+                i++;
+                header->caps_list[i] = next;
                 rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                        pos + PCI_CAP_LIST_NEXT, 1,
-                                       (void *)(uintptr_t)next);
+                                       &header->caps_list[i]);
                 if ( rc )
                     return rc;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 4a96aa50494d..717340b8fbe8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -61,6 +61,7 @@ void vpci_remove_device(struct pci_dev *pdev)
             if ( pdev->vpci->msix->table[i] )
                 iounmap(pdev->vpci->msix->table[i]);
     }
+    xfree(pdev->vpci->header.caps_list);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
@@ -136,7 +137,12 @@ static void cf_check vpci_ignored_write(
 uint32_t cf_check vpci_read_val(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
-    return (uintptr_t)data;
+    uint8_t *val = data;
+
+    if ( val )
+        return *val;
+
+    return 0;
 }
 
 uint32_t cf_check vpci_hw_read8(
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 17fd252746ec..7cdee84b5123 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -88,6 +88,9 @@ struct vpci {
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
+        /* Guest view of capabilities next pointers. */
+        uint8_t *caps_list;
+
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
          * is mapped into guest p2m) if there's a ROM BAR on the device.
-- 
2.41.0


