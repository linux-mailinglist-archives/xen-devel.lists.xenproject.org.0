Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE4778114
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 21:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582174.911796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6a-0003xt-4j; Thu, 10 Aug 2023 19:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582174.911796; Thu, 10 Aug 2023 19:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6a-0003vB-0K; Thu, 10 Aug 2023 19:13:56 +0000
Received: by outflank-mailman (input) for mailman id 582174;
 Thu, 10 Aug 2023 19:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFdC=D3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qUB6Y-0003Ze-Ey
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 19:13:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a50274b-37b2-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 21:13:52 +0200 (CEST)
Received: from MWH0EPF00056D05.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:e) by PH7PR12MB6933.namprd12.prod.outlook.com
 (2603:10b6:510:1b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Thu, 10 Aug
 2023 19:13:47 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2a01:111:f403:c903::) by MWH0EPF00056D05.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.7 via Frontend
 Transport; Thu, 10 Aug 2023 19:13:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 19:13:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:13:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 12:13:44 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 14:13:44 -0500
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
X-Inumbo-ID: 0a50274b-37b2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZuR4tI8Nijs/tOE+ybOzOjq2TcLMt5dFyufMIaVDsqT+vhoFl9FOUy5rOXmgOmnqMmmBb7QHEIujizcWaLkUaSKRLy48WaV7O9XpoO9W4+zCvtQrWLovql/igKbBzlnjpwZbwt24D9ccnctd7FAbz2TzlcSh+IaP//H+hxJAs3gy3m7fDK8ZWbiyTym1ljBgOee6C+Axv2FQkqIPMG5vAUThzD5yT76B1mqU2bVMWzWm9kPEBFiP6Ok4VEBfxsJaHwCK1otCWttOvqh6HUnr3SdJnGHoCVh10vd6HqirdVgnOrge2oLdGZZB6OS4rP6d3aHBO81FLa1xEaCnbNxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4yLLAlz56YDsP4hB+WtRJV0qGSq8/4CwsqKhUFrp3Q=;
 b=YNGAuAnQrULH4FTTRGU61MilkXcsE04SQ6Gn4xeeftIWWDvTgSJZdshV+VdQKnJzfWtT+r6cxGNVkDYeyXFAiu1Zss5GcDUl4rc56+E41MxbL65KJ/sgcDBO+YMzr2qsK6YawM9gTqXiDkTbXoCPPSUvWgRD37ESvJhWE1r2jmqbGyKtIABpbwrfc7/eZldLn9cQuzmo1sT1mabAeSjgnuRy5o2ONOwzzohfMjRxtDw0aHaZ4NRP/QWUFj58J2TKW5iMmTbzeUquW8bG0GsEZ+xgSuz/sICq3b19Hj2ZWYd/oZzoYhjgd6WXGN13/Kriw6IAuCikgj7lUeI42F+C/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4yLLAlz56YDsP4hB+WtRJV0qGSq8/4CwsqKhUFrp3Q=;
 b=NCZSOCDOT/dBQme0CHOfIY+P/+e/SQbKYbJUA76uG72KOLDguMt4/BlkXu5cmflp9iX+OUi6YZJ3RyJzb13G6b9Hp5DnE7wLz4jYKq1D8QD1z9n3EZRAriIYnlzsWSIrQvuC3nX0jR5TYYNYEm1M0GL/Xfq5Tl4259YSvF77AXA=
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
Subject: [PATCH v1 1/3] xen/vpci: add vpci_hw_read8 helper
Date: Thu, 10 Aug 2023 15:12:57 -0400
Message-ID: <20230810191312.644235-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810191312.644235-1-stewart.hildebrand@amd.com>
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c12e43-9aae-4bfa-61f6-08db99d5eb82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+oMc+vEZQZaVHMNCp8Ql0UGWG4HGD5K/l47rqOXiiJbDRlbolOIiHVJwpPyPMS+1jtk2kjiwvJnW/GYGkCAxrg7cDTe/dhH9LrgGmO4RPat04bY61lJtDfGdEoG9Ss7OWUL0fJfkphve9WfBPv/LBLpNAy3w3N9sl2Q1ZyZ9VazSSvSuBUU44nJqBQoz0ChS83L31HRQubQt2tq+qN16ZUfQj4LrtSrPJOwXgYhX6rEeyV9HGT/zYwTJVTc+lVrFJnTl5aDyEXLWaB6bfsOvqtnQG+VqodV0GlSvxlXXwiyQsPPD5ZoqqvAJd91ATx3PjNalCH1OEXfHAd2CFTe0sruBi2ocO1i1GIVDIZPWwbkuJQEKsMb0hKVx6RJEQ5Yz6pFE27eGabHE72nruln8GKQDwRMLzHcl9BZWFXGTqYylcAStnnblbnBHBHqFTQmyJ23OxOGjJ2Kl6T5M7DPZlF+/sLTOXg/7a3Lb7eaI2LSc0fdq1E2MWSzHE7i7tMg4lIO/z6ed7hz+tkfPjD1vF4zdVxwkBKo3S6qALsJnHjq9j8Dw9Yn5bLZRCcArQzFiA2MaMuoLCvvk0pCvQogqglDcVwlqsyo7b993CVsS/qPtRsP52omN8/j2Kt9nS4CVaNjKijwFYjajDrXjtUrGIRUjsHrbY43um44EbR56SQpYkkexVMwgIdWBu/fb/TbfNg1Y+p5F88op3wPJ5ak1ZzU/7eedp6nO9NQUuIGanuchxcIcJt70fouYssgRAsWIBVNB3s+xKdi+QzqFmilvQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(186006)(82310400008)(451199021)(1800799006)(40470700004)(36840700001)(46966006)(1076003)(36756003)(2616005)(336012)(26005)(6666004)(81166007)(82740400003)(478600001)(356005)(70206006)(70586007)(4326008)(316002)(41300700001)(54906003)(86362001)(8676002)(8936002)(5660300002)(44832011)(426003)(40460700003)(2906002)(6916009)(36860700001)(47076005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 19:13:45.9769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c12e43-9aae-4bfa-61f6-08db99d5eb82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933

This will be used in a subsequent patch.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/vpci.c | 6 ++++++
 xen/include/xen/vpci.h  | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d73fa7630237..acadba1fd6c5 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -133,6 +133,12 @@ static void cf_check vpci_ignored_write(
 {
 }
 
+uint32_t cf_check vpci_hw_read8(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    return pci_conf_read8(pdev->sbdf, reg);
+}
+
 uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c745b..ee7a8fcdee83 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -46,6 +46,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data);
 
 /* Passthrough handlers. */
+uint32_t cf_check vpci_hw_read8(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
-- 
2.41.0


