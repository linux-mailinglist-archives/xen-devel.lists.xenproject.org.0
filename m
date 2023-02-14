Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8940696840
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495217.765528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOV-00026m-IK; Tue, 14 Feb 2023 15:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495217.765528; Tue, 14 Feb 2023 15:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOV-00021f-9C; Tue, 14 Feb 2023 15:38:59 +0000
Received: by outflank-mailman (input) for mailman id 495217;
 Tue, 14 Feb 2023 15:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxOT-0001Wn-73
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:38:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b07c23f2-ac7d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 16:38:55 +0100 (CET)
Received: from BN0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:408:ee::6)
 by CH2PR12MB4938.namprd12.prod.outlook.com (2603:10b6:610:34::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 15:38:51 +0000
Received: from BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::fe) by BN0PR04CA0001.outlook.office365.com
 (2603:10b6:408:ee::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Tue, 14 Feb 2023 15:38:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT083.mail.protection.outlook.com (10.13.177.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.26 via Frontend Transport; Tue, 14 Feb 2023 15:38:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:38:50 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:38:49 -0600
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
X-Inumbo-ID: b07c23f2-ac7d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZcH4xujC2G2v82cxAudHWpjXsFoRHAqdcXZ/oIv/aF/KHzqFk4Dc73AIibMKPPQ6FVM1XRiLM2y5hY05zNCIAV8lUWtuD/w9+0b2CD22nGFhVNH3UiI3JQSFEJKINFIHQrFQR96tEJKm2EWosfxl6kF0Ets/tnnCdOjX4pvIEjsfxRv9n0ydVLHb7qbA2P9Px8c1uxAbCpFt4Nrw6oR+B3LOnA/+aBmWFqB9JTJ0ZRylBpzKrn37CQ1jCy/hDXB3NbU5tn03q4PbcF8IOeu2Zi5EmcbX3DCYKGmur7ok79mM+oMpvv/5zFAOKh8FS0Ss8xSkKsOYcZOAjjpJuLtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrWoeY005CFD5W1azhm+V3ALraRSyeUKG95MNZECaF8=;
 b=RiCQypaykDEH8zyEUyUnCglaMHqZ/Au4gy6thrngoWiVzNld56Y9+NFDfc/IpIM6m0fAy8OsUv4Pc6WXJPIHCaco2/Z7QpNTde5r19KWGVp0m5nY9JrYlCakvbHDK2pfVB+s9MPKV30Vbee+uLDQCw+uCEbjvSE/ngdorz8cglu2Ez5mGrMrYjXNnXmQxZtf05zd0g+cPQfzJIK5j/6CHsCyHvlLCe2mVBp3b3Pb5kutn2UouwGo/7ISBIAmZYB577veNqXr71CeQ7VYJlstt+J/MdzQNUJvxKNWbxUkDcDJYz5NczZn9dzPpmLUhP8x7JEY2NjaVE3In9TnGa1r6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrWoeY005CFD5W1azhm+V3ALraRSyeUKG95MNZECaF8=;
 b=ZtRAuO9swxrvYVM3aXHxqCAMhaaXvjROM6vt6tN6Q/4YAIhx6mXuzMGB1wggcOsE1BnZYpduLAlCyXK6PJLUiTCh6uervCpoWOg3ZhVAYYQL7LcfEYZYh3vpv4+n6vnkE3MojAJh/EktrRgLK//2AJWgyvtf/7hmx5vJFvHuYKU=
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
Subject: [PATCH v2 4/5] automation: Add a gzip compressed kernel image test on arm32
Date: Tue, 14 Feb 2023 16:38:41 +0100
Message-ID: <20230214153842.15637-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214153842.15637-1-michal.orzel@amd.com>
References: <20230214153842.15637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT083:EE_|CH2PR12MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: ca799b3c-8d72-4548-8cc3-08db0ea1927d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	stVE1UCSS1wdeJf9uMFsK6dHh4qQNpqq4EWDgy1025opqGjI6rbH4aYnZ/UY57jI/nGzzXCNsUIp7TCteN2OXfyfEMHiDHY8YF/uQIFBAjva7q4fNHh7lbSpLEv/N1n3gc6aEazrhxw1tSoFsI0058zskyFlDovgoxRhICN18/4ss3fWz840QGAghWa4l0BKP+tvs4X2u04RrSbykLKUxS9aDQZBT/9nB+aYaEIHkrmVHuFw038jTHno0dZ8Yw+t//XUiJs9jfsGLjII37TAmbgN7z1otX269ESB2ui7QN2NIi0XoW2fHMHxdNJZFNI6l+2bdN0JNX3FVFo+NaNFxU1XpQcF7Br2oqUC3jD0goZRng644DmzaRvJAV3K/XLSXBQADDS+7bqAbMO0gP/tN+MTLN5fS1L275DSvMnpESU19F/VPgZxdNNN1///vLAntg87KpMUVjOImYCnBRYAQ/DERJaacUNaPchfkbdutsAfrt9r/qny8zVyEh6QDk3yXvbt+2P6twCDLKSCPyzAmeZetlo5c088vIbQK/Y7rjX0si7bfB4JMZW6n232VNNpo370+wGPVKlREpZ6ktikCnm1u05wKQNa2GkhCi7fpgByUZ3IMY017rHrP1pjOO7AeKLXnq6QdpMWD9FH02h15EydUeNt1pwHRq1ul6EY58lgIorEh+4mobvyb1ywqqJ4WHJLGqbJ4qazxg3Wsv127uOLeoBPUGAM4I+vjkBC1xE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199018)(36840700001)(46966006)(40470700004)(82740400003)(40460700003)(2906002)(478600001)(83380400001)(356005)(26005)(1076003)(186003)(6666004)(36756003)(966005)(5660300002)(41300700001)(44832011)(36860700001)(70586007)(70206006)(8936002)(6916009)(8676002)(4326008)(82310400005)(81166007)(86362001)(426003)(54906003)(40480700001)(336012)(47076005)(2616005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:38:51.2969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca799b3c-8d72-4548-8cc3-08db0ea1927d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938

Xen supports booting gzip compressed kernels, therefore add a new test
job qemu-smoke-dom0less-arm32-gcc-gzip in debug and non-debug variant
that will execute qemu-smoke-dom0less-arm32.sh script to test booting
a domU with a gzip compressed kernel image (in our case zImage).

By passing "gzip" as a test variant, the test will call gzip command
to compress kernel image and use it in ImageBuilder configuration for
domU1. No need for a specific check to be executed from domU. Being able
to see a test message from a boot log is sufficient to mark a test as
passed.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - take into account dom0 presence
 - drop Rb as a result of code changes
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
index bd89a3f8b45e..c2e331451d99 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -33,6 +33,15 @@ fi
 "
 fi
 
+if [[ "${test_variant}" == "gzip" ]]; then
+    # Compress kernel image with gzip (keep unmodified one for dom0)
+    gzip -k vmlinuz
+    passed="${test_variant} test passed"
+    domU_check="
+echo \"${passed}\"
+"
+fi
+
 # dom0/domU rootfs
 # We are using the same rootfs for dom0 and domU. The only difference is
 # that for the former, we set explictly rdinit to /bin/sh, whereas for the
@@ -89,6 +98,10 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> config
 fi
 
+if [[ "${test_variant}" == "gzip" ]]; then
+    sed -i 's/DOMU_KERNEL\[0\]=.*/DOMU_KERNEL\[0\]="vmlinuz.gz"/' config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
-- 
2.25.1


