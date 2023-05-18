Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E77708413
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536403.834711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeoR-0001nO-GT; Thu, 18 May 2023 14:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536403.834711; Thu, 18 May 2023 14:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeoR-0001kT-DF; Thu, 18 May 2023 14:41:03 +0000
Received: by outflank-mailman (input) for mailman id 536403;
 Thu, 18 May 2023 14:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzeoQ-0000Pw-1B
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:41:02 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e83::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01770aa1-f58a-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 16:41:01 +0200 (CEST)
Received: from BN9PR03CA0178.namprd03.prod.outlook.com (2603:10b6:408:f4::33)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 14:40:57 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::f6) by BN9PR03CA0178.outlook.office365.com
 (2603:10b6:408:f4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:40:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:40:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:40:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:40:56 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:40:54 -0500
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
X-Inumbo-ID: 01770aa1-f58a-11ed-b22c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJzO8xv45zn9w1Dkr6iS3sdn+uUGIm0t3eT8Y99//7eksGU4+5ND2qXPc0gRrb4OwJ6jS4JMp93Z1i8RkmMrt87qdrblGMBbP6LJm0pW0z+l6R7+JXmWyDGBJCUgEM3TRGszwdv0eKtgSYWrPcBDLQ8J/qxMNZTBEA70nOAKXQP3D2rkqNXCIXTYsnuLYzSslSlgnvq+W3jyQpc9ATrBqgSHYX43RfoALa0hXO+98MUdl7QWrG+M/62MXWDPq0jn3vi66NLz0Ptq7IKnm37iAVmLwrHEQNFgQmAukcJhJe9FKHvoxjwPCQX9oyur4iWc8TMFOnincM6CHqtEUrFtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIbGtyu/gWerwDuQ2gvCU+RRCAtN1+d/wfgGFegCZv8=;
 b=b52H8s8t5TiuEfTjY1BYae43ctiUlp5SrDAghP7Ch5lU5qRAxXZvo315DTaQ/OmE96vBx9DO2+5Jm+R1GUS2IAm82ct9aJXb1TOenhUG/w518yyEbpulMzbyl5+lYNZcKzx38sFYrHYC+Xm2o5jbkRBJdnSI2/dLUt5PaaeMSWs2juLy6vxetn+srTreohqXk4oFgfTIuv/0KpkhFHinvwsEKlrpQJDpB3j3Bh5/UYVF05fJg8aVUVHqkfvnQLPKoh1DM+Q4OetQbUeGAlTkYsuTo9qCW4LKkpaShuvHsxxxi38VNwCYsJ5AGaY5W9S4AG+RTPAnO8Io15qUG0n0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIbGtyu/gWerwDuQ2gvCU+RRCAtN1+d/wfgGFegCZv8=;
 b=3PcfitGTM7m6Qvsh/k33vn7y/9jZIWX+YmiNxh+R4bztP2zKWlw9w66fA/sBoeaLq1gGMrVYIXzvmNv1jrFBITkRtcRDrMPT/nSMIptpeWwEUms7vhdpfvgTonh5SXlLjimCbLHB7hm0tGylvT5tCGYSi9qesfemifJgaUdtS+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 05/11] xen/arm: domain_build: Check if the address fits the range of physical address
Date: Thu, 18 May 2023 15:39:14 +0100
Message-ID: <20230518143920.43186-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|CH0PR12MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfb26b1-c771-4668-1066-08db57ade439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a0K+eRmx4ZJrhgGkrSsAthQy62mld0TL3pwTK+ORsIN/pwZxnZp5B8e40sTSJ1dBEpKORAMPaeoDGJ4Pan5AYrd09u5h9oUDkVKSHzNhJsWyZ0NcMKa10krwL3tMdHtgZTD8RzKRK4Uxa+na8sRJBAvAEFhNbhnoKs/csyUuh/p8h8kA251l4D+IGmOmE3UuugPK6znsc2RgNDtUGJdBKmyCdrSzxCvqbPf7Fry/edZ+YP5Yib+8vUoC6HXheCc+8+GRk/PqjXI7P4Qi6niGH79suI9wVj+ahSzkJE5HQESIKHzWSQMWuhfVNTK6ZcKVck2nS0DM8OcxYH6fNRvwVI7Hb3eBFSC1IQ3DE001MISSulKJQq9sjw8+ZCltvZ8968UzqtS4kXyCHe6TSCgvjfN/dQ7N6XpKysHY21OnVVA0OLtstkaea/NCszfZHXJ8fTWpS49p5cFRuQltFW0O/JeUykEBfDcTja4ThSXFdlvw9pJy1YnFEifpEmjAr3Gfg/wlVI1hF60T4Sk/Y+X7ZaaHTMmvHnt7bnct/mdP+tXZXIsOeK4KhS/7lFoVv2S9wuf5kUaen8kN8WXqIywPWYq3cLYn9WVhTeQEmOVSa2qsOgekLDbtYFGDlVgg7Tzauk14SFe58o08NFd03SI93LP50QZVH+MeZjmP1ol/+BeEdArGltr/d1UPfJTilrrIznD66Jx9KKDCd4wUaJ1y6iVpENh7xY1EZgs1qAEF+m1zDQSwc+u3LE8MDDNCydfgby/++LMIwJ+cucXqhjwk1g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(26005)(40460700003)(1076003)(36860700001)(36756003)(83380400001)(47076005)(40480700001)(426003)(336012)(86362001)(82310400005)(2616005)(103116003)(356005)(81166007)(82740400003)(186003)(54906003)(7416002)(478600001)(2906002)(316002)(8936002)(6916009)(4326008)(8676002)(41300700001)(5660300002)(70586007)(70206006)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:40:57.2492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfb26b1-c771-4668-1066-08db57ade439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387

handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
parameters. Then frame numbers are obtained from addr and len by right shifting
with PAGE_SHIFT. The frame numbers are expressed using unsigned long.

Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
when the result is stored as 'unsigned long'.

To mitigate this issue, we check if the starting and end address can be
contained within the range of physical address supported on the system. If not,
then an appropriate error is returned.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from :-
v1...v4 - NA. New patch introduced in v5.

v5 - 1. Updated the error message
2. Used "(((paddr_t)~0 - addr) < len)" to check the limit on len.
3. Changes in the prototype of "map_range_to_domain()" has been
addressed by the patch 8.

v6 - Trivial changes. Added R-b.

 xen/arch/arm/domain_build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 50b85ea783..cb23f531a8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1643,6 +1643,13 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
     paddr_t start, end;
     int res;
 
+    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
+    {
+        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
+               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
+        return -ERANGE;
+    }
+
     start = addr & PAGE_MASK;
     end = PAGE_ALIGN(addr + len);
     res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
@@ -2333,6 +2340,13 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
     struct domain *d = mr_data->d;
     int res;
 
+    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
+    {
+        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
+               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
+        return -ERANGE;
+    }
+
     /*
      * reserved-memory regions are RAM carved out for a special purpose.
      * They are not MMIO and therefore a domain should not be able to
-- 
2.17.1


