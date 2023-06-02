Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72772012C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543125.847805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53bY-0007L9-US; Fri, 02 Jun 2023 12:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543125.847805; Fri, 02 Jun 2023 12:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53bY-0007I1-Pq; Fri, 02 Jun 2023 12:10:04 +0000
Received: by outflank-mailman (input) for mailman id 543125;
 Fri, 02 Jun 2023 12:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q53bX-0003vL-Q1
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:10:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6638a187-013e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 14:10:01 +0200 (CEST)
Received: from MW4PR03CA0272.namprd03.prod.outlook.com (2603:10b6:303:b5::7)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Fri, 2 Jun
 2023 12:09:57 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::93) by MW4PR03CA0272.outlook.office365.com
 (2603:10b6:303:b5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 12:09:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.26 via Frontend Transport; Fri, 2 Jun 2023 12:09:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:09:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:09:55 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Jun 2023 07:09:53 -0500
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
X-Inumbo-ID: 6638a187-013e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uceq4vPzIjwOwdKEX6Hs8nmORpTOMQsCCDCk0XqkcS6+FsyHO5Oenv8/JA4g5cFzyxpuieoST7EoSRvAkJF3ypMauYjem3pWG8YJCPZOLB3e+tv2OThyS5qhevgmq1W+1VMQVFN/QGZRcBQql17WWQpWqtvasPSy0MKTGjD2FD5fJ1xXLmox0Dtl9i0sMQlxvCFKdVoJo81OIM16sz0w3nOzG4oOf+JE4Vcwp49/BgE19SyJPjHyawb+JfTbzWQl0qmObYwRCrUuuOPnbLtmBPCcko+wahd5/LxgC/db4PAI2L1A78tuyrn0+M+7TB9PW4gpIA89v7PpIWxNwK8ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLBAIbTyb40hmLGACIS/eIuTtif3YL9R0l6EzqD5g1c=;
 b=VmuLyDWuo44wyTxKBZWXGJQFIxCrbE2IDkjdyceES32EWFxM6Jx5/p491BLhQ9dpfWKLWsQ5/XvRuv4BR+5sJg1mx7TYjO4RoWe74tRPavB2HfokQawly/UPXstH3Fl+lHQYMwvP+yYUENTI9cdJpAqBdhneMLWTjiu9XRucK1BsvxAGGuxOLHOYs9Rral8QsFcRHJuOc7wqpM/6ZbiQgsLTFquYEYtygXpIpgS5MwHS2OX02nKiymKAFl2WNEqs84liOYQwx1dzAGHpB+OD+AmGC7iZI/8YJzK2anhzpAFw+wSLQo41pBCc9pdIpkraWAGO0wmisIl3S8pocBhdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLBAIbTyb40hmLGACIS/eIuTtif3YL9R0l6EzqD5g1c=;
 b=2fgv1nuikDTkOtJVd4zViXH8vc8Q4dtVC3M5LZlanXCC3hFAwWXFf7TNSNdPxFUowqkBrT8zShiT8me8wsDjtPLItW2Op2QEruFrBTxrWdjaptI9egxglktmFWVY3e48cNfa9AjTSS4mlS3+Vgty3K+xgXvR5J9EpOCGwGL8+Sw=
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
Subject: [XEN v8 5/5] xen/arm: p2m: Enable support for 32bit IPA for ARM_32
Date: Fri, 2 Jun 2023 13:07:54 +0100
Message-ID: <20230602120754.23817-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT036:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f447898-408e-4180-e65a-08db636247d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S6fWyp+mCtFeFEiSkt3ziO2w0TZswBwsT+abt9rmsuaW3rvUyELXKUSDp/tMrav6tJRAkTnG+t4ZCt43usBa8C31BERU2/7hQ555fq3DfeyavJcxUE3dEFKKWRyDGUeszCz8DL6RIjuzk7GxZB1de3Okwp2gsh2DnWRDicmtkfn85pgSks8lFk7CUxU0pVU6LOW3JHMhEvFES4XQjzZlgAZfXbEQwVYnriSbecJ0zkK01eXc8IEP/lm6tybjXliQ6yXVXBMGIPV7juAc1KWGyWBBiGPEdabsSqUKWqW63lxfFT8RXfiSoQxX98m6BpfllkBBFZSS+50OEEu1X/8VlhjbubrjjsDIn/RX0BoyWqq4TfcPv59K/Izea8KrFKoXex4YCn20uzsP7cUhxOxS5fqYjcRtWztdJRVnKPY8Uye49HwyZGXbwzohKCL+5W7NRyTDOWVjt2R/XmEhHPop6y0ZK6iFlwGIwWt0NS36cAFadcYottMwTg5paDv9wQ2RSzb9IKhtnb630QT0Y/PKTtl+x4QWnIpgpTCJvqa7O7H9gAMw02erdbYceMYOl19j0241GMlAepvyy9CmNbNFH33k6HAg5th4OWZbYIlhvhUhJHK6vzDs/GqCdYfb+cJTFr5BBstgu5rWPKCmg9+qeJ1ZzUrzQiBBjtmPn08S4bnrJ9nEagNdiHhHSMZ414g36LUeBLlNAKImye828aktWkOx/mACtP7nBZt4ydEIzdXJisgJKtext5Oj4m/sEGx+Koxf3yx/wOQTR8vB+/YL2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(336012)(426003)(83380400001)(47076005)(40460700003)(103116003)(2616005)(2906002)(36756003)(86362001)(82310400005)(81166007)(356005)(82740400003)(36860700001)(40480700001)(316002)(5660300002)(4326008)(7416002)(41300700001)(478600001)(54906003)(8936002)(8676002)(186003)(6916009)(70206006)(70586007)(26005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:09:56.4730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f447898-408e-4180-e65a-08db636247d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605

Refer ARM DDI 0406C.d ID040418, B3-1345,

"A stage 2 translation with an input address range of 31-34 bits can
start the translation either:

- With a first-level lookup, accessing a first-level translation
  table with 2-16 entries.

- With a second-level lookup, accessing a set of concatenated
  second-level translation tables"

Thus, for 32 bit IPA, there will be no concatenated root level tables.
So, the root-order is 0.

Also, Refer ARM DDI 0406C.d ID040418, B3-1348
"Determining the required first lookup level for stage 2 translations

For a stage 2 translation, the output address range from the stage 1
translations determines the required input address range for the stage 2
translation. The permitted values of VTCR.SL0 are:
0b00 Stage 2 translation lookup must start at the second level.
0b01 Stage 2 translation lookup must start at the first level.

VTCR.T0SZ must indicate the required input address range. The size of
the input address region is 2^(32-T0SZ) bytes."

Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = 0 when the size of
input address region is 2^32 bytes.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - New patch.

v2 - 1. Added Ack.

v3 - 1. Dropped Ack. 
2. Rebased the patch based on the previous change.

v4 - 1. t0sz is 0 for 32-bit IPA on Arm32.
2. Updated the commit message to explain t0sz, sl0 and root_order.

v5 - 1. Rebased on top of the changes in the previous patch.

v6 - 1. Removed the index for ARM_32.

v7 - 1. No changes.

 xen/arch/arm/p2m.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 76388ba54b..a969068a68 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2265,6 +2265,7 @@ void __init setup_virt_paging(void)
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
 #else
+        { 32,      0/*0*/,    0,          1 },
         { 40,      24/*24*/,  1,          1 }
 #endif
     };
-- 
2.17.1


