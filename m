Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0D9A2A9F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820980.1234752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9Y-0007qJ-KA; Thu, 17 Oct 2024 17:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820980.1234752; Thu, 17 Oct 2024 17:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9Y-0007jU-DY; Thu, 17 Oct 2024 17:19:12 +0000
Received: by outflank-mailman (input) for mailman id 820980;
 Thu, 17 Oct 2024 17:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7jd=RN=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t1U9W-0007JO-7Y
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:19:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e890d483-8cab-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:19:05 +0200 (CEST)
Received: from MW4PR03CA0038.namprd03.prod.outlook.com (2603:10b6:303:8e::13)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Thu, 17 Oct
 2024 17:19:00 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::46) by MW4PR03CA0038.outlook.office365.com
 (2603:10b6:303:8e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 17:18:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 17:18:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:18:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:18:58 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 12:18:58 -0500
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
X-Inumbo-ID: e890d483-8cab-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdmJL0/wYW1Y56oRBoNi7c3jubLHR8UHUw0P3j99GAxvlEGKGEGlPYDWsnP9+K7HmD+s9vGdtA4Nj3w8E9jIUtSqY1ji4fYKMrQ7EzoYsk0XRm6OatwjCgzfd9JjsZrh+yn9OI/IfmGKkJAf4+tNfG8nGp+VZOXEIsiL1tu17aw5/536k20XVwWisXEBAdRCL5T5sIr1lQa+2JQVmqVNEqOWziyXnI4xCBEQlPhkuCAVYRzbNkLTWt/JYBMkOQr0Z2xdh78ei+MmXb15SKI0VBBi2pLCZ7hQi9BhEJErV86YaKXyjLDVhoDirQd4m07hMqyiRyfKlLVXk7AIV0zqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxvXkgc+im7eck3YggvnFHTjF0jIAu8u4EX91lFkEiA=;
 b=W7/3S+PQbihLOP5h332+G/t93c6psSGkvnS4HWe8+FbQhLDWV+ePohIn2XVsivMhkdwmHEfDNA3wN7JXU2H91T3UnOIdx/1y2Kr9Fjv22S+14+OKbUZ6YqGOhZH1ZPvBVa2F2UQBQ2kvN3Pk9oPTU21W797B4Qd5SRHPhLcT9roPF+8aXW82wVvkfTKZdbbmUVw3Dkf28o9u+hF4dISPKufpNg0X2xRioVhep/zZKzuQbUzlslwKMJSV68o1HikPdB9zhIS2AvwXwom0ROeKgGPCJXpYCvfbOrNGjqUs3shsuGuuaMe4calN7DZEgvWACoHQ6fx9/GtooQfSXoZ49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxvXkgc+im7eck3YggvnFHTjF0jIAu8u4EX91lFkEiA=;
 b=wTBtOWu5cR0FgFnGlzIIyeRVY5jMpRlkwmMbY+suaQzoJ2JkyEjwu+2N3NlQ/cK5/9ypwOpPP8dJDKC5jdqy0cQJbOGU/lKaPLfo5A89zUAbrEmQWwdhr8/yW/SS4/Yx3JByB2Zk7QESXRCP9HougaBtzezGrtyQtDW1gucvtbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 1/3] automation: add linux 6.6.56 artifact
Date: Thu, 17 Oct 2024 10:18:26 -0700
Message-ID: <15562cef1631443695d5ddab64c0737a327eb849.1729183051.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1729183051.git.victorm.lira@amd.com>
References: <cover.1729183051.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|MN2PR12MB4192:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df8027b-6815-4369-72ba-08dceecfca40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m3Kndkitza9RkcqlsSuLk0m0boDRqal2GrfSFnKsIP642c3RKc9uKUFkAWdl?=
 =?us-ascii?Q?HZN6gt9MU6T9nylS9zdFWbOJbCdC2wBX0nbc351MSaRA5arV8H0pJgS9WYvW?=
 =?us-ascii?Q?BZ9btut5iMRsMzcalFyYq04uP81YTIr3ClK3s4TR+/GjYZPhLBViNkSAhovQ?=
 =?us-ascii?Q?qKKMPsqcf2nUinMt8NsxaKYy/uuWYHjN0yrmxUb802wUaxTEkt4VCQLwkuH4?=
 =?us-ascii?Q?D3UhYoYwEe9tYIZiTTW5pKbBH3PG/I9fZxyUlyH+2kTJTwRgy4WgRn/9NdYO?=
 =?us-ascii?Q?hdtLIHrNphS8AyhMWfcxQJpFuifnx8lW5yUMAgcLW5et/P8Cc8tX4cRm4yHD?=
 =?us-ascii?Q?ynGBFEQ4mVummB1lTjGq9hO7gmMuin85cSjDHsgQP9PQ3+MNAH1qHGCPudGf?=
 =?us-ascii?Q?iqjWWhbiMSlZCx5vZ9YO+7sHQVIzbcDW1B/zJostuq3NggcUihUyKdA7bANi?=
 =?us-ascii?Q?i0XHrdWs34sSN+QpAz5mFkBRcHcS2wcevl5GHX3n7zV8EPnxLusqg7lwEkJw?=
 =?us-ascii?Q?1LJk6g0t+Kgb8VBaQ3UMG/LL00XcJWtp3ZCe1T5qDm3pdw2Mse5mML6WF+QW?=
 =?us-ascii?Q?Aft4TnzV80C79ju4axMdPE4zY+Ev+o7NPRmH5xcP8jxoNawe3E9t6cC5K7vb?=
 =?us-ascii?Q?1t5oLcWeDMDvcSKHibgVKFnpgOsrw9QpnC2z/lmpYczmzc5JDD8S5Q021XzH?=
 =?us-ascii?Q?G67lbSYYAThvPazYYbOSrZhcy4sUgy3rYftXmyJQry1GbFYcmfDswf6shwzM?=
 =?us-ascii?Q?+u/UD+TvdvdVvJUHjOI5VqwoQwToI5sa9ke3hMCM6GB7cXRlQs08gWvkLdys?=
 =?us-ascii?Q?JU+cwvyKaggmxkaFX39JSVI4M3dewxWY1OrJ4M22BFYwzsGxGrrpT+XYG4sN?=
 =?us-ascii?Q?rZl1sDgGlHtpPU7n0g2zDc8eiLTcgcL6wAdfajpRMAyo4juy8ttQNfF5yRCo?=
 =?us-ascii?Q?eQSnd0Ex5X8Nguxe6upLGkZMCgwg6bprF+5LJVMxHIbx3cLEQvBbzbN1KYh8?=
 =?us-ascii?Q?FI8GnpXbMxHDX/G7cO84Z/7r9VrqzCV5TPUYJMSHQtVCCfYtZ2n0KZIk5F6j?=
 =?us-ascii?Q?AkEA2efUaNysYuXys3K+HOciEUuVEBqsyycEHwjr7y9tJoztK5u4hb+sSiEE?=
 =?us-ascii?Q?sytqggU3UtOpxhszeAulNFzPOl2xQe3+qSE8Wply1sKMszNUKchDVRlS5lI4?=
 =?us-ascii?Q?w4EEXsauwGWHpn7zc9Zrsp8ITnKDyIku8H9LoFDx8HXTccoLIBBb503RDhHW?=
 =?us-ascii?Q?KBlvGUSkMe2kGw0JyHBp7cqhBZzh+1qWlX5JMwJpeT4hwDZlDUz08q3JdLri?=
 =?us-ascii?Q?RSTbhMMHBsjJgD8U97f++9wuMQXbFZXf3WqBmGJ7NpjRapIpOsMdF9TidnQr?=
 =?us-ascii?Q?HJDGClY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 17:18:59.7067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df8027b-6815-4369-72ba-08dceecfca40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192

From: Victor Lira <victorm.lira@amd.com>

Add dockerfile for building container image that holds linux 6.6.56
bzImage for x86_64, using the same build process as the current 6.1.19
image

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 .../tests-artifacts/kernel/6.6.56.dockerfile  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 automation/tests-artifacts/kernel/6.6.56.dockerfile

diff --git a/automation/tests-artifacts/kernel/6.6.56.dockerfile b/automation/tests-artifacts/kernel/6.6.56.dockerfile
new file mode 100644
index 0000000000..5b6f2fe527
--- /dev/null
+++ b/automation/tests-artifacts/kernel/6.6.56.dockerfile
@@ -0,0 +1,54 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV LINUX_VERSION=6.6.56
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        libssl-dev \
+        bc \
+        curl \
+        flex \
+        bison \
+        libelf-dev \
+        && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* && \
+    \
+    # Build the kernel
+    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
+    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
+    cd linux-"$LINUX_VERSION" && \
+    make defconfig && \
+    make xen.config && \
+    scripts/config --enable BRIDGE && \
+    scripts/config --enable IGC && \
+    scripts/config --enable TUN && \
+    cp .config .config.orig && \
+    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
+    make -j$(nproc) bzImage && \
+    cp arch/x86/boot/bzImage / && \
+    cd /build && \
+    rm -rf linux-"$LINUX_VERSION"* && \
+    \
+    # Clean up
+    apt-get --yes purge \
+        build-essential \
+        libssl-dev \
+        bc \
+        curl \
+        flex \
+        bison \
+        libelf-dev \
+        && \
+    apt-get autoremove -y
--
2.25.1


