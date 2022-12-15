Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F23C64DDC8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463509.721728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q7T-0003g7-3C; Thu, 15 Dec 2022 15:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463509.721728; Thu, 15 Dec 2022 15:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q7S-0003cG-Vt; Thu, 15 Dec 2022 15:25:58 +0000
Received: by outflank-mailman (input) for mailman id 463509;
 Thu, 15 Dec 2022 15:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GeMf=4N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5q7R-0003Mw-DD
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 15:25:57 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c395c51d-7c8c-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 16:25:55 +0100 (CET)
Received: from BN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:e6::14)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 15:25:49 +0000
Received: from BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::8a) by BN0PR03CA0009.outlook.office365.com
 (2603:10b6:408:e6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 15:25:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT078.mail.protection.outlook.com (10.13.176.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 15:25:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 09:25:48 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 09:25:47 -0600
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
X-Inumbo-ID: c395c51d-7c8c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4hpHOf0odZZHtdVqIx4ceag1VdXtqNvPY614Xl2QA18eoKNEFVplUUebrn9qUeTBNLCB1lgVhSdFni20qA1a6ooSNNpm8/HhJeehmixTBk5XcMJTxQuNXXCcAAx51S4Y1NtnYDoUREqKZoHJxf2M4ePbkU/PNAWNhfY7evEcFsiNW/BjCuQx+VWq6EQ+QfpaggUpzlnxKKRmBEFcI3wEpxbbbua3sRWkweey8PgQ+ZzWlhChppt4n6ZL9kqtOMEWdXb9tbGXSNLmDX22G9WbldoOt+62sbaj/FoUCHyTntJyA1/J6AJ9XGeEyx8eDia/1O+twEtoIOT6DIwnHQQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrip4Xf2zOjDvZUvwmqV8R9kg4A1h10uaKD0p9bXjmo=;
 b=PtQ7TWKZdN1O3cGjFqol7x5rZCyj40NVEwlZdMLFVtEu3UrgFQU2kXow0wbkY7HvQvEiQ6B5jX50bCyw+Vemanx3QoT1K666WvTtw+gu5D7UkA9hW4wZ1G2i9rISmkumVgNOZFrXUmpo4iGU3yZ9X6+mnhDJRBIpbEYNUYhw7vRQbKideKL7xIHZbhAVgtUVJ4W13lBNNUwDgZJgbc5zRATvhkxPUQXvprgcVhG6b+wSqtegP85MbkicV/s+swSWOiXXanJ1r9Meuxf/G6TWbaXWJ4f6EUEKQTWsCB5ioVOrg26+K5d/apzcIjC5mV4GikmUbI66BnZYPfQiGz5Ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrip4Xf2zOjDvZUvwmqV8R9kg4A1h10uaKD0p9bXjmo=;
 b=RCv57ZZj6NaTsUDOe5zGaX9eqYhCU1aseFqFkyyijq3Xp06b5rPD34N/IqBFfYjWO8Wqg9WuXX9sqH04TR9MPtRr0mHYwagaNjiuyDoN7c+ALR4im79dV/zWvHKTnZfJLQGqBBwS0aSJn3lCeBhcPilUNulg5g9cp3juT8i7DGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] automation: Add test jobs to run XTF hypercall xen_version test
Date: Thu, 15 Dec 2022 16:25:38 +0100
Message-ID: <20221215152538.10266-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215152538.10266-1-michal.orzel@amd.com>
References: <20221215152538.10266-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT078:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: d3df1531-7669-40e3-e341-08dadeb0a524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XMyth+p3qekZxag8tRM6uiTR9m6U+9z1fzyIeJl4pQwzfJnjW9yfb+i+vajGUt50YM57+uEVwelv+YJVu3QsYR5FCzvquSVLd0DMfCojhr3LPAZ3wrIG2NABYi3WHxC8LyzjHzDRpYGZZ64GDgOs5YQXs/NLgoPI9BgbANwmJSbJT+x0IJLNdlebwGzGN+bDq4h+Y0kpozE7jvinr52EStojVQ0LYHtSu+WglNc38kivxlam8wZmxIL7Hke64x7UYRxpNr00GLfNGolXx9bxEPfylf4Yn0r3enUzCAYolfhL6/rPqgB4gp2/16aSi91QnxwC7c/VrlDxjZuZhv0O4dsgLjG+1H1atx9gRNmMT61MaFmBHA1SoCYyo+Bv3GW1tVpqFguqvYd7ltJCf/F40jXueD83o8j1FwxQyoWd7jtXGZrOOQAskgCun8j5Mo1pQ8g3DeG3UwGFDGEtQW4DDXOWm1eqYTU3M5rbH+xiisHXtVy5ot1I2HrIZ0ZfwHorIx0DJejaJZ5UF+hasrC2X6K1ApUPTFajT09XmCr0zRigVEDJbIaIr11mJCWfWqOQBJNRG4/+MnMy64BTNRRa2U9nFnSUdezTF9RCQ5wFPUhPUCEL2kbHf3ZphUB0T+T1MbwQY4lYF7gMS1eHLeeClSZim/Gt/LE8MwMrnod1uweSuIEqhgeJZXVwtj4HyL5nGE0+OjoQkly/ESM8hmL6QeHp1qFvUjVZ0EWBacHmDH4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(82310400005)(40460700003)(70206006)(8676002)(86362001)(26005)(186003)(336012)(40480700001)(478600001)(41300700001)(2616005)(4326008)(1076003)(70586007)(2906002)(5660300002)(426003)(47076005)(8936002)(83380400001)(44832011)(6916009)(6666004)(54906003)(316002)(81166007)(82740400003)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:25:49.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3df1531-7669-40e3-e341-08dadeb0a524
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449

Add test jobs in both debug and non-debug versions to run hyp-xen-version
XTF test as a dom0less domU on arm64. The purpose of this test is to
validate the functional behavior of xen_version hypercall.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2d57f4feb74a..9d4b5315e710 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -165,6 +165,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
     - *arm64-test-needs
     - alpine-3.12-gcc-debug-arm64-boot-cpupools
 
+qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
+    extends: .qemu-arm64
+    script:
+      - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
+    needs:
+      - *arm64-test-needs
+      - alpine-3.12-gcc-arm64
+
+qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-debug-arm64
+
 qemu-smoke-dom0-arm32-gcc:
   extends: .qemu-arm32
   script:
-- 
2.25.1


