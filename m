Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D385A696845
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495218.765551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOX-0002rz-Vq; Tue, 14 Feb 2023 15:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495218.765551; Tue, 14 Feb 2023 15:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOX-0002ph-RD; Tue, 14 Feb 2023 15:39:01 +0000
Received: by outflank-mailman (input) for mailman id 495218;
 Tue, 14 Feb 2023 15:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxOV-0001Wo-On
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:38:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b14520fa-ac7d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 16:38:57 +0100 (CET)
Received: from MW3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:303:2b::10)
 by CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 15:38:53 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::2b) by MW3PR05CA0005.outlook.office365.com
 (2603:10b6:303:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10 via Frontend
 Transport; Tue, 14 Feb 2023 15:38:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Tue, 14 Feb 2023 15:38:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:38:52 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:38:51 -0600
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
X-Inumbo-ID: b14520fa-ac7d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StwK5pcufpLBofMygVg2MDnCQhDo+4pdgbkKKzFRFnbOHaOBxSBekcB/eo+qsGtvyRKpUMJ/ckBJNE0eizJg4MqPVGJptsvh1wsT5zA9nnJF5lKCDJF3RyBrX0UlXT1fyPxRn6DDYls609jdhXICH9BdBWFh3L3BJK71waXQtTsfdR1jf+xv0kIsEim9l0kdKNeDjvfqyEjnCTrEqYQP+n2+leTTzFXRRqurBwV8t0JOFq/LEzcwGS1GiFMjtqwbghJhTfWEUKE9qCtu8UvMLEe7vbWxicgQ2bNCyuW0wRaamlTMHYAoEKhV1k3f/rBmmbgtfbplvytJoEJwXGBfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oqGuHYhJRqwJMQYh2Owy78U87YkEB1pjFAaF5dtpc0=;
 b=GaQu2ioDGHFUv1YFe7i8gyUxbni0eJHjcC8MiiJvV+qixELpcDXIrb2K8KC7Vgjv8OHNFKqa/R11EtYonpDY7hOfBau/Gf2hWyqkvQAxb3S45zQ4r2JqpNs6es+osXrb20JKGHhiV/DeqmC3qMjYWRmZ8N2Wyjj/RgiDNZzlGgMKeTo40yXGEvQNoeOmLy9EIafu0bJkujnM3vxFJVGWHi4l0ONyiHHtvaMI6ZiRyTNBvg9LRW+jv7DaMZa7fy9m0O8jUUfKJ9wC8vRWL2Ztknh+QK1TZTM/OOjBF1ZMtWx7Q+e8DKrAHGlZDyOFPeg3YJVpVB5SaxGimiW4KQC8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oqGuHYhJRqwJMQYh2Owy78U87YkEB1pjFAaF5dtpc0=;
 b=PQa+i5iNcP2kPUrWumGqA11OxH0dt1VKgneHUKePgRvUhDypjVK/w7/LhS6WwRmkUOAFk096eP9zRuIp4WK1Pu9n14vfKbOTVTTo+c5d4LljmLpT2cvtwkhRMBn83RQCQThPMdcPO1c0EpHqJX0BVxz5c5E5r6YC7gmnoAilXWQ=
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
Subject: [PATCH v2 5/5] automation: Add a true dom0less test on arm32
Date: Tue, 14 Feb 2023 16:38:42 +0100
Message-ID: <20230214153842.15637-6-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214153842.15637-1-michal.orzel@amd.com>
References: <20230214153842.15637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 676466e1-36a2-40a7-3a56-08db0ea19393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jcxqjx9YDuwFBjGp/Xvv/nWISnZFFpVp+1Imnl7QcW6a19tSm/OSz9rXyq0nbcyPu1AoZM023tHAm8Al7TEGWqtPbSooDxr72RuNU0J1YbWBC/8PrXrEZPXBgpduMxQEOldq653Vx9Ip/2ZRe1UHKYe8zFRAkaynLY6BjblPFjItvQ3vvcLH0mW8q+XwaiFiud/CTnZc9BaxkwpmypY9v+MpyjfcNaojfB1nxM0V8gIiiJSVc23Nxm+PgIydKPcKeuKxLReUM9A4rLL68KSIdZax+zofeHZyfwl8btMzuexqfhaCLjud3UgXXEkQWkZx4875KfPpX2uqa3yls5yLczH1APzV8EDq7aNWln+kox/c398aYVRUJjmLvLT6kD+zvsG1mg7/Gq26S6iMBUlSbWjKIOFJnxfuEeM4ZkVnY27Y7r9RSAS4ZktwDgtVRt+vE0M+k8Umjbd8UTWoL8VXwR/kItDifUa3zIceFaWmeENHwqaGMLkVZ/209APtzO0EXUXwntTQL8KK2OVbthKHBON7MgVfcEUR9L39F/gLA/xfuCzK2EmhW7jUbw3M8+AfPSwQ2jeRGejsNH0YrOBdNum88NF0vbNFke4x/ygpRJUw9ArNqstCXpKrVHNTZEMBM5/AS16Dxzm8/AK9TJR/i/21eMGcm/+56RItwdLKNPJf8x8DV4RkWKCycO026r5rSeR5G+MFR3EDeswtMWC/EhBAqilyZrZ39fSd/ReRxfyn94bhzLy5eV1EtpnLXZsZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(44832011)(6666004)(478600001)(2616005)(316002)(86362001)(82310400005)(54906003)(40460700003)(70206006)(2906002)(966005)(4326008)(8676002)(36860700001)(5660300002)(6916009)(41300700001)(36756003)(426003)(1076003)(26005)(186003)(336012)(47076005)(40480700001)(82740400003)(70586007)(8936002)(81166007)(356005)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:38:52.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 676466e1-36a2-40a7-3a56-08db0ea19393
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

Add a new test job qemu-smoke-dom0less-arm32-gcc-without-dom0 in debug
and non-debug variant that will execute qemu-smoke-dom0less-arm32.sh
script to test dom0less domU boot without dom0 (i.e. true dom0less
configuration).

By passing "without-dom0" as a test variant, the test will clear the
dom0 prompt that we grep for as a last step and remove all the DOM0
related options in ImageBuilder configuration.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - new patch created as a result of deciding to keep dom0 by default. We still
   need to test true dom0less configuration, hence added a new test.
---
 automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index be7a55d89708..c0b4a90e0d29 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -258,6 +258,22 @@ qemu-smoke-dom0less-arm32-gcc-debug-gzip:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
 
+qemu-smoke-dom0less-arm32-gcc-without-dom0:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32
+
+qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32-debug
+
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index c2e331451d99..cc91238f4222 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -42,6 +42,15 @@ echo \"${passed}\"
 "
 fi
 
+if [[ "${test_variant}" == "without-dom0" ]]; then
+    # Clear dom0 prompt
+    dom0_prompt=""
+    passed="${test_variant} test passed"
+    domU_check="
+echo \"${passed}\"
+"
+fi
+
 # dom0/domU rootfs
 # We are using the same rootfs for dom0 and domU. The only difference is
 # that for the former, we set explictly rdinit to /bin/sh, whereas for the
@@ -102,6 +111,10 @@ if [[ "${test_variant}" == "gzip" ]]; then
     sed -i 's/DOMU_KERNEL\[0\]=.*/DOMU_KERNEL\[0\]="vmlinuz.gz"/' config
 fi
 
+if [[ "${test_variant}" == "without-dom0" ]]; then
+    sed -i '/^DOM0/d' config
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
-- 
2.25.1


