Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499FB6F054B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526972.819076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0O0-0000pd-Bc; Thu, 27 Apr 2023 12:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526972.819076; Thu, 27 Apr 2023 12:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0O0-0000mj-7b; Thu, 27 Apr 2023 12:06:08 +0000
Received: by outflank-mailman (input) for mailman id 526972;
 Thu, 27 Apr 2023 12:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3s=AS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ps0Ny-0000lo-Rx
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:06:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e051c735-e4f3-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 14:06:02 +0200 (CEST)
Received: from BL0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:207:3d::23)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:05:58 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:207:3d:cafe::27) by BL0PR02CA0046.outlook.office365.com
 (2603:10b6:207:3d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 12:05:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.15 via Frontend Transport; Thu, 27 Apr 2023 12:05:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 07:05:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 07:05:57 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 27 Apr 2023 07:05:56 -0500
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
X-Inumbo-ID: e051c735-e4f3-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTpC3oWXlPXFsYSFr7V9QcFH2uDaTRRKlA/m2cHl08B3p3m1Aoa3BenqjEf4BuKrtnN5n3J8zCjyQSOcyYgTUUHFzhjBSgC85SFITKHdpnnUrH7iEPE+22DxvBV7zOT/VTXhvIul3h1o8Jy8kokc5lSdXT/F5mSaidl0L2xVQ8Ovr3/BcbrhbG9MinRcYj1eNMmzBew/pCJqphQMXYUoX5+TTaumWxgPsQmthQhqfhtgQueQQijHF9RAu9jl85v1FJ6doL1W1zECM5TpaoiWrrWTDLCpyTVj4xC0Yo/XIQy7pfPIuhMMGMuqeQrMMEjXaFhFJGgxA2+xsiGq9vMtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv9ymspoEyaD/gOFLfw2UKsgnsHva99GtVEfBw58y0Q=;
 b=UxcIYBM1hKQuE5u9iD4T4zDtaDGjVCiAr0UM0+B3OPwpth0bVA6e0OroQIReTYoPMzw4OGeBdMEzOg7OqIRu7ArOPMTXolEoR1HP3v475/yQ24bjQBBbgvjJvNkDb3K3ld6I2yu/gaK35cctpB6D0bPzDYDmLB3UtMvDUXhE5guRtOvBRE/n0LtBzfFbCcihtEj3tTQ7WbO9XYwv+sOJ7vtrcs5w2NXct0CsL+2b0c0psitGiGdZvWiE/PwNts5FUo6UESkXOqEPrmE0Ysqq+KQO/tnWCk6ph8BH7gfz4o4OFuP+0BaMVCg2PyiJ/A/hRGYHnxldK2XpbuIq+xqdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv9ymspoEyaD/gOFLfw2UKsgnsHva99GtVEfBw58y0Q=;
 b=GQLZwNzMIVEdnsida90/eR4RKRq6p2JUG0b3tw71CInLaQmzpZopbDRZHcTGI2SzebaCxCt6USb93nW0ayFXffTyNbk527Y5ynCo0FTTjAe2sca3xAPmKAGPeLJp+dix5/AysM/78QH2ixnpC61xUhclcI/rXeSixAIySnpB1+E=
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
Subject: [PATCH 2/2] automation: xilinx: Add GEM passthrough test
Date: Thu, 27 Apr 2023 14:05:53 +0200
Message-ID: <20230427120553.18088-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427120553.18088-1-michal.orzel@amd.com>
References: <20230427120553.18088-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: e733f66f-b032-42b8-b380-08db4717c30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bD/pqKiX3rA8tBQ3cG89Ot5KrA9AjjvdFhcnDoXMYSbVbPS+bGH+NWipAKGgT0DKtPbhYbi+hSrKNtsOCiIZcgA+M0AoYuU1UqbkYKwFmfdSy+6Aao/4ywSlWD4V3FmcR6tpYOq7u7kj4N/dCqiT0ogT951nC/HhX+e4O+qthNiBYCRDNlM5vOjAv7wzK5WcpKUBqLnPe8o/gYhYnPPVmouAdNKbY1bInbZonhKkqavSGzbiUgr6F7VVXUFyiqaTmyilXh33lM2SoFS9Pw/4PLNSp6TG+r7c32AhvDWQBesCBbMDMMLkB7HGfYtbEOozoEdmPlQ0TpS5jmOOvUb1CWbiO+XUXzptGjnWSmeAtY9A+EOS4SnsHWWqawzxyOK88OTD8DQt5PqnLAQ4SuSitVuuEdJ2O/VOtvD4Mng9+HokgsytRD2mIRzKSkdynAyHfEejXJ9g30lJlzxlsK+UQOJNRJKvwAk4/HRbfld/qeYnhkwNVoQ+lJrWv5sS8XiAnKAztHqin2RE3Ai8yA+8e39sCLAho9xAqbWhqf3LNNYQJ83XivlzdGQ9pCKkhbHubqGl6ZkNlbCS6NveLkN++Di1M4yTLrpg172LSLpCAIXpY/T3e/V3FcjMqAnBczUXL00ObC+ybfJldwAws6/j6KOijte6iPH+7lijugW/+OsbPgNyCc8Fmq3kNhPoJkKs8rFxLUOgQ7Y8KW6KzNZuw0BoRqXd5L3NVtCT9K2fP/1eJGLC+zxGszXUjC97bicL8TkyhV1k0ENcyY5D8TlDwQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(40480700001)(426003)(47076005)(336012)(83380400001)(2616005)(186003)(40460700003)(26005)(1076003)(86362001)(82740400003)(316002)(4326008)(2906002)(44832011)(70206006)(70586007)(41300700001)(6916009)(81166007)(356005)(478600001)(54906003)(6666004)(8676002)(8936002)(36756003)(966005)(5660300002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:05:58.4797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e733f66f-b032-42b8-b380-08db4717c30c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494

Being able to access a real board with real resources gives a great
opportunity to finally test passthroughing devices to guests. Therefore,
create a new Xilinx job to test GEM (Gigabit Ethernet MAC) controller
passthrough to a dom0less domU.

By passing "gem-passthrough" as a test variant, the test will instruct
the ImageBuilder to use "eth0.dtb" (passthrough dtb stored under tftp
server root) as a guest dtb and to add "xen,passthrough" dtb property to
"/amba/ethernet@ff0e0000" node. The guest itself will try to bringup
the network interface, obtain dynamically IP address and ping the default
gateway.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Example job:
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4189922473
---
 automation/gitlab-ci/test.yaml                |  8 ++++++
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 25 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d68c584269dd..3409d704a7eb 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -131,6 +131,14 @@ xilinx-smoke-dom0less-arm64-gcc:
     - *arm64-test-needs
     - alpine-3.12-gcc-arm64
 
+xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
+  extends: .xilinx-arm64
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-arm64
+
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 73ba251f4cc1..075305241c8d 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -22,6 +22,22 @@ echo \"${passed}\"
 "
 fi
 
+if [[ "${test_variant}" == "gem-passthrough" ]]; then
+    passed="${test_variant} test passed"
+
+    # For a passthroughed GEM:
+    # - bring up the network interface
+    # - dynamically assign IP
+    # - ping the default gateway
+    domU_check="
+set -ex
+ifconfig eth0 up
+udhcpc -i eth0 -n
+ping -c 10 \$(ip route | awk '/^default/ {print \$3}')
+echo \"${passed}\"
+"
+fi
+
 # DomU
 mkdir -p rootfs
 cd rootfs
@@ -96,6 +112,15 @@ cp -f binaries/domU-rootfs.cpio.gz $TFTP/
 # export dtb to artifacts
 cp $TFTP/mpsoc_smmu.dtb .
 
+if [[ "${test_variant}" == "gem-passthrough" ]]; then
+    echo "
+    DOMU_PASSTHROUGH_DTB[0]=\"eth0.dtb\"
+    DOMU_PASSTHROUGH_PATHS[0]=\"/amba/ethernet@ff0e0000\"" >> $TFTP/config
+
+    # export passthrough dtb to artifacts
+    cp $TFTP/eth0.dtb .
+fi
+
 rm -rf imagebuilder
 git clone https://gitlab.com/ViryaOS/imagebuilder
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
-- 
2.25.1


