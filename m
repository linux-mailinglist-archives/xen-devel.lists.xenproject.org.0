Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A76F1DC0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527454.820095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNH-0001AA-Jo; Fri, 28 Apr 2023 17:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527454.820095; Fri, 28 Apr 2023 17:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNH-00015Y-Ea; Fri, 28 Apr 2023 17:59:15 +0000
Received: by outflank-mailman (input) for mailman id 527454;
 Fri, 28 Apr 2023 17:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSNF-0006fW-6H
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe59::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6083cdc4-e5ee-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:59:11 +0200 (CEST)
Received: from BN9P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::35)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 17:59:08 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::3) by BN9P222CA0030.outlook.office365.com
 (2603:10b6:408:10c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23 via Frontend
 Transport; Fri, 28 Apr 2023 17:59:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.24 via Frontend Transport; Fri, 28 Apr 2023 17:59:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:07 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:59:06 -0500
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
X-Inumbo-ID: 6083cdc4-e5ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtX7F0/Sv6FUz9DPXDsb5qskn+XhgEyne1KJwZnnRqfkIyrj0BHe3j2h5f757NDkmdEBwpC481/wwKcLxM1o9TM4Qe3trN+VJz2UeJFao+ltsnKJJIB9Yq11yv8kR6H2D1SWauByNMt1fYmkqYqacDSGEb2PpeR6py1yekeau7cYSpnBHYfUCfgwMNgI3XzpFjDIHWVFWWmjV9p8H7WVvaz6ZcbRAVp1Zdh0YnKbFyMG3JCYSC+LmM2JHxmDRwHTF2SSEmoskL3ngzlrT3+W0Qpd/bJDw/RcdQJPH8+2PU6KXmfLgswYamMvA30MkDuypPeypbNZe3F2lb9DjFJe1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVRoIcVr9qIryp7aBKt+Cf5kSuhKxlTPFt/EQaROMMA=;
 b=WgIRelK+J3NITr5k+RIFXZdX+LtSg92rECCDtMQlr/OvAAGa/YLI0EC8wiGYhO0cLMUDTW3cp8Cp4OO57HM+869CANaSOgBIVqo6Xv5QoJAFQtA0EvUqzlnDpPdX7TkaI+/tE/eQzXLpPL2Y0U/UALRwMVVCDJW/BhyZdzteeKKb1Gu5wDTwUsip/rxhIqWIQrVnJMeGa3W8jdXazgs0khglldxIgjzMjDNm2rWfmktiZcKpERzfAgd2a3rQHoC+MEcjdur9WeRT4aEkk0m15UibrHoWZjR6Q+LLPB1dOXoVwaF4vbLDpiUmFZEvZ5xLFtLBDELQrLxZnaO1EMCelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVRoIcVr9qIryp7aBKt+Cf5kSuhKxlTPFt/EQaROMMA=;
 b=HNJa2mBVdn+btQ7DDOEgMtw23GaGUS2jtRK8nMfvtzGmfhXZq6M0eB0S0vDKfFOzwbUmiGmVVI/Y4pxnGsSHjuFT6ZlsFdKQCkFUot4/zYmXkvWLP56ew4oBz3sshaYeEsS3eFyAQLedi6oriJWWk7pCk7nppEB9dPbkGWmbdko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v6 09/12] xen/arm: pci: Use 'uint64_t' as the datatype for the function parameters.
Date: Fri, 28 Apr 2023 18:55:40 +0100
Message-ID: <20230428175543.11902-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7206b6de-4e5f-45da-4de9-08db4812435d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	424IDj+UHl4gy/IRVolTWpbDRnpdvlBHOfOw3MTD/Sm74whe1xOkzf5ORJkNkDQoj6IRE9j3848GC1ozdaNYKIvl/5tKWnqlgFtB+yx1IXc9sNYjfdlUUv6Nu2gw3EfzySiAjRU9OTRYgQsfsQ3AjwnDAjpejlcNBmRlUp2X9NKdmlSlrHYTNHn0I6OP6uOfehSW+pfDNsvNcB9urv/Z05wyf2gMq40WfTeXDAMVO9Ij6qMjdAnsgWPARKGVOHGnPPy6nf49jDnOFRMempQyWsCDgpMPbmlEro6Sg23E0jWHKaDPkQjpYVnCYp0xSSpISSEn4WV2gQH11T8VfA7zjP/nJFAk+7V6dgD5oBE7qhrYZ9FZwsMCTf7nFs0gqEgfDPab9b4GuwgTW6nDcpa+1H74quKdScSR+mMGoVug/WORCuB26+k05dQcDTeMt1RiTosW1asyu6qodveUEqsrZE5KjEPBovu/fETbOyj5+gRDqH/0BB19xtanywWIIJn4D1qq+gBCGJdYSIOMClh2OkfO7BeK6BY2WKcYlyttokM013P1H4JqKAiX+AP+8sPU/rvjdzGgeg8+M1fyO51O0fMm2JWE54sqA2qr9GBw+cEb7GHBPy6upzFv+lflKJX5xk0f2M/S2gkooTkSLYoBJD2ZMDhal2V1d8d7jUaJqcnzsylIMYmcECrYM9LdlcMR6Zxa0vR2TWw1uwbEXsRyd1iSu0+uuPJNvieckFa8a0j7dV303MZT//6hCMXBrdn8gntOrPJziayTJlFbiTWVm+g/lFppiAZVR9CdalK5Mlk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(40460700003)(103116003)(36756003)(5660300002)(41300700001)(4744005)(7416002)(2906002)(8936002)(8676002)(86362001)(40480700001)(316002)(82740400003)(6916009)(70586007)(81166007)(70206006)(4326008)(356005)(82310400005)(426003)(47076005)(83380400001)(336012)(26005)(1076003)(186003)(478600001)(54906003)(2616005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:59:07.9387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7206b6de-4e5f-45da-4de9-08db4812435d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

As the callback function in dt_for_each_range() uses 'uint64_t' as the datatype
for the arguments, so one needs to change the type of parameters in
is_bar_valid() as well.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1-v5 - New patch introduced in v6.

 xen/arch/arm/pci/pci-host-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 5550f9478d..de915aa590 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -379,7 +379,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
  * right place for alignment check.
  */
 static int is_bar_valid(const struct dt_device_node *dev,
-                        paddr_t addr, paddr_t len, void *data)
+                        uint64_t addr, uint64_t len, void *data)
 {
     struct pdev_bar_check *bar_data = data;
     paddr_t s = bar_data->start;
-- 
2.17.1


