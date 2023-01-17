Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9636966E529
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479669.743720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1V-0002qN-J7; Tue, 17 Jan 2023 17:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479669.743720; Tue, 17 Jan 2023 17:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1V-0002hn-C9; Tue, 17 Jan 2023 17:45:25 +0000
Received: by outflank-mailman (input) for mailman id 479669;
 Tue, 17 Jan 2023 17:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1U-0000oY-76
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6594838-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:21 +0100 (CET)
Received: from BL1P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::18)
 by BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:19 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::71) by BL1P223CA0013.outlook.office365.com
 (2603:10b6:208:2c4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 17:45:18 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 09:45:16 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:16 -0600
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
X-Inumbo-ID: b6594838-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKFcRBIoSL8hFvCF6230um6e8PhO6Yx8sUL5w75R809q0lwztfKZmhqJ4jJy6sXPxox5ncT9X2ONi6Kj7rUivZ5twsYJW7BRkBo4GZ0+HLA3yrL7SMmwIrBUAX0rGGviZMl0pDLCwRsAEKkzTmxm0kHFTtGHS5+NbiKZLPNPqFj0T76IYjH+mi4b5FFhiaAfxiMFEJJY2qxb48Sj7GUL4UFkynFdImZy8LgDIxXAG+gnTRo41sZ6kVS6QBj6miRy8ny9MXg3Ul0CHaV739Gd4ep51Gglkj5lKpN5vnsyy8CdLCoISGI8ChVVwTcX8uKzrNCC5NaJ1XlKbxjuyaxV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTuCjvySdNRIh7I98ybx4BVBMGxho8OVLY6od2Qthjw=;
 b=hFDq7byjPtDsdp+YU25UvxF9NcSn6X60FTXX1bSR9p40/rA4MZ1tHWoAF51KiaBgKlxwHIvIra0yTzyEunp+LGeelTfqsgWhCg51kb52Ka//99Sf1jaUccrBDB0jDPw9vTL+CE8MaPNJoSmZ1H9Gv42e1G+YpIFfMiH2vK6ji7/UOVNFUZIGNcM6D0GQ3Wd11+c/AX9IsfkE//oD4YhK2MrlIhgzhn3LqbrIhAMJtqkXjE0q0AH3jpS4UBvwsODj6nzwryOptY6QD/Bds+zZ0QULYhAGLDUz6W2eM/F7KYJRID7YIxs1/Ov4P6+2Zl2nZsosnuipUvpQ2XTkasAHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTuCjvySdNRIh7I98ybx4BVBMGxho8OVLY6od2Qthjw=;
 b=Wu2tFbFbTZJhJ+MWeMPPAlKPVK/uY+pEecQY8t3xN90+o6eK07clUBZ1XPFNgqziNrSrSrjZjiU77iA5xbH8ZV0cfTbTt1kTxGq4DlO2M2wecU5HUuW5R4wyzlMYCyZ6eizSzdFlqAs9NycAVdAcXgycHVeNfll8zlDKVzSNSd8=
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
Subject: [XEN v2 08/11] xen/arm: guest_walk: LPAE specific bits should be enclosed within "ifndef CONFIG_ARM_PA_32"
Date: Tue, 17 Jan 2023 17:43:55 +0000
Message-ID: <20230117174358.15344-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|BN9PR12MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 954f94af-97fa-4e29-e7d2-08daf8b29971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oB3QoPbqPpIC48Nz0POVbhS0M4oR12foSQiiKPhb3YIIFsKpD/IOq78pwNtfFQ0Wrkco3INoLnljDTIRRTVJBsuGmeCxoAoIffZL0CIzSjpITF5gfo4/RVi5IXjv//CXUdr5uGvQjWKO/DR2tXzkMf9B0uP0SpTXCusNpywZzyH7gsBtdXECgT0sgwjK0Kn8sL5yEsXgsoG+e6D6HOsQEFsimzG83PqesssLDV1aHNmy1ihLuKWVPWLG9HE+0TB3BCCGjHhUSWQU7QWOENEjN+X4T4Zoe8Ys6O1FVcuob9u26QLBitMGWeGVE5ucH8ZZJtjDwpWy6BzDjoCNdP1beBJ8BnTvKQScE2DmRh+eM8gp+lT7rn4blElnbO33SzgGuhIgAcyr3UR/Jf6PHpkxAd86UOpTbKrPAzv1QcIuLOCe5G4TegGyrvhImW9i48sdG4+LQ7G9JSSCf5VmrvTC2Omxkv6/3zCxTHbtkZNO0o0P+7FwGSf5JeFAdAB/j/XqT/h5FrloDNrzEJ6Jj/JkCEM8rUa0qLFMmn6eXQkSRw88NTnDX6z30AVwOzzO9UNqRkOXefZ5+bxNANt3CGl+OPeexp4CNsSRxXUzBVcFNpLXOJHcdsxZ1V1aFfN1q6rnBgRAz2UbOFanBHuzdr1ZuJ0tlWYwV2xqMeDJ061/uZlM+kGrw/ZfWOR6SAsYx9fhZMLg+Ida7a6YdSpmRVD5SutVuKUv0V2YYMdGWRmbJMU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(86362001)(103116003)(41300700001)(2616005)(70586007)(70206006)(47076005)(186003)(4326008)(8676002)(426003)(6916009)(82310400005)(36756003)(26005)(36860700001)(5660300002)(83380400001)(336012)(82740400003)(8936002)(54906003)(478600001)(40480700001)(316002)(1076003)(2906002)(81166007)(6666004)(40460700003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:18.2498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 954f94af-97fa-4e29-e7d2-08daf8b29971
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226

In the subsequent patch, we introduce "CONFIG_ARM_PA_32" to support
32 bit physical addresses. Thus, the code specific to
"Large Page Address Extension" (ie LPAE) should be enclosed within
"ifndef CONFIG_ARM_PA_32".

Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
unsigned int extbase2:4;    /* Extended base address, PA[39:36] */

Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
are supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

 xen/arch/arm/guest_walk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 43d3215304..0feb7b76ec 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -154,8 +154,10 @@ static bool guest_walk_sd(const struct vcpu *v,
             mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
             *ipa = gva & mask;
             *ipa |= (paddr_t)(pte.supersec.base) << L1DESC_SUPERSECTION_SHIFT;
+#ifndef CONFIG_ARM_PA_32
             *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
+#endif /* CONFIG_ARM_PA_32 */
         }
 
         /* Set permissions so that the caller can check the flags by herself. */
-- 
2.17.1


