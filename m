Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEC66E520
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479663.743669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1M-0001S9-8J; Tue, 17 Jan 2023 17:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479663.743669; Tue, 17 Jan 2023 17:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1M-0001OV-3t; Tue, 17 Jan 2023 17:45:16 +0000
Received: by outflank-mailman (input) for mailman id 479663;
 Tue, 17 Jan 2023 17:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1K-0000oY-Ah
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b090a849-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:12 +0100 (CET)
Received: from DM6PR07CA0119.namprd07.prod.outlook.com (2603:10b6:5:330::11)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:09 +0000
Received: from DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::c1) by DM6PR07CA0119.outlook.office365.com
 (2603:10b6:5:330::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT091.mail.protection.outlook.com (10.13.173.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 17:45:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:08 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:07 -0600
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
X-Inumbo-ID: b090a849-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeXLJf6vgehwmr/KZXHuGB86TKUVHfYF1pgrIowxLBMtv/Q6CVJnPxOWg4dmUV8qeV5JKHAw80r6uObgh5JhYuHWYFqME+oRRRmADacbCd9HaTTRyi0SUVyYt7H1com1pJ70KT0LQ6hNeovsyRsfz++Q26U/8eRXBmmjxtwZEn3TxTSCy+n0n+DBKC8UK2BoSvQj/A/kLbpaBzwaBDkOGRDRHEkQXqPMMF72hDcZb8jVVJQWt9Vyyr2yisDdBJkF+ilUGHU/F6s6zJA9F2LmZ5VWs7AVN8VtlXUxxfXkOrAm4paRCFXKnAXQi3wADOF++zEmvoRib9yHJJHAioVExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYKh2ZpT1JIDy592j7PXcRkkm4hFksMRdjO4SCJ7TpY=;
 b=LuM9BJB00qPGfqMD5o66N6VNQ/i4EXtjDEJUoT8xmITbSTI80b8QE0U2EWzSq9SLFDbi4c5lRL3JkFVxQYf0Z9f1k7QphS35W4r70zx+l35nrb/Ou1F8qzE9IxhuVcgie8kVqcaFIXEVPumCllh+J+k2BeAhH0fgK2bN4RVVwXcLhwpjqTAsr/pPkS1Ff7tSCjpCXGECzoB+JwCpU359hiom74hCV11Ygljwv0YbU94d5DWUQeIU1ED8HyYBy/6uKrd7UzDmVVNZ5dgcxYU8i2w7BdkPRM+/Lzi7N3Ni3gSsKXbwAesCMh7WBCEbiB+ZBQXQrKhYP7zD/ppOCbh4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYKh2ZpT1JIDy592j7PXcRkkm4hFksMRdjO4SCJ7TpY=;
 b=IPGdLr2g8jW7hUYBMMSzi68G7E1sm1cRH4WIX6n5xirqovHGq4CNGLgIIfpCkOkIBn3my1SWe5gXceoAUhUAR1l/U1VTwYp+GmkecTSCbqWkKjYkCf+0UpxHMUeUuOtxnfJyECr34LTW8ZkYxlveoloaGfccilE4cNQz+wGRzB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 03/11] xen/arm: domain_build: Replace use of paddr_t in find_domU_holes()
Date: Tue, 17 Jan 2023 17:43:50 +0000
Message-ID: <20230117174358.15344-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT091:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d411da9-0977-475b-90d2-08daf8b29389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y3uxipXyMKjzf9S1QGc5lmqAqydcX/EG9tXVsdWlVSj8n8Fss0YQitwAWcokpZayS+7eb+gxzbC8bGC9GRdGSBkqDUZLC5KZjqaoM/+2ixXw5AjXxRCs6ntbvj+gJYusSXjM4DRU/0KRJpbKeLz+C+W17WYpXWio5vgmnnioDATPP6IeGp99aJOeXph2HvoTEvu+or/NjngBt6LQRGGd7QE2IMfgzKn2eXhTvYSpTQr9ZNUVCGFk3ElZTwikMdkQdgmHv3fEDsoYPR7C6zeVMYGqNArzhSsyhbyI3B5/cXNhFYHvT9bWXWxpug0VVxzSBrRSGjUJEtyMq1KDs1U53n4BEeXjo403ciGReqBuWQQJ8S99Z16gi0I+dHtpuKfgCN5j2ukny3tPedOiSSHtCQDQMPW18amCArI85C5xmFgE0XveqPBYEFJstxQnaAnecg3LhWzc6HVs7DHXGE6sQBu9fj8f0UH/ZEdv1morPaLa5+FuL2iNiOVmYqdHsPAdM5SRcdW9ZpVQHdgNhCVtOR0y3nypGZvbTpoxO1MyormAx8KdsmZ3y3J+8WWTMIvMMjXGeVIQfp4y0KaRTGwuGJTpaTKHojiBWdqd7cyLcW2CEB4lafKebrzCEm7RW1qetVtibVcDuMbGyI4HL7WSOH7G8AwO3c88I/47vx9bQjDfnzC8yt3uTYx3JB9uC21y7atlmqFGwTMMB2E7Ot1a4UP1gPyCLtrnzFdDQs1HafI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(8936002)(83380400001)(36756003)(41300700001)(2616005)(70206006)(70586007)(6916009)(4326008)(47076005)(426003)(8676002)(336012)(54906003)(316002)(5660300002)(81166007)(356005)(82740400003)(82310400005)(86362001)(1076003)(2906002)(40460700003)(103116003)(36860700001)(40480700001)(478600001)(186003)(26005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:08.8698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d411da9-0977-475b-90d2-08daf8b29389
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

bankbase, banksize and bankend are used to hold values of type 'unsigned
long long'. This can be represented as 'uint64_t' instead of 'paddr_t'.
This will ensure consistency with allocate_static_memory() (where we use
'uint64_t' for rambase and ramsize).

In future, paddr_t can be used for 'uin32_t' as well to represent 32bit
physical addresses.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - Modified the title/commit message from "[XEN v1 6/9] xen/arm: Use 'u64' to represent 'unsigned long long"
and moved it earlier.

 xen/arch/arm/domain_build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 33a5945a2d..f904f12408 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1726,9 +1726,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
                                   struct meminfo *ext_regions)
 {
     unsigned int i;
-    paddr_t bankend;
-    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
-    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
+    uint64_t bankend;
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
     int res = -ENOENT;
 
     for ( i = 0; i < GUEST_RAM_BANKS; i++ )
-- 
2.17.1


