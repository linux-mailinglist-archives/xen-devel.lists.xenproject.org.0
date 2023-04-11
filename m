Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD36DE4A7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519812.806903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWI-0005x4-9P; Tue, 11 Apr 2023 19:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519812.806903; Tue, 11 Apr 2023 19:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWI-0005v1-4x; Tue, 11 Apr 2023 19:19:10 +0000
Received: by outflank-mailman (input) for mailman id 519812;
 Tue, 11 Apr 2023 19:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUX-0004Ta-0y
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:21 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 799897a0-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:19 +0200 (CEST)
Received: from MW4PR03CA0203.namprd03.prod.outlook.com (2603:10b6:303:b8::28)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:15 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::c5) by MW4PR03CA0203.outlook.office365.com
 (2603:10b6:303:b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:13 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:13 -0500
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
X-Inumbo-ID: 799897a0-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXpPdrD59NHcZced6N+ReY2rzQPGHtm40Xv7ICsxIt/xl5azaRgbg/FpXDbBbgSewjJItDYzLHIs+vPw639QRQa7qwZH5zrduXWD9kv8CFmN8FKuRSH2JI9fBoSNFQjipdW6hobv15IL6dNzc4fAi+/pkD2phxqPTUkk+cL1b07NMwx3LkrgEZzfVRB041phzXLdlD0aq0pTOYaLhL1/dxxJwFvsA6R0gI6oXRThSiq2OovUzCLI0T4rPXDjmWhztfRLeVKHHDIzTttnJ6E3nEZtplNw5FpKxiJwi1W0BA2eMXUoxhPTMuHwgqLEqS6vaF9YVZDLmzu2PCq8DcBiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=cksZoW0ks3716PsidDanbIitYQa+dR1UVj/3ZfkfzDYwBV4HM0p5HaJDaiJqjrwy0bWn7nx/Nj6IDIjqwMHEkw6PJVeyPnNpLs5kYAXMa4TxEVDe2C3mRj1IRSpGvprN3FJr26Kqy3IKvA51h3MLFZorE7J3CJ3DsOc+NOZ7GTklZciqfOUfZHF6RD40qsP7ijZncH4Z0dxPPiFf7rOaP7j/mis5HABhIf6WwiXpRFDWklw/SsdbeH2e1m0QVNH4y4mzzTG5a746gRPQKahAhxgNODv13BxfDsWfW+yG3EXtFKSwUN+DskgWMPoJLgDXrhriCkLT0fURLXudLW8psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=C8LnUlJK8/O5qvHp1MAOesiGzHauPP4chRPeau8EzNQHbWxjGd1E++r0vWFVvMOhDGikzO9d8m3aAWft9gjihUuvmmSU6xIL1/S78nTyco3qOZccbzYNHX2eoGMx9gyTdDz6XzcmGKhz+yyGfhMkjCaBQ735nslsas2Mn29N7io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 04/17] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Tue, 11 Apr 2023 12:16:23 -0700
Message-ID: <20230411191636.26926-23-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|BY5PR12MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: 778a1185-cf2d-464a-ab52-08db3ac15ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3+4G1HcuhJ+RiYvsVU7dkqReSPNLwMFDbQ/azTNjZysqNxtVxfff/YnYzEUt2wAkHB2yvZUfBol6uUCA4r0dblCaMB7aZcUX6OXNqj8fJ23o/K4lN4fYhO6BIh1VqCx9vJKsEmiQb+qYais8rHA0bggCJUVGcLbT5DroM5n7GRQhzx5yy3b09oKhcxmMgz80BjWkgo/1CfMPyJLEhwRC06Ayko9Rewr+r9Sfn317zCyy9tW0ia+3Sz2FyfDm57eL/7Tp8cZ2F+Pm11bL+AaKmrRIFgGTwyQlFeOMQOMVe6KEptapev+8/nihgkdFIRsC1EA3F82tXmJMt+jx6HsZXjSe1H7Jjo53Bw7nIu4yjp73lNm2x/lAARgP2o84IkduqpNNbvAOYDTc776rZToKOlZ3bMBuBrh8Wyzrmo34dnLD6J4jPG/HlKyhlnepVkCa51bOJ0GyWMKgjKjwj3xvQC8eH8BylFZMRL7MJLdVDb/b1rjNS2PP0zOZx1gpqPTo9EWrfEmR6QsoOSxoP3lIJFXmtjFhgd3Cz89gCybOFi3x93wPXGWFdV9olZjnviDD6iyTgvvgVeIh8uh4X/y3QD5dl6VwhV2W1+l69rIbCfmvPxveBsK0yHK0V64w6goLA8KgbGF+Fk4H1TgymT2xbnDR7GeIWhIJMk5YU8ihtkIJVRkWv/xmXEyN9yKt3BUr2IjGzAGzG9S7/v2awZJhCoA4NvTOQFaIqbDvKGVB6rA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(70586007)(41300700001)(70206006)(316002)(54906003)(478600001)(6916009)(6666004)(4326008)(40480700001)(83380400001)(82310400005)(4744005)(44832011)(8936002)(8676002)(2906002)(36860700001)(5660300002)(82740400003)(186003)(356005)(81166007)(1076003)(26005)(47076005)(336012)(2616005)(426003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:14.2308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778a1185-cf2d-464a-ab52-08db3ac15ba7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209

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


