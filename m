Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3D5B187A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402994.644948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkB-0006C7-8q; Thu, 08 Sep 2022 09:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402994.644948; Thu, 08 Sep 2022 09:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDkB-00065X-5M; Thu, 08 Sep 2022 09:22:43 +0000
Received: by outflank-mailman (input) for mailman id 402994;
 Thu, 08 Sep 2022 09:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWDk9-00062t-PT
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:22:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8bb93aa-2f57-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 11:22:40 +0200 (CEST)
Received: from MW4PR02CA0004.namprd02.prod.outlook.com (2603:10b6:303:16d::19)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 09:22:37 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::84) by MW4PR02CA0004.outlook.office365.com
 (2603:10b6:303:16d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15 via Frontend
 Transport; Thu, 8 Sep 2022 09:22:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 09:22:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 04:22:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 8 Sep 2022 04:22:34 -0500
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
X-Inumbo-ID: c8bb93aa-2f57-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAmnqea1r1TWORAioI2l0a5veDLrZo7PSHHsPU1eC0UE/Y//wMOSzDZRSvJVPYwkStXwiMcSkvmgPFDxcFoFK2mUJlJmT1Qql5ji7XfAEn+5ozx8k703imXdbB2+++ECFbQr/KJG+dz81guh5161TrLkUltEcKTrHoOoyi0L4BGH8br0DMILezil+vzLLNrcQEA1jzoQ0g6X8nM/nXXruL5fmmo//ZQ6oeFpDwI7LQxxt+iSArwJufHloqub4AYOip4FX7rF2GG7sXBiZY/JN+j3ri8ibhj3GTGnc3oTeOZQ0GhTHXaqOOd/r2h0JRzWBjitCap8iCyjKo4UpUMJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyfchKA7NgWWrIrLugjPaY2e//gdOL9mWhpHot2OCqg=;
 b=ICkS6HZq2fe3AOjC/blGL7qfRHcYQhBDAPiHPHeTkqB4iL7EIbo5/J64I2Zx1pJPZLJw4EcoMZguyJIfpVQKlncbR05bc0ZkwSHCsX6clTqHMWU0eKk9cPilys0japDGxJOdEe1kiflcv+61zfM05TWHss4vfPSw09icc0kZRUtelz+NMnKD0ymkGEZzpLF0vIh9nPjHkQthuJN4gsvIXypdyX0EgUV7blSQt7QYyKehP0cKAeNhV+lxaLkJ3176esR+2o14haf2RBnouHOUDwJKEdZY+Ny2QJhTxjOYN2OrDASsS6KXhQI3RwL7F6ArYq3SsMah5qGDauoGy7++NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyfchKA7NgWWrIrLugjPaY2e//gdOL9mWhpHot2OCqg=;
 b=dOAyNW3Ak/S6wqPwAiqXp38at/fXYNPoX5lQx5MhBty+3pdw46lsXpXl6IC77py4gnLeNkjyu/QX7NLZk1ywOTrQiy0quioFvkhXYEpW++d4/WvQDTfDaHJzFzbacxHXLGYAe5WrQho00fyLJjA30MCsn4qP/uzqyBF5FQNjRyE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [for-4.17 v2 1/3] automation: qemu-alpine-arm64-gcc: Use kernel 5.19
Date: Thu, 8 Sep 2022 11:22:28 +0200
Message-ID: <20220908092230.21421-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908092230.21421-1-michal.orzel@amd.com>
References: <20220908092230.21421-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT056:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: d54294cb-a9f9-4f26-5d7e-08da917bab92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SjIiWqALMBxzrnh8u0JllRhyAJnUvrutBn2hSL2dk5NeHmrm+M+oS01Jvwh2+6XXozmNGBzInNnDdWLY1emjZi8pfqKK8f59m56P/WrHbYp7m9KpOA6RzBX3Pfwe/3eLM7HgGHlYfRBe0ooVVZLiCyin7vjw39Zppk9ThxikMFeco0AFPn+eXtaN0vj8vj3JLuyqutX6eK/sRlJg9Ib8PITrglzwtIBWe6BJvUMJsg7yqXJaI5OIR8w6nQGcqvQEYJT0SScUGz+Ty7mY80FMsBbg0ZPRzUoF2fBAzJXfIOeKBnYVqa/Qq8n7cM7i7RBnSVYHMpBbeAPcZ6RK388yKaUzCsBjcjlBV3ZK6HtSu/HakOpuz/+vPa7kz3u42twmkgDcFrw4ygO80VArMmEKZAQ481+CPHuaQEzMd0QFvsmiMKY4RVLE97Y3j+soKTpn6wd8n8R14M1f4chcuRUytV7SIyil0uK3+YREyaeLF8SkaN4+56ewACmiM6nfjdSM4/yBB9ID6zgimAbOYgq5F7vy3Xy3tsKu/FRXLFUAsnJ1RA1VnJrttu0c3lYulCr8gKZoi4ce3Y9ljA4TbgYVsARG1en0bVM7KdvnqJPH7Ngc/cdFywRoJTze/SGUAqJcM8n9pbit/qphmvNhJT/pO6iLFvUtLfemWxxvn1kNhFaHYMohxawVZ7sRx81R9LJnKLiDOL7s2uPXODOzVpqjWJzdEJJXzY7+YxKX4ocLQTy0DBUhA2OFuZa0nI2/fRocu8hYPX86AoYtA0w/6/5GvP5AATmciGf1ikB3LO3whIQ8bW5qtgPT479l0Wmk7r2aP6YuhPRuv1xP/qO/v885Pw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(40470700004)(40480700001)(316002)(36756003)(41300700001)(82310400005)(81166007)(356005)(82740400003)(6916009)(54906003)(36860700001)(4326008)(966005)(44832011)(478600001)(70206006)(47076005)(5660300002)(70586007)(8676002)(84970400001)(83380400001)(336012)(8936002)(426003)(86362001)(186003)(2616005)(2906002)(6666004)(26005)(40460700003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:22:36.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d54294cb-a9f9-4f26-5d7e-08da917bab92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949

After qemu-smoke-arm64 was changed to use kernel 5.19 we end up having
two kernel configurations. This is something not needed and maintaining
a single kernel version is always easier. Modify qemu-alpine-arm64-gcc
to use kernel 5.19 and remove kernel 5.9 from tests-artifacts.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
---
Changes in v2:
- none
---
 automation/gitlab-ci/build.yaml               | 11 ------
 automation/gitlab-ci/test.yaml                |  2 +-
 .../kernel/5.9.9-arm64v8.dockerfile           | 34 -------------------
 3 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d2f75a090c0f..720ce6e07ba0 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -586,17 +586,6 @@ alpine-3.12-arm64-rootfs-export:
   tags:
     - arm64
 
-kernel-5.9.9-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.9.9-arm64v8
-  script:
-    - mkdir binaries && cp /Image binaries/Image
-  artifacts:
-    paths:
-      - binaries/Image
-  tags:
-    - arm64
-
 kernel-5.19-arm64-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2eb6c3866e2c..07209820b474 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -34,7 +34,7 @@ qemu-alpine-arm64-gcc:
   needs:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
-    - kernel-5.9.9-arm64-export
+    - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
     paths:
diff --git a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
deleted file mode 100644
index 053d65a3454e..000000000000
--- a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
+++ /dev/null
@@ -1,34 +0,0 @@
-FROM arm64v8/debian:unstable
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=5.9.9
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        libssl-dev \
-        bc \
-        curl \
-        flex \
-        bison \
-        && \
-    \
-    # Build the kernel
-    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
-    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
-    cd linux-"$LINUX_VERSION" && \
-    make defconfig && \
-    make -j$(nproc) Image.gz && \
-    cp arch/arm64/boot/Image / && \
-    cd /build && \
-    rm -rf linux-"$LINUX_VERSION"* && \
-    apt-get autoremove -y && \
-    apt-get clean && \
-    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.25.1


