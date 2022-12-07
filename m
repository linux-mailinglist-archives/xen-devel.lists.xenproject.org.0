Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37356453DF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455826.713427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2njE-0007O5-90; Wed, 07 Dec 2022 06:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455826.713427; Wed, 07 Dec 2022 06:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2njE-0007Lg-6A; Wed, 07 Dec 2022 06:16:24 +0000
Received: by outflank-mailman (input) for mailman id 455826;
 Wed, 07 Dec 2022 06:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2njC-0007Hl-Qb
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:16:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa6642ed-75f6-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:16:21 +0100 (CET)
Received: from BN9PR03CA0375.namprd03.prod.outlook.com (2603:10b6:408:f7::20)
 by SJ0PR12MB5407.namprd12.prod.outlook.com (2603:10b6:a03:3ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:16:18 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::a6) by BN9PR03CA0375.outlook.office365.com
 (2603:10b6:408:f7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:16:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 06:16:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:16:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:16:03 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:16:02 -0600
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
X-Inumbo-ID: aa6642ed-75f6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUqnlUKBpcbzFMIwKi5B2qTHIzC89kxejfaLTzD/Wo+c9WtuFob8hbGy5aPVnQj5kLcJ4XhIk9hxoLtfPWUa9DirDHnkvvsQcn03W9C61XPJOYsdInNEl0ivvKNWTeCyBNHDdWD4dty7MoKC7DmObPsiv9jaaGR5nW9PWRwxR4AKlIOwLONgCrizBMAryENGrsP0RgTSlQEq1dfE7ZTNhcYn5OcC8aFct/nbhp/kMlXb/v0yd6rG2ApBPWWe0nwYMdqmcSRKXNUtcQYMYB6PVIQpnFG7ZGpZxGOv31kqFFP9YPCWON70/hi+3vbuej0wA500zxIq+Wuz4YEw2nGyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdobsI7I1s2xg3QPC/xfjvXO6m4sMLz8hqEk31lxd+A=;
 b=IQqfNuzqbZLvYfoXeHu2BoSww1PPfyvpQx6p3dkSLDXBuBAXH9lObrRxImvcZHYzFNDUQlgM3V4BcFkkBP/yHg3nlyty19AvtFyMSBCR2XRW/p4UdIv1drZRjsxfyxWbWAKk4L9ZMIg6mxvEMQHM8EMQdpuxMYXTWHDMMA77+xfVrs5/JLGj5h4kw8ZZjmqjeEW19Sr8HlpDh016I9Umefb5JFKbWGo6Ux76a312oEUAffmP7l/zj1IdOHAyv5kzqQniQek13jT8TKODORJ9bgpOqLjeJSVjahIXkpWCQTD04Xc2DTsi2407g1VIs2LxXa11dAz9XYgTeRJ9f7RIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdobsI7I1s2xg3QPC/xfjvXO6m4sMLz8hqEk31lxd+A=;
 b=FORrxHQwYwLQqTiGzkJYtwluLXZM83TMwCoyzMufpf6FZGRAyLMajDaLI/fzhNszlYb5eW35jBPT2U45taOhGuEKjNLy0skbwziUUZWNb9ZisqnFC7t5afDnjjjKfC1pZplDWMWRMqoJ9bbaDg0BGMfEZopFpJAwtdK7L/bs5l4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>
Subject: [XEN][RFC PATCH v4 03/16] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Tue, 6 Dec 2022 22:15:24 -0800
Message-ID: <20221207061537.7266-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061537.7266-1-vikram.garhwal@amd.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT009:EE_|SJ0PR12MB5407:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae02cc4-7871-4517-2525-08dad81a8d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sqyht156BaGaeryzYwSQVhGTlUi5YiDKcSO3OF1rAqQOI+9ZXQe4dkw9wF1hGxz6RzQYjeasGTPtnrsljPoZ5WufjhyFBOsP9jX9Nl1gCA53ncRMcNVmYuJZtP7JiokQCMQz87tCK/ZNfId/bm6xn1+r4SzVEME+eoMAdlAegqdsVamUDOZlROtFT8Q2oeur3CwyADXC5m/1fA1PNeeueaYgqFga6i01SehJIuOrDEQuYngd0mu4kDYDUYFpKtaEMU8gOXMQxmO58WcyMYn1DD+3Dfq6Ht2OfGX/oebp+i0laDC//mNkB0SeiGqTx49uA+4cBMUSHqP3YbFhSbqEFvz0dWMpbOpwhw9E6W3J6M0BgBQeNThccZEM53I7ZRpSmhO/6AO3RZi9R6Bc+kaD84o5gQSeZ1FP70H+PLHayqMwJtqKJAieEfBlcjD+1Yt8k/2s0pFC/sesaMa2LEMGRFmcJVTQHzSj24JfZI4F01TeGLR2xz/34xAJq0X30Hg82uVgGVxYgTJ49pzTC0E7fdFsc6Thc4kCfkxPy5bL5cQd87cpymzOjAJibDGrfVUVJqVNjGKz00lLWae1+vfW7Gv53xUkPhqpgyMA9tyBgHzPnUr7o8gWYVuSPApoUI69dcx0mqa7ntgij4DzHiKHk1834WnTvMc4Lz9AWx0r/Yb30ZJaBbFJUkAK8BpyBHdOZw5V5jiq3Cu/tsUJtGALcR9kld/XTNal10vNN99ns9E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(86362001)(36756003)(40460700003)(70206006)(82310400005)(40480700001)(186003)(41300700001)(1076003)(70586007)(336012)(44832011)(8676002)(8936002)(47076005)(4744005)(4326008)(426003)(2616005)(5660300002)(6916009)(54906003)(316002)(6666004)(478600001)(26005)(356005)(81166007)(82740400003)(83380400001)(2906002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:16:17.5042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae02cc4-7871-4517-2525-08dad81a8d2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5407

This is done to access fdt library function which are required for adding device
tree overlay nodes for dynamic programming of nodes.

Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
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


