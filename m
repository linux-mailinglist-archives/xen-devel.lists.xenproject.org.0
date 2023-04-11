Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF666DE4A2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519768.806733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUH-0004mQ-6U; Tue, 11 Apr 2023 19:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519768.806733; Tue, 11 Apr 2023 19:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUH-0004jb-3L; Tue, 11 Apr 2023 19:17:05 +0000
Received: by outflank-mailman (input) for mailman id 519768;
 Tue, 11 Apr 2023 19:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUF-0004Ta-KC
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f89fd80-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:02 +0200 (CEST)
Received: from BN9PR03CA0077.namprd03.prod.outlook.com (2603:10b6:408:fc::22)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 19:16:59 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::5b) by BN9PR03CA0077.outlook.office365.com
 (2603:10b6:408:fc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:16:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:16:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:57 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:56 -0500
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
X-Inumbo-ID: 6f89fd80-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqfHvUQkKRI+G1Rz6oofnKIRzyCknyLcK0EUyws71WyuEo6e0kx4wVRS09qucjTXA9EqkU8e+z63bCu/YkL+kfC8GOSrj7rwUj/hevwvj9CRfVNBXfSRMd26MnOj3P8VppZyJsbOp7oN9ULsAUdBY38gE9097qaUlMR1paZy56dBemNS5UHDTkVZOl1r3tGL1yoFI1mzVv0ozo9bM9zVFJZ/DRtGpVz1Qx60rijmc4vA9vapQqD+RSk23+p1T2rJWJbUrSzG8xgrWNwYoabwKn3Zx7YQvsbVjj6T73nkM0AEDfvtaOEkS0oh/1/GuMZ4JZyfsyyma955nur+H1rWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=XVfer5z5EHUilHhV+QpewCTkSOCiPTyjg/flVMZDEAzRK7xS4U90MmLS2j6XCxJadMrTyfIFtqZgoV8tE5knDGCt9Oy0pJnHl/YgFH12ggxAV7MMV8Fr+WG99/NQCfuORKTWXweHXckRRu6Ghyd9EzVd+cdZhZgDEOTfJrOaND763U12ywlONjxb2o0xNbsw08P4nJPuYUvA34TqM5tdqXE4UKXbylbIoJu4mMYx3dg+VOB48TH9m8UNMBnMYOUnFMnaNJhPMSzo+GyHnp1zexnQxanpVOmx8/4ez4aN6AvQjfluvkCvSi4wU3+b/2iwK54aukTqwBjwLwEyLBAb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=rl/f+0LCUCpB609QADltQg+rTxdAOrQiu8YujzkFf1OQB3AAg5ivux1ExrlGxmgNX4gA13RYWWZLejjd2CoSI8Y6BCICQIu+vn/vyCh/BDlKvHSYiFlDmHWaQLT2ceA64UDpUA/XJ+8ZOo+WqDeTLlbQI3mUA4YsgiIRfgsyJ2A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 04/17] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Tue, 11 Apr 2023 12:16:05 -0700
Message-ID: <20230411191636.26926-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c843cc-4c85-4c96-a8c6-08db3ac15246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E5mZY9arVfIz4R/AVfjqkQGX6I4NgpAdkIvjkuVZqz5BKhyPZEDL6b5Xq8b3aZ8yk9JU+rCdeveWZbPStUFbHz4rOiSVlz3wiAZwUYR0jRVcmHdSCANP2OdgfJgacMgBX58liZjifMHUHzC/32dEBes0dT/X0sVh0V0ClZ/pmvVNF2vnoktMpqFl7WQQ6/bzuXUT8t6RLcCdF1n/3N0pUtC3AMR9H2HHoI73W91MU1zSRQ9p3o//hEvudGpbf1Q/O9EyfgJP5cn6D5Wa+pOcUC+a0wuMf94oRCG6cfHd5p9GA/HhF+Rw7SezASSeL6IA6UysRg+9vzAPtm0ZN/6sMk48bGE1upLmFIspEKzE5Xx6I6Oa3iUBQemvUG0GRGf4bdhWntvbrDNu30WquTcxt+EoHMzvNBdW59Z2Q54ECfZK69MyfO0N3SILS823JJrSKR2I444zyf/CPE3tEfFHX91CO9QOXC+5ALFlZGMr2X28jaiAhNzEM19Os8Ea7kh5ySxKv0vuydLq5lJtnjoAQwr5BCuUnxCWZO7KKKfDzxM4jLQXG2exYJ7Yc61JwrHEHD0D39MpQ1pWsM0R7MGeR2RyYy8cukIRVhn2m5REcOmNb6w6YBFsOkQbj9rXjK4kFARvTQo2T2N1Y9AaR02BFnvB9oY1v1UmFgnOGiR1+Qql+LFy4XNhSrlWdx9PgLB67O/ky0Ps9USxEUlIXO9dY9kMQK7XS1nWTKovgA0R31I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(36756003)(54906003)(86362001)(41300700001)(83380400001)(316002)(70586007)(4326008)(478600001)(70206006)(6916009)(8676002)(82310400005)(5660300002)(40480700001)(8936002)(2906002)(4744005)(44832011)(36860700001)(356005)(186003)(82740400003)(81166007)(6666004)(26005)(1076003)(426003)(336012)(2616005)(47076005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:16:58.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c843cc-4c85-4c96-a8c6-08db3ac15246
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282

This is done to access fdt library function which are required for adding device
tree overlay nodes for dynamic programming of nodes.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/libfdt/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 75aaefa2e3..d50487aa6e 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,7 +1,11 @@
 include $(src)/Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
+
+# For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
+ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+endif
 
 obj-y += libfdt.o
 nocov-y += libfdt.o
-- 
2.17.1


