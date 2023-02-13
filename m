Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794646947DE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494554.764678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZis-0002e3-G1; Mon, 13 Feb 2023 14:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494554.764678; Mon, 13 Feb 2023 14:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZis-0002aC-CG; Mon, 13 Feb 2023 14:22:26 +0000
Received: by outflank-mailman (input) for mailman id 494554;
 Mon, 13 Feb 2023 14:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfrU=6J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRZiq-0001q4-Nc
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:22:24 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d40c1d29-aba9-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:22:23 +0100 (CET)
Received: from DM6PR04CA0007.namprd04.prod.outlook.com (2603:10b6:5:334::12)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 14:22:19 +0000
Received: from DS1PEPF0000B07A.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::3e) by DM6PR04CA0007.outlook.office365.com
 (2603:10b6:5:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 14:22:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B07A.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Mon, 13 Feb 2023 14:22:18 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:22:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:22:18 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 08:22:17 -0600
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
X-Inumbo-ID: d40c1d29-aba9-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTTksxpAQHNbli+WIZ8vx4dbGg/st3TmObF8aO+q5t4D0JbxXjndPsm+Z4rcToKJcmOuDesegZ9NfP8FAl5t+8x/q1+mNpK2eA//DyulapZNw9huzqGYDawiOVyLYNfNJtqJDQm3DWcVkF3V+AVyNN6xOdJab8ahQlpc+qtPyCwXK7cqJI3l3HkUQ4XZJYLiYf2Y2rSqCrE/RYOozABX8ewUPaeV0IKlR2hn3lbOPH9xdoOYgvGFe8oYR7J+So13GwA4/9FbAOvP+8SYsFMpEs5rzEOhrsUIUsvosG3ofUxq9IJiqJa/Ga0RIvhLDIjSzizArC+ZxC+nNpNBHuNp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KX0x3F3iElls3V3KW1MLbB7hkF0jKt3vYL8OtbmKh2M=;
 b=XzLqUsBSY3kysSnsJVf+24qVv3abZL3LNTZFaJgLfNSTj5sMtPH6ctSWg3H18w3JaFg9F1IifR+4UMHOREzveEAvHp3KlAtEXEIXfuQAlLZ7GOyamjTnHA5NhlkTCdwWecgd/ar+MtyKfhyz4MG/VtBuaLOiEU/AmRHxVIrglBAeTCfqdm5iM26DSIUij64GaBfvwdv/RE4wYKc5iRGB3EUzBwwIzsxNPT3TjuBIQjl3B9uOWo6vgDt/Mu7lB/wxdHB2sQNThYIzEEEf1vVmuUG1uIEYXBIpJl1yf3pHUMBpRexpRwNrNMtL8X3awLXmMej2u0FQRBVcZyqutgv5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KX0x3F3iElls3V3KW1MLbB7hkF0jKt3vYL8OtbmKh2M=;
 b=FuMRhU3rwXIOwxL2P3zUWBU4aGuOLvxCG2Nq+bWf3nwQr4gEm1heX6xO0kSpCep+oBdFfZ4bWipqRTLro/PEr9VIZwB3fa1p7MllwEbSZORZlU1ZIRsVlLeLML6LqJgJExyCuz0Iqleh/ZqhwyBqgwZjS+IzJjb8gOydijCbx/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] automation: Add a gzip compressed kernel image test on arm32
Date: Mon, 13 Feb 2023 15:22:10 +0100
Message-ID: <20230213142210.11728-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213142210.11728-1-michal.orzel@amd.com>
References: <20230213142210.11728-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B07A:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: a27b2705-ba8a-4242-ee71-08db0dcdb6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vBn0GIQpOQqyKdt4efzcrOi7iaDlE6Am+JriouU58QgCAWDo1FS2eh6XPubejkjCekGrqpzu+NDFoVxz6w0/0aXzN5eOkHqA5ibvlIcSiGpNP1ZvNZDwJAg/QRDecMvSXdiHQV2HaZWOHtBSrDXml0pf359zlrxae0X2KgMhU64YY5cFr65iDhWTtC/ZAoHMyEK9dxE3DGYyegjap3tnDBLwNkX6W6HMdd148J9Nk+c8qjKDH21lWrcB65dSpkz6dm+leMWBK3oJkOaUPr986y36pwF6KOTigig3cCzsYiiLBdxPZ9uSPCJIjnvLx3O3Jln3dsWgVMly5oi509yweusGR49dZxkLxSxjzRtjavDaGvuNjxgWL93gFAHqMdCmXuc7j8gUG20AWECSKkX8J+0KLM8Si8l1oTrt5dSFEijSxNYIiX4oI9i/k9ETXoliCoyxJOAkw2xvWsBVZDEs9sLq9+Q/rCDLfdnRYV0OpAMHqM9eZoesRnxIB0DtircGHxu8FJs9xOKMrmVRn4w293DLJB3pyUfl7Avggzfp4noMrdmcJrrF7j+16Q+MD0HvM3rUOKsGAPY1SGVgny8If+6D08PJjsvtzEzIYWBuFk+rUloCaS3ULcbz8JXVfAWLyJhb7u2j4IqsTm/T8mla+Tx86lZmoYkI4wUGYt5uTc2MwJ8P4qLKp009oxdQhFSP/Wl/j3RDB/SfBvYWRtDzC2b8AwQ0AlMdM8Q92QPZx89S5AImGD4+5mvve8h7AThTmlllliZgjADXCxF7kNooGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(8936002)(2906002)(82740400003)(356005)(40480700001)(44832011)(6916009)(4326008)(8676002)(70206006)(5660300002)(70586007)(36756003)(41300700001)(82310400005)(81166007)(86362001)(478600001)(54906003)(26005)(47076005)(336012)(426003)(186003)(2616005)(966005)(1076003)(6666004)(40460700003)(36860700001)(83380400001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:22:18.8197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a27b2705-ba8a-4242-ee71-08db0dcdb6c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B07A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

Xen supports booting gzip compressed kernels, therefore add a new test
job qemu-smoke-dom0less-arm32-gcc-gzip in debug and non-debug variant
that will execute qemu-smoke-dom0less-arm32.sh script to test booting
a domU with a gzip compressed kernel image (in our case zImage).

By passing "gzip" as a test variant, the test will call gzip command
to compress kernel image and use it in ImageBuilder configuration.
No need for a specific check to be executed from domU. Being able to
see a test message from a boot log is sufficient to mark a test as
passed.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index c2bcc5d4d3e5..be7a55d89708 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -242,6 +242,22 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug-staticmem
 
+qemu-smoke-dom0less-arm32-gcc-gzip:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32
+
+qemu-smoke-dom0less-arm32-gcc-debug-gzip:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32-debug
+
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index f89ee8b6464a..b420ee444f2a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -30,6 +30,15 @@ fi
 "
 fi
 
+if [[ "${test_variant}" == "gzip" ]]; then
+    # Compress kernel image with gzip
+    gzip vmlinuz
+    passed="${test_variant} test passed"
+    domU_check="
+echo \"${passed}\"
+"
+fi
+
 # domU rootfs
 mkdir rootfs
 cd rootfs
@@ -79,6 +88,10 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> config
 fi
 
+if [[ "${test_variant}" == "gzip" ]]; then
+    sed -i "s/vmlinuz/vmlinuz.gz/g" config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
-- 
2.25.1


