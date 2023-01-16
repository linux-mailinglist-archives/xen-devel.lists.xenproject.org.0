Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9266C28E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478742.742122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQja-0003oX-12; Mon, 16 Jan 2023 14:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478742.742122; Mon, 16 Jan 2023 14:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQjZ-0003lH-Ne; Mon, 16 Jan 2023 14:45:13 +0000
Received: by outflank-mailman (input) for mailman id 478742;
 Mon, 16 Jan 2023 14:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHQfi-0006p7-8L
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:41:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a4ad39-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:41:13 +0100 (CET)
Received: from BN9PR03CA0965.namprd03.prod.outlook.com (2603:10b6:408:109::10)
 by CH2PR12MB4939.namprd12.prod.outlook.com (2603:10b6:610:61::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 14:41:10 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::89) by BN9PR03CA0965.outlook.office365.com
 (2603:10b6:408:109::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:41:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:41:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:41:10 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 16 Jan 2023 08:41:08 -0600
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
X-Inumbo-ID: d2a4ad39-95ab-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jj5dcNfCoHrwB3NpdKP16/RXaKZSbZsTwzSIaUO8pDTJAy5fULhNry6ZxlUdWHIZwOiUp5jtOBnChgWV5S2IELv6/dtJvOCdsoYF+aISer6jpE4d+iHWuKZl7gv3ZO2KUj737fasrTJ9zN0jRW3cgtNWQ1PPrYo+bvI8lh8wXC1w64acNVY83jvxzo5wv+Sdl4upnLnCp5cbIIYAApaofq0sqQIgSZutrRlPQlF1hcf/WN75aEnUBkaMGREfLffBEI6DNx9aelXyBhbPSKWwpd+ZLECoNfJoUpKlFFxDZAarP+FvVs/J8psmhU80F/8Yw0Vh01QC8WByBstuLPlE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reRyL0p8bwFUK45PxPrMWtUJPOIAApiXXP6NU2zUKZk=;
 b=NDa36JCpVNps3kC7a2lPu/TtikniYWpZIirJGV5g4dM87pfodZoh5KahMzwbhshBgJQFWmQHcwvskcnSRe2a8qeeMh+ppmdXpz0DBUtrRZTMwkuX4NlFOtoJv6CfiRprxYz2zJv5X9kZ1sHjqz21TVz+X8n/KgF60ie9kGNj2pQcWNUI1R5BYEdUQYhjk3fONNuwHTXASBY2UMq1yHR76mPoBkV7a3T0Mz4OIME4sDnKSCgsw65ajuEWbjtp1BEdH7ztYFYIziHoiDxMSo1wPEa5E0dOtE7gAsTBM0BU2sgqIFGqz3U+EsuFjsEZLg/B5mg/VoExI4M/9joXgTV8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reRyL0p8bwFUK45PxPrMWtUJPOIAApiXXP6NU2zUKZk=;
 b=r/FXYotoEZMM8Hk3dT+a2pbaYWTE1a6YatLkqNS+W/P4rp/sGSamWyEP+0e3AERXPOUCRVP0QEl0ai5nkq7+vEtzt/k9EAYwdDloAOyxFMBAQOYO9I6CmqObwrP0u/b4gsp/4CFSE2kJqtXjWpMkqgHwgtVkCEPZEgjplHANQWA=
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
Subject: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Date: Mon, 16 Jan 2023 15:41:06 +0100
Message-ID: <20230116144106.12544-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116144106.12544-1-michal.orzel@amd.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT004:EE_|CH2PR12MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdd33b8-dbf7-4705-d35f-08daf7cfb5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	36+adSBYd37sbbvclE5xkrK/Gyryf1gboQXj+kSka5LWjeVcmKfauZZ6syUhuMofH+bHS+wqqoOSvAUuS913g0yqgMfyiCnAbt5RNyNnrVEunrhHlVA5O1FaXW31H5MrtEt4N47boVgMDzFtq5iFtzBJPwBFr5agxAqGTF0BgMgL+hOP/4dGLwuzQ+G3Pmv05sDcHOm7cp4om5wKFIbBmTgrzuNm1oUH/W4ccz7el4z1ZNTe0Rmaidqz3IIWt9vUBnb2CYIrpiTQ4oqYDP21X8qlv29zfc/COKynS9DSXgJ96Pl9UtzVZb6bHuZtLVcuBjKwadj71NF8BjGA7hYmuNFUmqP+FgXOroaJM7NoKg62yEwrEBdrDMeqHtR4G5GKDn86OkLB5JMovkMS5xQoXyf/xKk3TSJrTgw3QevQ+8sWZA8u4pi7LNzYGTTeyX+TuZmolVplF2JSzYlAy77X1rJcX+5DjyJQ5dLptbZ4mMU5MKBwkqnlZeXTx8YXVuZsn4u/742fm0QBfMV5CHpq1qhsqqAvXGAFdnLvfUgROba0eoHQZOl9l9lWnmTx8GCH2r4ZGe7BYkAJYiViXT0dyBsabjo1h0f/SaMPJCxyH1cJ7pHmu49BS9VFgrJEH1H0PD6Ljax0NZsy1RQa/OcXJS9tPLp8rao8PxHWYBr1p86aifvconG0YCVIHEqFdgngqbC/tuvjIrqMlk7HudOmQqngIvpiWo3X6MfBzhndDAs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(40460700003)(82740400003)(5660300002)(426003)(26005)(8676002)(4326008)(6916009)(54906003)(186003)(356005)(478600001)(2906002)(70206006)(36756003)(44832011)(40480700001)(336012)(8936002)(81166007)(70586007)(82310400005)(47076005)(86362001)(1076003)(2616005)(316002)(41300700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:41:10.4801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd33b8-dbf7-4705-d35f-08daf7cfb5b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4939

The direct mapped area occupies L0 slots from 256 to 265 (i.e. 10 slots),
resulting in 5TB (512GB * 10) of virtual address space. However, due to
incorrect slot subtraction (we take 9 slots into account) we set
DIRECTMAP_SIZE to 4.5TB instead. Fix it.

Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8aa9..16213c8b677f 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -157,7 +157,7 @@
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
 #define DIRECTMAP_VIRT_START   SLOT0(256)
-#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
+#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
 #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
 
 #define XENHEAP_VIRT_START     directmap_virt_start
-- 
2.25.1


