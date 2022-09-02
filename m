Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404C5AA887
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 09:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397375.637944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0o1-0000eI-PO; Fri, 02 Sep 2022 07:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397375.637944; Fri, 02 Sep 2022 07:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0o1-0000Ze-KZ; Fri, 02 Sep 2022 07:09:33 +0000
Received: by outflank-mailman (input) for mailman id 397375;
 Fri, 02 Sep 2022 07:09:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTqM=ZF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oU0o0-0000VG-Ag
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 07:09:32 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e10b1b6-2a8e-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 09:09:29 +0200 (CEST)
Received: from BN1PR13CA0001.namprd13.prod.outlook.com (2603:10b6:408:e2::6)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 2 Sep
 2022 07:09:25 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::b1) by BN1PR13CA0001.outlook.office365.com
 (2603:10b6:408:e2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Fri, 2 Sep 2022 07:09:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 07:09:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 2 Sep
 2022 02:09:23 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 2 Sep 2022 02:09:22 -0500
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
X-Inumbo-ID: 2e10b1b6-2a8e-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOM+Z1HgaJqUmynenQswR1Fq1Otb5hXsHaul9pkPdEW7Bt2QUs7uoCGP+IK1pSQ1nG+2zGt4Ce2r6hwhENxCenVZ8sglietLxEPsKUra8XtznAQnSDFmBNHvgZtvf5QFvJlN9+QET/vk0LksD8scAhoyKMVuCjFDvMISyNRZG+2av4XTaF4tBRGNFA5hwpUOjpvw9Ivfj2r58q27GRarYPQghzaP+yMBhQMSkehXMn7zOdlT21QxGm1zg5eJyehwOER/tm+jjAOr2o1P7PAjwVsqkGYST0jF2JCWUgj2revIvA/WBMECZMxyQqt3etIvhyCu4kH5UGLyg0ZC/yjxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkQ0/4WqrVmydchd0BRt9qoBmBb8mcYYvjFU9/gX3yk=;
 b=P1Fk2XqZtvGE5CtmC2G98zEQN3lbaj0tzbT73CZNpFZ3EZQ6edXaiKC0W+yZURVdH13WUJXiceN6la4ZrQpGiQgGEr71bW3agg7tyPrG6XN6DiESb0NGjNOEX5O48FogZ2Rr2GTrFGiOfoxMvbrtbyB4zqb+UMZkItV4DnLS42I1uPrh5uRO5i9w3bpECddRK6Lbrg09kqGmNJhAMhUzUuskfw/EJMWBd2t1AlC3JU6j2Rnd2Zim2W0ytx6S0HIlbO7ZDzEGJVvowYqv/wGXTwVABXLafxLJL7gNQlRSAit9iBDqov2bmF8oJd995I7X4lUup+/h6WJYGVIgFrMiTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkQ0/4WqrVmydchd0BRt9qoBmBb8mcYYvjFU9/gX3yk=;
 b=crdWTldWU62yRnWArL8mw1EfhnjL9F6HIrD8cyYt8yqlmkWbRdxstZxTCDwg3h7QmRGH5l8qrlTExwbJeRS3NDHWWbA3CrNoO7u7xHP9vZ44l5KDpf00P3jJuciHGyWCwu877zIBhvs72hVnDQZLEz56zAEICOQHDaGf1S7R/yk=
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
Subject: [for-4.17 1/3] automation: qemu-alpine-arm64-gcc: Use kernel 5.19
Date: Fri, 2 Sep 2022 09:09:03 +0200
Message-ID: <20220902070905.1262-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902070905.1262-1-michal.orzel@amd.com>
References: <20220902070905.1262-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd57485-c30b-491f-cca9-08da8cb210fe
X-MS-TrafficTypeDiagnostic: CY5PR12MB6454:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iOLwsLn+zUboQcSgu3Rtt85VMqhQKYXQOU9lJ/fhONyE/nphvm/H79nqSUQ7X1XIjeTFZThHxNS21epR3SAeL0gLNKqd+ZxIvrBiPfF/rRyQx5hPMt5Ug1/TOtcMXe3/JTaXXsQAoFg8ge4qaqT0CnmLqqSf4D3ipvT0TO64BgO1udnABnyfy0d0Swi7ZQO6RFtg+6heAV6h0SdDxpy50QlAZAJpUju2IoY2V9IPCz2WOgQyY/p2kGU4RXrlYYKnoDIfeX2UUdYCkKZ7QV6Hyl6JENEeO0zZ/oJgmue2Hy2GlgCOedr5f63YNc4R7iEsUG7LkaIZ+GBlUubzeSfwH9aOMQJiF73cOIAxSgqNsC/uMGIdUid1pN3iaiUEV/rgyCcUlt89RJzNWtL5iAne7oDO341qyQdj0O6xqxptQtoFDANkDTy2NamPd44wwqr/6FOUe5Oex8BPJvZi+Pd5lknPI1xv8oYjJZrt9UFW+Z9UtON1kuyDEnpVwp56B1U+bnjJmZlSgS/5wP/cO2nHgNV5xuLh3JGpfC09G9XMkl9u9HwSw5KbW4Z3bALWJsCbGzlMsIIW4U+aE2HbXTp95EMh4pRrtutTL+taMqeS1yW7eW16hJPZBFjofyv8hbIZnrFHGGz8nNFe+rYGbYsZywLc3dh+zyDUm8jBzXP20Q7QlZZqiE1Ie8Vg3cjsqIloDv0PXAvMXLpp8SVvmaKmJD8aqmpxYHwoMBfmkEQIKS9Pq+3CR6ME9QNEKKbjthgGvGHvZQU6GrK4R2hQEEfk2A8bjlPMzBcJ9CJjFFsSMLNMxdrWD3A4fRDDg4vaOXTCsq7ABLSJ0FYimTDYonA6OA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(2906002)(4326008)(26005)(54906003)(8676002)(36860700001)(86362001)(5660300002)(36756003)(44832011)(70586007)(6916009)(70206006)(8936002)(316002)(40480700001)(82740400003)(84970400001)(478600001)(2616005)(356005)(6666004)(336012)(41300700001)(186003)(81166007)(426003)(47076005)(966005)(82310400005)(1076003)(83380400001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 07:09:24.2922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd57485-c30b-491f-cca9-08da8cb210fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454

After qemu-smoke-arm64 was changed to use kernel 5.19 we end up having
two kernel configurations. This is something not needed and maintaining
a single kernel version is always easier. Modify qemu-alpine-arm64-gcc
to use kernel 5.19 and remove kernel 5.9 from tests-artifacts.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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


