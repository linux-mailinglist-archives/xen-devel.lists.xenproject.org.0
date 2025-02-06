Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1BA29E38
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882389.1292521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqNz-0007S9-G9; Thu, 06 Feb 2025 01:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882389.1292521; Thu, 06 Feb 2025 01:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqNz-0007Pi-Cy; Thu, 06 Feb 2025 01:08:55 +0000
Received: by outflank-mailman (input) for mailman id 882389;
 Thu, 06 Feb 2025 01:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqNy-00072L-LD
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:54 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20623.outbound.protection.outlook.com
 [2a01:111:f403:240a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee0a4984-e426-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 02:08:54 +0100 (CET)
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 01:08:47 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::53) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Thu,
 6 Feb 2025 01:08:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:45 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:45 -0600
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
X-Inumbo-ID: ee0a4984-e426-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgmwsdZAEFx7RqWaqO/L6UNGg5M9LoXrqQt6EppQCRm+KZGlSv21O5jzmBm4SiVV2vPKEVcMWJqSaOVzTecUyXkvm5IRi/C2RjA1pGaSjjpY8w2zzOH87B7k74P5GI/Cs5xfRzJA7rHTVSavJKzUxeNQ+SQFk2K9DcWjjcyld35edWNqOIzj7r8Uv1ZCbcoWg4NYAYnAR/omjzUU7iZV4IEgQT9SG5X+El3PFV5bXVwtEMm72KuZ9mAwrRoWL4ZkXqoswdwMmPCgi76OaC4zsvdsoyvSLBqIL0p9u2Ob6sODKJ00lyVAG/+LsPLJl3tzEOIe/mlAIPOLrLaNTVcNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmQ3tmibIRy8bO2mL+AIH6FBPZkp7ADtgPkgpedO2f8=;
 b=hJRGHZ4+4om0V6vNhGoNf29ZXBF12xyj9d25uKCo+daejAqX0KOe92RyvbVze+yjY/Cl7ys71tMbzHtpfZY+32nLe4uIAzy9Jx/M0u7+KFvJeIL18iG/5dW17OrsWidasZy0zwWrYabLbSGrIPuCH74KRj/kTxduWPUimUO78KraM2889aQeL3Zh3nQdwJUT1bjVA7CfP2Z7OdQ0FbHhrsDpE58s91tvnDB+KamB32LN+6FB3Szkdoa/90yjgT6ZcMxpaMBVKPJiaUI+qUeBO3elcjuNmcOyzw5SvR+VzYlO67W34n6pMnMs0AR4fwCatqAXwEZNfzDpo6qIWrkkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmQ3tmibIRy8bO2mL+AIH6FBPZkp7ADtgPkgpedO2f8=;
 b=a7rDC4jyZEVBFomA1zUvhETTiZMh6oGvx17xal9cAi6LH3fnMNM4GQgZ0ON9ZNtG3m8Nj4rdgjpTidNKKQwfGk4/UPta5cAYqfdA+8qTdWEVxTjWzayBABcjyZN3gLHZdJaXTeVHk/WwOjemKQu1mqgW5ffqCX2s0ZjxZqSflHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v5 1/9] automation: upgrade Linux kernel for arm64 tests to 6.6.74
Date: Wed, 5 Feb 2025 17:08:35 -0800
Message-ID: <20250206010843.618280-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: b89f8bdb-a55d-4dfa-cd7d-08dd464aceda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cVtC0pKFFa3kbo2oLmxWsKNV40eUhCPAYvTf6iBDu0tL3PkUvrLvzBVdgL1k?=
 =?us-ascii?Q?VFy7xFXlxaEkrROxHQpJeo5Gu+8gKQVT9xfsiHs/9KF2Umo+ts99QiKPqSHg?=
 =?us-ascii?Q?u0g59EsevTAXHR+oZMtUqBimYU3XUFWRVw/I4ROLtJ1I9RUebZ0ofJuLXqC2?=
 =?us-ascii?Q?9USAzvS6wpYZcyH2Vl3zt+jfZiBFqmvd94ToXzNFY/ayo7MPah9sEmS8tI17?=
 =?us-ascii?Q?QxRYFOkLCXfWeotp9aXmqG8u9JwRM/qYN7COod7OrO1A48+3Wavqc4sjKzx8?=
 =?us-ascii?Q?Bi4tj098DHmsrpAsQ9cKkjVFKdCNbqgqn4Mkd+4rNrj25OYMYMJp5rskWVM5?=
 =?us-ascii?Q?YIbx2GXE2IzfVtj2+R2S72f3Pev80rJSZT1t1e8PtGNekvQm9wmZQbhxEVx0?=
 =?us-ascii?Q?kv0xuYXh/fZLFXWtIB1tbOCWldohuJirhlsu7Wgo0QfkEtcfKJa5OsauCHqh?=
 =?us-ascii?Q?NMhv3jfhpV+nvavX1Au0P8DkOeNBIaanUHEaPkbPj8i13cH5nj43zVR/c6CX?=
 =?us-ascii?Q?RhyuUbBwNooUx2beJCxidFULwEfz9I4+F5JwfG9Vtis/jQmHhH9y4PEO4zwn?=
 =?us-ascii?Q?ISKQRjM5cygGIZirCjn5/YfblPJfUdkrTaj8wXjh4WdAq7W27Sy+xCqIVZx4?=
 =?us-ascii?Q?NmiGphMeF4BPgPxNEtMmVJSZEDG7OWTwPJJQawsKJnr7sGWdc3wLKuaUQRor?=
 =?us-ascii?Q?GQUjfVdzzIUg2K1k3iWt0ZqQgjkyVBfqcIzJbAMCskdly1DkAXric/dLOTxF?=
 =?us-ascii?Q?qEX4EFTEfizSWU5aVisAxObPf8t7131LKKzvkkf+6o8WASXTD9G0kgKNK2TI?=
 =?us-ascii?Q?ZlFIqpdD7EsLScrSCQUKpb0rREB89d2c2sBjIOtC96gVFS0zx2eUvItCAjeZ?=
 =?us-ascii?Q?j2xLoW5nxEzkMcZvhUDAw4Yc0LwUAOejd/ftGWyl9CF3OXipAnj7N6i2diUh?=
 =?us-ascii?Q?+EYOMw7kVF6Q7piuvcrYayQXtOC5SrLurQPghnfNT7u1cL5lHHJafWTRYpfu?=
 =?us-ascii?Q?KzP9f1OrAqvhD3kS3DWVNlphP2pGFBHLra/ddSAoVIM9TJkMq3sp8Ehr/2E0?=
 =?us-ascii?Q?iyaN3qCNr3o8npUo8D+rgiOakEtfr1UdE71U2rdcSSfRTMeDRO7NOenH+4X+?=
 =?us-ascii?Q?DTBz1kc2VYbQ8LtGxdBbItLl3d/zyuAe82JHPNkyATXztwEX6BBoc4axoOqX?=
 =?us-ascii?Q?7nGMIc3QEunMwvWhe0cjXgVpd4xLD1jsfEV2FcESTrW6JAxj4R46JE7saJDr?=
 =?us-ascii?Q?zqA+ULHMPKCsHgau7TJggxCxmkhfc+2xiMy24LN3Xvbs1GIKCAJuj3DmkGnD?=
 =?us-ascii?Q?cPdnM4mZbLcUH27QLIyNUCpBREK9tzVzJvTMaHNs4/9ilLidozsjp2qdeoVa?=
 =?us-ascii?Q?csQskol4XoIfk0UT/f+45dqz1UB/wDMScnHqvMoU9x4LvlcI6ou1/TsLVK68?=
 =?us-ascii?Q?YMEl8qItxfc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:46.6573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b89f8bdb-a55d-4dfa-cd7d-08dd464aceda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml                              | 4 ++--
 automation/gitlab-ci/test.yaml                               | 2 +-
 .../{5.19-arm64v8.dockerfile => 6.6.74-arm64v8.dockerfile}   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)
 rename automation/tests-artifacts/kernel/{5.19-arm64v8.dockerfile => 6.6.74-arm64v8.dockerfile} (90%)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index bc4a8a5ad2..411b4902b5 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -269,9 +269,9 @@ alpine-3.18-arm64-rootfs-export:
   tags:
     - arm64
 
-kernel-5.19-arm64-export:
+kernel-6.6.74-arm64-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.6.74-arm64v8
   script:
     - mkdir binaries && cp /Image binaries/Image
   artifacts:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1822e3ea5f..6ad45269ea 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -4,7 +4,7 @@
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
-  - kernel-5.19-arm64-export
+  - kernel-6.6.74-arm64-export
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
similarity index 90%
rename from automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
rename to automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
index 8e33995ba3..73e5145425 100644
--- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
+++ b/automation/tests-artifacts/kernel/6.6.74-arm64v8.dockerfile
@@ -4,7 +4,7 @@ LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
 ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=5.19
+ENV LINUX_VERSION=6.6.74
 ENV USER root
 
 RUN mkdir /build
@@ -18,10 +18,11 @@ RUN apt-get update && \
         curl \
         flex \
         bison \
+        libssl-dev \
         && \
     \
     # Build the kernel
-    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
+    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
     tar xvJf linux-"$LINUX_VERSION".tar.xz && \
     cd linux-"$LINUX_VERSION" && \
     make defconfig && \
-- 
2.25.1


