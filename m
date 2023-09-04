Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BF79148F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 11:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595024.928501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5fH-0004hj-UL; Mon, 04 Sep 2023 09:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595024.928501; Mon, 04 Sep 2023 09:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd5fH-0004cQ-On; Mon, 04 Sep 2023 09:14:35 +0000
Received: by outflank-mailman (input) for mailman id 595024;
 Mon, 04 Sep 2023 09:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd5fG-0004Su-El
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 09:14:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eab::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 746e8734-4b03-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 11:14:32 +0200 (CEST)
Received: from SA0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:806:130::27)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 09:14:27 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::38) by SA0PR13CA0022.outlook.office365.com
 (2603:10b6:806:130::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.23 via Frontend
 Transport; Mon, 4 Sep 2023 09:14:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 09:14:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 04:14:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 04:14:23 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 4 Sep 2023 04:14:22 -0500
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
X-Inumbo-ID: 746e8734-4b03-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPYrM7nLWJ17divS8FFP1TjkppFVMIcdIofyM3fqfd5XKiSyYbQJETNRMIqpeZSp4s5Jkfd0slYFyP+tm5MvEtDHpXI0uDbUqgu0hf3l2sg+y1FqX6noby01NmY3YXJ2gjqTiuNbYJ4ajUA7bOKg57wOEpX78PrpzrbXW9DODN4EKNIpq2vANOl6C+fAEF9829kE38TcBOPx7KvFKt6oj6XiLuFzHiIF9caFJlX1ZEfRbFGHvxQlUUCZEUAZ91MuoFt2EvwHSQEEKP1ARdwnUSn8Pyy+igYby+y+haDFg+3MmGKVGrAm/gAfVOtLHyHzkjgYF0v/uFlM6ikLSH1L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIq+cqKXin8yRNnzT94HulgKn5L0z4PTEoU760E1PXI=;
 b=n8SlCcoQgZr9ZiS72VofVj9FkYXFdIbPdAIANWH18P7pS9rE+w9qAPIlvHpjrCM4rirytiPpHwAQYd0REj3SmxL4PZqzy3yh06xlOHdqcV62Xo+tt2ugyFKUjFeLjR78QNmpIZ7/q6BPt2bUoasiqbDFKZ2Jv6ZXF6021GPnBmQ9cM39iwAy+9pA0Z7IhNKiAAqOz8WiPEh9cX6TG+HMemeFl/mPLfc/7bveuo5qZWMM5Lbs7HEf3kv/1OyMBc5NeC/t6hY+8KQeHkPy0VumtWDNE/qjagBoO4xT02CgSemDSmV+Ti6H5mI7EDOpH35DQ4+CLWDMUJy/lW5bjmpp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIq+cqKXin8yRNnzT94HulgKn5L0z4PTEoU760E1PXI=;
 b=aPu+uuesYIyDgj1ElC0sgV87YgqQyq5WRLWX6RikQTJCBzzoLB0JsYQduXXek7qs1xGKD4OP0JfLz0exYzmg62xF3tBRjErOXN94IRhZpm6J2ZooLCZrS+/cNO/wi6vHZxPFFVT7sJHgUqf75TF5nccVcRu825zjfBwQynDxiQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: smmuv3: Add missing U for shifted constant
Date: Mon, 4 Sep 2023 11:14:05 +0200
Message-ID: <20230904091406.942-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904091406.942-1-michal.orzel@amd.com>
References: <20230904091406.942-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: b878e39b-ed36-4ca3-e3f2-08dbad275642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rwpxUpUjg0Cmyw3WMIeBnyv+a1FpqTN5znxdFk8H9gbkIyt92s04fMKvl/0EZz2Th0HECQzhcSkYZJ6EYmIhTVbRHpxqICKD0qBNdiOxxEuISGScZQwkBtxbLPxP/cHitibZqI5bAGoXBJsN9weU0hVDH/CwjHeMmN4Xdu1Gs3HVUmLfX+odB/UwJRJWvdoT67/87kl6zz1F8N24tSWdlUvu8Fv/5Ct4gLG2RbIxG7QySdTilMqD4/GtmZAx4RotrAhN80CFfbvdBA/Io1Y2FRKcI2SxeOpCdr9JpYjM2jCRhnD3WdCfLCnrAQY0OL2JBzeNDO8gxcA3pSBvUZcdUnU7nTRNEQOl4a/MpXUPG4LhlmXd3NZna3rVy/T2jM2MSQ068nUlObUajoTfe87jWPm1gGisBSp9P+AndvNcFSndsHqIwGAuGtSlplrRRbOVGuf5XzldiDti6rmwPtXMwKYqy1r3VuP9qXnrZIbiTmturAmgf8oyEGb3e1TSb7u8JHaGeHtdL1soDOqcGnToJ5ZNChxHc1CMj2YMVRXkfFafawYgnrfIMUpcYyMIqUjZVm/7mWgYp8Enuy2LI6yGx9Ls73MjgJ/vHleLF5gW94s/UUpWwK8o0vyBcTVD1pnBZ8sCK3h+3/J4psucRY1Su7/elDl3VB2D5NDWmA2bEKlhdzLWtEbt+6j+E61N0kDrthODhNRzgDA470077MyB0tpC7GtmSca7EfD9FLaN8zzQqXhD2c1L3Sd4P0y2mSX4DstD7qjyDVlylFVlR/6dLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799009)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(8676002)(8936002)(5660300002)(316002)(6916009)(2906002)(36756003)(54906003)(70206006)(70586007)(4326008)(44832011)(41300700001)(40460700003)(26005)(1076003)(36860700001)(40480700001)(336012)(47076005)(82740400003)(6666004)(81166007)(356005)(426003)(478600001)(2616005)(83380400001)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 09:14:26.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b878e39b-ed36-4ca3-e3f2-08dbad275642
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335

When running with SMMUv3 and UBSAN enabled, the following is printed:

(XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:297:12
(XEN) left shift of 1 by 31 places cannot be represented in type 'int'

This refers to shift in Q_OVERFLOW_FLAG that is missing 'U' suffix.
While there, also fix the same in GBPA_UPDATE.

This should address MISRA Rule 7.2:
    A "u" or "U" suffix shall be applied to all integer constants that
    are represented in an unsigned type

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index b381ad373845..05f6b1fb7e33 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -87,7 +87,7 @@
 #define CR2_E2H				(1 << 0)
 
 #define ARM_SMMU_GBPA			0x44
-#define GBPA_UPDATE			(1 << 31)
+#define GBPA_UPDATE			(1U << 31)
 #define GBPA_ABORT			(1 << 20)
 
 #define ARM_SMMU_IRQ_CTRL		0x50
@@ -159,7 +159,7 @@
 
 #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
 #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
-#define Q_OVERFLOW_FLAG			(1 << 31)
+#define Q_OVERFLOW_FLAG			(1U << 31)
 #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
 #define Q_ENT(q, p)			((q)->base +			\
 					 Q_IDX(&((q)->llq), p) *	\
-- 
2.25.1


